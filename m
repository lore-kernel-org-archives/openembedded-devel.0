Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 822EE7E101
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2019 03:56:41 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id j26so7843010pgl.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 May 2019 20:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=TDxckeIsOoYFejgkVb4oFyz3unwidy9PKvThCqUQFbU=;
	b=fBdsijtizaEYPvCcyZNjb37oTgwBZE1iJ2hKlif/X/mfvmgAUVr8XhxADWnRQJHZOl
	zr5eMuaq3kXxFr6rZ0ONMncmazU7cR+4x9z4iSGJTDKusEVxb1ULep8l6MoJX6x7mpfa
	HjNWBIW3MhIaDzAtzHB168y0U9PFbejaXYOzD5nuYBcCfyOzyuBblRGfsFQ6BwDC9fUm
	xh6JRK16WdHWO/YU3sGH2V8sRIIUSNRp7sgI9PUi/kO6LmJcnao7TZZhk/wiHs6vaVtF
	kKqgdwTMPRFWbDFvm41DUMmFnWJQDThRLysZFo78lTNf/fBOS9jW/DzjzX4CjEi+GCkw
	TH5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=TDxckeIsOoYFejgkVb4oFyz3unwidy9PKvThCqUQFbU=;
	b=eFboD6BD6B3X2y6aufNEbvG5wVYPnyEufJ/wvhWiCdO5GYofBn2m+CYHK3eSPl5GoZ
	hOxXjQlHHmAFXbZeP3cjxhwQXAfowWMkMugnY/V1YFlGPr9Zf2h55KKHaN9m8IPs2xqQ
	Lwp0CPsHb1SJxm/FijpA/MStYpS5/wLhFkAiNqN7pZ8ZCwo9xKgdVm6ZNBpWYIFbGdRC
	MXOzEc7RepzLGgw1g6EDFXwzfOnwrQxokAs5mC4S+tsgueBnr7iiERB5b9D9ay5arIV3
	beGUwq8e0YGyUkDjg16z/E6lhaBQdf3ZFlCa5cvtYQOzvhy2H7loQwlGMO5EkMJL3t5H
	jfeA==
X-Gm-Message-State: APjAAAUz1FG3VOw6qJtXLF4vyGGTWS+J7zsjqyItsHLCDKPLxhwwmppE
	gVYsog7sdtbS2fpgi6566864yTn6
X-Google-Smtp-Source: APXvYqy8rgZ37jgYux2Yno+j/Q8mfiYY+wA/l4nMVek3lIGlZu0SVj483Yq500t4BqsV8OGRkq+Wag==
X-Received: by 2002:a63:d4c:: with SMTP id 12mr66484432pgn.30.1558411002526;
	Mon, 20 May 2019 20:56:42 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:199d:e2fe:5a4f:97f4])
	by smtp.gmail.com with ESMTPSA id
	h13sm23045273pfo.98.2019.05.20.20.56.41
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 20 May 2019 20:56:41 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 May 2019 20:56:05 -0700
Message-Id: <3ee48cdd625a0b632511106272374fabff63e0fa.1558410874.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1558410874.git.akuster808@gmail.com>
References: <cover.1558410874.git.akuster808@gmail.com>
Subject: [warrior][patch 05/34] openhpi: update openhpi-fix-testfail-errors.patch
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
X-List-Received-Date: Tue, 21 May 2019 03:56:41 -0000

From: Yi Zhao <yi.zhao@windriver.com>

The openhpi-fix-testfail-errors.patch tries to fix 2 saftest failures.
But the second fix is not correct. It should not return false when there
is no surrogate pairs since for the code points in UTF-16 Basic
Multilingual Plane (BMP), there is no need surrogate pairs. We should
update saftest case to fix this failure.

Also add more description for the first fix.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...penhpi-fix-function-saHpiSensorThresholds.patch | 35 ++++++++++++++++++++++
 .../files/openhpi-fix-testfail-errors.patch        | 33 --------------------
 .../recipes-daemons/openhpi/openhpi_3.8.0.bb       |  2 +-
 3 files changed, 36 insertions(+), 34 deletions(-)
 create mode 100644 meta-networking/recipes-daemons/openhpi/files/openhpi-fix-function-saHpiSensorThresholds.patch
 delete mode 100644 meta-networking/recipes-daemons/openhpi/files/openhpi-fix-testfail-errors.patch

