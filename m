Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 001BF6C1C3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Dec 2019 21:31:27 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id p17so9325698wmb.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Dec 2019 13:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=SVUjXW1+HvgYYXhB1yravDD2hdrBpID9mcgLFU8D4xY=;
	b=Hi5I+TYXiuPvEefeunnwGcUYSqVDovFjO5XvIgX8I4Q5VRxOLpr8mDEZbPZ/pz+CpQ
	3jhHEu0CKdcaDlVud8XT3aHBUUY3zSUGPlEXqxcI+G12/CBqCU2xXttu2dF0FLe0ZFG/
	Iqp5Suci4CqxblhjyY0lf6MCWACPkGrh0E4ge2nbG+9Yb8+FNnkTJM4tobwmxjwQ5L8x
	2FFkM6JirFp9y2mqjO/CKIxXwu1SxfjuljixewasJdcLbZrP9cXuZl2bayRBtENrCs/B
	A6OtKPXp5KJgBmzKDD2wL5Pyw0AcuHtjxrkNWnAhKKHAuHUO3WoQKr3RhqxurzokaaVQ
	pavA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=SVUjXW1+HvgYYXhB1yravDD2hdrBpID9mcgLFU8D4xY=;
	b=M6BK1/3SNP+rsMipeHlFZZDuYgZ/iFsJ9fwgWxC3yKrf2+9aFx3PlEsASHjqpdlEO7
	xQdVGlfPtCTkarvTq3xqkMHRHhT/34aWoqkmpja5CQcE4vpfLd8+jxiYwP7BIy0L7mp/
	jz42D1iqUXiS5f6YPD0Tx11afBGeyY1XbBAelmBOuslGo3Oig0RoRCZnfHYgqBdo2Psa
	N8tlC8WzM2jJi/+X/v7wpcJLhVbpZdGkvpjbfUtIn6y//sy8iAqxG+l+TECPtVuVnQDU
	B0jrUYf+hv8rurCMpJuuM9UemCppzskdJ6rsuFyLl2Brc0zMqpgQ1hK72hHoR0t28MLN
	JUwQ==
X-Gm-Message-State: APjAAAXELYNoUg0KLSr7Op+rOPcrN9hm7N8B/NKMtwO3lKM3Ieh+yZfA
	AQgjGUKsGVOoA2xfhzkPkhw2a4SSvG0=
X-Google-Smtp-Source: APXvYqxvy6uAatVw1qks87Sh66PEGLMjVIGfXyh3/DCss5LhQyttR695ZMfa3NNd3dNK1+SoerZ2pg==
X-Received: by 2002:a05:600c:248:: with SMTP id
	8mr21531909wmj.175.1577482288188; 
	Fri, 27 Dec 2019 13:31:28 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F052B8722A751F738295925.dip0.t-ipconnect.de.
	[2003:f0:7f05:2b87:22a7:51f7:3829:5925])
	by smtp.gmail.com with ESMTPSA id
	m7sm11915929wma.39.2019.12.27.13.31.27
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 27 Dec 2019 13:31:27 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Dec 2019 22:30:58 +0100
Message-Id: <20191227213120.3930-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH 01/23] exo: upgrade 0.12.10 -> 0.12.11
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
X-List-Received-Date: Fri, 27 Dec 2019 21:31:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Looks like a mini-bugfix:

Release notes for 0.12.11
=========================
General:
- Bump documentation dates
- Add *.mo to .gitignore

Bug Fixes:
- Revert padding patches that add too much padding in the Thunar compact
view (Xfce #16196)

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-xfce/recipes-xfce/exo/{exo_0.12.10.bb => exo_0.12.11.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/exo/{exo_0.12.10.bb => exo_0.12.11.bb} (88%)

diff --git a/meta-xfce/recipes-xfce/exo/exo_0.12.10.bb b/meta-xfce/recipes-xfce/exo/exo_0.12.11.bb
similarity index 88%
rename from meta-xfce/recipes-xfce/exo/exo_0.12.10.bb
rename to meta-xfce/recipes-xfce/exo/exo_0.12.11.bb
index 4deedbfbc..4c16689d3 100644
--- a/meta-xfce/recipes-xfce/exo/exo_0.12.10.bb
+++ b/meta-xfce/recipes-xfce/exo/exo_0.12.11.bb
@@ -20,8 +20,8 @@ SRC_URI_append_class-native = " \
     file://reduce-build-to-exo-csource-only.patch \
 "
 
-SRC_URI[md5sum] = "ef1db71eb24cf24f6870444ccfc2345d"
-SRC_URI[sha256sum] = "848fd65175118786e994fcf8b28f8c804f58d21cc9d961e00897cd97dc257cac"
+SRC_URI[md5sum] = "efeb039d64b3257e39a1a38e75eb19b1"
+SRC_URI[sha256sum] = "ec892519c08a67f3e0a1f0f8d43446e26871183e5aa6be7f82e214f388d1e5b6"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG_class-target ??= "gtk"
-- 
2.21.0


