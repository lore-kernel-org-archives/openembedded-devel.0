Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fromm@dresearch-fe.de>) id 1SUZqR-0006D4-UG
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 May 2012 10:44:32 +0200
Received: by lbol5 with SMTP id l5so336676lbo.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 May 2012 01:34:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding:x-gm-message-state;
	bh=S0VPEIJTnVIVtTGK+P7JuNB+TwBh5pBrcutmcJWWMUE=;
	b=mqJFmB+ZkNPbeoOWcwzmz5Hwpv8g+XW5cNuP5PNk5+lJ71ZXhGuThb/rPt9nkBlPor
	1B2VGL7RBh8+liTOkIF8Gu38buPT4RD8tW7rc7anT8PPdGFKxRuRrm/ybQdnu7y6KI36
	XQsThTV8ns26nqtCeQW6SyZdtwUDhD5RVay0lM6E0+EHDKuqxlipOwbSyIv67C57DxAj
	T9uohrs4bZTeUKWB03u/nhpAxs32fFeraMUCfk/Im+vxFcn+dUdBUQOLszMIFXsA4BFE
	0aOIBopJ534R1FmbH2fujTn+riejkT+jQ+NqVh0ZdhvptkFkJDxyaxuc0rwgE0nyK7G7
	LuOQ==
MIME-Version: 1.0
Received: by 10.112.88.34 with SMTP id bd2mr607846lbb.33.1337157270811; Wed,
	16 May 2012 01:34:30 -0700 (PDT)
Received: by 10.112.10.201 with HTTP; Wed, 16 May 2012 01:34:30 -0700 (PDT)
In-Reply-To: <20120515201953.GB14162@denix.org>
References: <CADZ6=asJ+xLvpodv=u9duDuWs=dp8mLamv=Sj6yJc6B5sjWMrw@mail.gmail.com>
	<3578934.ouGGrvIU0p@helios> <20120515201953.GB14162@denix.org>
Date: Wed, 16 May 2012 10:34:30 +0200
Message-ID: <CADZ6=as9kYOueX_rvj8LovQRQrXPCLcNv7snoV7ZnNozUsTVug@mail.gmail.com>
From: Thilo Fromm <fromm@dresearch-fe.de>
To: Denys Dmytriyenko <denis@denix.org>
X-Gm-Message-State: ALoCoQkHI29I0xeCdW6bhr3MwA83V6sCEN2TsFDLNpCZkimru8o8boq9uaOZfcUEHITYxBDEj0/y
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Where do I override DISTRO_FEATURES?
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
X-List-Received-Date: Wed, 16 May 2012 08:44:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello, Denys,

>> > I'm trying to remove an element from DISTRO_FEATURES (specifically
>> > "ld-is-gold"), but I am unable to find the right spot to do it. The
>> > distribution we're using (Angstrom, as it happens) sets this in
>> > conf/distro/angstrom-v2012.x.conf. My machine configuration is the
>> > wrong spot to modify DISTRO_FEATURES, since it will be processed
>> > first. local.conf is not working, too.
>> >
>> > So could anybody please tell me where I need to put my
>> >
>> > DISTRO_FEATURES =3D "${@'${DISTRO_FEATURES}}'.replace('ld-is-gold', =
=C2=A0'')}"
>> >
>> > so it applies for the build?
>>
>> Unfortunately such hacks only work for variables that are not set within=
 the
>> distro configuration, which is applied after local.conf.
>
> Well, while still being an ugly hack, this should still be possible using
> local overrides... I.e. VAR_local in OE or VAR_forcevariable in OE-core/Y=
octo.
> You may need to use immediate assignment to avoid circular dependency, th=
ough.

Actually it would be easiest for me if the last 5 lines of
https://github.com/Angstrom-distribution/meta-angstrom/blob/master/conf/dis=
tro/angstrom-v2012.x.conf
would not be

DISTRO_FEATURES +=3D "${LDISGOLD}"
LDISGOLD_arm =3D "ld-is-gold"
LDISGOLD_x86 =3D "ld-is-gold"
LDISGOLD_x86_64 =3D "ld-is-gold"
LDISGOLD =3D ""

but instead be

DISTRO_FEATURES +=3D "${LDISGOLD}"
LDISGOLD_arm ?=3D "ld-is-gold"
LDISGOLD_x86 ?=3D "ld-is-gold"
LDISGOLD_x86_64 ?=3D "ld-is-gold"
LDISGOLD ?=3D ""

But anyways, I decided to fix the gcc-4.5-cross-initial build.

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


