Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51C3BCAC5BB
	for <webhook@archiver.kernel.org>; Sat,  4 Oct 2025 20:24:39 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web11.16796.1759609476562085808
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Oct 2025 13:24:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=T8yV5c9w;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-62fa062a1abso6522246a12.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Oct 2025 13:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759609475; x=1760214275; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=hg4+u5Aiwg4PMPaCP+wr2yE5kgIp1puDuKaGsFWyNlE=;
        b=T8yV5c9wVi2bEalXBMNo7eHB4yNBF1dUKL0Yb+nZbZVfNcbB58On0nOHA+K/WI9jGg
         AsDNUMYsMaiZoUAKLWiD5bSmi5ijG35vcIR9n3M8aIjRykOgHflX8evpE4e+hfARIUzL
         fRezKL/50CeI7c5sPcBnKoy5xThpvDzMtrGT81iiHSouY4U7q+RMbqiAkM5jAsodQgkX
         iIpwXM2Wql1F0mFx7fu9H8PwbiC+1BrgeYEaqWna1hjxaGArs5HzzYRgLXmg1WqWasXY
         GRymGTYt1iBokGk6P6cl77pGRp1sBsBdLh5eBUqUW1ZKugMcpqV9b1BFrSX6Uq8pIoK4
         X60w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759609475; x=1760214275;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hg4+u5Aiwg4PMPaCP+wr2yE5kgIp1puDuKaGsFWyNlE=;
        b=sufEuqAQ6xizxu5rPLESjV/YFfC4ue3kJwWe37rnNmzlWRednsr6LVVSWELX9UD5Jm
         4osayTM0F4xHaPzGRDlOjWkBCnVw5zQii4yV08dGUWwFNgRxagR1SRcW8UoPgiP/3F3Z
         ODXrqpFfSR1VtZgUuH0nW6xa+Dd3zkULdSwUnSgZUx+O5NT3NpAB62YyKJBeKKXtsWdJ
         qoqAcqShDVFFVV6EwUak1pj/1XucoQ+NXblOa8VjZabrWzql9HEreU2ATjNlylxpI6SO
         G8gULiOJGcCy16fTo1l5zZVgcDAH8kYnmblTmN6vX2mbm6+vO9KvUfsxTtYZmMgSZtPO
         z0mQ==
X-Gm-Message-State: AOJu0Yz0Tuqt1rxpCc5YwD5oC2ufPePdlnDzJk+CzKfVB7GlnOAOtaek
	HlOreHBzSedG7G+nqmzFQa0ojWDpN9e0Jiscl85lqKmDG/APMQlh9OzW4iOzjA==
X-Gm-Gg: ASbGncu/UCPJ6wlG7xyJzMEZxAzU7JAwtMNTeVIm54A6ROow+UWaO5jLCgmH9hb67pP
	6rvgmfasE1Jf6Ydj3fAwYHm3GI1EMgbpgz5y32TaQzw9iXzlD18CJtykfUcqG/Q0bl69S4YLggB
	rfw/CNXpFBC61O+eXhOrQ5g3ksMTITUULrsNwbeWdKkMDDEnnatbVCZcatxNPgOhz0D8NSnqGEb
	N76hA/bvuZF7Q/LAx3GzRxbDMZN7HV/Z/tmqJuaO5Wnl6DSDKQXFOxpnJEv6vn0C5uujyQSClIy
	T7jUrRGqIp66u6yXqoDeZPjJnTi2dJYxN1JE1QP/xMGxb2IvQv9qi0IRXVB2WoHnm2NW9c/ZRF4
	rCjsj3UQSXE46c+6QplnZ5dvyNvYI24Ui5S5fhDu1/KhTfiaoAyBHKW8tu9NfjrKwew==
