Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q5XMj-0006nP-TS
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Apr 2011 07:57:50 +0200
Received: by mail-iw0-f175.google.com with SMTP id 10so3489063iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Mar 2011 22:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=b1ZpJPNBTPnazfQ8LMmyORNsLEI/+ThnS7e5g0Cxr7A=;
	b=qwS3PF4YqzwabRudJ1HP/Kl8run1e8lr+4Zm5Pu0QuZc7hidlIpCJzMgwCkwL5D/yR
	qx3inOFbQkX6dnreYwiL3eM3c5F9eG4umz0spMDgGJlBX+UjlxKSvx2WdipLazg/sKyp
	s+roaJrzAZwcSz6KR5XWdN0fKA9lG78sv0exY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=jj0QTYV4VtGIa16+JmuKu0uKfFBqhvCqDB0W4TYYEb/MG6quIGXwDBeOSw99JtpEYl
	fwcoov/9EtRFcbhZpaO1l3KUgJXm3abkyfC3n1aegp4QE71/NyVarJcJ4rR6twFTbg4S
	L5lZluJTIHA2smmjaKrUKwWABPxxEUXnz2OT4=
Received: by 10.43.60.138 with SMTP id ws10mr651163icb.301.1301637351085;
	Thu, 31 Mar 2011 22:55:51 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id xi12sm1086554icb.6.2011.03.31.22.55.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 Mar 2011 22:55:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 31 Mar 2011 22:55:26 -0700
Message-Id: <1301637327-26825-6-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1301637327-26825-1-git-send-email-raj.khem@gmail.com>
References: <1301637327-26825-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 6/7] gcc-runtime_4.5.bb: Remove construct to filter -feliminate-dwarf2-dups
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Apr 2011 05:57:51 -0000

This option is no longer default in bitbake.conf

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/gcc/gcc-runtime_4.5.bb |    5 -----
 1 files changed, 0 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-devtools/gcc/gcc-runtime_4.5.bb b/meta-oe/recipes-devtools/gcc/gcc-runtime_4.5.bb
index 1571601..aaa48b5 100644
--- a/meta-oe/recipes-devtools/gcc/gcc-runtime_4.5.bb
+++ b/meta-oe/recipes-devtools/gcc/gcc-runtime_4.5.bb
@@ -9,8 +9,3 @@ SRC_URI_append = "file://fortran-cross-compile-hack.patch"
 ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_INCDIR}"
 
 EXTRA_OECONF += "--disable-libunwind-exceptions"
-
-# gcc 4.5 ends up in ICE when using -feliminate-dwarf2-dups in libstdc++
-# compiling pre compiled headers so we remove this option when compiling 
-# to workaround it
-CXXFLAGS := "${@oe_filter_out('-feliminate-dwarf2-dups', '${CXXFLAGS}', d)}"
-- 
1.7.4.1



