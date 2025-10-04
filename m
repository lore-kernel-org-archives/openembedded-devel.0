Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34B74CAC5BB
	for <webhook@archiver.kernel.org>; Sat,  4 Oct 2025 19:58:49 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web11.16340.1759607923872529411
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Oct 2025 12:58:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l8RaFXOs;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-62ecd3c21d3so6289051a12.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Oct 2025 12:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759607922; x=1760212722; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=5VT7yS3y4cOeUtTv0KifEuUgVa0ClvgBKFhOlxvmgVQ=;
        b=l8RaFXOsHDCxk/jtjpwRMPjvCDLbmdVvpDvRHZ2olSoHhegIWFJ2ZLt3cjdu2n8NM2
         kvq2eJNwEdHVa9wYZJ25pamrjKX+E34JaSzecyYRGunVpaisi4K/ocNqTLXxbWCyKfZk
         TGwAeo+5rIt9+8jxTuoe6MO7l8Si/cxF2gF07fFgdlYEBLka42AjUVB5YIycGeZyqQfT
         /2Wa6o1BBPOmTf/nEykhaSmXCHtWFK2H/wOyaPuvoNHa0xxs+pODz/0ZoexqEBhAmY6H
         ErWCbi+jTo2tQyYBqzk9iSXCeVhGSYjzAjE1amZWKl0tYB1LRDoitKxOsu3ErOcTjCSh
         K2MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759607922; x=1760212722;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5VT7yS3y4cOeUtTv0KifEuUgVa0ClvgBKFhOlxvmgVQ=;
        b=b/0j28Qbj1u1G1HKJsux23j2efSfhwwKUMjWUxYUodkEo5tXzyO+i7hFGTJrCIu03d
         EPhVSkGenrCm2kJ1Eq3lgzlILDSrYJ7MT1kfOtfGnjpzUwgMIpykbXwUy8BEoeSP4o3J
         ZPGheKBEtOmPPzN4D+HrhsmVm3HRFmDUzOgLMgJRVEhZQ4WV0BfO3vH53e+4dkFCHCKj
         kYnQLCMbo2cOOqHN4/qBIn8imDwQOeCF2jxHHP2dQMRZqcSE2BT9Yi8Ac65ea9/At3CK
         GSwVyhhNbU9lp6S3uNOZs2ZzOqw0YPRXz8CuH2s6KR7uW+mHVApy5liJn3GlB4Dceomx
         1KmQ==
X-Gm-Message-State: AOJu0Yxr2xBo3jnLKTtQ8IWDlgrJKzY3q3vuzr0c1NDKRBSsZ2P5xBha
	n00kRABrzOOMRkdcoOSD+oU0TXwq5y24mPRI99KZhmGgeCad26dfVuHWVmk7oA==
X-Gm-Gg: ASbGncvck/9Yu9JT2yth1eks1W7khQ8cuviGsO4TwaHf01KGI4BaIhteRtJeogV6/Iq
	XmVjy5EGqoOMcWzHhOZ53KbLDi3wMN0GeLRBM3z8KFRdN6QHN3nyrk8c4ySPwqSH+UJF2OPUseo
	dBvM03ps+7c/KvBUrg5Mc/kXpr8KPRGosmhznXIIoU9Mymt0ug5ogwLqvXKBLYt23GEL8k+P3ey
	OcfJiMfj5WF3MTbiAOhGzCmCfsi1IOEpRwHhlVKhg+bntBkbKtP3rdjlLSC0qaowIISoPAqYPR/
	x2IHNyHqf9fmvzyGer+j2GBnAcNfrPYNwCDo8x4JrMiSUlrq8iBCZ9yoOAHOW7uePQK3uJ3SA4S
	drSowv2kvzdAlv5TLH99WneJ2pZuFX6PMZRYlhv8eo2Y1
X-Google-Smtp-Source: AGHT+IGj42mqy/iEvIKUu3jRPc+rqdSgYnxotL22HJWOhSuwD8p6KAWVIBVl06/8LKMxku3O6YmlCw==
X-Received: by 2002:a17:907:96a9:b0:b2d:d73:de59 with SMTP id a640c23a62f3a-b49c1280aa4mr897822866b.9.1759607922174;
        Sat, 04 Oct 2025 12:58:42 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4865f741f1sm751839866b.39.2025.10.04.12.58.41
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Oct 2025 12:58:41 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][scarthgap][PATCH] civetweb: patch CVE-2025-55763
Date: Sat,  4 Oct 2025 21:58:41 +0200
Message-ID: <20251004195841.3642844-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Oct 2025 19:58:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120240

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-55763

