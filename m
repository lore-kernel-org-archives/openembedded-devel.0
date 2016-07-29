Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id D95D86FF0E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jul 2016 14:25:27 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id q8so7136318qke.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jul 2016 07:25:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=FQyvtgj5qKxtHwc2yEvUOJEgkWSk6Bqu5+ZRpCl0ow8=;
	b=KtLWoM8u7a7SkmpnHHmjyWBiJ7RMD5giwelOohD+0oOM4SDK6QMm18uaKE1XfjCBn4
	JC4XjRY8QoLJYyCZnEWDdtGgDmFEyuGY4DS+DhQCT41x6B2rfic9kBM5Sd5V360tgVFv
	8IE4oazFAnUhGuRA/fvFZ/B8CjI30oaIf37B0YDCfn5ZSJNtFXZH6SpBQaolwx+gTi62
	eFusT5R8/UTJa0DIbU/RLQhxxj9XSm3BHOEhQIp6+sDwfF9fu+U3jXSVOAJ1uSYUn9l9
	Y8jFMrKhkyqL9T2jzulXK4KCvFjcXzehEYPUotlIFJJyqs98KaFM7NmN4l8N3XJ0MFAX
	ZxRQ==
X-Gm-Message-State: AEkoouuSajgGAM1X+iCHPGFBGBp6smm0JgSvpgr1TEhk2sAoR46s3eDVCAkDa/r8HD7EQQ==
X-Received: by 10.55.181.193 with SMTP id e184mr48042727qkf.181.1469802327903; 
	Fri, 29 Jul 2016 07:25:27 -0700 (PDT)
Received: from lnx-desktop.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	l89sm10109559qte.41.2016.07.29.07.25.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 29 Jul 2016 07:25:27 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 29 Jul 2016 10:25:07 -0400
Message-Id: <1469802308-23540-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Subject: [meta-webserver][PATCH 1/2] nostromo: remove useradd of a user already provided by base-passwd
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
X-List-Received-Date: Fri, 29 Jul 2016 14:25:30 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-webserver/recipes-httpd/nostromo/nostromo_1.9.6.bb | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.6.bb b/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.6.bb
index e06a696..7d660ce 100644
--- a/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.6.bb
+++ b/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.6.bb
@@ -18,7 +18,7 @@ TARGET_CC_ARCH += "${LDFLAGS}"
 
 DEPENDS = "openssl"
 
-inherit update-rc.d useradd
+inherit update-rc.d
 
 INITSCRIPT_NAME = "nostromo"
 INITSCRIPT_PARAMS = "defaults 70"
@@ -27,11 +27,6 @@ do_compile() {
     oe_runmake
 }
 
-# we need user/group www-data to exist when we install
-#
-USERADD_PACKAGES = "${PN}"
-USERADD_PARAM_${PN} = "--system -g www-data www-data"
-
 do_install() {
     install -d ${D}/${sbindir}
     install -m 0755 src/nhttpd/nhttpd ${D}/${sbindir}/nhttpd
-- 
1.9.1


