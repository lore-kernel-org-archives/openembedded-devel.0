Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id D2FE875D4A
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jan 2016 01:00:07 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id n128so2219480pfn.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Jan 2016 17:00:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=vW2u5sacBmNwyLRIFPGJqRlC/8c/U/B8qPD+bTrghg8=;
	b=haGm1Ul7cwubnGEIKzNJJFodcA8Lr2NsjgzBDRoOHp9Ji4tzXBncWSIyjns65q6i4k
	aapZqfQEIehH+3FRxvjy4OyvayQXfQe6SNid7+eCHOqxw4gOGxSyqLChPQh7LEm/kkAx
	Dor5VwzNrv1AIVBBT4lDSd5MK+RF5sAqPkI+21GY7rzVfd2LKtI6z0WnyYPNxCG9titl
	+dKfjkQAoRuhHU2WWW08FJrSt397z/pMkv6rd33bozh7L5gR9nn5rg71lUlyqTr4+IB6
	/XywMMpP3rIDOcRRxhsPlnvfW6ZG6zSfw5+KHWDFljwblTAL/9QroWY9eVmXMm8q/cYi
	Nguw==
X-Received: by 10.98.75.83 with SMTP id y80mr15590129pfa.62.1452387608917;
	Sat, 09 Jan 2016 17:00:08 -0800 (PST)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	r26sm5366211pfb.21.2016.01.09.16.59.59
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Jan 2016 17:00:05 -0800 (PST)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id 2571DFCC847; Sat,  9 Jan 2016 16:59:48 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Jan 2016 16:59:38 -0800
Message-Id: <a71fa78c2e5b2d7b1d9818b9ab8ca6ec170c49db.1452386603.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1452386602.git.akuster808@gmail.com>
References: <cover.1452386602.git.akuster808@gmail.com>
In-Reply-To: <cover.1452386602.git.akuster808@gmail.com>
References: <cover.1452386602.git.akuster808@gmail.com>
Subject: [PATCH 15/22] contrib: add missing common OE variables
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
X-List-Received-Date: Sun, 10 Jan 2016 01:00:08 -0000

From: Jose Alarcon <jose.alarcon@ge.com>

Signed-off-by: Jose Alarcon <jose.alarcon@ge.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 contrib/oe-stylize.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/contrib/oe-stylize.py b/contrib/oe-stylize.py
index a2fcde1..7bb310d 100755
--- a/contrib/oe-stylize.py
+++ b/contrib/oe-stylize.py
@@ -121,6 +121,7 @@ OE_vars = [
     'CONFFILES',
     'CONFLICTS',
     'CORE_EXTRA_D',
+    'CORE_IMAGE_EXTRA_INSTALL',
     'CORE_PACKAGES_D',
     'CORE_PACKAGES_RD',
     'CPPFLAGS',
@@ -141,6 +142,7 @@ OE_vars = [
     'INITSCRIPT_PACKAGES',
     'INITSCRIPT_NAME',
     'INITSCRIPT_PARAMS',
+    'INSANE_SKIP',
     'PACKAGE_INSTALL',
     'KERNEL_IMAGETYPE',
     'KERNEL_IMAGEDEST',
@@ -199,6 +201,8 @@ OE_vars = [
     'UBOOT_MACHINE',
     'UCLIBC_BASE',
     'UCLIBC_PATCHES',
+    'USERADD_PACKAGES',
+    'USERADD_PARAM',
     'VIRTUAL_NAME',
     'XORG_PN',
     'XSERVER',
-- 
1.9.1


