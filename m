Return-Path: <yevgenyp@pointgrab.com>
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
	[209.85.208.171])
	by mail.openembedded.org (Postfix) with ESMTP id 1F2CF7982B
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Sep 2018 18:10:22 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id s12-v6so13015452ljj.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Sep 2018 11:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pointgrab-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=l77XhdHIyPufW1sQ0ogvjsHtEjJYrnUikJPtCONdAb4=;
	b=fLumF+rxc9TGQ4dRC5pqeoKs7PI2dPXIe2St1DKz7R+z5puDGhRjPFvbYselo9I8qG
	3CaWjeDscJRvmByYKL2O3M46FeiUQ55/JyFT/C0p8nva/du/WnTZoNjU/fo/FcF6JFSo
	K72IJ90G/6n9wMDIZZ7Fj3b0IYE/xo7PlCTV49BXukKHvA5+SBAxTFLpZ1vtYwJO0RFF
	bBlmk5bNrSHi90rC9zD7c8ZYjJoUgDPVAGwV049sVUsBV6xUnedtfz2MDNC4SkZUS5yB
	x74iCWYd/ycVWpuAlu/ZorNwrojH5JNbLZsiGiXGjfKlYhA9Fw6cwdTUDi4QInhKiE89
	Rzxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=l77XhdHIyPufW1sQ0ogvjsHtEjJYrnUikJPtCONdAb4=;
	b=rUl9FcKSvnCCEQ1O9URJFUrVOT6ZDvI2FTHU4ft6mYztftg218X3NTkW8k5DvLdqmz
	h6ftwv+dSPXQ+V35mlkDxjFkgacrqnRobJSbpC5iGkYFFjaaJU587GTZeuoSsMIVNvVi
	vLUKIstB1bGZa2DMX4pl7xOguEU0HvOtFoHuQ9ibrmM4hY2uhs+su+8ZSQVcmEZfWZMT
	84vclg6ajZVYrc/lU74OfFjxkZg6oooDyp991M8nMKD7oLGu3q+riSnkM7Xb6z89l5NX
	tr9BCN9113k9IAhnl7W+iLvONA7K8PWZ0q61O+EdMjaxqPA+dzWn7WgZOUB0QPDijFhA
	t1Uw==
X-Gm-Message-State: APzg51C0Oyd0xedI7Z7Tx7ohuqbqFAHqxWv1vc/Mx6wm9yjHObGRg7IP
	/f5u6Fw34b3/YoN0gKevYklI01v8N4w=
X-Google-Smtp-Source: ANB0Vdb0fmd1XCrRrRa4r+Ey4Zqdqhr4L7AZ0f/aVmXG4CL3f4OXWLk5wKpmazhmMXmQEfBEvP/slA==
X-Received: by 2002:a2e:1bd7:: with SMTP id c84-v6mr5728232ljf.0.1536343822529;
	Fri, 07 Sep 2018 11:10:22 -0700 (PDT)
Received: from yevgeny-lnx.localdomain ([77.222.132.139])
	by smtp.gmail.com with ESMTPSA id
	j24-v6sm1391050lfb.62.2018.09.07.11.10.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 07 Sep 2018 11:10:21 -0700 (PDT)
From: Yevgeny Popovych <yevgenyp@pointgrab.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  7 Sep 2018 21:10:10 +0300
Message-Id: <1536343810-87649-4-git-send-email-yevgenyp@pointgrab.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1536343810-87649-1-git-send-email-yevgenyp@pointgrab.com>
References: <1536343810-87649-1-git-send-email-yevgenyp@pointgrab.com>
Cc: andre.draszik@jci.com
Subject: [meta-java][PATCH 3/3] ca-certificates-java: Distinguish between SYSROOT and D
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
X-List-Received-Date: Fri, 07 Sep 2018 18:10:22 -0000

This fixes ca-certificates-java-hook invocation via
update-ca-certificates on build host and as a native tool.
Provide SYSROOT variable in the postinst and consume it in the script,
like ca-certificates recipe does.

SYSROOT is set whenever the script is executed on the build host
(do_rootfs, or as native dependency).
D is only set during do_rootfs.

Change-Id: Ifbf50ca705a98012e1357ebf5afa33c07ea6cd87
Signed-off-by: Yevgeny Popovych <yevgenyp@pointgrab.com>
---
 .../ca-certificates-java/ca-certificates-java.hook.in   | 17 ++++++++---------
 .../ca-certificates-java_20180516.bb                    |  2 +-
 2 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/recipes-core/ca-certificates-java/ca-certificates-java/ca-certificates-java.hook.in b/recipes-core/ca-certificates-java/ca-certificates-java/ca-certificates-java.hook.in
index 611a4ef..5e89dd9 100755
--- a/recipes-core/ca-certificates-java/ca-certificates-java/ca-certificates-java.hook.in
+++ b/recipes-core/ca-certificates-java/ca-certificates-java/ca-certificates-java.hook.in
@@ -8,20 +8,21 @@
 # and package update in OE, so the distinction between cases 2)
 # and 3) isn't perfect.
 
+# SYSROOT is set whenever the script is executed on the build host
+# (do_rootfs, or as native dependency).
+# D is only set during do_rootfs.
+
 self=$(basename $0)
-jvm_libdir="@@libdir_jvm@@"
+jvm_libdir="${JVM_LIBDIR:-@@libdir_jvm@@}"
 
-if [ -n "${D:-}" ] ; then
-    # called from postinst as part of image build on host
+if [ -n "${SYSROOT:-}" ] ; then
+    # called on build host - from postinst (directly or as a hook) or as a native tool
     if [ -z "${JVM_LIBDIR:-}" ] ; then
         # if JVM_LIBDIR is not present - we were called as a hook
         echo "called as a hook of ca-certificates on do_rootfs, exiting"
         exit 0
     fi
 fi
-if [ -n "${JVM_LIBDIR:-}" ] ; then
-    jvm_libdir="${JVM_LIBDIR}"
-fi
 
 for JAVA in icedtea7-native/bin/java \
             openjdk-8-native/bin/java openjdk-8/bin/java openjre-8/bin/java \
@@ -58,6 +59,4 @@ else
     while read filename ; do
         echo "+${filename}"
     done
-fi | SYSROOT="${D:-}" ${JAVA} -Xmx64m \
-                              -jar ${D:-}@@datadir_java@@/@@JARFILENAME@@ \
-                              -storepass changeit
+fi | ${JAVA} -Xmx64m -jar ${D:-}@@datadir_java@@/@@JARFILENAME@@ -storepass changeit
diff --git a/recipes-core/ca-certificates-java/ca-certificates-java_20180516.bb b/recipes-core/ca-certificates-java/ca-certificates-java_20180516.bb
index 7db5110..2f2536d 100644
--- a/recipes-core/ca-certificates-java/ca-certificates-java_20180516.bb
+++ b/recipes-core/ca-certificates-java/ca-certificates-java_20180516.bb
@@ -100,7 +100,7 @@ pkg_postinst_${PN} () {
 	    fi
 	    JVM_LIBDIR=$NATIVE_ROOT${libdir_jvm}
 	fi
-	JVM_LIBDIR=$JVM_LIBDIR $D${sbindir}/create-ca-certificates-java
+	SYSROOT=$D JVM_LIBDIR=$JVM_LIBDIR $D${sbindir}/create-ca-certificates-java
 }
 
 RDEPENDS_${PN} = "ca-certificates"
-- 
2.7.4


