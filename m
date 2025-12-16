Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28E26D5B161
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 07:15:53 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16738.1765869345124623191
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Dec 2025 23:15:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aQmHjMGS;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7b75e366866so1731174b3a.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 15 Dec 2025 23:15:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765869344; x=1766474144; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wiBpiEGOegSJr87GamKseI/QUqa8FZoMJ/bm71sxtEU=;
        b=aQmHjMGSOlLfJ8qSiBMeqCy8XbsmUycisCD0Mq8iJGJmsQTsgDe3EWhp19pvSa1jnu
         9Vk6jEQYfsOR7dGRmnR83kZN1VGlEBObvHfgDLfZJKEqE4CspRdpontZ42dWuKt+OVne
         Q09jj3xcssmULG3q8TvLvSR4Q3ffisGFIYi0XY8YvlRZzFUwDzjNatHkWW6ZH9bPzxDr
         Bk+q23SHgDR7bt/dkPER0AZL7stetK+0ERMxOtOxzZPIXCY22qKIw63MqzgCEpnbn8/d
         BInoYGCED2ixjTAd7FFYSLW9F566s0aEBFJ6A08y/Ii8acgD2NV/og6ISrd3Rtg7L6cO
         emBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765869344; x=1766474144;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wiBpiEGOegSJr87GamKseI/QUqa8FZoMJ/bm71sxtEU=;
        b=d8hIV64nbFyc5Yxd5rt/olawaXl1+jsUYcORBBav3L789yCe82SV1AEaG37kJgP5mh
         3gIUT8C3M+vVq9SoVV2FmFPIi+wcv0dEu/WB3wq7H7bChdPSzJ6nWtZN4dGdEQ8FeLDS
         2IU1II21qd6P6M98QiYhSr2kFlwgGUbCh/gaVd04BUltkAcPR+0SwOivMOT4aztVmSDf
         jFpxFIHvDx3CNlvLfeSJqdoDHhm0/m7YfmzeRVAO9JOgs3Epr8SxudJMNRu9+ILeGzUx
         OnGL8kxlv2n7N+UVPdn1KYWuRvAoNRq1G7Vz8Fr7t12Q+LTvBts3zCMyeaPbVzjn8HH9
         iwJQ==
X-Gm-Message-State: AOJu0YwfbRx+cz3tF9NqaKFOS9Bj84k7iCgEA/aRJmDfCuAxul3YbOOR
	N0hEK2Z+SPCb65mWib3fLSzZP/GxQ4ZBNmKMhKzPnq8dkiBugJMP2qQkoVDoTA==
X-Gm-Gg: AY/fxX6HcMkwFzy8TTSV5c9jyYNCB8gWBsh/IyfIq5HOK1d+8uAl8K3VtB+l3JXKZYP
	dn5JNU/vzFggCIApOo0y8kFVsQ9dri5RPl22WvNwTCDV7qcbxxNi7h+MVshXKF7KYHKlumY2uSo
	z+HJwR7ypH3f4eWgb1zacy/Ssc/PNYfjZNV3P3+j6SmzW9KMYgaHF56eUbF+Z1e0jy3lhgUrrgS
	bkLApumfGkUaQSaQO5afxpDIBN0/1sEbuO1Y1NSaRJ2AkzZgy9hv9qQ9u9hsPfeOm/QHC0gy0bU
	RWbHEz8p0OeDXi2ZCLzDLaxJblVcXfjoElaXCuLS3c63E2Wrcw0aFCxo8oLMMb+xrthOe0iWgLE
	vneISO0ZfufiWOdJw5MxCcXOEzQHGzPybiJ/fOLKJQ7snniGKdOHYlpI6qERvRkX2WWBh06socZ
	kuy1sLXGhUNhJoPtlsQ1ndAW/k
X-Google-Smtp-Source: AGHT+IESjJKIiDqqCcHoAcS9nREnaSrSl0nSB17k9C/x9VNWMW/yWCcf1OW0VTlMI91nprKLpsZrjw==
X-Received: by 2002:a05:6a00:1824:b0:7f7:52ae:6b9a with SMTP id d2e1a72fcca58-7f752ae6e23mr9502394b3a.9.1765869344146;
        Mon, 15 Dec 2025 23:15:44 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([165.225.124.223])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f4c2d48514sm14471448b3a.30.2025.12.15.23.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 23:15:43 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][scarthgap][PATCH 1/6] civetweb: patch CVE-2025-9648
Date: Tue, 16 Dec 2025 12:45:32 +0530
Message-ID: <20251216071537.3174578-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Dec 2025 07:15:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122680

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details https://nvd.nist.gov/vuln/detail/CVE-2025-9648

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../civetweb/civetweb/CVE-2025-9648.patch     | 254 ++++++++++++++++++
 .../civetweb/civetweb_1.16.bb                 |   1 +
 2 files changed, 255 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/civetweb/civetweb/CVE-2025-9648.patch

