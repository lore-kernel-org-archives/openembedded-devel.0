Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id 53FD07F899
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Nov 2019 18:10:58 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id b1so16024448pgq.10
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Nov 2019 10:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=NBvfkIZ/hLQmEuK59Tx553Husva2RgD4trFz0zu7aSE=;
	b=qi7X/v/pf6pxtT2kIcZnygusb2OqGb3s/puoVh8zHyYeZj+xX4bdcs1H892x4Kdose
	GGo99jBDMEJ8I0DbIw0UzSOKpmPvL1ZCF6/TPmGn6/r4RAe3fLX7D+UEBZzdjEwX4pd3
	cW59wXiBpDOcL2KdUz6NbR1Sjr4g74bMZEcUwn6eVxW5I/94kkWl9RC1yPqgW9I8rGRx
	e7eyiMOcFVKH3XxcvEgipWYjj2EPqmZJ0J7LiyhHnTGmjhL95dQ30nlblLk2vHkmEejs
	FncT+E8L778RxECl2B0RZ536Ea/f0ocJZRAqYyu8AkadgIXka2NEdMFHVRW+bzfbeoFN
	ENVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=NBvfkIZ/hLQmEuK59Tx553Husva2RgD4trFz0zu7aSE=;
	b=gb4ooZfz6OwryFSIDzeb4gjwE8ICZlqX9PyAxJcxrnHGUlE+TEX6U7QAaelMmOZk8i
	f9E6sDgKM6epZcpLbI3jTm7t9CG2nq7AaoTHocD2WqhWLedVyZ8KM0KwnlLQ6thJcGlU
	JLD4fvZ1TBxraDeZHHDG9gLTnfOeKxew6OA29gzrA9hoLkcXANnuyokx5hwzzRsuZnZD
	kBruXqSDu0Ul95X47WUtAmThT7XUWy6lOcA0WvNo3I7SeN0XYJj4QZqS9O2MifXOwWJy
	NiDAdQqYWkRF7/Loip8Do3EhGf1fDbB+sfw3/ct0ZcDCSxZtCv7RJstiz8ckMa/bMck6
	7v4A==
X-Gm-Message-State: APjAAAWsAy6bdCyjf73+bOgNR6E5SNIrqgDWNkLwDBWvn3/jPG1KcaCg
	7Jg6N9IwUQp6bxhSTVwZk99/rcZ8
X-Google-Smtp-Source: APXvYqwWoMtuf2rRXw0l7Qent5/qaPnIGBGx4pa1c7cqw5ANBvuo4Y8OiyjUVVOnFCmB5rhtDDJ/7w==
X-Received: by 2002:aa7:9d87:: with SMTP id f7mr3514872pfq.138.1575137459100; 
	Sat, 30 Nov 2019 10:10:59 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:c050:b516:8fc6:8cbf])
	by smtp.gmail.com with ESMTPSA id d6sm490762pju.8.2019.11.30.10.10.58
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 30 Nov 2019 10:10:58 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 30 Nov 2019 10:10:41 -0800
Message-Id: <b784eca9a065d839bcc07487a0ad30eb854dd4aa.1575137343.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1575137343.git.akuster808@gmail.com>
References: <cover.1575137343.git.akuster808@gmail.com>
Subject: [PATCH 11/15] rsyslog: upgrade from v8.1908.0 to v8.1910.0
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
X-List-Received-Date: Sat, 30 Nov 2019 18:10:58 -0000

From: Trevor Gamblin <trevor.gamblin@windriver.com>

Upgrade rsyslog to latest version for various
fixes including the following CVEs:

CVE: CVE-2019-17040
CVE: CVE-2019-17041

