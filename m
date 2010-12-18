Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PTzRa-0000lz-VA
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Dec 2010 17:15:39 +0100
Received: by iyj18 with SMTP id 18so1204495iyj.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Dec 2010 08:15:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=qhwmgFKJryMw5tKhBPcFmzvIVg28iVxIuXzqbd+jeCg=;
	b=bwQq+423DeeaGw6X33niKiiub1Vt8cjdrLRFmormMlg2OvDt3iPRXbAX0Yme3dAefN
	D6s3ilCvId/8WFBlgYleXvWFIibmho6BOLFSDRQ8EY4AHTSFYYF19hr9vypJ9Ce1aSwM
	7c9b+Tg9RvLC3j7EeNIgp7x2lQEYVrmBu4seI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=koiu08oVqXIk873Fhy5w3myAfza6haj/4Ma/bbvq0HOXCmU17ec3thjUQEBYcVwFY7
	nhR2sYb1Tf0lmQIRY6WaE6yhePi9cflUI1qbUZX4B6VMr/x5PmQVQBqzpuAL9/PMgwYP
	hmWQx3XWTpKvgEhC2+r/lb8fQkZ4JowFAXwU4=
MIME-Version: 1.0
Received: by 10.231.206.7 with SMTP id fs7mr2066416ibb.82.1292688930973; Sat,
	18 Dec 2010 08:15:30 -0800 (PST)
Received: by 10.231.200.140 with HTTP; Sat, 18 Dec 2010 08:15:30 -0800 (PST)
In-Reply-To: <AANLkTimkoAmu_Qy=t635mP3ufHTqhUbQbr4PTpMjFBLq@mail.gmail.com>
References: <AANLkTim1ZFrjZuvJgKGB-+2wTNUAx5cdiNsRXK8bvRf9@mail.gmail.com>
	<AANLkTimkoAmu_Qy=t635mP3ufHTqhUbQbr4PTpMjFBLq@mail.gmail.com>
Date: Sat, 18 Dec 2010 17:15:30 +0100
Message-ID: <AANLkTin7ujqZuJx=xi=msr20Cc8dkYQLHb77qAkB9c8D@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: bitbake git head issue
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 18 Dec 2010 16:15:39 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/12/18 Chris Larson <clarson@kergoth.com>:
> On Sat, Dec 18, 2010 at 4:16 AM, Frans Meulenbroeks
> <fransmeulenbroeks@gmail.com> wrote:
>> If I use bitbake git head I get:
>>
>> frans@linux-suse:~/oe/openembedded> bitbake james-image
>> Process ProcessServer-1:
>> Traceback (most recent call last):
>> =A0File "/usr/lib/python2.6/multiprocessing/process.py", line 231, in _b=
ootstrap
>> =A0 =A0self.run()
>> =A0File "/home/frans/oe/bitbake/lib/bb/server/process.py", line 95, in r=
un
>> =A0 =A0[NULL, NULL, NULL]):
>> =A0File "/usr/lib/python2.6/contextlib.py", line 16, in __enter__
>> =A0 =A0return self.gen.next()
>> =A0File "/home/frans/oe/bitbake/lib/bb/utils.py", line 805, in redirecte=
d_fds
>> =A0 =A0old_fds.append(os.dup(fd))
>> OSError: [Errno 9] Bad file descriptor
>>
>> I did not fully bisect it but rev
>> 144887553097a288a76b8de78f71548d5ef9a350 still works fine with me.
>> The problem seems to be introduced in one of the next 5 or so commits
>> after that one.
>
> There are 32 commits after that one, not 5 ;)

I know, that was not what I wanted to say.
I found the commit above to be ok, I did a rough manual bisect, at
that point I already popped about 25 commits, then dropped another 5
and ended up loosing the error.
416dfe211ff0c37d746efe113bb6064b7e57d43a seems to be the bad guy.
apparently this:  old_fds.append(os.dup(fd)) gives EBADF.

And on your other msg
git head (commit db14a900e140ba084bd2841c3708cbf1069e2354 ) still has
the same problem.
As reported before my /dev/null is sound and has mode 666

Frans


