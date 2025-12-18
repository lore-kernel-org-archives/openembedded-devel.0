Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06D92D6D227
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 13:47:05 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.42286.1766065623166023745
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Dec 2025 05:47:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=G3mId/B4;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47a95efd2ceso5747325e9.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Dec 2025 05:47:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766065621; x=1766670421; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=qTlZGZRqhK1a9ST/cDLzr46cZDY68Kxis22ymlILip4=;
        b=G3mId/B4aRj6UNM/kqEFJ1hIz/Va2fwTo1iYMAmG3kC85f4l2hGjkLPJ6XV4nyRnBl
         LxIq2IgKjnGdIcD0guwPZC55Y0Pa/e13176zThzvti44ZJ2kIexyimm3l2GaWGhMvR3C
         E2/9nNgvJgVbXR1ScmSzW6+Enkk3ODODIc2BUAn0YY31y+9jy/au3dly97x/YyXQJiW+
         WPX6nxUSDvOJRbfKpYlhGJ95pFtraK1lgltWPeRhlxGSpulgIDuizFw11CJzSnF/CU+d
         aZMJVirzvZ4w+hdOtJ9wPR5Ikt4aIjBfIRuDJvUybz0y5IVcdaRWPZEOwKcTfOo7naBR
         deNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766065621; x=1766670421;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qTlZGZRqhK1a9ST/cDLzr46cZDY68Kxis22ymlILip4=;
        b=Vyv/KfYxvcKIONFTluYKa6427YXyO25aGgpWwW2ez16v0vldvDLDx/H14o3V0ZCzwa
         JUweRPJIYyMIVtcMHSCja5OjjuorNXolesEjAGRgh18QvnhDN1ny8wPoVmwATXkPzPl/
         oKoxROXa5mU5E4AD7cJd74lJWkU3zgARUxrN1TSoTuOFYuN54jTwu0KVYPctPWFRz0AT
         r99NszTV8dcJYx7sikW0fx8XLUIQX9G9JE9nzSL2Q222XFTcojC7Vx9KrAGvKn64B09Y
         5YoWy1MVx7P00HrePzPhwlpuaG2tZaRnr7p7y1w/O7CXGamsuqXbdle6/aqlcCuFsAu0
         D+dw==
X-Gm-Message-State: AOJu0Yzd1QdML9wxnfI1NDlpaC9Q/5ZXdjt0NUs7weohzBRxNMg0PCt3
	2RAy0lBQG8wGIoPs4wxyW2fpVQvUkvf531b0nWmBe1P4bErjuQHoLF2fRYa6HA==
X-Gm-Gg: AY/fxX79i7rkJJTZG++DW/mEv1RaPp11KrqL1sQMqYXw+2XrnG2kbotiufZ7wSmG9SS
	L/q2iFH5sdd7VuuHWxqvba+CZLaXikJ6igZ0QLr3qOYWAx/7pTpCBOoTLTY0IESkpKmEpq6aazM
	5KQzAJdVP/enTBpVPgts5ZH9oqauep6atuk71wb0xpw1SeB0FeWEh6YNDrByDiXgFM3Llf/GgQc
	thc/53xdQNZ+MD01l+9GBRgSkRRvCgR8LBrh9SmB1lyV/MF/AqmTJLwswi5/uFJgDAqqw/eTbaY
	2jHcxkpHIRL+5rsSHbwHqBYwK5vc8LvuEpO1qsBLMGCxcv07J7yJlLU+XXh4utINMtok9yl7El6
	J2XujVgXA8gM+iBlVM10b87bBy2Njs4CX/OS8VscYPmucjGxBFO+itgAxpOTMRwSgLzqn15KQsH
	InfPJtNII9
X-Google-Smtp-Source: AGHT+IH9KzsRsId+OqBC1E7RlTyEAifUe8xWaXF9NpP1eYgfZt1QSiQ3igoeSn8Mh6eQP7hvwZibHw==
X-Received: by 2002:a05:600c:1c1a:b0:477:755b:5587 with SMTP id 5b1f17b1804b1-47a8f89b8b5mr255004805e9.8.1766065621206;
        Thu, 18 Dec 2025 05:47:01 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324493fda5sm5272239f8f.17.2025.12.18.05.47.00
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 05:47:00 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-webserver][kirkstone][PATCH 1/4] cherokee: patch CVE-2020-12845
Date: Thu, 18 Dec 2025 14:46:57 +0100
Message-ID: <20251218134700.3509105-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Dec 2025 13:47:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122764

Details: https://nvd.nist.gov/vuln/detail/CVE-2020-12845

Pick the merge commit that mentions the vulnerability.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../cherokee/cherokee/CVE-2020-12845.patch    | 195 ++++++++++++++++++
 .../recipes-httpd/cherokee/cherokee_git.bb    |   1 +
 2 files changed, 196 insertions(+)
 create mode 100644 meta-webserver/recipes-httpd/cherokee/cherokee/CVE-2020-12845.patch

