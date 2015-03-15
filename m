Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id D1E506AC33
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Mar 2015 23:34:09 +0000 (UTC)
Received: by wibg7 with SMTP id g7so21288362wib.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Mar 2015 16:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=LhE3FjCDGrXzg0Eb30NTJpC8FiDg1+mUloHGTAHPJn8=;
	b=M0drEmp/Ip6EaM1GQSSyeTyAXMp6k5Px6l1o6AVt8DTa3kS1Z/jDQMxlf1P4JG1T8w
	IJ0sRK07OQG+1ouVeZX08ly0HXT+4S7EpJDZFNDfWpDtxWpt3F3sQlM38zlqayLOQaZN
	EJ9lje8NDjKKZopjVKGS9UyD7tL1Sby6GSbTib9QDjYnt3n2ULlcShgZIZM5MvZ37XQg
	M/o/7Yt/3TfqAoOPEDOQx0ni9ta5QgjUcjUWQN7hN1GjKVzC/hshRGR/hfcdiey9EZJt
	7dkOVRHeMkU9ztWFtSpOpyP4+Jly0Q0oRCooTIdMduQOPypGs1jTFzCYqR2l+H6NaqZL
	9RRQ==
X-Received: by 10.194.241.202 with SMTP id wk10mr90845887wjc.145.1426462450394;
	Sun, 15 Mar 2015 16:34:10 -0700 (PDT)
Received: from localhost.localdomain (p54AA52CC.dip0.t-ipconnect.de.
	[84.170.82.204]) by mx.google.com with ESMTPSA id
	r14sm12804945wiv.13.2015.03.15.16.34.09
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Mar 2015 16:34:09 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Mar 2015 00:33:21 +0100
Message-Id: <1426462419-10173-13-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1426462419-10173-1-git-send-email-schnitzeltony@googlemail.com>
References: <1426462419-10173-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH][meta-xfce 12/30] thunar-volman: update to 0.8.1
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
X-List-Received-Date: Sun, 15 Mar 2015 23:34:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../thunar-volman/{thunar-volman_0.8.0.bb => thunar-volman_0.8.1.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/thunar-volman/{thunar-volman_0.8.0.bb => thunar-volman_0.8.1.bb} (74%)

diff --git a/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.8.0.bb b/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.8.1.bb
similarity index 74%
rename from meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.8.0.bb
rename to meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.8.1.bb
index 909ae85..6e63bef 100644
--- a/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.8.0.bb
+++ b/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.8.1.bb
@@ -6,8 +6,8 @@ DEPENDS = "exo glib-2.0 gtk+ libxfce4ui libxfce4util xfconf libnotify udev"
 
 inherit xfce
 
-SRC_URI[md5sum] = "250af757ea629c7c27f554d17119080c"
-SRC_URI[sha256sum] = "ff0887c862b578580d05f4cd7db66081382ff143f9cc7ea3c9ba58cf5d02bceb"
+SRC_URI[md5sum] = "65ab6e05b2e808d1dcc8d36683a59b7e"
+SRC_URI[sha256sum] = "5a08bb5ce32c296a64dfbdb2406d4e45a208b2c91e4efa831dc28f1d6c2ac2bd"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[notify] = "--enable-notifications,--disable-notifications,libnotify"
-- 
1.9.3


