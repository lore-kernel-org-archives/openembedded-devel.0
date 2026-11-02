Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7290.1793602358282303350
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 Nov 2026 22:52:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=agHnAPkw;
 spf=pass (domain: gmail.com, ip: 74.125.82.51, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1adbf62dd31so2712357c88.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 01 Nov 2026 22:52:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793602357; x=1794207157; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+gpuIjxI1pfRU+LEmjnuIJ0mRsSWyQ8ZLNe0MaAYCX0=;
        b=agHnAPkw3E78hwj8NSB/HqqkfGC9p4X55deviby0bLFZURcIp7iyqCylOdwPzjWTXj
         athuxRfNc4ghCOz9J1Q1qVPcdDhqKCnQGKuwd65o3muWW7YA+OOCG+1dw03sqKOyjZYS
         5rE6iIyX3M5DsaJ9BTNkVEXcJbucd/ELa9m64UMjFxQTQqeM0O0dR9hlm2dKwBDbhQQ4
         nfzBH8b7Rih36+duNOoMXQAau3IXlhG6NT8nN1kWcJf6XBojA+6kZtOHM3QSS1IJDJlr
         h+3PFBrhiMWg66Wngtyqe8OWElcfU9nQjMtOMmOiQ9P767Gv78z4JHn1GOw+WUA2QT91
         TwhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793602357; x=1794207157;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+gpuIjxI1pfRU+LEmjnuIJ0mRsSWyQ8ZLNe0MaAYCX0=;
        b=u2hCNPWdpCSFB55d1/MaCdktzde/G8Av3tVAx8g43HSGxLsm9BpNa7cNEUDZeKdjCj
         +gB0ZsePKOtS/fkyXcK6uwJIOZDQByijPqC8gSKh2p3jN3Ck2o6NxNFOk9F2GzFOy+oz
         9W8RVYFHtkHLrtUjolbG6pJvODABRy6xaj8gta56sq6Yj4tm5YP/SeAYiu4eg2F5/tzl
         G9xjxc9dZbDMIPn2upHJS8ZRsCy/qgqOGi0jX0ZPax78jm836Yu2csvJw7UTQy9fMkWv
         HPHtvULEYNkRRkBfE8MIv4wbvihEUr7RB9mEUKocfMObraRNA1KnvYuVsAr4SG5cRLJO
         7mYA==
X-Gm-Message-State: AFq9FYIsrnxbW9XsjcSChXmAwwAM6ik7BzlEBHGLbZ16wXp/CdwbEViW
	m6i4tjRApjSjcOcwlDXEDGRB/0slK8YOUUYkoxWyfw7Nqbq9IgU3kE4kdY7MtMJbXl4=
X-Gm-Gg: AYBFou1EmfAlCGaAbSUvu91MdnUu90VFmpjupyaCiYeHoFk35CCwJt32E5MaaQMFWpX
	ziUd03LZJmjKDYakqrwySzt58el0JZA7c53WFFweUXXHGgTXxYNYXFoQm5BsTQoT+5yBdDt3PQq
	pPxm4BLI42naly8d+755OTgomG83HFb+ImVSCyv3Kn5x3BQYplFi77igY9PoaCQ0Dus3TNcZghN
	BvEGzFvfQFxOxaQ3Q/fuIqjHZAZbie/4Z8wzCWMc+mb5AP5Aa9IAZseRgmXyHY4OeO/wD3hLYLg
	yAv5Sgq0J9/aJ6bVks10SfETxOShmtR/f5by5RlP8tGsyUFmIFFZuBuN87MQGPE1rVjtvp3lP0K
	1mbU9aKm3equtGHnHtPpZksGjW9FajpIhWYLTUeF35kWmd6WtWQy+u4fS1EAeFfD5nU0oA305tE
	WYnFNJwRuQttB11tSGKXenC0OHAoaTZI6DZoY9QMSNI2ivNeaA8igVlQPA+m/aiXMpGhyTz3mM0
	YqJ7FVyn9g4npORxnKPXGiglPmcappqz+wevP+dSSA9rFrBqGA9bnN1uFOad70aw82lNWqR6sVT
	UGw7dIAoPRfbgHcOBZvA1GuJLW8YYq6Z83rCTmq0npAQpua9kkMlQyorJWN16uTIduzKXC3O2DF
	Syc+Upr0cCUpHatervA5IQb3Yi9/k8TRAts7rF+x6JYINqgS/bVI9x+gnnB1B7zRHOml4YAZ6Bs
	OGmIJUYXfu7UO893Rs3OspDCHC+NP0FZS70UWKnZw8qeMqsGJRqe6SS4ZmZmdhFp1Aa2oiCx5UU
	L9kzRQu7WSF3DIVKXAffUn9nBcRl7cd0TZYewtGG8b8LoBL8ylF6mHmVE2jxi6HO6G2bh+HiT1i
	mM6f
X-Received: by 2002:a05:701b:42cb:20b0:187:c940:21b9 with SMTP id a92af1059eb24-1ac5d6a0756mr14379188c88.30.1793602357365;
        Sun, 01 Nov 2026 22:52:37 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1845817csm30634239c88.5.2026.11.01.22.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 22:52:36 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH] lcov: Fix parallel build race in sphinx docs
