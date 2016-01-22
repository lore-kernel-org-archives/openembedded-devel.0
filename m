Return-Path: <sven.ebenfeld@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id B18A377041
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jan 2016 23:30:52 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id 123so468784wmz.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jan 2016 15:30:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=P7PT8dnGiK04Kwl3mUV37sTzUYr5o/11M7dFWLeUUdA=;
	b=iQ4tHfN4nMJuJ9jh7BMtsm/R4lrISAzzdnX2q9cZs+SBf3O/9VLT66aT13GVR3O3Ok
	vw7wmX77Eyybxl2ye6oK0BxW5+/SBadfA44pM02zRtR5+U7+E8IFN6QpuJ4GP3gK0ClD
	nH8wX38wY7yFbBcyUXEK4PTnXDvja65rte+593nXt8O0oIQo46sydKTcPDMjqVT1Frt6
	3mMprjpcbg7azdrF2uihoUVODC6lqx491GJI9UD4uUurFonmVC9K/EgYutmMp/EfDJnt
	Rq4U5CS57x300j/tRd3EFpYdnJQvGXyPz1tjAs4jlO9GvlBClr82fpufuycUbBg2pUOQ
	6LNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=P7PT8dnGiK04Kwl3mUV37sTzUYr5o/11M7dFWLeUUdA=;
	b=e+gc9ZGjeRv58Xj7/H5p4WQCId56n1tEU4AE08RRQHZbS9d2/1nY3sLVb7uom2n4mv
	0GJrmXC8Stq9aHc7xT/oLVDROpJjXKo96w++LKMAcA0mIA/bVwhXO3IIieHo45YRb4J6
	pgeLqW8m1YL50SqVFVvV1AQVaFqj86ayuEM+zsZpWNSFAtAWtzphiZ0Qk0aNyFhmNXjw
	2X5DxiAGQX+NG943vDQzhYdCXniFgCEAy8pBJTFD3OZczbvcfJg64OZx+8GwTmH+8Gkj
	csi+m6mZzgV72s5eyyU4sKUS3YKadmmLTygm7UPq56thQkFvGPjhZllgebvHWDaXPZvp
	HPKg==
X-Gm-Message-State: AG10YORPwBRD12dmCPbiymB6Wkgzf+9smjHFnS0zcYwOCsX/+ojAOqquzZeEBrO7X1CVgw==
X-Received: by 10.194.93.199 with SMTP id cw7mr6453181wjb.64.1453505453363;
	Fri, 22 Jan 2016 15:30:53 -0800 (PST)
Received: from ubuntu.ebenfeld.local
	(ip-109-90-30-143.hsi11.unitymediagroup.de. [109.90.30.143])
	by smtp.gmail.com with ESMTPSA id
	ka4sm7882127wjc.47.2016.01.22.15.30.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 22 Jan 2016 15:30:52 -0800 (PST)
From: Sven Ebenfeld <sven.ebenfeld@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 23 Jan 2016 00:30:11 +0100
Message-Id: <7229abec4bab1876a1a6510d96dcb3a956f3c2a9.1453504827.git.sven.ebenfeld@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1453504827.git.sven.ebenfeld@gmail.com>
References: <cover.1453504827.git.sven.ebenfeld@gmail.com>
In-Reply-To: <cover.1453504827.git.sven.ebenfeld@gmail.com>
References: <cover.1453504827.git.sven.ebenfeld@gmail.com>
Cc: paul.eggleton@linux.intel.com
Subject: [meta-python][PATCH 09/21] python-requests: 2.7.0 -> 2.9.1 and add python3 recipe
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
X-List-Received-Date: Fri, 22 Jan 2016 23:30:53 -0000

Signed-off-by: Sven Ebenfeld <sven.ebenfeld@gmail.com>
---
 .../recipes-devtools/python/python-requests.inc        |  9 +++++++++
 .../recipes-devtools/python/python-requests_2.7.0.bb   | 18 ------------------
 .../recipes-devtools/python/python-requests_2.9.1.bb   |  4 ++++
 .../recipes-devtools/python/python3-requests_2.9.1.bb  |  2 ++
 4 files changed, 15 insertions(+), 18 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-requests.inc
 delete mode 100644 meta-python/recipes-devtools/python/python-requests_2.7.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python-requests_2.9.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-requests_2.9.1.bb

diff --git a/meta-python/recipes-devtools/python/python-requests.inc b/meta-python/recipes-devtools/python/python-requests.inc
new file mode 100644
index 0000000..ebce253
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-requests.inc
@@ -0,0 +1,9 @@
+DESCRIPTION = "Python HTTP for Humans."
+HOMEPAGE = "http://python-requests.org"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=58c7e163c9f8ee037246da101c6afd1e"
+
+SRC_URI[md5sum] = "0b7f480d19012ec52bab78292efd976d"
+SRC_URI[sha256sum] = "c577815dd00f1394203fc44eb979724b098f88264a9ef898ee45b8e5e9cf587f"
+
+RDEPENDS_${PN} = "${PYTHON_PN}-email ${PYTHON_PN}-json ${PYTHON_PN}-netserver"
diff --git a/meta-python/recipes-devtools/python/python-requests_2.7.0.bb b/meta-python/recipes-devtools/python/python-requests_2.7.0.bb
deleted file mode 100644
index ac47202..0000000
--- a/meta-python/recipes-devtools/python/python-requests_2.7.0.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-DESCRIPTION = "Python HTTP for Humans."
-HOMEPAGE = "http://python-requests.org"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=58c7e163c9f8ee037246da101c6afd1e"
-
-SRCNAME = "requests"
-
-SRC_URI = "http://pypi.python.org/packages/source/r/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "29b173fd5fa572ec0764d1fd7b527260"
-SRC_URI[sha256sum] = "398a3db6d61899d25fd4a06c6ca12051b0ce171d705decd7ed5511517b4bb93d"
-
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit setuptools
-
-RDEPENDS_${PN} = "python-email python-json python-netserver python-zlib"
diff --git a/meta-python/recipes-devtools/python/python-requests_2.9.1.bb b/meta-python/recipes-devtools/python/python-requests_2.9.1.bb
new file mode 100644
index 0000000..acc8c16
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-requests_2.9.1.bb
@@ -0,0 +1,4 @@
+inherit pypi
+require python-requests.inc
+
+RDEPENDS_${PN} += "${PYTHON_PN}-zlib"
\ No newline at end of file
diff --git a/meta-python/recipes-devtools/python/python3-requests_2.9.1.bb b/meta-python/recipes-devtools/python/python3-requests_2.9.1.bb
new file mode 100644
index 0000000..c2eb056
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-requests_2.9.1.bb
@@ -0,0 +1,2 @@
+inherit pypi3
+require python-requests.inc
-- 
1.9.1


