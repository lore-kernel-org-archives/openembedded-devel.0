Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 4152960144
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 May 2014 10:34:25 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 07 May 2014 03:34:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,1002,1389772800"; d="scan'208";a="507566043"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.252.122.213])
	by orsmga001.jf.intel.com with ESMTP; 07 May 2014 03:34:24 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: =?ISO-8859-1?Q?S=F8ren?= Holm <sgh@sgh.dk>,
	openembedded-devel@lists.openembedded.org
Date: Wed, 07 May 2014 11:34:23 +0100
Message-ID: <2543976.qS9USN9dCY@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.5 (Linux/3.14.2-200.fc20.x86_64; KDE/4.12.4; x86_64; ; )
In-Reply-To: <1399454777-2868-1-git-send-email-sgh@sgh.dk>
References: <1399454777-2868-1-git-send-email-sgh@sgh.dk>
MIME-Version: 1.0
Subject: Re: [meta-networking][PATCH] ifplugd: Added ifplugd recipe.
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
X-List-Received-Date: Wed, 07 May 2014 10:34:33 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hi S=F8ren,

So leaving aside that ifplugd is completely dead upstream, a few small =
pieces=20
of feedback on the recipe:

On Wednesday 07 May 2014 11:26:17 S=F8ren Holm wrote:
> Signed-off-by: S=F8ren Holm <sgh@sgh.dk>
> ---
>  .../ifplugd/files/ifplugd.conf                     | 42
> ++++++++++++++++++++++ .../recipes-connectivity/ifplugd/ifplugd_0.28.=
bb   |
> 23 ++++++++++++ 2 files changed, 65 insertions(+)
>  create mode 100644
> meta-networking/recipes-connectivity/ifplugd/files/ifplugd.conf creat=
e mode
> 100644 meta-networking/recipes-connectivity/ifplugd/ifplugd_0.28.bb
>=20
> diff --git a/meta-networking/recipes-connectivity/ifplugd/files/ifplu=
gd.conf
> b/meta-networking/recipes-connectivity/ifplugd/files/ifplugd.conf new=
 file
> mode 100644
> index 0000000..1e0f83a
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/ifplugd/files/ifplugd.conf=

> @@ -0,0 +1,42 @@
> +# -*-sh-*-
> +# $Id: ifplugd.conf 43 2003-09-13 11:25:11Z lennart $
> +
> +# This file is part of ifplugd.
> +#
> +# ifplugd is free software; you can redistribute it and/or modify it=
 under
> +# the terms of the GNU General Public License as published by the Fr=
ee
> +# Software Foundation; either version 2 of the License, or (at your
> +# option) any later version.
> +#
> +# ifplugd is distributed in the hope that it will be useful, but WIT=
HOUT
> +# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY=
 or
> +# FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public Licen=
se
> +# for more details.
> +#
> +# You should have received a copy of the GNU General Public License
> +# along with ifplugd; if not, write to the Free Software Foundation,=

> +# Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.
> +
> +# ifplugd configuration file
> +
> +# Please note that this is a bourne shell fragment sourced by the
> +# init script of ifplugd.
> +
> +# Specify the interfaces to control here, separated by spaces.
> +# Ifplugd processes will be started for each of these interfaces whe=
n
> +# the ifplugd init script is called with the "start" argument. You m=
ay
> +# use the magic string "auto" to make the init script start or stop
> +# ifplugd processes for ALL eth and wlan interfaces that are availab=
le
> +# according to /proc/net/dev. Note that the list of interfaces
> +# appearing in /proc/net/dev may depend on which kernel modules you
> +# have loaded.
> +INTERFACES=3D"eth0"
> +
> +# Additional parameters for ifplugd.
> +# (Run "ifplugd -h" for further information.)
> +ARGS=3D"-fwI -u0 -d10"
> +
> +# Additional parameters for ifplugd for the specified interface.  No=
te
> +# that $ARGS is ignored, when a variable like this is set for an
> +# interface
> +#ARGS_wlan0=3D"-MwI -u5 -d5"
> diff --git a/meta-networking/recipes-connectivity/ifplugd/ifplugd_0.2=
8.bb
> b/meta-networking/recipes-connectivity/ifplugd/ifplugd_0.28.bb new fi=
le
> mode 100644
> index 0000000..340d5f4
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/ifplugd/ifplugd_0.28.bb
> @@ -0,0 +1,23 @@
> +DESCRIPTION =3D "Daemon for monitoring ethernet device link state"

Please use SUMMARY instead of DESCRIPTION of a

> +SRC_URI     =3D
> "http://0pointer.de/lennart/projects/ifplugd/ifplugd-0.28.tar.gz \ + =
     =20
>        file://ifplugd.conf"
> +DEPENDS     =3D "libdaemon"
> +LICENSE     =3D "GPLv2"

Please don't indent the values here. Also SRC_URI should be after DEPEN=
DS and=20
the license fields (before the SRC_URI checksums).

BTW, looking at the ifplugd recipe we have in OE-Classic, do we need th=
e=20
patches we had there?

http://cgit.openembedded.org/openembedded/tree/recipes/ifplugd

> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D94d55d512a9ba36caa9b7df07=
9bae19f"
> +
> +SRC_URI[md5sum] =3D "df6f4bab52f46ffd6eb1f5912d4ccee3"
> +SRC_URI[sha256sum] =3D
> "474754ac4ab32d738cbf2a4a3e87ee0a2c71b9048a38bdcd7df1e4f9fd6541f0" +
> +EXTRA_OECONF_append =3D "--disable-lynx"
> +
> +
> +INITSCRIPT_PACKAGES =3D "${PN}"
> +INITSCRIPT_NAME_${PN} =3D "${PN}"
> +INITSCRIPT_PARAMS_${PN} =3D "defaults 90"
> +
> +do_install_append() {
> +=09install -m 644 ${WORKDIR}/ifplugd.conf ${D}${sysconfdir}/ifplugd/=

> +}

Again, referring to the ifplugd recipe from OE-Classic we probably need=
 a=20
CONFFILES line to point to the conf file you're installing.

> +inherit autotools update-rc.d

Typically the inherit line should be higher than this.

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre

