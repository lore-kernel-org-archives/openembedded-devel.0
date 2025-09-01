Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4245CCA0FFD
	for <webhook@archiver.kernel.org>; Mon,  1 Sep 2025 06:28:58 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.44601.1756708129443319456
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 Aug 2025 23:28:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=PYId119h;
 spf=pass (domain: mvista.com, ip: 209.85.214.174, mailfrom: hprajapati@mvista.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2445824dc27so35550715ad.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 31 Aug 2025 23:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1756708129; x=1757312929; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IK496re6pIYzphw/mI5UUBCYUlFkOgGtJIS65ZXwp9I=;
        b=PYId119hddiIwhcES2iR4wiqkf+z18HZfCcqyZ/pBFPa9Ce3O4Vj9dwZPxKsGNQ3xr
         OpJy9LzE4r1bEsXSuWwnxUjZm557QgOUUS4SOw1tNRoBkg4V7m80KobWsCRNbaN+wuIK
         48EsHRh3K5JvWuPxiUJvJxq5x1itMgB5hg6uk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756708129; x=1757312929;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IK496re6pIYzphw/mI5UUBCYUlFkOgGtJIS65ZXwp9I=;
        b=lfGaw+/lVgkS0P7ynFBih00n8CLbPffp9iEovn9dHqhPIop/EdfGaEZFd7NVNsCSwy
         e7sNoeD7C5iiDjJ4R1XWiolrErODYcVRMg4CGtU83JD2fNmXqo5EZx/YK93YUId0q1gG
         j8LyyaNsK/49r3oU4anWl4Hlb+UDUWnQhhBwblbJpDkAqBWsKwBsf896mj8Cc/Nfeerv
         NhVWFdRbLKIGPis3hfHtGHG65RsEAHUN0oYlnFz+ZSWTYxat/xcaQMZK7eDiqi3lyksl
         6rv+fO+Uyl1L7d6hyo7Omc1UdlMUX5KwhouZpO5Uemhd1H5qJNMld2vOqMKUWErCMUh4
         lpcg==
X-Gm-Message-State: AOJu0YwZzmbxRFbhM2punMfqDFJXGkNxT/Fs6Qp4qDXvtvnauEc58bvM
	Cf86qh7T+MAeLqUEvQ0M2SWg8ufAY5KeLQlRYCSvLspDIfojlrVA0ZhcI/cOU+C3LELpT6OFt1p
	/gbq+
X-Gm-Gg: ASbGncttRQGCp+JTCLdQbH+GMtz3YcKnAPe/GsJKMCwJR1yDMhUzgZFO1YzKLnQZdBp
	PUlxYR3ovf+PEpSFf4jVVmc9wURPeCojp2A7hNADBcRrOwDQmHfGBPQ0pw1qVkslsVVKgo0HeAK
	b94cImaOmIu0zb3U7FsZxgJnHMuocwCDXZukESwsnjRvJXTEpdZCdjAj9v3v2EgeH7Ir+9RJ2Un
	63kHq57+R6nAunNXz9tVZBsIYIWU/tYxm6KhxPtCcI12hbzoxK99oLJCeklDjfI6xm5AMMFqZvD
	4/cKcNlQxxZ4DfLtlSf7eFjFgIl/jQrsqeeWgrzbVW8ZMRHYCrMUD0/j21/IBIpFiKhfFJp7E8r
	oaSI2i24J2YzvW2DQc4X/I+Igbuqk5ljMfExS
X-Google-Smtp-Source: AGHT+IHX3XOdTJ3x57RTl5Alw/WhuvQuz+zNmEwDf6UWYVAmNPc7LbkjcP312Q8h6Pn0UXYB0x6gzA==
X-Received: by 2002:a17:903:2f0c:b0:244:214f:13b7 with SMTP id d9443c01a7336-24944afb44amr82053965ad.53.1756708128607;
        Sun, 31 Aug 2025 23:28:48 -0700 (PDT)
Received: from MVIN00016.mvista.com ([150.129.170.183])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2490359f808sm94772035ad.0.2025.08.31.23.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 23:28:48 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-oe][kirkstone][PATCH] libssh: fix CVE-2025-4877
Date: Mon,  1 Sep 2025 11:58:42 +0530
Message-ID: <20250901062842.215472-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Sep 2025 06:28:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119153

