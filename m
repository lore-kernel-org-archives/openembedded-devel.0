Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tworaz666@gmail.com>) id 1RoNGx-0005J2-V8
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Jan 2012 23:49:27 +0100
Received: by eekd41 with SMTP id d41so335326eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jan 2012 14:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=Md/RvQvPW1fz0e7mTkmicdVrnd2jRPb2CqOuKp7Q034=;
	b=pJCo3rua7CmAZNP3u41UL01N5MCZOz6DLVDPBSvoKKw7pYZMk1bkUMPtcQzs9cEn5v
	TLT5yZxIwm1Wl/S/WxVkwAeNyA51QMGmywjqyDhlJu3ApSOwOGpSTubkfD7hWBmnLBjh
	nUCHJMtv+VcLFCvxXm2qGUfTNxFgDcDsGgspE=
Received: by 10.14.15.214 with SMTP id f62mr3847281eef.123.1327099306785;
	Fri, 20 Jan 2012 14:41:46 -0800 (PST)
Received: from localhost.localdomain (89-77-50-243.dynamic.chello.pl.
	[89.77.50.243])
	by mx.google.com with ESMTPS id b49sm17225286eec.9.2012.01.20.14.41.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 20 Jan 2012 14:41:46 -0800 (PST)
From: Peter Tworek <tworaz666@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 20 Jan 2012 23:39:40 +0100
Message-Id: <1327099180-19218-1-git-send-email-tworaz666@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [PATCH] busybox: Add flock utility to default oe configuration.
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
X-List-Received-Date: Fri, 20 Jan 2012 22:49:28 -0000

Thus utility is required by by pm-utils package to function properly.
It's shipped in both busybox and util-linux. Both versions work fine
with pm-utils. In util-linux case however, the solution for the problem
would require placing flock binary into it's a separate package
and adding runtime dependancy on it into pm-utils recipe.

Signed-off-by: Peter Tworek <tworaz666@gmail.com>
---
 meta/recipes-core/busybox/busybox-1.19.3/defconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox-1.19.3/defconfig b/meta/recipes-core/busybox/busybox-1.19.3/defconfig
index 1990f28..a807454 100644
--- a/meta/recipes-core/busybox/busybox-1.19.3/defconfig
+++ b/meta/recipes-core/busybox/busybox-1.19.3/defconfig
@@ -540,7 +540,7 @@ CONFIG_FEATURE_FDISK_WRITABLE=y
 # CONFIG_FEATURE_GPT_LABEL is not set
 # CONFIG_FEATURE_FDISK_ADVANCED is not set
 # CONFIG_FINDFS is not set
-# CONFIG_FLOCK is not set
+CONFIG_FLOCK=y
 # CONFIG_FREERAMDISK is not set
 CONFIG_FSCK_MINIX=y
 # CONFIG_MKFS_EXT2 is not set
-- 
1.7.3.4



