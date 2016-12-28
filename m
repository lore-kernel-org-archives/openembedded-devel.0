Return-Path: <oleksandr.kravchuk@pelagicore.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id E306D6069D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Dec 2016 12:00:58 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id u144so74987708wmu.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Dec 2016 04:01:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pelagicore-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=viJsP7LNVTboUw/Y9mPbKpdDc4kiQWlkpUoYyk5Lv1Y=;
	b=uWlztayM56ufMB5s/8sim+BqMFmmL1iKSOVdwoeT7vcWGQkw3yhedlHYZo6pe+XKg2
	T9B59Gfwm91wWF7SU/tdOTHsG6qjjZKGn/IHXM9dynQFPg+ZWUM1VDfc0Nvl7zpOw+nT
	aeMNbO26rEC3GCcYlLYiJAJVbr9OhHvRP667fbpUZGCa7QlLWE45IiZlNpx0CezQxgZ6
	3PFyV1O4GNAwXlfohFfud0WYiRDN14X8RJUZODuMr3J0YJuvcBn27dyUoGgV0uP2ShKa
	wTR2tuV6lXWwVCbgs1EzJVTrOWpc6PuZo5yW9ng1849rJ/1danmCBIwyfGYPlO5M2q3a
	wfgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=viJsP7LNVTboUw/Y9mPbKpdDc4kiQWlkpUoYyk5Lv1Y=;
	b=mwTbJzVRE9n6oR1RbGnsOosoMRzjuV6GiJblDe8ZAicNKtqriYWLw48Uf4zBWvfu4J
	E56TDdrSm/mPSqqy6i3Gl+sUepfyzA4QXSKG6ySQAWX+fV2FD35YS1URPwU0QxIvCMo4
	VBq82UrTdUAFu7pMabZLgyM5k8uvQozsrodB5KXCE6vpXsVS8H4ArDXYwd8hJkEZvrqa
	2SbsBKQEiUgb4edvp8uJEwM8OmL/RFqo2LQW/KqMK/QtLPW2YwPUdADdxvlzDWkUuPQy
	ALI0t9ko4JCYlmFVUJZ42/zkG0ZgW76/SXJNUQNuRb4ntZ6SRJDC3FrDVuJxNBFPkE4C
	clTg==
X-Gm-Message-State: AIkVDXJELzrk1UNHv7ie/5Yu2ePQPC7ynWUrJzroDd3BSNCI3ljvNL4Hh31vwVVgR13ofSwS
X-Received: by 10.28.9.80 with SMTP id 77mr33721940wmj.68.1482926459284;
	Wed, 28 Dec 2016 04:00:59 -0800 (PST)
Received: from stout.office.pelagicore.net ([83.218.80.242])
	by smtp.gmail.com with ESMTPSA id
	a13sm60739591wma.18.2016.12.28.04.00.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 28 Dec 2016 04:00:58 -0800 (PST)
From: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 28 Dec 2016 13:00:35 +0100
Message-Id: <1482926435-13846-1-git-send-email-oleksandr.kravchuk@pelagicore.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] devmem2: fix broken SRC_URI
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
X-List-Received-Date: Wed, 28 Dec 2016 12:00:59 -0000

Original SRC_URI for devmem2 source code is accessible. Use the mirror
provided by free-electrons instead.

Signed-off-by: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
---
 meta-oe/recipes-support/devmem2/devmem2.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-support/devmem2/devmem2.bb b/meta-oe/recipes-support/devmem2/devmem2.bb
index e48cc92..ba9d4cb 100644
--- a/meta-oe/recipes-support/devmem2/devmem2.bb
+++ b/meta-oe/recipes-support/devmem2/devmem2.bb
@@ -1,9 +1,9 @@
 SUMMARY = "Simple program to read/write from/to any location in memory"
 LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://devmem2.c;endline=28;md5=dd68f2b0a5184b3db3dc25c99e0bd0cd"
+LIC_FILES_CHKSUM = "file://devmem2.c;endline=38;md5=a9eb9f3890384519f435aedf986297cf"
 PR = "r7"
 
-SRC_URI = "http://www.lartmaker.nl/lartware/port/devmem2.c \
+SRC_URI = "http://free-electrons.com/pub/mirror/devmem2.c \
            file://devmem2-fixups-2.patch;apply=yes;striplevel=0"
 S = "${WORKDIR}"
 
@@ -18,5 +18,5 @@ do_install() {
     install devmem2 ${D}${bindir}
 }
 
-SRC_URI[md5sum] = "be12c0132a1ae118cbf5e79d98427c1d"
-SRC_URI[sha256sum] = "ec382c90af3ef2f49695ff14a4d6521e58ac482c4e29d6c9ebca8768f699c191"
+SRC_URI[md5sum] = "e23f236e94be4c429aa1ceac0f01544b"
+SRC_URI[sha256sum] = "3b15515693bae1ebd14d914e46d388edfec2175829ea1576a7a0c8606ebbe639"
-- 
2.7.4


