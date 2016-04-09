Return-Path: <net147@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 316A877180
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  9 Apr 2016 11:16:03 +0000 (UTC)
Received: by mail-pa0-f51.google.com with SMTP id td3so90159416pab.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Apr 2016 04:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=gibMxLZXHkQOvG1Q4EgNUFR80+NuyX23M/hesrwR/5U=;
	b=EkK8uigtxF724lLveylDEJcv/KmXqzAsa4o6Zn40AqaYUKGH3+2PVvRkWIFyeywgXe
	UhtRGYAOR3dn8Z86rfS61M3fykkkhFdPJqQobZxh3OZHqC4ltt5DuhU+cNnlvXc4Xti2
	0ANoBNMTqaK02m7epOcMG7y3KbNJREuCuSMs5gx0sOzuUuC/ng2nhE5r5oteekqWfX/4
	Js07c5dTyB/le1MD5yhgqBjPYKkWyE4syp0DbvMiE4yUSQVURYleZ6D/p0XbHDxu29Xo
	QrZ9+bJZsXgb0pQ/iP1A9CCQRZ3OLW2+ZFzhEpDlDFxp68RSmp9aC7KYU5woEA855PZN
	IKqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=gibMxLZXHkQOvG1Q4EgNUFR80+NuyX23M/hesrwR/5U=;
	b=W2MQpLox7HopCspFcxIq2xZdVfwD0PvlIv0OCeLdwiQxO18jwKWs2opzD8S/H7Eyeq
	auAJaoFJ+ldNvf/b8zDSfn6Oav9cQwgzz8/BtbcIUn4enou4helZLVyXkWecqFOxf7w0
	5aH6SS9jgTzB3Z2CtNpBngDVVHPz3Fs3Vwmv1rGSWqeCjLSAmiog7gwB2QbT1h1tFVhu
	ZYfQGN7Dp7VQytOrZVMNgn1ZmAtIAvfoyPjv+un3V3m+TM2w5R/5HqzJgYy0rWs3SndP
	LlR/SMdDCQOZiXHbcWcxma6ULtpXLYFzpzn0hdU30YU1A87gEvH1pq3d0RXdaNwOLQAD
	Sozw==
X-Gm-Message-State: AD7BkJJSIopx4gm4Gnjn52mJW7qIAgnDo3zvZpk8CGVmpKBWgbqQyR+hxsrmVGTnVeXyIQ==
X-Received: by 10.67.2.41 with SMTP id bl9mr19017740pad.39.1460200564110;
	Sat, 09 Apr 2016 04:16:04 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by smtp.gmail.com with ESMTPSA id
	19sm24390061pfp.66.2016.04.09.04.16.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Apr 2016 04:16:02 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Apr 2016 21:15:41 +1000
Message-Id: <1460200541-14594-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-qt5][PATCH] quazip: update to 0.7.2
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
X-List-Received-Date: Sat, 09 Apr 2016 11:16:04 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 recipes-qt/quazip/{quazip_0.7.1.bb => quazip_0.7.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename recipes-qt/quazip/{quazip_0.7.1.bb => quazip_0.7.2.bb} (69%)

diff --git a/recipes-qt/quazip/quazip_0.7.1.bb b/recipes-qt/quazip/quazip_0.7.2.bb
similarity index 69%
rename from recipes-qt/quazip/quazip_0.7.1.bb
rename to recipes-qt/quazip/quazip_0.7.2.bb
index 4ba4197..6b09cf9 100644
--- a/recipes-qt/quazip/quazip_0.7.1.bb
+++ b/recipes-qt/quazip/quazip_0.7.2.bb
@@ -4,8 +4,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=27818cd7fd83877a8e3ef82b82798ef4"
 DEPENDS = "qtbase"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.gz"
-SRC_URI[md5sum] = "3b99effb2a9417707d463e6f19cf2629"
-SRC_URI[sha256sum] = "78c984103555c51e6f7ef52e3a2128e2beb9896871b2cc4d4dbd4d64bff132de"
+SRC_URI[md5sum] = "84163487a4c3470781c93e5f56c4ca43"
+SRC_URI[sha256sum] = "91d827fbcafd099ae814cc18a8dd3bb709da6b8a27c918ee1c6c03b3f29440f4"
 
 inherit qmake5
 
-- 
2.7.4


