Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A64ECE7719C
	for <webhook@archiver.kernel.org>; Fri, 10 Jan 2025 19:07:10 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web11.360.1736536026564268741
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Jan 2025 11:07:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=kQg3/T2p;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-202501101907044d5f53f81d71ce6bed-ienizu@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 202501101907044d5f53f81d71ce6bed
        for <openembedded-devel@lists.openembedded.org>;
        Fri, 10 Jan 2025 20:07:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=1sKsuh2oS3gxq2fS2fhQhAEUteleBKg2+D3399fH72M=;
 b=kQg3/T2p3+iYoZLC5wPV1XvrDhvJyktljVMMLYUJWyfUjHJcnePFvZEDVcL/wmrzgkMs9F
 pSEoMeQwuQz8K6n3HAlYE8YlGX0hoWJ5Y1LpX0JHbe77bIGio7vYF7ranXOnVF0iNinrqKLg
 lG1L1fJMV5FNFs21HXQvd6j0mhH480JTc9sql66B/8TF9XZHBSLxDnRXYLCR856NBt27Upgg
 OG2ur2GdUed3v+Pte/rxic7zemiiFmQYAKOdJ7W1J9pxgfFVyGG69Dd4Z6qjFlIUblDKa/ab
 ky+xmURnFwdVB1+XNPRH7Nxvv8rYJo/eJV+3LRddkvlZk1GD9JBN/Zpw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 2/2] libtinyxml: patch CVE-2023-34194
Date: Fri, 10 Jan 2025 20:06:04 +0100
Message-Id: <20250110190604.772048-2-peter.marko@siemens.com>
In-Reply-To: <20250110190604.772048-1-peter.marko@siemens.com>
References: <20250110190604.772048-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 19:07:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114790

From: Peter Marko <peter.marko@siemens.com>

Take patch from Debian:
https://salsa.debian.org/debian/tinyxml/-/commit/2366e1f23d059d4c20c43c54176b6bd78d6a83fc

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../libtinyxml/CVE-2023-34194.patch           | 31 +++++++++++++++++++
 .../libtinyxml/libtinyxml_2.6.2.bb            |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta-oe/recipes-support/libtinyxml/libtinyxml/CVE-2023-34194.patch

diff --git a/meta-oe/recipes-support/libtinyxml/libtinyxml/CVE-2023-34194.patch b/meta-oe/recipes-support/libtinyxml/libtinyxml/CVE-2023-34194.patch
new file mode 100644
index 0000000000..a94806daad
--- /dev/null
+++ b/meta-oe/recipes-support/libtinyxml/libtinyxml/CVE-2023-34194.patch
@@ -0,0 +1,31 @@
+From: Guilhem Moulin <guilhem@debian.org>
+Date: Sat, 30 Dec 2023 14:15:54 +0100
+Subject: Avoid reachable assertion via crafted XML document with a '\0'
+ located after whitespace
+
+Bug: https://www.forescout.com/resources/sierra21-vulnerabilities
+Bug-Debian: https://bugs.debian.org/1059315
+Bug-Debian: https://security-tracker.debian.org/tracker/CVE-2023-34194
+
+CVE: CVE-2023-34194
+Upstream-Status: Inactive-Upstream [lastrelease: 2011]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ tinyxmlparser.cpp | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/tinyxmlparser.cpp b/tinyxmlparser.cpp
+index 8aa0dfa..1601962 100644
+--- a/tinyxmlparser.cpp
++++ b/tinyxmlparser.cpp
+@@ -1606,6 +1606,10 @@ const char* TiXmlDeclaration::Parse( const char* p, TiXmlParsingData* data, TiXm
+ 		}
+ 
+ 		p = SkipWhiteSpace( p, _encoding );
++		if ( !p || !*p )
++		{
++			break;
++		}
+ 		if ( StringEqual( p, "version", true, _encoding ) )
+ 		{
+ 			TiXmlAttribute attrib;
diff --git a/meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb b/meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb
index 0d18dd4a89..c99930f9e2 100644
--- a/meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb
+++ b/meta-oe/recipes-support/libtinyxml/libtinyxml_2.6.2.bb
@@ -12,6 +12,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/tinyxml/tinyxml_${@'${PV}'.replace('.', '_')}.t
            file://enforce-use-stl.patch \
            file://entity-encoding.patch \
            file://CVE-2021-42260.patch \
+           file://CVE-2023-34194.patch \
 "
 SRC_URI[sha256sum] = "15bdfdcec58a7da30adc87ac2b078e4417dbe5392f3afb719f9ba6d062645593"
 
-- 
2.30.2


