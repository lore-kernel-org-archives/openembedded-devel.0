Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PTxEk-00066B-C1
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Dec 2010 14:54:14 +0100
Received: by iwn8 with SMTP id 8so1820923iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Dec 2010 05:54:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=1VaoxMkI+9pvEOYkfticrzV8nXQGMR6H6zj0eMpeO4w=;
	b=xN8YDYQctDZ6EsP7cen8ZJHzpqImpHXwCKQ308lFkhFbMOw8QpEHn7KtfjHZg+FfvU
	cZwQX/qN4LybKTF3afEGxwPKMRcseJSFTdgN++B++LxwVxDsBs7n2BFMjVpSvJ3/DD9U
	j4gP5CmUtWd1Fnsf2YQQGrIhfwKyQO7pQedYE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=SxpZ2ITgmKIPZa1QxzCW0GFeUvuNrBleEh0WTzJcC9kltkd1/euJyPGMPHuOEoX9T0
	kRYeRDncZkDQH4ueAFswVF6KIwQ57AF2hr4kD/+L9R0GdT+YsmHHTRtSZO5T9+Th6bx7
	OhbfY3AAdJpegm3iS6Qx5E29iWJRbRzqfcMl4=
MIME-Version: 1.0
Received: by 10.231.182.13 with SMTP id ca13mr1978942ibb.57.1292680452549;
	Sat, 18 Dec 2010 05:54:12 -0800 (PST)
Received: by 10.231.200.140 with HTTP; Sat, 18 Dec 2010 05:54:12 -0800 (PST)
In-Reply-To: <AANLkTikT2Y14XM+-iKGpesPDfX4KDMz5B=4z7PCKXSya@mail.gmail.com>
References: <AANLkTim1ZFrjZuvJgKGB-+2wTNUAx5cdiNsRXK8bvRf9@mail.gmail.com>
	<AANLkTikT2Y14XM+-iKGpesPDfX4KDMz5B=4z7PCKXSya@mail.gmail.com>
Date: Sat, 18 Dec 2010 14:54:12 +0100
Message-ID: <AANLkTi=ptFSTuWbvkEAg+5EsLgyeBzWsrPYvr5TLf=PR@mail.gmail.com>
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
X-List-Received-Date: Sat, 18 Dec 2010 13:54:14 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/12/18 Robert Foerster <robert@erafx.com>:
> On Sat, Dec 18, 2010 at 6:16 AM, Frans Meulenbroeks <
> fransmeulenbroeks@gmail.com> wrote:
>
>> Hi,
>>
>> If I use bitbake git head I get:
>>
>> frans@linux-suse:~/oe/openembedded> bitbake james-image
>> Process ProcessServer-1:
>> Traceback (most recent call last):
>> =A0File "/usr/lib/python2.6/multiprocessing/process.py", line 231, in
>> _bootstrap
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
>>
> What's the status of /dev/null on your system? =A0ls -l /dev/null ?
>
> Bob

crw-rw-rw- 1 root root 1, 3 Oct 24  2009 /dev/null

Seems quite OK to me

Frans


