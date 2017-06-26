Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id B5DC96067C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jun 2017 05:34:59 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id d5so16787568pfe.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Jun 2017 22:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=BuBEh39p/kSPgP6+lNMD4WmoeRW6dfF6TNfEp+EFbnk=;
	b=PQYohiLMeIl3ZbGV2DBnyPLqPtFMal2h+hNBKHgy7w+MmrCt3FTgfI+Gvt5Qzdndmg
	HThqgmWRDyui7fzIRYCAUg8tOfnOWltCfsA07nwiS+jEea86tXKhAbY4jXM+vzGjiq5n
	s+Ids2IFrWkgtQVFNLgwwHL2JIGyk1OOfWSBV3CTSync93xWQG0NHle1CPe0lO61EqHm
	ze+0ejd66zSTic51vfldcotG+n4ZMj91wy1vAgYTVGlWNbmZ0OLwfXLmjekaS122RdvN
	FYOxyXwx9KsUZsTgc+rCgAZGziw7MUpIeth4aKqGnR5Zrg79ZTUoEy9G6FbN1e6NCDGg
	AMEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=BuBEh39p/kSPgP6+lNMD4WmoeRW6dfF6TNfEp+EFbnk=;
	b=pbiPXPD6WCkCu54UnVohuq1OK28P2x0KyKDE6ifBBght+ryp7H8la5tFCAQ6RzVHlm
	1UvySdpfUdILP6Ie7OHFFmitLcKcDm+gemzFT8mvy6UxUcmsdFf+P5CHTOIhD9+bIVd8
	+4CEUn6mB4zmauWgYMwcHlAHnkN3SdaUjAYBEtIBimxudoJ8OZHpCAtm5HgPgW87Ya8f
	nZTOUHAYAzlMBZPi/xukda70PYeAldBC7IBTJC/xS9Va5XtHmTrF2jopITol+N8A1F0y
	mBwBuGLYTMQkY1BwiO30B+BdqtEofxWoUwzPJ/PGdg3z31RWQA+HsBq1EV0Se/W4RQWI
	NnFQ==
X-Gm-Message-State: AKS2vOzeodyP290LfV0cmXzU8WOpXUM9RHeEn9B0A8KgI8roUsU8jB2Z
	CJOsROhAtMR/lV/D
X-Received: by 10.98.76.83 with SMTP id z80mr19774020pfa.87.1498455300515;
	Sun, 25 Jun 2017 22:35:00 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id
	x64sm23932432pfk.20.2017.06.25.22.34.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 25 Jun 2017 22:34:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Jun 2017 22:34:41 -0700
Message-Id: <20170626053446.37959-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.1
In-Reply-To: <20170626053446.37959-1-raj.khem@gmail.com>
References: <20170626053446.37959-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 2/7] squid: Fix build with hardening
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
X-List-Received-Date: Mon, 26 Jun 2017 05:34:59 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...0001-tools.cc-fixed-unused-result-warning.patch | 36 ++++++++++++++++++++++
 .../recipes-daemons/squid/squid_3.5.26.bb          |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/squid/files/0001-tools.cc-fixed-unused-result-warning.patch

diff --git a/meta-networking/recipes-daemons/squid/files/0001-tools.cc-fixed-unused-result-warning.patch b/meta-networking/recipes-daemons/squid/files/0001-tools.cc-fixed-unused-result-warning.patch
new file mode 100644
index 000000000..082a1114b
--- /dev/null
+++ b/meta-networking/recipes-daemons/squid/files/0001-tools.cc-fixed-unused-result-warning.patch
@@ -0,0 +1,36 @@
+From a78f2f0feda8f92cb59afe8236bd90726908768f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 25 Jun 2017 00:59:24 -0700
+Subject: [PATCH] tools.cc: fixed unused-result warning
+
+fix
+| ../../squid-3.5.26/src/tools.cc: In function 'void enter_suid()':
+| ../../squid-3.5.26/src/tools.cc:616:11: error: ignoring return value of 'int setuid(__uid_t)', declared with attribute warn_unused_result [-Werror=unused-result]
+|      setuid(0);
+|      ~~~~~~^~~
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Submitted
+
+ src/tools.cc | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/tools.cc b/src/tools.cc
+index 8137a03..843e266 100644
+--- a/src/tools.cc
++++ b/src/tools.cc
+@@ -612,8 +612,8 @@ enter_suid(void)
+     if (setresuid((uid_t)-1, 0, (uid_t)-1) < 0)
+         debugs (21, 3, "enter_suid: setresuid failed: " << xstrerror ());
+ #else
+-
+-    setuid(0);
++    if (setuid(0) < 0)
++        debugs(50, DBG_IMPORTANT, "WARNING: no_suid: setuid(0): " << xstrerror());
+ #endif
+ #if HAVE_PRCTL && defined(PR_SET_DUMPABLE)
+     /* Set Linux DUMPABLE flag */
+-- 
+2.13.1
+
diff --git a/meta-networking/recipes-daemons/squid/squid_3.5.26.bb b/meta-networking/recipes-daemons/squid/squid_3.5.26.bb
index e1b4c06dc..a78a09135 100644
--- a/meta-networking/recipes-daemons/squid/squid_3.5.26.bb
+++ b/meta-networking/recipes-daemons/squid/squid_3.5.26.bb
@@ -24,6 +24,7 @@ SRC_URI = "http://www.squid-cache.org/Versions/v${MAJ_VER}/${MIN_VER}/${BPN}-${P
            file://0001-SquidNew-use-noexcept-instead-of-throw-for-C-11-comp.patch \
            file://0001-configure-Check-for-Wno-error-format-truncation-comp.patch \
            file://gcc7-fixes.patch \
+           file://0001-tools.cc-fixed-unused-result-warning.patch \
            "
 SRC_URI[md5sum] = "dc1830cd361e077814aa39bcc3691d8b"
 SRC_URI[sha256sum] = "41d8845863dcd026c856508cd1599d417c8947ffd96e86e24085f9893cb8b8c2"
-- 
2.13.1


