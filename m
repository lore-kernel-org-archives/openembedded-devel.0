Received: from mail-ey0-f173.google.com ([209.85.215.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tasskjapp@gmail.com>) id 1QyfdR-0000G1-Pj
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Aug 2011 09:54:57 +0200
Received: by eyb7 with SMTP id 7so335687eyb.18
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Aug 2011 00:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=EPsjv9fbI9vQmeVq332900zLt46YIiMbiWjYp5HBXxE=;
	b=VD9vCQyZWJupzIOe2yF0YanmBO34WiAvjJvbk/jbZpgk0mVmPy2ZZw5rtlFtteSE12
	6zgBlTfSOrwn54Yw3LoN3FlZHOpF43SmsKLZX2UXI5oNFYUhiHZsAC26O1k7xg13slkg
	etpukhiz+OYIBXkK/4HtXVkWH5yPXfDLGVzi0=
Received: by 10.213.108.129 with SMTP id f1mr49027ebp.137.1314777003375;
	Wed, 31 Aug 2011 00:50:03 -0700 (PDT)
Received: from localhost.localdomain (147.84-49-231.nextgentel.com
	[84.49.231.147])
	by mx.google.com with ESMTPS id w9sm4365058eej.19.2011.08.31.00.50.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 31 Aug 2011 00:50:02 -0700 (PDT)
From: Tasslehoff Kjappfot <tasskjapp@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 31 Aug 2011 09:49:53 +0200
Message-Id: <1314776993-9258-1-git-send-email-tasskjapp@gmail.com>
X-Mailer: git-send-email 1.7.6
Cc: Tasslehoff Kjappfot <tasskjapp@gmail.com>
Subject: [PATCH] Removed patch that prevented board from waking after suspend
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 31 Aug 2011 07:54:57 -0000


Signed-off-by: Tasslehoff Kjappfot <tasskjapp@gmail.com>
---
 recipes/linux/linux-omap_2.6.39.bb |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/recipes/linux/linux-omap_2.6.39.bb b/recipes/linux/linux-omap_2.6.39.bb
index 8370e58..3880aa1 100644
--- a/recipes/linux/linux-omap_2.6.39.bb
+++ b/recipes/linux/linux-omap_2.6.39.bb
@@ -27,7 +27,6 @@ SRC_URI_append = " \
            file://sakoman/0010-Revert-omap2_mcspi-Flush-posted-writes.patch \
            file://sakoman/0011-Revert-omap_hsmmc-improve-interrupt-synchronisation.patch \
            file://sakoman/0012-Don-t-turn-SDIO-cards-off-to-save-power.-Doing-so-wi.patch \
-           file://sakoman/0013-Enable-the-use-of-SDIO-card-interrupts.patch \
            file://sakoman/0014-soc-codecs-Enable-audio-capture-by-default-for-twl40.patch \
            file://sakoman/0015-soc-codecs-twl4030-Turn-on-mic-bias-by-default.patch \
            file://sakoman/0016-RTC-add-support-for-backup-battery-recharge.patch \
-- 
1.7.6



