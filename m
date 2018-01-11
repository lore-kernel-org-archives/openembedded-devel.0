Return-Path: <Joe_MacDonald@mentor.com>
X-Greylist: delayed 2212 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 11 Jan 2018 16:38:18 UTC
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 38E54787CC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Jan 2018 16:38:18 +0000 (UTC)
Received: from svr-orw-mbx-01.mgc.mentorg.com ([147.34.90.201])
	by relay1.mentorg.com with esmtps (TLSv1.2:ECDHE-RSA-AES256-SHA384:256)
	id 1eZfIF-00071A-U7 from Joe_MacDonald@mentor.com ;
	Thu, 11 Jan 2018 08:01:27 -0800
Received: from svr-orw-mbx-04.mgc.mentorg.com (147.34.90.204) by
	svr-orw-mbx-01.mgc.mentorg.com (147.34.90.201) with Microsoft SMTP
	Server (TLS) id 15.0.1320.4; Thu, 11 Jan 2018 08:01:25 -0800
Received: from burninator.cal.mentorg.com (147.34.91.1) by
	svr-orw-mbx-04.mgc.mentorg.com (147.34.90.204) with Microsoft SMTP
	Server id
	15.0.1320.4 via Frontend Transport; Thu, 11 Jan 2018 08:01:25 -0800
Received: by burninator.cal.mentorg.com (Postfix, from userid 1000)
	id E609C5803B9; Thu, 11 Jan 2018 11:01:24 -0500 (EST)
Date: Thu, 11 Jan 2018 11:01:24 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: zhengrq <zhengrq.fnst@cn.fujitsu.com>
Message-ID: <20180111160124.72ae7ddph25t3d4m@mentor.com>
References: <1515322780-20975-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1515322780-20975-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-800 http://www.vim.org
User-Agent: NeoMutt/20170113 (1.7.2)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] lldpad: new add
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 11 Jan 2018 16:38:19 -0000
X-Groupsio-MsgNum: 70285
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="usybiwjl3mkzyemw"
Content-Disposition: inline

--usybiwjl3mkzyemw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[[oe] [meta-networking][PATCH] lldpad: new add] On 18.01.07 (Sun 18:59) zhe=
ngrq wrote:

> Add a new recipe lldpad_git.bb.
>=20
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>

Is this related to the lldpad tree we removed in 2015?  The code repos
are different but the description makes them sound like one in the same
animal.

If that's the case, please have a look at the discussion on the patch
set where we replaced lldpad with lldpd:

   https://patchwork.openembedded.org/patch/103267/

I'm not opposed to carrying two different implementations that do
essentially the same thing provided there's a good reason to and that
both are more-or-less well maintained, but I think we had a good reason
to drop the other one last time.  Please let me know what you think.

> ---
>  .../lldpad/lldpad/0001-fix-build-warnings.patch    | 94 ++++++++++++++++=
++++++
>  .../lldpad/0002-Change-CFLAGS-to-avoid-error.patch | 25 ++++++
>  .../recipes-daemons/lldpad/lldpad_git.bb           | 35 ++++++++
>  3 files changed, 154 insertions(+)
>  create mode 100644 meta-networking/recipes-daemons/lldpad/lldpad/0001-fi=
x-build-warnings.patch
>  create mode 100644 meta-networking/recipes-daemons/lldpad/lldpad/0002-Ch=
ange-CFLAGS-to-avoid-error.patch
>  create mode 100644 meta-networking/recipes-daemons/lldpad/lldpad_git.bb
>=20
> diff --git a/meta-networking/recipes-daemons/lldpad/lldpad/0001-fix-build=
-warnings.patch b/meta-networking/recipes-daemons/lldpad/lldpad/0001-fix-bu=
ild-warnings.patch
> new file mode 100644
> index 0000000..52c0978
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/lldpad/lldpad/0001-fix-build-warnin=
gs.patch
> @@ -0,0 +1,94 @@
> +From: Chris Leech <cleech@redhat.com>
> +Date: Wed, 17 Jun 2015 10:40:34 -0700
> +Subject: [PATCH] fix build warnings
> +

Please provide an upstream status on these.  I'm guessing backport for
the first and pending for the second, but it would be nice to have that
spelled out.

Thanks,
-J.

