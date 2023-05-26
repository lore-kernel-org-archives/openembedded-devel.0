Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E332C7EE32
	for <webhook@archiver.kernel.org>; Fri, 26 May 2023 06:19:32 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.2448.1685081969167672231
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 May 2023 23:19:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=lpsDhPPq;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-64d1a0d640cso462819b3a.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 23:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685081968; x=1687673968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OnoKfzlvk6/Z7V9JfC6m5/SJRY1mfTrjc+BwQVLAtMg=;
        b=lpsDhPPqCvTc5vLxfy8FzIVl/DUW1rTvVn2+Y46ePOvb9p18KI7t4L8wCE07JUNoz9
         ECXho34yCZb9BLOvz9OOK46dSH1C15K8tMb7aYc9FkEXy/1OmGwV+uf4X/4DETYxDuzL
         yxjS3J/ciuZVUxk8+DvkTUX+IThdLoyYzi8mlYpEnpaOkQ8u8V0M3krxe51HcZfvCUdY
         fv777G5ioudYYpmBhsUJoe8vnZaxsMrADiDB0ts9aMaFGkabBzO5gxcMp5hZGaVLzCop
         eEuaQKwPqjhwvuBiMj5MvGU0TJ/YIKlEQdbpi+PMig7R2xVg12OI6HHYfvJ6g5/NWptP
         z7XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685081968; x=1687673968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OnoKfzlvk6/Z7V9JfC6m5/SJRY1mfTrjc+BwQVLAtMg=;
        b=Nnm4Jejozd1cE98deZpJj8W3dM66k7GRuWSuXJ1uO1EarlQLzLCoi496ZBpJKJKkpI
         q0PdbkZaIwrNczGo23L/QHynWYvdrs+bjDl0zdi6r/KTkZCDZ5hHx9+ZKYB/WyDlPWx3
         pBtFDwl9FiPMnPGc26jQq6nTlyX8YUUa3HLBTLG+pE7tdu6tl6OyflPEp+ACarY4u+c0
         kXew8gqH42vcGXqP7JwcBsceJ0cODRBS3Z99O0VmnkQ59MrmFri6g+UZh1/ixxmg/Kv/
         6hV0pzxiOqi3xXw9DIpBCzY3uBm/p7aljDmaJ9KSjJ8s+tg1nAfqONILsiCbDZGgUWCV
         3+ew==
X-Gm-Message-State: AC+VfDypT6r0oOzgmtoXNq1bMbyq7nfGolt0dCj9PsW2IGU9Qj+caLt8
	UukfglZZHcKqr+hzKfO6/rSmLDWgd4c=
X-Google-Smtp-Source: ACHHUZ63Q3iR3jdVprNlsj/6sZpaGvTqrw0H7xTzIOlljNOqaxe4OyeP9v3ZEKlJKl4xvMXyY/oVlg==
X-Received: by 2002:a05:6a20:7486:b0:10c:4ff5:38b7 with SMTP id p6-20020a056a20748600b0010c4ff538b7mr1228011pzd.6.1685081968072;
        Thu, 25 May 2023 23:19:28 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::c4c0])
        by smtp.gmail.com with ESMTPSA id k6-20020a63ba06000000b0050f85ef50d1sm1885427pgf.26.2023.05.25.23.19.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 23:19:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 2/7] tracker: Point TOP_SRCDIR to target path
Date: Thu, 25 May 2023 23:19:20 -0700
Message-Id: <20230526061925.420351-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230526061925.420351-1-raj.khem@gmail.com>
References: <20230526061925.420351-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 May 2023 06:19:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102864

source_root uses absolute path to build time srcdir
which results in buildpath errors

Fixes
File /usr/bin/tracker3 in package tracker contains reference to TMPDIR [buildpaths]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-meson-Do-not-define-TOP_SRCDIR.patch | 24 +++++++++++++++++++
 .../recipes-gnome/tracker/tracker_3.5.1.bb    |  1 +
 2 files changed, 25 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/tracker/tracker/0001-meson-Do-not-define-TOP_SRCDIR.patch

diff --git a/meta-gnome/recipes-gnome/tracker/tracker/0001-meson-Do-not-define-TOP_SRCDIR.patch b/meta-gnome/recipes-gnome/tracker/tracker/0001-meson-Do-not-define-TOP_SRCDIR.patch
new file mode 100644
index 0000000000..5c6ab71a9f
--- /dev/null
+++ b/meta-gnome/recipes-gnome/tracker/tracker/0001-meson-Do-not-define-TOP_SRCDIR.patch
@@ -0,0 +1,24 @@
+From 3e262192ffebf5d6fec92d5b7ba08348a94df1ae Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 25 May 2023 20:54:47 -0700
+Subject: [PATCH] meson: Do not define TOP_SRCDIR
+
+This is passed from build env
+
+Upstream-Status: Inappropriate [Cross compile specific]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ meson.build | 1 -
+ 1 file changed, 1 deletion(-)
+
+--- a/meson.build
++++ b/meson.build
+@@ -353,7 +353,7 @@ subdir('utils')
+ 
+ test_c_args = tracker_c_args + [
+     '-DTOP_BUILDDIR="@0@"'.format(build_root),
+-    '-DTOP_SRCDIR="@0@"'.format(source_root),
++    '-DTOP_SRCDIR="@0@"'.format('/usr/src/debug/tracker'),
+ ]
+ 
+ tracker_uninstalled_cli_dir = join_paths(meson.current_build_dir(), 'src', 'tracker')
diff --git a/meta-gnome/recipes-gnome/tracker/tracker_3.5.1.bb b/meta-gnome/recipes-gnome/tracker/tracker_3.5.1.bb
index 8489043924..6dd8af2390 100644
--- a/meta-gnome/recipes-gnome/tracker/tracker_3.5.1.bb
+++ b/meta-gnome/recipes-gnome/tracker/tracker_3.5.1.bb
@@ -22,6 +22,7 @@ GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase gsettings gobject-introspection vala gtk-doc manpages bash-completion features_check python3native
 
+SRC_URI += "file://0001-meson-Do-not-define-TOP_SRCDIR.patch"
 SRC_URI[archive.sha256sum] = "f972d50ac7bafdccf113b1eb99dcae35404685a99e55bfef16f3ac83b4de974d"
 
 # gobject-introspection is mandatory and cannot be configured
-- 
2.40.1


