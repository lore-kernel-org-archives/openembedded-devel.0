Return-Path: <lukas.bulwahn@oss.bmw-carit.de>
Received: from linuxmail.bmw-carit.de (mail.bmw-carit.de [62.245.222.98])
	by mail.openembedded.org (Postfix) with ESMTP id CCFA660662
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Sep 2013 11:49:48 +0000 (UTC)
Received: from LMUC430092 (lmuc430092.bmw-carit.intra [192.168.101.9])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: lukas.bulwahn)
	by linuxmail.bmw-carit.de (Postfix) with ESMTPSA id 7AA594007F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Sep 2013 12:46:58 +0200 (CEST)
From: "Lukas Bulwahn" <lukas.bulwahn@oss.bmw-carit.de>
To: <openembedded-devel@lists.openembedded.org>
References: <CAKS01onp9CcPLNOybKbTh9bsp4QwuLJtJABrU7_zDe=Px0t6Nw@mail.gmail.com>
In-Reply-To: <CAKS01onp9CcPLNOybKbTh9bsp4QwuLJtJABrU7_zDe=Px0t6Nw@mail.gmail.com>
Date: Mon, 16 Sep 2013 13:49:49 +0200
Message-ID: <02f901ceb2d2$d93db7e0$8bb927a0$@oss.bmw-carit.de>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AQJkHe7v0Es/gMjcg+whiOBNcl4FwpidaCLg
Subject: Re: using deb as source while building image.
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
X-List-Received-Date: Mon, 16 Sep 2013 11:49:49 -0000
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Language: de

Hello Anup,

if you are trying to compile the Point Cloud Library for the ZYNQ board, =
you
do not require the VTK library (as long as you do not need the =
visualization
part).
You can find a preliminary recipe for the Point Cloud Library at

https://github.com/bulwahn/meta-ros/commit/2c1fb8dbc46f8bc3f3fe58fbdfb7b2=
c8f
244431a

Hope this helps.

Lukas

> -----Urspr=FCngliche Nachricht-----
> Von: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] Im
> Auftrag von Anup Kini
> Gesendet: Montag, 16. September 2013 12:58
> An: openembedded-devel@lists.openembedded.org
> Betreff: [oe] using deb as source while building image.
>=20
> Hi All,
>=20
> I am trying to build a core image minimal for the ZYNQ board.
>=20
> I am trying to include VTK library available as deb in the following
location
> =
http://ports.ubuntu.com/pool/universe/v/vtk/libvtk5.8_5.8.0-5_armhf.deb,
> since its already compiled for ARM platform.
>=20
> When i try to use the recipe mentioned below, nothing gets installed.
> Let me know if it is possible to use the deb as a source to install My
recipe
> looks like below:
>
-------------------------------------------------------------------------=
---
------------------
> -------------------------------------
> DESCRIPTION =3D "The Visualisation Toolkit"
> HOMEPAGE =3D "http://www.vtk.org"
>=20
> LICENSE =3D "BSD"
>=20
> SRC_URI =3D "
> =
http://ports.ubuntu.com/pool/universe/v/vtk/libvtk5.8_5.8.0-5_armhf.deb"
>=20
> SRC_URI[md5sum] =3D "14945458a1e80d2990a4005c5163e01c"
>=20
> # Skip the unwanted steps
> do_compile[noexec] =3D "1"
>=20
> # Install the files to ${D}
> bin_package_do_install () {
>     # Do it carefully
>     [ -d "${S}" ] || exit 1
>     cd ${S} || exit 1
>     tar --no-same-owner --exclude=3D'./patches' --exclude=3D'./.pc'
> --exclude=3D'./control.tar.gz' -cpf - . \
>         | tar --no-same-owner -xpf - -C ${D} }
>=20
> FILES_${PN} =3D "/"
>=20
> EXPORT_FUNCTIONS do_install
>
-------------------------------------------------------------------------=
---
------------------
> --------------------------------------------
>=20
> Let me know if there is already a reference recipe that uses such a =
deb
> source.
>=20
>=20
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


