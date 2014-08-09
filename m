Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f179.google.com (mail-we0-f179.google.com
	[74.125.82.179])
	by mail.openembedded.org (Postfix) with ESMTP id 39F9270A83
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  9 Aug 2014 16:08:44 +0000 (UTC)
Received: by mail-we0-f179.google.com with SMTP id u57so6870524wes.10
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Aug 2014 09:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=pc8mgH1yO5ytr6lx1YWVZAE8b1b9RPi/q9WF4UMSu6Q=;
	b=EyIW1yU2qTwbTHWBTdmtTKb+ZpgNjusa72HLAsDHYi6SiGldsGhw6k65g280hcr4t9
	KQie+gpXE5J2QSZf/jclh5DWRaBzw700OZWVN9sWMvTXpkBXKozUVqeQqxjnEZEItOTZ
	MDJKhg4HgkueGnicAlVQsHQadTaO2S+Ae1G5qU8MCAgABilzzS994K11P6Bi0yFRJhQW
	l7g5PKWkTKy2gm3SV/zTiBOMBv3/kXMpbzZGByj6QarKTbspprRMyzKO1KQh0rbDXpM+
	VCnVyb0gLZqnGL5Ytk40ZRevrB1EwKV4DoB7948xTIXFOXQdkkRA9dnQT8i+etdlA1VU
	WvmA==
X-Received: by 10.194.60.110 with SMTP id g14mr4113173wjr.101.1407600525845;
	Sat, 09 Aug 2014 09:08:45 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	eb4sm20409714wic.16.2014.08.09.09.08.45 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Aug 2014 09:08:45 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Aug 2014 18:08:36 +0200
Message-Id: <1407600537-10857-15-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
In-Reply-To: <1407600537-10857-1-git-send-email-Martin.Jansa@gmail.com>
References: <1407600537-10857-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 15/36] fuse: remove unrecognized configure option
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
X-List-Received-Date: Sat, 09 Aug 2014 16:08:45 -0000

* fixes following QA warning:
  fuse-2.9.3: fuse: configure was passed unrecognised options:
  --disable-kernel-module [unknown-configure-option]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-filesystems/recipes-support/fuse/fuse_2.9.3.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-filesystems/recipes-support/fuse/fuse_2.9.3.bb b/meta-filesystems/recipes-support/fuse/fuse_2.9.3.bb
index 2ff8e20..60fea87 100644
--- a/meta-filesystems/recipes-support/fuse/fuse_2.9.3.bb
+++ b/meta-filesystems/recipes-support/fuse/fuse_2.9.3.bb
@@ -21,8 +21,6 @@ inherit autotools pkgconfig
 
 DEPENDS = "gettext-native"
 
-EXTRA_OECONF = "--disable-kernel-module"
-
 PACKAGES =+ "fuse-utils-dbg fuse-utils libulockmgr libulockmgr-dev libulockmgr-dbg"
 
 RRECOMMENDS_${PN} = "kernel-module-fuse"
-- 
2.0.4


