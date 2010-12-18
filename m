Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1PTyrd-0008DF-LW
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Dec 2010 16:38:29 +0100
Received: by wyb40 with SMTP id 40so1624436wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Dec 2010 07:38:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:cc:content-type:content-transfer-encoding;
	bh=barY0R/Snc3SWKgLVoHGVRqVRGm/s4Sa+u+gOzD9VNk=;
	b=fw7nVfMEjGFl9YC+DHx7dLw+n5bT3sBVdf4mUhIiCv3Ct2zq9+EtaAjZiDOVHK08Rt
	lN+D+Bp1knw/NHGT3VHYTE+E5bA8fiJl36VJPwAjbSCWD3O3SUfm5iHBpR7RSw7rpKzX
	cz1iOe9IyDzBnMEeahEdRsYym0fKP/QqDBw4I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	b=sCB8m2ctMdgt7MnYjxYHXBz5mHqLrIpZg4TI7D/o8KypXY2jzZtef/lHBBRkqXbz11
	B77qbjAYZnjkjXetkB+Sr0ey2LCOfcvcd62d+gutUwmRmIgRmYQf/ObUqSZxQmNTLYih
	WHbBQrwpcpUV03v7URk7OfwDTYGwF0VmbCZBc=
Received: by 10.216.220.219 with SMTP id o69mr2607642wep.57.1292686705175;
	Sat, 18 Dec 2010 07:38:25 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.67.67 with HTTP; Sat, 18 Dec 2010 07:38:03 -0800 (PST)
In-Reply-To: <AANLkTimkoAmu_Qy=t635mP3ufHTqhUbQbr4PTpMjFBLq@mail.gmail.com>
References: <AANLkTim1ZFrjZuvJgKGB-+2wTNUAx5cdiNsRXK8bvRf9@mail.gmail.com>
	<AANLkTimkoAmu_Qy=t635mP3ufHTqhUbQbr4PTpMjFBLq@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Sat, 18 Dec 2010 08:38:03 -0700
X-Google-Sender-Auth: gtAFM49-ArrAY2KDvhOGxsfNfso
Message-ID: <AANLkTikhd_dxxE5AEViWANi8gmBAJcW_q2u+625GPk2a@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: bitbake-dev@lists.berlios.de
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
X-List-Received-Date: Sat, 18 Dec 2010 15:38:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 18, 2010 at 8:35 AM, Chris Larson <clarson@kergoth.com> wrote:
> On Sat, Dec 18, 2010 at 4:16 AM, Frans Meulenbroeks
> <fransmeulenbroeks@gmail.com> wrote:
>> If I use bitbake git head I get:
>>
>> frans@linux-suse:~/oe/openembedded> bitbake james-image
>> Process ProcessServer-1:
>> Traceback (most recent call last):
>> =C2=A0File "/usr/lib/python2.6/multiprocessing/process.py", line 231, in=
 _bootstrap
>> =C2=A0 =C2=A0self.run()
>> =C2=A0File "/home/frans/oe/bitbake/lib/bb/server/process.py", line 95, i=
n run
>> =C2=A0 =C2=A0[NULL, NULL, NULL]):
>> =C2=A0File "/usr/lib/python2.6/contextlib.py", line 16, in __enter__
>> =C2=A0 =C2=A0return self.gen.next()
>> =C2=A0File "/home/frans/oe/bitbake/lib/bb/utils.py", line 805, in redire=
cted_fds
>> =C2=A0 =C2=A0old_fds.append(os.dup(fd))
>> OSError: [Errno 9] Bad file descriptor
>>
>> I did not fully bisect it but rev
>> 144887553097a288a76b8de78f71548d5ef9a350 still works fine with me.
>> The problem seems to be introduced in one of the next 5 or so commits
>> after that one.
>
> There are 32 commits after that one, not 5 ;)

You've tested commit 71f8b122dc8477b12911ff7b145a42c4c97a118f ?  This
fixed the file mode that was used to open /dev/null.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


