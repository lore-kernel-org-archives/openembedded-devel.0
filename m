Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E791BCA6017
	for <webhook@archiver.kernel.org>; Sat, 10 Oct 2026 07:50:42 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5364.1791618633867571420
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 10 Oct 2026 00:50:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=fqcqXuE/;
 spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd91.aul.t-online.de (fwd91.aul.t-online.de [10.223.144.117])
	by mailout03.t-online.de (Postfix) with SMTP id CEA77E24C
	for <openembedded-devel@lists.openembedded.org>; Sat, 10 Oct 2026 09:50:31 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.229.158]) by fwd91.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1xFRqg-4UT2hM0; Sat, 10 Oct 2026 09:50:30 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [blacksail][meta-gnome][PATCH 1/4] apache2: fix build with OpenSSL 4
Date: Sat, 10 Oct 2026 09:50:19 +0200
Message-ID: <20261010075022.1738748-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1791618630-FFFFD47D-EBF8A1BC/0/0 CLEAN NORMAL
X-TOI-MSGID: 298cbedb-3d1d-44a0-8def-09f14e71b829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1791618631; i=f_l_k@t-online.de;
	bh=dYAOIi34JOCdLZByVacyFy4Bbybd+nYQIthh0pCK6QQ=;
	h=From:To:Subject:Date;
	b=fqcqXuE/vkNFOBlNEWRdxy4GYz6ethIrP7AKrgWjk5Fm9eH5DiKSNzfcH7G3/2Gcn
	 /IFBaRByOy8J7Zcy9+iq4649VkTi5leM+kahCbLsStQyD3pU9zSKyIlQgu3oS3veOv
	 2vt0jsiGNNtqd9nZhnnwZLSYaS2arxohT9gvzjh/Hy90rI4yXvBd5pm4yfpVFP79kl
	 tCnXvmnv8i5KgAOouEg3ZPxpw/rhCDb56lUfN9BOMPiPzPylhBd5dhIZKOmy+BW/Wz
	 eekq3RMNQpxLF9xS1qDcEUdgwezzveM80kcrj3wo3QuKko73W3aVypZ4R6if2Hqswh
	 Bzndcaciu8Q9A==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 10 Oct 2026 07:50:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130715

ASN1_STRING is opaque in OpenSSL 4, so mod_md fails to compile in
md_ocsp.c. Backport the httpd 2.4.x commit that switches to the getter
functions. The fix is part of httpd 2.4.69, which master gets through the
upgrade.

Upstream-Status: Backport [https://github.com/apache/httpd/commit/6cd9ea8=
dcb5bf68a195e90578c7f05e12eba5468]

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...mod_md-Add-OpenSSL-4.0-compatibility.patch | 47 +++++++++++++++++++
 .../recipes-httpd/apache2/apache2_2.4.68.bb   |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta-webserver/recipes-httpd/apache2/apache2/0011-mod=
_md-Add-OpenSSL-4.0-compatibility.patch

diff --git a/meta-webserver/recipes-httpd/apache2/apache2/0011-mod_md-Add=
-OpenSSL-4.0-compatibility.patch b/meta-webserver/recipes-httpd/apache2/a=
pache2/0011-mod_md-Add-OpenSSL-4.0-compatibility.patch
new file mode 100644
index 0000000000..ee127681ec
--- /dev/null
+++ b/meta-webserver/recipes-httpd/apache2/apache2/0011-mod_md-Add-OpenSS=
L-4.0-compatibility.patch
@@ -0,0 +1,47 @@
+From 6cd9ea8dcb5bf68a195e90578c7f05e12eba5468 Mon Sep 17 00:00:00 2001
+From: Rainer Jung <rjung@apache.org>
+Date: Wed, 17 Jun 2026 09:48:52 +0000
+Subject: [PATCH] mod_md: Add OpenSSL 4.0 compatibility
+
+* Use getters instead of direct member access.
+
+* Struct was made opaque in OpenSSL 4. Getters exist since OpenSSL 1.1.0=
.
+
+* Keep OpenSSL 1.0.2 compatibility.
+
+Merge from icing/md:
+https://github.com/icing/mod_md/commit/9fd90380db0722f0ccc14ff1c4da0ca21=
d4da75c
+
+Backport of r1935161 from trunk, [mod_md CTR]
+
+
+Upstream-Status: Backport [https://github.com/apache/httpd/commit/6cd9ea=
8dcb5bf68a195e90578c7f05e12eba5468]
+---
+diff --git a/modules/md/md_ocsp.c b/modules/md/md_ocsp.c
+index aee799a7b39..2e7f14dff31 100644
+--- a/modules/md/md_ocsp.c
++++ b/modules/md/md_ocsp.c
+@@ -533,13 +533,23 @@ static const char *certid_summary(const OCSP_CERTI=
D *certid, apr_pool_t *p)
+     serial =3D issuer =3D key =3D "???";
+     OCSP_id_get0_info(&aname_hash, &amd_nid, &akey_hash, &aserial, (OCS=
P_CERTID*)certid);
+     if (aname_hash) {
++#if OPENSSL_VERSION_NUMBER < 0x10100000L
+         data.len =3D (apr_size_t)aname_hash->length;
+         data.data =3D (const char*)aname_hash->data;
++#else
++        data.len =3D (apr_size_t)ASN1_STRING_length(aname_hash);
++        data.data =3D (const char*)ASN1_STRING_get0_data(aname_hash);
++#endif
+         md_data_to_hex(&issuer, 0, p, &data);
+     }
+     if (akey_hash) {
++#if OPENSSL_VERSION_NUMBER < 0x10100000L
+         data.len =3D (apr_size_t)akey_hash->length;
+         data.data =3D (const char*)akey_hash->data;
++#else
++        data.len =3D (apr_size_t)ASN1_STRING_length(akey_hash);
++        data.data =3D (const char*)ASN1_STRING_get0_data(akey_hash);
++#endif
+         md_data_to_hex(&key, 0, p, &data);
+     }
+     if (aserial) {
diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.68.bb b/met=
a-webserver/recipes-httpd/apache2/apache2_2.4.68.bb
index dc8c0df12d..f178007ab7 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.68.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.68.bb
@@ -16,6 +16,7 @@ SRC_URI =3D "${APACHE_MIRROR}/httpd/httpd-${PV}.tar.bz2=
 \
            file://0008-Fix-perl-install-directory-to-usr-bin.patch \
            file://0009-support-apxs.in-force-destdir-to-be-empty-string.=
patch \
            file://0001-make_exports.awk-not-expose-the-path.patch \
+           file://0011-mod_md-Add-OpenSSL-4.0-compatibility.patch \
           "
=20
 SRC_URI:append:class-target =3D " \
--=20
2.55.0


