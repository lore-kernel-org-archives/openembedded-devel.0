Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB8FFCA0EDC
	for <webhook@archiver.kernel.org>; Thu, 14 Aug 2025 20:46:04 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.web10.32746.1755204357275387005
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Aug 2025 13:45:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=IyDoAUpx;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-202508142045551cacefcb9417ea75b8-edsjbd@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 202508142045551cacefcb9417ea75b8
        for <openembedded-devel@lists.openembedded.org>;
        Thu, 14 Aug 2025 22:45:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=k3TA4cqCBapHTJ87J7S9rEsoXBRaILUa2ZLBOiID4ZA=;
 b=IyDoAUpxG/qaPe/iIVVYAr3eg9RPIvkC2ryouJhqw3usZ9Y+b6djuh5KsDZp6O2Ekk90Wu
 HQ0F7m7OkduF61TJrSxYhCMVrWr6plavs3znGhQqVH3F7QQA9aPdDxQvaCXb55q3TOJmN0X1
 A5+ZmXQfjavwhA7jXKdm5oEgyScyl+3bGyCDzpiaLPVsDZmBHB9IQaqg9gx16ORxoRMMz/gX
 3NDTW0UyjQgvj9GxZPIiwxl+wp0QZX0RIWvtDVyzfQdNdWSYQ42TG81wDVFGazyIoXS8n++5
 tJAs+ZGYvBKxLmmNMRRd2E6xeKA+jB9M4M2cf/YatB9+ydOHoPC+LRRQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-webserver][walnascar][PATCH] fcgi: patch CVE-2025-23016
Date: Thu, 14 Aug 2025 22:45:08 +0200
Message-Id: <20250814204508.2906287-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Aug 2025 20:46:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118947

From: Peter Marko <peter.marko@siemens.com>

Pick commit referencing this CVE.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../fcgi/fcgi/CVE-2025-23016.patch            | 40 +++++++++++++++++++
 .../recipes-support/fcgi/fcgi_git.bb          |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta-webserver/recipes-support/fcgi/fcgi/CVE-2025-23016.patch

diff --git a/meta-webserver/recipes-support/fcgi/fcgi/CVE-2025-23016.patch b/meta-webserver/recipes-support/fcgi/fcgi/CVE-2025-23016.patch
new file mode 100644
index 0000000000..b763d7651c
--- /dev/null
+++ b/meta-webserver/recipes-support/fcgi/fcgi/CVE-2025-23016.patch
@@ -0,0 +1,40 @@
+From b0eabcaf4d4f371514891a52115c746815c2ff15 Mon Sep 17 00:00:00 2001
+From: Pycatchown <39068868+Pycatchown@users.noreply.github.com>
+Date: Tue, 8 Apr 2025 17:39:30 +0200
+Subject: [PATCH] Update fcgiapp.c
+
+Fixing an integer overflow (CVE-2025-23016)
+
+CVE: CVE-2025-23016
+Upstream-Status: Backport [https://github.com/FastCGI-Archives/fcgi2/commit/b0eabcaf4d4f371514891a52115c746815c2ff15]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ libfcgi/fcgiapp.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/libfcgi/fcgiapp.c b/libfcgi/fcgiapp.c
+index 4ffe318..99c3630 100644
+--- a/libfcgi/fcgiapp.c
++++ b/libfcgi/fcgiapp.c
+@@ -1173,6 +1173,10 @@ static int ReadParams(Params *paramsPtr, FCGX_Stream *stream)
+ 	    }
+             nameLen = ((nameLen & 0x7f) << 24) + (lenBuff[0] << 16)
+                     + (lenBuff[1] << 8) + lenBuff[2];
++	    if (nameLen >= INT_MAX) {
++                SetError(stream, FCGX_PARAMS_ERROR);
++                return -1;
++	    }
+         }
+         if((valueLen = FCGX_GetChar(stream)) == EOF) {
+             SetError(stream, FCGX_PARAMS_ERROR);
+@@ -1185,6 +1189,10 @@ static int ReadParams(Params *paramsPtr, FCGX_Stream *stream)
+ 	    }
+             valueLen = ((valueLen & 0x7f) << 24) + (lenBuff[0] << 16)
+                     + (lenBuff[1] << 8) + lenBuff[2];
++	    if (valueLen >= INT_MAX) {
++                SetError(stream, FCGX_PARAMS_ERROR);
++                return -1;
++	    }
+         }
+         /*
+          * nameLen and valueLen are now valid; read the name and value
diff --git a/meta-webserver/recipes-support/fcgi/fcgi_git.bb b/meta-webserver/recipes-support/fcgi/fcgi_git.bb
index 61ef6073e0..d327d435d5 100644
--- a/meta-webserver/recipes-support/fcgi/fcgi_git.bb
+++ b/meta-webserver/recipes-support/fcgi/fcgi_git.bb
@@ -7,6 +7,7 @@ SRCREV = "382aa2b0d53a87c27f2f647dfaf670375ba0b85f"
 PV = "2.4.2"
 
 SRC_URI = "git://github.com/FastCGI-Archives/fcgi2.git;protocol=https;branch=master \
+           file://CVE-2025-23016.patch \
           "
 
 S = "${WORKDIR}/git"

