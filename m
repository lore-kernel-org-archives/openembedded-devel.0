Received: from mgw-02.mpynet.fi (mgw-02.mpynet.fi [82.197.21.91])
 by mx.groups.io with SMTP id smtpd.web12.11248.1600861017100055023
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2020 04:36:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: tuxera.com, ip: 82.197.21.91, mailfrom: vladimir@tuxera.com)
Received: from pps.filterd (mgw-02.mpynet.fi [127.0.0.1])
	by mgw-02.mpynet.fi (8.16.0.42/8.16.0.42) with SMTP id 08NBX5vQ049662;
	Wed, 23 Sep 2020 14:36:54 +0300
Received: from ex13.tuxera.com (ex13.tuxera.com [178.16.184.72])
	by mgw-02.mpynet.fi with ESMTP id 33n5nvvbh6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2020 14:36:53 +0300
Received: from localhost (194.100.106.190) by tuxera-exch.ad.tuxera.com
 (10.20.48.11) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 23 Sep
 2020 14:36:53 +0300
From: "Vladimir Zapolskiy" <vladimir@tuxera.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH] cifs-utils: remove explicitly set PV variable
Date: Wed, 23 Sep 2020 14:36:47 +0300
Message-ID: <20200923113647.28344-1-vladimir@tuxera.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [194.100.106.190]
X-ClientProxiedBy: tuxera-exch.ad.tuxera.com (10.20.48.11) To
 tuxera-exch.ad.tuxera.com (10.20.48.11)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-09-23_07:2020-09-23,2020-09-23 signatures=0
X-Proofpoint-Spam-Details: rule=mpy_notspam policy=mpy score=0 suspectscore=1 adultscore=0
 mlxlogscore=852 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009230093
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

There is no need to set and then tediously modify PV variable on every
upgrade, what's worse it may happen that the PV is not modified like it
happened on the recent upgrade from cifs-utils-6.10 to cifs-utils-6.11.

Signed-off-by: Vladimir Zapolskiy <vladimir@tuxera.com>
---
 meta-networking/recipes-support/cifs/cifs-utils_6.11.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-networking/recipes-support/cifs/cifs-utils_6.11.bb b/meta-networking/recipes-support/cifs/cifs-utils_6.11.bb
index 09b793119..de3fbb094 100644
--- a/meta-networking/recipes-support/cifs/cifs-utils_6.11.bb
+++ b/meta-networking/recipes-support/cifs/cifs-utils_6.11.bb
@@ -4,8 +4,6 @@ SECTION = "otherosfs"
 LICENSE = "GPLv3 & LGPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-PV = "6.10"
-
 SRCREV = "ded4e81796a18cde73329e838357f084aa05720f"
 SRC_URI = "git://git.samba.org/cifs-utils.git"
 
-- 
2.11.0

