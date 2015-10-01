Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 8EAF477088
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Oct 2015 15:29:41 +0000 (UTC)
Received: by wicgb1 with SMTP id gb1so35195165wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Oct 2015 08:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=aMogRTA8pANQj25ktv1gugEFP4vDPFp3KECzOFNJo50=;
	b=lE/Wri9R8TO7GEzOB4D4BqdUcYyTk4zytCaZhaR3D5/KAlu5FLwS7DEFRx619mRale
	rmoVUlF1KEP9IHYdUY6JTb/x+UB9BhK+e2clWs3z8UKbhuo9aMYaEkh2RHLMZMwLE7Ls
	mf5dL1vJkBCO4nC0ZvjKxBJsfdYSBmreZP67QU2tiGcjh2R2XXKxxTSF4u5Q/+EHrXCO
	TLBm9rwy3sKCF7WWLxPL7a6pKjN2GBa8x8MiUF2NHFcKuxJga1P1+5FT4LUl6a2/0+qq
	UtMhE8IJy0E17dTt1TVWDkgpilVAK7G5iARE4GN4BvKiJsiEc103SiIahkNOV+hGPY8S
	u7Ow==
X-Received: by 10.194.249.100 with SMTP id yt4mr13294957wjc.74.1443713380926; 
	Thu, 01 Oct 2015 08:29:40 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	mx19sm3745740wic.0.2015.10.01.08.29.39
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Oct 2015 08:29:40 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Oct 2015 17:30:24 +0200
Message-Id: <1443713428-8635-6-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1443713428-8635-1-git-send-email-Martin.Jansa@gmail.com>
References: <20150918115458.GA11095@jama>
	<1443713428-8635-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe 06/10] gnome-power-manager: Blacklist not compatible with current libnotify
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
X-List-Received-Date: Thu, 01 Oct 2015 15:29:42 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-gnome/gnome-power-manager/gnome-power-manager_2.32.0.bb     | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-manager_2.32.0.bb b/meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-manager_2.32.0.bb
index 5a8a62b..87bd722 100644
--- a/meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-manager_2.32.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-manager_2.32.0.bb
@@ -50,3 +50,5 @@ FILES_${PN}-doc += "${datadir}/omf \
     ${datadir}/gnome/help \
 "
 
+# gnome-power-manager-2.32.0/src/gpm-manager.c:488:18: error: too many arguments to function 'notify_notification_new'
+PNBLACKLIST[gnome-power-manager] ?= "BROKEN: not compatible with current libnotify"
-- 
2.6.0


