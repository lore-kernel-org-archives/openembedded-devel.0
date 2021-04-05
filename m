Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web11.3388.1617658708466933369
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Apr 2021 14:38:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pGb/C7BK;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id d10so4084224pgf.12
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 Apr 2021 14:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9J58RFmrraYlfM/MhOV9Pfjvz7zTys0+LgkbvQ7zXQM=;
        b=pGb/C7BKIOf5zznNqtkZ+sWP0ysTXjQLZ3gLPS/Tx4N7civEviSJdSkoj9F1Jxg0YT
         bsO0+hvlpl/j05KIejNIkQs14ZZH8frW6pFikcL55l39HK3XH12OrjFZVIiszR8eOc6u
         VUwm4I7fi4PB02G74BcQKeX6xdiehjsQWAOMutnMIT0ufzikGCou0QtP0bAD/FD+Kt9J
         KlMsDX1g/ifXQi7dbDe8bo8/wqroBLu+BYinAsxwnpAEHof+qAnjfoqZuOL5SbnpnyDX
         4NDEdjnLSOwoAfa0URSxTuOc+gItGOunJMD/edFQPMeQhkwbzn0ybOvWWKt5OlfDYZWd
         j/nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9J58RFmrraYlfM/MhOV9Pfjvz7zTys0+LgkbvQ7zXQM=;
        b=BmNGO1FAIvn5G28b8nksp+W7Ns2yBSaQH+wQP0oL1lFcd1625kUmAcAOppuhJ5GNMQ
         5ipjEU275FiMqV8YQSZ5encXicRQZsDxGo6LLbAvzZdqsr+bNyievkn8AwFkMYJp4P2J
         ZHtixn11uvDPTF/yNtP/i79yQlTXgwgNxLzua00GexuUGiWxRqgvnsuvJkY4NmJ1jxk1
         mvBA3J6lNNFxSGgm6OPAn4/4yFJNPPahsP+c6LhRez7ps4HvV5/MPkuZ8Xy38jK3HoTx
         cZnnwUnA2DrezkNdLzlIhq0f0ZU83ejaF7qSt4Ka9DMYgHTSIsSoSA1tPxTf6smZi2cG
         uWAQ==
X-Gm-Message-State: AOAM530F6iX2ZugnWwrlGG/edKqR45r/0c3VHLE4pDlzk1KJ5SrWUcGy
	TPMZ9euKnJYE7yplyS6CWeN09k1TwmYQcQ==
X-Google-Smtp-Source: ABdhPJxXpL2ZEZjgBZP/qyBOSTCGYBFdhucjCCWePu4Xds4HDkzPv+r990WBT+Wbmaoxfd2tFuDoGw==
X-Received: by 2002:a65:6792:: with SMTP id e18mr14924065pgr.256.1617658707597;
        Mon, 05 Apr 2021 14:38:27 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bc1b])
        by smtp.gmail.com with ESMTPSA id h29sm4795340pgb.3.2021.04.05.14.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 14:38:27 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH v2] iwd: Upgade to 1.13
Date: Mon,  5 Apr 2021 14:38:25 -0700
Message-Id: <20210405213825.3478004-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix out of tree builds
Switch to tarball fetch

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Fix out of tree builds and switch to tarball fetcher

 ...p_srcdir-instead-of-abs_srcdir-for-e.patch | 35 +++++++++++++++++++
 .../iwd/{iwd_1.12.bb => iwd_1.13.bb}          |  6 ++--
 2 files changed, 38 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/iwd/iwd/0001-build-Use-abs_top_srcdir-instead-of-abs_srcdir-for-e.patch
 rename meta-oe/recipes-connectivity/iwd/{iwd_1.12.bb => iwd_1.13.bb} (85%)

diff --git a/meta-oe/recipes-connectivity/iwd/iwd/0001-build-Use-abs_top_srcdir-instead-of-abs_srcdir-for-e.patch b/meta-oe/recipes-connectivity/iwd/iwd/0001-build-Use-abs_top_srcdir-instead-of-abs_srcdir-for-e.patch
new file mode 100644
index 0000000000..63d617f3e1
--- /dev/null
+++ b/meta-oe/recipes-connectivity/iwd/iwd/0001-build-Use-abs_top_srcdir-instead-of-abs_srcdir-for-e.patch
@@ -0,0 +1,35 @@
+From 0532cddcec9c3abff1f3bc22d2fa50df03d55d17 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 5 Apr 2021 14:11:40 -0700
+Subject: [PATCH] build: Use abs_top_srcdir instead of abs_srcdir for ell sources
+
+this makes it build when build dir is outside of sources dir
+
+Upstream-Status: Submitted [https://lists.01.org/hyperkitty/list/iwd@lists.01.org/message/SYX6Z7SUQHU7UWM6ECZTTJ6SPODIS6KB/]
+---
+ Makefile.am | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -625,9 +625,10 @@ unit/tls-settings.8021x: unit/cert-ca.pe
+ BUILT_SOURCES = $(ell_built_sources) src/builtin.h
+ 
+ ell/shared: Makefile
++	$(AM_V_at)$(MKDIR_P) ell
+ 	$(AM_V_GEN)for f in $(ell_shared) ; do \
+ 		if [ ! -f $$f ] ; then \
+-			$(LN_S) -t ell -f $(abs_srcdir)/../ell/$$f ; \
++			$(LN_S) -t ell -f $(abs_top_srcdir)/ell/$$f ; \
+ 		fi \
+ 	done > $@
+ 
+@@ -635,7 +636,7 @@ ell/internal: Makefile
+ 	$(AM_V_at)$(MKDIR_P) ell
+ 	$(AM_V_GEN)for f in $(ell_headers) $(ell_sources) ; do \
+ 		if [ ! -f $$f ] ; then \
+-			$(LN_S) -t ell -f $(abs_srcdir)/../ell/$$f ; \
++			$(LN_S) -t ell -f $(abs_top_srcdir)/ell/$$f ; \
+ 		fi \
+ 	done > $@
+ 
diff --git a/meta-oe/recipes-connectivity/iwd/iwd_1.12.bb b/meta-oe/recipes-connectivity/iwd/iwd_1.13.bb
similarity index 85%
rename from meta-oe/recipes-connectivity/iwd/iwd_1.12.bb
rename to meta-oe/recipes-connectivity/iwd/iwd_1.13.bb
index ccdc65ac6c..19d3a509ca 100644
--- a/meta-oe/recipes-connectivity/iwd/iwd_1.12.bb
+++ b/meta-oe/recipes-connectivity/iwd/iwd_1.13.bb
@@ -5,10 +5,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fb504b67c50331fc78734fed90fb0e09"
 
 DEPENDS = "ell"
 
-SRC_URI = "git://git.kernel.org/pub/scm/network/wireless/iwd.git \
+SRC_URI = "https://www.kernel.org/pub/linux/network/wireless/${BP}.tar.xz \
+           file://0001-build-Use-abs_top_srcdir-instead-of-abs_srcdir-for-e.patch \
           "
-SRCREV = "bde3e0f6e3364e9c884b6b93a944d8138345b8e5"
-S = "${WORKDIR}/git"
+SRC_URI[sha256sum] = "b005f7ed0f0a96a2c6181c44560fc868533a18e7034bd4cb43ea0d40c21b4e7a"
 
 inherit autotools manpages pkgconfig python3native systemd
 
-- 
2.31.1

