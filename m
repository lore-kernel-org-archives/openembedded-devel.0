Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E66B2FEFB60
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 15:40:42 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.99025.1772206836771645567
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Feb 2026 07:40:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=C7gIMw33;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4836e3288cdso14808485e9.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 07:40:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772206835; x=1772811635; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8/oFwiEkLIGfyKoXofGJcTPrdur0SpBzw7zKEr6d4uE=;
        b=C7gIMw33bdu4EpCUqQmzDILSrLArSlNaYjTebcLdtwVwcdTd9nl0YywKlOO1B0/wp5
         WUQiiyDtr3qf5zPAnwVwsrVhHAm6qhpS2XftSFWV5C6rBk6jww9T5lzHVVdHe4Ni0fTk
         kzZDP0LukrZeclRWDxVgVCuORjI5jpYt0f2bpedXskfSfDhbBec93mJkjO7mtw0KY2nY
         JTPkVrSFCoMapAKwjxc/SOqTkkfDo0q8Z9WEL6Eoqo+gveI3fAFNuBp24+FKZcJsaMKp
         zueZbxOjtHXV21psSu2Sd+aGVHZWrC7JQh9TQe1ikDMx5biE7awOa61n5fJ11uC+iXz/
         IaWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772206835; x=1772811635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8/oFwiEkLIGfyKoXofGJcTPrdur0SpBzw7zKEr6d4uE=;
        b=OM69GnO5lLob0Skgk4ZbkdkzNT1E3u/zshW9wvGzFI39J8ryIrgek6xsLZpWpE4sSd
         xJEj3L1ny5sQEGU/3+zCt4gW7o4ErrrX8RUNTwi+XJsXDb8MJnATSRC+OKqugObeshMQ
         LWNsNOmzOUJQp7mAzw9PyMlWajfVU6rz0l4x1wb4jSNMKTgesJH2kH+khxXm887es45K
         iEWdzaGX3bWZ8NUChacg95LsKX7+m+iFnEnxwiZIwuRdTpdK/kBJh3P0mpINZqp6DWQK
         REZybXCezrIbyT1scrwpauqwY9QUNFqVc4tIXlIo+CQz5V7+X5jwUbw5ZdbCEoZhcpbE
         YRiw==
X-Gm-Message-State: AOJu0YyLjy+vGXf5hHIsbVKEMHuUtB8Ia2/52Y5aTF1VcLcP9TKLbZil
	h5NGo1tvz+3Lr3t5qO0xFuFHR4fNul0PDTEETkHzCQvMT1onu34ei4bQmkzPYw==
X-Gm-Gg: ATEYQzwQHHUiGQvcwDwc5cRzjUekQoR+FdofptHr8awiBUUAeBXw4X1OVBCGe8u610h
	QT4ZcrqOULzmhCPLvpODvuZt+/AuQR7K4ziR5Z1RbG4KhILFBVE8dPr+p7zpvqG0FJHwOneQs7n
	+5RtH9ixxdTQF/ig71dtqErClYRZoWMT8zEL4pax4zDC/13shsvicz6I3URyuKR4AlA47wrBw7O
	nujttZGJSslo4jsmvX7Nh9lNbQjE+8G0hrbkFepmHNqRyjHiKdYUWRaz+KyzKd8TevuO/7Qfyuo
	RmDrAxayZXYmrE+zJqYprFD1ckx7WNN4DjBUJfl/+Bqb7Nzf9KMj9AHlLv1vlz4MJP48ZwvdhGN
	Ok+e2GPzdHZYJyEAo9roHZ9knYM8n8CRoyEscAY4nvJLOylrHWHeOSXjFtetqF0At4Kg3hyUthA
	XquqoB4/3E1wW4YUa6C1eP
X-Received: by 2002:a05:600c:8509:b0:483:6d9e:e4f5 with SMTP id 5b1f17b1804b1-483c990bddfmr54165265e9.5.1772206835044;
        Fri, 27 Feb 2026 07:40:35 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3b770e7sm123409785e9.9.2026.02.27.07.40.34
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 07:40:34 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH 3/4] dovecot: patch CVE-2021-29157
Date: Fri, 27 Feb 2026 16:40:31 +0100
Message-ID: <20260227154032.499047-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260227154032.499047-1-skandigraun@gmail.com>
References: <20260227154032.499047-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 15:40:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124760

