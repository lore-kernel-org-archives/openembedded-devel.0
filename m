Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B015C48BF8
	for <webhook@archiver.kernel.org>; Thu, 22 Feb 2024 20:58:40 +0000 (UTC)
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
 by mx.groups.io with SMTP id smtpd.web10.24572.1708635513221809421
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Feb 2024 12:58:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Cg2SQKHK;
 spf=pass (domain: gmail.com, ip: 209.85.161.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-59fdcf8ebbcso132670eaf.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Feb 2024 12:58:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708635512; x=1709240312; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ukkXGd89MVFjiDQWPh6zEE9IRwT+Yv9QhY+EwmjizLc=;
        b=Cg2SQKHKqrRa66AX/FB8d4u9yTV+IQANfnenlLcuy0ybv6JfmYlr9frFi9qC5ylsEc
         1pgqQolAw71fDbgC05HddfITY/QN6W3VXuNUGn6CZbVvp+6AcF0F8dzND/mnM5o8hkuc
         Ooz9VZOmic8V2RjofPbac+omhaaL6FiDHJiY5HvIxgIfM73jrHzakcZKWj4AOn3EU5GY
         VKBB2CeVC8M4aBUAHjvanUXPFtZjawhEGXNCPwTdOpW4ng+vGQmggpe1YzBbdaAEbOoi
         74ZZ7xG9JPN8e7cZ1uxP8Vxh4+Gb/3SCDliGetNOzTps8QH2W5JfPaHJ3fJOrPxXDrBR
         1HbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708635512; x=1709240312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ukkXGd89MVFjiDQWPh6zEE9IRwT+Yv9QhY+EwmjizLc=;
        b=SvogwBt7SrgXJZ2IxNGQSDzyahG+78Jj1CELYwqKjtQzZ/53eHEIMc6k/zF6WJe6PS
         ayZ4/gcuE50D7gimXRbpFPJMOxUwOlgaJDy+dJ/uSCY9nifRpaiACX9a/LPp1E4JOENi
         g67fCOS68CGcX7h+eWfHYYdWlpjOxS8m7YdnaKQN7KQAtr6weJRA8PaRx8NSUcm9kwcs
         xAMSfmxJdlufwO7iYck7v5IULrd+Gt4M3l1SmBW5EIPHj+fHJ0+EduZkSkcEi2+dibUC
         KU4nwElPz38KG1dGy1U86joIemsgsM0rW3/L7lFe7S6CDvtPIXmFwmVUFyFd37VFxeW+
         ZS9Q==
X-Gm-Message-State: AOJu0YyFa63sfmrsGevrkSzr9cACAV12nWh0e2by5FPXdHMue6HPe3EP
	b4rHyadzre1zVHK8p8N6ngWcq+Mw9rkMCyfQHfeVPZCuFP1h77+eLVw2bqQZbP4=
X-Google-Smtp-Source: AGHT+IEj9UxTvhk+Wol9BCr2iAKBUXC9ZNL2aMeOoJi/fjS51aX3mvRE9hrV+8xOSruJ68jKHVMBlg==
X-Received: by 2002:a05:6358:2787:b0:17b:602f:24c6 with SMTP id l7-20020a056358278700b0017b602f24c6mr6545901rwb.24.1708635511919;
        Thu, 22 Feb 2024 12:58:31 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::7619])
        by smtp.gmail.com with ESMTPSA id y5-20020a62ce05000000b006e2dde36edesm11444010pfg.120.2024.02.22.12.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 12:58:30 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-filesystems][PATCH 3/4] sshfs-fuse: Fix ptest builds with python 3.12
Date: Thu, 22 Feb 2024 12:58:26 -0800
Message-ID: <20240222205827.2813212-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240222205827.2813212-1-raj.khem@gmail.com>
References: <20240222205827.2813212-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 Feb 2024 20:58:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108996

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...1f8aa0899268ec02b2f54849352df92a3a1d.patch | 34 +++++++++++++++++++
 ...8ae1be99571a88b8439b027abe6349b74658.patch | 31 +++++++++++++++++
 .../sshfs-fuse/sshfs-fuse_3.7.3.bb            |  6 +++-
 3 files changed, 70 insertions(+), 1 deletion(-)
 create mode 100644 meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse/03ee1f8aa0899268ec02b2f54849352df92a3a1d.patch
 create mode 100644 meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse/a1d58ae1be99571a88b8439b027abe6349b74658.patch

