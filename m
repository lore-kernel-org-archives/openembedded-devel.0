Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id B1244606BF
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jul 2016 12:35:00 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id f65so172178172wmi.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jul 2016 05:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=9D8GPk7rQ0mWrpGbVre2iQhWBrMWT0ati5/0zMHGPSI=;
	b=N5qUXvnBMqWc/W94CNRpoZqor8ZE/wFJSU26VDbMrBP3reJvPQSNr8dlZqlcBm+MLz
	acDISGa92BTEW8lJqCAtJ6HYiuXAV9x59kK6DoDTF04MniRGghTZBvw6xueOJMyUiJO4
	406cj3HFtUFhgMgIfL6gyQisnpY9iUYZct+M4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=9D8GPk7rQ0mWrpGbVre2iQhWBrMWT0ati5/0zMHGPSI=;
	b=SzHZW7JxFFUNQx6aPuQRSJOf33tT6YI8s+Z5eZrqlofZYtjY0rul93fqnvbx4WYQrW
	q3WW3I8x8rAfsCQfVgpz9p5mn096XabsLGcVXp1uVdeGPI7w3RHLzGsfM6QmnOshvbY5
	ADapPt/iCxVXBZjj/3/9o98fGU5YB28+5/PMY8x4C+x3Szp/xGV3q14ZZCalKm5EaCGY
	LnVG0hUawWD2Q/QFZw573dsvPJsptGsR+mEtDwT+xyhj8saVybFP7mN2qX+xuEsz/d6Q
	RRXpTpjsixXeF1Yquz2VKP3n85Du2c2wp+6CSbL5p3DcerI0W9cVk81NS5UevqT7crXZ
	domg==
X-Gm-Message-State: AEkoouvRl1pMf/VUcTTvzedDoJODjRJwQMtFprDRHJqXQrB5hCJbI7maR0NnZW3UCHICGmjL
X-Received: by 10.28.221.8 with SMTP id u8mr24760654wmg.61.1469536500249;
	Tue, 26 Jul 2016 05:35:00 -0700 (PDT)
Received: from hackbox.linaro.org ([81.128.185.36])
	by smtp.gmail.com with ESMTPSA id
	q139sm32729272wmb.18.2016.07.26.05.34.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 26 Jul 2016 05:34:59 -0700 (PDT)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 26 Jul 2016 13:34:56 +0100
Message-Id: <1469536496-8976-1-git-send-email-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.7.0
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [meta-oe][PATCH v2] sysbench: add new recipe
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
X-List-Received-Date: Tue, 26 Jul 2016 12:35:02 -0000

The project used to be hosted on Sourceforge, then Launchpad, and it moved to
Github. The last stable release (0.4.12) cannot be found on Sourceforge anymore,
and is not available (as tarball) on github. So using the tarball from Launchpad
instead. We can move to github when the next release happens (which will be the
first one from github).

Tested with and without mysql, with and without aio.

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---

Changes in v2:
* fixed "QA Issue: sysbench rdepends on libaio, but it isn't a build dependency"
* added aio PACKAGECONFIG, and keep it disable by default

 .../recipes-benchmark/sysbench/sysbench_0.4.12.bb  | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/sysbench/sysbench_0.4.12.bb

diff --git a/meta-oe/recipes-benchmark/sysbench/sysbench_0.4.12.bb b/meta-oe/recipes-benchmark/sysbench/sysbench_0.4.12.bb
new file mode 100644
index 0000000..3c69548
--- /dev/null
+++ b/meta-oe/recipes-benchmark/sysbench/sysbench_0.4.12.bb
@@ -0,0 +1,26 @@
+SUMMARY = "System performance benchmark"
+HOMEPAGE = "http://github.com/akopytov/sysbench"
+SECTION = "console/tests"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+inherit autotools
+
+# The project has moved from Sourceforge to Launchpad, to Github. Use the source tarball from 
+# Launchpad until the next release is available from Github.
+SRC_URI = "https://launchpad.net/ubuntu/+archive/primary/+files/${BPN}_${PV}.orig.tar.gz"
+
+SRC_URI[md5sum] = "3a6d54fdd3fe002328e4458206392b9d"
+SRC_URI[sha256sum] = "83fa7464193e012c91254e595a89894d8e35b4a38324b52a5974777e3823ea9e"
+
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'largefile', 'largefile', '', d)}"
+PACKAGECONFIG[largefile] = "--enable-largefile,--disable-largefile,,"
+PACKAGECONFIG[aio] = "--enable-aio,--disable-aio,libaio,"
+PACKAGECONFIG[mysql] = "--with-mysql \
+                        --with-mysql-includes=${STAGING_INCDIR}/mysql \
+                        --with-mysql-libs=${STAGING_LIBDIR}, \
+                        --without-mysql,mysql5"
+
+do_configure_prepend() {
+    touch ${S}/NEWS ${S}/AUTHORS 
+}
-- 
2.7.0


