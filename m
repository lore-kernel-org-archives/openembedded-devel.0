Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7621265D53
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Aug 2014 09:16:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7J9GOlV016268
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Aug 2014 02:16:24 -0700 (PDT)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Tue, 19 Aug 2014 02:16:24 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 19 Aug 2014 05:16:18 -0400
Message-ID: <ed05681f3f7adec24e895f1eb5f319d32fcdb656.1408438614.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <cover.1408438614.git.jackie.huang@windriver.com>
References: <cover.1408438614.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 3/3] lmbench: fix doc install failure
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
X-List-Received-Date: Tue, 19 Aug 2014 09:16:25 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Fix the failure:
cp: cannot create regular file `/usr/share/man/man1/bargraph.1': Permission denied
mkdir: cannot create directory `/usr/share/man/man9': Permission denied

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../recipes-benchmark/lmbench/lmbench_3.0-a9.bb    |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
index c5d6ac8..67392b4 100644
--- a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
+++ b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
@@ -52,7 +52,7 @@ do_install () {
               > ${D}${sysconfdir}/tmpfiles.d/lmbench.conf
     fi
 
-    oe_runmake 'BASE=${D}${prefix}' \
+    oe_runmake BASE="${D}${prefix}" MANDIR="${D}${mandir}" \
             -C src install
     mv ${D}${bindir}/line ${D}${bindir}/lm_line
     install -m 0755 ${WORKDIR}/lmbench-run ${D}${bindir}/
-- 
1.7.9.5