diff --git a/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse/03ee1f8aa0899268ec02b2f54849352df92a3a1d.patch b/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse/03ee1f8aa0899268ec02b2f54849352df92a3a1d.patch
new file mode 100644
index 0000000000..63cdc57b44
--- /dev/null
+++ b/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse/03ee1f8aa0899268ec02b2f54849352df92a3a1d.patch
@@ -0,0 +1,34 @@
+From 03ee1f8aa0899268ec02b2f54849352df92a3a1d Mon Sep 17 00:00:00 2001
+From: Gabriel Staples <ercaguy@gmail.com>
+Date: Tue, 22 Dec 2020 23:33:55 -0800
+Subject: [PATCH] pytest.ini: fix test warning
+
+Warning:
+
+```
+test/util.py:99
+  sshfs/build/test/util.py:99: PytestUnknownMarkWarning: Unknown pytest.mark.uses_fuse - is this a typo?
+  You can register custom marks to avoid this warning - for details, see https://docs.pytest.org/en/stable/mark.html
+    return pytest.mark.uses_fuse()
+```
+
+References for the fix:
+
+1. https://stackoverflow.com/questions/60806473/pytestunknownmarkwarning-unknown-pytest-mark-xxx-is-this-a-typo/60813297#60813297
+1. https://docs.pytest.org/en/stable/mark.html
+
+Upstream-Status: Submitted [https://github.com/libfuse/sshfs/pull/238]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ test/pytest.ini | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/test/pytest.ini b/test/pytest.ini
+index 95161546..7a7efed4 100644
+--- a/test/pytest.ini
++++ b/test/pytest.ini
+@@ -1,2 +1,4 @@
+ [pytest]
+ addopts = --verbose --assert=rewrite --tb=native -x -r a
++markers =
++    uses_fuse
diff --git a/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse/a1d58ae1be99571a88b8439b027abe6349b74658.patch b/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse/a1d58ae1be99571a88b8439b027abe6349b74658.patch
new file mode 100644
index 0000000000..e76dbd5059
--- /dev/null
+++ b/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse/a1d58ae1be99571a88b8439b027abe6349b74658.patch
@@ -0,0 +1,31 @@
+From a1d58ae1be99571a88b8439b027abe6349b74658 Mon Sep 17 00:00:00 2001
+From: Gabriel Staples <ercaguy@gmail.com>
+Date: Tue, 22 Dec 2020 23:26:40 -0800
+Subject: [PATCH] Fix deprecated warning in conftest.py
+
+```
+test/conftest.py:66
+  sshfs/build/test/conftest.py:66: PytestDeprecationWarning: @pytest.yield_fixture is deprecated.
+  Use @pytest.fixture instead; they are the same.
+    @pytest.yield_fixture(autouse=True)
+```
+
+Upstream-Status: Submitted [https://github.com/libfuse/sshfs/pull/238]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ test/conftest.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/test/conftest.py b/test/conftest.py
+index 70cd0c62..d58d45b2 100644
+--- a/test/conftest.py
++++ b/test/conftest.py
+@@ -63,7 +63,7 @@ def register_output(self, pattern, count=1, flags=re.MULTILINE):
+ # relies on tests running sequential (i.e., don't dare to use e.g. the xdist
+ # plugin)
+ current_capfd = None
+-@pytest.yield_fixture(autouse=True)
++@pytest.fixture(autouse=True)
+ def save_cap_fixtures(request, capfd):
+     global current_capfd
+     capfd.false_positives = []
diff --git a/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_3.7.3.bb b/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_3.7.3.bb
index c85483759e..5a926dac0c 100644
--- a/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_3.7.3.bb
+++ b/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_3.7.3.bb
@@ -5,7 +5,10 @@ LICENSE = "GPL-2.0-only"
 DEPENDS = "glib-2.0 fuse3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "git://github.com/libfuse/sshfs;branch=master;protocol=https"
+SRC_URI = "git://github.com/libfuse/sshfs;branch=master;protocol=https \
+           file://03ee1f8aa0899268ec02b2f54849352df92a3a1d.patch \
+           file://a1d58ae1be99571a88b8439b027abe6349b74658.patch \
+"
 SRCREV = "c91eb9a9a992f1a36c49a8e6f1146e45b5e1c8e7"
 S = "${WORKDIR}/git"
 
@@ -18,6 +21,7 @@ SRC_URI += " \
 RDEPENDS:${PN}-ptest += " \
         python3-pytest \
         bash \
+        fuse \
 "
 
 do_install_ptest() {
-- 
2.43.2


