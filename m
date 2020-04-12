Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web11.13045.1586703822391650343
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Apr 2020 08:03:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=VdtJUbC7;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id 6A43F60388;
	Sun, 12 Apr 2020 17:03:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1586703820;
	bh=ovVUU0ggb/sYs+/31LO9IwvvbWMrkSZBOcXB5us3bec=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VdtJUbC7rmLhDzwB616X7jinSM8JuPR8NRqupwSqgvcO6UPudbBSdPcjzn4IrRrIo
	 KlIo6hQiSqkvYv9I8/btSBVHI7kxsnpK1MgOSI+BnZ8Y8rzadyqJjvKdh3yRmavqwm
	 kb/Ox3muCmW2MiuMM8K8KIEBmYgpqd5bg2mG0PpFhsfqR9R9OIqFUzARAuScZUf0gR
	 +yepwyWOkctloqCJdOedZqxhUS5XECptR5n7JqBiHVx8SfhWV9TYNd9lIDiT++CrvN
	 j/Ya/SK05gOaBPorP+2vb+fgR7SVx9SLIqzz664imOLZKEq7zFp1WhyLZU8rZhLSee
	 i6pz805MhVfaw==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [meta-python][PATCH 3/5] python3-msgpack: consolidate into a single file
Date: Sun, 12 Apr 2020 17:03:32 +0200
Message-Id: <1586703814-15536-3-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586703814-15536-1-git-send-email-pjtexier@koncepto.io>
References: <1586703814-15536-1-git-send-email-pjtexier@koncepto.io>

For details see [1]

[1] - https://lists.openembedded.org/g/openembedded-devel/topic/72718415

Suggested-by: Tim Orling <ticotimo@gmail.com>
Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 meta-python/recipes-devtools/python/python-msgpack.inc  | 15 ---------------
 .../recipes-devtools/python/python3-msgpack_0.6.2.bb    | 17 +++++++++++++++--
 2 files changed, 15 insertions(+), 17 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-msgpack.inc

diff --git a/meta-python/recipes-devtools/python/python-msgpack.inc b/meta-python/recipes-devtools/python/python-msgpack.inc
deleted file mode 100644
index dba5dc4..0000000
--- a/meta-python/recipes-devtools/python/python-msgpack.inc
+++ /dev/null
@@ -1,15 +0,0 @@
-SUMMARY = "MessagePack (de)serializer"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://COPYING;md5=cd9523181d9d4fbf7ffca52eaa2a5751"
-
-PYPI_PACKAGE = "msgpack"
-inherit pypi
-
-SRC_URI[md5sum] = "ba46fdee995565f40e332bd7eea882f1"
-SRC_URI[sha256sum] = "ea3c2f859346fcd55fc46e96885301d9c2f7a36d453f5d8f2967840efa1e1830"
-
-RDEPENDS_${PN}_class-target += "\
-    ${PYTHON_PN}-io \
-"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-msgpack_0.6.2.bb b/meta-python/recipes-devtools/python/python3-msgpack_0.6.2.bb
index 096d7dd..7cfaf1c 100644
--- a/meta-python/recipes-devtools/python/python3-msgpack_0.6.2.bb
+++ b/meta-python/recipes-devtools/python/python3-msgpack_0.6.2.bb
@@ -1,2 +1,15 @@
-require python-msgpack.inc
-inherit setuptools3
+SUMMARY = "MessagePack (de)serializer"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=cd9523181d9d4fbf7ffca52eaa2a5751"
+
+PYPI_PACKAGE = "msgpack"
+inherit pypi setuptools3
+
+SRC_URI[md5sum] = "ba46fdee995565f40e332bd7eea882f1"
+SRC_URI[sha256sum] = "ea3c2f859346fcd55fc46e96885301d9c2f7a36d453f5d8f2967840efa1e1830"
+
+RDEPENDS_${PN}_class-target += "\
+    ${PYTHON_PN}-io \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4

