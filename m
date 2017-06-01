Return-Path: <moritz.fischer@ettus.com>
Received: from mail-pf0-f179.google.com (mail-pf0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id CF13F77D81
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Jun 2017 16:43:12 +0000 (UTC)
Received: by mail-pf0-f179.google.com with SMTP id n23so31980726pfb.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Jun 2017 09:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ettus-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=mje70el6Aw4KOJ6tRd9Owu09CT3FbX00+H48d9TSG4Y=;
	b=nPpTYD7XNtDujuYOyKg0ZsXOzw0kUyPEj/H/+QOTbCmzmszatTRIfMFTGvUVJPWsa8
	KITtkjks5E9ErtFZOQ6eI6xat5tY75y73SAs7Hbu/UiewKFQ+4Z2KpO9Vlz+s3246bpd
	C0wiTnWt2txe2fCzwo2onDdFzANK96OjibkvuSgwoP6B9WxHr8l5LTqiS2R90tw3VHY2
	k0lxE7cqX3GtQP6sNUWzjVCKu07xrTGsKcLaGgXglz47aOxaLFO/efX/3SB2FpxVVkm6
	KE5IiIFzSz1Gu6ZVChbQF3F0cASI+C8zjlh0Vx9Hk1R71hyPQuE08w9MRfHbVgOwZ/vT
	L55w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=mje70el6Aw4KOJ6tRd9Owu09CT3FbX00+H48d9TSG4Y=;
	b=ASjsw1pZ+411vuBw2Y6kKFaKMwZrYyaHpze0JVJwXFMEoO4pN5PBEEQmvcgAP9SA1+
	A0odoO7OTQm2BXbO4AjsU0XBFdSNUdmtXsbpQ1FmiNXDTSR8acIz4LWTcXnuugk9UKQf
	ZAmEC+i2+5LRKvS7JR2Z4ar4RuYUI0zSwsDdRQjjY2+3b3UGQ5e6o/+Q7ghbR7lPNRQK
	Kwx6AgEuapleJ6JqgfqbLjcrexJLRqwT7a0EDMCstFFwsQHTGZZ15fmbVXaX8S/TVhwA
	S6GJ0eOllQyN/DS00uLiIm/z9tQrrnlasgLqDxwj+vrRo/mTgvsMK5Sf6rYftVqKs3Du
	/xbg==
X-Gm-Message-State: AODbwcAmtFFkNL81173ci8GbL1yHMCreuFP5b2IZ8F1uSajPfxXQeKPy
	7+eETfYg1l8aSIg+RQjF9w==
X-Received: by 10.99.114.66 with SMTP id c2mr1965763pgn.130.1496335393652;
	Thu, 01 Jun 2017 09:43:13 -0700 (PDT)
Received: from tyrael.ni.corp.natinst.com
	(207-114-172-147.static.twtelecom.net. [207.114.172.147])
	by smtp.gmail.com with ESMTPSA id
	19sm30635779pfz.39.2017.06.01.09.43.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Jun 2017 09:43:12 -0700 (PDT)
From: Moritz Fischer <moritz.fischer@ettus.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Jun 2017 09:42:51 -0700
Message-Id: <1496335374-25575-5-git-send-email-moritz.fischer@ettus.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1496335374-25575-1-git-send-email-moritz.fischer@ettus.com>
References: <1496335374-25575-1-git-send-email-moritz.fischer@ettus.com>
Cc: paul.eggleton@linux.intel.com
Subject: [meta-python][PATCH 5/8] python-gsocketpool: Add support for python3
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
X-List-Received-Date: Thu, 01 Jun 2017 16:43:12 -0000

Extend recipe to support python3

Signed-off-by: Moritz Fischer <moritz.fischer@ettus.com>
---
 .../python-gsocketpool/python-gsocketpool.inc          | 16 ++++++++++++++++
 .../python-gsocketpool/python-gsocketpool_0.1.5.bb     | 18 ++----------------
 .../python-gsocketpool/python3-gsocketpool_0.1.5.bb    |  2 ++
 3 files changed, 20 insertions(+), 16 deletions(-)
 create mode 100644 meta-python/recipes-connectivity/python-gsocketpool/python-gsocketpool.inc
 create mode 100644 meta-python/recipes-connectivity/python-gsocketpool/python3-gsocketpool_0.1.5.bb

diff --git a/meta-python/recipes-connectivity/python-gsocketpool/python-gsocketpool.inc b/meta-python/recipes-connectivity/python-gsocketpool/python-gsocketpool.inc
new file mode 100644
index 0000000..54dd49f
--- /dev/null
+++ b/meta-python/recipes-connectivity/python-gsocketpool/python-gsocketpool.inc
@@ -0,0 +1,16 @@
+SUMMARY = "A simple connection pool for gevent"
+DESCRIPTION = "creates a pool of connections that can be used with gevent"
+HOMEPAGE = "https://github.com/studio-ousia/gsocketpool"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4ba825394aec026b5f94edca44426859"
+DEPENDS += "${PYTHON_PN}-gevent"
+RDEPENDS_${PN} += "${PYTHON_PN}-gevent"
+
+SRC_URI_append = " \
+    file://0001-fix_setup_py.patch;patch=1;pnum=1 \
+"
+
+SRC_URI[md5sum] = "04f618864b18d6b06f774994f172ef49"
+SRC_URI[sha256sum] = "b6b73deab9bcbc428d4813697eebe5c3b9c40a971f62e13607b881aa749af9d0"
+
+inherit pypi
diff --git a/meta-python/recipes-connectivity/python-gsocketpool/python-gsocketpool_0.1.5.bb b/meta-python/recipes-connectivity/python-gsocketpool/python-gsocketpool_0.1.5.bb
index f86152c..e96ad1c 100644
--- a/meta-python/recipes-connectivity/python-gsocketpool/python-gsocketpool_0.1.5.bb
+++ b/meta-python/recipes-connectivity/python-gsocketpool/python-gsocketpool_0.1.5.bb
@@ -1,16 +1,2 @@
-SUMMARY = "A simple connection pool for gevent"
-DESCRIPTION = "creates a pool of connections that can be used with gevent"
-HOMEPAGE = "https://github.com/studio-ousia/gsocketpool"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=4ba825394aec026b5f94edca44426859"
-DEPENDS += "python-gevent"
-RDEPENDS_${PN} += "python-gevent"
-
-SRC_URI_append = " \
-    file://0001-fix_setup_py.patch;patch=1;pnum=1 \
-"
-
-SRC_URI[md5sum] = "04f618864b18d6b06f774994f172ef49"
-SRC_URI[sha256sum] = "b6b73deab9bcbc428d4813697eebe5c3b9c40a971f62e13607b881aa749af9d0"
-
-inherit pypi setuptools
+require python-gsocketpool.inc
+inherit setuptools
diff --git a/meta-python/recipes-connectivity/python-gsocketpool/python3-gsocketpool_0.1.5.bb b/meta-python/recipes-connectivity/python-gsocketpool/python3-gsocketpool_0.1.5.bb
new file mode 100644
index 0000000..883621e
--- /dev/null
+++ b/meta-python/recipes-connectivity/python-gsocketpool/python3-gsocketpool_0.1.5.bb
@@ -0,0 +1,2 @@
+require python-gsocketpool.inc
+inherit setuptools3
-- 
2.7.4


