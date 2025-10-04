Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31ECBCAC5B0
	for <webhook@archiver.kernel.org>; Sat,  4 Oct 2025 19:52:39 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web10.16302.1759607555864154665
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Oct 2025 12:52:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m1rn8otI;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-62fc2d92d34so7047986a12.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Oct 2025 12:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759607554; x=1760212354; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=vzl9pwpGFSQNUI/E/DFDZ3FsAsYIO+y3wqSUAiCcd3E=;
        b=m1rn8otIbjlQTkEgzF4RHzXIA+YR0ItfAAGYtjW1mGiz0Anp4XTuTyOJGKrl7zKgF1
         V2PlCdMunYWaG2hx2xBSkujIzLYGwXQvyGUVeQcVDUL9cAVLhgeajbO6eNz3DfG3aE/X
         8GX88hBkqoALmArGqMQBCBq4t2ayhgUWf150qRBCMRHZE75QjTqHzgAnFU23//6tkxhH
         2owlqUanVTppEqiNCzhg8u6rptrX9FD0BgW/frTKiZvqqxKR8CiTVVb2DXaATrmRB1ZP
         9FPVWxezJqyeTLw0QIjPpsOG8WtcpG0eUVgfGeozomm2cQdE+T5yZRsvTc1aKQZAdfyi
         BRaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759607554; x=1760212354;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vzl9pwpGFSQNUI/E/DFDZ3FsAsYIO+y3wqSUAiCcd3E=;
        b=RLtSKpZmUFbCJ7J2YWnVcK8QpHfTUAwW0s/YCqWD912xxsX9ZICRa51gQfEHrq2A7f
         Za7UG94cTPLg/VsXuErLs3vYjuYusRs7wXnl7sM5oY6WygVRs+UKal3YVDz4NpoNgfKw
         Y6CTsrCmA01sLYtOfXNZo6HQ9j3ax+hL4RWXdJThcvlw6u42ZU8cvoZo8p1DGY0kZV0+
         StO5v8KfEvbyJgOFi8EpGZSulRuu9V4dVt9G6MJWTOsN/yJhB9ko9Hp1mgetBwnvOW0z
         cncSA1/x1hh+wmyet+H2AH1V+ERYzP3PydDVp9Mkl3HPxmO5CvKHwzfUU7nkfLHTWWXA
         mkHw==
X-Gm-Message-State: AOJu0YzFTglT3lHRo4AgJtXaIKr2zo+NWF1HSoSaU7teqjXf51UfFUIV
	mQYy6P6VjOmpTGv1VuxC2iIsKZg0BR1RRVrPVbQliQ+9LgHQOR/FyP9vn4bboA==
X-Gm-Gg: ASbGnctl19nuNOvdobZi+znJl8krBa6RBpFsu14WpiIjyDvsNAp/2qEnkEQCKWEP2bg
	R9Ww8eaU6RSJEt2RH8iy2gYaoHvpPyMx58PRNPvW2zTbZULdWbRd/xtB2LYQfINUVnhcjCruBo2
	a9/z/2r+3ixQC+ByP3idVFdT3rC5WisG4Y6mX4DTF3oC3UZ/F71LeeSOKjLV+41KWNRexIwnwzZ
	/nNVXZ3RTgtvjHIPc57ZbzvGe+TugnaFeAFUBuolTR5rEo7OTuuO2TcZgJ4aePXLdFJWkl97CNm
	9y2MFYTao6EghouxXSdYor5yq82WKLEwc59R21p5LCQtGZhJjHhGn62MbTWHPPIMK4sryp6ZJN9
	Y0qx9upX7+X30C1rivdcYOHcJVc9RFuPLi4pPrfaCoY1J
X-Google-Smtp-Source: AGHT+IFgaG97u9xghOMCyAioQb+qbG3LDAiu5jebjudlbLoSkX3Nl0q3vJTWTCYC5iytFGb2Q0luoA==
X-Received: by 2002:a17:906:c14f:b0:b30:ed1f:894c with SMTP id a640c23a62f3a-b49c3f77bd6mr945621366b.43.1759607553970;
        Sat, 04 Oct 2025 12:52:33 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4869c4e5d8sm740349566b.82.2025.10.04.12.52.33
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Oct 2025 12:52:33 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][walnascar][PATCH] civetweb: patch CVE-2025-55763
Date: Sat,  4 Oct 2025 21:52:32 +0200
Message-ID: <20251004195232.3638956-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Oct 2025 19:52:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120239

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
index 0000000000..713e806643
--- /dev/null
+++ b/meta-networking/recipes-connectivity/civetweb/civetweb/0001-Fix-heap-overflow-in-directory-URI-slash-redirection.patch
@@ -0,0 +1,57 @@
+From e9cfe6edaa82fd9e2e010c8f1ff4df9ba093a56e Mon Sep 17 00:00:00 2001
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
index 4b08a44813..cfb6926866 100644
--- a/meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb
+++ b/meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb
@@ -8,6 +8,7 @@ SRCREV = "d7ba35bbb649209c66e582d5a0244ba988a15159"
 
 SRC_URI = "git://github.com/civetweb/civetweb.git;branch=master;protocol=https \
            file://0001-Unittest-Link-librt-and-libm-using-l-option.patch \
+           file://0001-Fix-heap-overflow-in-directory-URI-slash-redirection.patch \
            "
 
 S = "${WORKDIR}/git"

