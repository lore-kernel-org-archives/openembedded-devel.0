Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 6A6E4606BF
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jul 2016 12:04:35 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id o80so13372120wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jul 2016 05:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=lStuSsWVpf70NpT2wkLZJQYG/qNX205Mccy660jzIWI=;
	b=gXYZE8h4E1kD0EtVHw0YqNf73i1Tsu/+Msny7BFDCyXIhTJZV8gfthV66tdEclitJ5
	zTMRwBJz1ajw9pZbtt78TRNxcur45O8HwwS96Vxhn4dPK7rn6RsL0iV45hAZol+zjt58
	4wvLEk9p/2XqEJP5Vw6jWL7xyKhYHvH3qByEQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=lStuSsWVpf70NpT2wkLZJQYG/qNX205Mccy660jzIWI=;
	b=C/CKKCVutUugHgbkghO2TUC7VIqqCwyW98MEDUj+gYxmJmKd1kOmumB1vFkur2j8Sf
	6L3253+oH/49TVPMIPFAdTqIYPgKcVUfV+his6fOMLEuqgRdNB5nSTh0DnlF+mEaJKlL
	fKKit3wRbpnC408Nz8gREpTN+ltfnfmlVvBlu4eFE5MpwaQi91gu276S3uUO2KHN6l5X
	2fsceDPyIlDgCE3i9yogtztMmP7JK9EcsyccjDnZsXDofLCUPr0NxBk3u4oN7QTRLsPJ
	jVNqw8KY9o36eSfSCLh3xtir7IalKzIR/ZSnuNSdxwWxanbTEeh7+U4rp4TKDoBfN5tP
	RVjw==
X-Gm-Message-State: AEkooutuit753NiwEEM0Jpq0hkvVGg5jK54hfPDqfFIfFlzF8yu4qYovDi10r1MMXmtTIbpd
X-Received: by 10.28.198.6 with SMTP id w6mr9480254wmf.63.1469534676238;
	Tue, 26 Jul 2016 05:04:36 -0700 (PDT)
Received: from hackbox.linaro.org ([81.128.185.36])
	by smtp.gmail.com with ESMTPSA id
	q23sm1356256wme.17.2016.07.26.05.04.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 26 Jul 2016 05:04:35 -0700 (PDT)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 26 Jul 2016 13:04:04 +0100
Message-Id: <1469534644-19083-1-git-send-email-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.7.0
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [meta-oe][PATCH] sysbench: add new recipe
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
X-List-Received-Date: Tue, 26 Jul 2016 12:04:36 -0000

The project used to be hosted on Sourceforge, then Launchpad, and it moved to
Github. The last stable release (0.4.12) cannot be found on Sourceforge anymore,
and is not available (as tarball) on github. So using the tarball from Launchpad
instead. We can move to github when the next release happens (which will be the
first one from github).

Tested with and without mysql.

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 .../recipes-benchmark/sysbench/sysbench_0.4.12.bb  | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/sysbench/sysbench_0.4.12.bb

diff --git a/meta-oe/recipes-benchmark/sysbench/sysbench_0.4.12.bb b/meta-oe/recipes-benchmark/sysbench/sysbench_0.4.12.bb
new file mode 100644
index 0000000..5873470
--- /dev/null
+++ b/meta-oe/recipes-benchmark/sysbench/sysbench_0.4.12.bb
@@ -0,0 +1,25 @@
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


