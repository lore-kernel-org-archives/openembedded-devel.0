Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5213C71A82
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Mar 2017 07:13:59 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id 77so9356600pgc.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Mar 2017 23:14:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=MRKIje+95L44UN46oxMfFouzXwwNFI7+ODEnjb/sRYs=;
	b=taz5ETA3LbWPDszncgzbOtlLF9hSsZpi018l68GpicT1GElWFByomX7jqB30l16bea
	E/szoe3VfK6ynCtwrDWwCvAtWuY+TIG5I/l9DI8Nx/Xl/JlZl5QsuD7lEivlhZ4cLmlz
	0rbgaNJQEJchBtaXqAuVt2x94ncpzctgn0Yrywr6ZdYgu0KCheTIiEoNEr0Vy3bhRQsW
	Clz6ECBxl+CdcjVzFwTFMFEbYlZfX89lkaI4hlDhER24BJ5v7X89LgwRPSwNDH3LMZp4
	OuGVU4KaoSF+YdkDX3rV6bXHqLWJfmF8uAhG+6+VGW4e0aAXszM9dmRYnrKtCo9OKj2y
	ScOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=MRKIje+95L44UN46oxMfFouzXwwNFI7+ODEnjb/sRYs=;
	b=ihYVId4wYuIX9yvKYVF+/d8gc7gsUgeAbWbQnn2JHZXptOFT1AvTybq4yAh2HUaizs
	WsYuGgQZdOvei5NkNfpwpREChUJhduDaqbNluYT0/xlnXxdvpq7b1jj1SBpn4Sm8tOMJ
	AkI+ymG6IXOZrQkzS8vcF+7Xy4YfFiXzPjrZDS/iVqdM45bYAXLMccet0FzmhhcCQA6i
	hYiE8JEbhzy77dX3peTZTGcNf+6xB/v+HYqht4Rqy9dqeKLsHNCpxn4Um6T+bI04qg+A
	Pj/aCR+GgACA3LOhIMIaw7jZKhcByrO1ZrCMDVi2m9u2x985hdth+VQOwwHiVqXMQMuF
	VM5Q==
X-Gm-Message-State: AMke39mtVRFcYhcLotIJ2wSdVpYprd4k8EPyMZ6JG8QWjNN3Jsynopqw1WHvp77s9JHuVA==
X-Received: by 10.98.153.11 with SMTP id d11mr24622138pfe.15.1488870840895;
	Mon, 06 Mar 2017 23:14:00 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	r134sm43530858pfr.83.2017.03.06.23.14.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Mar 2017 23:14:00 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Mar 2017 23:13:36 -0800
Message-Id: <20170307071349.16444-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.0
Subject: [meta-oe][PATCH 01/14] t1lib: Fix printf format string errors
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
X-List-Received-Date: Tue, 07 Mar 2017 07:14:02 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../t1lib/t1lib-5.1.2/format_security.patch        | 41 ++++++++++++++++++++++
 meta-oe/recipes-extended/t1lib/t1lib_5.1.2.bb      |  3 +-
 2 files changed, 43 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/t1lib/t1lib-5.1.2/format_security.patch

diff --git a/meta-oe/recipes-extended/t1lib/t1lib-5.1.2/format_security.patch b/meta-oe/recipes-extended/t1lib/t1lib-5.1.2/format_security.patch
new file mode 100644
index 000000000..8b4ce400f
--- /dev/null
+++ b/meta-oe/recipes-extended/t1lib/t1lib-5.1.2/format_security.patch
@@ -0,0 +1,41 @@
+Fix printf formats to use format qualifiers
+fixes
+
+error: format string is not a string literal (potentially insecure) [-Werror,-Wformat-security]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
+
+--- a/lib/type1/objects.c
++++ b/lib/type1/objects.c
+@@ -957,7 +957,7 @@
+  
+        sprintf(typemsg, "Wrong object type in %s; expected %s, found %s.\n",
+                   name, TypeFmt(expect), TypeFmt(obj->type));
+-       IfTrace0(TRUE,typemsg);
++       IfTrace1(TRUE, "%s", typemsg);
+  
+        ObjectPostMortem(obj);
+  
+--- a/lib/t1lib/t1subset.c
++++ b/lib/t1lib/t1subset.c
+@@ -759,7 +759,7 @@
+ 	     tr_len);
+     T1_PrintLog( "T1_SubsetFont()", err_warn_msg_buf,
+ 		 T1LOG_DEBUG);
+-    l+=sprintf( &(trailerbuf[l]), linebuf); /* contains the PostScript trailer */
++    l+=sprintf( &(trailerbuf[l]), "%s", linebuf); /* contains the PostScript trailer */
+   }
+   
+   /* compute size of output file */
+--- a/lib/type1/objects.h
++++ b/lib/type1/objects.h
+@@ -214,7 +214,7 @@
+ /*SHARED*/
+ /* NDW: personally, I want to see status and error messages! */
+ #define IfTrace0(condition,model)                                 \
+-        {if (condition) printf(model);}
++        {if (condition) fputs(model,stdout);}
+ #define IfTrace1(condition,model,arg0)                            \
+         {if (condition) printf(model,arg0);}
+ #define IfTrace2(condition,model,arg0,arg1)                       \
diff --git a/meta-oe/recipes-extended/t1lib/t1lib_5.1.2.bb b/meta-oe/recipes-extended/t1lib/t1lib_5.1.2.bb
index 1d670a7d7..826dbda85 100644
--- a/meta-oe/recipes-extended/t1lib/t1lib_5.1.2.bb
+++ b/meta-oe/recipes-extended/t1lib/t1lib_5.1.2.bb
@@ -9,7 +9,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8ca43cbc842c2336e835926c2166c28b \
 
 SRC_URI = "${DEBIAN_MIRROR}/main/t/t1lib/t1lib_${PV}.orig.tar.gz \
            file://configure.patch \
-           file://libtool.patch"
+           file://libtool.patch \
+           file://format_security.patch"
 SRC_URI[md5sum] = "a5629b56b93134377718009df1435f3c"
 SRC_URI[sha256sum] = "821328b5054f7890a0d0cd2f52825270705df3641dbd476d58d17e56ed957b59"
 
-- 
2.12.0