Date: Sun,  1 Nov 2026 22:52:34 -0800
Message-ID: <20261102065234.1804122-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 02 Nov 2026 06:52:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131739
Content-Type: text/plain; charset="utf-8"

"make install" depends on a doc target which runs "make -C docs man html".
With -j both goals start their own sphinx-build sharing _build/doctrees,
which sphinx does not write atomically, so one can read a doctree the
other is rewriting. do_install then fails at random:

  AttributeError: 'dict' object has no attribute 'append'
  make: *** [Makefile:138: doc] Error 2

Add .NOTPARALLEL to docs/Makefile so that the goals run one after the
other. Running "make -j64 man html" on an oversubscribed host failed 71
out of 576 times without this change and never with it.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
AI-Generated: Uses Claude Code
---
 ...t-run-sphinx-build-goals-in-parallel.patch | 36 +++++++++++++++++++
 meta-oe/recipes-support/lcov/lcov_2.6.bb      |  4 ++-
 2 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/lcov/lcov/0001-docs-Do-not-run-sphinx-build-goals-in-parallel.patch

diff --git a/meta-oe/recipes-support/lcov/lcov/0001-docs-Do-not-run-sphinx-build-goals-in-parallel.patch b/meta-oe/recipes-support/lcov/lcov/0001-docs-Do-not-run-sphinx-build-goals-in-parallel.patch
new file mode 100644
index 0000000000..abc1539773
--- /dev/null
+++ b/meta-oe/recipes-support/lcov/lcov/0001-docs-Do-not-run-sphinx-build-goals-in-parallel.patch
@@ -0,0 +1,36 @@
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Sun, 1 Nov 2026 20:00:00 -0700
+Subject: [PATCH] docs: Do not run sphinx-build goals in parallel
+
+The top-level "doc" target runs "make -C docs man html". With -j both
+goals match the catch-all rule at once and start two sphinx-build
+processes sharing _build/doctrees. One process can read a doctree the
+other is rewriting, so "make -j install" fails at random with unpickling
+errors such as:
+
+  AttributeError: 'dict' object has no attribute 'append'
+  EOFError: Ran out of input
+
+Mark the docs Makefile .NOTPARALLEL so the goals run one after the other.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ docs/Makefile | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/docs/Makefile b/docs/Makefile
+index f99b1df..c088ba8 100644
+--- a/docs/Makefile
++++ b/docs/Makefile
+@@ -14,6 +14,10 @@ BUILDDIR      = _build
+ help:
+ 	@LCOV_BUILD_DATE=$(BUILD_DATE) LCOV_RELEASE=$(RELEASE) TOOL_NAME=$(TOOL_NAME) $(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
+
++# Each goal runs its own sphinx-build and they all share the doctrees in
++# $(BUILDDIR), which sphinx does not write atomically.
++.NOTPARALLEL:
++
+ .PHONY: clean help Makefile
+
+ # Catch-all target: route all unknown targets to Sphinx using the new
diff --git a/meta-oe/recipes-support/lcov/lcov_2.6.bb b/meta-oe/recipes-support/lcov/lcov_2.6.bb
index 3fb48e4501..cd37a6cce5 100755
--- a/meta-oe/recipes-support/lcov/lcov_2.6.bb
+++ b/meta-oe/recipes-support/lcov/lcov_2.6.bb
@@ -57,7 +57,9 @@ RDEPENDS:${PN}:append:class-target = " \
     gcov \
     gcov-symlinks \
 "
-SRC_URI = "https://github.com/linux-test-project/lcov/releases/download/v${PV}/lcov-${PV}.tar.gz"
+SRC_URI = "https://github.com/linux-test-project/lcov/releases/download/v${PV}/lcov-${PV}.tar.gz \
+           file://0001-docs-Do-not-run-sphinx-build-goals-in-parallel.patch \
+           "
 SRC_URI[sha256sum] = "67a45db99b8ef0260c3fac9a2e3749fd8fa350a15e235dd3c29b356d97755c75"

 UPSTREAM_CHECK_URI = "https://github.com/linux-test-project/lcov/releases"
