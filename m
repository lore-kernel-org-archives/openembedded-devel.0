Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 23C477DD6C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Dec 2019 03:41:19 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id 4so6747055pfz.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Dec 2019 19:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=kvPIPB11Gy5yCtGTZeg42vX96yw9hCQFnNt394uJ2gQ=;
	b=OSKIESFEXZzH2PkZFIbnez3lYfBxeMS4xYdqMWMN0G5zPNpaUZFPottRC/DML9CxCb
	fmtVx3EFOH46t4u4zbWp7miJS/nxBTxTUbqNQKzMEwzxvPAyTEzWv2MAdHxommlt+l/t
	/eU6hJOxMcuKvKd05TrraAUxqEXH6B8NF2eXSJon/PLfBz9/kAf1/wAvD+IFud0ppXgJ
	lTzwlpBJnbMCfHMAnBeUyLVg8G8kkVygB9P1q6yyQBvRcTwRKGsUvhP1563zYFR9h25/
	ZkF8tiG1VATLtUqE85qGUhH1URArRQ2T4dNUNnu1hVAdgx5LQEKq6+ooHMB0xJbsYg77
	/9jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=kvPIPB11Gy5yCtGTZeg42vX96yw9hCQFnNt394uJ2gQ=;
	b=iTrXCjAI514pRS1pwU6uLnx+CsfKZ7/yW7mxIpfyDuW2aN6H1v+Uy+k9l3fJcSraKR
	EJn5aoNLcnWPj6tlJf+WGYWGL80kf40NB3E4ya9nVCYj2KQkeCnUPm5OqTNG8A7czhUG
	E5V+smaoMUybx+O9ASZq8/jgeM/QbUXYoo/44iEap4E1DxiNd9TtOXLpPcPV5h1JCRMS
	XGj1In/ox6UsZ1lnMeC3/FjmwoEq2dFKCe4DPYzoIvz8cb709V5yUQlfKROYXdgUzQtq
	3LdCj4I5IQDomBJySh6JcFLrnEAzzxc7zh0t/vwsZcJnsi2d9fZ9sHagySFVsbeDxQjj
	R2uA==
X-Gm-Message-State: APjAAAVQfrxq9tKbdf6y48fClUC/mihAoJnWLnlhvsp6iInc+SDGr7gc
	ImCsgVYGzdju9NUsidDEXLmpv/LiAII=
X-Google-Smtp-Source: APXvYqzD/0jUyMY3GRxjcFrAC1syfGYr/N+lGQdb1S7/Wkxxb6TGPUc2j3yagGeYy9PyMuRsBG1chw==
X-Received: by 2002:a63:1502:: with SMTP id v2mr22553204pgl.376.1576554079310; 
	Mon, 16 Dec 2019 19:41:19 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::2ebb])
	by smtp.gmail.com with ESMTPSA id
	u18sm25118197pgn.9.2019.12.16.19.41.18
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 16 Dec 2019 19:41:18 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Dec 2019 19:41:09 -0800
Message-Id: <20191217034110.3234131-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/2] fvwm: Upgrade to 2.6.9
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
X-List-Received-Date: Tue, 17 Dec 2019 03:41:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Drop manpage disable part from existing patch
An upstream patch [1] helps manpage creation

[1] https://github.com/fvwmorg/fvwm/commit/0fdf2815bc09edaf4c0ecb45d47ad12d00863239

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...001-Fix-compilation-for-disabled-gnome.patch | 17 -----------------
 .../fvwm/{fvwm_2.6.8.bb => fvwm_2.6.9.bb}       |  5 +----
 2 files changed, 1 insertion(+), 21 deletions(-)
 rename meta-oe/recipes-graphics/fvwm/{fvwm_2.6.8.bb => fvwm_2.6.9.bb} (96%)

diff --git a/meta-oe/recipes-graphics/fvwm/fvwm/0001-Fix-compilation-for-disabled-gnome.patch b/meta-oe/recipes-graphics/fvwm/fvwm/0001-Fix-compilation-for-disabled-gnome.patch
index e81d395b9c..50003e3318 100644
--- a/meta-oe/recipes-graphics/fvwm/fvwm/0001-Fix-compilation-for-disabled-gnome.patch
+++ b/meta-oe/recipes-graphics/fvwm/fvwm/0001-Fix-compilation-for-disabled-gnome.patch
@@ -10,10 +10,6 @@ COMPAT_OLD_KEYSYMDEF is a check for a legacy system, which our system
 most definitely is not.  It is accomplished by trying to execute
 a program, which does not work when cross compiling.
 
-The fvwm(1) man page is created from Docbook XML which is set for
-a Windows code page that is not available when compiling.  Easiest is
-to just not create the man page as those are not needed on the monitor.
-
 Upstream-Status: inappropriate [OE specific]
 Signed-off-by: Jarmo Jaakkola <jarmo.jaakkola@vincit.fi>
 Signed-off-by: Riku Hämäläinen <riku.hamalainen@ge.com>
@@ -36,19 +32,6 @@ index 48ce264..fab7b44 100644
  AH_VERBATIM([_COMPAT_OLD_KEYSYMDEF],
  [#ifdef COMPAT_OLD_KEYSYMDEF
  #  define XK_Page_Up   XK_Prior
-diff --git a/doc/fvwm/Makefile.am b/doc/fvwm/Makefile.am
-index cddb102..ff00149 100755
---- a/doc/fvwm/Makefile.am
-+++ b/doc/fvwm/Makefile.am
-@@ -10,7 +10,7 @@ XSL_PROFILE = $(srcdir)/../docbook-xsl/profiling/profile.xsl
- HTML_FILES = fvwm.man.html
- XML_FILES = @DOC_SECTIONS_XML_PATH@
- EXTRA_DIST = @DOC_SECTIONS_XML@ $(man_MANS) sections
--man_MANS = fvwm.1
-+man_MANS =
- 
- if FVWM_BUILD_HTMLDOC
- doc_DATA = $(HTML_FILES)
 -- 
 1.9.1
 
diff --git a/meta-oe/recipes-graphics/fvwm/fvwm_2.6.8.bb b/meta-oe/recipes-graphics/fvwm/fvwm_2.6.9.bb
similarity index 96%
rename from meta-oe/recipes-graphics/fvwm/fvwm_2.6.8.bb
rename to meta-oe/recipes-graphics/fvwm/fvwm_2.6.9.bb
index b3cb01aaa7..d1ba482039 100644
--- a/meta-oe/recipes-graphics/fvwm/fvwm_2.6.8.bb
+++ b/meta-oe/recipes-graphics/fvwm/fvwm_2.6.9.bb
@@ -31,14 +31,12 @@ DEPENDS = " \
     zlib \
 "
 
-PV = "2.6.8"
-
 SRC_URI = " \
     git://github.com/fvwmorg/fvwm.git;protocol=https \
     file://0001-Fix-compilation-for-disabled-gnome.patch \
 "
 
-SRCREV = "dc6a396bfe5cd6c53eb1df103c3af505d0899f90"
+SRCREV = "88eab6dc16da6e5dd25fe97fbb56b96ef0d58657"
 
 S = "${WORKDIR}/git"
 
@@ -55,7 +53,6 @@ EXTRA_OECONF = " \
     --disable-fontconfigtest \
     --disable-htmldoc \
     --disable-imlibtest \
-    --disable-mandoc \
     --disable-nls \
     --disable-perllib \
     --disable-rsvg \
-- 
2.24.1


