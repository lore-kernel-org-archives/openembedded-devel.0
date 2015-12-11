Return-Path: <fan.xin@jp.fujitsu.com>
Received: from mgwym01.jp.fujitsu.com (mgwym01.jp.fujitsu.com [211.128.242.40])
	by mail.openembedded.org (Postfix) with ESMTP id 6291665CBF
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Dec 2015 06:24:36 +0000 (UTC)
Received: from yt-mxoi1.gw.nic.fujitsu.com (unknown [192.168.229.67]) by
	mgwym01.jp.fujitsu.com with smtp
	id 3963_48ed_17cb4708_e0d5_4aa4_a4f8_c114425dfbed;
	Fri, 11 Dec 2015 15:24:32 +0900
Received: from g01jpfmpwkw03.exch.g01.fujitsu.local
	(g01jpfmpwkw03.exch.g01.fujitsu.local [10.0.193.57])
	by yt-mxoi1.gw.nic.fujitsu.com (Postfix) with ESMTP id 52662AC03C9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Dec 2015 15:24:31 +0900 (JST)
Received: from g01jpexchkw36.g01.fujitsu.local (unknown [10.0.193.4])
	by g01jpfmpwkw03.exch.g01.fujitsu.local (Postfix) with ESMTP id
	8C6EBBD64F7 for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Dec 2015 15:24:30 +0900 (JST)
Received: from localhost.localdomain (10.24.19.99) by
	g01jpexchkw36.g01.fujitsu.local (10.0.193.54) with Microsoft SMTP
	Server id 14.3.266.1; Fri, 11 Dec 2015 15:24:30 +0900
From: Fan Xin <fan.xin@jp.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 11 Dec 2015 15:25:35 +0900
Message-ID: <1449815135-28537-1-git-send-email-fan.xin@jp.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-TM-AS-MML: disable
Cc: Fan Xin <fan.xin@jp.fujitsu.com>
Subject: [PATCH] curl: upgrade to 7.45
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
X-List-Received-Date: Fri, 11 Dec 2015 06:24:37 -0000
Content-Type: text/plain

Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
---
 meta/recipes-support/curl/{curl_7.44.0.bb => curl_7.45.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/curl/{curl_7.44.0.bb => curl_7.45.0.bb} (93%)

diff --git a/meta/recipes-support/curl/curl_7.44.0.bb b/meta/recipes-support/curl/curl_7.45.0.bb
similarity index 93%
rename from meta/recipes-support/curl/curl_7.44.0.bb
rename to meta/recipes-support/curl/curl_7.45.0.bb
index f6d350e..a7ed778 100644
--- a/meta/recipes-support/curl/curl_7.44.0.bb
+++ b/meta/recipes-support/curl/curl_7.45.0.bb
@@ -14,8 +14,8 @@ SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
 #
 SRC_URI += " file://configure_ac.patch"
 
-SRC_URI[md5sum] = "6b952ca00e5473b16a11f05f06aa8dae"
-SRC_URI[sha256sum] = "1e2541bae6582bb697c0fbae49e1d3e6fad5d05d5aa80dbd6f072e0a44341814"
+SRC_URI[md5sum] = "62c1a352b28558f25ba6209214beadc8"
+SRC_URI[sha256sum] = "65154e66b9f8a442b57c436904639507b4ac37ec13d6f8a48248f1b4012b98ea"
 
 inherit autotools pkgconfig binconfig multilib_header
 
-- 
1.8.4.2


