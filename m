Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3DF1660722
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Feb 2017 23:54:08 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id c85so430522wmi.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Feb 2017 15:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=vtoY7BLSEgzcIU7iZNx1FHkvt++gOFCbb1aO/hpUMfA=;
	b=vLARyWAyHwqrE2aUKDO5vFY0FGKiuhGyZFyGmVM3QG0lrJcuTJbrovS4Vqsb22P99a
	GSxJ9ZArJWnip8LzDk0oYGw61RGULhAcHLu45WtYj/iExqh8A+EaX5Gc60ajPFiYVCYq
	zSMZsvPM9dferEbD2k0IWQvh9oycEd3gsmiqYwDTrkQnH3qo0ipKqGZKzOFsu7fRo4M5
	z6LC03sjmbhrmBjn+9OfkaOKbo9ZZ6mJGK2kXzn8zy9UhKznEDM9POLmPZKCANwm9+by
	HPqNH4l+V1a+wDYJUWx50+mSak9yF94cm5ChYPItDGGSiuvLDxkX7MT/RhUBQccFq/B2
	5JvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=vtoY7BLSEgzcIU7iZNx1FHkvt++gOFCbb1aO/hpUMfA=;
	b=oon7iiBdBC81G1nmGdKyN9g3nzWkpjYnDeXeKsd3kPCyUbHZRmcKnz+W8kkszwEBz3
	SZqm3Yr3EyVob7GNxp2TPUK1Du6QYCNAcuLrFp/qL9iiu0MFd7ELa2nokdbKDsBCdPvx
	WGNykeoKrF5yZ6jvgZSgpFQTp6l/dyDnJ7MUz88Cb0aQ63yMEcMi/mWPcANU6UXj8QUB
	qYRf20SZCXNB45jJKzTiw7utVTjyG9M4U3nq3dE1efnG/NyjRcX5Q3Q5f5YqflcCXQ3V
	hvydJ4LNxP9Hz4qH9HOBMTRCMecxde4UBud4b+yjirVBnjDONkRlVRNcJ4bIouwxDHrN
	5aXw==
X-Gm-Message-State: AMke39kc5SXDBl6NK+xH9ABVfR1rCy6vdufMEUEenHA9SOS8NWmrhGo4zGGnjOUQV/Ct2Q==
X-Received: by 10.28.136.68 with SMTP id k65mr123467wmd.48.1486079648382;
	Thu, 02 Feb 2017 15:54:08 -0800 (PST)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id 36sm42220843wrz.8.2017.02.02.15.54.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 02 Feb 2017 15:54:07 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  3 Feb 2017 00:53:59 +0100
Message-Id: <20170202235401.10297-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20170202235401.10297-1-Martin.Jansa@gmail.com>
References: <20170202235401.10297-1-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-qt5 2/4] qtwayland: Add libxkbcommon in the dependencies
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
X-List-Received-Date: Thu, 02 Feb 2017 23:54:09 -0000

From: Herve Jourdain <herve.jourdain@neuf.fr>

xkb should be optional, but it's not for the moment, so add it to the
dependencies.

Signed-off-by: Herve Jourdain <herve.jourdain@neuf.fr>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/qtwayland_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-qt/qt5/qtwayland_git.bb b/recipes-qt/qt5/qtwayland_git.bb
index ec41922..21abd54 100644
--- a/recipes-qt/qt5/qtwayland_git.bb
+++ b/recipes-qt/qt5/qtwayland_git.bb
@@ -2,6 +2,7 @@ require qt5.inc
 require qt5-git.inc
 
 DEPENDS += "qtbase qtdeclarative wayland wayland-native qtwayland-native"
+DEPENDS_append_class-target = " libxkbcommon"
 
 LICENSE = "GFDL-1.3 & BSD & ( GPL-3.0 & The-Qt-Company-GPL-Exception-1.0 | The-Qt-Company-Commercial ) & ( GPL-2.0+ | LGPL-3.0 | The-Qt-Company-Commercial )"
 LIC_FILES_CHKSUM = " \
-- 
2.10.2


