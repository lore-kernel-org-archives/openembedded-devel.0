Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3019EC02185
	for <webhook@archiver.kernel.org>; Fri, 17 Jan 2025 18:27:52 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web10.1955.1737138461053619774
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Jan 2025 10:27:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=e4pTrNc6;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-202501171827373450f073d455e83ebb-wpdmqs@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202501171827373450f073d455e83ebb
        for <openembedded-devel@lists.openembedded.org>;
        Fri, 17 Jan 2025 19:27:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=n6DCgHNQM+k9QM7JlPGe2RNWsh471Um1izbrTaEBYcI=;
 b=e4pTrNc6CYd0defkhiEOHB1ttF8a3m3n9KV48OkPO+TnS/eYar4xsFFfCkzEWhWta5Ktd+
 2vJUMQzsPhi1OwdIoZPk6FihlNidhF17rXqb3FDnpNpFBv55LMPv9QOHKiJ2QA/YTfTlyOx5
 MZT6KN51snn8Cq72B8wINQkwbME3p9OSJ6Jik4mgswScS7ji74vZh54qmMr8hkNIeKfTZGxA
 OVVWbDjSZTdqqN+BG5ppb/y2llF+XT55QlhVC/nL3/xiAuVOp/ExOJ0hTb76gHKUBH2To35L
 AVJem6b8mVKm6kSF6kGYq4zO/4u1MT273UEZoLIb5zKzUClwfc0olbeA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-multimedia][PATCH] vorbis-tools: patch CVE-2023-43361
Date: Fri, 17 Jan 2025 19:26:43 +0100
Message-Id: <20250117182643.1218418-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Jan 2025 18:27:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114921

From: Peter Marko <peter.marko@siemens.com>

This is inactive project, so no official CVE fix will be available
anymore. That however does not mean that there is no fix available.
Following tries to prove that patch provided here is valid.

NVD CVE report [1] links issue [2] where this is reported.
Based on the report, fix was proposed in [3].
There was some review however the patch autor was not active.
[4] was later created trying to adddress the comments, but the project
was not active anymore. In this PR the patch was shrunk to a one-liner
in discussion.

I have tested the poc and it is real.
The patch fixes it, while not breaking the execution if good file path
is provided as argument.

[1] https://nvd.nist.gov/vuln/detail/CVE-2023-43361
[2] https://github.com/xiph/vorbis-tools/issues/41
[3] https://gitlab.xiph.org/xiph/vorbis-tools/-/merge_requests/7
[4] https://gitlab.xiph.org/xiph/vorbis-tools/-/merge_requests/8

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../vorbis-tools/CVE-2023-43361.patch         | 38 +++++++++++++++++++
 .../vorbis-tools/vorbis-tools_1.4.2.bb        |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools/CVE-2023-43361.patch

diff --git a/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools/CVE-2023-43361.patch b/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools/CVE-2023-43361.patch
new file mode 100644
index 0000000000..7f5b634115
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools/CVE-2023-43361.patch
@@ -0,0 +1,38 @@
+From 6ca16244ba70cd1c0c8d062d1416bdc79bf20898 Mon Sep 17 00:00:00 2001
+From: Peter Marko <peter.marko@siemens.com>
+Date: Fri, 17 Jan 2025 18:49:12 +0100
+Subject: [PATCH] oggenc: Don't assume the output path ends in a file name.
+
+oggenc attempts to create any specified directories in the output
+file path if they don't exist. The parser was assuming there was
+a final filename after the last directory separator, and so would
+try to read off the end of the argument if it was a bare directory
+such as `./` or `outdir/`. This adds a check to make sure the
+scan isn't starting off the end of the path string.
+
+Thanks to Frank-Z7 (Zeng Yunxiang) at Huazhong University of Science
+and Technology (cse.hust.edu.cn) for the report.
+
+CVE: CVE-2023-43361
+Upstream-Status: Submitted [https://gitlab.xiph.org/xiph/vorbis-tools/-/merge_requests/7]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ oggenc/platform.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/oggenc/platform.c b/oggenc/platform.c
+index 6d9f4ef..1ff02ca 100644
+--- a/oggenc/platform.c
++++ b/oggenc/platform.c
+@@ -147,7 +147,7 @@ int create_directories(char *fn, int isutf8)
+         start = start+2;
+ #endif
+ 
+-    while((end = strpbrk(start+1, PATH_SEPS)) != NULL)
++    while((end = strpbrk(start + strspn(start, PATH_SEPS), PATH_SEPS)) != NULL)
+     {
+         int rv;
+         memcpy(segment, fn, end-fn);
+-- 
+2.30.2
+
diff --git a/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools_1.4.2.bb b/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools_1.4.2.bb
index 61a4aedb85..2cbd840138 100644
--- a/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools_1.4.2.bb
+++ b/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools_1.4.2.bb
@@ -13,6 +13,7 @@ DEPENDS = "libogg libvorbis"
 SRC_URI = "http://downloads.xiph.org/releases/vorbis/${BP}.tar.gz \
            file://gettext.patch \
            file://0001-ogginfo-Include-utf8.h-for-missing-utf8_decode.patch \
+           file://CVE-2023-43361.patch \
           "
 
 SRC_URI[md5sum] = "998fca293bd4e4bdc2b96fb70f952f4e"
-- 
2.30.2


