Return-Path: <andrea.adami@gmail.com>
Received: from mail-ee0-f41.google.com (mail-ee0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id AEB5A6E71A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Feb 2014 21:54:10 +0000 (UTC)
Received: by mail-ee0-f41.google.com with SMTP id e51so6818488eek.14
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Feb 2014 13:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Y1HEr4TUZ7hfG7ZJNy/HclL8KCRMwwWrNJWl7mibVZY=;
	b=x9W/8GVFFG0NzcWISKDffFqJoFXXm6mhGsq76QxRn+G7TuXFnWeXc5J4NS7N0hdo44
	RxpHrrIeJe/UQGoK8Sz9QZE+aDZbvOsIQYEtS7Cx/P9ew277KbgfaZmCsHJMuOxlw/75
	hTCnWo0BP/Uw6PfA3unGeseuGnmeIezoPdWsU8DoNsCxZWGs3QfkgWJ1jfrTc8Z66FNn
	JygZQusjlFNzNmIB73g/xiJfdsdLEj+wpnh9JcZ9/E8U6tejc0nJH0WcAb93rMYhsMZh
	Qb+MJKJV63Pnm8q0siQFNpw+seRdK5KpwI8pOh0zp/wgoqGY1N372L2Pmms0TD51gY1f
	T3tA==
X-Received: by 10.14.53.8 with SMTP id f8mr29246454eec.3.1392674051015;
	Mon, 17 Feb 2014 13:54:11 -0800 (PST)
Received: from mizar.localdomain
	(host53-14-dynamic.21-79-r.retail.telecomitalia.it. [79.21.14.53])
	by mx.google.com with ESMTPSA id m1sm62134917een.7.2014.02.17.13.54.09
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Feb 2014 13:54:10 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Feb 2014 22:54:04 +0100
Message-Id: <1392674044-20769-2-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <1392674044-20769-1-git-send-email-andrea.adami@gmail.com>
References: <1392674044-20769-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-handheld][PATCH 2/2] linux-yocto*: catch up with serial-8250.cfg renaming
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
X-List-Received-Date: Mon, 17 Feb 2014 21:54:11 -0000

include cfg/8250.scc instead

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 recipes-kernel/linux/linux-yocto-3.10/zaurus-common.scc | 2 +-
 recipes-kernel/linux/linux-yocto-dev/zaurus-common.scc  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-yocto-3.10/zaurus-common.scc b/recipes-kernel/linux/linux-yocto-3.10/zaurus-common.scc
index b2354f8..975446d 100644
--- a/recipes-kernel/linux/linux-yocto-3.10/zaurus-common.scc
+++ b/recipes-kernel/linux/linux-yocto-3.10/zaurus-common.scc
@@ -3,7 +3,7 @@ kconf non-hardware zaurus-non-hardware.cfg
 
 include cfg/fs/flash_fs.scc
 include cfg/fs/vfat.scc
-include cfg/serial-8250.cfg
+include cfg/8250.scc
 include cfg/sound.scc
 
 include features/vfat/vfat.scc
diff --git a/recipes-kernel/linux/linux-yocto-dev/zaurus-common.scc b/recipes-kernel/linux/linux-yocto-dev/zaurus-common.scc
index b2354f8..975446d 100644
--- a/recipes-kernel/linux/linux-yocto-dev/zaurus-common.scc
+++ b/recipes-kernel/linux/linux-yocto-dev/zaurus-common.scc
@@ -3,7 +3,7 @@ kconf non-hardware zaurus-non-hardware.cfg
 
 include cfg/fs/flash_fs.scc
 include cfg/fs/vfat.scc
-include cfg/serial-8250.cfg
+include cfg/8250.scc
 include cfg/sound.scc
 
 include features/vfat/vfat.scc
-- 
1.8.1.5


