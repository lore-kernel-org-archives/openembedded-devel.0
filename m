Return-Path: <vomegaz@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id 0B6A8606E8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 May 2015 10:04:37 +0000 (UTC)
Received: by wibt6 with SMTP id t6so41810047wib.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 May 2015 03:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=WK0NZs+JvWdSU4/nC1F1YmvFrULLe5hUvHHk87wtE6I=;
	b=KCI+DDnZdFxfy0BoKqKbtEccpd3zawk0mDr/hECqAS3NnXGCWvgWK4RbWcQXSJ3OBv
	YO9Afet0f3r5bHhrW2mDw1LmCCCYT0YEAWMZPsG9GPl1FypM0ERNVIRsfOoDhwtvF6qR
	wheZjA/40+xPLNTVNhowGV9wn4ghNpocue7X6VBSvlE1s7F4156bJ4MILeNIdDjEgWUz
	uyoIAAUJE1boAhJ1kamJgjiWfGvtCTLJoBPj/Adx4N3FO4OklLq06Rf8HQT9Gj4zFxgG
	59WBLivkgaK2OT7hUGG0F+UrrZRpk8zGgO/XTxHKLoliiZyK1RlzaABDdkIv1aoEBWe9
	KsnQ==
X-Received: by 10.194.81.169 with SMTP id b9mr13279940wjy.126.1432289078289;
	Fri, 22 May 2015 03:04:38 -0700 (PDT)
Received: from X220.tupi.fr ([37.164.121.82]) by mx.google.com with ESMTPSA id
	mc20sm6747588wic.15.2015.05.22.03.04.36
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 May 2015 03:04:37 -0700 (PDT)
Sender: Thomas PERROT <vomegaz@gmail.com>
From: Thomas Perrot <thomas.perrot@tupi.fr>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 May 2015 12:04:34 +0200
Message-Id: <1432289074-1358-1-git-send-email-thomas.perrot@tupi.fr>
X-Mailer: git-send-email 1.7.10.4
Subject: [meta-raspberrypi][PATCH] If SERIAL_CONSOLE is already define by another layer, this value may not be good.
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
X-List-Received-Date: Fri, 22 May 2015 10:04:38 -0000

Signed-off-by: Thomas Perrot <thomas.perrot@tupi.fr>
---
 conf/machine/include/rpi-base.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/machine/include/rpi-base.inc b/conf/machine/include/rpi-base.inc
index a26803a..1dda207 100644
--- a/conf/machine/include/rpi-base.inc
+++ b/conf/machine/include/rpi-base.inc
@@ -7,7 +7,7 @@ include conf/machine/include/soc-family.inc
 
 IMAGE_FSTYPES ?= "tar.bz2 ext3 rpi-sdimg"
 
-SERIAL_CONSOLE ?= "115200 ttyAMA0"
+SERIAL_CONSOLE = "115200 ttyAMA0"
 
 XSERVER = " \
     xserver-xorg \
-- 
1.7.10.4


