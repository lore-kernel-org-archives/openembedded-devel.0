Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id 000847EFB8
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Aug 2019 04:03:31 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id z14so5496589pga.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Aug 2019 21:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=s3+rUMZDqe5HlioTJB2ihL2vRv9k7A8ADkUlg5JL/mw=;
	b=W+u5xxBJbMp0TTNQ6zBcHLYKawW70NCTH3NO4D6DMjB3/nEbQC8MRnX5XS3ApPR/S2
	xDPJT9qB17dZEJNOTG9rvDieB+Uene92e0H4sQSHw3UPqxKdE3nYbti51NrQPP7QLt91
	7Cw7AhXNCW8qdovufgml0U4p7uiVVRlQ2NA76Cuq+pF89Z7bBEvUg0zhotkipyrJ594y
	4WqXToeOY/8ZQdrV/De54MG1cs/iU5CdmU3PN9EK+ubwZOYfpJjLE/fMSK4ltyT71mEN
	nHbGL+7fhNy6syXGJSnyIUYAvjtrW3Wi4D/VJh+ee1rFvlGrqJOfM1AHr23szlQ3GV3Z
	Y45g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=s3+rUMZDqe5HlioTJB2ihL2vRv9k7A8ADkUlg5JL/mw=;
	b=a3cOVlGtwEyjHWLDuyn5JoIGqqcOanxOY8G6acA+/RzCwIAlfPRjc+dqSiTbfT3Df9
	Eteru+j0hYmMYrEBSNeVnateXheiGk1vt4UuUZ0VatgZUBk3MZPcd89msqMEvH54NG79
	LWBC1jUXrj1iA1Vc1RfZazrLIM2TvtL5ypE4pL0TwrdNC/8XICc8h4nPSmrqKT6HgrIZ
	9gnKzUb2jQ5x4E1c72jMg1aUIeRo86/Z4lipPK/XiR7lvjnr+jU51LB2QKgatDK/n+rW
	s/n/1sNAFxMJIMdHLsTuTTmLBYKdXJ2/kdnaUwEADlipZlP+gHFBMILQJuaJvwQztl9X
	53Kg==
X-Gm-Message-State: APjAAAVrcPEDURx0sp5CJX7TX5JqIrQXpHPPdiuT7+sU3fteIH5Oz82+
	iBqlQZmL/994rFIeb7ruU5EKax3IOK4=
X-Google-Smtp-Source: APXvYqw1aQecGjw5HrAFpQXh9qXnRmgjkGJVlrXeG+V4SjwgaSdl/NQtJPzfsHia6K5U/gIcv5mnCQ==
X-Received: by 2002:a65:6294:: with SMTP id f20mr6130466pgv.349.1565150612464; 
	Tue, 06 Aug 2019 21:03:32 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	p27sm133054061pfq.136.2019.08.06.21.03.31
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 06 Aug 2019 21:03:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 Aug 2019 21:03:22 -0700
Message-Id: <20190807040323.17521-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190807040323.17521-1-raj.khem@gmail.com>
References: <20190807040323.17521-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/3] graphviz: Fix build error that surfaced with latest pango
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
X-List-Received-Date: Wed, 07 Aug 2019 04:03:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-Include-freetype-headers-explicitly.patch | 38 +++++++++++++++++++
 .../graphviz/graphviz_2.40.1.bb               |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/graphviz/graphviz/0001-plugin-pango-Include-freetype-headers-explicitly.patch

diff --git a/meta-oe/recipes-graphics/graphviz/graphviz/0001-plugin-pango-Include-freetype-headers-explicitly.patch b/meta-oe/recipes-graphics/graphviz/graphviz/0001-plugin-pango-Include-freetype-headers-explicitly.patch
new file mode 100644
index 0000000000..a9b0352435
--- /dev/null
+++ b/meta-oe/recipes-graphics/graphviz/graphviz/0001-plugin-pango-Include-freetype-headers-explicitly.patch
@@ -0,0 +1,38 @@
+From 926d9285f3367ae1bdb9ce1dce95f7de73b3a980 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 6 Aug 2019 12:42:19 -0700
+Subject: [PATCH] plugin/pango: Include freetype headers explicitly
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Do not depend on pango automatically adding these headers
+Fixes
+| gvtextlayout_pango.c:140:10: error: unknown type name ‘FT_Face’
+|          FT_Face face;
+|          ^~~~~~~
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ plugin/pango/gvtextlayout_pango.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/plugin/pango/gvtextlayout_pango.c b/plugin/pango/gvtextlayout_pango.c
+index d620b29..b0da11c 100644
+--- a/plugin/pango/gvtextlayout_pango.c
++++ b/plugin/pango/gvtextlayout_pango.c
+@@ -15,6 +15,10 @@
+ 
+ #include <stdlib.h>
+ #include <string.h>
++
++#include <ft2build.h>
++#include FT_FREETYPE_H
++
+ #include "gvplugin_render.h"
+ #include "agxbuf.h"
+ #include "utils.h"
+-- 
+2.22.0
+
diff --git a/meta-oe/recipes-graphics/graphviz/graphviz_2.40.1.bb b/meta-oe/recipes-graphics/graphviz/graphviz_2.40.1.bb
index a9efffaca2..fb8ea2a5b3 100644
--- a/meta-oe/recipes-graphics/graphviz/graphviz_2.40.1.bb
+++ b/meta-oe/recipes-graphics/graphviz/graphviz_2.40.1.bb
@@ -26,6 +26,7 @@ inherit autotools-brokensep pkgconfig gettext
 # source - see https://src.fedoraproject.org/cgit/rpms/graphviz.git/tree/graphviz.spec
 
 SRC_URI = "https://gitlab.com/graphviz/graphviz/-/archive/stable_release_${PV}/graphviz-stable_release_${PV}.tar.gz \
+           file://0001-plugin-pango-Include-freetype-headers-explicitly.patch \
 "
 # Use native mkdefs
 SRC_URI_append_class-target = " file://0001-Use-native-mkdefs.patch"
-- 
2.22.0


