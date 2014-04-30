Return-Path: <koen.kooi@linaro.org>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 3855E6121F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Apr 2014 04:49:59 +0000 (UTC)
Received: by mail-wi0-f169.google.com with SMTP id hi5so1484889wib.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Apr 2014 21:50:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=pN/6jdK3RmGe0Ti7rV+Q965unUBJFaZqM8mp4Fwcvzc=;
	b=meENvGIVl1PZt9bYqTIzqgaycrFplRTh94i4YyTWFzIo6P1MIMu/w1yAmdxW5nA62o
	q079IZTgxdOv5cXjM/PwrJW94uAMzlihEMu7uugFuAltam3ZXIov1O2fN87pWrfVJnbD
	BYNCAS/kauHL9dCHlQsOPjJk6RNdJhR8KkppYggZTTHGuuiY2iXupS4hsNOiwTOm9LDz
	8uHCacehaELxc8cvKGutiq8j/1ZUS6X0KzJONwxqCrjKXXvYHGlaCuMn8WXe5jDL7ygv
	Db1oMzP8PKjDnUtxMsJkk/pLm9gfiz68G6R2vF7RDOgnhHE5RwBvmCoGgJxKTDgoWnYs
	ge6A==
X-Gm-Message-State: ALoCoQnDS8Swuux71f+0FAVHA4RoVcNb9Oq+RICyXlRCNIccfHl5Q3KyMCEUK4LpjfFgaAv64eRR
X-Received: by 10.194.188.68 with SMTP id fy4mr1768707wjc.30.1398833400211;
	Tue, 29 Apr 2014 21:50:00 -0700 (PDT)
Received: from localhost ([2001:610:612:0:5e51:4fff:fec8:7c15])
	by mx.google.com with ESMTPSA id gz1sm1034164wib.14.2014.04.29.21.49.58
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Apr 2014 21:49:59 -0700 (PDT)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Apr 2014 06:49:56 +0200
Message-Id: <1398833396-17027-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 1.9.0
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [meta-networking][PATCH] bridge-utils: inherit autotools-brokensep
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
X-List-Received-Date: Wed, 30 Apr 2014 04:50:04 -0000

| NOTE: make DESTDIR=/build/linaro/build/build/tmp-eglibc/work/aarch64-oe-linux/bridge-utils/1.5-r0/image install
| for x in libbridge brctl doc; do make  -C $x install; done
| make[1]: Entering directory `/build/linaro/build/build/tmp-eglibc/work/aarch64-oe-linux/bridge-utils/1.5-r0/build/libbridge'
| make[1]: Nothing to be done for `install'.
| make[1]: Leaving directory `/build/linaro/build/build/tmp-eglibc/work/aarch64-oe-linux/bridge-utils/1.5-r0/build/libbridge'
| make[1]: Entering directory `/build/linaro/build/build/tmp-eglibc/work/aarch64-oe-linux/bridge-utils/1.5-r0/build/brctl'
| make[1]: *** No rule to make target `brctl.o', needed by `brctl'.  Stop.
| make[1]: Leaving directory `/build/linaro/build/build/tmp-eglibc/work/aarch64-oe-linux/bridge-utils/1.5-r0/build/brctl'
| make[1]: Entering directory `/build/linaro/build/build/tmp-eglibc/work/aarch64-oe-linux/bridge-utils/1.5-r0/build/doc'
| mkdir -p /build/linaro/build/build/tmp-eglibc/work/aarch64-oe-linux/bridge-utils/1.5-r0/image/usr/share/man/man8
| /usr/bin/install -c -m 644 brctl.8 /build/linaro/build/build/tmp-eglibc/work/aarch64-oe-linux/bridge-utils/1.5-r0/image/usr/share/man/man8
| /usr/bin/install: cannot stat 'brctl.8': No such file or directory
| make[1]: *** [install] Error 1

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 meta-networking/recipes-support/bridge-utils/bridge-utils.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/bridge-utils/bridge-utils.inc b/meta-networking/recipes-support/bridge-utils/bridge-utils.inc
index e06c32e..feeba74 100644
--- a/meta-networking/recipes-support/bridge-utils/bridge-utils.inc
+++ b/meta-networking/recipes-support/bridge-utils/bridge-utils.inc
@@ -11,7 +11,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/bridge/bridge-utils-${PV}.tar.gz \
           file://bridge-utils-1.5-fix-incorrect-command-in-manual.patch \
 "
 
-inherit autotools update-alternatives
+inherit autotools-brokensep update-alternatives
 
 ALTERNATIVE_${PN} = "brctl"
 ALTERNATIVE_PRIORITY[brctl] = "100"
-- 
1.9.0


