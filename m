Return-Path: <sven.ebenfeld@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5815A76A98
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jan 2016 23:30:45 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id b14so479265wmb.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jan 2016 15:30:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=jV1UX410L2hAwGMOM5nhlcfgSrVozV7iViCgUWxuJ/M=;
	b=YINQlww+6EickRncHHfy9ONI7BcNuhqN46ZB354tYnUOXYJgAIYI3ljwiSwo9KNzsM
	kHHMbigIFkkYkQmNtfi5OApwbIrhEjk0a8fj6SLPjztCHFtW2uDhvR27nTRhhGbeUm3I
	jV0KtTD3RlP4EqZWj+lVZpFutkVvXZ7ii7zfkuw9gku1gmO+3QbE92sK+agGnvTYQSXm
	5Qe7QCNh9Qv0vVxiHEaL+eZLuXT1oiYhj4CXhV+RoV32hfBHuJfTxhaegsX+Zo9GJ++H
	C1asffTzlQl45o0I9A7bs4mTFmL6oalt3aR7Nk1S8rAw8k3qEYnB5khI1YW6ns3+T9gi
	9X/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=jV1UX410L2hAwGMOM5nhlcfgSrVozV7iViCgUWxuJ/M=;
	b=L7v5Hi/656gQXifa640pqFIiM3zwCTZRFOhiCx1AduteRuzDGDS+84CdsuEgWRhbmg
	tazGrFdfvyn+74L4Dck+O5/E3kBWcdfpq6HREvtTxHbyCI19RNPFnJqNHlkIAp934vxa
	uywYPQCwnIKLjgsCh4nobJUH9m/gUL3gvVaBHjNGyV2KfrgT/XQbnxaSiCLHaUG/Oofn
	OLpGcGrnoL95/H/JCNi0x/2kvNHyEmsTwMnZZJ1GXkzqODau0yoZW8VgPOCMgrEaRjjq
	9bsexGDSXZjyzxYAbbQeyv50+xzO8f4qY1WdEwfVaeAsB8jyzKCU8mxD16k1Jca3oXRS
	1ykQ==
X-Gm-Message-State: AG10YOTwucHfXypc+NqjOE8OrtWE85HH9XY68H4q1M5MTfANvhmvQMOBqu9Oa8lUm6s10A==
X-Received: by 10.28.182.133 with SMTP id g127mr5818044wmf.61.1453505445374;
	Fri, 22 Jan 2016 15:30:45 -0800 (PST)
Received: from ubuntu.ebenfeld.local
	(ip-109-90-30-143.hsi11.unitymediagroup.de. [109.90.30.143])
	by smtp.gmail.com with ESMTPSA id
	ka4sm7882127wjc.47.2016.01.22.15.30.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 22 Jan 2016 15:30:44 -0800 (PST)
From: Sven Ebenfeld <sven.ebenfeld@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 23 Jan 2016 00:30:03 +0100
Message-Id: <67add9bb661870090938aedf8ef837883485e7aa.1453504827.git.sven.ebenfeld@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1453504827.git.sven.ebenfeld@gmail.com>
References: <cover.1453504827.git.sven.ebenfeld@gmail.com>
In-Reply-To: <cover.1453504827.git.sven.ebenfeld@gmail.com>
References: <cover.1453504827.git.sven.ebenfeld@gmail.com>
Cc: paul.eggleton@linux.intel.com
Subject: [meta-python][PATCH 01/21] python(3)-lxml: 3.4.4 -> 3.5.0
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
X-List-Received-Date: Fri, 22 Jan 2016 23:30:46 -0000

Update python-lxml and python3-lxml to version 3.5.0 and correct licensing
information. The file LICENSES.txt states four different licenses.

Signed-off-by: Sven Ebenfeld <sven.ebenfeld@gmail.com>
---
 .../recipes-devtools/python/python-lxml.inc        | 25 ++++++++++++++++------
 .../{python-lxml_3.4.4.bb => python-lxml_3.5.0.bb} |  0
 ...python3-lxml_3.4.4.bb => python3-lxml_3.5.0.bb} |  0
 3 files changed, 18 insertions(+), 7 deletions(-)
 rename meta-python/recipes-devtools/python/{python-lxml_3.4.4.bb => python-lxml_3.5.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-lxml_3.4.4.bb => python3-lxml_3.5.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-lxml.inc b/meta-python/recipes-devtools/python/python-lxml.inc
index 7a596c1..337da1b 100644
--- a/meta-python/recipes-devtools/python/python-lxml.inc
+++ b/meta-python/recipes-devtools/python/python-lxml.inc
@@ -1,17 +1,28 @@
-SUMMARY = "Python XML bindings for libxml2 and libxslt"
-DESCRIPTION = "Powerful and Pythonic XML processing library combining \
-libxml2/libxslt with the ElementTree API."
+SUMMARY = "Powerful and Pythonic XML processing library combining libxml2/libxslt with the ElementTree API."
+DESCRIPTION = "lxml is a Pythonic, mature binding for the libxml2 and \
+libxslt libraries. It provides safe and convenient access to these \
+libraries using the ElementTree API. It extends the ElementTree API \
+significantly to offer support for XPath, RelaxNG, XML Schema, XSLT, \
+C14N and much more."
 HOMEPAGE = "http://codespeak.net/lxml"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=f9f1dc24f720c143c2240df41fe5073b"
+SECTION = "devel/python"
+LICENSE = "BSD & GPLv2 & MIT & PSF"
+LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=f9f1dc24f720c143c2240df41fe5073b \
+                    file://doc/licenses/elementtree.txt;md5=eb34d036a6e3d56314ee49a6852ac891 \
+                    file://doc/licenses/BSD.txt;md5=700a1fc17f4797d4f2d34970c8ee694b \
+                    file://doc/licenses/GPL.txt;md5=94d55d512a9ba36caa9b7df079bae19f \
+                    file://src/lxml/isoschematron/resources/rng/iso-schematron.rng;startline=2;endline=7;md5=a2914d12acc7066b3f5b60e8f94a012e \
+                    file://src/lxml/isoschematron/resources/xsl/iso-schematron-xslt1/iso_schematron_message.xsl;startline=2;endline=24;md5=96976dcc66249c51e8026b159ca5e755 \
+                    file://src/lxml/isoschematron/resources/xsl/RNG2Schtrn.xsl;startline=2;endline=7;md5=5cac4ad4b5e131a10e9af755b10fbbb7 \
+                    "
 SRCNAME = "lxml"
 
 DEPENDS += "libxml2 libxslt"
 
 SRC_URI = "http://pypi.python.org/packages/source/l/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "a9a65972afc173ec7a39c585f4eea69c"
-SRC_URI[sha256sum] = "b3d362bac471172747cda3513238f115cbd6c5f8b8e6319bf6a97a7892724099"
+SRC_URI[md5sum] = "9f0c5f1eb43ff44d5455dab4b4efbe73"
+SRC_URI[sha256sum] = "349f93e3a4b09cc59418854ab8013d027d246757c51744bf20069bc89016f578"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
diff --git a/meta-python/recipes-devtools/python/python-lxml_3.4.4.bb b/meta-python/recipes-devtools/python/python-lxml_3.5.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-lxml_3.4.4.bb
rename to meta-python/recipes-devtools/python/python-lxml_3.5.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-lxml_3.4.4.bb b/meta-python/recipes-devtools/python/python3-lxml_3.5.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-lxml_3.4.4.bb
rename to meta-python/recipes-devtools/python/python3-lxml_3.5.0.bb
-- 
1.9.1


