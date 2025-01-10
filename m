Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3D1DE77188
	for <webhook@archiver.kernel.org>; Fri, 10 Jan 2025 19:07:00 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web10.359.1736536018814221068
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Jan 2025 11:06:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=YrY7sA5B;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20250110190655c445fd824b2b33be7e-txkieq@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20250110190655c445fd824b2b33be7e
        for <openembedded-devel@lists.openembedded.org>;
        Fri, 10 Jan 2025 20:06:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=eEuZHzr1NFbkN7z+hIFph1vw4OAcPkC/JwixmzmqZjg=;
 b=YrY7sA5B3iAsbR0v4J+u155utEM5logWzwSsv8+RGRKXgVe4AvKN9Z76FY/YizfhjzRP0Q
 cgCStvSakdkC5djlt36YyJetDKN929FwKXplTtlNV00PStbDTeJAQ2BgkWocBWnVrLpMCXqn
 H16L0Cur4X6hoO9SifMIPhmdB7M6toI8pPsbxkCeFbZ33VKH0PkueqF58SWsb6ZRku/pmP3R
 Qg47FM1W+dTQjr56KRsDm6zovb0YP4tCMDrgeIAwg1XveSAHB9SRYiTlCXuZczVZ7x2HWC3v
 9mf3NnduNT5oa9d8XhS883u2PzwCNB2zj0m6vkbQvveRhlpgzAS1N2tw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 1/2] libtinyxml: patch CVE-2021-42260
Date: Fri, 10 Jan 2025 20:06:03 +0100
Message-Id: <20250110190604.772048-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 19:07:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114789

From: Peter Marko <peter.marko@siemens.com>

Take patch from Debian:
https://salsa.debian.org/debian/tinyxml/-/commit/38db99c12e43d7d6e349403ce4d39a706708603d

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../libtinyxml/CVE-2021-42260.patch           | 27 +++++++++++++++++++
 .../libtinyxml/libtinyxml_2.6.2.bb            |  4 ++-
 2 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/libtinyxml/libtinyxml/CVE-2021-42260.patch

diff --git a/meta-oe/recipes-support/libtinyxml/libtinyxml/CVE-2021-42260.patch b/meta-oe/recipes-support/libtinyxml/libtinyxml/CVE-2021-42260.patch
new file mode 100644
index 0000000000..8fc623744c
--- /dev/null
+++ b/meta-oe/recipes-support/libtinyxml/libtinyxml/CVE-2021-42260.patch
@@ -0,0 +1,27 @@
+Description: In stamp always advance the pointer if *p= 0xef
+ .
+ The current implementation only advanced if 0xef is followed
+ by two non-zero bytes. In case of malformed input (0xef should be
+ the start byte of a three byte character) this leads to an infinite
+ loop. (CVE-2021-42260)
+Origin: https://sourceforge.net/p/tinyxml/git/merge-requests/1/
+
+CVE: CVE-2021-42260
+Upstream-Status: Inactive-Upstream [lastrelease: 2011]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+
+--- a/tinyxmlparser.cpp
++++ b/tinyxmlparser.cpp
+@@ -274,6 +274,12 @@ void TiXmlParsingData::Stamp( const char* now, TiXmlEncoding encoding )
+ 						else
+ 							{ p +=3; ++col; }	// A normal character.
+ 					}
++					else
++					{
++						// TIXML_UTF_LEAD_0 (239) is the start character of a 3 byte sequence, so
++						// there is something wrong here. Just advance the pointer to evade infinite loops
++						++p;
++					}
+ 				}
+ 				else
+ 				{
diff --git a/meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb b/meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb
index 0719ba5fd4..0d18dd4a89 100644
--- a/meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb
+++ b/meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb
@@ -10,7 +10,9 @@ CVE_PRODUCT = "tinyxml"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/tinyxml/tinyxml_${@'${PV}'.replace('.', '_')}.tar.gz \
            file://enforce-use-stl.patch \
-           file://entity-encoding.patch"
+           file://entity-encoding.patch \
+           file://CVE-2021-42260.patch \
+"
 SRC_URI[sha256sum] = "15bdfdcec58a7da30adc87ac2b078e4417dbe5392f3afb719f9ba6d062645593"
 
 S = "${WORKDIR}/tinyxml"
-- 
2.30.2


