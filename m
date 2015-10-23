Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 17C8160125
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Oct 2015 09:45:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t9N9jRmo018478
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Oct 2015 02:45:27 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 23 Oct 2015 02:45:27 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 23 Oct 2015 05:45:25 -0400
Message-ID: <1445593525-172503-1-git-send-email-wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH][meta-networking] ntp: upgrade 4.2.8p3 -> 4.2.8p4
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
X-List-Received-Date: Fri, 23 Oct 2015 09:45:28 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

4.2.8p4 fixed following 13 low- and medium-severity vulnerabilities:

  * Bug 2941 CVE-2015-7871
  * Bug 2922 CVE-2015-7855
  * Bug 2921 CVE-2015-7854
  * Bug 2920 CVE-2015-7853
  * Bug 2919 CVE-2015-7852
  * Bug 2918 CVE-2015-7851
  * Bug 2917 CVE-2015-7850
  * Bug 2916 CVE-2015-7849
  * Bug 2913 CVE-2015-7848
  * Bug 2909 CVE-2015-7701
  * Bug 2902 CVE-2015-7703
  * Bug 2901 CVE-2015-7704, CVE-2015-7705
  * Bug 2899 CVE-2015-7691, CVE-2015-7692, CVE-2015-7702

And three bugs: Bug 2382, 1774, 1593

Details at:
  http://support.ntp.org/bin/view/Main/SecurityNotice#Recent_Vulnerabilities

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 .../recipes-support/ntp/{ntp_4.2.8p3.bb => ntp_4.2.8p4.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/ntp/{ntp_4.2.8p3.bb => ntp_4.2.8p4.bb} (97%)

diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.8p3.bb b/meta-networking/recipes-support/ntp/ntp_4.2.8p4.bb
similarity index 97%
rename from meta-networking/recipes-support/ntp/ntp_4.2.8p3.bb
rename to meta-networking/recipes-support/ntp/ntp_4.2.8p4.bb
index 7ce993f..f9f900e 100644
--- a/meta-networking/recipes-support/ntp/ntp_4.2.8p3.bb
+++ b/meta-networking/recipes-support/ntp/ntp_4.2.8p4.bb
@@ -23,8 +23,8 @@ SRC_URI = "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-${PV}.tar.g
            file://ntpd.list \
 "
 
-SRC_URI[md5sum] = "b98b0cbb72f6df04608e1dd5f313808b"
-SRC_URI[sha256sum] = "818ca4f2ed6ca845b1c5ec43f5e6ad905eaa0fc0aab2d509ed6b962a37fbf38f"
+SRC_URI[md5sum] = "6af96862b09324a8ef965ca76b759c8b"
+SRC_URI[sha256sum] = "0d6961572548d2c4af96f58f763e22ac620f5afef717384ddc317a0e365cfdb9"
 
 inherit autotools update-rc.d useradd systemd pkgconfig
 
-- 
1.9.1


