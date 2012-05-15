Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fromm@dresearch-fe.de>) id 1SUEhC-0005wC-7X
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 May 2012 12:09:34 +0200
Received: by lags15 with SMTP id s15so4015035lag.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 May 2012 02:59:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding:x-gm-message-state;
	bh=33RABARvPGJF4R74eNlgEcPMHGafIYH99djjN6VTV9Y=;
	b=Yh7WYyij8vN9ib9xNJ9+nRM/2X2Sa2l4DZqCjnZKXihudZT+DbFxiCM5Ad+t4PF4Xo
	5fGyCy04YfuM+lXDbXDUzvNierWF7nI9buPQfvawzM7wHLQwviJ8/H/j66HBg/zQIUlX
	ymLvbYmJItLn7JN2ES2sUUy5avxyd/aymxoRZOOLvr//kFD/LYfn4AFloslzlpZPUteu
	GCpYiLi3CECG2dWuqDVaG+pLwMvb0G6HY5U7gvAF4w0k2TH/a9xMiEqtUV2uopR6NmJy
	zy17LZ7TZI6O3D0QfgVlzMLh9SCsn1Enl6XQGylXEpUYm4zeoR666SutZC5wmMci0s2/
	SpBA==
MIME-Version: 1.0
Received: by 10.152.148.199 with SMTP id tu7mr11670984lab.43.1337075974253;
	Tue, 15 May 2012 02:59:34 -0700 (PDT)
Received: by 10.112.10.201 with HTTP; Tue, 15 May 2012 02:59:34 -0700 (PDT)
In-Reply-To: <jot7t2$gbg$1@dough.gmane.org>
References: <CADZ6=avMrT89BZA=awFOhCQFMhTDo1n67ZQya7J3Z9BSQeZHqw@mail.gmail.com>
	<CAMKF1sqCxAnukfORLmDT9vxg-V8ABcUgjXYTP5b1jc=LZfDu1w@mail.gmail.com>
	<CADZ6=auir8z1R2eQ0c++EcdLWizOQ+=OhbqM5q6Fms1=G0CJhw@mail.gmail.com>
	<4FB216D2.6010108@gmail.com> <jot7t2$gbg$1@dough.gmane.org>
Date: Tue, 15 May 2012 11:59:34 +0200
Message-ID: <CADZ6=av9w+iWXDoaAtiLB46cnGjnFBcp80jf-NThnTY23xhpNA@mail.gmail.com>
From: Thilo Fromm <fromm@dresearch-fe.de>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQk3V03lk9tPyz2Yumj7CYj0HTYVYQEmt+eZLDfZFv1szyJpyWbZnmr0AGo8Rbs5sEksE3i/
Subject: Re: New kmod {libdir} breaks udev 182 build
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
X-List-Received-Date: Tue, 15 May 2012 10:09:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello Koen,

thanks for helping out with this.

>>>>> I've got an issue with
>>>>> openembedded-core/meta/recipes-kernel/kmod/kmod_git.bb, with the
>>>>> way {libdir} is set in line 19:
>>>>>
>>>>> libdir =3D "${base_libdir}"
>>>>>
>>>>> "git blame" claims this was added by Khem Raj on 2012-05-08. This
>>>>> line causes libkmod to put its pkgconfig ".pc" file in the staging
>>>>> area at "/lib/pkgconfig/libkmod.pc". This is sad because other
>>>>> recipes would only look at /usr/lib/pkgconfig/ and
>>>>> /usr/share/pkgconfig.
>>>>>
>>>>> Take meta-openembedded/meta-oe/recipes-core/udev/udev_182.bb, for
>>>>> example. The build predictably fails with
>>>>>
>>>>> checking for KMOD... no configure: error: Package requirements
>>>>> (libkmod >=3D 5) were not met:
>>>>>
>>>>> No package 'libkmod' found
>>>>>
>>>>>
>>>>> So what's the right thing do do here? Use a different package
>>>>> install path for libkmod, or point udev to /lib/pkgconfig by
>>>>> extending its PKG_CONFIG_PATH correspondingly?
>>>> One solution is to fix kmod to install pc files in /usr/lib with
>>>> right paths to access libkmod
>>>>
>>>> second solution is to look for pc files in ${base_libdir} while
>>>> building udev can you try this option.
>>>>
>>> Yes, I was trying to state these two possible resolutions in my first
>>> mail. I already tried adding
>>>
>>> PKG_CONFIG_PATH =3D
>>> "${PKG_CONFIG_DIR}:${STAGING_DATADIR}/pkgconfig:${PKG_CONFIG_SYSROOT_DI=
R}/${base_libdir}/pkgconfig/"
>>>
>>> to udev-182 and systemd (which is also affected) recipes. It works
>>> around the bug. Still, I think kmod is publishing its .pc files in the
>>> wrong directory.
>>>
>>> Regards, Thilo
>>>
>> We are also having this issue, and have just added this hack in a
>> bbappend for udev and systemd. Not a pretty solution, but found it to be
>> a lot of work to make only the .pc files be put in /usr/lib/pkgconfig
>> instead of /lib/pkgconfig. I totally agree that kmod publishes it's .pc
>> files in the wrong directory,
>
> It's not kmods fault. The recipe changes $libdir to /lib. It tries to tak=
e a
> shortcut that backfires.

Ahm - I would argue it therefore *is* kmod's fault. It is just not
intentional. But I think it needs to be fixed in kmod's recipe.

>> =C2=A0as every distro I have tried uses
>> /usr/lib/pkgconfig as the pkgconfig directory. Guess we will keep this
>> hack until kmod is fixed upstream though.
>
> The bug is in the recipe:
> http://cgit.openembedded.org/openembedded-core/commit/?id=3D6b74f24617352=
72bd950a4f060dab6e778a36f92

Yupp. Since it was Khem I suggest he fixes the issue :)

> I spoke to upstream and they confirmed we get what we ask for in OE:
> pkgconfig in the wrong location.

I seem to lack of some background knowledge here. I don't quite
understand the implications of this sentence.

Regards,
Thilo

--=20
Dipl.-Ing (FH) Thilo Fromm, MSc., Embedded Systems Architect
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, D-10319 Berlin, Germany
Tel: +49 (30) 515 932 228 =C2=A0 mailto:fromm@dresearch-fe.de
Fax: +49 (30) 515 932 77 =C2=A0 =C2=A0http://www.dresearch.de
Amtsgericht: Berlin Charlottenburg, HRB 130120 B
Ust.-IDNr. DE273952058
Gesch=C3=A4ftsf=C3=BChrer: Dr. M. Weber, W. M=C3=B6gle


