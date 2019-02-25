Return-Path: <jma1@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 03D746C17F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Feb 2019 08:18:34 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x1P8IZh4016496
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Feb 2019 00:18:35 -0800 (PST)
Received: from pek-lpggp2 (128.224.153.75) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.435.0;
	Mon, 25 Feb 2019 00:18:35 -0800
Received: by pek-lpggp2 (Postfix, from userid 20544)	id D6CA7720A72; Mon, 25
	Feb 2019 16:01:06 +0800 (CST)
From: Jiping Ma <jiping.ma2@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 25 Feb 2019 16:01:02 +0800
Message-ID: <1551081662-134703-2-git-send-email-jiping.ma2@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1551081662-134703-1-git-send-email-jiping.ma2@windriver.com>
References: <1551081662-134703-1-git-send-email-jiping.ma2@windriver.com>
MIME-Version: 1.0
Subject: [PATCH] lvm2: lvmdiskscan always print out "/dev/hdc: open failed: No medium found".
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
X-List-Received-Date: Mon, 25 Feb 2019 08:18:35 -0000
Content-Type: text/plain

commit [57bb46c5e7f8] introduce this issue.
"/dev/hdc: open failed: No medium found" will be print out
after run lvmdiskscan. change dev_open_readonly()
to dev_open_readonly_quiet() in fuction _dev_get_size_dev().

Signed-off-by: Jiping Ma <jiping.ma2@windriver.com>
---
 ...n-failed-No-medium-found-will-print-out-i.patch | 32 ++++++++++++++++++++++
 meta-oe/recipes-support/lvm2/lvm2_2.03.01.bb       |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta-oe/recipes-support/lvm2/lvm2/0001-dev-hdc-open-failed-No-medium-found-will-print-out-i.patch

diff --git a/meta-oe/recipes-support/lvm2/lvm2/0001-dev-hdc-open-failed-No-medium-found-will-print-out-i.patch b/meta-oe/recipes-support/lvm2/lvm2/0001-dev-hdc-open-failed-No-medium-found-will-print-out-i.patch
new file mode 100644
index 0000000..24d5b1b
--- /dev/null
+++ b/meta-oe/recipes-support/lvm2/lvm2/0001-dev-hdc-open-failed-No-medium-found-will-print-out-i.patch
@@ -0,0 +1,32 @@
+From 93c93e3b85492e58f9451841e6079d00c497efa4 Mon Sep 17 00:00:00 2001
+From: Jiping Ma <jiping.ma2@windriver.com>
+Date: Mon, 25 Feb 2019 13:29:12 +0800
+Subject: [PATCH] "/dev/hdc: open failed: No medium found" will print out in
+ lvmdiskscan.
+
+commit [57bb46c5e7f8] introduce this issue.
+"/dev/hdc: open failed: No medium found" will be print out
+after run lvmdiskscan. change dev_open_readonly()
+to dev_open_readonly_quiet() in fuction _dev_get_size_dev().
+
+Signed-off-by: Jiping Ma <jiping.ma2@windriver.com>
+---
+ lib/device/dev-io.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/device/dev-io.c b/lib/device/dev-io.c
+index dc95131..81a66b0 100644
+--- a/lib/device/dev-io.c
++++ b/lib/device/dev-io.c
+@@ -338,7 +338,7 @@ static int _dev_get_size_dev(struct device *dev, uint64_t *size)
+ 	}
+ 
+ 	if (fd <= 0) {
+-		if (!dev_open_readonly(dev))
++		if (!dev_open_readonly_quiet(dev))
+ 			return_0;
+ 		fd = dev_fd(dev);
+ 		do_close = 1;
+-- 
+1.9.1
+
diff --git a/meta-oe/recipes-support/lvm2/lvm2_2.03.01.bb b/meta-oe/recipes-support/lvm2/lvm2_2.03.01.bb
index c38c381..0df624b 100644
--- a/meta-oe/recipes-support/lvm2/lvm2_2.03.01.bb
+++ b/meta-oe/recipes-support/lvm2/lvm2_2.03.01.bb
@@ -4,6 +4,7 @@ SRCREV = "913c28917e62577a2ef67152b2e5159237503dda"
 
 SRC_URI += "file://0001-explicitly-do-not-install-libdm.patch \
             file://0001-lvm2-monitoring-service-shouldn-t-refer-to-lvmetad.patch \
+	    file://0001-dev-hdc-open-failed-No-medium-found-will-print-out-i.patch \
            "
 
 DEPENDS += "autoconf-archive-native"
-- 
1.9.1


