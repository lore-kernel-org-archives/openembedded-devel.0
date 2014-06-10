Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 140A06605F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jun 2014 14:21:52 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 10 Jun 2014 07:21:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,1009,1392192000"; d="scan'208";a="443838777"
Received: from cgwithan-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.176])
	by azsmga001.ch.intel.com with ESMTP; 10 Jun 2014 07:21:44 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Kevyn-Alexandre =?ISO-8859-1?Q?Par=E9?= <kapare@rogue-research.com>
Date: Tue, 10 Jun 2014 15:21:43 +0100
Message-ID: <2119004.5vv4Yd8mCL@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.5 (Linux/3.14.5-200.fc20.x86_64; KDE/4.12.5; x86_64; ; )
In-Reply-To: <CACgAsMdmdZO6-jePAyHJVSFJg6ntXDzSr2xmx6OqHh5qvVcB-g@mail.gmail.com>
References: <CACgAsMdmdZO6-jePAyHJVSFJg6ntXDzSr2xmx6OqHh5qvVcB-g@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [Yocto] How to add the same recipe twice?
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
X-List-Received-Date: Tue, 10 Jun 2014 14:21:56 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hi Kevyn-Alexandre,

On Monday 09 June 2014 14:26:53 Kevyn-Alexandre Par=E9 wrote:
> Here what I want to do:
> - Have 2 different psplash in my image.
>=20
> Here what I have done:
> - Copy and rename the psplash recipe to psplash-desktop and modify
> couple of things.
>=20
>=20
> Here the warning I'm having:
> WARNING: The recipe psplash-desktop is trying to install files into a=

> shared area when those files already exist. Those files and their
> manifest location are:
>  =20
> /home/knight/SVN/rogue/3rdParty/Yocto/trunk/starting_point/yocto_buil=
d/src/
> build/tmp/sysroots/overo/pkgdata/runtime/psplash-default Matched in
> manifest-overo-psplash.packagedata
> manifest-overo-psplash-second.packagedata
>  =20
> /home/knight/SVN/rogue/3rdParty/Yocto/trunk/starting_point/yocto_buil=
d/src/
> build/tmp/sysroots/overo/pkgdata/runtime/psplash-default.packaged Mat=
ched in
> manifest-overo-psplash.packagedata
>  =20
> /home/knight/SVN/rogue/3rdParty/Yocto/trunk/starting_point/yocto_buil=
d/src/
> build/tmp/sysroots/overo/pkgdata/runtime-reverse/psplash-default Matc=
hed in
> manifest-overo-psplash.packagedata
> manifest-overo-psplash-second.packagedata
> Please verify which package should provide the above files.
> WARNING: The recipe psplash-desktop is trying to install files into a=

> shared area when those files already exist. Those files and their
> manifest location are:
>  =20
> /home/knight/SVN/rogue/3rdParty/Yocto/trunk/starting_point/yocto_buil=
d/src/
> build/tmp/deploy/rpm/armv7a_vfp_neon/psplash-default-0.1+git0+afd4e22=
8c6-r15
> .armv7a_vfp_neon.rpm Matched in
> manifest-armv7a-vfp-neon-psplash.package_write_rpm
> Please verify which package should provide the above files.
>=20
> Here the error:
> http://pastebin.com/t2gYs3WT
>=20
> Here the diff of my psplash recipe compare to psplash original:
> http://pastebin.com/8TrQRFkQ
>=20
> In the chat sgw_ recommended my to use:...
> sgw_> kapare, now that I better understand, you want to mv your binar=
y
> in the do_install_append(), and keep the update-alternative code and
> FILES_${PN} bin, but use the renamed binary in the
> ALTERNATIVE_LINK_NAME, but you also need ALTNATIVE_TARGET[psplash] =3D=

> ${bindir}/psplash-default

FYI, our psplash recipe has built-in handling for multiple splash image=
s, so=20
you don't need to add multiple recipes to use this. You just need a=20
psplash_git.bbappend in your own layer which does something like this:

FILESEXTRAPATHS_prepend :=3D "${THISDIR}/files:"
SPLASH_IMAGES =3D "file://splash-file-one.h;outsuffix=3Done \
                          file://splash-file-two.h;outsuffix=3Dtwo"

This will automatically create psplash-<outsuffix> packages for each sp=
lash=20
image entry (i.e. psplash-one and psplash-two in this case), and set up=
=20
update-alternatives alternatives for each one.

(I realise we don't have this documented anywhere, I've added a todo li=
st item=20
for me to document it.)

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre

