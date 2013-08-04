Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f54.google.com (mail-ee0-f54.google.com [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id AD43D6B53E
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  4 Aug 2013 21:47:26 +0000 (UTC)
Received: by mail-ee0-f54.google.com with SMTP id e53so1276663eek.27
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 04 Aug 2013 14:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=mutG19yiNq/+mienRda0goB8eaBPeBpqRl+0HH69wDw=;
	b=ybSLe3hTYotci1mUKLzz7sqilAW1l5GWA1wQdNvhbMWsiQ6DNRS56Zzltc6978rPGm
	lh2G/io1x+Q74UlNo+N8U54230bYJAGFnMGIX+NI+U9Mc/WPWhrV5Sb5+HcFCqsMcNh8
	5vACAesxA0KVOWJBxYCmkAAepJAFea/PMWin+lpXPasoIm5FRnFt3y8UasEeyySE6W7K
	SrXItZHHX4/0buoKct/pU+woYCzyqaQDxS/w/WmIFRwhRq6EyJfLJgeGOq95ixr6SnMG
	oRjUg+vMOaCT7vLKvM8SIAgY8902bN3FQwYDTxxMsgGuLbQeHSAg2JIRzBZUNru/uYHz
	Dh2Q==
X-Received: by 10.14.241.74 with SMTP id f50mr14462648eer.29.1375652847014;
	Sun, 04 Aug 2013 14:47:27 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	n42sm28772606eeh.15.2013.08.04.14.47.26 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 04 Aug 2013 14:47:26 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  4 Aug 2013 23:47:45 +0200
Message-Id: <1375652867-10498-13-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1375652867-10498-1-git-send-email-Martin.Jansa@gmail.com>
References: <1375652867-10498-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 13/15] gcalctool: move to nonworking
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
X-List-Received-Date: Sun, 04 Aug 2013 21:47:27 -0000

* broken at least since April http://permalink.gmane.org/gmane.comp.handhelds.openembedded/57920
  and nobody complained, it's also replaced by gnome calculator

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../{ => nonworking}/gcalctool/gcalctool/fix-includedir.patch             | 0
 meta-gnome/recipes-gnome/{ => nonworking}/gcalctool/gcalctool_5.32.0.bb   | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-gnome/recipes-gnome/{ => nonworking}/gcalctool/gcalctool/fix-includedir.patch (100%)
 rename meta-gnome/recipes-gnome/{ => nonworking}/gcalctool/gcalctool_5.32.0.bb (100%)

diff --git a/meta-gnome/recipes-gnome/gcalctool/gcalctool/fix-includedir.patch b/meta-gnome/recipes-gnome/nonworking/gcalctool/gcalctool/fix-includedir.patch
similarity index 100%
rename from meta-gnome/recipes-gnome/gcalctool/gcalctool/fix-includedir.patch
rename to meta-gnome/recipes-gnome/nonworking/gcalctool/gcalctool/fix-includedir.patch
diff --git a/meta-gnome/recipes-gnome/gcalctool/gcalctool_5.32.0.bb b/meta-gnome/recipes-gnome/nonworking/gcalctool/gcalctool_5.32.0.bb
similarity index 100%
rename from meta-gnome/recipes-gnome/gcalctool/gcalctool_5.32.0.bb
rename to meta-gnome/recipes-gnome/nonworking/gcalctool/gcalctool_5.32.0.bb
-- 
1.8.3.2


