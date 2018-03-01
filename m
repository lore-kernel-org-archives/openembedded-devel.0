Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id B798578766
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Mar 2018 23:02:03 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id u49so8246283wrc.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Mar 2018 15:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=LWlPx9uMTh11BhsyTJLsZ4QcaSz/j3Q1a+yByqXYebk=;
	b=hJVtNM0MNXas2fcBIfBofbQ8b4Ryhd29JoohPrbvRdfaApqnZnBFPUZiyoX26LDLSz
	AMU6xCGwqWRJ6v1XWdARtoqzGE9wnu8fj+6Trropf8cvuP80fWKRW8OQvQ3499y+vt6P
	vopthtHiKRIliUFarFQwuw37s2VbyN0WD7j0Sud8gTo0ub/pI2yzef+xn2cdwH7rAOW7
	9NgVFN+oKUUZjCmlWkL+75kYF8SGgMzBMFo967nDzDo2KoR35Hk1P+lwJQojnRh28BdH
	oEWVeWihNg96S2YB1DjGcSLWJkDjf95zGcKVxAOcXSP6w7wj0gs1kAYSEpcXy6JmYZI8
	dVoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=LWlPx9uMTh11BhsyTJLsZ4QcaSz/j3Q1a+yByqXYebk=;
	b=maxegqSfAbqH3UH9evZU2wMVAz7HwvLZYcpskLiA6jo2VslntSPf/Kacv6k+BSuXIl
	k00GeSiQpBMbfQD5Y0MHbWIZ+qDSrMKOp+kZq/CF0WJ29oabxQZQdADvLl7K2a1qQRcH
	HAtSLsTOpUOw7i0VSD3TY8zhM1CbNSNFuroXrHL97azCs5MJmJEd8r2GseTHmYHFjqde
	I6AZCM8+e6xhfvxDhGUVD/ygyoQs1348R1gbEGw6SjOc+Zc4Gcetep8j6PWHC3kuhMHo
	6DoP/RpLyHrSFzHTfEnAgb/S5ZFcb/76WOweD22xzqV/El4MpMEKX99hjAwatMD7/jdy
	4ggA==
X-Gm-Message-State: APf1xPCysYQ5hJ8TygLPXqmWabLu2jAQyGNnUjb/qR6vHgpOvOXWcQUE
	jpNq6KSkgiLCT5vn/NlNQeaAkQ==
X-Google-Smtp-Source: AG47ELtEaJBBFeMSJlrsK1p+L9sTHCE8GP09Qj9pzAzceZjg56vK5A0+FwBFooB7RPytCJqjW4DzeQ==
X-Received: by 10.223.164.215 with SMTP id h23mr3122237wrb.38.1519945323798;
	Thu, 01 Mar 2018 15:02:03 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC063001E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc0:6300:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id 8sm5490wmf.13.2018.03.01.15.02.03
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 01 Mar 2018 15:02:03 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  2 Mar 2018 00:01:37 +0100
Message-Id: <20180301230148.2284-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180301230148.2284-1-schnitzeltony@gmail.com>
References: <20180301230148.2284-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 01/12] xfce4-panel: add gtk-icon-cache to inherit
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
X-List-Received-Date: Thu, 01 Mar 2018 23:02:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

+ mini stylize

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.12.2.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.12.2.bb b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.12.2.bb
index 75bcdd716..9cc9a4bbc 100644
--- a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.12.2.bb
+++ b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.12.2.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=26a8bd75d8f8498bdbbe64a27791d4ee"
 DEPENDS = "libxfce4util garcon libxfce4ui xfconf exo gtk+ gtk+3 dbus cairo virtual/libx11 libxml2 libwnck"
 
-inherit xfce gtk-doc distro_features_check
+inherit xfce gtk-doc distro_features_check gtk-icon-cache
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
@@ -39,5 +39,6 @@ FILES_${PN}-gtk3 = " \
     ${libdir}/libxfce4panel-2.0${SOLIBS} \
     ${libdir}/xfce4/panel/wrapper-2.0 \
 "
-FILES_${PN}-dbg += "${libdir}/xfce4/panel/plugins/.debug \
+FILES_${PN}-dbg += " \
+    ${libdir}/xfce4/panel/plugins/.debug \
 "
-- 
2.14.3


