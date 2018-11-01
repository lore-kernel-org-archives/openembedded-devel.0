Return-Path: <samuel.nobs@taitradio.com>
Received: from smtp1.taitradio.net (unknown [202.37.96.23])
	by mail.openembedded.org (Postfix) with SMTP id 6B52C79D6E
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Nov 2018 00:19:20 +0000 (UTC)
Received: from acheron.taitradio.net (unknown [172.16.169.141])
	by smtp1.taitradio.net (Postfix) with ESMTP id 1E6981C002B;
	Thu,  1 Nov 2018 13:19:20 +1300 (NZDT)
From: Sam Nobs <samuel.nobs@taitradio.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Nov 2018 13:19:09 +1300
Message-Id: <20181101001909.31616-1-samuel.nobs@taitradio.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] uriparser: Allow native build
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
X-List-Received-Date: Thu, 01 Nov 2018 00:19:20 -0000

It is useful to be able to build a native version of uriparser
e.g. when you're building your entire distribution on native for
validation and testing purposes.

Signed-off-by: Sam Nobs <samuel.nobs@taitradio.com>
---
 meta-oe/recipes-support/uriparser/uriparser_0.8.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/uriparser/uriparser_0.8.4.bb b/meta-oe/recipes-support/uriparser/uriparser_0.8.4.bb
index b4be853dd..bfcdf8373 100644
--- a/meta-oe/recipes-support/uriparser/uriparser_0.8.4.bb
+++ b/meta-oe/recipes-support/uriparser/uriparser_0.8.4.bb
@@ -12,3 +12,5 @@ EXTRA_OECONF = "--disable-test --disable-doc"
 
 SRC_URI[md5sum] = "9aabdc3611546f553f4af372167de6d6"
 SRC_URI[sha256sum] = "ce7ccda4136974889231e8426a785e7578e66a6283009cfd13f1b24a5e657b23"
+
+BBCLASSEXTEND += "native"
-- 
2.17.1


