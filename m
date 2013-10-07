Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id BE1976CCD0
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Oct 2013 23:04:23 +0000 (UTC)
Received: by mail-ee0-f46.google.com with SMTP id c13so3588114eek.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Oct 2013 16:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=WuMwLaEwr/RZJXbtnixHkbp2qq0vAcu6irD6jABI+Ck=;
	b=BritINQ4AQ7f6SNKmxiXXPus238cut0kGX9qr7cG/yGZAiAy0+pHCpVLLVUQMZc8IM
	OnobBWJABmpj5kLOPucBkTw0N681t9T7i4SRYb+l917aItH1azJn0xUmarKR2/vMkCd/
	bFS+fq77NjieFo9g/xskm3C2D0t3gKIIQdYLx8rTDNIKgprZ/FHecuXSA35VQM91sMqG
	70/CvYGT8QX6HHWVwe/v/qvluQY+2GUlc9qTEA6pGLkCeu3ROmeZ6MqSoN1XmQ8wBJhe
	AnR7hhvcffF1uS/rpTq8qspk9Vv0PzEEtIH3HdzOt8q8nNMi2L7+z7/Nfn4dqYNvkEcw
	8f4w==
X-Received: by 10.15.94.201 with SMTP id bb49mr53365439eeb.23.1381187065364;
	Mon, 07 Oct 2013 16:04:25 -0700 (PDT)
Received: from localhost.localdomain (p5B0A2967.dip0.t-ipconnect.de.
	[91.10.41.103])
	by mx.google.com with ESMTPSA id m54sm68507239eex.2.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 07 Oct 2013 16:04:24 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Oct 2013 01:03:52 +0200
Message-Id: <1381187036-3005-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1381187036-3005-1-git-send-email-schnitzeltony@googlemail.com>
References: <1381187036-3005-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe/meta-xfce 2/6] xfce4-settings: set correct version
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
X-List-Received-Date: Mon, 07 Oct 2013 23:04:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

fix commit 23f020f742aea622e5dd7aef81eb59c99f8ef000 which introduced wrong version

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb
index 227858a..f3f5634 100644
--- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb
+++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb
@@ -19,7 +19,7 @@ SRC_URI = " git://gitorious.org/xfce/xfce4-settings.git;protocol=git;branch=for-
 "
 SRCREV = "b7a0e1fd77f5bb5c372223ff62aec7acf252f061"
 S = "${WORKDIR}/git"
-PV = "4.10.0+git${SRCPV}"
+PV = "4.11.0+git${SRCPV}"
  
 EXTRA_OECONF += "--enable-maintainer-mode --disable-debug"
 
-- 
1.8.3.1


