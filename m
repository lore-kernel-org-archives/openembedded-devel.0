Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web10.2742.1594175280399426517
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Jul 2020 19:28:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: qi.chen@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 0682RwuG029110
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Tue, 7 Jul 2020 19:27:59 -0700 (PDT)
Received: from ala-lpggp7.wrs.com (147.11.105.171) by ALA-HCB.corp.ad.wrs.com
 (147.11.189.41) with Microsoft SMTP Server id 14.3.487.0; Tue, 7 Jul 2020
 19:27:39 -0700
From: "Chen Qi" <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][PATCH] multipath-tools: disable parallel build as a workaround
Date: Tue, 7 Jul 2020 19:27:39 -0700
Message-ID: <20200708022739.125124-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

With parallel build enabled, we got the following error:

  ld: error in libsg.o(.eh_frame); no .eh_frame_hdr table will be created
  ....
  ld: BFD (GNU Binutils) 2.34.0.20200220 internal error, aborting at ../../bfd/merge.c:933 in _bfd_merged_section_offset
  ....
  | make[1]: *** [Makefile:24: libcheckcciss_tur.so] Error 1
  | make[1]: *** Waiting for unfinished jobs....

However, looking at the Makefile, it does not seem to have problem.

So disable the parallel build as a workaround.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb
index 0d0319137..48a348d80 100644
--- a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb
+++ b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb
@@ -117,3 +117,4 @@ FILES_kpartx = "${base_sbindir}/kpartx \
                "
 
 RDEPENDS_${PN} += "kpartx"
+PARALLEL_MAKE = ""
-- 
2.21.0

