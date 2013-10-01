Return-Path: <lukas.bulwahn@oss.bmw-carit.de>
Received: from linuxmail.bmw-carit.de (mail.bmw-carit.de [62.245.222.98])
	by mail.openembedded.org (Postfix) with ESMTP id 2AF6D610FE
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Oct 2013 11:20:18 +0000 (UTC)
Received: from LMUC430092 (lmuc430092.bmw-carit.intra [192.168.101.1])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: lukas.bulwahn)
	by linuxmail.bmw-carit.de (Postfix) with ESMTPSA id 426DA4002C
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Oct 2013 12:16:20 +0200 (CEST)
From: "Lukas Bulwahn" <lukas.bulwahn@oss.bmw-carit.de>
To: <openembedded-devel@lists.openembedded.org>
References: <CAKS01onnW6h7NvP42gk4eE9k3KVskoTdPsntFD1sKaYt-xJNvA@mail.gmail.com>
In-Reply-To: <CAKS01onnW6h7NvP42gk4eE9k3KVskoTdPsntFD1sKaYt-xJNvA@mail.gmail.com>
Date: Tue, 1 Oct 2013 13:20:18 +0200
Message-ID: <00d001cebe98$360affc0$a220ff40$@oss.bmw-carit.de>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AQKns24KoAyYV25OT+PE3964oYfk/pgtyUaw
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
X-List-Received-Date: Tue, 01 Oct 2013 11:20:18 -0000
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Language: de

Hi all,

I can confirm this error that occurs when you set DISTRO_FEATURES =3D =
"opengl
x11".

Lukas

> -----Urspr=FCngliche Nachricht-----
> Von: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] Im
> Auftrag von Anup Kini
> Gesendet: Dienstag, 1. Oktober 2013 10:32
> An: openembedded-devel@lists.openembedded.org
> Betreff: [oe] unable to compile eglibc_2.18
>=20
> Hi All,
>=20
> I am facing a weird error while trying to build core-image-minimal =
with OE
>=20
> Build Configuration:
> BB_VERSION            =3D "1.20.0"
> BUILD_SYS               =3D "x86_64-linux"
> NATIVELSBSTRING   =3D "Ubuntu-12.04"
> TARGET_SYS            =3D "arm-oe-linux-gnueabi"
> MACHINE                  =3D "zc702-zynq7"
> DISTRO_VERSION     =3D "oe-core.0"
> TUNE_FEATURES      =3D " armv7a vfp neon zynq"
> TARGET_FPU            =3D "vfp-neon"
> meta                          =3D
> "master:3f5f9d2681d41e44dade5d3a5a4bff3fd38f5506"
> meta-xilinx                  =3D
> "master:6efe82fb07d98f190e9b078132526eeadd8cf9fc"
>=20
> " bitbake -v core-image-minimal " gives me the following error:
>=20
> /2.18-r0/eglibc-2.18/libc/pwd/../nss/getXXbyYY_r.c:308: undefined
> reference to `__nss_database_custom'
>=20
> /home/akini/openembedded-core/build/tmp-eglibc/sysroots/x86_64-
> linux/usr/libexec/armv7a-vfp-neon-oe-linux-gnueabi.gcc-cross-
> initial/gcc/arm-oe-linux-gnueabi/4.8.1/ld:
> /home/akini/openembedded-core/build/tmp-eglibc/work/armv7a-vfp-
> =
neon-oe-linux-gnueabi/eglibc/2.18-r0/build-arm-oe-linux-gnueabi/libc.so:
> hidden symbol `__nss_not_use_nscd_group' isn't defined
>=20
> /home/akini/openembedded-core/build/tmp-eglibc/sysroots/x86_64-
> linux/usr/libexec/armv7a-vfp-neon-oe-linux-gnueabi.gcc-cross-
> initial/gcc/arm-oe-linux-gnueabi/4.8.1/ld:
> final link failed: Bad value
> collect2: error: ld returned 1 exit status
>=20
>=20
> PasteBin link to log.do_compile =3D http://pastebin.com/ujVwTrjg
>=20
>=20
> Let me know if i am going wrong somewhere or missed some thing !!
>=20
> --
>=20
> *Anup Kini
> *Systems Engineer****
> *
> ------------------------------
> *
>=20
> *Synapticon** * |  Cyber-Physical System Solutions ****
>=20
> Mobile:
>=20
> Direct:
>=20
> +49 151 / 638 646 73
>=20
> +49 7335 / 186 999 21
>=20
> Fax:****
> +49 7335 / 186 999 1
>=20
>=20
>  **
>=20
>  ****
>=20
> synapticon.com <http://www.synapticon.com/>  |
> @synapticon_co<https://twitter.com/#!/synapticon_co>
> ****
>=20
> Synapticon GmbH  |  Hohlbachweg 2  |  73344 Gruibingen, DE Secretary =
+49
> 7335 / 186 999 0  |  General Manager: Nikolai Ensslen Registry Court =
Ulm
HRB
> 725114  |  USt-ID DE271647127****
>=20
> This message and any files transmitted with it are confidential and
intended
> solely for the use of the individual or entity to whom they are =
addressed.
> Please notify the sender immediately if you have received this e-mail =
by
> mistake and delete it from your system.
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


