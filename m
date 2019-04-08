Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
	[209.85.128.46])
	by mail.openembedded.org (Postfix) with ESMTP id 272E77D48D
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Apr 2019 22:43:13 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id o25so1075772wmf.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Apr 2019 15:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=CVDlB8Di1VZcduWmouSvLmgkXmajVxEhioIVOlsRwoY=;
	b=J1KVyxQMDc7eBte1KLyVtquWe1cLXkSVP3NXbodZgfcnzi6LwUCCoXWU5u6xBVT72s
	bcyfAbbgIBICTyP7sSr/9pLzxWjKT5FuLAQCuPDW9Jsfrbf67TfpSta/hrJAQDHmamPT
	L2fR4QujsNFpIgfIgwVi0t94MEznc54gfyV/S5emXrU4QeHl1vTLvZLrt9Ef1xVKXnkN
	ok7URqHl3Q1PDmE69F/8PJEhfzX+p+kO6m2ymW7yKfkp4sZotFIcGlOZ5FV1UBd8VdVd
	4hEEgf2zX78MKW3MCSWVNVO0cNI0upIQrN2xIm8QL9CsdVsX7s1PLSIwBm82Ot6hojcA
	l2BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=CVDlB8Di1VZcduWmouSvLmgkXmajVxEhioIVOlsRwoY=;
	b=gDWVaivoGpM3OJHFcOlPqvtyc14WvbG82AB7D+vys8+fy3tNVw0qGGR8vsd/RWAYOt
	Ojw/q375tAX+EnfAY0VFiAO2x6JxSUfbUzDqIc/C2kC1/2GOHjELpNEUDWVdkslA41Lk
	z9DE8xHlMqpgpaksivgzNPr/+nxzLKsnWDrcinABqW9cu8VTHq17a7lWkhTBG16g0+8o
	nJ0Kg+VG0GB8Ky9Fn6bD6IP6TuAJUpL1YknGD9kpD0Ey52cIkqAeMevlV/XMRylyG1x5
	q7jES+LpouOr5rw64aySr+OvCUD+hwvCscES3EQKRLdQuXeC9uO9RHuyu3X0oFSmYI9T
	q10A==
X-Gm-Message-State: APjAAAXW2ntfjFjouj8kkmB9ro05c//bnxojWhLjbI08WwJRV4W3uOJe
	WRFOHszjFBxANXrczkt5oOsp0ZLw
X-Google-Smtp-Source: APXvYqzBXyDzmjZ+d6CyGcfaORMhsx0NSF4BuYYYW2cp1uyae6i6qtSPMsXwkvLtakhQj2lvU4gwPA==
X-Received: by 2002:a1c:4d10:: with SMTP id o16mr18644238wmh.59.1554763393699; 
	Mon, 08 Apr 2019 15:43:13 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F03E65465DDF607A3E693C2.dip0.t-ipconnect.de.
	[2003:f0:7f03:e654:65dd:f607:a3e6:93c2])
	by smtp.gmail.com with ESMTPSA id
	k4sm42824144wro.33.2019.04.08.15.43.12
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 08 Apr 2019 15:43:13 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  9 Apr 2019 00:42:57 +0200
Message-Id: <20190408224258.1744-5-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190408224258.1744-1-schnitzeltony@gmail.com>
References: <20190408224258.1744-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 4/5] ristretto: upgrade 0.8.3 -> 0.8.4
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
X-List-Received-Date: Mon, 08 Apr 2019 22:43:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A bugfix release - see announcement [1]:
- Add missing field initializers
- Instead of thumbnails, the same icons with a crossed red circle (bug #13419)
- Resolve g_type_class_add_private() deprecation
- Glib-Critical errors to stdout: Source ID X was not found when attempting to
  remove it (bug #15268)
- Fix memory leak (bug #12034)
- Show file size in the status bar (bug #14791)
- Fix opening of PPM files (bug #14709)

[1] https://mail.xfce.org/pipermail/xfce/2019-April/036350.html

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../ristretto/{ristretto_0.8.3.bb => ristretto_0.8.4.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-apps/ristretto/{ristretto_0.8.3.bb => ristretto_0.8.4.bb} (76%)

diff --git a/meta-xfce/recipes-apps/ristretto/ristretto_0.8.3.bb b/meta-xfce/recipes-apps/ristretto/ristretto_0.8.4.bb
similarity index 76%
rename from meta-xfce/recipes-apps/ristretto/ristretto_0.8.3.bb
rename to meta-xfce/recipes-apps/ristretto/ristretto_0.8.4.bb
index d9b9b2cb0..416ac2adc 100644
--- a/meta-xfce/recipes-apps/ristretto/ristretto_0.8.3.bb
+++ b/meta-xfce/recipes-apps/ristretto/ristretto_0.8.4.bb
@@ -9,8 +9,8 @@ inherit xfce-app
 
 RRECOMMENDS_${PN} += "tumbler"
 
-SRC_URI[md5sum] = "5866b4e11c32a38f72bc737239102544"
-SRC_URI[sha256sum] = "8c9c11760816dfd9ed57fb8b9df86c6a98a2604ab551be3133996a1c32ca2665"
+SRC_URI[md5sum] = "0142c8b9c492cf447e563b00c6204359"
+SRC_URI[sha256sum] = "3a0be4526c93ec0ebbf2e63e69dd0c98f16b20b863d3b6426272592e5b00cea2"
 SRC_URI += "file://0001-Fix-build-after-update-of-xfconf.patch"
 
 FILES_${PN} += "${datadir}/appdata"
-- 
2.20.1


