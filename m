Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id 2F83C71D9F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Dec 2016 21:04:20 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id y21so4873438lfa.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Dec 2016 13:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=YHrKvsPLxfm1Zdo8ZNbv2D7E56C4lpxXVDVcOP5ZIUY=;
	b=yFUOsb226c+XiWdxNhjZwnKcAn3ZxY0lb0FX4ybOZfUfiD3WNdZ5GlIZhj5mBubHvI
	M6+pklErc8cnUA8W6oMnIny1PfW5pRFYUybcf36tEQxT5L9rqJ9r8IQ2hduTPYalUKrC
	Tkc4c6Rk+E3+SC0kxnHWVQ5OQW0jbpbbfobweQTe/8KO18E+UelbZMsinVkWx/Qfiu7m
	k8KJaLANQnUbj1nXA1wToZ9D0omb+nujDlVgrnnVwcj/9yeSUqdqsVbWH4hrtpT4CDx6
	f+us08LsWg9ETG0KnEQj3BFkOGm5rAHeMZwr0Prq897ERrZ5Zqri5v23Q03xzH3nekE8
	O6Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=YHrKvsPLxfm1Zdo8ZNbv2D7E56C4lpxXVDVcOP5ZIUY=;
	b=Yzp2NkQ+gC3KvdLDqXriexflkl0nDxtvVGk+k6rvhTFMjf3+Uk410t6bUvi8U+UGm4
	BgKR10qT9Td8Dh9H3updzBmNg344xN6RWfcEjo0D1Jao6+gyHfqjH9fdlqxzWuvavvCR
	jiRZKsw+3PJSE92iK2Q/pztjMv4MKPyK+Ko+S95dRZDsJTnWcXZHz4yzWiwTltg3eV4B
	K5LwlwmqwEo+FkJFXuMX1oWn7AI1QL5ku1OX/qIp4xEWaway05j3EVTR95fFXMDKqtkS
	xAaFCiUKWUDpGBqpoGeNofppRIBZoYSaXD0uKRPAytS6zas++W5OcjIFvNMJn9QgSNeI
	I2Yg==
X-Gm-Message-State: AKaTC00PAZboMfqN5APHZ5tfDXevBifDC74sF6SV/SaDSQVU0/djREe6mawj4N6pZp/VRQ==
X-Received: by 10.25.131.144 with SMTP id f138mr9531567lfd.60.1481663061252;
	Tue, 13 Dec 2016 13:04:21 -0800 (PST)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id 26sm6678921lji.37.2016.12.13.13.04.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Dec 2016 13:04:19 -0800 (PST)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-devel@lists.openembedded.org, Martin.Jansa@gmail.com,
	ross.burton@intel.com
Date: Tue, 13 Dec 2016 22:04:04 +0100
Message-Id: <20161213210404.6940-8-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161213210404.6940-1-ricardo.ribalda@gmail.com>
References: <20161213210404.6940-1-ricardo.ribalda@gmail.com>
Subject: [meta-oe][PATCH 8/8] opencv: Merge dbg packages and Fix QA Issues
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
X-List-Received-Date: Tue, 13 Dec 2016 21:04:20 -0000

The presence of more than on -dbg file made completely unusable the
rest, and there is no big win by having more than one.

Also this qa issue is fixed:

QA Issue: opencv-samples-dbg: found library in wrong location:
/usr/share/OpenCV/java/.debug/libopencv_java310.so [libdir]

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 meta-oe/recipes-support/opencv/opencv_3.1.bb | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_3.1.bb b/meta-oe/recipes-support/opencv/opencv_3.1.bb
index f1a3ff55009c..e23c5457e381 100644
--- a/meta-oe/recipes-support/opencv/opencv_3.1.bb
+++ b/meta-oe/recipes-support/opencv/opencv_3.1.bb
@@ -85,15 +85,15 @@ export ANT_DIR="${STAGING_DIR_NATIVE}/usr/share/ant/"
 
 TARGET_CC_ARCH += "-I${S}/include "
 
-PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'oracle-java', '${PN}-java-dbg ${PN}-java', '', d)} \
-    ${@bb.utils.contains('PACKAGECONFIG', 'java', '${PN}-java-dbg ${PN}-java', '', d)} \
+PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'samples', '${PN}-samples', '', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'oracle-java', '${PN}-java', '', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'java', '${PN}-java', '', d)} \
     ${@bb.utils.contains('PACKAGECONFIG', 'python2', 'python-${PN}', '', d)} \
     ${@bb.utils.contains('PACKAGECONFIG', 'python3', 'python3-${PN}', '', d)} \
-    ${PN}-samples-dbg ${PN}-samples ${PN}-apps"
+    ${PN}-apps"
 
 python populate_packages_prepend () {
     cv_libdir = d.expand('${libdir}')
-    cv_libdir_dbg = d.expand('${libdir}/.debug')
     do_split_packages(d, cv_libdir, '^lib(.*)\.so$', 'lib%s-dev', 'OpenCV %s development package', extra_depends='${PN}-dev', allow_links=True)
     do_split_packages(d, cv_libdir, '^lib(.*)\.la$', 'lib%s-dev', 'OpenCV %s development package', extra_depends='${PN}-dev')
     do_split_packages(d, cv_libdir, '^lib(.*)\.a$', 'lib%s-dev', 'OpenCV %s development package', extra_depends='${PN}-dev')
@@ -111,6 +111,7 @@ python populate_packages_prepend () {
     d.setVar('RRECOMMENDS_' + metapkg, ' '.join(metapkg_rdepends))
 
     metapkg =  pn
+    d.setVar('ALLOW_EMPTY_' + metapkg, "1")
     blacklist = [ metapkg ]
     metapkg_rdepends = [ ]
     for pkg in packages[1:]:
@@ -123,17 +124,15 @@ python populate_packages_prepend () {
 PACKAGES_DYNAMIC += "^libopencv-.*"
 
 FILES_${PN} = ""
+FILES_${PN}-dbg += "${datadir}/OpenCV/java/.debug/* ${datadir}/OpenCV/samples/bin/.debug/*"
+FILES_${PN}-dev = "${includedir} ${libdir}/pkgconfig ${datadir}/OpenCV/*.cmake"
+FILES_${PN}-staticdev += "${datadir}/OpenCV/3rdparty/lib/*.a"
 FILES_${PN}-apps = "${bindir}/* ${datadir}/OpenCV"
-FILES_${PN}-dev = "${includedir} ${libdir}/pkgconfig ${datadir}/OpenCV/*.cmake ${datadir}/OpenCV/3rdparty/${baselib}/*.a"
-FILES_${PN}-doc = "${datadir}/OpenCV/doc"
 FILES_${PN}-java = "${datadir}/OpenCV/java"
-FILES_${PN}-java-dbg = "${datadir}/OpenCV/java/.debug/"
 FILES_${PN}-samples = "${datadir}/OpenCV/samples/"
-FILES_${PN}-samples-dbg = "${datadir}/OpenCV/samples/bin/.debug"
 
-INSANE_SKIP_${PN}-dev = "staticdev"
 INSANE_SKIP_${PN}-java = "libdir"
-INSANE_SKIP_${PN}-java-dbg = "libdir"
+INSANE_SKIP_${PN}-dbg = "libdir"
 
 ALLOW_EMPTY_${PN} = "1"
 
-- 
2.10.2


