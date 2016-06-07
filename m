Return-Path: <fan.xin@jp.fujitsu.com>
X-Greylist: delayed 679 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 07 Jun 2016 09:29:54 UTC
Received: from mgwkm02.jp.fujitsu.com (mgwkm02.jp.fujitsu.com [202.219.69.169])
	by mail.openembedded.org (Postfix) with ESMTP id 5508D7705D
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Jun 2016 09:29:54 +0000 (UTC)
Received: from kw-mxoi2.gw.nic.fujitsu.com (unknown [192.168.231.133]) by
	mgwkm02.jp.fujitsu.com with smtp
	id 5c9b_454c_22b5cb41_7cdc_41d1_a551_6ac44d8b17bc;
	Tue, 07 Jun 2016 18:18:30 +0900
Received: from g01jpfmpwyt03.exch.g01.fujitsu.local
	(g01jpfmpwyt03.exch.g01.fujitsu.local [10.128.193.57])
	by kw-mxoi2.gw.nic.fujitsu.com (Postfix) with ESMTP id 7D9FAAC0312
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Jun 2016 18:18:29 +0900 (JST)
Received: from g01jpexchyt35.g01.fujitsu.local (unknown [10.128.193.4])
	by g01jpfmpwyt03.exch.g01.fujitsu.local (Postfix) with ESMTP id
	B79CB46E579 for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Jun 2016 18:18:28 +0900 (JST)
Received: from localhost.localdomain (10.24.19.99) by
	g01jpexchyt35.g01.fujitsu.local (10.128.193.50) with Microsoft SMTP
	Server id 14.3.266.1; Tue, 7 Jun 2016 18:18:29 +0900
From: Fan Xin <fan.xin@jp.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 7 Jun 2016 18:18:26 +0900
Message-ID: <1465291106-3984-1-git-send-email-fan.xin@jp.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-TM-AS-MML: disable
Cc: Fan Xin <fan.xin@jp.fujitsu.com>
Subject: [PATCH] ntp: Security fixes via Upgrade to 4.2.8p8
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
X-List-Received-Date: Tue, 07 Jun 2016 09:29:57 -0000
Content-Type: text/plain

CVE-2016-4957
CVE-2016-4953
CVE-2016-4954
CVE-2016-4955
CVE-2016-4956

For more info to see:
http://support.ntp.org/bin/view/Main/SecurityNotice#June_2016_ntp_4_2_8p8_NTP_Securi

Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
---
 .../recipes-support/ntp/{ntp_4.2.8p7.bb => ntp_4.2.8p8.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/ntp/{ntp_4.2.8p7.bb => ntp_4.2.8p8.bb} (97%)

diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.8p7.bb b/meta-networking/recipes-support/ntp/ntp_4.2.8p8.bb
similarity index 97%
rename from meta-networking/recipes-support/ntp/ntp_4.2.8p7.bb
rename to meta-networking/recipes-support/ntp/ntp_4.2.8p8.bb
index d242f93..5f60441 100644
--- a/meta-networking/recipes-support/ntp/ntp_4.2.8p7.bb
+++ b/meta-networking/recipes-support/ntp/ntp_4.2.8p8.bb
@@ -23,8 +23,8 @@ SRC_URI = "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-${PV}.tar.g
            file://ntpd.list \
 "
 
-SRC_URI[md5sum] = "46dfba933c3e4bc924d8e55068797578"
-SRC_URI[sha256sum] = "81d20c06a0b01abe3b84fac092185bf014252d38fe5e7b2758f604680a0220dc"
+SRC_URI[md5sum] = "4a8636260435b230636f053ffd070e34"
+SRC_URI[sha256sum] = "2ab3d0b5f0456e6311dda1cc27ab75da108762773a19e46abd938bd9407b97ee"
 
 inherit autotools update-rc.d useradd systemd pkgconfig
 
-- 
1.8.4.2


