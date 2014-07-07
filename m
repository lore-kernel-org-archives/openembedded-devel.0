Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 763AA7036F
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Jul 2014 10:45:31 +0000 (UTC)
Received: by mail-wi0-f169.google.com with SMTP id hi2so14747174wib.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Jul 2014 03:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=cEiXmR51fBijBOcHBUgr0wmBWlgfGFKZM3ZJAfUVktM=;
	b=xnOJa2W9DPN1mkmCV3OPgLOuNJB55mzd3XIbjmnlzSr7Wd2EeZK+6xZSuU1dfl+iwh
	dHzxKsfsA8hTST3EnYRlxHIpgstwrC9VfwmFYfnZxHIimi2YGsRd/4Nvoi2Yq8T8FExZ
	4IxnXNd2ARqiWMbNYngkKIExCO/bLuDJglbH0LTuFat6ONnyUp8fO/yf6FRGL1dfK1HT
	fEd5irrFOfTzZbXa9f8V7EH1DxgYZhnAVqKVnb9os30JxPOBHoxccGsDi5z5zrKMZIdx
	Ize+K28sUC/Uso69HTXk60DeOs/Ltc+k6VbzWDArcgRwTWXBv25RRcBxI6p00oZ2N2bs
	SY7w==
X-Received: by 10.194.24.36 with SMTP id r4mr31527101wjf.35.1404729932657;
	Mon, 07 Jul 2014 03:45:32 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	jy8sm88633390wjc.7.2014.07.07.03.45.31 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 07 Jul 2014 03:45:32 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  7 Jul 2014 12:45:17 +0200
Message-Id: <1404729919-2903-5-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <1404729919-2903-1-git-send-email-Martin.Jansa@gmail.com>
References: <1404729919-2903-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][WIP][PATCH 5/7] xfconf: inherit gtk-doc
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
X-List-Received-Date: Mon, 07 Jul 2014 10:45:34 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-xfce/recipes-xfce/xfconf/xfconf_4.10.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-xfce/xfconf/xfconf_4.10.0.bb b/meta-xfce/recipes-xfce/xfconf/xfconf_4.10.0.bb
index 1355359..8a3416c 100644
--- a/meta-xfce/recipes-xfce/xfconf/xfconf_4.10.0.bb
+++ b/meta-xfce/recipes-xfce/xfconf/xfconf_4.10.0.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 DEPENDS = "dbus-glib libxfce4util perl intltool-native"
 
-inherit xfce
+inherit xfce gtk-doc
 
 EXTRA_OECONF += "PERL=${STAGING_DIR_TARGET}/usr/bin/perl"
 
-- 
2.0.0


