Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62F2CEEB57D
	for <webhook@archiver.kernel.org>; Thu,  1 Jan 2026 09:16:38 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.101546.1767258993358244232
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Jan 2026 01:16:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=b0s2TB7B;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47755de027eso67686345e9.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 01 Jan 2026 01:16:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767258992; x=1767863792; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=08NbKBRpNi4LfyKmCqSYxKlTqFKZlM56OL2rJGeEmMk=;
        b=b0s2TB7BP9DwMJgEmGNEXCiOkUzlBGJYJoBpVggExVASZba4MxhZOf4c77LiWEJxY8
         OdAPIGkUAyl4RM7q2CiKd8zbL2CIGz8XfET+6D2sPYRe6Ebk1teVCSBEoRiUGNs6IKPT
         aMqANlnZdStVklNy46Ez6HDBbJeJ+K/VvWVdhygHeKioowQ7Nt3+DTEjBhhJiTm6rsUg
         8gXgCASbW0cSd9MK5pWb2o8WwBfc2S9ieMxTIADn5Ri2GP5dJ3VErHGYjNRz/a6CiEfy
         JrCGqfpI6RbpYwx2tlcLkqjWRjSfMU4PrQgPqiGrLnCvgNP8n8/JGlCkcUh3KDKS2J+0
         IhBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767258992; x=1767863792;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=08NbKBRpNi4LfyKmCqSYxKlTqFKZlM56OL2rJGeEmMk=;
        b=vDiIr37hUMlY1EEF0YLhTPOYRGUCi16fhJcYb+vZ5x4e+z9RF0e+rCFQOGJQygqydv
         rwN5YbM0rFjHsXxpFG7/7iLHKorUezTKkHX9FBxGm/XAx5qDRvIDgBlMa+0Ku5aEbcUr
         HiL0q2ro+S+hLkrAeYjV5cT1+LysICs2mlBfyF3iLxfPNOP0cDn2s83qJg0AI1m8j3c7
         QeZXfbLat3eKBHqy/rG9roUMBLpopZEKUxspLYqF16sX8vMyuscUqSUecwICwWmiotgT
         aXoTgVe3hBktPe8LhGQDZLHzpgHZDYraFe0HY4d/9LbDqNLm7v6XWXlDTUD0X7Ri1/pe
         LWjw==
X-Gm-Message-State: AOJu0YwKdBvXz+syCttOzTxMy4gyfSQVCnwWP1+bzsmD2HGGhOKF37xz
	F9SgikF94V1yDxyoEeIivESx15ddxCTcLk+KvpMe/etjVDRvhLF2QIXVUARBzw==
X-Gm-Gg: AY/fxX7f4OGrTiKs4ddd99d5b1v5m+oVDxya8DTQWvVNVDoLlUTIhGowBau4BHTQjif
	s+5kN2ZjbSCjgfbfluTXP/v7IrsHs1nHj6JJ1yNcNmjBX3PFRIGMxhLRabcqdBpojNWw1txTJ2+
	LQJfPCP03YZLlHUp7i3bFSxlCsoGERWK0iqJHFtXLqTxCyk4v0cn5RXB1u59ciutfhKaPdDQ9xJ
	lBmkFr854JFnhYDjW+ZK3WoXLoTycjCsK94M0+gHIl5XC14Zl898AiqyQvJS6IxenMjfq4qMtMn
	uBuKZy2NB1fM2NW3b0J7h+E1GuQqftsaXxuJAFNQKyeeMBWAbqTZ4L8UOGToKYL25fgGR+K8yzH
	qKOKhj7YJZPFe+E3MXOj3ZCAwnaj6F6mBtvTMpIcut3sxelQEf1gDULwQ/IAzoBFcis9H5DGPVh
	VFT1JQKDoG
X-Google-Smtp-Source: AGHT+IF+UqD3IIp7ymAuda41P9uTxDUJYihe+fZwhiTYP1sg8RxBKev5w6ip6XovpA4aqKyztjxeGw==
X-Received: by 2002:a05:600c:3b25:b0:477:7a53:f493 with SMTP id 5b1f17b1804b1-47d1ffdde4fmr488460035e9.23.1767258991291;
        Thu, 01 Jan 2026 01:16:31 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be272e46fsm719752695e9.4.2026.01.01.01.16.30
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jan 2026 01:16:30 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH 1/3] civetweb: patch CVE-2025-9648
Date: Thu,  1 Jan 2026 10:16:27 +0100
Message-ID: <20260101091629.3744709-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Jan 2026 09:16:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123084

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details https://nvd.nist.gov/vuln/detail/CVE-2025-9648

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit eb338ebb606f22363be5b4114e25a10b494b4f55)

