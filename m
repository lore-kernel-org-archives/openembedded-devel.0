Return-Path: <danismostlikely@gmail.com>
X-Greylist: delayed 1258 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 12 May 2014 16:59:25 UTC
Received: from mail-qa0-f45.google.com (unknown [209.85.216.45])
	by mail.openembedded.org (Postfix) with ESMTP id 0CDFA61F16
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 May 2014 16:59:25 +0000 (UTC)
Received: by mail-qa0-f45.google.com with SMTP id hw13so7389897qab.32
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 May 2014 09:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=9XbvIP4KJnFpm536TKcPaBxQF/l13C2yJiqyYnkSnE0=;
	b=TdlTPEwd+UOsZdnSgV+wrdfYDJArKycwlO7RSlhZBLXBIxa3q7x4opw9k2TKTccs2l
	o0s/Zhch0zV/dmqYneB1JQlEUrhvbJ0tVUUQeFX9Be6GpEkrQoZ8wirFchzmqJx7nKXi
	1AF1cwIKAa/8cqahCT1vosgHDZrRA9rZ/be4XHKTr5dtQhRigUUV8qW6NslEV5klkDDj
	PYrrApaX8/JOkiyZRiRZ2Pxsd1p+GJSu8maXrZKjPFxIyRDWyW7HRW4fXXImiTvxsp4b
	tqaQaCweEoYY/Bqzjf09wgcTJ8w4H2xBjY2Yiv6lXZA4MDVXxqH6eCF30qmQ6pXvFDyJ
	5sGQ==
MIME-Version: 1.0
X-Received: by 10.229.239.4 with SMTP id ku4mr39805298qcb.17.1399912246726;
	Mon, 12 May 2014 09:30:46 -0700 (PDT)
Received: by 10.96.148.2 with HTTP; Mon, 12 May 2014 09:30:46 -0700 (PDT)
Date: Mon, 12 May 2014 10:30:46 -0600
Message-ID: <CACS+7ZQ1i2nTKLcD+toOBN2BPA9PE=zzdD05oDLmPkCKco-NUA@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] netcat-openbsd: fixup patching
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 12 May 2014 16:59:31 -0000
Content-Type: text/plain; charset=UTF-8

From: Dan McGregor <dan.mcgregor@usask.ca>

Do the patching in the do_patch phase instead of the compile
phase. That way if the compile phase needs to be rerun
patching isn't attempted a second time.

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 .../recipes-support/netcat/netcat-openbsd_1.105.bb            | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/netcat/netcat-openbsd_1.105.bb
b/meta-networking/recipes-support/netcat/netcat-openbsd_1.105.bb
index 4474e1d..4489656 100644
--- a/meta-networking/recipes-support/netcat/netcat-openbsd_1.105.bb
+++ b/meta-networking/recipes-support/netcat/netcat-openbsd_1.105.bb
@@ -15,11 +15,20 @@ SRC_URI[netcat-patch.sha256sum] =
"eee759327ffea293e81d0dde67921b7fcfcad279ffd7a

 S = "${WORKDIR}/${BPN}-${PV}"

+netcat_do_patch() {
+    cd ${S}
+    while read line; do patch -p1 < ${WORKDIR}/debian/patches/$line;
done < ${WORKDIR}/debian/patches/series
+}
+
+python do_patch() {
+    bb.build.exec_func('netcat_do_patch', d)
+    bb.build.exec_func('patch_do_patch', d)
+}
+
 do_configure[noexec] = "1"

 do_compile() {
     cd ${S}
-    while read line; do patch -p1 < ${WORKDIR}/debian/patches/$line;
done < ${WORKDIR}/debian/patches/series
     pkgrel=4
     oe_runmake CFLAGS="$CFLAGS -DDEBIAN_VERSION=\"\\\"${pkgrel}\\\"\""
 }
-- 
1.9.0

