Return-Path: <lists@philipp-wagner.com>
Received: from turboconrad.planet-school.de (mail.planet-school.de
	[194.116.187.5])
	by mail.openembedded.org (Postfix) with ESMTP id 9AE4261017
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Sep 2013 13:22:29 +0000 (UTC)
Received: from turboconrad.planet-school.de (srv004.service.ps-server.net
	[194.116.186.79])
	by turboconrad.planet-school.de (Postfix) with ESMTP id 22A8DB6A06E
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Sep 2013 15:22:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	srv004.service.ps-server.net
X-Spam-Level: 
X-Spam-Status: No, score=-101.0 required=5.0 tests=ALL_TRUSTED, LOCAL_USER_RULE
	autolearn=unavailable version=3.3.2
Received: from poweramy.site (ppp-93-104-169-145.dynamic.mnet-online.de
	[93.104.169.145])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: mail@philipp-wagner.com)
	by turboconrad.planet-school.de (Postfix) with ESMTPSA id EEE66B6A068
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Sep 2013 15:22:27 +0200 (CEST)
Message-ID: <5235B492.6070400@philipp-wagner.com>
Date: Sun, 15 Sep 2013 15:22:26 +0200
From: Philipp Wagner <lists@philipp-wagner.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: [meta-oe][PATCH] Update iw to 3.11
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
X-List-Received-Date: Sun, 15 Sep 2013 13:22:30 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

this updates iw to the most recent version 3.11.

Signed-off-by: Philipp Wagner <mail@philipp-wagner.com>
---
diff --git a/meta-oe/recipes-connectivity/iw/iw_3.11.bb b/meta-oe/recipes-connectivity/iw/iw_3.11.bb
index a09339c..9152e7a 100644
--- a/meta-oe/recipes-connectivity/iw/iw_3.11.bb
+++ b/meta-oe/recipes-connectivity/iw/iw_3.11.bb
@@ -9,12 +9,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=878618a5c4af25e9b93ef0be1a93f774"

 DEPENDS = "libnl pkgconfig"

-SRC_URI = "http://wireless.kernel.org/download/iw/${P}.tar.bz2 \
+SRC_URI = "http://www.kernel.org/pub/software/network/iw/${P}.tar.bz2 \
            file://0001-iw-version.sh-don-t-use-git-describe-for-versioning.patch \
 "

-SRC_URI[md5sum] = "1c18bfbbc8773629e5e8ac733a39540c"
-SRC_URI[sha256sum] = "df11036ac11df31f44083da962a6e9c74bdea7c01c596c4b5840f948cdb6c857"
+SRC_URI[md5sum] = "e633cf7c875c7d8b547abafc0d95f6c4"
+SRC_URI[sha256sum] = "09348d4f7371fad00c07cfb67b9e34f24403cbd9361f9634cfb4dff9cdd40139"

 EXTRA_OEMAKE = ""