Rebased patch on Kirkstone's civetweb.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../civetweb/civetweb/CVE-2025-9648.patch     | 234 ++++++++++++++++++
 .../civetweb/civetweb_git.bb                  |   1 +
 2 files changed, 235 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/civetweb/civetweb/CVE-2025-9648.patch

diff --git a/meta-networking/recipes-connectivity/civetweb/civetweb/CVE-2025-9648.patch b/meta-networking/recipes-connectivity/civetweb/civetweb/CVE-2025-9648.patch
new file mode 100644
index 0000000000..e8ee00541e
--- /dev/null
+++ b/meta-networking/recipes-connectivity/civetweb/civetweb/CVE-2025-9648.patch
@@ -0,0 +1,234 @@
+From 6f10111d24f9f7bdb637bba77c27700ecff56244 Mon Sep 17 00:00:00 2001
+From: bel2125 <bel2125@gmail.com>
+Date: Tue, 2 Sep 2025 14:08:41 +0200
+Subject: [PATCH] Make parsing of URL encoded forms more robust
+
+Reject requests that obviously violate the URL encoding.
+Fixes #1348
+
+CVE: CVE-2025-9648
+Upstream-Status: Backport [https://github.com/civetweb/civetweb/commit/782e18903515f43bafbf2e668994e82bdfa51133]
+(cherry picked from commit 782e18903515f43bafbf2e668994e82bdfa51133)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/civetweb.c      |  7 ++++++-
+ src/handle_form.inl | 46 +++++++++++++++++++++++++++++++++++++--------
+ 2 files changed, 44 insertions(+), 9 deletions(-)
+
+diff --git a/src/civetweb.c b/src/civetweb.c
+index 5452b36d..f843300c 100644
+--- a/src/civetweb.c
++++ b/src/civetweb.c
+@@ -7143,11 +7143,15 @@ mg_url_decode(const char *src,
+ 			i += 2;
+ 		} else if (is_form_url_encoded && (src[i] == '+')) {
+ 			dst[j] = ' ';
++		} else if ((unsigned char)src[i] <= ' ') {
++			return -1; /* invalid character */
+ 		} else {
+ 			dst[j] = src[i];
+ 		}
+ 	}
+ 
++#undef HEXTOI
++
+ 	dst[j] = '\0'; /* Null-terminate the destination */
+ 
+ 	return (i >= src_len) ? j : -1;
+diff --git a/src/handle_form.inl b/src/handle_form.inl
+index be477a05..0ebaf560 100644
+--- a/src/handle_form.inl
++++ b/src/handle_form.inl
+@@ -39,7 +39,7 @@ url_encoded_field_found(const struct mg_connection *conn,
+ 	    mg_url_decode(key, (int)key_len, key_dec, (int)sizeof(key_dec), 1);
+ 
+ 	if (((size_t)key_dec_len >= (size_t)sizeof(key_dec)) || (key_dec_len < 0)) {
+-		return MG_FORM_FIELD_STORAGE_SKIP;
++		return MG_FORM_FIELD_STORAGE_ABORT;
+ 	}
+ 
+ 	if (filename) {
+@@ -53,7 +53,7 @@ url_encoded_field_found(const struct mg_connection *conn,
+ 		    || (filename_dec_len < 0)) {
+ 			/* Log error message and skip this field. */
+ 			mg_cry_internal(conn, "%s: Cannot decode filename", __func__);
+-			return MG_FORM_FIELD_STORAGE_SKIP;
++			return MG_FORM_FIELD_STORAGE_ABORT;
+ 		}
+ 		remove_dot_segments(filename_dec);
+ 
+@@ -93,6 +93,7 @@ url_encoded_field_get(
+                       struct mg_form_data_handler *fdh)
+ {
+ 	char key_dec[1024];
++	int key_dec_len;
+ 
+ 	char *value_dec = (char *)mg_malloc_ctx(value_len + 1, conn->phys_ctx);
+ 	int value_dec_len, ret;
+@@ -106,7 +107,8 @@ url_encoded_field_get(
+ 		return MG_FORM_FIELD_STORAGE_ABORT;
+ 	}
+ 
+-	mg_url_decode(key, (int)key_len, key_dec, (int)sizeof(key_dec), 1);
++	key_dec_len = mg_url_decode(
++	    key, (int)key_len, key_dec, (int)sizeof(key_dec), 1);
+ 
+ 	value_dec_len =
+ 	    mg_url_decode(value, (int)value_len, value_dec, (int)value_len + 1, 1);
+@@ -111,6 +113,11 @@ url_encoded_field_get(
+ 	value_dec_len =
+ 	    mg_url_decode(value, (int)value_len, value_dec, (int)value_len + 1, 1);
+ 
++	if ((key_dec_len < 0) || (value_dec_len < 0)) {
++		mg_free(value_dec);
++		return MG_FORM_FIELD_STORAGE_ABORT;
++	}
++
+ 	ret = fdh->field_get(key_dec,
+ 	                     value_dec,
+ 	                     (size_t)value_dec_len,
+@@ -130,9 +137,13 @@ unencoded_field_get(const struct mg_connection *conn,
+                     struct mg_form_data_handler *fdh)
+ {
+ 	char key_dec[1024];
++	int key_dec_len;
+ 	(void)conn;
+ 
+-	mg_url_decode(key, (int)key_len, key_dec, (int)sizeof(key_dec), 1);
++	key_dec_len = mg_url_decode(key, (int)key_len, key_dec, (int)sizeof(key_dec), 1);
++	if (key_dec_len < 0) {
++		return MG_FORM_FIELD_STORAGE_ABORT;
++	}
+ 
+ 	return fdh->field_get(key_dec, value, value_len, fdh->user_data);
+ }
+@@ -182,6 +193,7 @@ mg_handle_form_request(struct mg_connection *conn,
+ 	int buf_fill = 0;
+ 	int r;
+ 	int field_count = 0;
++	int abort_read = 0;
+ 	struct mg_file fstore = STRUCT_FILE_INITIALIZER;
+ 	int64_t file_size = 0; /* init here, to a avoid a false positive
+ 	                         "uninitialized variable used" warning */
+@@ -274,6 +286,7 @@ mg_handle_form_request(struct mg_connection *conn,
+ 				    conn, data, (size_t)keylen, val, (size_t)vallen, fdh);
+ 				if (r == MG_FORM_FIELD_HANDLE_ABORT) {
+ 					/* Stop request handling */
++					abort_read = 1;
+ 					break;
+ 				}
+ 				if (r == MG_FORM_FIELD_HANDLE_NEXT) {
+@@ -308,6 +321,7 @@ mg_handle_form_request(struct mg_connection *conn,
+ 							r = field_stored(conn, path, file_size, fdh);
+ 							if (r == MG_FORM_FIELD_HANDLE_ABORT) {
+ 								/* Stop request handling */
++								abort_read = 1;
+ 								break;
+ 							}
+ 
+@@ -346,6 +360,7 @@ mg_handle_form_request(struct mg_connection *conn,
+ 			if ((field_storage & MG_FORM_FIELD_STORAGE_ABORT)
+ 			    == MG_FORM_FIELD_STORAGE_ABORT) {
+ 				/* Stop parsing the request */
++				abort_read = 1;
+ 				break;
+ 			}
+ 
+@@ -374,7 +389,7 @@ mg_handle_form_request(struct mg_connection *conn,
+ 		 * Here we use "POST", and read the data from the request body.
+ 		 * The data read on the fly, so it is not required to buffer the
+ 		 * entire request in memory before processing it. */
+-		for (;;) {
++		while (!abort_read) {
+ 			const char *val;
+ 			const char *next;
+ 			ptrdiff_t keylen, vallen;
+@@ -428,6 +443,7 @@ mg_handle_form_request(struct mg_connection *conn,
+ 			if ((field_storage & MG_FORM_FIELD_STORAGE_ABORT)
+ 			    == MG_FORM_FIELD_STORAGE_ABORT) {
+ 				/* Stop parsing the request */
++				abort_read = 1;
+ 				break;
+ 			}
+ 
+@@ -458,6 +474,15 @@ mg_handle_form_request(struct mg_connection *conn,
+ 					vallen = (ptrdiff_t)strlen(val);
+ 					next = val + vallen;
+ 					end_of_key_value_pair_found = all_data_read;
++					if ((buf + buf_fill) > (val + vallen)) {
++						/* Avoid DoS attacks by having a zero byte in the middle of
++						 * a request that is supposed to be URL encoded. Since this
++						 * request is certainly invalid, according to the protocol
++						 * specification, stop processing it. Fixes #1348 */
++						abort_read = 1;
++						break;
++					}
++
+ 				}
+ 
+ 				if (field_storage == MG_FORM_FIELD_STORAGE_GET) {
+@@ -479,6 +504,7 @@ mg_handle_form_request(struct mg_connection *conn,
+ 					get_block++;
+ 					if (r == MG_FORM_FIELD_HANDLE_ABORT) {
+ 						/* Stop request handling */
++						abort_read = 1;
+ 						break;
+ 					}
+ 					if (r == MG_FORM_FIELD_HANDLE_NEXT) {
+@@ -539,7 +565,6 @@ mg_handle_form_request(struct mg_connection *conn,
+ 						val = buf;
+ 					}
+ 				}
+-
+ 			} while (!end_of_key_value_pair_found);
+ 
+ #if !defined(NO_FILESYSTEMS)
+@@ -550,6 +575,7 @@ mg_handle_form_request(struct mg_connection *conn,
+ 					r = field_stored(conn, path, file_size, fdh);
+ 					if (r == MG_FORM_FIELD_HANDLE_ABORT) {
+ 						/* Stop request handling */
++						abort_read = 1;
+ 						break;
+ 					}
+ 				} else {
+@@ -563,7 +589,7 @@ mg_handle_form_request(struct mg_connection *conn,
+ 			}
+ #endif /* NO_FILESYSTEMS */
+ 
+-			if (all_data_read && (buf_fill == 0)) {
++			if ((all_data_read && (buf_fill == 0)) || abort_read) {
+ 				/* nothing more to process */
+ 				break;
+ 			}
+@@ -919,6 +945,7 @@ mg_handle_form_request(struct mg_connection *conn,
+ 					get_block++;
+ 					if (r == MG_FORM_FIELD_HANDLE_ABORT) {
+ 						/* Stop request handling */
++						abort_read = 1;
+ 						break;
+ 					}
+ 					if (r == MG_FORM_FIELD_HANDLE_NEXT) {
+@@ -995,6 +1022,7 @@ mg_handle_form_request(struct mg_connection *conn,
+ 				                        fdh);
+ 				if (r == MG_FORM_FIELD_HANDLE_ABORT) {
+ 					/* Stop request handling */
++					abort_read = 1;
+ 					break;
+ 				}
+ 				if (r == MG_FORM_FIELD_HANDLE_NEXT) {
+@@ -1023,6 +1051,7 @@ mg_handle_form_request(struct mg_connection *conn,
+ 							r = field_stored(conn, path, file_size, fdh);
+ 							if (r == MG_FORM_FIELD_HANDLE_ABORT) {
+ 								/* Stop request handling */
++								abort_read = 1;
+ 								break;
+ 							}
+ 						} else {
+@@ -1041,6 +1070,7 @@ mg_handle_form_request(struct mg_connection *conn,
+ 			if ((field_storage & MG_FORM_FIELD_STORAGE_ABORT)
+ 			    == MG_FORM_FIELD_STORAGE_ABORT) {
+ 				/* Stop parsing the request */
++				abort_read = 1;
+ 				break;
+ 			}
+ 
diff --git a/meta-networking/recipes-connectivity/civetweb/civetweb_git.bb b/meta-networking/recipes-connectivity/civetweb/civetweb_git.bb
index 1648d13d99..ed80eac08e 100644
--- a/meta-networking/recipes-connectivity/civetweb/civetweb_git.bb
+++ b/meta-networking/recipes-connectivity/civetweb/civetweb_git.bb
@@ -10,6 +10,7 @@ SRC_URI = "git://github.com/civetweb/civetweb.git;branch=master;protocol=https \
            file://0001-Unittest-Link-librt-and-libm-using-l-option.patch \
            file://0001-Sanitize-upload-filename-like-URL.patch \
            file://0002-handle_form-example-Upload-to-temporary-directory-an.patch \
+           file://CVE-2025-9648.patch \
            "
 
 S = "${WORKDIR}/git"

