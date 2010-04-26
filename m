Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <matgnt@gmail.com>) id 1O6X6F-0001RU-EB
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Apr 2010 00:48:24 +0200
Received: by fxm11 with SMTP id 11so152149fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Apr 2010 15:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=kDtc0eR7X65PaUzm7WDmXlpavdHi4d5kUN7YI/Yh5LE=;
	b=YaHyS2+Y6bqkM5kI6L6h0DyAHa9hae0kk5C28RDkgl0LbwS4tQCYUHxLZ4O/hoAbct
	9Yj/I2iuoicTraRsYrC/13/e7skc+2024L6LDC9DN8C34+JDi8/MydJbz7d4HcJFHi//
	5HEJ00e9LEXTy1tDVSx76d3vbKXlc6xGm3O6c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=LfGeKv45kXNeOEkIV7YajjfMovDwaYiLg8/cPr9+Qb8WBEbMjhXSWzYC+3DGAACkUe
	v3VsyzaybjW60WbeTG4/+h7W2EcAtsbXFbg75VFq/8CrqxIE6+Vus/ioWVeegJJYZAUE
	pGNptAyh3bB/jChkDFkNTytuVyfXygEO2AXW4=
Received: by 10.87.67.8 with SMTP id u8mr3508522fgk.9.1272321883691;
	Mon, 26 Apr 2010 15:44:43 -0700 (PDT)
Received: from localhost.localdomain (z0701.wist.uni-linz.ac.at
	[193.171.42.194])
	by mx.google.com with ESMTPS id e20sm4047987fga.16.2010.04.26.15.44.43
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 26 Apr 2010 15:44:43 -0700 (PDT)
From: =?utf-8?q?Matthias=20G=C3=BCnther?= <matgnt@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Apr 2010 00:41:39 +0200
Message-Id: <1272321699-5405-3-git-send-email-matgnt@gmail.com>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <1272321699-5405-2-git-send-email-matgnt@gmail.com>
References: <1272321699-5405-1-git-send-email-matgnt@gmail.com>
	<1272321699-5405-2-git-send-email-matgnt@gmail.com>
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: matgnt@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH v2 3/3] topas910: linux_2.6.26 fix line break
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
X-List-Received-Date: Mon, 26 Apr 2010 22:48:24 -0000

---
 recipes/linux/linux_2.6.26.bb |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/recipes/linux/linux_2.6.26.bb b/recipes/linux/linux_2.6.26.bb
index 8eccea3..4c66c11 100644
--- a/recipes/linux/linux_2.6.26.bb
+++ b/recipes/linux/linux_2.6.26.bb
@@ -1,6 +1,6 @@
 require linux.inc
 
-PR = "r10"
+PR = "r11"
 
 # Mark archs/machines that this kernel supports
 DEFAULT_PREFERENCE = "-1"
@@ -37,7 +37,9 @@ SRC_URI_append_mpc8313e-rdb = "\
 	file://mpc8313e-rdb-eth-fixed.patch;patch=1 \
 	"
 
-SRC_URI_append_topas910 = "http://www.bplan-gmbh.org/data/toshiba/topas/linux/2.6.26.5/patch_2.6.26.5_topas910.bz2;patch=1;name=topaspatch"
+SRC_URI_append_topas910 = " \
+	http://www.bplan-gmbh.org/data/toshiba/topas/linux/2.6.26.5/patch_2.6.26.5_topas910.bz2;patch=1;name=topaspatch \
+	"
 
 # see http://bugzilla.kernel.org/show_bug.cgi?id=11143
 do_install_append() {
-- 
1.6.3.3



