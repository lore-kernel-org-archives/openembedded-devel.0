Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fromm@dresearch-fe.de>) id 1STurT-00020Z-Ob
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 May 2012 14:58:51 +0200
Received: by lbol5 with SMTP id l5so3250167lbo.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 May 2012 05:48:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=X3DSznF0Z2tk6e6geuyktgIg+OSNTYFeycU9ZaGAM5Q=;
	b=U67jhKNkVyycggbsfiyjCpGAQ4aGEviEK+2ZQ4xZOn0GD2xKewSU8p4zGK9FhMtfm2
	bs0iQHjys7Ym+gOJRH7EP+1mFNc3nzS1NdKlROEpK4tHCoPi9J/BBCAB2u5XE7UD7zu/
	3GnNuUcSvN+2oPI+ycqMILxgiUjt18Lsx9gDJel25ery8MSxltfTJb2dIgECf0/FadT4
	nUrDy1KFtT+VuOarr4k5z/3Z/YuilCajM5t5gSe09Jqgx9mv3au1cIwdcmUMiBeOtbbj
	emzSkUVkxDvQ/FezP0/A38/t50owcUvo42lIkWPhD4GzWUhXZ2fijBU94wycRH0R2izS
	2BcQ==
MIME-Version: 1.0
Received: by 10.152.148.101 with SMTP id tr5mr7998653lab.36.1336999732778;
	Mon, 14 May 2012 05:48:52 -0700 (PDT)
Received: by 10.112.10.201 with HTTP; Mon, 14 May 2012 05:48:52 -0700 (PDT)
Date: Mon, 14 May 2012 14:48:52 +0200
Message-ID: <CADZ6=auhe9BbFPd-F-QNLcTksuWzZdY8tUb31P2JVm38LDjCsw@mail.gmail.com>
From: Thilo Fromm <fromm@dresearch-fe.de>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQkQkK1OR22d7EnNQaMkcRjoOsl8+Ns2hDPw+AlPmFZt2+4Js5q192Am87aS5bGBDvx74DsQ
Subject: Re: New kmod {libdir} breaks udev, systemd build
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
X-List-Received-Date: Mon, 14 May 2012 12:58:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi there,

[...]

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
> I have some build failure.

Me too. systemd is failing to build for the same reason. For a quick
fix-ish workaround try adding

PKG_CONFIG_PATH =3D
"${PKG_CONFIG_DIR}:${STAGING_DATADIR}/pkgconfig:${PKG_CONFIG_SYSROOT_DIR}/$=
{base_libdir}/pkgconfig/"

(^^ supposed to be one single line ^^)

to both systemd and udev recipes. Yes, I know, this is a very ugly
hack. I'm still waiting for a response to my either-or question in
this mail thread's first mail before submitting a patch to fix the
issue.

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


