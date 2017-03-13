Return-Path: <armccurdy@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7716570031
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Mar 2017 19:35:51 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id b5so19251692pgg.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Mar 2017 12:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=1dRqhre0PiiaIERuOOjCnF+KYnILvxKcfvOVGYRdbOA=;
	b=gCEBoLjX7dlBHIlxFIS07AOD1TH/UctbJw636b2XFCdgTo1b4OUirMdEPtEydSCcLh
	wisUHzrW99nCNiq6G6aZx6Xi0G5H2KFKdm/k2LShJOGkWigc3CoLtMn3fkQyJX/dWs8r
	8RDfRO1gCYohSn3hyDygzzBHnQ1T9d/wGpdtKUUs8osbAbEmyYvuEVIFa34/J/T5Aqm5
	Hb1irqVQrJjQkBJKpc03qEI8Rk2A5U7rhcuiqq3PLU15GnAthYG1/qpROnsKdxNjZPzx
	K8+OJJRrn0DYAvCQZK5Y5/SJjYvdszY9Lpn6jE9FO7DeoTa0/q9awhFp4Es2+sM4neHw
	kqow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=1dRqhre0PiiaIERuOOjCnF+KYnILvxKcfvOVGYRdbOA=;
	b=JItYCSgBF7fFDz5OGzuMMRGViRSDovAaVb9VG/RTzDG7s7jMmrOfyB7emF01vXr+XB
	WPn+A3d9S9IlXDccOrAPp8UqnVDBkcs1+fUanQHxlZ60Wkkzqh/o80IXsos3aXlBODDg
	1D7tH0ebiOuYpRJoXXcYvR2ROegdrDrmwJEk1oEtuDtlClx91r5MoXG2hRFBmujpBK6H
	nBnvR4M8sOLZtDITwYUitURVBhxzHn+e9fZVoJMkgL8L+aSxEfnRZSrruK8l7eJzKzbK
	rkY5E3HElJKFGGXKPXudOnkxWqIgbpheGl5wNM9uxAgRC3knQNF/Nteh0xoSaywauns4
	4cKw==
X-Gm-Message-State: AMke39mZuQC2ZmsPCpkgbD8fdvCOrjrEFCld7xpGJSBbIoLtIBeYhQPs9ev9446Ew0yq0A==
X-Received: by 10.98.2.21 with SMTP id 21mr39184828pfc.93.1489433752609;
	Mon, 13 Mar 2017 12:35:52 -0700 (PDT)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	s64sm34239234pfe.10.2017.03.13.12.35.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 13 Mar 2017 12:35:50 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Mar 2017 12:35:45 -0700
Message-Id: <1489433745-18568-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH v2] luajit: test SITEINFO_BITS instead of maintaining a list of 32bit targets
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
X-List-Received-Date: Mon, 13 Mar 2017 19:35:51 -0000

When cross compiling, the word size of the compiler set via HOST_CC
must match the word size of the target. That's achieved by appending
"-m32" to BUILD_CC_ARCH if the target word size is known to be 32bits.

Unfortunately the current list of over-rides may not cover all cases.
Using SITEINFO_BITS is a more generic solution.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb b/meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb
index 2049846..cee9cc4 100644
--- a/meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb
+++ b/meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb
@@ -11,7 +11,7 @@ SRC_URI[sha256sum] = "620fa4eb12375021bef6e4f237cbd2dd5d49e56beb414bee052c746bee
 
 S = "${WORKDIR}/LuaJIT-${PV}"
 
-inherit pkgconfig binconfig
+inherit pkgconfig binconfig siteinfo
 
 BBCLASSEXTEND = "native"
 
@@ -21,11 +21,7 @@ BBCLASSEXTEND = "native"
 # you need to install the multilib development package (e.g.
 # libc6-dev-i386 on Debian/Ubuntu) and build a 32 bit host part
 # (HOST_CC="gcc -m32").
-BUILD_CC_ARCH_append_powerpc = ' -m32'
-BUILD_CC_ARCH_append_x86 = ' -m32'
-BUILD_CC_ARCH_append_arm = ' -m32'
-BUILD_CC_ARCH_append_mips = ' -m32'
-BUILD_CC_ARCH_append_mipsel = ' -m32'
+BUILD_CC_ARCH_append = " ${@['-m32',''][d.getVar('SITEINFO_BITS', True) != '32']}"
 
 # The lua makefiles expect the TARGET_SYS to be from uname -s
 # Values: Windows, Linux, Darwin, iOS, SunOS, PS3, GNU/kFreeBSD
-- 
1.9.1


