Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id A49216F8C5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Mar 2014 21:53:03 +0000 (UTC)
Received: by mail-ig0-f182.google.com with SMTP id uy17so2826726igb.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Mar 2014 14:53:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=cCi/c9DRSQiSP+wMB0XRGS7AJUAecdt1m1AWkoTj91Y=;
	b=Uhv5aRf8bpKqYpjhjX9i+X42KHmahU7I1rIVLMPUa9s1Y0MAjPtWrDnMJ6cY4jjh8S
	PJy98MiMJdwHyi1hdHPnzRoIiBNUvdaw7cBPD0Sgetv3GpM0DzFwpp4FawWNsB29u2VS
	cttHx5H4WZNxLgVAW7YEuU+5NL8t+5mnEBgoQl/pLEyTq5UyFX2SxXawSLAcP6M+QhS4
	cvuAFmXEqqGiSPuBW/49wCmWqGRbZSz4J4fl5nt/7pdVsfiAHw9Y5OBISj9dmaM4xw8P
	EEpEXiD5L2GFNH4HbWc76AO3135Q2j4GvuxIwggqIlkcH1Wd44PcZFkrMOYEP4fsBnVD
	VHCw==
X-Gm-Message-State: ALoCoQksFn6C+8bztwdmpRivCY8StrIFqZf+kd9/kN1MIy+9L1cpcR/nz6RLYLnTRFyorNI/5X0v
X-Received: by 10.43.155.209 with SMTP id lj17mr91187icc.94.1396216384401;
	Sun, 30 Mar 2014 14:53:04 -0700 (PDT)
Received: from openSUSE-i7.site (69-165-220-158.dsl.teksavvy.com.
	[69.165.220.158]) by mx.google.com with ESMTPSA id
	ro10sm20898837igb.6.2014.03.30.14.53.03 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 30 Mar 2014 14:53:03 -0700 (PDT)
From: Trevor Woerner <trevor.woerner@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 30 Mar 2014 17:52:52 -0400
Message-Id: <1396216372-6712-1-git-send-email-trevor.woerner@linaro.org>
X-Mailer: git-send-email 1.9.0
Cc: patches@linaro.org
Subject: [meta-gnome][PATCH] libgnomecanvas: add 'intltool-native' DEPENDS
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
X-List-Received-Date: Sun, 30 Mar 2014 21:53:06 -0000

Signed-off-by: Trevor Woerner <trevor.woerner@linaro.org>
---
 meta-gnome/recipes-gnome/libgnome/libgnomecanvas_2.30.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/libgnome/libgnomecanvas_2.30.3.bb b/meta-gnome/recipes-gnome/libgnome/libgnomecanvas_2.30.3.bb
index 4a210a4..0f41bb6 100644
--- a/meta-gnome/recipes-gnome/libgnome/libgnomecanvas_2.30.3.bb
+++ b/meta-gnome/recipes-gnome/libgnome/libgnomecanvas_2.30.3.bb
@@ -5,7 +5,7 @@ SECTION = "x11/gnome/libs"
 
 inherit gnome
 
-DEPENDS = "gtk+ libglade libart-lgpl xineramaproto"
+DEPENDS = "gtk+ libglade libart-lgpl xineramaproto intltool-native"
 
 SRC_URI[archive.md5sum] = "ffcbb719c671ff5cd86e59aeba8d0b92"
 SRC_URI[archive.sha256sum] = "859b78e08489fce4d5c15c676fec1cd79782f115f516e8ad8bed6abcb8dedd40"
-- 
1.9.0


