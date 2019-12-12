Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id ED1CB7D200
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Dec 2019 20:23:02 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id s18so1441379pfd.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Dec 2019 12:23:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=gCeGtM4q1T+AQpuzIL8rtY6QE/jV+19gDwBqjh2ibdg=;
	b=FromEjRLOZunuJgv+j/gWuKf793kwMQ+yqmJkqSKKMq6TPbkbNAkNm8R7H3d1biFIl
	PIUF9SEmQdmff/Q8qsaeQaMrX8g164taQQtFoSnzy7i4CndY6haUD4YXXzraJGEv+nuG
	FXVPW5pNESCchuvLJ3HsFR2YJPvqj8h61Wuacera2xHds9EoH7GJjA5GTBZ8+KUboqq6
	CP5MfBD6gSs7Y456byD3g1rRnDvU+VNau1pDo1lsYhdFK+yc1EKHbMmdemijcV50SLXq
	v8l9OvD9V43ByZa8IWtWxZPmZVD0fjicak7MiicbDuaqNJlVD/NLUYqmWQUev15nDBkY
	/QWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=gCeGtM4q1T+AQpuzIL8rtY6QE/jV+19gDwBqjh2ibdg=;
	b=FX54M3NvVh6mtyd1Xh+szYrgM5Dsc2V6TjbZY6A6xSvieowX5Btrf69WK++FfdWo9w
	ApofYdQ7wH3ojvdYHt7TFrBePqgjbEKontKgeUK+La6D6eRs77IR4OZ9FrMUn6esJME3
	zonwhvfSpZNb5Tj7moZTBQkvJNw5mKoBfwQA4BcX/aM/DlwSVLZGNgKtprvQ1xvCyOjS
	6ZbewteaSQs4sVxqujoFzA/WNcAVfNKWkKdt85eYCsmejk8YjIjUqFzVdBt8GNA5HqM3
	gWZfFCqBXFsHyxqC9h0EMyUf7moUg6VGt3mqxAaq5Nj0DW0Z8SAppYFXA3cRR0ydqPDR
	HmHQ==
X-Gm-Message-State: APjAAAVHe7pFLlssTUPheEbxkjXHiD8+bH7SOUM5oPJnFvrezpu9Tcvz
	fxo77tVrWpQ/CAv7mQgnQtwlNkdRwQw=
X-Google-Smtp-Source: APXvYqzQDVUldqaWoNZtCsfzPrOhtpc4I3pMuMizKOsF5gpWYvUntb3ZBS99t0zs3NRPWJmifM2obw==
X-Received: by 2002:a63:de4a:: with SMTP id y10mr12629898pgi.367.1576182182824;
	Thu, 12 Dec 2019 12:23:02 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::3552])
	by smtp.gmail.com with ESMTPSA id
	r66sm8730732pfc.74.2019.12.12.12.23.02
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 12 Dec 2019 12:23:02 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Dec 2019 12:22:52 -0800
Message-Id: <20191212202252.2786262-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191212202252.2786262-1-raj.khem@gmail.com>
References: <20191212202252.2786262-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH] xterm: Fix latent issue found with musl
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
X-List-Received-Date: Thu, 12 Dec 2019 20:23:03 -0000
Content-Transfer-Encoding: 8bit

[YOCTO #13691]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Ross Burton <ross.burton@intel.com>
Cc: Armin Kuster <akuster808@gmail.com>
---
 .../xorg-app/xterm/posix_ptys.patch           | 29 +++++++++++++++++++
 .../recipes-graphics/xorg-app/xterm_351.bb    |  4 ++-
 2 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-graphics/xorg-app/xterm/posix_ptys.patch

diff --git a/meta-oe/recipes-graphics/xorg-app/xterm/posix_ptys.patch b/meta-oe/recipes-graphics/xorg-app/xterm/posix_ptys.patch
new file mode 100644
index 0000000000..54020d53e9
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-app/xterm/posix_ptys.patch
@@ -0,0 +1,29 @@
+there is no test to define HAVE_GRANTPT_PTY_ISATTY and
+_POSIX_SOURCE is app-defined not system
+This fix ptys and launching xterm
+
+Upstream-Status: Pending
+
+Suggested By Rich Felker
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+--- a/main.c
++++ b/main.c
+@@ -2892,7 +2892,7 @@ get_pty(int *pty, char *from GCC_UNUSED)
+ 	close(opened_tty);
+ 	opened_tty = -1;
+     }
+-#elif defined(HAVE_POSIX_OPENPT) && defined(HAVE_PTSNAME) && defined(HAVE_GRANTPT_PTY_ISATTY)
++#elif defined(HAVE_POSIX_OPENPT) && defined(HAVE_PTSNAME)
+     if ((*pty = posix_openpt(O_RDWR)) >= 0) {
+ 	char *name = ptsname(*pty);
+ 	if (name != 0) {
+@@ -4040,7 +4040,7 @@ spawnXTerm(XtermWidget xw, unsigned line
+ 	    /*
+ 	     * now in child process
+ 	     */
+-#if defined(_POSIX_SOURCE) || defined(SVR4) || defined(__convex__) || defined(__SCO__) || defined(__QNX__)
++#if defined(_POSIX_VERSION) || defined(SVR4) || defined(__convex__) || defined(__SCO__) || defined(__QNX__)
+ 	    int pgrp = setsid();	/* variable may not be used... */
+ #else
+ 	    int pgrp = getpid();
diff --git a/meta-oe/recipes-graphics/xorg-app/xterm_351.bb b/meta-oe/recipes-graphics/xorg-app/xterm_351.bb
index 394d2cb9de..abfda8a5fa 100644
--- a/meta-oe/recipes-graphics/xorg-app/xterm_351.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xterm_351.bb
@@ -4,7 +4,9 @@ DEPENDS = "libxaw xorgproto libxext libxau libxinerama libxpm ncurses"
 
 LIC_FILES_CHKSUM = "file://xterm.h;beginline=3;endline=31;md5=c7faceb872d90115e7c0ad90e90c390d"
 
-SRC_URI = "http://invisible-mirror.net/archives/${BPN}/${BP}.tgz"
+SRC_URI = "http://invisible-mirror.net/archives/${BPN}/${BP}.tgz \
+           file://posix_ptys.patch \
+          "
 
 SRC_URI[md5sum] = "a07edfbee2e2f4c6a9ddbf834fa4bbec"
 SRC_URI[sha256sum] = "760a8a10221c9c9744afd86db87c7ad95bbf9be4f5f525fecf39125f0d2a6e16"
-- 
2.24.1


