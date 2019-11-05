Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
	[209.85.210.176])
	by mail.openembedded.org (Postfix) with ESMTP id 9DDB27F93F
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Nov 2019 00:58:23 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id c184so13860340pfb.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Nov 2019 16:58:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Ecs6sE7BbplK6NAwjriYrCwX3z5Z01qiUrgvOGWg97o=;
	b=nUqZrvbLn0fDRs4n78EOijeRcNMZTkcoihBUReD30nikVzgs8q/SMe72VwpoTp8AVY
	vdr2p73O7j78n5crAsTQZEOUbSU6SXpLo6/YSZKs3TWzWPOiFUJYWAKpShfjzepjNuz0
	1JPJidpuX0zGn10MjuXWu9wEwjAcixOqvmph5X3YewkNCI2/Kn7afp8zILeHFwNSFK8y
	ntdREaBBYUcUyJS+KYfHG2Tfpc60kgnyxyZB4uqS9pNcfx1Ym9t6hOAM+/AnIGj4yhKS
	AvBdXovHVb/g7/vxDzGeruI8b55dRTXj3Ak4IkqvdUJDAdpZaMFdicyP6RFk3RNpfAHk
	PLtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Ecs6sE7BbplK6NAwjriYrCwX3z5Z01qiUrgvOGWg97o=;
	b=FO3LujuIOakzt+c/F+ZPYmE7PuVufWYZ/tI+Uw4zoRF08JCOizrtv94YT3rLc+srIh
	JebZfaYmLL1UsM35J1LF5bqga2k2NHRWq16brl0lRC2D1gpKC+x/YlujQw1ZOVVlSjlV
	86ECA8JTfzQHfi44x1sZ5a9nFy3+hRtqEb3EBHPEyLZPpEctl9uZO5fN50E8SAO9KUge
	v+0YO80uzE2N50UxnaxzlOqWgN+6SmWLhBjxMTrF/9wejCPYmwBLqLzpMXMvyhIRZ30/
	ikL0QWPd0EIqXwORvQl+WL2p0Z2Vl6f+tahHX387sDSexHAnegccBBs4PPFhFZ+6Hk7m
	IJjg==
X-Gm-Message-State: APjAAAWyl3HqO0sV6pHcUjBe/3vQYdqpY1tfEOItWO9vIlFvt0Lzy5LW
	E9T9KTNB5XAmzXXHBkdfzo5ZotaHHXU=
X-Google-Smtp-Source: APXvYqzrNrY+PRgcWUF+sJu+si/dFQPKd7HYL+TZtFXrTudON7xLoLCn/CAKQdSouT3vt/a2aOQ4oA==
X-Received: by 2002:aa7:95a6:: with SMTP id a6mr34495630pfk.137.1572915504107; 
	Mon, 04 Nov 2019 16:58:24 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::5caf])
	by smtp.gmail.com with ESMTPSA id
	b23sm18856620pju.16.2019.11.04.16.58.23
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 04 Nov 2019 16:58:23 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  4 Nov 2019 16:58:11 -0800
Message-Id: <20191105005811.2708915-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191105005811.2708915-1-raj.khem@gmail.com>
References: <20191105005811.2708915-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/2] iwd: Fix build race during documentation build
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
X-List-Received-Date: Tue, 05 Nov 2019 00:58:23 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...d-redirection-of-input-and-output-fi.patch | 52 +++++++++++++++++++
 meta-oe/recipes-connectivity/iwd/iwd_1.0.bb   |  4 +-
 2 files changed, 55 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-connectivity/iwd/iwd/0001-Makefile.am-Avoid-redirection-of-input-and-output-fi.patch

diff --git a/meta-oe/recipes-connectivity/iwd/iwd/0001-Makefile.am-Avoid-redirection-of-input-and-output-fi.patch b/meta-oe/recipes-connectivity/iwd/iwd/0001-Makefile.am-Avoid-redirection-of-input-and-output-fi.patch
new file mode 100644
index 0000000000..86837a9f66
--- /dev/null
+++ b/meta-oe/recipes-connectivity/iwd/iwd/0001-Makefile.am-Avoid-redirection-of-input-and-output-fi.patch
@@ -0,0 +1,52 @@
+From b6da226187e704cd07857d8afeaade545688fcbb Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 4 Nov 2019 16:38:04 -0800
+Subject: [PATCH] Makefile.am: Avoid redirection of input and output files
+
+This can cause a build race in a highly parallelised build where a directory is not yet created but
+output file is being written using redirection e.g.
+
+rst2man.py --strict --no-raw --no-generator --no-datestamp < ../git/monitor/iwmon.rst > monitor/iwmon.1
+/bin/sh: monitor/iwmon.1: No such file or directory
+make[1]: *** [Makefile:3544: monitor/iwmon.1] Error 1
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makefile.am | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 823b7d02..21dd707c 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -627,7 +627,7 @@ SED_PROCESS = $(AM_V_GEN)$(MKDIR_P) $(dir $@) && $(SED) \
+ 
+ if RUN_RST2MAN
+ RST2MAN_PROCESS = $(AM_V_GEN)$(RST2MAN) --strict --no-raw --no-generator \
+-			--no-datestamp < $< > $@
++			--no-datestamp
+ else
+ RST2MAN_PROCESS = $(AM_V_GEN)test -f $@ || \
+ 		{ echo "Generated manual page $@ does not exist"; false; }
+@@ -637,13 +637,13 @@ endif
+ 	$(SED_PROCESS)
+ 
+ %.1: %.rst Makefile
+-	$(RST2MAN_PROCESS)
++	$(RST2MAN_PROCESS) $< $@
+ 
+ %.5: %.rst Makefile
+-	$(RST2MAN_PROCESS)
++	$(RST2MAN_PROCESS) $< $@
+ 
+ %.8: %.rst Makefile
+-	$(RST2MAN_PROCESS)
++	$(RST2MAN_PROCESS) $< $@
+ 
+ install-data-local:
+ if !SYSTEMD_SERVICE
+-- 
+2.24.0
+
diff --git a/meta-oe/recipes-connectivity/iwd/iwd_1.0.bb b/meta-oe/recipes-connectivity/iwd/iwd_1.0.bb
index 81260cc020..d11e0d4ae3 100644
--- a/meta-oe/recipes-connectivity/iwd/iwd_1.0.bb
+++ b/meta-oe/recipes-connectivity/iwd/iwd_1.0.bb
@@ -6,7 +6,9 @@ inherit autotools pkgconfig systemd python3native
 
 DEPENDS = "ell readline dbus python3-docutils-native"
 
-SRC_URI = "git://git.kernel.org/pub/scm/network/wireless/iwd.git"
+SRC_URI = "git://git.kernel.org/pub/scm/network/wireless/iwd.git \
+           file://0001-Makefile.am-Avoid-redirection-of-input-and-output-fi.patch \
+          "
 SRCREV = "971e1d2038a203ad43bd2278a811a9e5ec8d52db"
 S = "${WORKDIR}/git"
 
-- 
2.24.0


