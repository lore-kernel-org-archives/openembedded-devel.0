Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 9DC42731A0
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Jan 2016 21:03:27 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id f206so112778404wmf.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Jan 2016 13:03:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=93k5+vF2bpcWenlX0FmaeKD6o1cr4p36gyyYQxH9f+k=;
	b=GPWFj43iB7ZXqhqE2tFsxVSBbHIMAkQ5PBHBt2s/tH9jdJF3WMTfc2D5VdPR3IFLuJ
	JswkKMqf6+RrQp85TsH6vZTx8XW+Y9vuLz4ZGe37BlGWAsRZPk2GxgB9xAy7EaHpDHRi
	OcbHHK2kuTJ1YMIyZBaMMnWSlSq4WCnkko5iM2OHh4bl/lw5HjPWHqTqEUCN6ofvf9op
	2uzqMRu2JEtVkRCxci8qSvNQPIukMD7s9kAgbeX3gm4X8sEn3vbgYutEBaA3zkfimYUS
	O4id2Bjk+MwC3FwJHUhQoA+rGOQnW8TbL4me+HfNuRKJMYNNV1hD8HP+Ab0oDRDyfKVD
	5JAw==
X-Received: by 10.194.205.5 with SMTP id lc5mr79596331wjc.163.1452200608146;
	Thu, 07 Jan 2016 13:03:28 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	dl8sm102916031wjb.29.2016.01.07.13.03.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Jan 2016 13:03:26 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Jan 2016 22:03:50 +0100
Message-Id: <1452200630-3393-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH][WIP][meta-gnome] gnome-desktop: don't try to copy omf.make
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
X-List-Received-Date: Thu, 07 Jan 2016 21:03:28 -0000

* omf.make was removed from gnome-common in:
  https://git.gnome.org/browse/gnome-common/commit/?id=a912a74ba7999fe3ed49b07bab86685a5d117f82
  which is included in gnome-common-3.18, so this was broken since:
  commit f459f890cb7c0e11d92b80f0d5a65117428cc87f
  Author: Jussi Kukkonen <jussi.kukkonen@intel.com>
  Date:   Thu Nov 26 13:46:48 2015 +0200

    gnome-common: Upgrade 3.14.0 -> 3.18.0

  but hopefully we don't need omf.make with --disable-desktop-docs in EXTRA_OECONF

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_2.32.1.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_2.32.1.bb b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_2.32.1.bb
index 6256396..4fedbe6 100644
--- a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_2.32.1.bb
@@ -17,7 +17,6 @@ DEPENDS += "gconf libxrandr virtual/libx11 gtk+ glib-2.0 gnome-doc-utils startup
 EXTRA_OECONF = "--disable-scrollkeeper --disable-desktop-docs"
 
 do_configure_prepend () {
-    cp ${STAGING_DATADIR_NATIVE}/gnome-common/data/omf.make ${S}
     sed -i -e s:^#!@PYTHON@:#!${bindir}/python: ${S}/gnome-about/gnome-about.in
 }
 
-- 
2.7.0


