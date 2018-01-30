Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 34ED660053
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Jan 2018 18:31:08 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id g14so18531390qti.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Jan 2018 10:31:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=d4PLyXNdmqbtx1uYd7q0Ex7iAE4G1bXGQ4pmePcifKE=;
	b=QvBbE0ZQviIEY7EFxgDv+ji9LStafbQTAlS+FDQ929IY8xxvMbEjWRy+Bi+fprtQ3t
	rzV7c/0Dp00qfIr4gCL5htVpqR+tapeohTGea/6Y008oOT1s9t7NtHlb2UNoUe5CSJ9c
	DDHc/eMFR/JeFqtA/C5DxtHTszy4FQltHx3JOQ2+E/Cc30GnEDdlQ14ylow56rB7njs9
	TqYWPboEuuDheGHDqtJyzUhQb9qGc4yw6XkpYgYYlIx8C0KdE2qLquEvBUjSQR2jVXUv
	J7DQiIMNzTcyskS7+3moWO/b2t0MGsIkeS3xnlhZSOfKIACGc9HCAG632dc1K+gk6JlG
	jnwA==
X-Gm-Message-State: AKwxytfo2rTZSJzivdrTKhXTy1Jt2EHbyLliX9CcqyjYk8wYIpEAw1++
	KJGSUYrwiHssq3YUV9aLGIXF1pTQ
X-Google-Smtp-Source: AH8x226zLxyi7yWFOTwzirp6dDer07Kwj0RoTnMChUoA5e3TV3au4Px29eus6QIMSe5zeGh1HDbjhQ==
X-Received: by 10.200.51.103 with SMTP id u36mr28915444qta.127.1517337069743; 
	Tue, 30 Jan 2018 10:31:09 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	m31sm11446420qtd.23.2018.01.30.10.31.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 30 Jan 2018 10:31:09 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 30 Jan 2018 13:30:58 -0500
Message-Id: <1517337058-21997-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-ndg-httpsclient: update to version 0.4.4
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
X-List-Received-Date: Tue, 30 Jan 2018 18:31:09 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-ndg-httpsclient.inc       | 4 ++--
 meta-python/recipes-devtools/python/python-ndg-httpsclient_0.4.4.bb  | 2 ++
 meta-python/recipes-devtools/python/python3-ndg-httpsclient_0.4.4.bb | 2 ++
 3 files changed, 6 insertions(+), 2 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-ndg-httpsclient_0.4.4.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-ndg-httpsclient_0.4.4.bb

diff --git a/meta-python/recipes-devtools/python/python-ndg-httpsclient.inc b/meta-python/recipes-devtools/python/python-ndg-httpsclient.inc
index 133cab1..b556432 100644
--- a/meta-python/recipes-devtools/python/python-ndg-httpsclient.inc
+++ b/meta-python/recipes-devtools/python/python-ndg-httpsclient.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "http://python-requests.org"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://MANIFEST.in;md5=ce22c0cd986d2de3f7073cd6b5523ae0"
 
-SRC_URI[md5sum] = "59a2f0a5b3b60e6c520a9cc7be9aff87"
-SRC_URI[sha256sum] = "7bfd8c5cfcbc241a93ca6a4e45f952650f5c7ecf7c49b1dbcf5f4d390240be0b"
+SRC_URI[md5sum] = "a0d349cf9530e331697a6e5ab1f40de6"
+SRC_URI[sha256sum] = "fba4d4798dcac2965874f24afb6631b4326baa4bd02505744d34f690c354856a"
 
 PYPI_PACKAGE = "ndg_httpsclient"
 
diff --git a/meta-python/recipes-devtools/python/python-ndg-httpsclient_0.4.4.bb b/meta-python/recipes-devtools/python/python-ndg-httpsclient_0.4.4.bb
new file mode 100644
index 0000000..ca0eb32
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-ndg-httpsclient_0.4.4.bb
@@ -0,0 +1,2 @@
+require python-ndg-httpsclient.inc
+inherit pypi setuptools
diff --git a/meta-python/recipes-devtools/python/python3-ndg-httpsclient_0.4.4.bb b/meta-python/recipes-devtools/python/python3-ndg-httpsclient_0.4.4.bb
new file mode 100644
index 0000000..3f07b2e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-ndg-httpsclient_0.4.4.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools3
+require python-ndg-httpsclient.inc
-- 
2.7.4


