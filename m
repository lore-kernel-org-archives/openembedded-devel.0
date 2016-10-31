Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 24D5A71A7B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Oct 2016 22:11:13 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id p190so14027240wmp.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Oct 2016 15:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=sPdvndZG8yTCSgJaxNfOSs7Bg1qglc+SvgiZ/ya0KFw=;
	b=qqdSWvFQ0vLD9T+2KnO5uyq6dw8+uZ5QyfXd4xLMMN+08UyP/Cr1TOxj5pdJkiTwnG
	FaDt52Mz4ixJF2Ofq0UI3mAusXMk/dwkN9Dk9m3tBpcK3Ir5YlhudlxeJkPuf2ErXV24
	OA5hiUAqvE9rLIrhbh2SHx0DyXl8kNyuyy2312PbLlnRpJCQA5zjrJnNerCZaR9jIyw6
	yFSILGRQDpIqOSQkAyUSCZZ1ChklSGOjf2CjNqQgTefLPDWmc2GjKoe1PnpWRcV7JzfF
	GgPnjYC3V5bn6qSjwyq1hxbNUdRhl6juVR0qFbV9aRxEyAqZ5typ9v63pHDsCEH+jYXn
	7VCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=sPdvndZG8yTCSgJaxNfOSs7Bg1qglc+SvgiZ/ya0KFw=;
	b=HP55q/cJ+0XDA49h5w0tfRWS6ggWmWycS+KluAl0JThWOgzoD+X6IDZu22eX29ttTU
	o8tnUK4sywsjHqrDznhPaD1FWGL/IMPqPRLLBwV/kzRGVngp91SM+b/9lAbWF2UW7oxJ
	A6AU0g2GotdWuuuAneZD+8Psr3VFndItZ8Ajsy1auQy2Sj7wGxFQd3gmFkO+4H2DsU3X
	fdIOXf/+sJHp4TkjoVFH2l+bcjADHV9I6IxUK3ybIKoMNbrmJQ3ldH4szPCoduRxfcsf
	WYtdA643xZ5oNdYlSMsXwZ4rP/II+4HNxUjLy9K6iamWKFHs+mUZiH/0Fht+s3GX6nZM
	xZuw==
X-Gm-Message-State: ABUngvdk49L1NGYtXPbD4/tjPm9uO3/snTT6sTTQa71u9p1V4Y1iOro0nNIne8yqbR+Ydw==
X-Received: by 10.195.11.166 with SMTP id ej6mr17612931wjd.60.1477951874196;
	Mon, 31 Oct 2016 15:11:14 -0700 (PDT)
Received: from localhost.localdomain (p5B0A3FE5.dip0.t-ipconnect.de.
	[91.10.63.229]) by smtp.googlemail.com with ESMTPSA id
	129sm26918697wmq.9.2016.10.31.15.11.13
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 31 Oct 2016 15:11:13 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 31 Oct 2016 23:10:47 +0100
Message-Id: <1477951849-32149-11-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1477951849-32149-1-git-send-email-schnitzeltony@googlemail.com>
References: <1477951849-32149-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 11/13] xfce4-terminal: update to 0.8.1
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
X-List-Received-Date: Mon, 31 Oct 2016 22:11:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../{xfce4-terminal_0.6.3.bb => xfce4-terminal_0.8.1.bb}           | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta-xfce/recipes-apps/xfce4-terminal/{xfce4-terminal_0.6.3.bb => xfce4-terminal_0.8.1.bb} (54%)

diff --git a/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.6.3.bb b/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.1.bb
similarity index 54%
rename from meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.6.3.bb
rename to meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.1.bb
index 98ffec2..9313efb 100644
--- a/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.6.3.bb
+++ b/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.1.bb
@@ -1,13 +1,12 @@
 SUMMARY = "Terminal emulator for the Xfce desktop environment"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-DEPENDS = "glib-2.0 gtk+ vte9 libxfce4ui"
-RDEPENDS_${PN} += "vte9-termcap"
+DEPENDS = "glib-2.0 gtk+3 vte libxfce4ui"
 
 inherit xfce-app
 
 FILES_${PN} += "${datadir}/xfce4 \
                 ${datadir}/gnome-control-center"
 
-SRC_URI[md5sum] = "6a2816d8b0933cd707ed456ceb731399"
-SRC_URI[sha256sum] = "912f4716c2395a14a80620ef982b4af1e2a67a8df9a1ef0b802ecae826057e08"
+SRC_URI[md5sum] = "46d347c0ecbb74a7878d48833042371d"
+SRC_URI[sha256sum] = "ddfe53a89d315a4a9170ca6d2cee2d33145bd63630062b2e867fb3a5fcde5fdf"
-- 
2.5.5


