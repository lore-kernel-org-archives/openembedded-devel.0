Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 4CACA60BC9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Mar 2020 02:34:17 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,562,1574092800"; d="scan'208";a="86439270"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 17 Mar 2020 10:34:18 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 1C06050A9981
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Mar 2020 10:24:14 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
	G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP
	Server (TLS) id 15.0.1497.2; Tue, 17 Mar 2020 10:34:16 +0800
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Tue, 17 Mar 2020 10:34:16 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 17 Mar 2020 10:36:42 +0800
Message-ID: <20200317023642.20042-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 1C06050A9981.A4DB4
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe] [PATCH] glade: upgrade 3.22.1 -> 3.22.2
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
X-List-Received-Date: Tue, 17 Mar 2020 02:34:18 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../glade/{glade_3.22.1.bb => glade_3.22.2.bb}                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/glade/{glade_3.22.1.bb => glade_3.22.2.bb} (87%)

diff --git a/meta-oe/recipes-devtools/glade/glade_3.22.1.bb b/meta-oe/recipes-devtools/glade/glade_3.22.2.bb
similarity index 87%
rename from meta-oe/recipes-devtools/glade/glade_3.22.1.bb
rename to meta-oe/recipes-devtools/glade/glade_3.22.2.bb
index 01decabea..3d539b232 100644
--- a/meta-oe/recipes-devtools/glade/glade_3.22.1.bb
+++ b/meta-oe/recipes-devtools/glade/glade_3.22.2.bb
@@ -16,8 +16,8 @@ REQUIRED_DISTRO_FEATURES = "x11"
 SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/glade/3.22/glade-${PV}.tar.xz \
            file://remove-yelp-help-rules-var.patch \
           "
-SRC_URI[md5sum] = "226802cf3b06861240524805aa6fe6ff"
-SRC_URI[sha256sum] = "dff89a2ef2eaf000ff2a46979978d03cb9202cb04668e01d0ea5c5bb5547e39a"
+SRC_URI[md5sum] = "c074fa378c8f1ad80d20133c4ae6f42d"
+SRC_URI[sha256sum] = "edefa6eb24b4d15bd52589121dc109bc08c286157c41288deb74dd9cc3f26a21"
 
 EXTRA_OECONF += "--disable-man-pages"
 
-- 
2.20.1




