Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fromm@dresearch-fe.de>) id 1SUDRW-0001YK-Hj
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 May 2012 10:49:18 +0200
Received: by lbol5 with SMTP id l5so3967588lbo.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 May 2012 01:39:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding:x-gm-message-state;
	bh=DeY1zqmkM+f63c4RNN2QPEl0B56yz1GS+CZ5aUvfgH0=;
	b=a34Tzs+f7E52wQQM7OBFaRYBPgm7+BG1OcBAaI8j58Vz3fjZFuFRgGCZu5elrt3YVg
	lYryvgsGkTEG2c27e0v8sVrq/gTNpA/KHfAalpguO+6eE6UYHjfTPI73ShQblPPK6lsm
	z7tb3XkPTof50PTLJTJn4SaVgfQJJO259mwgkIG9FLBSRIJPkOOktfUFnCZbI0gcMxUk
	uKot0LB3cNQ9UVHzD+kFi5HqIuuNflC2iSaEXLyqVaIzgyAYcFVTNRKevGXWADfybDRj
	GDc5naC8owcdhpksyHQ/gKD184OoZcx8Jl3gFhd6JrfevoFBU4tViyEzeAMge22+WVd/
	qLrg==
MIME-Version: 1.0
Received: by 10.152.148.101 with SMTP id tr5mr2702792lab.36.1337071158626;
	Tue, 15 May 2012 01:39:18 -0700 (PDT)
Received: by 10.112.10.201 with HTTP; Tue, 15 May 2012 01:39:18 -0700 (PDT)
In-Reply-To: <CAMKF1sqCxAnukfORLmDT9vxg-V8ABcUgjXYTP5b1jc=LZfDu1w@mail.gmail.com>
References: <CADZ6=avMrT89BZA=awFOhCQFMhTDo1n67ZQya7J3Z9BSQeZHqw@mail.gmail.com>
	<CAMKF1sqCxAnukfORLmDT9vxg-V8ABcUgjXYTP5b1jc=LZfDu1w@mail.gmail.com>
Date: Tue, 15 May 2012 10:39:18 +0200
Message-ID: <CADZ6=auir8z1R2eQ0c++EcdLWizOQ+=OhbqM5q6Fms1=G0CJhw@mail.gmail.com>
From: Thilo Fromm <fromm@dresearch-fe.de>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQmE1kHd0ulbDoH1QKJVfnbXkRiPm6bK482CLlO3v3y5WyNxf8YBRs5u9okB7bUI9/EsScrK
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
X-List-Received-Date: Tue, 15 May 2012 08:49:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello Khem,

>> I've got an issue with
>> openembedded-core/meta/recipes-kernel/kmod/kmod_git.bb, with the way
>> {libdir} is set in line 19:
>>
>> libdir =3D "${base_libdir}"
>>
>> "git blame" claims this was added by Khem Raj on 2012-05-08. This line
>> causes libkmod to put its pkgconfig ".pc" file in the staging area at
>> "/lib/pkgconfig/libkmod.pc". This is sad because other recipes would
>> only look at /usr/lib/pkgconfig/ and /usr/share/pkgconfig.
>>
>> Take meta-openembedded/meta-oe/recipes-core/udev/udev_182.bb, for
>> example. The build predictably fails with
>>
>> checking for KMOD... no
>> configure: error: Package requirements (libkmod >=3D 5) were not met:
>>
>> No package 'libkmod' found
>>
>>
>> So what's the right thing do do here? Use a different package install
>> path for libkmod, or point udev to /lib/pkgconfig by extending its
>> PKG_CONFIG_PATH correspondingly?
>
> One solution is to fix kmod to install pc files in /usr/lib with right pa=
ths
> to access libkmod
>
> second solution is to look for pc files in ${base_libdir} while building =
udev
> can you try this option.

Yes, I was trying to state these two possible resolutions in my first
mail. I already tried adding

PKG_CONFIG_PATH =3D
"${PKG_CONFIG_DIR}:${STAGING_DATADIR}/pkgconfig:${PKG_CONFIG_SYSROOT_DIR}/$=
{base_libdir}/pkgconfig/"

to udev-182 and systemd (which is also affected) recipes. It works
around the bug. Still, I think kmod is publishing its .pc files in the
wrong directory.

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