X-Google-Smtp-Source: AGHT+IEZiM6dkntipGaU005x5rOyib4S3X/wDb4tGrGNU8kSYuRDI5lQzr7g7syzBL7dztQddeDN1w==
X-Received: by 2002:a05:6402:50c8:b0:637:e271:8071 with SMTP id 4fb4d7f45d1cf-63939c2906cmr8929372a12.27.1759609474592;
        Sat, 04 Oct 2025 13:24:34 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6376b3aaf87sm6593912a12.4.2025.10.04.13.24.33
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Oct 2025 13:24:34 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH] civetweb: patch CVE-2020-27304
Date: Sat,  4 Oct 2025 22:24:33 +0200
Message-ID: <20251004202433.4057464-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Oct 2025 20:24:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120241

Details: https://nvd.nist.gov/vuln/detail/CVE-2020-27304

Take the patches referenced in
https://jfrog.com/blog/cve-2020-27304-rce-via-directory-traversal-in-civetweb-http-server/
(which URL is also referenced by NIST)

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...01-Sanitize-upload-filename-like-URL.patch | 27 ++++++
 ...ple-Upload-to-temporary-directory-an.patch | 90 +++++++++++++++++++
 .../civetweb/civetweb_git.bb                  |  2 +
 3 files changed, 119 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/civetweb/civetweb/0001-Sanitize-upload-filename-like-URL.patch
 create mode 100644 meta-networking/recipes-connectivity/civetweb/civetweb/0002-handle_form-example-Upload-to-temporary-directory-an.patch

