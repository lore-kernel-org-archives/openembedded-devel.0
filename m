Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wr0-f176.google.com (mail-wr0-f176.google.com
	[209.85.128.176])
	by mail.openembedded.org (Postfix) with ESMTP id 2B89D77CE4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 19:56:59 +0000 (UTC)
Received: by mail-wr0-f176.google.com with SMTP id o21so23924525wrb.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 12:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=yJfuxiLID5xm49xycUXpxkBftxyYdMoPac1KjSHjouU=;
	b=WixLJ+nUz5sPtdW3SWsuE8pCLke2puaE+uSGPAD9+pCadBQrJD3NmuUBgJtuLgMjx1
	5gegohf6/fjVww6G3teMfUYp95mlHptxa8yYimCTHe8KmtHFZF1EmC2mnzne0wt07y+Q
	JYKx+qH2ev56WnoA7PopzrTJVGRfIXyfEBpF8AUm51se8CkayFrUvcr0L4c0YGK/eH9n
	AvFupVVCNNFMSIphO/Oj4nRhHG0WKp+nlvWOevtjD+yfR1xgjfXBuZ07MmsLxTACIzUV
	7a+lE8iYoxEiFiwFuGWinfFheDnmaY3cvjhlhILfyBeVV5p7hT2qY1UnssZutqWoLBcd
	tS4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=yJfuxiLID5xm49xycUXpxkBftxyYdMoPac1KjSHjouU=;
	b=qyZQrW2KCGVX3nyAVYHsssFGzXVHlKypSn1APkEQzlwmF2p4jbeyOt1fNCrjWBywTR
	3upJtKZg0tWbICPJ89FDlGvW/UxChCSjYcdN+5oGiMPHZMU7lv+lCNQFiEtdvN0yOQXC
	mBGmxiXstO6SPSgLIg5Pw0xk6xovlYeumJY1YGbT0/C2y3xXBBe+L8PKNBEbHciCPAW6
	ZyChY6z09H82sBxujQ9CarUYzvKfVjhQD78YHm1tyFuWZSCSRLgdPfDs1Y1vmoWrp9Xb
	T7WMH299vUpLC0SaCRKBECcp1Zr/WfsVHtFoULve+onEe4R7wojdIaOOw3mMZaGtLLRw
	xVFQ==
X-Gm-Message-State: AN3rC/6TrBkfUCsQfxOUQhJPP0NUQ3K0jG/UMusekR31OJEBckgp2OkM5QiaTbr7Cq2mEw==
X-Received: by 10.223.163.204 with SMTP id m12mr3803230wrb.107.1492027020684; 
	Wed, 12 Apr 2017 12:57:00 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E911F1781E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e911:f178:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	t100sm3522637wrc.24.2017.04.12.12.56.59
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Apr 2017 12:57:00 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Apr 2017 21:56:19 +0200
Message-Id: <20170412195638.3243-11-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170412195638.3243-1-schnitzeltony@googlemail.com>
References: <20170412195638.3243-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 10/29] xfwm4: 4.12.3 -> 4.12.4
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
X-List-Received-Date: Wed, 12 Apr 2017 19:57:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

After ages my patch was finally applied

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...-display-events-when-time-is-set-backward.patch | 33 ----------------------
 .../xfwm4/{xfwm4_4.12.3.bb => xfwm4_4.12.4.bb}     |  5 ++--
 2 files changed, 2 insertions(+), 36 deletions(-)
 delete mode 100644 meta-xfce/recipes-xfce/xfwm4/files/0001-don-t-block-display-events-when-time-is-set-backward.patch
 rename meta-xfce/recipes-xfce/xfwm4/{xfwm4_4.12.3.bb => xfwm4_4.12.4.bb} (80%)

diff --git a/meta-xfce/recipes-xfce/xfwm4/files/0001-don-t-block-display-events-when-time-is-set-backward.patch b/meta-xfce/recipes-xfce/xfwm4/files/0001-don-t-block-display-events-when-time-is-set-backward.patch
deleted file mode 100644
index 08fd76b..0000000
--- a/meta-xfce/recipes-xfce/xfwm4/files/0001-don-t-block-display-events-when-time-is-set-backward.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From e87977696f03b0c9f72884f8e3e3ec3248dfd80a Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
-Date: Tue, 18 Jun 2013 12:46:42 +0200
-Subject: [PATCH] don't block display events when time is set backwards
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Upstream-Status: Submitted [1]
-
-[1] https://bugzilla.xfce.org/show_bug.cgi?id=10184
-
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
----
- src/display.c |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-diff --git a/src/display.c b/src/display.c
-index 00318d5..651bc7a 100644
---- a/src/display.c
-+++ b/src/display.c
-@@ -733,7 +733,7 @@ myDisplayUpdateCurrentTime (DisplayInfo *display, XEvent *ev)
-             break;
-     }
- 
--    if ((timestamp != (guint32) CurrentTime) && TIMESTAMP_IS_BEFORE(display->current_time, timestamp))
-+    if ((timestamp != (guint32) CurrentTime) /*&& TIMESTAMP_IS_BEFORE(display->current_time, timestamp)*/)
-     {
-         display->current_time = timestamp;
-     }
--- 
-1.7.6.5
-
diff --git a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.12.3.bb b/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.12.4.bb
similarity index 80%
rename from meta-xfce/recipes-xfce/xfwm4/xfwm4_4.12.3.bb
rename to meta-xfce/recipes-xfce/xfwm4/xfwm4_4.12.4.bb
index ad70860..2aa68e3 100644
--- a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.12.3.bb
+++ b/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.12.4.bb
@@ -8,9 +8,8 @@ inherit xfce update-alternatives distro_features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI += "file://0001-don-t-block-display-events-when-time-is-set-backward.patch"
-SRC_URI[md5sum] = "197ef087ca6a263627f1bea6d5a79d6f"
-SRC_URI[sha256sum] = "f4a988fbc4e0df7e8583c781d271559e56fd28696092f94ae052e9e6edb09eac"
+SRC_URI[md5sum] = "3ec136efc5387fd3b53cd66b684f52d7"
+SRC_URI[sha256sum] = "fa74048a75649a6e92df763a3cfb706d3fed1e1a6adf567f6693325a5a6efb36"
 
 python populate_packages_prepend () {
     themedir = d.expand('${datadir}/themes')
-- 
2.9.3


