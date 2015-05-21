Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CF1106AB99
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 May 2015 08:00:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.14.9) with ESMTPS id t4L80vNs010494
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 May 2015 01:00:57 -0700 (PDT)
Received: from localhost (128.224.163.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Thu, 21 May 2015 01:00:56 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 21 May 2015 16:00:48 +0800
Message-ID: <659275558056686d05f6ade8935680321f3efe21.1432194921.git.yi.zhao@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1432194921.git.yi.zhao@windriver.com>
References: <cover.1432194921.git.yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.163.137]
Subject: [meta-oe][PATCH 1/4] libio-pty-perl: fix QA issue for multilib
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
X-List-Received-Date: Thu, 21 May 2015 08:00:56 -0000
Content-Type: text/plain

bitbake lib32-libio-pty-perl
[snip]
ERROR: QA Issue: non debug package contains .debug directory: lib32-libio-pty-perl path
/work/x86-pokymllib32-linux/lib32-libio-pty-perl/1.10-r0/packages-split/lib32-libio-pty-perl/usr/lib/perl/vendor_perl/5.20.0/auto/IO/Tty/.debug/Tty.so [debug-files]
[snip]

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-devtools/perl/libio-pty-perl_1.10.bb   |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/perl/libio-pty-perl_1.10.bb b/meta-oe/recipes-devtools/perl/libio-pty-perl_1.10.bb
index 88db683..a5f887f 100644
--- a/meta-oe/recipes-devtools/perl/libio-pty-perl_1.10.bb
+++ b/meta-oe/recipes-devtools/perl/libio-pty-perl_1.10.bb
@@ -12,3 +12,5 @@ S = "${WORKDIR}/IO-Tty-${PV}"
 
 inherit cpan
 
+FILES_${PN}-dbg += "${libdir}/perl/vendor_perl/*/auto/IO/Tty/.debug/"
+
-- 
1.7.9.5


