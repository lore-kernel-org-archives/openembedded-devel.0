Return-Path: <koen@dominion.thruhere.net>
Received: from mail-bk0-f43.google.com (mail-bk0-f43.google.com
	[209.85.214.43])
	by mail.openembedded.org (Postfix) with ESMTP id 057CF6B05F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jan 2014 15:32:41 +0000 (UTC)
Received: by mail-bk0-f43.google.com with SMTP id mx11so440959bkb.30
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jan 2014 07:32:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=8toY4xNGPdMSYEmbWNOdnr+XGZ2tn8AmwfGcrg+CTWs=;
	b=hSXl/oDAzupAWzotd0NRNiWZU4YsJjvPPcDelJjir/yeWAE+XsmgCvNH411gEE0ihL
	S/xR8MrrS6CsOgVDT1IJgeWFjOR0/3VS25ciPYs9TJ2mUDeNAkj7yQxyPB1KLxJYEoFJ
	1lcTjD9jw55tc2B2cDcSeHLhBlTK0QiNFkOW6eeM0a4m29UZEay7L/kHcBJt+E9Gu9po
	djw8ceG5P+FoK8JgoboK4fOE2DMU+NM7rxXGD1wOnDP+wSw1KN30n2Jqa5UkcHJLY8g4
	4yT3oHIpw8atltBLCVrb1k/Br4aM37durakRe1xTsbCtt1oZNiXli/F5kgdKK4pLb83T
	7BFw==
X-Gm-Message-State: ALoCoQlCvTk3dc3uAGienKxlq+FoEkAyOH/8sjfHLD/JmUVtbR1/g2eL+nH0Jhlpv+nqi24oH02o
X-Received: by 10.205.97.6 with SMTP id ci6mr701896bkc.153.1390491161913;
	Thu, 23 Jan 2014 07:32:41 -0800 (PST)
Received: from localhost ([2001:610:612:0:21f:c6ff:feaa:c5fb])
	by mx.google.com with ESMTPSA id s9sm9417876bkg.15.2014.01.23.07.32.40
	for <multiple recipients>
	(version=TLSv1.1 cipher=RC4-SHA bits=128/128);
	Thu, 23 Jan 2014 07:32:40 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Jan 2014 16:32:28 +0100
Message-Id: <1390491148-20966-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
Cc: Koen Kooi <koen@dominion.thruhere.net>, mporter@linaro.org
Subject: [meta-oe][PATCH] libusbg: add 0.1.0
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
X-List-Received-Date: Thu, 23 Jan 2014 15:32:42 -0000

This needs a 3.11.x kernel or newer for the configfs stuff.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/recipes-support/libusbg/libusbg_git.bb |   14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-oe/recipes-support/libusbg/libusbg_git.bb

diff --git a/meta-oe/recipes-support/libusbg/libusbg_git.bb b/meta-oe/recipes-support/libusbg/libusbg_git.bb
new file mode 100644
index 0000000..ed5ac65
--- /dev/null
+++ b/meta-oe/recipes-support/libusbg/libusbg_git.bb
@@ -0,0 +1,14 @@
+SUMMARY = "USB Gadget Configfs Library"
+
+LICENSE = "GPLv2 & LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://COPYING.LGPL;md5=4fbd65380cdd255951079008b364516c"
+
+inherit autotools
+
+PV = "0.1.0"
+SRCREV = "7e2b04363f319e8936a606bdb122dbde249a2f58"
+SRC_URI = "git://github.com/libusbg/libusbg.git"
+
+S = "${WORKDIR}/git"
+
-- 
1.7.10


