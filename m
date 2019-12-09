Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id E2CEB60807
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Dec 2019 00:38:51 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id b6so14141544wrq.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Dec 2019 16:38:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=7LAL7ZDGPD+hUgmHsRS+tvPZKbi8jEWMtL3SdvVLSps=;
	b=ZDawDgJBjQGZaz2tjFxXrka4G+OUZi/kxe23vI1cbw0D8K9x1bI31n6PEz/SMPJclT
	i5A598MHlYTlwZ4+zjpBHkbsv1dB1TsJRNEm5yiaLkKpmpY7HXHbRWCIfdZHsIRhvNw3
	irZCAb98Spa0lKLr3WfRPkwAarPhG8pfn5O3940gwj3T8VXrXggTo8WjnZj38R9XLFF9
	C23a0oF2akTBkDMg1A1O55JUTH2pHE/RogF3g/DRM0td4pwQCha7wI+9XAHmKIvsMzqf
	kFJ0AmR/haNQLEN07GSfsHIS6efaVADs9ocqjzikStEYu7lQ1W+G7nbD6fkCubvlTOHP
	hEaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=7LAL7ZDGPD+hUgmHsRS+tvPZKbi8jEWMtL3SdvVLSps=;
	b=R5Ig3owHkyODYGmnTS+7tvyfLk8alW61UMkymwpejEAxB1eaGuZAMRqA4R409KnZWg
	0Y6ASxxzMhfN0/kEP6QyV3gG3hxPtwMODMTckA2fJ6MBMAsGR7BHHfR4LV7gUDFUIsW9
	Ia79pNMB3FBOvaZObpBoVKp6nC3RbVZ0hknJ9gJDTB3wYxJP2eoIJg/RpHqkLZBsx1RU
	lAtWxWJR+9TIWYBX51sEVRa0KpedcqcbOcxdwgZ/hcS5JBqlSowZWa7iqeFO2qCXKjZN
	P3ye2CT3triQDZbQ+McHjFlSaByGd3maSRNU6PoQVE3cJDu+l6B6dWOerYXhtG8SHkY4
	9FlQ==
X-Gm-Message-State: APjAAAUaOeyxK4GQ1vonbEVMymkm+BJAsNqnlxXcxa8Aj/XygQ6SFc5P
	JdLx/pCT/3ebkQbguZtthgqUHbhW
X-Google-Smtp-Source: APXvYqzR0E8FdgOI9R9gHeRORgmLj+Igh9Yz18+aa628gzy7RS1RfvjA2s0SQQUuT8y5otRzBDdVvA==
X-Received: by 2002:a5d:4b8f:: with SMTP id b15mr29020577wrt.100.1575851932468;
	Sun, 08 Dec 2019 16:38:52 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0A9021072C1E15EE839E10.dip0.t-ipconnect.de.
	[2003:f0:7f0a:9021:72c:1e15:ee83:9e10])
	by smtp.gmail.com with ESMTPSA id
	n30sm11403575wmd.3.2019.12.08.16.38.51
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 08 Dec 2019 16:38:51 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Dec 2019 01:38:12 +0100
Message-Id: <20191209003840.3383-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191209003840.3383-1-schnitzeltony@gmail.com>
References: <20191209003840.3383-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 01/29] pinpoint: remove dead project
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
X-List-Received-Date: Mon, 09 Dec 2019 00:38:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-apps/pinpoint/pinpoint_git.bb     | 24 -------------------
 1 file changed, 24 deletions(-)
 delete mode 100644 meta-gnome/recipes-apps/pinpoint/pinpoint_git.bb

diff --git a/meta-gnome/recipes-apps/pinpoint/pinpoint_git.bb b/meta-gnome/recipes-apps/pinpoint/pinpoint_git.bb
deleted file mode 100644
index 6b2688f3e..000000000
--- a/meta-gnome/recipes-apps/pinpoint/pinpoint_git.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-SUMMARY = "A simple presentation tool for hackers"
-DESCRIPTION = "Pinpoint is a simple presentation tool that hopes to avoid audience death \
-               by bullet point and instead encourage presentations containing beautiful \
-               images and small amounts of concise text in slides."
-SECTION = "x11/multimedia"
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24 \
-                    file://pinpoint.c;beginline=6;endline=17;md5=201d438283607da393fae6aca085454c"
-
-DEPENDS = "glib-2.0 gdk-pixbuf cogl-1.0 clutter-1.0 clutter-gst-3.0 librsvg"
-
-inherit autotools gettext pkgconfig features_check
-
-# cogl requires opengl
-REQUIRED_DISTRO_FEATURES = "opengl"
-
-SRC_URI = "git://git.gnome.org/pinpoint"
-
-SRCREV = "80a056c57e819d0b75035424638813b0670830e1"
-PV = "0.1.4+gitr${SRCPV}"
-
-S = "${WORKDIR}/git"
-
-RRECOMMENDS_${PN} = "gdk-pixbuf-loader-jpeg gdk-pixbuf-loader-png"
-- 
2.21.0