diff --git a/meta-webserver/recipes-httpd/cherokee/cherokee/CVE-2020-12845.patch b/meta-webserver/recipes-httpd/cherokee/cherokee/CVE-2020-12845.patch
new file mode 100644
index 0000000000..864cfd0a87
--- /dev/null
+++ b/meta-webserver/recipes-httpd/cherokee/cherokee/CVE-2020-12845.patch
@@ -0,0 +1,195 @@
+From dab30272a2fc72f69542a6ae2d6d63de875574cb Mon Sep 17 00:00:00 2001
+From: Stefan de Konink <stefan@konink.de>
+Date: Sat, 25 Jul 2020 22:17:13 +0200
+Subject: [PATCH] Fix CVE-2020-12845 (#1243)
+
+* Implement tests for CVE-2020-12845
+
+Can be manually reproduced by:
+curl -H "Authorization: Basic " -X GET url
+curl -H "Authorization: Digest " -X GET url
+
+* Don't process empty input for cherokee_buffer_decode_base64
+* Don't process empty input for cherokee_validator_parse_basic and cherokee_validator_parse_digest
+* Guard empty input in get_authorization to resolve CVE-2020-12845
+
+Thanks Patrik Lantz from F-Secure for reporting this issue!
+
+CVE: CVE-2020-12845
+Upstream-Status: Backport [https://github.com/cherokee/webserver/commit/51f13b9535e652421c128ef541371854637ac32e]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ cherokee/buffer.c             |  3 +++
+ cherokee/connection.c         |  5 +++++
+ cherokee/validator.c          | 14 ++++++++++++++
+ qa/310-Authorization-empty.py | 35 +++++++++++++++++++++++++++++++++++
+ qa/311-Authorization-empty.py | 33 +++++++++++++++++++++++++++++++++
+ qa/Makefile.am                |  4 +++-
+ 6 files changed, 93 insertions(+), 1 deletion(-)
+ create mode 100644 qa/310-Authorization-empty.py
+ create mode 100644 qa/311-Authorization-empty.py
+
+diff --git a/cherokee/buffer.c b/cherokee/buffer.c
+index d93c1638..2b07ceb3 100644
+--- a/cherokee/buffer.c
++++ b/cherokee/buffer.c
+@@ -1643,6 +1643,9 @@ cherokee_buffer_decode_base64 (cherokee_buffer_t *buf)
+ 			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1   /* F0-FF */
+ 		};
+ 
++	if (unlikely(buf == NULL || buf->len == 0))
++		return ret_ok;
++
+ 	for (i=0; i < buf->len; i++) {
+ 		d = b64_decode_tab[(int) buf->buf[i]];
+ 		if (d != -1) {
+diff --git a/cherokee/connection.c b/cherokee/connection.c
+index 0b790282..e11c01c3 100644
+--- a/cherokee/connection.c
++++ b/cherokee/connection.c
+@@ -1895,6 +1895,11 @@ get_authorization (cherokee_connection_t *conn,
+ 	ptr += pre_len;
+ 	ptr_len -= pre_len;
+ 
++	/* Guard authentication string
++	 */
++	if (ptr_len == 0)
++		return ret_error;
++
+ 	/* Parse the request
+ 	 */
+ 	switch (conn->req_auth_type) {
+diff --git a/cherokee/validator.c b/cherokee/validator.c
+index 8b02b698..f227a813 100644
+--- a/cherokee/validator.c
++++ b/cherokee/validator.c
+@@ -125,6 +125,11 @@ cherokee_validator_parse_basic (cherokee_validator_t *validator, char *str, cuin
+ 	char              *colon;
+ 	cherokee_buffer_t  auth = CHEROKEE_BUF_INIT;
+ 
++	/* Guard empty input
++	 */
++	if (unlikely(str == NULL || str_len == 0))
++		goto error;
++
+ 	/* Decode base64
+ 	 */
+ 	cherokee_buffer_add (&auth, str, str_len);
+@@ -166,6 +171,11 @@ cherokee_validator_parse_digest (cherokee_validator_t *validator,
+ 	cherokee_buffer_t   auth = CHEROKEE_BUF_INIT;
+ 	cherokee_buffer_t  *entry_buf;
+ 
++	/* Guard empty input
++	 */
++	if (unlikely(str == NULL || str_len == 0))
++		goto error;
++
+ 	/* Copy authentication string
+ 	 */
+ 	cherokee_buffer_add (&auth, str, str_len);
+@@ -260,6 +270,10 @@ cherokee_validator_parse_digest (cherokee_validator_t *validator,
+ 	 */
+ 	cherokee_buffer_mrproper (&auth);
+ 	return ret_ok;
++
++error:
++	cherokee_buffer_mrproper (&auth);
++	return ret_error;
+ }
+ 
+ 
+diff --git a/qa/310-Authorization-empty.py b/qa/310-Authorization-empty.py
+new file mode 100644
+index 00000000..ef2f8d24
+--- /dev/null
++++ b/qa/310-Authorization-empty.py
+@@ -0,0 +1,35 @@
++import base64
++
++from conf import *
++from base import *
++
++MAGIC        = "Cherokee supports old crypt password hashes"
++REALM        = "realm"
++USER         = "username"
++PASSWD       = "alo"
++
++CONF = """
++vserver!1!rule!3100!match = directory
++vserver!1!rule!3100!match!directory = /htpasswd_plain_empty
++vserver!1!rule!3100!match!final = 0
++vserver!1!rule!3100!auth = htpasswd
++vserver!1!rule!3100!auth!methods = basic
++vserver!1!rule!3100!auth!realm = %s
++vserver!1!rule!3100!auth!passwdfile = %s
++"""
++
++class Test (TestBase):
++    def __init__ (self):
++        TestBase.__init__ (self, __file__)
++
++        self.name             = "Authorization: Basic empty"
++        self.expected_error   = 401
++        self.request          = "GET /htpasswd_plain_empty/file HTTP/1.0\r\n" + \
++                                "Authorization: Basic \r\n"
++
++    def Prepare (self, www):
++        tdir  = self.Mkdir (www, "htpasswd_plain_empty")
++        passf = self.WriteFile (tdir, "passwd", 0444, '%s:%s\n' %(USER, PASSWD))
++        self.WriteFile (tdir, "file", 0444, MAGIC)
++
++        self.conf = CONF % (REALM, passf)
+diff --git a/qa/311-Authorization-empty.py b/qa/311-Authorization-empty.py
+new file mode 100644
+index 00000000..017fe036
+--- /dev/null
++++ b/qa/311-Authorization-empty.py
+@@ -0,0 +1,33 @@
++import base64
++
++from base import *
++
++MAGIC  = "Don't show this"
++
++CONF = """
++vserver!1!rule!3110!match = directory
++vserver!1!rule!3110!match!directory = /digest_empty_1
++vserver!1!rule!3110!match!final = 0
++vserver!1!rule!3110!auth = plain
++vserver!1!rule!3110!auth!methods = digest
++vserver!1!rule!3110!auth!realm = Test is the realm
++vserver!1!rule!3110!auth!passwdfile = %s
++"""
++
++class Test (TestBase):
++    def __init__ (self):
++        TestBase.__init__ (self, __file__)
++        self.name = "Authorization: Digest empty"
++
++        self.request          = "GET /digest_empty_1/file HTTP/1.0\r\n" + \
++                                "Authorization: Digest \r\n"
++        self.expected_error   = 401
++        self.expected_content = [ "WWW-Authenticate: Digest", "qop=", "algorithm=" ]
++        self.forbiden_content = MAGIC
++
++    def Prepare (self, www):
++        tdir = self.Mkdir (www, "digest_empty_1")
++        self.WriteFile (tdir, "file", 0444, MAGIC)
++        passfile = self.WriteFile (tdir, ".passwd", 0444, "user:password\n")
++
++        self.conf = CONF % (passfile)
+diff --git a/qa/Makefile.am b/qa/Makefile.am
+index 5cdaf4d6..e5bd42ce 100644
+--- a/qa/Makefile.am
++++ b/qa/Makefile.am
+@@ -326,7 +326,9 @@ run-tests.py \
+ 302-DirIndex3.py \
+ 304-Dirlist-TransferEncoding.py \
+ 305-Error-ContentLength.py \
+-306-NoContent-keepalive.py
++306-NoContent-keepalive.py \
++310-Authorization-empty.py \
++311-Authorization-empty.py
+ 
+ if USE_OPENSSL
+ ssl-keys/set-1.pem: ssl-keys/set-1.key openssl.cnf
diff --git a/meta-webserver/recipes-httpd/cherokee/cherokee_git.bb b/meta-webserver/recipes-httpd/cherokee/cherokee_git.bb
index 7100ef4341..a3d871555f 100644
--- a/meta-webserver/recipes-httpd/cherokee/cherokee_git.bb
+++ b/meta-webserver/recipes-httpd/cherokee/cherokee_git.bb
@@ -16,6 +16,7 @@ SRC_URI = "git://github.com/cherokee/webserver;branch=master;protocol=https \
            file://0001-configure.ac-Add-foreign-to-AM_INIT_AUTOMAKE.patch \
            file://0001-make-Do-not-build-po-files.patch \
            file://0001-common-internal.h-Define-LLONG_MAX-if-undefined.patch \
+           file://CVE-2020-12845.patch \
 "
 
 S = "${WORKDIR}/git"

