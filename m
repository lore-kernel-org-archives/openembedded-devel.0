Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id C82C57E71B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Aug 2019 07:34:34 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id m125so6794315wmm.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Aug 2019 00:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Lc6WDTOjYl4h2DWF49ymn+u92y1JmiuPoUoEWZVqcbY=;
	b=CtRqFBcNwjoyK5PO3oevD/h1ffkW9XBwYzok4rlOPZGtfaH+HJfTvGlDCtAO8cl/mM
	YNfLnBeMdD1C1pZpL4ZC0VAIAoA3Aiv7mEN3Ok/Cgn9J8q3ukxNi0sbvbR46igb6op8B
	BnhxWlDtNpsSRrLnKGYkHmbjujk7Pb/wZNY2UFk13GfbwS9PK477Z0KnHWMxT9ZfkfRU
	ANIuc5Fi7V+hnqwSaLN3nBnha08hBAo2A7uH+9PCN7k5DHOf6OSRvPcWMthpGTVnFlNZ
	STy4f5RG7PWS/A9Eb6ewxIGvjP6I7x3wvkx4yg3oQNZKLfrtdEmMGNCR48ehd0qFvnZ9
	VCww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Lc6WDTOjYl4h2DWF49ymn+u92y1JmiuPoUoEWZVqcbY=;
	b=f6X6IoxZMVxhIHOK5pVaiaiwuLf5gHm5tUw5q3cLFpESEipo8luqtwaw62b/7eSmQ7
	76+kuKMIMrl1qo1MOFMECYkkU3s+LSRkjQjvHWgAH0OWJFYLXZGYUFBDulP/vTa3Orcn
	kJqfwYi0G+B4WxXt1z++/LAC5JXrGz+/Lc3amOGMi7SdobQTd0TXcRCL7T4ZTuAHpLsM
	b6EWtWsWYo2MtTARYdvPRoW3TaAa9vX599/Oj3B4r8rDXfZluJNeQt96+wMJfTVTIZ0L
	ex09M+r1Ty789s8r1AaC5PRv+r3mGMjTTdU3La5tmi1rusqJZV6Hpqoxjps+XXf2alJL
	m2Mg==
X-Gm-Message-State: APjAAAXLK5ZshDiP7rU53Slcr9Rr1jY0Qv26Ge+Px/8FjTDWjVEG/Qgy
	xQvw7mrNtG6Mc1mMFEO6yLSx3aIO
X-Google-Smtp-Source: APXvYqzRH+JMr66s6fOjwNFyNgZzfAOOlRSnjMxBKtJ5kA9Ef/CSHnseFRZMWf3YJZOJtWI+donomQ==
X-Received: by 2002:a1c:770d:: with SMTP id t13mr993979wmi.27.1565595275217;
	Mon, 12 Aug 2019 00:34:35 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	j16sm60097315wrp.62.2019.08.12.00.34.34
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 12 Aug 2019 00:34:34 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 12 Aug 2019 07:34:32 +0000
Message-Id: <20190812073432.68-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-networking][PATCH] ntop: fix missing return from non-void function
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
X-List-Received-Date: Mon, 12 Aug 2019 07:34:35 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...issing-return-from-non-void-function.patch | 19 +++++++++++++++++++
 .../recipes-support/ntop/ntop_5.0.1.bb        |  1 +
 2 files changed, 20 insertions(+)
 create mode 100644 meta-networking/recipes-support/ntop/ntop/fix-missing-return-from-non-void-function.patch

diff --git a/meta-networking/recipes-support/ntop/ntop/fix-missing-return-from-non-void-function.patch b/meta-networking/recipes-support/ntop/ntop/fix-missing-return-from-non-void-function.patch
new file mode 100644
index 0000000000..e627e59a59
--- /dev/null
+++ b/meta-networking/recipes-support/ntop/ntop/fix-missing-return-from-non-void-function.patch
@@ -0,0 +1,19 @@
+Fix following error:
+
+netflowPlugin.c: In function 'netflowUtilsLoop':
+netflowPlugin.c:2144:1: error: no return statement in function returning non-void [-Werror=return-type]
+ 2144 | }
+      | ^
+
+Return NULL like netflowMainLoop does.
+
+--- ntop-5.0.1.orig/plugins/netflowPlugin.c	2012-03-09 17:44:17.000000000 +0000
++++ ntop-5.0.1/plugins/netflowPlugin.c	2019-08-09 10:25:40.878799852 +0000
+@@ -2141,6 +2141,7 @@
+       waitCondvar(&myGlobals.device[deviceId].netflowGlobals->ifStatsQueueCondvar);
+     }
+   }
++  return(NULL);
+ }
+ #endif
+ 
diff --git a/meta-networking/recipes-support/ntop/ntop_5.0.1.bb b/meta-networking/recipes-support/ntop/ntop_5.0.1.bb
index 2a7a7f2cb0..80f009b7c3 100644
--- a/meta-networking/recipes-support/ntop/ntop_5.0.1.bb
+++ b/meta-networking/recipes-support/ntop/ntop_5.0.1.bb
@@ -18,6 +18,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/ntop/ntop-${PV}.tar.gz \
            file://use-static-inline.patch \
            file://0001-nDPI-Include-sys-types.h.patch \
            file://0001-plugins-Makefile.am-fix-for-automake-1.16.1.patch \
+           file://fix-missing-return-from-non-void-function.patch \
           "
 SRC_URI[md5sum] = "01710b6925a8a5ffe1a41b8b512ebd69"
 SRC_URI[sha256sum] = "7e8e84cb14d2173beaca4d4cb991a14d84a4bef84ec37b2276bc363f45c52ef8"
-- 
2.17.1


