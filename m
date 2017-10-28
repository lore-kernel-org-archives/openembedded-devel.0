Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 3054771971
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Oct 2017 12:36:19 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id x82so11263641qkb.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Oct 2017 05:36:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=V+CURl4/uPFiZDaBu0HaZNDmCIqSN0ZYwb221MXzwjg=;
	b=GuUK5wIg/s/yL5koMPMY2z0EQwS5WhF2NzlkxiFbPY2W28yZ5cefZtwmwsOuN+ObSA
	EXRccXS53sm016VmMdc3k9+fctl39kNCIsSPDggj/vSLacZzDFPCGcfNIFWPyE/m1iKW
	s5b1jaU7Hq+ifY4GtAuaN0Qf5yUoVIKwCUNYLl8Ut/X6Np+a4qB9Mxd3YJb/Z8OeidzW
	gR9s5N+e5Iz2hsKbpBOo8hsSPlEPbS2i9Nj7k13NlxLU5XeqVjzKMQirj+LfozTrDXc5
	ncbb48YWP/+Ju82FAf6TEJCI5ZgDFxIC5MCjppnfnrqeFnVVeNrmx4xNrZjdgxH41e1B
	ijIQ==
X-Gm-Message-State: AMCzsaWDO/HT7AISZTpnRubpHuJnr8wH+yWJHiDUrXWBvA68aV+Qt5Xr
	IyM7qSBZ3n+20kAy8VxvlHba8Ewn
X-Google-Smtp-Source: ABhQp+QGX1JH8SGUiiGUnbfP/G6aF51NMqyaKkgXOe+hMv84lOz1GBIgqErI6/JhhfM6QksIUsWtPA==
X-Received: by 10.55.119.70 with SMTP id s67mr4926944qkc.294.1509194180662;
	Sat, 28 Oct 2017 05:36:20 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id
	f126sm2012420qkd.20.2017.10.28.05.36.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 28 Oct 2017 05:36:19 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 28 Oct 2017 08:35:54 -0400
Message-Id: <1509194155-22009-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-webserver][PATCH 1/2] nginx: update stable version to 1.12.2
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
X-List-Received-Date: Sat, 28 Oct 2017 12:36:20 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-webserver/recipes-httpd/nginx/nginx_1.12.1.bb | 6 ------
 meta-webserver/recipes-httpd/nginx/nginx_1.12.2.bb | 6 ++++++
 2 files changed, 6 insertions(+), 6 deletions(-)
 delete mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.12.1.bb
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.12.2.bb

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.12.1.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.12.1.bb
deleted file mode 100644
index 7f0e3ad..0000000
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.12.1.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require nginx.inc
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=903753de5f86a1ee0341fd2f9491b282"
-
-SRC_URI[md5sum] = "a307e74aca95403e5ee00f153807ce58"
-SRC_URI[sha256sum] = "8793bf426485a30f91021b6b945a9fd8a84d87d17b566562c3797aba8fac76fb"
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.12.2.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.12.2.bb
new file mode 100644
index 0000000..85ad29b
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.12.2.bb
@@ -0,0 +1,6 @@
+require nginx.inc
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=903753de5f86a1ee0341fd2f9491b282"
+
+SRC_URI[md5sum] = "4d2fc76211435f029271f1cf6d7eeae3"
+SRC_URI[sha256sum] = "305f379da1d5fb5aefa79e45c829852ca6983c7cd2a79328f8e084a324cf0416"
-- 
2.7.4


