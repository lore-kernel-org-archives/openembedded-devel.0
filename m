Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 9064C62135
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 May 2016 15:51:03 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id i7so1306885qkd.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 May 2016 08:51:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=l3cuETo05jPUfRab5dleQK2vsF0ct5ONUsB4+TqIyH4=;
	b=Kdsrit4FqQuzZj4jYIT8mUSQMKol3fkdclR2XTwL/InucRECcLbLY2BOrYbJEC/1xd
	LjXqRZ1UV57vIRoCob8P24caoa9a6lJ2BGwYJwGvAXldxMD8cEFLdzEkGLzZk6pGRhq2
	Cc9TZW1M6zdhh0Cs7OV/5S0AvQ60FqMT9JsuYhgrVEutJDVFgzlDikSeUycTw/5VX1Vd
	zWGA3YnUvHXOVHSQ7M39x4T8xj1MX/uUZz6e7SKADlbqkkm1roedTL4I620ozEq+fjc4
	j+Qfgc/cXJXFs/GW0thuZtkkP4I+pp4XSlVcwSppBOvSo9kMbmVflzCHXD9dp3/sljK9
	i8kg==
X-Gm-Message-State: AOPr4FVLzk50lAviwT4KDN8pIRG+VY2w/KMzr8ofSeNZfJ0XzeH3at4icAG9kXvNB3TAhg==
X-Received: by 10.55.153.3 with SMTP id b3mr3358103qke.102.1462290664541;
	Tue, 03 May 2016 08:51:04 -0700 (PDT)
Received: from lnx-dereks-laptop.star.lab
	(c-68-34-224-206.hsd1.al.comcast.net. [68.34.224.206])
	by smtp.gmail.com with ESMTPSA id m2sm1245390qhc.29.2016.05.03.08.51.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 03 May 2016 08:51:03 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 May 2016 11:50:29 -0400
Message-Id: <1462290629-11674-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-gpe][PATCH] fbreader: add cflags fix for fribidi 0.19.7
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
X-List-Received-Date: Tue, 03 May 2016 15:51:05 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../fbreader/fbreader-0.12.10/fix-cflags-fribidi.patch        | 11 +++++++++++
 meta-gpe/recipes-support/fbreader/fbreader_0.12.10.bb         |  3 ++-
 2 files changed, 13 insertions(+), 1 deletion(-)
 create mode 100644 meta-gpe/recipes-support/fbreader/fbreader-0.12.10/fix-cflags-fribidi.patch

diff --git a/meta-gpe/recipes-support/fbreader/fbreader-0.12.10/fix-cflags-fribidi.patch b/meta-gpe/recipes-support/fbreader/fbreader-0.12.10/fix-cflags-fribidi.patch
new file mode 100644
index 0000000..e72fa8c
--- /dev/null
+++ b/meta-gpe/recipes-support/fbreader/fbreader-0.12.10/fix-cflags-fribidi.patch
@@ -0,0 +1,11 @@
+--- fbreader-0.12.10/makefiles/config.mk.orig	2016-05-03 11:11:07.259734561 -0400
++++ fbreader-0.12.10/makefiles/config.mk	2016-05-03 11:11:37.447735786 -0400
+@@ -38,7 +38,7 @@
+ 	LDFLAGS += -pg
+ endif
+ 
+-ZINCLUDE = -I $(ROOTDIR)/zlibrary/core/include -I $(ROOTDIR)/zlibrary/text/include
++ZINCLUDE = $(shell pkg-config --cflags fribidi) -I $(ROOTDIR)/zlibrary/core/include -I $(ROOTDIR)/zlibrary/text/include
+ 
+ ZLSHARED ?= yes
+ 
diff --git a/meta-gpe/recipes-support/fbreader/fbreader_0.12.10.bb b/meta-gpe/recipes-support/fbreader/fbreader_0.12.10.bb
index e9ead0f..1487f11 100644
--- a/meta-gpe/recipes-support/fbreader/fbreader_0.12.10.bb
+++ b/meta-gpe/recipes-support/fbreader/fbreader_0.12.10.bb
@@ -9,7 +9,8 @@ PR = "r1"
 
 SRC_URI = "http://www.fbreader.org/fbreader-sources-${PV}.tgz \
 file://Makefile.patch \
-file://gcc45.patch"
+file://gcc45.patch \
+file://fix-cflags-fribidi.patch"
 
 # Set the defaults
 READER_RESOLUTION ?= "1024x600"
-- 
1.9.1


