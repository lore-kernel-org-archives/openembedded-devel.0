Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
	[209.85.210.178])
	by mail.openembedded.org (Postfix) with ESMTP id 4FC4C7EED1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jul 2019 16:39:34 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id q10so16189876pff.9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jul 2019 09:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=euv2nD0MZLsBba6nsPgDbUcqcgzXDioX8Cpg3wDn/9M=;
	b=lzAJDBVm0qry+Ly+eCYRcZRnInn+dJU3LVkkwGdwtwtaoK00sZl4IEJQZMlgHgoy+A
	+cBxIE3L9nxTK8C6ILDo05vS5wpw1Bar9moUcJFfXMgpHDFRMd7DfzRwEhAZxFLOpgsX
	9XABTJJDnea8b2c2wJDoxX4Iyq0RwQ4ctwdXnjWi9/O/OjlbJzyh0OLBduI62YiadHEs
	QEW0wrtz+jmocqylMoxKRpTaMki1G80lVxDdAXRGokmBA0Ag4Aav7F3giIa1eq/OUzmz
	GjwVYqYgaf0LZNksS2wZawVwaQbmMNRRCjZ1yu6gF8QT0gGiQo3h1qYjn6Nz0lh7petf
	cV3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=euv2nD0MZLsBba6nsPgDbUcqcgzXDioX8Cpg3wDn/9M=;
	b=kgrSWrHWPzSVp9RdnemX+OGNOu6tbSdQBGKDoXmU0Ged8EWAMxfh1akrRq/pzmw4/P
	tAt0QBU+pyBi3eDv1RYPIzDGdM5VvrNQDQkFWXUHUz4CXkn6bqbC7te5NXumUbzhttmh
	/XxcdDNumCTZZcUP3ceXwpyvO39R77eM9zJbCwaAexN0kkFmEzV8zI8TJa+QEfp/zbJ+
	kpD1kIcfMHnB9qeyO0JBCkg576hbG+v47Pm3R+h/c7N+OIzDOtClfjIGAmLBzpJvLkk6
	2Z5ldWD0pfyTALxOc68xS650DUrz9TfchmgeXXhSrvfYzFNKTMHlk6Y1ras5wG9DoFwU
	sgZA==
X-Gm-Message-State: APjAAAWeykdXfOSjrP5qvlPm/xtTpTAW7tbURN7Y3rQZ3YZdnFkSj1or
	JIOt9NlyAFhPNKhvD1lB3EW+BU2gCXo=
X-Google-Smtp-Source: APXvYqz/eiQLgMMvJS9xRnCOqQC7WUFM5sxstOW9I2CGn7WDEgzYEjISF7PJfOh3+jilnFElQ3Q3Sw==
X-Received: by 2002:a63:6c02:: with SMTP id h2mr65928187pgc.61.1563727174844; 
	Sun, 21 Jul 2019 09:39:34 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	35sm38763285pgw.91.2019.07.21.09.39.34
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sun, 21 Jul 2019 09:39:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 21 Jul 2019 09:39:13 -0700
Message-Id: <20190721163919.32659-8-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190721163919.32659-1-raj.khem@gmail.com>
References: <20190721163919.32659-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 08/14] x11vnc: Switch to git fetcher
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
X-List-Received-Date: Sun, 21 Jul 2019 16:39:34 -0000
Content-Transfer-Encoding: 8bit

Using github archives is not reliable, fixes
SRC_URI uses unstable GitHub archives [src-uri-bad]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.16.bb | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.16.bb b/meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.16.bb
index 1aace02001..e4a0321357 100644
--- a/meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.16.bb
+++ b/meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.16.bb
@@ -7,13 +7,12 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://src/x11vnc.h;endline=31;md5=e871a2ad004776794b616822dcab6314"
 
-SRC_URI = "https://github.com/LibVNC/x11vnc/archive/${PV}.tar.gz;downloadfilename=x11vnc-${PV}.tar.gz\
+SRCREV = "4ca006fed80410bd9b061a1519bd5d9366bb0bc8"
+SRC_URI = "git://github.com/LibVNC/x11vnc \
            file://starting-fix.patch \
 	   file://0001-misc-Makefile.am-don-t-install-Xdummy-when-configure.patch \
 "
-
-SRC_URI[md5sum] = "64172e8f896389ec963fff93415f0d93"
-SRC_URI[sha256sum] = "885e5b5f5f25eec6f9e4a1e8be3d0ac71a686331ee1cfb442dba391111bd32bd"
+S = "${WORKDIR}/git"
 
 DEPENDS = "\
 	jpeg \
-- 
2.22.0


