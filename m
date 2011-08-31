Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tasskjapp@gmail.com>) id 1QyosC-0001XM-1A
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Aug 2011 19:46:48 +0200
Received: by bkbzu17 with SMTP id zu17so1017871bkb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Aug 2011 10:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=JN6Fo1dIS7VWytGGTRdYHCY4AEKKV6XPwgrA8jFbRfY=;
	b=vjT9iJ0bDqPqKXtNKThbLT+jBwsi/ADbknIqbI3nCPJy9vlesbJBEu39H3s/zlY6EK
	J6X1aVfcyZ/YKnoi1EPCPgIU/2NMlXxsynZj5RY0ArgRfOBr1yPplbqbWGUynWtFApQt
	9y2t7hf/1Dn3/hsksa8Pzuvn+IfsMuEjzjCkw=
Received: by 10.204.157.16 with SMTP id z16mr396951bkw.162.1314812512850;
	Wed, 31 Aug 2011 10:41:52 -0700 (PDT)
Received: from localhost.localdomain (145.79-161-31.customer.lyse.net
	[79.161.31.145])
	by mx.google.com with ESMTPS id o20sm455701bku.43.2011.08.31.10.41.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 31 Aug 2011 10:41:51 -0700 (PDT)
From: Tasslehoff Kjappfot <tasskjapp@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 31 Aug 2011 19:41:19 +0200
Message-Id: <1314812479-17337-1-git-send-email-tasskjapp@gmail.com>
X-Mailer: git-send-email 1.7.4.4
Cc: , TasslehoffKjappfottasskjapp@gmail.com
Subject: [PATCH v2] linux-omap_2.6.39: remove patch that prevented board from resuming from suspend.
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
X-List-Received-Date: Wed, 31 Aug 2011 17:46:48 -0000

From: Tasslehoff Kjappfot tasskjapp@gmail.com>

Running on a board similar to Beagleboard C3 (but without NAND) I could not resume from suspend with the patch.
The console output when suspending was as expected, but neither console input nor a timer would wake the board.
Without the patch, everything works as it should.

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
1.7.4.4