diff --git a/meta-networking/recipes-connectivity/civetweb/civetweb/0001-Sanitize-upload-filename-like-URL.patch b/meta-networking/recipes-connectivity/civetweb/civetweb/0001-Sanitize-upload-filename-like-URL.patch
new file mode 100644
index 0000000000..0e2ee700c8
--- /dev/null
+++ b/meta-networking/recipes-connectivity/civetweb/civetweb/0001-Sanitize-upload-filename-like-URL.patch
@@ -0,0 +1,27 @@
+From e7c4fca110a0823262cf444371d01309c85c760f Mon Sep 17 00:00:00 2001
+From: bel2125 <bel2125@gmail.com>
+Date: Sat, 3 Jul 2021 21:54:28 +0200
+Subject: [PATCH] Sanitize upload filename like URL
+
+CVE: CVE-2020-27304
+
+Upstream-Status: Backport [https://github.com/civetweb/civetweb/commit/b2ed60c589172b37f3d705c69d84313eeb8348b1]
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/handle_form.inl | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/handle_form.inl b/src/handle_form.inl
+index 9853faf1..21536158 100644
+--- a/src/handle_form.inl
++++ b/src/handle_form.inl
+@@ -55,6 +55,8 @@ url_encoded_field_found(const struct mg_connection *conn,
+ 			mg_cry_internal(conn, "%s: Cannot decode filename", __func__);
+ 			return MG_FORM_FIELD_STORAGE_SKIP;
+ 		}
++		remove_dot_segments(filename_dec);
++
+ 	} else {
+ 		filename_dec[0] = 0;
+ 	}
diff --git a/meta-networking/recipes-connectivity/civetweb/civetweb/0002-handle_form-example-Upload-to-temporary-directory-an.patch b/meta-networking/recipes-connectivity/civetweb/civetweb/0002-handle_form-example-Upload-to-temporary-directory-an.patch
new file mode 100644
index 0000000000..2721eb3b63
--- /dev/null
+++ b/meta-networking/recipes-connectivity/civetweb/civetweb/0002-handle_form-example-Upload-to-temporary-directory-an.patch
@@ -0,0 +1,90 @@
+From 69b2b98f009603e669aac9d1a1e57d00769881b2 Mon Sep 17 00:00:00 2001
+From: bel2125 <bel2125@gmail.com>
+Date: Sat, 3 Jul 2021 22:35:50 +0200
+Subject: [PATCH] handle_form example: Upload to temporary directory and do
+ some filename checks
+
+For Windows, determine the temporary directory from the GetTempPath API.
+
+According to RFC7578, path information should be ignored and you should not
+overwrite existing files.
+
+CVE: CVE-2020-27304
+
+Upstream-Status: Backport [https://github.com/civetweb/civetweb/commit/b2ed60c589172b37f3d705c69d84313eeb8348b1]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ examples/embedded_c/embedded_c.c | 51 ++++++++++++++++++++++++++++++--
+ 1 file changed, 49 insertions(+), 2 deletions(-)
+
+diff --git a/examples/embedded_c/embedded_c.c b/examples/embedded_c/embedded_c.c
+index 8956bbce..29ab6b36 100644
+--- a/examples/embedded_c/embedded_c.c
++++ b/examples/embedded_c/embedded_c.c
+@@ -258,17 +258,64 @@ field_found(const char *key,
+             size_t pathlen,
+             void *user_data)
+ {
++#ifdef _WIN32
++	char temppath[MAX_PATH + 2];
++	DWORD temppathlen;
++#endif
++
+ 	struct mg_connection *conn = (struct mg_connection *)user_data;
+ 
+ 	mg_printf(conn, "\r\n\r\n%s:\r\n", key);
+ 
+ 	if (filename && *filename) {
++
++		/* According to
++		 * https://datatracker.ietf.org/doc/html/rfc7578#section-4.2: Do not use
++		 * path information present in the filename. Drop all "/" (and "\" for
++		 * Windows).
++		 */
++		char *sep = strrchr(filename, '/');
++		if (sep) {
++			memmove(filename, sep + 1, strlen(sep));
++		}
++
+ #ifdef _WIN32
+-		_snprintf(path, pathlen, "D:\\tmp\\%s", filename);
++		sep = strrchr(filename, '\\');
++		if (sep) {
++			memmove(filename, sep + 1, strlen(sep));
++		}
++
++		/* For Windows: Find the directory for temporary files */
++		temppathlen = GetTempPathA(sizeof(temppath), temppath);
++		if (temppathlen > 0) {
++			_snprintf(path, pathlen, "%s\\%s", temppath, filename);
++		} else {
++			_snprintf(path, pathlen, "C:\\tmp\\%s", filename);
++		}
+ #else
+ 		snprintf(path, pathlen, "/tmp/%s", filename);
+ #endif
+-		return MG_FORM_FIELD_STORAGE_STORE;
++
++		/* According to https://datatracker.ietf.org/doc/html/rfc7578#section-7:
++		 * Do not overwrite existing files.
++		 */
++		{
++			FILE *ftest = fopen(path, "r");
++			if (!ftest) {
++				return MG_FORM_FIELD_STORAGE_STORE;
++			}
++			fclose(ftest);
++			/* This is just simple demo code. More sophisticated code could add
++			 * numbers to the file name to make filenames unique. However, most
++			 * likely file upload will not end up in the temporary path, but in
++			 * a user directory - multiple directories for multiple users that
++			 * are logged into the web service. In this case, users might want
++			 * to overwrite their own code. You need to adapt this example to
++			 * your needs.
++			 */
++		}
++
++		return MG_FORM_FIELD_STORAGE_SKIP;
+ 	}
+ 	return MG_FORM_FIELD_STORAGE_GET;
+ }
diff --git a/meta-networking/recipes-connectivity/civetweb/civetweb_git.bb b/meta-networking/recipes-connectivity/civetweb/civetweb_git.bb
index e9c2056180..1648d13d99 100644
--- a/meta-networking/recipes-connectivity/civetweb/civetweb_git.bb
+++ b/meta-networking/recipes-connectivity/civetweb/civetweb_git.bb
@@ -8,6 +8,8 @@ SRCREV = "4b440a339979852d5a51fb11a822952712231c23"
 PV = "1.12+git${SRCPV}"
 SRC_URI = "git://github.com/civetweb/civetweb.git;branch=master;protocol=https \
            file://0001-Unittest-Link-librt-and-libm-using-l-option.patch \
+           file://0001-Sanitize-upload-filename-like-URL.patch \
+           file://0002-handle_form-example-Upload-to-temporary-directory-an.patch \
            "
 
 S = "${WORKDIR}/git"

