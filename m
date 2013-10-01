Return-Path: <akini@synapticon.com>
Received: from mail-lb0-f171.google.com (mail-lb0-f171.google.com
	[209.85.217.171])
	by mail.openembedded.org (Postfix) with ESMTP id 3C955610FE
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Oct 2013 11:25:35 +0000 (UTC)
Received: by mail-lb0-f171.google.com with SMTP id u14so5750523lbd.16
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Oct 2013 04:25:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=LQINIERv/duzPSq9pu6jVgdhtpDn+uJdxxHodQZa6Do=;
	b=lrEBBWZorLVqSMswN2E07U8zH1pO+pBqqMBlFraE+tVTNVKt86H32esvX86xGTNgp2
	tv0i8JuOKNyVJAHDFlrZ5VDFY+vTrhHGmt6IqtHhQp/ZXWryTwFwZDJA+Y5K/PJmB+oz
	75q7coVoxVm0QBev5eohlMYFFTBkM0/hkxtFGgaBFf2DWQJ5gKcmDyoGeasPaJc8bnq9
	kzfVhYgt97PDJO4HRMleVB0B2fDh6BBgu7crjANHNUTsl9173xpunwweua3YpjdjtcVa
	mZy+vgs/u2MB0Byl2UcQKSTJoF9ogntOvJdPuOQ4ogvhikDyq764K4OmGpo4vQvE3rNt
	ivhw==
X-Gm-Message-State: ALoCoQn4amkzBjB5NbbJcFuDacvHuyyNzVXlSlyLJs6LXhFm0fIuokNydPmnr2/MtqHIP0eZZcxa
MIME-Version: 1.0
X-Received: by 10.152.228.130 with SMTP id si2mr1690448lac.32.1380626736224;
	Tue, 01 Oct 2013 04:25:36 -0700 (PDT)
Received: by 10.114.3.8 with HTTP; Tue, 1 Oct 2013 04:25:36 -0700 (PDT)
In-Reply-To: <00d001cebe98$360affc0$a220ff40$@oss.bmw-carit.de>
References: <CAKS01onnW6h7NvP42gk4eE9k3KVskoTdPsntFD1sKaYt-xJNvA@mail.gmail.com>
	<00d001cebe98$360affc0$a220ff40$@oss.bmw-carit.de>
Date: Tue, 1 Oct 2013 13:25:36 +0200
Message-ID: <CAKS01okrOwB02CvFPYAGwiX8FivVwxge+e2Fa-NeVvQ3f3hPQw@mail.gmail.com>
From: Anup Kini <akini@synapticon.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: unable to compile eglibc_2.18
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 01 Oct 2013 11:25:35 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Thanks a lot Lukas,
Is there a round about to this, so that i can include mesa packages ?


On 1 October 2013 13:20, Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>wrot=
e:

