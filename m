Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.21169.1610905012566900194
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Jan 2021 09:36:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jIO2N/kh;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id f63so993182pfa.13
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 Jan 2021 09:36:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=mjv3O6C42gkyBO0lihxzqnhmp36zNH2ewwyOfCJSAzw=;
        b=jIO2N/khYbZ8u96ZE1WyX28WPDeP7TCX6nOhEC1I81GWau5z2V1WhOavCBEWwwgNpT
         HarA6xS/b5dfRXLj1LzBInicRs6Ettu8H+h6stn6da+KPwIaxwe9jpm1w1CFmNFHeLiR
         HNZ5Q5T1WzPmeSELPCJX639ltBvQnlqefUF2f/QIjMav3Jc9eQNH0VMqn5ZrPhBKBDh3
         yGELPXnHcaEYdAWD+2ipg9331hOe0EjGhm6ifisHmHtmb0Fgox2by0rZVC/pNqj3ycVo
         JLcnQqKgGruDOHKXJIIOg4mptTaz3a19SWRhxLsHEz27jlFKjTtwRvUidRDJgpB5wOPs
         QwVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=mjv3O6C42gkyBO0lihxzqnhmp36zNH2ewwyOfCJSAzw=;
        b=WhpQJQEkefu3PiorQKRiA3j2W+dUgSbdh0YhUbd58jrGufel6xdnzWRW8vvSXYDxDV
         Zuhx/s9qTPAk1u1kAHOttoNNG8gnRJ7LX3YA2ggcfOHhePKmMgQwkmB9yxJXoM5KW555
         6qNJKAxXVrP+XVi26L6UsVaUeOxrkw1xJQ1ywXYirhYo8VU3djiKWVOfTiVXJHypH3y+
         FHq/XoStWEIm/qytk0wjMqtIdP2NKum6vSOgr+uU4/1FU/i8r1fUI0SdTtsy//6LFVz/
         4DiVpOSW8zJOxzUIy8FoBYavcqGeaMHhiLFV+xEuadJh2z2sIx+i2nJQkSN8xwa3PTsD
         BWEA==
X-Gm-Message-State: AOAM532dHxPVrS7Hlcb2hnySM+UEWoUnP11cS72AxoINRdb0iB/u8rIt
	XLOW6f04upYrPKbS0jY50GeIhnN6nQKJew==
X-Google-Smtp-Source: ABdhPJzCBT7bkhF5x2E2o1Q7uRaVn0iaRjjuVtdYRkHv9bDfsaYDhUl9IXkzOzw9CEGgaZSywCdp/g==
X-Received: by 2002:a63:4517:: with SMTP id s23mr22781928pga.267.1610905012012;
        Sun, 17 Jan 2021 09:36:52 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:ed67:500f:ea8f:e947])
        by smtp.gmail.com with ESMTPSA id t4sm13661338pfe.212.2021.01.17.09.36.51
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 09:36:51 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [gatesgarth 12/31] liboop: use upstream SRC_URI
Date: Sun, 17 Jan 2021 09:36:17 -0800
Message-Id: <817c4aeb33fe31d8d2e7e1a67975924c9bc290b9.1610904793.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1610904792.git.akuster808@gmail.com>
References: <cover.1610904792.git.akuster808@gmail.com>

From: Roland Hieber <rhi@pengutronix.de>

The Debian pool URLs are not permanent and the package might vanish as
soon as the version is no longer part of any Debian release. Use the
upstream URL directly.

Signed-off-by: Roland Hieber <rhi@pengutronix.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 2e1a32a474b8600b56e4d7e2434967103b267ccb)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/liboop/liboop_1.0.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/liboop/liboop_1.0.1.bb b/meta-oe/recipes-support/liboop/liboop_1.0.1.bb
index 8ba3f72b76..8894a867df 100644
--- a/meta-oe/recipes-support/liboop/liboop_1.0.1.bb
+++ b/meta-oe/recipes-support/liboop/liboop_1.0.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.lysator.liu.se/liboop/"
 LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8b54f38ccbd44feb80ab90e01af8b700"
 
-SRC_URI = "http://ftp.debian.org/debian/pool/main/libo/liboop/liboop_${PV}.orig.tar.gz \
+SRC_URI = "http://ftp.lysator.liu.se/pub/liboop/liboop-${PV}.tar.gz \
            file://tcl_dev.patch \
 "
 
-- 
2.17.1

