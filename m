Return-Path: <mario.goulart@gmail.com>
Received: from mail-qe0-f52.google.com (mail-qe0-f52.google.com
	[209.85.128.52])
	by mail.openembedded.org (Postfix) with ESMTP id 6769160FAF
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Oct 2013 20:07:28 +0000 (UTC)
Received: by mail-qe0-f52.google.com with SMTP id w7so1529640qeb.25
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Oct 2013 13:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=vnhXd+nFdb1VEqLffMIk+WcT1Nfuar5vlkwtOUrC/So=;
	b=hGsULbAnG6I8WMvOamyHylJeNmNZcV4Osyw/8NDDs2LlvijJhXlu6thm4kZOQdp4Ev
	x3GqupwPDadGIOA5p1CBTNYCCNS4mtUx210f/ALcs35QQqOgXNZh8mP/esqYyoL5g9ho
	d/AmJ+P2/JyuWDuR6/SfUoee6dT2NQfeuZtVwEUTKi6yHrQW+BrClcayS+EYO6DeMg+0
	JqUEVWvKuQ7sUbJI30M9Y+GiEuMIveZCT2fD+9ZkL4RxfMmBrr0lbfLUQGORpmdVXOlq
	+icjp61yEen4aTiUFmJWzdj+/r0UNzI1lj0w+iRynDwYcSw/raEWbdyM3ocpQm3SdNwc
	o+ow==
X-Received: by 10.224.19.201 with SMTP id c9mr39720463qab.47.1381176449737;
	Mon, 07 Oct 2013 13:07:29 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id x8sm65720688qam.2.1969.12.31.16.00.00
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 07 Oct 2013 13:07:29 -0700 (PDT)
Sender: Mario Domenech Goulart <mario.goulart@gmail.com>
From: Mario Domenech Goulart <mario@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  7 Oct 2013 17:07:17 -0300
Message-Id: <1381176437-4382-1-git-send-email-mario@ossystems.com.br>
X-Mailer: git-send-email 1.7.10.4
Cc: Mario Domenech Goulart <mario@ossystems.com.br>
Subject: [meta-oe][PATCH] wvstreams: generate wvstreams-valgrind package
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
X-List-Received-Date: Mon, 07 Oct 2013 20:07:30 -0000

Explicitly set --with-valgrind in EXTRA_OECONF (since it doesn't add
up dependencies) and generate the wvstreams-valgrind package.

Fixes

  wvstreams-4.6.1: wvstreams: Files/directories were installed but not shipped
    /usr/lib/valgrind
    /usr/lib/valgrind/wvstreams.supp

Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
---
 meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb |    7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb b/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
index ce2b337..a1b38bd 100644
--- a/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
+++ b/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
@@ -22,8 +22,9 @@ PARALLEL_MAKE = ""
 
 LDFLAGS_append = " -Wl,-rpath-link,${CROSS_DIR}/${TARGET_SYS}/lib"
 
-EXTRA_OECONF = " --without-tcl --without-qt --without-pam --without-valgrind"
+EXTRA_OECONF = " --without-tcl --without-qt --without-pam --with-valgrind"
 
+PACKAGES_prepend = "${PN}-valgrind "
 PACKAGES_prepend = "libuniconf libuniconf-dbg "
 PACKAGES_prepend = "uniconfd uniconfd-dbg "
 PACKAGES_prepend = "libwvstreams-base libwvstreams-base-dbg "
@@ -40,3 +41,7 @@ FILES_libwvstreams-base-dbg = "${libdir}/.debug/libwvutils.so.*"
 
 FILES_libwvstreams-extras     = "${libdir}/libwvbase.so.* ${libdir}/libwvstreams.so.*"
 FILES_libwvstreams-extras-dbg = "${libdir}/.debug/libwvbase.so.* ${libdir}/.debug/libwvstreams.so.*"
+
+FILES_${PN}-valgrind = "${libdir}/valgrind"
+
+RDEPENDS_${PN}-valgrind += "valgrind"
-- 
1.7.10.4