Pick the relevant commit from https://github.com/civetweb/civetweb/pull/1347/

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...w-in-directory-URI-slash-redirection.patch | 57 +++++++++++++++++++
 .../civetweb/civetweb_1.16.bb                 |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/civetweb/civetweb/0001-Fix-heap-overflow-in-directory-URI-slash-redirection.patch

diff --git a/meta-networking/recipes-connectivity/civetweb/civetweb/0001-Fix-heap-overflow-in-directory-URI-slash-redirection.patch b/meta-networking/recipes-connectivity/civetweb/civetweb/0001-Fix-heap-overflow-in-directory-URI-slash-redirection.patch
new file mode 100644
index 0000000000..667cb9c2f0
--- /dev/null
+++ b/meta-networking/recipes-connectivity/civetweb/civetweb/0001-Fix-heap-overflow-in-directory-URI-slash-redirection.patch
@@ -0,0 +1,57 @@
+From e5e639d42a94b2585fe5123cb123963c6f04c3f5 Mon Sep 17 00:00:00 2001
+From: krispybyte <krispybyte@proton.me>
+Date: Sat, 21 Jun 2025 23:33:50 +0300
+Subject: [PATCH] Fix heap overflow in directory URI slash redirection
+
+CVE: CVE-2025-55763
+
+Upstream-Status: Backport [https://github.com/civetweb/civetweb/pull/1347/commits/76e222bcb77ba8452e5da4e82ae6cecd499c25e0]
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/civetweb.c | 23 ++++++++++++++++++-----
+ 1 file changed, 18 insertions(+), 5 deletions(-)
+
+diff --git a/src/civetweb.c b/src/civetweb.c
+index 9e321edf..5452b36d 100644
+--- a/src/civetweb.c
++++ b/src/civetweb.c
+@@ -15242,7 +15242,6 @@ handle_request(struct mg_connection *conn)
+ 	/* 12. Directory uris should end with a slash */
+ 	if (file.stat.is_directory && ((uri_len = (int)strlen(ri->local_uri)) > 0)
+ 	    && (ri->local_uri[uri_len - 1] != '/')) {
+-
+ 		/* Path + server root */
+ 		size_t buflen = UTF8_PATH_MAX * 2 + 2;
+ 		char *new_path;
+@@ -15255,12 +15254,26 @@ handle_request(struct mg_connection *conn)
+ 			mg_send_http_error(conn, 500, "out or memory");
+ 		} else {
+ 			mg_get_request_link(conn, new_path, buflen - 1);
+-			strcat(new_path, "/");
++
++			size_t len = strlen(new_path);
++			if (len + 1 < buflen) {
++				new_path[len] = '/';
++				new_path[len + 1] = '\0';
++				len += 1;
++			}
++
+ 			if (ri->query_string) {
+-				/* Append ? and query string */
+-				strcat(new_path, "?");
+-				strcat(new_path, ri->query_string);
++				if (len + 1 < buflen) {
++					new_path[len] = '?';
++					new_path[len + 1] = '\0';
++					len += 1;
++				}
++
++				/* Append with size of space left for query string + null terminator */
++				size_t max_append = buflen - len - 1;
++				strncat(new_path, ri->query_string, max_append);
+ 			}
++
+ 			mg_send_http_redirect(conn, new_path, 301);
+ 			mg_free(new_path);
+ 		}
diff --git a/meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb b/meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb
index f5a699d5be..a546efca7b 100644
--- a/meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb
+++ b/meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb
@@ -8,6 +8,7 @@ SRCREV = "d7ba35bbb649209c66e582d5a0244ba988a15159"
 
 SRC_URI = "git://github.com/civetweb/civetweb.git;branch=master;protocol=https \
            file://0001-Unittest-Link-librt-and-libm-using-l-option.patch \
+           file://0001-Fix-heap-overflow-in-directory-URI-slash-redirection.patch \
            "
 
 S = "${WORKDIR}/git"

