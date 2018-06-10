Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f178.google.com (mail-wr0-f178.google.com
	[209.85.128.178])
	by mail.openembedded.org (Postfix) with ESMTP id 11AB77604D
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jun 2018 14:11:38 +0000 (UTC)
Received: by mail-wr0-f178.google.com with SMTP id x4-v6so9556400wro.11
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jun 2018 07:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=QOdrwwkiXp432t+hY1zSKdWcSxry+L6mkkXdHwxT0RU=;
	b=IctK6C4CVljBR36HZdWaMfaw1BpDe2XuKnlT82L3nK4qbaasLdJW0/EOPCmpgXtVxw
	XP5vG4ufWbToE5Y3xxEG5YaMoigDRm42aN4+regBgsyTNY322A3QxTazxXi5xUrr6cno
	+Z5z5bwgpzHC6tq5rsD2WtFUxE6Po5OpsaxStQ6V0VUb+GvdEAo1SsguaFW72fHpvtPz
	6/G8BgdETy2IPx79wZPJyMnFARvful+zT11px9hc3ZcJkIi/OB9HsvUH22FGw4MYirsx
	bKOOF3/HlI5cqUtBBuR7vWZFNAF/xMlXOYqTatKYBgotd7WhlhGIlIcCgsdRn5ziIj3U
	mp+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=QOdrwwkiXp432t+hY1zSKdWcSxry+L6mkkXdHwxT0RU=;
	b=mATzvgj+0a11IZitdPib/7meeCCFD2bCOGR8rp0f8dODA6LfgQoEMrU0hLGcNbMwg1
	DJtWqZOZ7TUliDL6c+Ia+jo08Pyi5uB8Bavg+r6HAHCz5wBiOYerQmg+VeaujE05aT1Z
	Ktx0y4vtSbuc8Sh3wFKLlDEXuwlf9i1SSnMnw+ynRbHNcnuf2jY4hI/XlGax33v23tR5
	crIR05NTkQ6Zy1L3yO6QUaeoIwl78TmlHQj8/MPclJE17fN53+Y3ECO+LrTMjeMLQQFW
	KR/A8miRiDyWZglkNXwZrfPhNKmyAKnJrey+eoOh9mKYsMltEaxqYHuefXRCjGEfSS9E
	eJnQ==
X-Gm-Message-State: APt69E136OZd8qPCsdEenAE+36s3RXsICOUGAX8U6MDW6JrWYvFNq1B4
	6wP7JvLrwkf4CBIrfzXhVzvcLg==
X-Google-Smtp-Source: ADUXVKJ309xEwP4q1bVIxXflcM/7RJjD+FzEaCXzYpl0wW/63BN3UPUoztyg0zuNJyhk3u0xiOcTIQ==
X-Received: by 2002:adf:a54a:: with SMTP id
	j10-v6mr11299835wrb.155.1528639899686; 
	Sun, 10 Jun 2018 07:11:39 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	l41-v6sm75640970wre.87.2018.06.10.07.11.38
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 10 Jun 2018 07:11:38 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Jun 2018 14:11:35 +0000
Message-Id: <20180610141136.4311-3-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180610141136.4311-1-Martin.Jansa@gmail.com>
References: <20180610141136.4311-1-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-qt5 3/4] qtwebengine: add -fpermissive
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
X-List-Received-Date: Sun, 10 Jun 2018 14:11:39 -0000

* http://errors.yoctoproject.org/Errors/Details/179245/
  just use -fpermissive in this case like fedora did:
  https://bugzilla.redhat.com/show_bug.cgi?id=1582954

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/qtwebkit_git.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/recipes-qt/qt5/qtwebkit_git.bb b/recipes-qt/qt5/qtwebkit_git.bb
index 0cf68ca..9e4617a 100644
--- a/recipes-qt/qt5/qtwebkit_git.bb
+++ b/recipes-qt/qt5/qtwebkit_git.bb
@@ -28,6 +28,11 @@ ARM_INSTRUCTION_SET_armv7a = "thumb"
 ARM_INSTRUCTION_SET_armv7r = "thumb"
 ARM_INSTRUCTION_SET_armv7ve = "thumb"
 
+# http://errors.yoctoproject.org/Errors/Details/179245/
+# just use -fpermissive in this case like fedora did:
+# https://bugzilla.redhat.com/show_bug.cgi?id=1582954
+CXXFLAGS += "-fpermissive"
+
 EXTRA_OECMAKE = " \
     -DPORT=Qt \
     -DECM_MKSPECS_INSTALL_DIR=${libdir}${QT_DIR_NAME}/mkspecs/modules \
-- 
2.17.1


