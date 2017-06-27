Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f41.google.com (mail-pg0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id BD35D71999
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jun 2017 05:57:20 +0000 (UTC)
Received: by mail-pg0-f41.google.com with SMTP id u62so10620902pgb.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jun 2017 22:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=2pgxKeOEoVa5VDsyQikgJsMYI5Hi5Q050TqJ8YlleLQ=;
	b=SMeHpHYrGWCFHjWYZWQBO5QKx20hc5edHOexsl4nLH50vlgmCfvbikByD6v0LqBNTT
	p6Mvjpka3pP10jz2IsCobTgWL+DUR8yvNtx+VPAVmgApIThkOyMSo+7JFYV8VM59rBfY
	++VBYrYuu02mElR32rVE1SMpmroLtm7u5UXvYHMITDtPZH2SypnslwbFkllhA1bOoPj2
	wBS7CXIIrmwBSVvM+1HT2LCU9YmFMpOUIn7TxilLOhKHHO6MUDIAvIHVKaNeXARhDovJ
	+t3I3XSzOG1rHAKsFtsxVKLTqVXQAwbc3D+Y7r/4BrHVGhPKmI7/nKu/VtMEUhGqu6iP
	owJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=2pgxKeOEoVa5VDsyQikgJsMYI5Hi5Q050TqJ8YlleLQ=;
	b=TB3VmD6b4Lwi+RBBofKpbXdfDcf0Ns7CgnzW/Czsb3oBawolhBpzDBfW315+qh0rLr
	s4E0r7floDwVohoMqMJJLXa9Dy6J9kPbxvCKLu2iw/UhYIa3icKjaWvlRLwpIuhanmmx
	7j5G8FBtUoaM1PiIJaSOiNTtKB6j34wMasSSrHmtcxQEgEcS62JkZ3/4kYNFriLaq3TG
	3rXzu5eYm35HceL4BuwKlNm6iAsbJSXAkdxgkWQZBpcBRXSykyGKp8sYVTSYojKr70rF
	9KC9BpRKHLPoy2qLwRu6rxVQKc8N7ETYrdzeAobSbi96GzvEBbh3h5a6XPqLKXWPIM9h
	nYAA==
X-Gm-Message-State: AKS2vOyWdTl5ZClyq/2xfSIi+W2AJKxVmbmKBoNs+Ntq15fcRQMg7F9V
	hxZYgYu1/YrDDLlZ
X-Received: by 10.84.232.72 with SMTP id f8mr3907328pln.87.1498543041335;
	Mon, 26 Jun 2017 22:57:21 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id
	h123sm2929327pgc.36.2017.06.26.22.57.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Jun 2017 22:57:19 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 Jun 2017 22:57:09 -0700
Message-Id: <20170627055709.26136-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170627055709.26136-1-raj.khem@gmail.com>
References: <20170627055709.26136-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 2/2] rdate: Fix build with hardening
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
X-List-Received-Date: Tue, 27 Jun 2017 05:57:21 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-src-rdate-Fix-printf-format-errors.patch  | 33 ++++++++++++++++++++++
 .../recipes-connectivity/rdate/rdate_1.5.bb        |  4 ++-
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-connectivity/rdate/rdate/0001-src-rdate-Fix-printf-format-errors.patch

diff --git a/meta-networking/recipes-connectivity/rdate/rdate/0001-src-rdate-Fix-printf-format-errors.patch b/meta-networking/recipes-connectivity/rdate/rdate/0001-src-rdate-Fix-printf-format-errors.patch
new file mode 100644
index 000000000..2f6518984
--- /dev/null
+++ b/meta-networking/recipes-connectivity/rdate/rdate/0001-src-rdate-Fix-printf-format-errors.patch
@@ -0,0 +1,33 @@
+From f58bcb43c31d08de58853b088681cbe4df36cbf9 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 26 Jun 2017 22:50:56 -0700
+Subject: [PATCH] src/rdate: Fix printf format errors
+
+Fixes
+
+rdate.c:85:41: error: format not a string literal and no format arguments [-Werror=format-security]
+|    syslog(is_error?LOG_WARNING:LOG_INFO, buf);
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Submitted
+
+ src/rdate.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/rdate.c b/src/rdate.c
+index 5c3e829..943d481 100644
+--- a/src/rdate.c
++++ b/src/rdate.c
+@@ -82,7 +82,7 @@ write_log(int is_error, char *format, ...)
+ 		return; /* Error, which we can't report because this _is_ the error
+ 				reporting mechanism */
+ 	if(log_mode)
+-		syslog(is_error?LOG_WARNING:LOG_INFO, buf);
++		syslog(is_error?LOG_WARNING:LOG_INFO, "%s", buf);
+ 	if(is_error || print_mode)
+ 		fprintf(is_error?stderr:stdout, "%s: %s\n", argv0, buf);
+ }
+-- 
+2.13.2
+
diff --git a/meta-networking/recipes-connectivity/rdate/rdate_1.5.bb b/meta-networking/recipes-connectivity/rdate/rdate_1.5.bb
index 818f16a52..b3af9275e 100644
--- a/meta-networking/recipes-connectivity/rdate/rdate_1.5.bb
+++ b/meta-networking/recipes-connectivity/rdate/rdate_1.5.bb
@@ -11,7 +11,9 @@ SECTION = "Applications/System"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
-SRC_URI= "https://www.aelius.com/njh/${BPN}/${BP}.tar.gz"
+SRC_URI = "https://www.aelius.com/njh/${BPN}/${BP}.tar.gz \
+           file://0001-src-rdate-Fix-printf-format-errors.patch \
+           "
 SRC_URI[md5sum] = "0a4f612480777fdf25264ac03c57eae6"
 SRC_URI[sha256sum] = "6e800053eaac2b21ff4486ec42f0aca7214941c7e5fceedd593fa0be99b9227d"
 
-- 
2.13.2


