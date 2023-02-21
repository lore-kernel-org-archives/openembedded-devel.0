Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9C27C6379F
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 15:26:47 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web11.45431.1676993202052935974
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Feb 2023 07:26:42 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd78.dcpf.telekom.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout01.t-online.de (Postfix) with SMTP id C8BC516197
	for <openembedded-devel@lists.openembedded.org>; Tue, 21 Feb 2023 16:26:39 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.154.165.85]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pUUXP-2pTOyH0; Tue, 21 Feb 2023 16:26:39 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCH 1/2] appstream: update 0.15.5 -> 0.16.1
Date: Tue, 21 Feb 2023 16:26:29 +0100
Message-Id: <20230221152630.51167-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1676993199-DCB4C4E4-7BFD1172/0/0 CLEAN NORMAL
X-TOI-MSGID: 10ee1a69-801a-4864-a126-8398bf85c7c1
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Feb 2023 15:26:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101189

Version 0.16.1
~~~~~~~~~~~~~~
Released: 2023-02-10

Notes:
 * This is a bugfix-only release to primarily address an issue introduced
   in v0.15.6 that caused any clients using GIR bindings to crash after a=
 while.

Specification:
 * docs: Clarify the locations where catalog icons should be placed
 * spec: Expand documentation for <issue> elements
 * spec: Mention that <issues> is not part of the description
 * spec: Give some guidance about tone in release descriptions

Bugfixes:
 * Fix binding helper macro to behave correctly if a function is passed d=
irectly
 * Override-merge icons and provided items correctly
 * tests: Ensure locale is C.UTF-8 in pool tests

Miscellaneous:
 * release: Add sanity checks at beginning of each function

Contributors:
 Corentin No=C3=ABl, Matthias Klumpp, Pablo Correa G=C3=B3mez, Philip Wit=
hnall

Version 0.16.0
~~~~~~~~~~~~~~
Released: 2023-01-26

Features:
 * pool: Offer API to look up components by bundles
 * Bump format version to 0.16
 * Add new AsSystemInfo to read information about the current OS and devi=
ce
 * Add helper to get device names from a modalias
 * Implement support for external release metadata
 * Add validation support for external release metadata
 * compose: Validate external release metadata used for the catalog as we=
ll
 * its: Add rule for standalone release metadata
 * Add function to test if an AsRelation is satisfied on the current syst=
em
 * cli: Add command to list category contents
 * cli: Display colored checkmarks if possible
 * cli: Add new is-satisfied check to test relations from the command-lin=
e
 * cli: Add Markdown export support for metainfo-to-news
 * qt: Add support for SystemInfo & relation satisfication checks

Specification:
 * spec: Specify a metadata format for external release descriptions

Bugfixes:
 * Fix build with Clang 15
 * Give a better error message if trying to list too many categories
 * Adjust documentation of AsPool.get_components_by_categories to reflect=
 reality
 * validator: Validate merge component catalog data properly again

Miscellaneous:
 * Consistently name catalog metadata as such everywhere

Contributors:
 Aleix Pol, Matthias Klumpp, Rafael Fontenelle

Version 0.15.6
~~~~~~~~~~~~~~
Released: 2022-12-22

Features:
 * qt: Add API for ContentRating descriptions and ratingIds
 * Add some coccinelle semantic patches for common style issues
 * compose: Allow building without SVG support (for bootstrap only)
 * validator: Check for nodes that are text nodes even though they should=
n't be
 * validator: Extend validation for custom tag
 * validator: Improve Screenshot validation

Specification:
 * docs: Fix typos in <extends> documentation

Bugfixes:
 * validator: internat: Don't allow bandwidth_mbitps when value is offlin=
e-only
 * validator: Fix timestamp validation
 * validator: Allow release descriptions to start with punctuation
 * compose: Only add no-metainfo tag if component isn't already ignored
 * compose: Show better error in AscImage if compose was build without rs=
vg
 * Add a hack to clarify proper PtrArray element ownership for language b=
indings
 * qt: Port away from deprecated QDateTime API
 * qt: Deprecate Component::requires
 * qt: Fix warning
 * qt: Fix stringListToCharArray and Pool::componentsByCategories
 * qt: Port away from deprecated foreach
 * as-review: Add a typedef for property enums
 * as-review: Install properties at once rather than individually
 * as-review: Specify G_PARAM_STATIC_STRINGS for properties
 * as-review: Emit GObject::notify on property value changes
 * as-review: Add missing property for as_review_{get,set}_priority()
 * ascli: fix NULL pointer dereference

Miscellaneous:
 * docs: Split releases specification into its own section
 * style: Make code easier to read by using helper macros in all places
 * Make some compiler warnings fatal unconditionally

Contributors:
 Aleix Pol, JakobDev, Matthias Klumpp, Nicolas Fella, Philip Withnall,
 r-ricci, Will Thompson

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{appstream_0.15.5.bb =3D> appstream_0.16.1.bb}          | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/appstream/{appstream_0.15.5.bb =3D> appst=
ream_0.16.1.bb} (78%)

diff --git a/meta-oe/recipes-support/appstream/appstream_0.15.5.bb b/meta=
-oe/recipes-support/appstream/appstream_0.16.1.bb
similarity index 78%
rename from meta-oe/recipes-support/appstream/appstream_0.15.5.bb
rename to meta-oe/recipes-support/appstream/appstream_0.16.1.bb
index e8637b5ee..50d8cdb4c 100644
--- a/meta-oe/recipes-support/appstream/appstream_0.15.5.bb
+++ b/meta-oe/recipes-support/appstream/appstream_0.16.1.bb
@@ -11,7 +11,6 @@ DEPENDS =3D " \
     gperf-native \
     glib-2.0 \
     libyaml \
-    libstemmer \
     libxml2 \
     libxmlb \
     libxslt-native \
@@ -26,10 +25,15 @@ GIR_MESON_OPTION =3D ""
=20
 SRC_URI =3D "https://www.freedesktop.org/software/appstream/releases/App=
Stream-${PV}.tar.xz"
 SRC_URI:append:class-target =3D " file://0001-fix-crosscompile.patch"
-SRC_URI[sha256sum] =3D "cb15ed62cc2729683879a2dbf98c0a3267ea2b4d57bba6bc=
55e70a25500e04c2"
+SRC_URI[sha256sum] =3D "77e274e163db1f0a1bec8f4134b1d0f31e9c0a8c54cd37f7=
24a7d30a71cf41d2"
=20
 S =3D "${WORKDIR}/AppStream-${PV}"
=20
+PACKAGECONFIG ?=3D "stemming ${@bb.utils.filter('DISTRO_FEATURES', 'syst=
emd', d)}"
+
+PACKAGECONFIG[systemd] =3D "-Dsystemd=3Dtrue,-Dsystemd=3Dfalse,systemd"
+PACKAGECONFIG[stemming] =3D "-Dstemming=3Dtrue,-Dstemming=3Dfalse,libste=
mmer"
+
 FILES:${PN} +=3D "${datadir}"
=20
 EXTRA_OEMESON:class-target +=3D "--cross-file=3D${WORKDIR}/meson-${PN}.c=
ross"
--=20
2.34.1


