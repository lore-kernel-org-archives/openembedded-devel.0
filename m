Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web10.3619.1592905718208276987
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Jun 2020 02:48:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EcYRmvQ/;
 spf=pass (domain: gmail.com, ip: 209.85.221.65, mailfrom: uvv.mail@gmail.com)
Received: by mail-wr1-f65.google.com with SMTP id z13so8053143wrw.5
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jun 2020 02:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HJBqBIJ530EprYKlBpjCwdcbXZhs1kI04WJs/0kMhT4=;
        b=EcYRmvQ//d6XJrRn2tgxuwIR457qF4/VoCnBd2Z1BgEif47PYxvXxBrwhpZ1+D6CSw
         eRevl+BPVj4ulvmp2L2JuCe4/nhzecy7HewKrtP5pahkHXfDAHDV30FTjTxW4HF1qF71
         KWjQCROg+Veiyj1TRwIJCamHn1exr5g5nmg6cycp1lfMysgiRsPqN6OWJ/ERe/pF8uJA
         0G9zpc7298Hn0Uejkb0bAKTi3yUW8Nt6qe3joPsFXJRZW289wsFFeGWhwgMin5JZ4y15
         w6MY2XGih7OduUXOgY34fHThKgcuEYJIvCEu3208OZ9OS3CLJLGgEE6Dn3Jcrf6kH0mI
         A6hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HJBqBIJ530EprYKlBpjCwdcbXZhs1kI04WJs/0kMhT4=;
        b=PFr0iho4a+h4ZPVTsVCvOzWgeGYalxB7HO/IQ2sfUwww7MZSKhUD7IexmByk8S80Ok
         X57HN6r7I/NQm9At3cywKcQJJSS0HGSaFGVnGqdgvD/jAMFvi1+xL6jBelnQXFNzn8JP
         vrEpvn6c9l1sC5m3B4eSLYN8D+q1y9bAqeSecHphL0mDCcUBhJlmH6ztOhipAQUUhve7
         9PuzvFoYhL++Gtw89Q61y/iFK+An9X0RFW6KiBku0wx4hH/Ejw/J5ZOxNx+N5X7Akt9Q
         H9v7VhZT9o81ftN1BdxAFxeCGb1bYx+j3OGl3olSHh/Ol6DOERM0+jqC5qXiQWL9JujD
         QOkA==
X-Gm-Message-State: AOAM531lljSp7FW/EbsUOb13Ehta7bDKc4NoDNffGNQfutbJiLhKcJSC
	Xmep2z3tfJxB3r40+6kR+U2hcygeOhc=
X-Google-Smtp-Source: ABdhPJw9hssji56DkOae2ZvTooA24ZBBJQqY1LSBfL8+1lBmDIhBvgSKt9itxlVMjBHorl+fx+l59w==
X-Received: by 2002:a5d:4bc8:: with SMTP id l8mr8623974wrt.159.1592905716412;
        Tue, 23 Jun 2020 02:48:36 -0700 (PDT)
Return-Path: <uvv.mail@gmail.com>
Received: from localhost.localdomain (dslb-002-205-007-033.002.205.pools.vodafone-ip.de. [2.205.7.33])
        by smtp.gmail.com with ESMTPSA id 1sm2876222wmf.21.2020.06.23.02.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2020 02:48:35 -0700 (PDT)
From: "Vyacheslav Yurkov" <uvv.mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
Subject: [meta-java][PATCH] jlex: set unique file name for download
Date: Tue, 23 Jun 2020 11:48:25 +0200
Message-Id: <20200623094825.33289-1-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>

Signed-off-by: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
---
 recipes-core/jlex/jlex_1.2.6.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/recipes-core/jlex/jlex_1.2.6.bb b/recipes-core/jlex/jlex_1.2.6.bb
index b8f9ffb..3c14e4c 100644
--- a/recipes-core/jlex/jlex_1.2.6.bb
+++ b/recipes-core/jlex/jlex_1.2.6.bb
@@ -1,7 +1,9 @@
 SUMMARY = "Lexical analyzer generator for Java"
 AUTHOR = "Elliot Berk, A. Appel, C. Scott Ananian"
+
+JLEX_MAIN_FILENAME = "jlex-${PV}-Main.java"
 LICENSE = "JLEX"
-LIC_FILES_CHKSUM = "file://Main.java;beginline=148;endline=166;md5=9bf4a6a951053991db64f9d7330d648a"
+LIC_FILES_CHKSUM = "file://${JLEX_MAIN_FILENAME};beginline=148;endline=166;md5=9bf4a6a951053991db64f9d7330d648a"
 
 PACKAGE_ARCH = "${TUNE_PKGARCH}"
 
@@ -10,7 +12,7 @@ RDEPENDS_${PN}_class-native = ""
 
 inherit java-library
 
-SRC_URI = "http://www.cs.princeton.edu/~appel/modern/java/JLex/Archive/${PV}/Main.java \
+SRC_URI = "http://www.cs.princeton.edu/~appel/modern/java/JLex/Archive/${PV}/Main.java;downloadfilename=${JLEX_MAIN_FILENAME} \
            file://jlex \
           "
 
@@ -26,6 +28,7 @@ do_configure() {
 
 do_compile() {
 	mkdir -p build
+	cp ${JLEX_MAIN_FILENAME} Main.java
 
 	javac -d build Main.java
 
-- 
2.25.1