diff --git a/meta-networking/recipes-connectivity/civetweb/civetweb/CVE-2025-9648.patch b/meta-networking/recipes-connectivity/civetweb/civetweb/CVE-2025-9648.patch
new file mode 100644
index 0000000000..0456203248
--- /dev/null
+++ b/meta-networking/recipes-connectivity/civetweb/civetweb/CVE-2025-9648.patch
@@ -0,0 +1,254 @@
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
+@@ -1,4 +1,4 @@
+-/* Copyright (c) 2013-2021 the Civetweb developers
++/* Copyright (c) 2013-2025 the Civetweb developers
+  * Copyright (c) 2004-2013 Sergey Lyubka
+  *
+  * Permission is hereby granted, free of charge, to any person obtaining a copy
+@@ -7052,6 +7052,7 @@ mg_url_decode(const char *src,
+               int is_form_url_encoded)
+ {
+ 	int i, j, a, b;
++
+ #define HEXTOI(x) (isdigit(x) ? (x - '0') : (x - 'W'))
+ 
+ 	for (i = j = 0; (i < src_len) && (j < (dst_len - 1)); i++, j++) {
+@@ -7064,11 +7065,15 @@ mg_url_decode(const char *src,
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
+@@ -1,4 +1,4 @@
+-/* Copyright (c) 2016-2021 the Civetweb developers
++/* Copyright (c) 2016-2025 the Civetweb developers
+  *
+  * Permission is hereby granted, free of charge, to any person obtaining a copy
+  * of this software and associated documentation files (the "Software"), to deal
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
+@@ -95,6 +95,7 @@ url_encoded_field_get(
+     struct mg_form_data_handler *fdh)
+ {
+ 	char key_dec[1024];
++	int key_dec_len;
+ 
+ 	char *value_dec = (char *)mg_malloc_ctx(*value_len + 1, conn->phys_ctx);
+ 	int value_dec_len, ret;
+@@ -108,7 +109,8 @@ url_encoded_field_get(
+ 		return MG_FORM_FIELD_STORAGE_ABORT;
+ 	}
+ 
+-	mg_url_decode(key, (int)key_len, key_dec, (int)sizeof(key_dec), 1);
++	key_dec_len = mg_url_decode(
++	    key, (int)key_len, key_dec, (int)sizeof(key_dec), 1);
+ 
+ 	if (*value_len >= 2 && value[*value_len - 2] == '%')
+ 		*value_len -= 2;
+@@ -117,6 +119,11 @@ url_encoded_field_get(
+ 	value_dec_len = mg_url_decode(
+ 	    value, (int)*value_len, value_dec, ((int)*value_len) + 1, 1);
+ 
++	if ((key_dec_len < 0) || (value_dec_len < 0)) {
++		mg_free(value_dec);
++		return MG_FORM_FIELD_STORAGE_ABORT;
++	}
++
+ 	ret = fdh->field_get(key_dec,
+ 	                     value_dec,
+ 	                     (size_t)value_dec_len,
+@@ -136,9 +143,13 @@ unencoded_field_get(const struct mg_connection *conn,
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
+@@ -188,6 +199,7 @@ mg_handle_form_request(struct mg_connection *conn,
+ 	int buf_fill = 0;
+ 	int r;
+ 	int field_count = 0;
++	int abort_read = 0;
+ 	struct mg_file fstore = STRUCT_FILE_INITIALIZER;
+ 	int64_t file_size = 0; /* init here, to a avoid a false positive
+ 	                         "uninitialized variable used" warning */
+@@ -278,6 +290,7 @@ mg_handle_form_request(struct mg_connection *conn,
+ 				    conn, data, (size_t)keylen, val, (size_t *)&vallen, fdh);
+ 				if (r == MG_FORM_FIELD_HANDLE_ABORT) {
+ 					/* Stop request handling */
++					abort_read = 1;
+ 					break;
+ 				}
+ 				if (r == MG_FORM_FIELD_HANDLE_NEXT) {
+@@ -320,6 +333,7 @@ mg_handle_form_request(struct mg_connection *conn,
+ 							r = field_stored(conn, path, file_size, fdh);
+ 							if (r == MG_FORM_FIELD_HANDLE_ABORT) {
+ 								/* Stop request handling */
++								abort_read = 1;
+ 								break;
+ 							}
+ 
+@@ -358,6 +372,7 @@ mg_handle_form_request(struct mg_connection *conn,
+ 			if ((field_storage & MG_FORM_FIELD_STORAGE_ABORT)
+ 			    == MG_FORM_FIELD_STORAGE_ABORT) {
+ 				/* Stop parsing the request */
++				abort_read = 1;
+ 				break;
+ 			}
+ 
+@@ -386,7 +401,7 @@ mg_handle_form_request(struct mg_connection *conn,
+ 		 * Here we use "POST", and read the data from the request body.
+ 		 * The data read on the fly, so it is not required to buffer the
+ 		 * entire request in memory before processing it. */
+-		for (;;) {
++		while (!abort_read) {
+ 			const char *val;
+ 			const char *next;
+ 			ptrdiff_t keylen, vallen;
+@@ -440,6 +455,7 @@ mg_handle_form_request(struct mg_connection *conn,
+ 			if ((field_storage & MG_FORM_FIELD_STORAGE_ABORT)
+ 			    == MG_FORM_FIELD_STORAGE_ABORT) {
+ 				/* Stop parsing the request */
++				abort_read = 1;
+ 				break;
+ 			}
+ 
+@@ -468,6 +484,15 @@ mg_handle_form_request(struct mg_connection *conn,
+ 				} else {
+ 					vallen = (ptrdiff_t)strlen(val);
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
+@@ -489,6 +514,7 @@ mg_handle_form_request(struct mg_connection *conn,
+ 					get_block++;
+ 					if (r == MG_FORM_FIELD_HANDLE_ABORT) {
+ 						/* Stop request handling */
++						abort_read = 1;
+ 						break;
+ 					}
+ 					if (r == MG_FORM_FIELD_HANDLE_NEXT) {
+@@ -557,7 +583,6 @@ mg_handle_form_request(struct mg_connection *conn,
+ 						val = buf;
+ 					}
+ 				}
+-
+ 			} while (!end_of_key_value_pair_found);
+ 
+ #if !defined(NO_FILESYSTEMS)
+@@ -568,6 +593,7 @@ mg_handle_form_request(struct mg_connection *conn,
+ 					r = field_stored(conn, path, file_size, fdh);
+ 					if (r == MG_FORM_FIELD_HANDLE_ABORT) {
+ 						/* Stop request handling */
++						abort_read = 1;
+ 						break;
+ 					}
+ 				} else {
+@@ -581,7 +607,7 @@ mg_handle_form_request(struct mg_connection *conn,
+ 			}
+ #endif /* NO_FILESYSTEMS */
+ 
+-			if (all_data_read && (buf_fill == 0)) {
++			if ((all_data_read && (buf_fill == 0)) || abort_read) {
+ 				/* nothing more to process */
+ 				break;
+ 			}
+@@ -937,6 +963,7 @@ mg_handle_form_request(struct mg_connection *conn,
+ 					get_block++;
+ 					if (r == MG_FORM_FIELD_HANDLE_ABORT) {
+ 						/* Stop request handling */
++						abort_read = 1;
+ 						break;
+ 					}
+ 					if (r == MG_FORM_FIELD_HANDLE_NEXT) {
+@@ -1011,6 +1038,7 @@ mg_handle_form_request(struct mg_connection *conn,
+ 				                        fdh);
+ 				if (r == MG_FORM_FIELD_HANDLE_ABORT) {
+ 					/* Stop request handling */
++					abort_read = 1;
+ 					break;
+ 				}
+ 				if (r == MG_FORM_FIELD_HANDLE_NEXT) {
+@@ -1039,6 +1067,7 @@ mg_handle_form_request(struct mg_connection *conn,
+ 							r = field_stored(conn, path, file_size, fdh);
+ 							if (r == MG_FORM_FIELD_HANDLE_ABORT) {
+ 								/* Stop request handling */
++								abort_read = 1;
+ 								break;
+ 							}
+ 						} else {
+@@ -1057,6 +1086,7 @@ mg_handle_form_request(struct mg_connection *conn,
+ 			if ((field_storage & MG_FORM_FIELD_STORAGE_ABORT)
+ 			    == MG_FORM_FIELD_STORAGE_ABORT) {
+ 				/* Stop parsing the request */
++				abort_read = 1;
+ 				break;
+ 			}
+ 
diff --git a/meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb b/meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb
index a546efca7b..0c860f85a3 100644
--- a/meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb
+++ b/meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb
@@ -9,6 +9,7 @@ SRCREV = "d7ba35bbb649209c66e582d5a0244ba988a15159"
 SRC_URI = "git://github.com/civetweb/civetweb.git;branch=master;protocol=https \
            file://0001-Unittest-Link-librt-and-libm-using-l-option.patch \
            file://0001-Fix-heap-overflow-in-directory-URI-slash-redirection.patch \
+           file://CVE-2025-9648.patch \
            "
 
 S = "${WORKDIR}/git"