> Hi all,
>
> I can confirm this error that occurs when you set DISTRO_FEATURES =3D "op=
engl
> x11".
>
> Lukas
>
> > -----Urspr=FCngliche Nachricht-----
> > Von: openembedded-devel-bounces@lists.openembedded.org
> > [mailto:openembedded-devel-bounces@lists.openembedded.org] Im
> > Auftrag von Anup Kini
> > Gesendet: Dienstag, 1. Oktober 2013 10:32
> > An: openembedded-devel@lists.openembedded.org
> > Betreff: [oe] unable to compile eglibc_2.18
> >
> > Hi All,
> >
> > I am facing a weird error while trying to build core-image-minimal with
> OE
> >
> > Build Configuration:
> > BB_VERSION            =3D "1.20.0"
> > BUILD_SYS               =3D "x86_64-linux"
> > NATIVELSBSTRING   =3D "Ubuntu-12.04"
> > TARGET_SYS            =3D "arm-oe-linux-gnueabi"
> > MACHINE                  =3D "zc702-zynq7"
> > DISTRO_VERSION     =3D "oe-core.0"
> > TUNE_FEATURES      =3D " armv7a vfp neon zynq"
> > TARGET_FPU            =3D "vfp-neon"
> > meta                          =3D
> > "master:3f5f9d2681d41e44dade5d3a5a4bff3fd38f5506"
> > meta-xilinx                  =3D
> > "master:6efe82fb07d98f190e9b078132526eeadd8cf9fc"
> >
> > " bitbake -v core-image-minimal " gives me the following error:
> >
> > /2.18-r0/eglibc-2.18/libc/pwd/../nss/getXXbyYY_r.c:308: undefined
> > reference to `__nss_database_custom'
> >
> > /home/akini/openembedded-core/build/tmp-eglibc/sysroots/x86_64-
> > linux/usr/libexec/armv7a-vfp-neon-oe-linux-gnueabi.gcc-cross-
> > initial/gcc/arm-oe-linux-gnueabi/4.8.1/ld:
> > /home/akini/openembedded-core/build/tmp-eglibc/work/armv7a-vfp-
> > neon-oe-linux-gnueabi/eglibc/2.18-r0/build-arm-oe-linux-gnueabi/libc.so=
:
> > hidden symbol `__nss_not_use_nscd_group' isn't defined
> >
> > /home/akini/openembedded-core/build/tmp-eglibc/sysroots/x86_64-
> > linux/usr/libexec/armv7a-vfp-neon-oe-linux-gnueabi.gcc-cross-
> > initial/gcc/arm-oe-linux-gnueabi/4.8.1/ld:
> > final link failed: Bad value
> > collect2: error: ld returned 1 exit status
> >
> >
> > PasteBin link to log.do_compile =3D http://pastebin.com/ujVwTrjg
> >
> >
> > Let me know if i am going wrong somewhere or missed some thing !!
> >
> > --
> >
> > *Anup Kini
> > *Systems Engineer****
> > *
> > ------------------------------
> > *
> >
> > *Synapticon** * |  Cyber-Physical System Solutions ****
> >
> > Mobile:
> >
> > Direct:
> >
> > +49 151 / 638 646 73
> >
> > +49 7335 / 186 999 21
> >
> > Fax:****
> > +49 7335 / 186 999 1
> >
> >
> >  **
> >
> >  ****
> >
> > synapticon.com <http://www.synapticon.com/>  |
> > @synapticon_co<https://twitter.com/#!/synapticon_co>
> > ****
> >
> > Synapticon GmbH  |  Hohlbachweg 2  |  73344 Gruibingen, DE Secretary +4=
9
> > 7335 / 186 999 0  |  General Manager: Nikolai Ensslen Registry Court Ul=
m
> HRB
> > 725114  |  USt-ID DE271647127****
> >
> > This message and any files transmitted with it are confidential and
> intended
> > solely for the use of the individual or entity to whom they are
> addressed.
> > Please notify the sender immediately if you have received this e-mail b=
y
> > mistake and delete it from your system.
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>



--=20

*Anup Kini
*Systems Engineer****
*
------------------------------
*

*Synapticon** * |  Cyber-Physical System Solutions ****

Mobile:

Direct:

+49 151 / 638 646 73

+49 7335 / 186 999 21

Fax:****
+49 7335 / 186 999 1


 **

 ****

synapticon.com <http://www.synapticon.com/>  |
@synapticon_co<https://twitter.com/#!/synapticon_co>
****

Synapticon GmbH  |  Hohlbachweg 2  |  73344 Gruibingen, DE
Secretary +49 7335 / 186 999 0  |  General Manager: Nikolai Ensslen
Registry Court Ulm HRB 725114  |  USt-ID DE271647127****

This message and any files transmitted with it are confidential and
intended
solely for the use of the individual or entity to whom they are addressed.
Please notify the sender immediately if you have received this e-mail by
mistake and delete it from your system.