> +Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> +---
> + include/lldp_8021qaz.h | 6 ------
> + lldp/agent.c           | 5 +++++
> + lldp/agent.h           | 6 +++---
> + lldp_util.c            | 4 ++--
> + 4 files changed, 10 insertions(+), 11 deletions(-)
> +
> +diff --git a/include/lldp_8021qaz.h b/include/lldp_8021qaz.h
> +index 55353b8..09dee20 100644
> +--- a/include/lldp_8021qaz.h
> ++++ b/include/lldp_8021qaz.h
> +@@ -218,9 +218,6 @@ int ieee8021qaz_mod_app(struct app_tlv_head *head, i=
nt peer,
> + 			u8 prio, u8 sel, u16 proto, u32 ops);
> + int ieee8021qaz_app_sethw(char *ifname, struct app_tlv_head *head);
> +=20
> +-inline int get_prio_map(u32 prio_map, int tc);
> +-inline void set_prio_map(u32 *prio_map, u8 prio, int tc);
> +-
> + struct ieee8021qaz_tlvs *ieee8021qaz_data(const char *);
> +=20
> + int ieee8021qaz_tlvs_rxed(const char *ifname);
> +@@ -234,9 +231,6 @@ int ieee8021qaz_rchange(struct port *port, struct ll=
dp_agent *,
> + void ieee8021qaz_ifup(char *ifname, struct lldp_agent *);
> + void ieee8021qaz_ifdown(char *ifname, struct lldp_agent *);
> + u8 ieee8021qaz_mibDeleteObject(struct port *port, struct lldp_agent *);
> +-inline int ieee8021qaz_clif_cmd(void *data, struct sockaddr_un *from,
> +-				socklen_t fromlen, char *ibuf, int ilen,
> +-				char *rbuf);
> + int ieee8021qaz_check_operstate(void);
> + int get_dcbx_hw(const char *ifname, __u8 *dcbx);
> +=20
> +diff --git a/lldp/agent.c b/lldp/agent.c
> +index 4bc5394..45def9a 100644
> +--- a/lldp/agent.c
> ++++ b/lldp/agent.c
> +@@ -36,6 +36,11 @@
> + #include "lldp_mand_clif.h"
> + #include "lldp/agent.h"
> +=20
> ++/* IEEE 802.1AB-2009 - Table 7-1: group MAC addresses used by LLDP */
> ++const u8 nearest_bridge[ETH_ALEN] =3D {0x01,0x80,0xc2,0x00,0x00,0x0e};
> ++const u8 nearest_nontpmr_bridge[ETH_ALEN] =3D {0x01,0x80,0xc2,0x00,0x00=
,0x03};
> ++const u8 nearest_customer_bridge[ETH_ALEN] =3D {0x01,0x80,0xc2,0x00,0x0=
0,0x00};
> ++
> + static const u8 * agent_groupmacs[AGENT_MAX] =3D {
> + 	nearest_bridge,
> + 	nearest_nontpmr_bridge,
> +diff --git a/lldp/agent.h b/lldp/agent.h
> +index a54f72f..90da3e0 100644
> +--- a/lldp/agent.h
> ++++ b/lldp/agent.h
> +@@ -48,9 +48,9 @@ enum agent_type {
> + };
> +=20
> + /* IEEE 802.1AB-2009 - Table 7-1: group MAC addresses used by LLDP */
> +-static const u8 nearest_bridge[ETH_ALEN] =3D {0x01,0x80,0xc2,0x00,0x00,=
0x0e};
> +-static const u8 nearest_nontpmr_bridge[ETH_ALEN] =3D {0x01,0x80,0xc2,0x=
00,0x00,0x03};
> +-static const u8 nearest_customer_bridge[ETH_ALEN] =3D {0x01,0x80,0xc2,0=
x00,0x00,0x00};
> ++extern const u8 nearest_bridge[ETH_ALEN];
> ++extern const u8 nearest_nontpmr_bridge[ETH_ALEN];
> ++extern const u8 nearest_customer_bridge[ETH_ALEN];
> +=20
> + struct agenttimers {
> + /* Tx */
> +diff --git a/lldp_util.c b/lldp_util.c
> +index 754b0cd..304ddc5 100644
> +--- a/lldp_util.c
> ++++ b/lldp_util.c
> +@@ -1177,7 +1177,7 @@ int check_link_status(const char *ifname)
> + int get_arg_val_list(char *ibuf, int ilen, int *ioff,
> + 			    char **args, char **argvals)
> + {
> +-	u8 arglen;
> ++	u8 arglen =3D 0;
> + 	u16 argvalue_len;
> + 	int *arglens =3D NULL;
> + 	int *argvallens =3D NULL;
> +@@ -1245,7 +1245,7 @@ int get_arg_val_list(char *ibuf, int ilen, int *io=
ff,
> +=20
> + int get_arg_list(char *ibuf, int ilen, int *ioff, char **args)
> + {
> +-	u8 arglen;
> ++	u8 arglen =3D 0;
> + 	int *arglens =3D NULL;
> + 	int *p;
> + 	int numargs;
> +--=20
> +2.7.4
> +
> diff --git a/meta-networking/recipes-daemons/lldpad/lldpad/0002-Change-CF=
LAGS-to-avoid-error.patch b/meta-networking/recipes-daemons/lldpad/lldpad/0=
002-Change-CFLAGS-to-avoid-error.patch
> new file mode 100644
> index 0000000..5cb2a0a
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/lldpad/lldpad/0002-Change-CFLAGS-to=
-avoid-error.patch
> @@ -0,0 +1,25 @@
> +Subject: [PATCH] Change CFLAGS to avoid error
> +Fix compile error like: warning: this statement may fall
> + through [-Wimplicit-fallthrough=3D]
> +
> +Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> +---
> + Makefile.am | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/Makefile.am b/Makefile.am
> +index 4889d32..321bd7c 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -16,7 +16,7 @@ ACLOCAL_AMFLAGS =3D -I m4
> + parse_cli.o: CFLAGS+=3D-U_FORTIFY_SOURCE -Wno-error
> +=20
> + ## system requires a shared libconfig
> +-AM_CFLAGS =3D -Wall -Werror -Wextra -Wformat=3D2 $(LIBCONFIG_CFLAGS) $(=
LIBNL_CFLAGS)
> ++AM_CFLAGS =3D -Wall -Wno-error -Wextra -Wformat=3D2 $(LIBCONFIG_CFLAGS)=
 $(LIBNL_CFLAGS)
> + AM_LDFLAGS =3D $(LIBCONFIG_LIBS) $(LIBNL_LIBS)
> +=20
> + ## header files to be installed, for programs using the client interfac=
e to lldpad=20
> +--=20
> +2.7.4
> +
> diff --git a/meta-networking/recipes-daemons/lldpad/lldpad_git.bb b/meta-=
networking/recipes-daemons/lldpad/lldpad_git.bb
> new file mode 100644
> index 0000000..5203eb1
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/lldpad/lldpad_git.bb
> @@ -0,0 +1,35 @@
> +SUMMARY =3D "Intel LLDP Agent"
> +DESCRIPTION =3D "\
> +This package contains the Linux user space daemon and configuration tool=
 for \
> +Intel LLDP Agent with Enhanced Ethernet support for the Data Center."
> +
> +HOMEPAGE =3D "http://open-lldp.org/"
> +SECTION =3D "System Environment/Daemons"
> +LICENSE =3D "GPLv2"
> +
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8c2bc283e65df398ced5f5b747e78=
162"
> +DEPENDS =3D "libconfig libnl readline"
> +
> +SRC_URI =3D "git://open-lldp.org/open-lldp.git \
> +           file://0001-fix-build-warnings.patch \
> +           file://0002-Change-CFLAGS-to-avoid-error.patch \
> +          "
> +
> +SRCREV =3D "2b7e05cff2b461efd0fb3e6e73b1bb0a23a330c1"
> +
> +PV =3D "1.0.1+git${SRCPV}"
> +S =3D "${WORKDIR}/git"
> +
> +inherit autotools-brokensep pkgconfig systemd
> +
> +do_configure_prepend () {
> +        ${S}/bootstrap.sh
> +}
> +
> +do_install_append () {
> +    install -m 0755 -d ${D}${systemd_unitdir}
> +    mv ${D}${prefix}${systemd_unitdir}/* ${D}${systemd_unitdir}/
> +    rmdir ${D}${prefix}${systemd_unitdir}
> +}
> +
> +FILES_${PN} +=3D "${systemd_unitdir}"
> --=20
> 2.7.4
>=20
>=20
>=20
--=20
-Joe MacDonald.
:wq

--usybiwjl3mkzyemw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEkMd/b97HINT8/zEqSfx99yw59pYFAlpXilQACgkQSfx99yw5
9pbxMQgApXBDrhiOJdmXELrsd0ob1ehHhhRvVq8J0vhomtCkQHlTZAXnoM3lzu8W
CvHBUR0B6/Em6oaLcdTTi+3od3GuPI4ZfL7GbAbE2wudJsAeXx1U6iei001VHQL0
DPFYivHsxn+cRdubWA9LWHSUdG5oXym954R8Ojwxz5pjecuybQKwG+NjKbO+eaeB
O1NZNrVWpB5PLnjHyfUOHpaxjEUsINmP1fGtQ+a7SWL6K722kElMaSACU7XqEjVt
tKQo3UdS0xncNPfBEJ2uASSyVVpltGhXzbduJNQR6KAQCLV7UUUjG3QTp1nrYLYU
yjECdqrTxB3kt8B4ulpsB6wQhWAvQw==
=UKBq
-----END PGP SIGNATURE-----

--usybiwjl3mkzyemw--
