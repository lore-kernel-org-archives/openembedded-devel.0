Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 71CAC709B0
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Aug 2014 14:43:04 +0000 (UTC)
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1XF2Qj-0004Qz-56 from Joe_MacDonald@mentor.com ;
	Wed, 06 Aug 2014 07:43:05 -0700
Received: from SVR-ORW-FEM-04.mgc.mentorg.com ([147.34.97.41]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Wed, 6 Aug 2014 07:43:04 -0700
Received: from burninator (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.2.247.3; Wed, 6 Aug 2014
	07:43:04 -0700
Received: by burninator (Postfix, from userid 1000)	id AB9A4580DB1; Wed,  6
	Aug 2014 10:43:01 -0400 (EDT)
Date: Wed, 6 Aug 2014 10:43:01 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: akuster <akuster@mvista.com>
Message-ID: <20140806144257.GB14621@mentor.com>
References: <1407332271-32696-1-git-send-email-joe_macdonald@mentor.com>
	<53E2331C.1020008@mvista.com>
MIME-Version: 1.0
In-Reply-To: <53E2331C.1020008@mvista.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
X-OriginalArrivalTime: 06 Aug 2014 14:43:04.0965 (UTC)
	FILETIME=[BB168B50:01CFB184]
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] wireshark: update to latest stable version
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
X-List-Received-Date: Wed, 06 Aug 2014 14:43:07 -0000
X-Groupsio-MsgNum: 51455
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cmJC7u66zC7hs+87"
Content-Disposition: inline

--cmJC7u66zC7hs+87
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-networking][PATCH] wireshark: update to latest stable versi=
on] On 14.08.06 (Wed 06:52) akuster wrote:

> thanks.

Happy to help.

-J.

