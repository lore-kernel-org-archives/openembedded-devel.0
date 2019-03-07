Return-Path: <marek.belisko@gmail.com>
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
	[209.85.128.52])
	by mail.openembedded.org (Postfix) with ESMTP id 42F397CE8B
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Mar 2019 11:57:54 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id j125so8995182wmj.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Mar 2019 03:57:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=TJoqTsZFsLc9mhLuN9hehbaJlHs2FTrbLNCWMAQO42Q=;
	b=Ui4Nd9mN/R+8rzW/3EHV9ammCyXiUAcSePQGMje9hM3DgajFKKVeT6KEajGutOycgQ
	idmg9/R1y+v2PTI6q1HvCEM4pfZ9fnYtguGu+TRcz/mvOcfHuPx2cNiDpMjr6kYJuDXL
	POW09vl2kNn0DHongOVi546WwH9Iv62LPhptxqXxa9FD894ATNzQOVAvGG7+34t4GMPi
	nnpfbA8yfF2ue+R+z8+nvYgsY7Hta17WA3y2sVJDx/BKO4Blv8+Vh0+wnSOaQVj5LKYy
	WhkF2Gpa+6O4P1dn/4ues5pLcywOf0pg2lPV7VHoSFp3trOW7MGjUnj0ZIovwRmOVo3r
	AMsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=TJoqTsZFsLc9mhLuN9hehbaJlHs2FTrbLNCWMAQO42Q=;
	b=INatapStxO4u8x0tuJzMyKGo3Hf67bKTaQEoQypgRwpNEAyHgUy+mPZd3sr6skhjPT
	mWEumPfyVoD/r4/WvYKjgkLc0vtfHllGQdfulBdFdPRSIT0h9IR7fGP2FLztz+lawUrf
	jX6iI4LnxyzatgjCvkL2nSrdhSEFG7eQ9dTjRIKQ0U5JA1MJqex5gFanyMLVnZz+s09f
	uPRNcDdcIenjb/mS/dC5vN8MPqrJzCanovYhD6KymZf5NSgPBcrL1OAp9QOuP2jvpoUo
	E+9RWe+2TPcqLM5q1YEKPbtFwmvf6XnKbP6/AxmQZZZF/u0h/wBzBfNXjF9/gP0oxjYW
	gQng==
X-Gm-Message-State: APjAAAVLHk33Y3+UTku/aiTf3RzyR+t8ZQDvFPA9dbzx9Kcl5//fEWDP
	xMmXVQvb2D+mSyvMvdfrKGwRD4wIJ2U=
X-Google-Smtp-Source: APXvYqxWp31ibMH7BZwRBPqKvYAWkGYJn0hXpABPOw9CKemRr3LLNYIFJl6PW60cG5clqHBRhUQOVg==
X-Received: by 2002:a1c:e084:: with SMTP id x126mr5665335wmg.39.1551959874364; 
	Thu, 07 Mar 2019 03:57:54 -0800 (PST)
Received: from localhost.localdomain (178-143-25-215.dynamic.orange.sk.
	[178.143.25.215])
	by smtp.gmail.com with ESMTPSA id o8sm7804200wma.1.2019.03.07.03.57.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 07 Mar 2019 03:57:53 -0800 (PST)
Sender: Belisko Marek <marek.belisko@gmail.com>
From: Marek Belisko <marek.belisko@open-nandra.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Mar 2019 12:57:51 +0100
Message-Id: <1551959871-9647-1-git-send-email-marek.belisko@open-nandra.com>
X-Mailer: git-send-email 2.7.4
Cc: Marek Belisko <marek.belisko@open-nandra.com>
Subject: [meta-java][PATCH] jamvm: Disable inlining
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
X-List-Received-Date: Thu, 07 Mar 2019 11:57:54 -0000

This will fix crashes seen when build openjdk-8:

ERROR: jaxp1.3-native-1.4.01-r0 do_compile: Function failed: do_compile (log file is located at /home/jenkins/my_build/tmp/work/x86_64-linux/jaxp1.3-native/1.4.01-r0/temp/log.do_compile.28894)
ERROR: Logfile of failure stored in: /home/jenkins/my_build/tmp/work/x86_64-linux/jaxp1.3-native/1.4.01-r0/temp/log.do_compile.28894
Log data follows:
| DEBUG: Executing shell function do_compile
| Illegal instruction (core dumped)
| WARNING: exit code 132 from a shell command.
| ERROR: Function failed: do_compile (log file is located at /home/jenkins/my_build/tmp/work/x86_64-linux/jaxp1.3-native/1.4.01-r0/temp/log.do_compile.28894)
ERROR: Task (virtual:native:/home/jenkins/meta-java/recipes-core/xml-commons/jaxp1.3_1.4.01.bb:do_compile) failed with exit code '1'


Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
---
 recipes-core/jamvm/jamvm.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-core/jamvm/jamvm.inc b/recipes-core/jamvm/jamvm.inc
index fc21380..8a1ed63 100644
--- a/recipes-core/jamvm/jamvm.inc
+++ b/recipes-core/jamvm/jamvm.inc
@@ -29,7 +29,7 @@ do_configure_append_class-native() {
 }
 
 
-EXTRA_OECONF = "--with-classpath-install-dir=${prefix} --libdir=${libdir}/jamvm --enable-ffi"
+EXTRA_OECONF = "--with-classpath-install-dir=${prefix} --libdir=${libdir}/jamvm --enable-ffi --disable-int-inlining"
 
 # Needed for big compilation targets like OpenJDK
 CFLAGS_append_class-native = " -DDEFAULT_MAX_HEAP=1024*MB"
-- 
2.7.4