Upstream-Status: Backport from https://git.libssh.org/projects/libssh.git/commit/?id=6fd9cc8ce3958092a1aae11f1f2e911b2747732d

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../libssh/libssh/CVE-2025-4877.patch         | 57 +++++++++++++++++++
 .../recipes-support/libssh/libssh_0.8.9.bb    |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2025-4877.patch

diff --git a/meta-oe/recipes-support/libssh/libssh/CVE-2025-4877.patch b/meta-oe/recipes-support/libssh/libssh/CVE-2025-4877.patch
new file mode 100644
index 0000000000..6866fd2328
--- /dev/null
+++ b/meta-oe/recipes-support/libssh/libssh/CVE-2025-4877.patch
@@ -0,0 +1,57 @@
+From 6fd9cc8ce3958092a1aae11f1f2e911b2747732d Mon Sep 17 00:00:00 2001
+From: Jakub Jelen <jjelen@redhat.com>
+Date: Tue, 15 Apr 2025 11:41:24 +0200
+Subject: CVE-2025-4877 base64: Prevent integer overflow and potential OOB
+
+Set maximum input to 256MB to have safe margin to the 1GB trigger point
+for 32b arch.
+
+The OOB should not be reachable by any internal code paths as most of
+the buffers and strings we use as input for this operation already have
+similar limit and none really allows this much of data.
+
+Signed-off-by: Jakub Jelen <jjelen@redhat.com>
+Reviewed-by: Andreas Schneider <asn@cryptomilk.org>
+(cherry picked from commit 00f09acbec55962839fc7837ef14c56fb8fbaf72)
+
+CVE: CVE-2025-4877
+Upstream-Status: Backport [https://git.libssh.org/projects/libssh.git/commit/?id=6fd9cc8ce3958092a1aae11f1f2e911b2747732d]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/base64.c | 13 ++++++++++++-
+ 1 file changed, 12 insertions(+), 1 deletion(-)
+
+diff --git a/src/base64.c b/src/base64.c
+index 372dc65f..7bb8efb1 100644
+--- a/src/base64.c
++++ b/src/base64.c
+@@ -29,6 +29,9 @@
+ #include "libssh/priv.h"
+ #include "libssh/buffer.h"
+ 
++/* Do not allow encoding more than 256MB of data */
++#define BASE64_MAX_INPUT_LEN 256 * 1024 * 1024
++
+ static char alphabet[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
+                          "abcdefghijklmnopqrstuvwxyz"
+                          "0123456789+/";
+@@ -269,7 +272,15 @@ static void _bin_to_base64(unsigned char *dest, const unsigned char source[3],
+ unsigned char *bin_to_base64(const unsigned char *source, int len) {
+   unsigned char *base64;
+   unsigned char *ptr;
+-  int flen = len + (3 - (len % 3)); /* round to upper 3 multiple */
++  int flen = 0;
++
++ /* Set the artificial upper limit for the input. Otherwise on 32b arch, the
++  * following line could overflow for sizes larger than SIZE_MAX / 4 */
++  if (len > BASE64_MAX_INPUT_LEN) {
++      return NULL;
++  }
++
++  flen = len + (3 - (len % 3)); /* round to upper 3 multiple */
+   flen = (4 * flen) / 3 + 1;
+ 
+   base64 = malloc(flen);
+-- 
+2.50.1
+
diff --git a/meta-oe/recipes-support/libssh/libssh_0.8.9.bb b/meta-oe/recipes-support/libssh/libssh_0.8.9.bb
index 67e03c4081..fee711e191 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.8.9.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.8.9.bb
@@ -21,6 +21,7 @@ SRC_URI = "git://git.libssh.org/projects/libssh.git;protocol=https;branch=stable
            file://0001-tests-CMakeLists.txt-do-not-search-ssh-sshd-commands.patch \
            file://run-ptest \
            file://CVE-2025-5318.patch \
+           file://CVE-2025-4877.patch \
           "
 SRCREV = "04685a74df9ce1db1bc116a83a0da78b4f4fa1f8"
 
-- 
2.50.1