>=20
> - Armin
>=20
> On 08/06/2014 06:37 AM, Joe MacDonald wrote:
> >Version 1.12.0 is out, update the SRC_URI and associated variables.
> >
> >Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
> >---
> >  .../wireshark/va_list-can-t-be-NULL-on-ARM.patch   | 99 --------------=
--------
> >  ...wireshark_1.12.0-rc2.bb =3D> wireshark_1.12.0.bb} | 10 +--
> >  2 files changed, 5 insertions(+), 104 deletions(-)
> >  delete mode 100644 meta-networking/recipes-support/wireshark/wireshark=
/va_list-can-t-be-NULL-on-ARM.patch
> >  rename meta-networking/recipes-support/wireshark/{wireshark_1.12.0-rc2=
=2Ebb =3D> wireshark_1.12.0.bb} (81%)
> >
> >diff --git a/meta-networking/recipes-support/wireshark/wireshark/va_list=
-can-t-be-NULL-on-ARM.patch b/meta-networking/recipes-support/wireshark/wir=
eshark/va_list-can-t-be-NULL-on-ARM.patch
> >deleted file mode 100644
> >index 26a004c..0000000
> >--- a/meta-networking/recipes-support/wireshark/wireshark/va_list-can-t-=
be-NULL-on-ARM.patch
> >+++ /dev/null
> >@@ -1,99 +0,0 @@
> >-From 320c4f0d705a3ed94f710fb4b7b3eef897ff7bc4 Mon Sep 17 00:00:00 2001
> >-From: Steev Klimaszewski <threeway@gmail.com>
> >-Date: Thu, 19 Jun 2014 16:54:57 -0500
> >-Subject: [PATCH] va_list can't be NULL on ARM.
> >-
> >-Bug: 10209
> >-Change-Id: Ibd63a530450b7d2d4ec244e91c77caa731ba63aa
> >-Signed-off-by: Steev Klimaszewski <threeway@gmail.com>
> >-Signed-off-by: Balint Reczey <balint@balintreczey.hu>
> >-Reviewed-on: https://code.wireshark.org/review/2464
> >-Reviewed-by: Evan Huus <eapache@gmail.com>
> >-Reviewed-by: Michael Mann <mmann78@netscape.net>
> >-
> >-Upstream-Status: Backport
> >-The patch was imported from the wireshark git server
> >-  (https://code.wireshark.org/review/p/wireshark.git) as of commit id
> >-    320c4f0d705a3ed94f710fb4b7b3eef897ff7bc4.
> >-
> >-Signed-off-by: Armin Kuster <akuster@mvista.com>
> >-
> >----
> >- epan/expert.c | 36 +++++++++++++++++++++++++++++-------
> >- 1 file changed, 29 insertions(+), 7 deletions(-)
> >-
> >-diff --git a/epan/expert.c b/epan/expert.c
> >-index 46be838..a69566d 100644
> >---- a/epan/expert.c
> >-+++ b/epan/expert.c
> >-@@ -381,15 +381,26 @@ expert_set_info_vformat(packet_info *pinfo, proto=
_item *pi, int group, int sever
> >- 	tap_queue_packet(expert_tap, pinfo, ei);
> >- }
> >-
> >--void
> >--expert_add_info(packet_info *pinfo, proto_item *pi, expert_field *expi=
ndex)
> >-+/* Helper function for expert_add_info() to work around compiler's spe=
cial needs on ARM*/
> >-+static inline void
> >-+expert_add_info_internal(packet_info *pinfo, proto_item *pi, expert_fi=
eld *expindex, ...)
> >- {
> >-+	/* the va_list is ignored */
> >-+	va_list unused;
> >- 	expert_field_info* eiinfo;
> >-
> >- 	/* Look up the item */
> >- 	EXPERT_REGISTRAR_GET_NTH(expindex->ei, eiinfo);
> >-
> >--	expert_set_info_vformat(pinfo, pi, eiinfo->group, eiinfo->severity, *=
eiinfo->hf_info.p_id, FALSE, eiinfo->summary, NULL);
> >-+	va_start(unused, expindex);
> >-+	expert_set_info_vformat(pinfo, pi, eiinfo->group, eiinfo->severity, *=
eiinfo->hf_info.p_id, FALSE, eiinfo->summary, unused);
> >-+	va_end(unused);
> >-+}
> >-+
> >-+void
> >-+expert_add_info(packet_info *pinfo, proto_item *pi, expert_field *expi=
ndex)
> >-+{
> >-+	expert_add_info_internal(pinfo, pi, expindex);
> >- }
> >-
> >- void
> >-@@ -406,22 +417,33 @@ expert_add_info_format(packet_info *pinfo, proto_=
item *pi, expert_field *expinde
> >- 	va_end(ap);
> >- }
> >-
> >--proto_item *
> >--proto_tree_add_expert(proto_tree *tree, packet_info *pinfo, expert_fie=
ld* expindex,
> >--		tvbuff_t *tvb, gint start, gint length)
> >-+/* Helper function for expert_add_expert() to work around compiler's s=
pecial needs on ARM*/
> >-+static inline proto_item *
> >-+proto_tree_add_expert_internal(proto_tree *tree, packet_info *pinfo, e=
xpert_field* expindex,
> >-+		tvbuff_t *tvb, gint start, gint length, ...)
> >- {
> >- 	expert_field_info* eiinfo;
> >- 	proto_item *ti;
> >-+	va_list unused;
> >-
> >- 	/* Look up the item */
> >- 	EXPERT_REGISTRAR_GET_NTH(expindex->ei, eiinfo);
> >-
> >- 	ti =3D proto_tree_add_text(tree, tvb, start, length, "%s", eiinfo->su=
mmary);
> >--	expert_set_info_vformat(pinfo, ti, eiinfo->group, eiinfo->severity, *=
eiinfo->hf_info.p_id, FALSE, eiinfo->summary, NULL);
> >-+	va_start(unused, length);
> >-+	expert_set_info_vformat(pinfo, ti, eiinfo->group, eiinfo->severity, *=
eiinfo->hf_info.p_id, FALSE, eiinfo->summary, unused);
> >-+	va_end(unused);
> >- 	return ti;
> >- }
> >-
> >- proto_item *
> >-+proto_tree_add_expert(proto_tree *tree, packet_info *pinfo, expert_fie=
ld* expindex,
> >-+		tvbuff_t *tvb, gint start, gint length)
> >-+{
> >-+	return proto_tree_add_expert_internal(tree, pinfo, expindex, tvb, sta=
rt, length);
> >-+}
> >-+
> >-+proto_item *
> >- proto_tree_add_expert_format(proto_tree *tree, packet_info *pinfo, exp=
ert_field* expindex,
> >- 		tvbuff_t *tvb, gint start, gint length, const char *format, ...)
> >- {
> >---
> >-1.9.1
> >-
> >diff --git a/meta-networking/recipes-support/wireshark/wireshark_1.12.0-=
rc2.bb b/meta-networking/recipes-support/wireshark/wireshark_1.12.0.bb
> >similarity index 81%
> >rename from meta-networking/recipes-support/wireshark/wireshark_1.12.0-r=
c2.bb
> >rename to meta-networking/recipes-support/wireshark/wireshark_1.12.0.bb
> >index b965fdf..449ac47 100644
> >--- a/meta-networking/recipes-support/wireshark/wireshark_1.12.0-rc2.bb
> >+++ b/meta-networking/recipes-support/wireshark/wireshark_1.12.0.bb
> >@@ -26,12 +26,12 @@ PACKAGECONFIG[gcrypt] =3D "--with-gcrypt=3Dyes, --wi=
th-gcrypt=3Dno, libgcrypt"
> >  EXTRA_OECONF =3D "--with-qt=3Dno --enable-usr-local=3Dno -enable-tshar=
k"
> >
> >  LIC_FILES_CHKSUM =3D "file://README.linux;md5=3D631e077455b7972172eb14=
9195e065b0"
> >-SRC_URI =3D "http://wiresharkdownloads.riverbed.com/wireshark/src/wires=
hark-1.12.0-rc2.tar.bz2 \
> >-    file://va_list-can-t-be-NULL-on-ARM.patch \
> >+SRC_URI =3D " \
> >+    http://wiresharkdownloads.riverbed.com/wireshark/src/wireshark-1.12=
=2E0.tar.bz2 \
> >  "
> >-
> >-SRC_URI[md5sum] =3D "dc1149073066a29f91116c168558262e"
> >-SRC_URI[sha256sum]=3D "31009bb450126e9b12808267419f31016d14e6fde7b5e39c=
85ad37459908cffb"
> >+
> >+SRC_URI[md5sum] =3D "8dcfe451d8769901129809d2e19c1fb7"
> >+SRC_URI[sha256sum]=3D "0f59fea1c5b35de90af681067e49113fee0dd7a901750a97=
fa25f4256dbf13c7"
> >
> >  do_configure_prepend() {
> >      # force to use fallback
> >

--=20
-Joe MacDonald.
:wq

--cmJC7u66zC7hs+87
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJT4j7xAAoJEEn8ffcsOfaWRT8H/2G0ib2C4Rvpn3VhC2gqCNwZ
PTsi0B1M0K57Ea+ykjNn3vS57/iQy7q/gOUlawoOzijag13AwIy33NzYT5J5KFpt
Z1WdJB0YNzc/nvqssovHHP4nVhPVKRsW4pPGoOiKwqlOiPUkxyw2BQkLZ3wVWj9B
nbkCYXaqfujrTz8N2FBtG4isD0I9OKSy/dQlpcMysPDwAmmZVIy/u1BDP/R5Ob9w
dMWYZk/d+LlX7ViFcR2jXnHLPosP5dr5aqCIl49DyeDggKsPkwwSCBqDRWp9xWkC
HWb4BbPNUc73lmrF6t6IkSdxIxwHuwNmuj1EL8SZb6C/z2HcYrAk15uu2oe5EAA=
=UEBH
-----END PGP SIGNATURE-----

--cmJC7u66zC7hs+87--
