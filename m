Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 9305266101
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jun 2014 11:08:11 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id n15so3965020wiw.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jun 2014 04:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=oMttmSPZAOQ5etI+pruabM1/BKllT3sPLcgnE0gIpvg=;
	b=BxRQVb1eHPqVtB4xU62XVfWm7v//8zwKmtu2UYRs3J5k7lUSugAms7X7f73JLfa9Oe
	dsGf53CWCt/m9oimxgelQtItTbSSlgwsipJjcHszWeZ0IAYwYlBLQlaOVCmq270u94ES
	I3UgqqfdJ2DHDvzDtCx2sgYUUvBbnOa6cVv2rMFoGyBA4zQUs7JDG3kykVFgS06gkjiR
	8im3jrDT1s4fg612RgWdQxLan+5p6X2RW3U9wSQi4NZZ+KvRMiQHbQp+d5gtirkSFZ7r
	/4MNIFk7BFA939f02a503VNDEGFrcpgbRGT4oamQ5WTGIJ/Sfy5y7zy+vd6j8SD/rx6Q
	X2Hw==
X-Received: by 10.194.89.40 with SMTP id bl8mr26216101wjb.90.1403521688169;
	Mon, 23 Jun 2014 04:08:08 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	wv8sm19863060wjb.1.2014.06.23.04.08.07 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 23 Jun 2014 04:08:07 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 23 Jun 2014 13:08:06 +0200
Message-Id: <1403521686-16377-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
Subject: [meta-browser][PATCH] firefox-l10n: Drop runtime dependency on TUNE_PKGARCH firefox and keep allarch
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
X-List-Received-Date: Mon, 23 Jun 2014 11:08:14 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-mozilla/firefox-l10n/firefox-l10n.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n.inc b/recipes-mozilla/firefox-l10n/firefox-l10n.inc
index e071905..7b252a2 100644
--- a/recipes-mozilla/firefox-l10n/firefox-l10n.inc
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n.inc
@@ -2,7 +2,8 @@
 # Released under the MIT license (see packages/COPYING)
 
 DEPENDS = "mozilla-devscripts-native"
-RDEPENDS_${PN} = "firefox"
+# drop to keep allarch
+# RDEPENDS_${PN} = "firefox"
 
 LICENSE = "MPLv1 | GPLv2+ | LGPLv2.1+"
 
-- 
2.0.0


