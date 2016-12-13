Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2E81171E14
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Dec 2016 23:46:28 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id p100so216543lfg.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Dec 2016 15:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=N52pKrg0Ee2heh8tT3vkMf84VZ9/WBnFJHz4pZHoRlg=;
	b=U160mY9quPYT4oJuJhXAXsHPuBjRg/Cj604BAXYAQywp/4kXhoi9iQBrl5yTyPoFI/
	sVUK2bXUkS+E/IxytWK9aBodxKJMH8Vgv3geMictlMJ6noI0qc7aYSQBo/JY4Qn3kYf7
	y3vkCo2+2+W5g1cWgD8+s+L2lE1ME4v3cksB62pG+WHVaUssV6jOn/EmyzrjvaPhWLYA
	F/No7/x2Uf2OuY78RaOh2iyJ6yNsoFBGRzt3yhlsl+C+Fu1i1E5MIa8qcmNa8z5FZBLj
	N4ADkFCraoYsxdvNT/Gej+pn30FfUuo+Wg48Tf0w/kC07ZJXriguQjK+Ngpsv0gFwpls
	DFEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=N52pKrg0Ee2heh8tT3vkMf84VZ9/WBnFJHz4pZHoRlg=;
	b=Q/mGizHyqFieUV+JZnaMfB2VZFSOA8olS6Vyx2AaCoNpjdqWgJWCrjcTBHMTfGGT4f
	UIaFDdwbn1lsYLbRbLDkdP8EUslz7TJVoFziOg3dKzs/5SB8y5MANL8OJlCX/aIrqx0T
	0UujuDZCjahKB/tlqi+qDTT7h4OzU5qO2W05u5mtxpJyfGgsGlSSEib0LHrEj/s1+Nja
	3Ccnvz1rRJJ4G61dfnUo9Iyl1KIS4zbvCfC+/NDBTiJNUZDOu5d52nG1CQVkllat+Pzl
	Z/NPs1apWh+iYe7rvO2Q46lnt0Wp21rY/aw+FfzkBnqmAmTyYt32Cg37NCftRUGTWqfg
	Qy1A==
X-Gm-Message-State: AKaTC036Qmp7XipKVHufYFJpOTNgSYd5bTP2lod3WQbUEWybZNMjw6mf13z+9jU8LsRcoQ==
X-Received: by 10.46.0.218 with SMTP id e87mr39436729lji.54.1481672789132;
	Tue, 13 Dec 2016 15:46:29 -0800 (PST)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	z26sm10269595lja.49.2016.12.13.15.46.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Dec 2016 15:46:28 -0800 (PST)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-devel@lists.openembedded.org, Martin.Jansa@gmail.com,
	ross.burton@intel.com, raj.khem@gmail.com
Date: Wed, 14 Dec 2016 00:46:18 +0100
Message-Id: <20161213234618.31312-8-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161213234618.31312-1-ricardo.ribalda@gmail.com>
References: <20161213234618.31312-1-ricardo.ribalda@gmail.com>
Subject: [meta-oe][PATCH v2 8/8] opencv: Merge dbg packages and Fix QA Issues
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
X-List-Received-Date: Tue, 13 Dec 2016 23:46:28 -0000

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
index 26749ee3a143..2851233c01de 100644
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


