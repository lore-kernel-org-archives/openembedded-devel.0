Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id 0DF567740F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Dec 2016 01:58:26 +0000 (UTC)
Received: by mail-qk0-f172.google.com with SMTP id q68so100643077qki.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Dec 2016 17:58:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=6QZaH9OdBenJUARYzeCfdM1O59+kSyqPd6PAkZ/WXaI=;
	b=bkQE9NtIwKGZMRwGyCx0/sRsXb2m8xqr6JRa0YAKbvR+oFS42E07Ctt1coPdfAyYrz
	YUxLfMZplX/s2lW7/rwt8UUr9azIALV0eRs/6GGYoVSiZ0dtldimQfmHrGn9Yvk0DnMI
	/urSru55BTm5eJICGDvDl2m5Uli1DE5oYAK+g6Uq6WXeEQB8KwIzACcDxkhvnCgf+3Nk
	5geXBBJSGcDlTNfqMeUdEw4mLdCSM1xxOEYS7b34ApU1mu+dGFwS1WXO0iNqkhnz/K4L
	xFQIxTMg2LzKtpmjeszY4io7ix1V5OOqAeYHuk9aRGB1PyX+KSq7z71rz2kqn+mOrR9Y
	Lwcg==
X-Gm-Message-State: AIkVDXIHs1Qm8SSFBDDOszFvJizTQ6NBsQxmBqUOrEYZv/psmWq73WBKkmeAMp/i6RdTFA==
X-Received: by 10.55.128.3 with SMTP id b3mr7769932qkd.130.1482371907638;
	Wed, 21 Dec 2016 17:58:27 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-457cd903.dyn.optonline.net.
	[69.124.217.3]) by smtp.gmail.com with ESMTPSA id
	p28sm16926718qtb.31.2016.12.21.17.58.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 21 Dec 2016 17:58:26 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Dec 2016 20:58:17 -0500
Message-Id: <1482371897-14010-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-webcolors: update to version 1.7
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
X-List-Received-Date: Thu, 22 Dec 2016 01:58:27 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-webcolors.inc       | 10 +++++++---
 .../{python-webcolors_1.5.bb => python-webcolors_1.7.bb}       |  0
 .../{python3-webcolors_1.5.bb => python3-webcolors_1.7.bb}     |  0
 3 files changed, 7 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-webcolors_1.5.bb => python-webcolors_1.7.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-webcolors_1.5.bb => python3-webcolors_1.7.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-webcolors.inc b/meta-python/recipes-devtools/python/python-webcolors.inc
index ae91c62..fe1ab95 100644
--- a/meta-python/recipes-devtools/python/python-webcolors.inc
+++ b/meta-python/recipes-devtools/python/python-webcolors.inc
@@ -1,8 +1,12 @@
 SUMMARY = "Simple Python module for working with HTML/CSS color definitions."
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=0c764ddee13cfbe0564c201d76ff19d6"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=358df7e9eb65e1843dbb36abd476c5c0"
 
-SRC_URI[md5sum] = "2e9da1bbb7a087c6108e05be64640afb"
-SRC_URI[sha256sum] = "b3b1c3a41e9c69d1982b76b6531239115519f91cc034a24e975749832dc51b8e"
+SRC_URI[md5sum] = "4733fa1077f680bbdd918cdef1e32c11"
+SRC_URI[sha256sum] = "e47e68644d41c0b1f1e4d939cfe4039bdf1ab31234df63c7a4f59d4766487206"
+
+RDEPENDS_${PN}_class-target = "\
+    ${PYTHON_PN}-stringold \
+"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-webcolors_1.5.bb b/meta-python/recipes-devtools/python/python-webcolors_1.7.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-webcolors_1.5.bb
rename to meta-python/recipes-devtools/python/python-webcolors_1.7.bb
diff --git a/meta-python/recipes-devtools/python/python3-webcolors_1.5.bb b/meta-python/recipes-devtools/python/python3-webcolors_1.7.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-webcolors_1.5.bb
rename to meta-python/recipes-devtools/python/python3-webcolors_1.7.bb
-- 
2.7.4


