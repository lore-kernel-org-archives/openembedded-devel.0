Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 33E76771C6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 11:59:13 +0000 (UTC)
Received: by wmww144 with SMTP id w144so197240679wmw.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 03:59:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=jlA+pjhzp9n6StUuxyy8ENXF89hOC9kHPVOz9fmNwZs=;
	b=MtjdCCc2HLLXG+zuO3psCx5NO3XpxxDhQP+RiUxCUxbqqutMnlrvyisFwll8lGtCDg
	ID47L+TBv+Cy4KNzF81TaVuEh/KwCFJAGGa5LCOmuFoM5Mtnfd0rGhVDQOl4MRGaTLMg
	7li0Ys5tuLVW99JalvKNxeUay8784zZSBy+QGW5v9jIL5EuEPHmKsFNZ1GUxYELAcHAH
	MxXB346X/XEjt5CqhNRkCIhmeTE8MERr3v+FROEKTQ4kfSzk6uthsmz4EHcFOVQIqSWx
	Y8FuHzImtZ6ro1PM6wS6BMuCMijLTbTTN8L7eBXCTCU6K2+zbE/DHeHGJW3M+2L2QSD5
	gkiQ==
X-Received: by 10.194.94.100 with SMTP id db4mr15170011wjb.110.1447329553933; 
	Thu, 12 Nov 2015 03:59:13 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id u4sm7734475wjz.4.2015.11.12.03.59.12
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Nov 2015 03:59:13 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Nov 2015 12:59:28 +0100
Message-Id: <1447329568-29737-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
Subject: [PATCH][meta-multimedia] gst-plugins-good: add PACKAGECONFIG for dv1394
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
X-List-Received-Date: Thu, 12 Nov 2015 11:59:14 -0000

* ERROR: gst-plugins-good: gst-plugins-good-1394 package isn't created when building with minimal dependencies?
  ERROR: gst-plugins-good: gst-plugins-good-1394-dev package isn't created when building with minimal dependencies?

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-multimedia/gstreamer-0.10/gst-plugins-good_0.10.31.bb        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-good_0.10.31.bb b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-good_0.10.31.bb
index eaf3b1f..d922895 100644
--- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-good_0.10.31.bb
+++ b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-good_0.10.31.bb
@@ -22,6 +22,7 @@ PACKAGECONFIG[libv4l] = "--with-libv4l2,--without-libv4l2,libv4l"
 PACKAGECONFIG[bzip2] = "--enable-bz2,--disable-bz2,bzip2"
 PACKAGECONFIG[orc] = "--enable-orc,--disable-orc,orc"
 PACKAGECONFIG[x11] = "--enable-x,--disable-x,virtual/libx11 libxfixes libxdamage"
+PACKAGECONFIG[dv1394] = "--enable-dv1394,--disable-dv1394,libraw1394 libiec61883 libavc1394"
 
 DEPENDS += "gst-plugins-base gconf cairo libpng zlib libid3tag flac \
             speex libsoup-2.4 libcap"
-- 
2.6.3