diff --git a/meta-networking/recipes-daemons/openhpi/files/openhpi-fix-function-saHpiSensorThresholds.patch b/meta-networking/recipes-daemons/openhpi/files/openhpi-fix-function-saHpiSensorThresholds.patch
new file mode 100644
index 0000000..b2771c0
--- /dev/null
+++ b/meta-networking/recipes-daemons/openhpi/files/openhpi-fix-function-saHpiSensorThresholds.patch
@@ -0,0 +1,35 @@
+From e0b2be7a1fce0fed63bac8c350b711b69edfe30e Mon Sep 17 00:00:00 2001
+From: "yanjun.zhu" <yanjun.zhu@windriver.com>
+Date: Tue, 30 Apr 2019 10:04:58 +0800
+Subject: [PATCH] openhpid/safhpi.c: fix function saHpiSensorThresholdsSet
+
+In COPY_TH the SensorThresholds->TH will be copied to tmp.TH only if
+TH.IsSupported == SAHPI_TRUE. So we should pass &tmp but not
+SensorThresholds as the argument to OH_CALL_ABI. Otherwise the TH will
+be set even if TH.IsSupported == SAHPI_FALSE.
+
+Upstream-Status: Submitted
+[https://github.com/open-hpi/openhpi/pull/2744/commits/77a78bb1ada56e55c5ba6d7a5987c214705bf035]
+
+Signed-off-by: yanjun.zhu <yanjun.zhu@windriver.com>
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ openhpid/safhpi.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/openhpid/safhpi.c b/openhpid/safhpi.c
+index 28a2632..61b7f03 100644
+--- a/openhpid/safhpi.c
++++ b/openhpid/safhpi.c
+@@ -1933,7 +1933,7 @@ SaErrorT SAHPI_API saHpiSensorThresholdsSet (
+         oh_release_domain(d); /* Unlock domain */
+ 
+         OH_CALL_ABI(h, set_sensor_thresholds, SA_ERR_HPI_INVALID_CMD, rv,
+-                    ResourceId, SensorNum, SensorThresholds);
++                    ResourceId, SensorNum, &tmp);
+         oh_release_handler(h);
+ 
+         return rv;
+-- 
+2.7.4
+
diff --git a/meta-networking/recipes-daemons/openhpi/files/openhpi-fix-testfail-errors.patch b/meta-networking/recipes-daemons/openhpi/files/openhpi-fix-testfail-errors.patch
deleted file mode 100644
index 60e2e79..0000000
--- a/meta-networking/recipes-daemons/openhpi/files/openhpi-fix-testfail-errors.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-Fix for saftest failures.
-
-Upstream-Status: Pending
-
-Signed-off-by: yanjun.zhu <yanjun.zhu@windriver.com>
-
-Index: openhpi-3.6.1/openhpid/safhpi.c
-===================================================================
---- openhpi-3.6.1.orig/openhpid/safhpi.c
-+++ openhpi-3.6.1/openhpid/safhpi.c
-@@ -1933,7 +1933,7 @@ SaErrorT SAHPI_API saHpiSensorThresholds
-         oh_release_domain(d); /* Unlock domain */
- 
-         OH_CALL_ABI(h, set_sensor_thresholds, SA_ERR_HPI_INVALID_CMD, rv,
--                    ResourceId, SensorNum, SensorThresholds);
-+                    ResourceId, SensorNum, &tmp);
-         oh_release_handler(h);
- 
-         return rv;
-Index: openhpi-3.6.1/utils/sahpi_struct_utils.c
-===================================================================
---- openhpi-3.6.1.orig/utils/sahpi_struct_utils.c
-+++ openhpi-3.6.1/utils/sahpi_struct_utils.c
-@@ -3861,6 +3861,9 @@ SaHpiBoolT oh_valid_textbuffer(SaHpiText
-                                         /* found a unpaired surrogate */
-                                         return SAHPI_FALSE;
-                                 }
-+                        } else {
-+                            /*the first 2 bytes wrong*/
-+                            return SAHPI_FALSE;
-                         }
-                 }
-                 break;
diff --git a/meta-networking/recipes-daemons/openhpi/openhpi_3.8.0.bb b/meta-networking/recipes-daemons/openhpi/openhpi_3.8.0.bb
index 14cc3d8..e3a0c2e 100644
--- a/meta-networking/recipes-daemons/openhpi/openhpi_3.8.0.bb
+++ b/meta-networking/recipes-daemons/openhpi/openhpi_3.8.0.bb
@@ -33,7 +33,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.gz \
            file://openhpi-glib-cross-compile.patch \
            file://openhpi-linkfix.patch \
            file://openhpi-fix-host-gcc.patch \
-           file://openhpi-fix-testfail-errors.patch \
+           file://openhpi-fix-function-saHpiSensorThresholds.patch \
            file://openhpi-add-libnetsnmp-when-link.patch \
            file://openhpi-invalide-session.patch \
            file://openhpi-use-serial-tests-config-needed-by-ptest.patch \
-- 
2.7.4


