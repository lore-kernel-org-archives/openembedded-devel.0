Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id D4E136FF78
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 13:08:34 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id b205so154775802wmb.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 05:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=osRVY248FBEj7+97qwcsCgJUIR7zk4pR08NZGwTsRos=;
	b=EM3aCEW2CfVQ29QaOl1zCKr3wHdUZW2s3m70SkiXS3LTqzIGS2gjUBiIJttYv2EFDU
	OK70q233tkDPPpY5VsH6wXrYezQVlLdR44p1fa6jAafqUCLar+iL/nTSlAdkEFLvntr9
	tThSc7+kxshfIMV/es/tXv2CCRDXt8FwBUTTY4DIPgMXh5SfzCE0zbh6HMjgikgLM1RY
	ZWFW+oICr5+YWbb4dCBnXkx+kD32fQqD6OPLIBfyDlndFJc7VamvNX2w4rs2iRwnWBCf
	OUbgd6ePdZkZil2DoqWnsfVuxCB5BSwGh3G0HSSwz8/fx8ZFM7CdvedzlB0Hhzu2cT8S
	v+iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=osRVY248FBEj7+97qwcsCgJUIR7zk4pR08NZGwTsRos=;
	b=Z5EbOUdyum8h4iSa/g6yr3wlt36rhub5kyrS4RU0sk5J9+7r/g1MxMFMxLezzqhMWM
	bcC6ZDN1hq+f0RIaGqAzWBU6RDZT2C280XL4ABnqMhLDoKE9vCiD5HlHTe2BHM+8Q4Nl
	VvjIxJtGCVB05w2Ss0Ov8TZtNzdfCM+LtlpDPLYVFe3ORKlLbcyredN3j1ZDJAME7JUP
	TTVldUm4emD4cJsz0dtogjBeduU4znKCxBxOnhI8lE4Kq5rtJzSWTia73BCU5WOUMAKn
	ek0kMfWiGShgpioqBvN/WPCysPOEDRU8DQlYu/byUvb3MTqDKJleul3oarxBrnr8U2uJ
	3VSQ==
X-Gm-Message-State: AG10YORjXnVTpEQF70dUbKA+tQhVemrF222ZXJlGyQYe7qbQAo0KO/xmPRS8sxhhVWJmzg==
X-Received: by 10.28.111.10 with SMTP id k10mr11602882wmc.86.1456146515184;
	Mon, 22 Feb 2016 05:08:35 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	a128sm21026606wmh.6.2016.02.22.05.08.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Feb 2016 05:08:34 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Feb 2016 14:09:24 +0100
Message-Id: <1456146565-3369-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.1
Subject: [PATCH][meta-gnome 1/2] gtk-theme-torturer: Blacklist
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
X-List-Received-Date: Mon, 22 Feb 2016 13:08:36 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-extended/gtk-theme-torturer/gtk-theme-torturer_git.bb      | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-extended/gtk-theme-torturer/gtk-theme-torturer_git.bb b/meta-gnome/recipes-extended/gtk-theme-torturer/gtk-theme-torturer_git.bb
index b67806d..2621d15 100644
--- a/meta-gnome/recipes-extended/gtk-theme-torturer/gtk-theme-torturer_git.bb
+++ b/meta-gnome/recipes-extended/gtk-theme-torturer/gtk-theme-torturer_git.bb
@@ -21,4 +21,5 @@ do_install() {
 	install -m 0755 torturer ${D}${bindir}
 }
 
-
+# http://errors.yoctoproject.org/Errors/Details/35132/
+PNBLACKLIST[gtk-theme-torturer] ?= "BROKEN: gmacros.h:182:53: error: size of array '_GStaticAssertCompileTimeAssertion_2' is negative"
-- 
2.7.1


