Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 5773D7F9BB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2020 09:29:24 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,322,1574092800"; d="scan'208";a="81889291"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 Jan 2020 17:29:25 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 9FFB24CE20E7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2020 17:20:17 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Wed, 15 Jan 2020 17:29:22 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 15 Jan 2020 17:29:32 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 15 Jan 2020 05:12:27 -0800
Message-ID: <1579093951-77460-12-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1579093951-77460-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1579093951-77460-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 9FFB24CE20E7.A46E8
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python][PATCH] python-javaobj-py3: upgrade 0.3.0 -> 0.4.0.1
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
X-List-Received-Date: Wed, 15 Jan 2020 09:29:24 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-javaobj-py3.inc    | 4 ++--
 ...hon-javaobj-py3_0.3.0.bb => python-javaobj-py3_0.4.0.1.bb} | 0
 ...n3-javaobj-py3_0.3.0.bb => python3-javaobj-py3_0.4.0.1.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-javaobj-py3_0.3.0.bb => python-javaobj-py3_0.4.0.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-javaobj-py3_0.3.0.bb => python3-javaobj-py3_0.4.0.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-javaobj-py3.inc b/meta-python/recipes-devtools/python/python-javaobj-py3.inc
index b10f00bba..e667057bc 100644
--- a/meta-python/recipes-devtools/python/python-javaobj-py3.inc
+++ b/meta-python/recipes-devtools/python/python-javaobj-py3.inc
@@ -7,8 +7,8 @@ HOMEPAGE = "https://github.com/tcalmant/python-javaobj"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://setup.py;beginline=15;endline=27;md5=af9ce26ac2de1b7436eb08c9308b4a1e"
 
-SRC_URI[md5sum] = "1c6189a0d9aef51d74bfc52cd2953991"
-SRC_URI[sha256sum] = "a57469e4f0d0eeba7482ad9839595db6e99ca4ac6630a4c8064dda75a2182549"
+SRC_URI[md5sum] = "352fe0df9336b8699ad0799ef152da6b"
+SRC_URI[sha256sum] = "18c44cfaa214813784a823432b4ab9829c9626b2b00072011627b4008b0067cd"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-javaobj-py3_0.3.0.bb b/meta-python/recipes-devtools/python/python-javaobj-py3_0.4.0.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-javaobj-py3_0.3.0.bb
rename to meta-python/recipes-devtools/python/python-javaobj-py3_0.4.0.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-javaobj-py3_0.3.0.bb b/meta-python/recipes-devtools/python/python3-javaobj-py3_0.4.0.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-javaobj-py3_0.3.0.bb
rename to meta-python/recipes-devtools/python/python3-javaobj-py3_0.4.0.1.bb
-- 
2.17.1




