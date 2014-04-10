Return-Path: <sgh@sgh.dk>
Received: from mx-aarh-2.stofanet.dk (mx-aarh-2.stofanet.dk [212.10.10.12])
	by mail.openembedded.org (Postfix) with ESMTP id 62C7360809
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Apr 2014 09:13:22 +0000 (UTC)
Received: from 5634f347.rev.stofanet.dk ([86.52.243.71] helo=asrock)
	by mx-aarh-2.stofanet.dk (envelope-from <sgh@sgh.dk>)
	with esmtp id 1WYB2w-0003Bf-0K; Thu, 10 Apr 2014 11:13:22 +0200
Received: from koontz.localnet (localhost [127.0.0.1])
	by asrock (Postfix) with ESMTPS id D1D327EC32;
	Thu, 10 Apr 2014 11:13:21 +0200 (CEST)
From: =?ISO-8859-1?Q?S=F8ren?= Holm <sgh@sgh.dk>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 Apr 2014 11:13:21 +0200
Message-ID: <8276133.bJdqlryXOd@koontz>
User-Agent: KMail/4.13 rc (Linux/3.13.0-23-lowlatency; KDE/4.12.97; i686; ; )
MIME-Version: 1.0
Cc: =?ISO-8859-1?Q?S=F8ren?= Holm <sgh@sgh.d>
Subject: [PATCH] wvstreams: Set optimization to -O0 to avoid breaking stack protection.
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
X-List-Received-Date: Thu, 10 Apr 2014 09:13:23 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

A description of the bug is here :
See https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=674006
---
 meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb b/meta-
oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
index ce2b337..869402b 100644
--- a/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
+++ b/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
@@ -19,6 +19,8 @@ SRC_URI[sha256sum] = 
"8403f5fbf83aa9ac0c6ce15d97fd85607488152aa84e007b7d0621b8eb
 inherit autotools pkgconfig
 
 PARALLEL_MAKE = ""
+TARGET_CFLAGS_append = " -O0"
+TARGET_CXXFLAGS_append = " -O0"
 
 LDFLAGS_append = " -Wl,-rpath-link,${CROSS_DIR}/${TARGET_SYS}/lib"
 
-- 
1.9.1