Details: https://nvd.nist.gov/vuln/detail/CVE-2021-29157

Backport the patch that it used by Debian[1] to fix this CVE.

[1]: https://sources.debian.org/src/dovecot/1%3A2.3.13%2Bdfsg1-2%2Bdeb11u1/debian/patches
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../dovecot/dovecot/CVE-2021-29157.patch      | 152 ++++++++++++++++++
 .../recipes-support/dovecot/dovecot_2.3.14.bb |   1 +
 2 files changed, 153 insertions(+)
 create mode 100644 meta-networking/recipes-support/dovecot/dovecot/CVE-2021-29157.patch

diff --git a/meta-networking/recipes-support/dovecot/dovecot/CVE-2021-29157.patch b/meta-networking/recipes-support/dovecot/dovecot/CVE-2021-29157.patch
new file mode 100644
index 0000000000..cb0cba6f98
--- /dev/null
+++ b/meta-networking/recipes-support/dovecot/dovecot/CVE-2021-29157.patch
@@ -0,0 +1,152 @@
+From 1ee6540ef6ffa8cefade0161f4dcd47d82a1d10b Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Fri, 27 Feb 2026 16:10:35 +0100
+Subject: [PATCH] Fix CVE-2021-29157
+
+CVE: CVE-2021-29157
+Upstream-Status: Backport [the patch was taken from Debian: https://sources.debian.org/src/dovecot/1%3A2.3.13%2Bdfsg1-2%2Bdeb11u1/debian/patches/CVE-2021-29157.patch]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/lib-dict-extra/dict-fs.c     | 29 ++++++++++++++++
+ src/lib-oauth2/oauth2-jwt.c      | 58 ++++++++++++++++++--------------
+ src/lib-oauth2/test-oauth2-jwt.c |  2 +-
+ 3 files changed, 62 insertions(+), 27 deletions(-)
+
+diff --git a/src/lib-dict-extra/dict-fs.c b/src/lib-dict-extra/dict-fs.c
+index 31af578..f39c86c 100644
+--- a/src/lib-dict-extra/dict-fs.c
++++ b/src/lib-dict-extra/dict-fs.c
+@@ -68,8 +68,37 @@ static void fs_dict_deinit(struct dict *_dict)
+ 	i_free(dict);
+ }
+ 
++/* Remove unsafe paths */
++static const char *fs_dict_escape_key(const char *key)
++{
++	const char *ptr;
++	string_t *new_key = NULL;
++	/* we take the slow path always if we see potential
++	   need for escaping */
++	while ((ptr = strstr(key, "/.")) != NULL) {
++		/* move to the first dot */
++		const char *ptr2 = ptr + 1;
++		/* find position of non-dot */
++		while (*ptr2 == '.') ptr2++;
++		if (new_key == NULL)
++			new_key = t_str_new(strlen(key));
++		str_append_data(new_key, key, ptr - key);
++		/* if ptr2 is / or end of string, escape */
++		if (*ptr2 == '/' || *ptr2 == '\0')
++			str_append(new_key, "/...");
++		else
++			str_append(new_key, "/.");
++		key = ptr + 2;
++	}
++	if (new_key == NULL)
++		return key;
++	str_append(new_key, key);
++	return str_c(new_key);
++}
++
+ static const char *fs_dict_get_full_key(struct fs_dict *dict, const char *key)
+ {
++	key = fs_dict_escape_key(key);
+ 	if (str_begins(key, DICT_PATH_SHARED))
+ 		return key + strlen(DICT_PATH_SHARED);
+ 	else if (str_begins(key, DICT_PATH_PRIVATE)) {
+diff --git a/src/lib-oauth2/oauth2-jwt.c b/src/lib-oauth2/oauth2-jwt.c
+index 83b241c..8e43cf9 100644
+--- a/src/lib-oauth2/oauth2-jwt.c
++++ b/src/lib-oauth2/oauth2-jwt.c
+@@ -277,6 +277,34 @@ oauth2_jwt_copy_fields(ARRAY_TYPE(oauth2_field) *fields, struct json_tree *tree)
+ 	}
+ }
+ 
++/* Escapes '/' and '%' in identifier to %hex */
++static const char *escape_identifier(const char *identifier)
++{
++	size_t pos = strcspn(identifier, "/%");
++	/* nothing to escape */
++	if (identifier[pos] == '\0')
++		return identifier;
++
++	size_t len = strlen(identifier);
++	string_t *new_id = t_str_new(len);
++	str_append_data(new_id, identifier, pos);
++
++	for (size_t i = pos; i < len; i++) {
++		switch (identifier[i]) {
++		case '/':
++			str_append(new_id, "%2f");
++			break;
++		case '%':
++			str_append(new_id, "%25");
++			break;
++		default:
++			str_append_c(new_id, identifier[i]);
++			break;
++		}
++	}
++	return str_c(new_id);
++}
++
+ static int
+ oauth2_jwt_header_process(struct json_tree *tree, const char **alg_r,
+ 			  const char **kid_r, const char **error_r)
+@@ -377,6 +405,8 @@ oauth2_jwt_body_process(const struct oauth2_settings *set, const char *alg,
+ 	const char *azp = get_field(tree, "azp");
+ 	if (azp == NULL)
+ 		azp = "default";
++	else
++		azp = escape_identifier(azp);
+ 
+ 	if (oauth2_validate_signature(set, azp, alg, kid, blobs, error_r) < 0)
+ 		return -1;
+@@ -429,32 +459,8 @@ int oauth2_try_parse_jwt(const struct oauth2_settings *set,
+ 	else if (*kid == '\0') {
+ 		*error_r = "'kid' field is empty";
+ 		return -1;
+-	}
+-
+-	size_t pos = strcspn(kid, "./%");
+-	if (pos < strlen(kid)) {
+-		/* sanitize kid, cannot allow dots or / in it, so we encode them
+-		 */
+-		string_t *new_kid = t_str_new(strlen(kid));
+-		/* put initial data */
+-		str_append_data(new_kid, kid, pos);
+-		for (const char *c = kid+pos; *c != '\0'; c++) {
+-			switch (*c) {
+-			case '.':
+-				str_append(new_kid, "%2e");
+-				break;
+-			case '/':
+-				str_append(new_kid, "%2f");
+-				break;
+-			case '%':
+-				str_append(new_kid, "%25");
+-				break;
+-			default:
+-				str_append_c(new_kid, *c);
+-				break;
+-			}
+-		}
+-		kid = str_c(new_kid);
++	} else {
++		kid = escape_identifier(kid);
+ 	}
+ 
+ 	/* parse body */
+diff --git a/src/lib-oauth2/test-oauth2-jwt.c b/src/lib-oauth2/test-oauth2-jwt.c
+index 4cfba64..1706a96 100644
+--- a/src/lib-oauth2/test-oauth2-jwt.c
++++ b/src/lib-oauth2/test-oauth2-jwt.c
+@@ -577,7 +577,7 @@ static void test_jwt_kid_escape(void)
+ 	 random_fill(ptr, 32);
+ 	 buffer_t *b64_key = t_base64_encode(0, SIZE_MAX,
+ 					     secret->data, secret->used);
+-	 save_key_to("HS256", "hello%2eworld%2f%25", str_c(b64_key));
++	 save_key_to("HS256", "hello.world%2f%25", str_c(b64_key));
+ 	/* make a token */
+ 	buffer_t *tokenbuf = create_jwt_token_kid("HS256", "hello.world/%");
+ 	/* sign it */
diff --git a/meta-networking/recipes-support/dovecot/dovecot_2.3.14.bb b/meta-networking/recipes-support/dovecot/dovecot_2.3.14.bb
index c1fa702eaa..14303b4c08 100644
--- a/meta-networking/recipes-support/dovecot/dovecot_2.3.14.bb
+++ b/meta-networking/recipes-support/dovecot/dovecot_2.3.14.bb
@@ -13,6 +13,7 @@ SRC_URI = "http://dovecot.org/releases/2.3/dovecot-${PV}.tar.gz \
            file://0001-m4-Check-for-libunwind-instead-of-libunwind-generic.patch \
            file://0001-auth-Fix-handling-passdbs-with-identical-driver-args.patch \
            file://0001-lib-smtp-smtp-server-connection-Fix-STARTTLS-command.patch \
+           file://CVE-2021-29157.patch \
            "
 
 SRC_URI[md5sum] = "2f03532cec3280ae45a101a7a55ccef5"

