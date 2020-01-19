Return-Path: <ticotimo@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 09DD67F8B2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Jan 2020 04:19:03 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id x7so13734086pgl.11
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Jan 2020 20:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=K9bHrTSdOni1DnnzVDiLaMXfwk+nFlsPUCQziLNCL0M=;
	b=eM64PdoWry08Ihw3va22xFSIiLeDhrUfQkxP3ip6rX6HMANh85P8bi202hp7wPdYdw
	8ibOolC2PLamGSjvtXCWRZbGi5PAWdw/OhV1vsExeIvicF1Dk/Znqd7GGOFQro8yWqBV
	PM+OVLnzCAT51mxj5dbdoR1oS1AEFENnElJkzT25eLH6ifHGUxDVZ7R5KZ+YNSrUeVNF
	wo/8yM6szEIDuFgId7N/m5e1MabJLa1iJV3djYYptellfy9JdF+QZhmhWv+c2GKr1LP7
	ASo3Sdpb0vVGHrG+Dqm+J9iWyg+sSUiKyJEwIdL2yu8AIvOhw5vcSWNGwru0cV2vb9kC
	+Vfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=K9bHrTSdOni1DnnzVDiLaMXfwk+nFlsPUCQziLNCL0M=;
	b=Yg0x+lZE6zD5ePb3ULyqiMvDblBr+y6Ex/LDhzewgKzY2QWAFjDgxKzBq1Uz2E81lb
	SINYPYIjpz44jytA/nh5EThN+yd4io9ZOrht82kKVSK82QAHQcyyaKlGjZkQ6WUJisEG
	WBO24S8ZtmKYQSkdlHA7TgmM5Kq/pr/FjEkQIyhvUKcIkooNx/alv/cVscaIMDJGvYqD
	FJLNt4MK4ejizs9Jn3kGPKoCwhHZCxIrTD5MMdb6tIc5TB6WPDEQfHc4HAw/xHwARDT3
	7lFGh+k+c+aOaSJWyOz5jjjbSSBfxK8pl40G9Gcq/0qtwZpGrK+9bdbMf9frBoEiPawN
	U7uA==
X-Gm-Message-State: APjAAAWqAmgL6PQiewHHL/my4hLTcjjXcSpDGEk8yXRUNPMGqQ/v483D
	RzFFnygXZIyrFZbPEhkALQz6PGtvb/w=
X-Google-Smtp-Source: APXvYqwHsOqI3o5QWj3kjOQyhYAXMjLwtPgvU27yNk1+lhofKdBOxmHXkNyHxpCIAK1iitBLDM4KNQ==
X-Received: by 2002:a63:b58:: with SMTP id a24mr3352754pgl.351.1579407544788; 
	Sat, 18 Jan 2020 20:19:04 -0800 (PST)
Received: from thetis.hsd1.or.comcast.net
	([2601:1c0:6080:4500:b5c2:b07:e8c5:4266])
	by smtp.gmail.com with ESMTPSA id
	y76sm35112576pfc.87.2020.01.18.20.19.04
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 18 Jan 2020 20:19:04 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 18 Jan 2020 20:18:42 -0800
Message-Id: <20200119041842.20021-1-ticotimo@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [meta-python2][PATCH] python-m2crypto: add missing RDEPENDS
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
X-List-Received-Date: Sun, 19 Jan 2020 04:19:04 -0000
Content-Transfer-Encoding: 8bit

* Missing run-time dependencies:
    python-datetime
    python-distutils
    python-logging
    python-netserver
    python-smtpd
    python-typing
    python-xmlrpc

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 recipes-devtools/python/python-m2crypto_0.30.1.bb | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/recipes-devtools/python/python-m2crypto_0.30.1.bb b/recipes-devtools/python/python-m2crypto_0.30.1.bb
index 22bf56a3..968dd720 100644
--- a/recipes-devtools/python/python-m2crypto_0.30.1.bb
+++ b/recipes-devtools/python/python-m2crypto_0.30.1.bb
@@ -19,7 +19,15 @@ PYPI_PACKAGE = "M2Crypto"
 
 inherit pypi siteinfo setuptools
 
-RDEPENDS_${PN} += "python-typing"
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-datetime \
+    ${PYTHON_PN}-distutils \
+    ${PYTHON_PN}-logging \
+    ${PYTHON_PN}-netserver \
+    ${PYTHON_PN}-smtpd \
+    ${PYTHON_PN}-typing \
+    ${PYTHON_PN}-xmlrpc \
+    "
 
 DISTUTILS_BUILD_ARGS += "build_ext --openssl=${STAGING_EXECPREFIXDIR} -I${STAGING_INCDIR}"
 DISTUTILS_INSTALL_ARGS += "build_ext --openssl=${STAGING_EXECPREFIXDIR}"
-- 
2.25.0


