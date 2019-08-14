Return-Path: <luca.boccassi@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id C093E7E8B7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Aug 2019 10:56:06 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id k2so24809022wrq.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Aug 2019 03:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=shoqNCGGI24ybGLJBRERppxV2NfkQaAMcHTHDF5k6ao=;
	b=vF8LoJIbAMpYGpgLCDpmpAvWExWKpt1K3XVOPDWzVnZ9du3eCAc8zky+SxSEF+dBIt
	J7R8KJKiyYHvQaE+c9OswPE+ksz6HMateEcTjk7sNO9YYeXpGbQWq1LWNtdTlzDokc6S
	HMsVivt54Fa/iAv/cweENyjdAu5Bto42QPltU4byjJHicfTREAp9cXG65i5giJTzmv98
	kZdtyWdCVzwwt1wyOlFKM/VLEQVUaD9Ng9D2QJxyj69E5W22cSX4W5LxVJV4851Vxw7X
	nh+G0oJNa982vqjZGXmumXbY9AVZSJ02kwEZBxfO1CoBCAMUTRSRp7go6uu3jmO/z+md
	9DWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=shoqNCGGI24ybGLJBRERppxV2NfkQaAMcHTHDF5k6ao=;
	b=VsGN3w61+P/7vTp6fyqw+/hQwXvC+OnICP4yewHQER0clQT/senSsEFzxTJVgYO18q
	bHqWnXBhAQUrvqyqqpHHW6sqrv7gEh1dt8FwI2yqwrZ/CNL+lYd2Kc7FRNIcLDoci/JM
	93F8aCDnHXPHauSx0meKYSKRxEE5j9ITA44f56+MLCIBavP/dWGKRqGSHIu5tNei8tFm
	ZeSdWqIWY9zZQPsu0AHyAGqlfJsMUCAhrIRJquvShT+477pGy0q6xmFE0gXxAQal2hQC
	ejitlLAIIywk4bPYv5OyPQiZZfc5IbSLGFCwbH0OcLsgUaFxiYGTJcXyF/fRIJWhDa0i
	E2XA==
X-Gm-Message-State: APjAAAV1s8u8VmaPqAnxvli6AE715LBzW5I/3U0Wo+l8q+iv6opk0x9L
	awVUi6zH9nYFT4KLxYvOqSAG2Oza+Zg=
X-Google-Smtp-Source: APXvYqx4E+tgocNzIzEYQPmSjlrCFDZoKTRf3o9WbCKJaZ3CKAmdqlPY6qapCyciC6RQYyPPfm41lw==
X-Received: by 2002:adf:dcc6:: with SMTP id x6mr52444890wrm.322.1565780166557; 
	Wed, 14 Aug 2019 03:56:06 -0700 (PDT)
Received: from localhost ([2a01:4b00:f419:6f00:7a8e:ed70:5c52:ea3])
	by smtp.gmail.com with ESMTPSA id
	b2sm21669450wrf.94.2019.08.14.03.55.58
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 14 Aug 2019 03:55:58 -0700 (PDT)
From: luca.boccassi@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Wed, 14 Aug 2019 11:55:55 +0100
Message-Id: <20190814105555.1681-1-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] python-pygobject: remove build-dependency on setuptools and add dependency on pkgutil
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
X-List-Received-Date: Wed, 14 Aug 2019 10:56:07 -0000
Content-Transfer-Encoding: 8bit

From: Luca Boccassi <luca.boccassi@microsoft.com>

Sync python-pygobject recipe with poky's python3-pygobject:
Setuptools is not a mandatory build-dependency, so remove it.
Pkgutil from the core library is needed at runtime, so add a
dependency on it.

Fixes: f8e1d0c17658 ("python-pygobject: move python-setuptools from RDEPENDS to DEPENDS")

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
---
 meta-oe/recipes-devtools/python/python-pygobject_3.32.2.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/python/python-pygobject_3.32.2.bb b/meta-oe/recipes-devtools/python/python-pygobject_3.32.2.bb
index 9c175e682..0ea70b23b 100644
--- a/meta-oe/recipes-devtools/python/python-pygobject_3.32.2.bb
+++ b/meta-oe/recipes-devtools/python/python-pygobject_3.32.2.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7"
 GNOMEBASEBUILDCLASS = "meson"
 inherit gnomebase gobject-introspection distutils-base upstream-version-is-even
 
-DEPENDS += "python python-setuptools glib-2.0"
+DEPENDS += "python glib-2.0"
 
 SRCNAME = "pygobject"
 SRC_URI = " \
@@ -30,6 +30,7 @@ PACKAGECONFIG[python] = "-Dpython=python3, -Dpython=python2, , "
 PACKAGECONFIG[stagedir] = "-Dstagedir=${PYTHON_SITEPACKAGES_DIR}, -Dstagedir="", , "
 
 BBCLASSEXTEND = "native"
+RDEPENDS_${PN} = "python-pkgutil"
 RDEPENDS_${PN}_class-native = ""
 
 do_install_append() {
-- 
2.20.1


