Return-Path: <net147@gmail.com>
Received: from mail-pb0-f50.google.com (mail-pb0-f50.google.com
	[209.85.160.50])
	by mail.openembedded.org (Postfix) with ESMTP id CCEBF608F7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 May 2013 14:41:01 +0000 (UTC)
Received: by mail-pb0-f50.google.com with SMTP id wy17so2285421pbc.23
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 May 2013 07:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=eEDFfqzsksZbNiQD3z2HZocioivNFrrXcTEM3C7+s3s=;
	b=VFGZO0brotz1/CYAwFSFnYOcezyQZ82jmJ+rOg8neOSLZwKYGW2VP/MxEIkJEi8iGN
	WEqyJx0FbB5TmGQhAXrpqjOB0EdrG3m39mqGP/dYG1dr9PiUP+25SyugtkKoo6hsSzGt
	1jjJab1ceNWkJJbGws+JYCLa2TTUot8BYy5G80NZo+HMGf5cyyY/0d4G6uYH1lMwois1
	aXH6Pwjos1IsJvnzlCMtWIFrbPPoc72mJCmv3omkdfynz0Y3up3PBZmSCKoakPhh8zNc
	7iCFtb49UXska0jw2zNZeNzL4h1M0MHkzCmzwz/cdzODxe0meTZVFNydOrOUexX4L/uO
	bhIQ==
X-Received: by 10.66.235.98 with SMTP id ul2mr13844278pac.38.1370011262711;
	Fri, 31 May 2013 07:41:02 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id 3sm46922180pbj.46.2013.05.31.07.41.00
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 31 May 2013 07:41:01 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  1 Jun 2013 00:35:38 +1000
Message-Id: <1370010938-32274-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.3
Subject: [meta-oe][PATCH] llvm-common: move cross script install to sysroot preprocess function
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
X-List-Received-Date: Fri, 31 May 2013 14:41:01 -0000

The llvm-config script doesn't get placed in the target sysroot
crossscripts directory otherwise.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta-oe/recipes-core/llvm/llvm-common.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/llvm/llvm-common.bb b/meta-oe/recipes-core/llvm/llvm-common.bb
index 612fd34..c74ba81 100644
--- a/meta-oe/recipes-core/llvm/llvm-common.bb
+++ b/meta-oe/recipes-core/llvm/llvm-common.bb
@@ -6,7 +6,10 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
 
 SRC_URI = "file://llvm-config"
 
-do_install() {
+SYSROOT_PREPROCESS_FUNCS += "llvm_common_sysroot_preprocess"
+SYSROOT_PREPROCESS_FUNCS_virtclass-native += ""
+
+llvm_common_sysroot_preprocess() {
     install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}/
     install -m 0755 ${WORKDIR}/llvm-config ${SYSROOT_DESTDIR}${bindir_crossscripts}/
 }
-- 
1.8.3


