Return-Path: <thomas.senyk@pelagicore.com>
Received: from mail-ee0-f41.google.com (mail-ee0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id 06F206F69F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Mar 2014 14:33:11 +0000 (UTC)
Received: by mail-ee0-f41.google.com with SMTP id t10so2991437eei.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Mar 2014 07:33:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ZnaJaUJQJNWMeubBvroeozKt5j/4mEt0l+4pxGURJYw=;
	b=ipVyIbLdjPzjxRc7Wj1J0uHDAp3uaz5h+fRCxhylwifRQKxb/bw56n0O801T6t6G2q
	KLhwPNs1yY+6a4poncRguzj6ncGU8ReRgJC2UPjgsMh2CYSlH80be1ETKTX253ERDus+
	lz7bZg3eEagm/TsHi6Su4vDduyLfuJqPt8+7NS06NqFOmlXmeEZSzTKHaab31PwwxyJh
	6Dx/ubKcQ70edkIL+8yV10gxfzz2v5cxsbo7xmeXgEeLZkuEwwYerO6WDuDPfhguiiFz
	bew4VVc2ypKmGjvtPSk7pNVuTIj+1Otqz6DQtjTrciFMroSDG491sbIt3dJdcwXhBSKt
	FwXA==
X-Gm-Message-State: ALoCoQmb6XHG1QUW8e3wL9U7/9amNu7niJUfYD6kHBTE28Zhrg5HYvC4zxUtALVCqh6cr3QmceV9
X-Received: by 10.15.64.75 with SMTP id n51mr2011163eex.33.1395930792737;
	Thu, 27 Mar 2014 07:33:12 -0700 (PDT)
Received: from rudolf.pelagicore.de (ppp-83-171-184-33.dynamic.mnet-online.de.
	[83.171.184.33])
	by mx.google.com with ESMTPSA id s46sm4762043ees.3.2014.03.27.07.33.12
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 27 Mar 2014 07:33:12 -0700 (PDT)
From: Thomas Senyk <thomas.senyk@pelagicore.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Mar 2014 15:33:07 +0100
Message-Id: <1395930787-25372-1-git-send-email-thomas.senyk@pelagicore.com>
X-Mailer: git-send-email 1.8.5.4
Subject: [PATCH] qtbase.inc: add -no-xkbcommon
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
X-List-Received-Date: Thu, 27 Mar 2014 14:33:14 -0000

If one builds with xkb, both -no-xkb and
-no-xkbcommon should be set.
Without -no-xkbcommon you'll get link-errors
for libcomposeplatforminputcontextplugin.so
---
 recipes-qt/qt5/qtbase.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
index 89736be..8aefb5c 100644
--- a/recipes-qt/qt5/qtbase.inc
+++ b/recipes-qt/qt5/qtbase.inc
@@ -105,7 +105,7 @@ PACKAGECONFIG[xsync] = "-xsync,-no-xsync"
 PACKAGECONFIG[xvideo] = "-xvideo,-no-xvideo"
 PACKAGECONFIG[openvg] = "-openvg,-no-openvg"
 PACKAGECONFIG[iconv] = "-iconv,-no-iconv,virtual/libiconv"
-PACKAGECONFIG[xkb] = "-xkb,-no-xkb,libxkbcommon"
+PACKAGECONFIG[xkb] = "-xkb,-no-xkb -no-xkbcommon,libxkbcommon"
 PACKAGECONFIG[evdev] = "-evdev,-no-evdev"
 PACKAGECONFIG[mtdev] = "-mtdev,-no-mtdev,mtdev"
 # depends on glib
-- 
1.8.5.4


