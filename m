Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 18C6470A81
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  9 Aug 2014 16:08:58 +0000 (UTC)
Received: by mail-wi0-f172.google.com with SMTP id n3so2379828wiv.5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Aug 2014 09:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=B780JpLy6nLoB9QXsxdDdg7NuAnd9I/7n/balb6WTS4=;
	b=GrojsBUCOZZE11LT1s8K9Nuu2p/Y11MMuhrvODEMV6CReeDykz9GITQX7x4hdffGiu
	NGUPdIGarzC/71YIQwETAelRo7O3fPjeHQxS9xiyjWCfDz7c/VcjQ2IhPueemJuGW75W
	hW4sZ+5OV4nIU93m/PyQlCyXCkYt0/b5thw0JOrMcZK19Pd8hjsE6CcIJDteD9n2FUX1
	PofwsNWpqOpl7Qau4LZnhxnIeGI0WuzTyW5bSHb0IkvYqHTEAVxaxEU5vTu9Q2VrGOOE
	6N3zcUuFolm0sFDpZgbJBgbUeEbHoQRB+JpkIk9K9GxVuRO2SvJiQmbxFMh3X+NgNx53
	rVsQ==
X-Received: by 10.194.134.70 with SMTP id pi6mr40751562wjb.1.1407600539570;
	Sat, 09 Aug 2014 09:08:59 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	v14sm25516947wjw.38.2014.08.09.09.08.58 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Aug 2014 09:08:59 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Aug 2014 18:08:47 +0200
Message-Id: <1407600537-10857-26-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
In-Reply-To: <1407600537-10857-1-git-send-email-Martin.Jansa@gmail.com>
References: <1407600537-10857-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 26/36] owfs: remove unrecognized configure options
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
X-List-Received-Date: Sat, 09 Aug 2014 16:08:59 -0000

* fixes following QA warnings:
  owfs-2.9p1: owfs: configure was passed unrecognised options:
    --enable-cache --enable-mt [unknown-configure-option]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-filesystems/recipes-filesystems/owfs/owfs_2.9p1.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-filesystems/recipes-filesystems/owfs/owfs_2.9p1.bb b/meta-filesystems/recipes-filesystems/owfs/owfs_2.9p1.bb
index e8b34d3..21fd7e9 100644
--- a/meta-filesystems/recipes-filesystems/owfs/owfs_2.9p1.bb
+++ b/meta-filesystems/recipes-filesystems/owfs/owfs_2.9p1.bb
@@ -22,8 +22,6 @@ EXTRA_OECONF = " \
                  --with-fuselib=${STAGING_LIBDIR} \
                  --enable-owfs \
                  --enable-owhttpd \
-                 --enable-cache \
-                 --enable-mt \
                  --enable-w1 \
                  --disable-swig \
                  --disable-owtcl \
-- 
2.0.4


