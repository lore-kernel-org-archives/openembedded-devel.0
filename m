Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0CD6CAC5AE
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 20:04:30 +0000 (UTC)
Received: from outbound6.mail.transip.nl (outbound6.mail.transip.nl [136.144.136.128])
 by mx.groups.io with SMTP id smtpd.web10.23527.1758743171208123566
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Sep 2025 12:46:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@myspectrum.nl header.s=transip-a header.b=CmcwX/nq;
 spf=pass (domain: myspectrum.nl, ip: 136.144.136.128, mailfrom: jeroen@myspectrum.nl)
Received: from submission9.mail.transip.nl (unknown [10.103.8.160])
	by outbound6.mail.transip.nl (Postfix) with ESMTP id 4cX6m10ZWlzwLHdR;
	Wed, 24 Sep 2025 21:46:09 +0200 (CEST)
Received: from yellow.myspectrum.nl (unknown [IPv6:2a01:7c8:bb0c:45:5054:ff:fe01:854])
	by submission9.mail.transip.nl (Postfix) with ESMTPSA id 4cX6lz6p5Xz2npcCB;
	Wed, 24 Sep 2025 21:46:07 +0200 (CEST)
Received: from yellow.myspectrum.nl (82-75-103-118.cable.dynamic.v4.ziggo.nl [82.75.103.118])
	(Authenticated sender: sendmail@myspectrum.nl)
	by yellow.myspectrum.nl (Postfix) with ESMTPSA id 44A8F2007B;
	Wed, 24 Sep 2025 19:46:06 +0000 (UTC)
Authentication-Results: yellow.myspectrum.nl;
	auth=pass smtp.auth=sendmail@myspectrum.nl smtp.mailfrom=jeroen@myspectrum.nl
Received: by yellow.myspectrum.nl (sSMTP sendmail emulation); Wed, 24 Sep 2025 21:46:05 +0200
From: "Jeroen Hofstee" <jeroen@myspectrum.nl>
To: openembedded-devel@lists.openembedded.org
Cc: Shubham Pushpkar <spushpka@cisco.com>,
	Anuj Mittal <anuj.mittal@intel.com>,
	Jeroen Hofstee <jhofstee@victronenergy.com>
Subject: [walnascar][PATCH] cjson 1.7.18: Fix CVE-2025-57052
Date: Wed, 24 Sep 2025 21:45:49 +0200
Message-ID: <20250924194549.1753501-1-jeroen@myspectrum.nl>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Scanned-By: ClueGetter at submission9.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=myspectrum.nl; t=1758743168; h=from:subject:to:cc:date:
 mime-version; bh=GS7OhUHFc7mbql8HDXuUc149M2Vu7MkhpnePkqRl0Vw=;
 b=CmcwX/nqxDTftQOBxIcMphAGd4/8EVgUZQD/84CUsinRId288AAiRNPljD24RT+cNyiAX+
 EMRnKXr+oJN4CV4Qr6xewSmlIlZ0eGtOmcydXykdQxuiknC3QPPq92VuIzDucDzsFrLnfm
 MXvGDtKQ0tNUselL9blxh69ZOOoYpR1+sj0sgHpD8+RWBIc3X6DO5mq5kUttCA0xjvxGGf
 Z0I+aNmeoUjHa4UFmqB1yoUH2PUr89nhOwkjVcamFkK/0BDy8zW90nX/BvF3tkT6qx55iq
 1ul2bALUxjGhFOuQmhWjsX+0522jiAWDdpwNIfcZteW8A1GKjmQ+MWLpxsl4vw==
X-Report-Abuse-To: abuse@transip.nl
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 20:04:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119839

From: Shubham Pushpkar <spushpka@cisco.com>

Upstream Repository: https://github.com/DaveGamble/cJSON.git

Bug Details: https://nvd.nist.gov/vuln/detail/CVE-2025-57052
Type: Security Fix
CVE: CVE-2025-57052
Score: 9.8
Patch: https://github.com/DaveGamble/cJSON/commit/74e1ff4994aa

Signed-off-by: Shubham Pushpkar <spushpka@cisco.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
(cherry picked from commit d9e2cae64f4f7d7145c8389bc2406b5865d12893)
Signed-off-by: Jeroen Hofstee <jhofstee@victronenergy.com>
---
 .../cjson/cjson/CVE-2025-57052.patch          | 33 +++++++++++++++++++
 .../recipes-devtools/cjson/cjson_1.7.18.bb    |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/cjson/cjson/CVE-2025-57052.p=
atch

diff --git a/meta-oe/recipes-devtools/cjson/cjson/CVE-2025-57052.patch b/=
meta-oe/recipes-devtools/cjson/cjson/CVE-2025-57052.patch
new file mode 100644
index 0000000000..ed3d4a7eba
--- /dev/null
+++ b/meta-oe/recipes-devtools/cjson/cjson/CVE-2025-57052.patch
@@ -0,0 +1,33 @@
+From e53a1413304382d562176bed91609e00b4fcf87e Mon Sep 17 00:00:00 2001
+From: Lee <peteralfredlee@gmail.com>
+Date: Fri, 5 Sep 2025 14:53:20 +0800
+Subject: [PATCH] fix the incorrect check in decode_array_index_from_poin=
ter
+ (#957)
+
+this fixes CVE-2025-57052
+
+CVE: CVE-2025-57052
+Upstream-Status: Backport [https://github.com/DaveGamble/cJSON/commit/74=
e1ff4994aa]
+
+(cherry picked from commit 74e1ff4994aa4139126967f6d289b675b4b36fef)
+Signed-off-by: Shubham Pushpkar <spushpka@cisco.com>
+---
+ cJSON_Utils.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/cJSON_Utils.c b/cJSON_Utils.c
+index 63651df..8fa24f8 100644
+--- a/cJSON_Utils.c
++++ b/cJSON_Utils.c
+@@ -282,7 +282,7 @@ static cJSON_bool decode_array_index_from_pointer(co=
nst unsigned char * const po
+         return 0;
+     }
+=20
+-    for (position =3D 0; (pointer[position] >=3D '0') && (pointer[0] <=3D=
 '9'); position++)
++    for (position =3D 0; (pointer[position] >=3D '0') && (pointer[posit=
ion] <=3D '9'); position++)
+     {
+         parsed_index =3D (10 * parsed_index) + (size_t)(pointer[positio=
n] - '0');
+=20
+--=20
+2.44.1
+
diff --git a/meta-oe/recipes-devtools/cjson/cjson_1.7.18.bb b/meta-oe/rec=
ipes-devtools/cjson/cjson_1.7.18.bb
index bdeab3055c..67d536cf24 100644
--- a/meta-oe/recipes-devtools/cjson/cjson_1.7.18.bb
+++ b/meta-oe/recipes-devtools/cjson/cjson_1.7.18.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D218947f77e8cb8=
e2fa02918dc41c50d0"
=20
 SRC_URI =3D "git://github.com/DaveGamble/cJSON.git;branch=3Dmaster;proto=
col=3Dhttps \
            file://run-ptest \
+           file://CVE-2025-57052.patch \
          "
 SRCREV =3D "acc76239bee01d8e9c858ae2cab296704e52d916"
=20
--=20
2.43.0