Backported patches for those fixes were removed since
they are contained in v8.1910.0.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
[Bug fix only
https://www.adiscon.com/news/rsyslog-8-1910-0-released/]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../rsyslog/rsyslog/0001-Out-of-bounds-issue.patch | 31 ----------------
 ...rwardedfrom-bugfix-potential-misadressing.patch | 43 ----------------------
 .../{rsyslog_8.1908.0.bb => rsyslog_8.1910.0.bb}   |  6 +--
 3 files changed, 2 insertions(+), 78 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/rsyslog/rsyslog/0001-Out-of-bounds-issue.patch
 delete mode 100644 meta-oe/recipes-extended/rsyslog/rsyslog/0001-pmaixforwardedfrom-bugfix-potential-misadressing.patch
 rename meta-oe/recipes-extended/rsyslog/{rsyslog_8.1908.0.bb => rsyslog_8.1910.0.bb} (96%)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/0001-Out-of-bounds-issue.patch b/meta-oe/recipes-extended/rsyslog/rsyslog/0001-Out-of-bounds-issue.patch
deleted file mode 100644
index b494ca6..0000000
--- a/meta-oe/recipes-extended/rsyslog/rsyslog/0001-Out-of-bounds-issue.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From b0894088b680666035a3418326e13bc99d4fed49 Mon Sep 17 00:00:00 2001
-From: Philippe Duveau <pduveau@users.noreply.github.com>
-Date: Tue, 24 Sep 2019 20:45:25 +0200
-Subject: [PATCH] Out of bounds issue
-
-Add a new sanity check after determining the level len.
----
- contrib/pmdb2diag/pmdb2diag.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-Upstream-Status: Backport [https://github.com/rsyslog/rsyslog/commit/b0894088b6]
-CVE: CVE-2019-17040
-Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
-diff --git a/contrib/pmdb2diag/pmdb2diag.c b/contrib/pmdb2diag/pmdb2diag.c
-index 2b5916301..5810eb4df 100644
---- a/contrib/pmdb2diag/pmdb2diag.c
-+++ b/contrib/pmdb2diag/pmdb2diag.c
-@@ -134,6 +134,10 @@ CODESTARTparse2
- 		ABORT_FINALIZE(0);
- 	}
- 
-+	/* let recheck with the real level len */
-+	if(pMsg->iLenRawMsg - (int)pMsg->offAfterPRI < pInst->levelpos+lvl_len)
-+		ABORT_FINALIZE(RS_RET_COULD_NOT_PARSE);
-+
- 	DBGPRINTF("db2parse Level %d\n", pMsg->iSeverity);
- 
- 	end = (char*)pMsg->pszRawMsg + pMsg->iLenRawMsg ;
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/0001-pmaixforwardedfrom-bugfix-potential-misadressing.patch b/meta-oe/recipes-extended/rsyslog/rsyslog/0001-pmaixforwardedfrom-bugfix-potential-misadressing.patch
deleted file mode 100644
index 0b32766..0000000
--- a/meta-oe/recipes-extended/rsyslog/rsyslog/0001-pmaixforwardedfrom-bugfix-potential-misadressing.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 10549ba915556c557b22b3dac7e4cb73ad22d3d8 Mon Sep 17 00:00:00 2001
-From: Rainer Gerhards <rgerhards@adiscon.com>
-Date: Fri, 27 Sep 2019 13:36:02 +0200
-Subject: [PATCH] pmaixforwardedfrom bugfix: potential misadressing
-
----
- contrib/pmaixforwardedfrom/pmaixforwardedfrom.c | 9 +++++++++
- 1 file changed, 9 insertions(+)
-
-Upstream-Status: Backport [https://github.com/rsyslog/rsyslog/pull/3884]
-CVE: CVE-2019-17041
-Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
-
-diff --git a/contrib/pmaixforwardedfrom/pmaixforwardedfrom.c b/contrib/pmaixforwardedfrom/pmaixforwardedfrom.c
-index 37157c7d4..ebf12ebbe 100644
---- a/contrib/pmaixforwardedfrom/pmaixforwardedfrom.c
-+++ b/contrib/pmaixforwardedfrom/pmaixforwardedfrom.c
-@@ -109,6 +109,10 @@ CODESTARTparse
- 	/* bump the message portion up by skipLen(23 or 5) characters to overwrite the "Message forwarded from
- " or "From " with the hostname */
- 	lenMsg -=skipLen;
-+	if(lenMsg < 2) {
-+		dbgprintf("not a AIX message forwarded from message has nothing after header\n");
-+		ABORT_FINALIZE(RS_RET_COULD_NOT_PARSE);
-+	}
- 	memmove(p2parse, p2parse + skipLen, lenMsg);
- 	*(p2parse + lenMsg) = '\n';
- 	*(p2parse + lenMsg + 1)  = '\0';
-@@ -120,6 +124,11 @@ really an AIX log, but has a similar preamble */
- 		--lenMsg;
- 		++p2parse;
- 	}
-+	if (lenMsg < 1) {
-+		dbgprintf("not a AIX message forwarded from message has nothing after colon "
-+			"or no colon at all\n");
-+		ABORT_FINALIZE(RS_RET_COULD_NOT_PARSE);
-+	}
- 	if (lenMsg && *p2parse != ':') {
- 	DBGPRINTF("not a AIX message forwarded from mangled log but similar enough that the preamble has "
- 		"been removed\n");
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.1908.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.1910.0.bb
similarity index 96%
rename from meta-oe/recipes-extended/rsyslog/rsyslog_8.1908.0.bb
rename to meta-oe/recipes-extended/rsyslog/rsyslog_8.1910.0.bb
index f9e4442..f50f9a3 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.1908.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.1910.0.bb
@@ -23,16 +23,14 @@ SRC_URI = "http://www.rsyslog.com/download/files/download/rsyslog/${BPN}-${PV}.t
            file://rsyslog.logrotate \
            file://use-pkgconfig-to-check-libgcrypt.patch \
            file://run-ptest \
-           file://0001-Out-of-bounds-issue.patch \
-           file://0001-pmaixforwardedfrom-bugfix-potential-misadressing.patch \
 "
 
 SRC_URI_append_libc-musl = " \
     file://0001-Include-sys-time-h.patch \
 "
 
-SRC_URI[md5sum] = "6e9aa4ef4cad8ae49affa0a786cc9e2f"
-SRC_URI[sha256sum] = "f8c8e53b651e03a011667c60bd2d4dba7a7cb6ec04b247c8ea8514115527863b"
+SRC_URI[md5sum] = "6d4d94359d083f449f089b8dbb93c423"
+SRC_URI[sha256sum] = "0219ee692f31a39743acb62aaf4196b644ce94edf386df4605fd6a11a4fe0c93"
 
 UPSTREAM_CHECK_URI = "https://github.com/rsyslog/rsyslog/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
-- 
2.7.4


