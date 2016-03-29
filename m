Return-Path: <fan.xin@jp.fujitsu.com>
X-Greylist: delayed 656 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 29 Mar 2016 07:42:29 UTC
Received: from mgwym03.jp.fujitsu.com (mgwym03.jp.fujitsu.com [211.128.242.42])
	by mail.openembedded.org (Postfix) with ESMTP id 30AA465CBB
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Mar 2016 07:42:29 +0000 (UTC)
Received: from yt-mxq.gw.nic.fujitsu.com (unknown [192.168.229.66]) by
	mgwym03.jp.fujitsu.com with smtp
	id 4a34_9b52_9355e43c_d757_48b3_ab44_fdf8ea77c4c5;
	Tue, 29 Mar 2016 16:42:22 +0900
Received: from g01jpfmpwkw01.exch.g01.fujitsu.local
	(g01jpfmpwkw01.exch.g01.fujitsu.local [10.0.193.38])
	by yt-mxq.gw.nic.fujitsu.com (Postfix) with ESMTP id 1572AAC00E4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Mar 2016 16:42:22 +0900 (JST)
Received: from G01JPEXCHKW18.g01.fujitsu.local
	(G01JPEXCHKW18.g01.fujitsu.local [10.0.194.57])
	by g01jpfmpwkw01.exch.g01.fujitsu.local (Postfix) with ESMTP id
	5BDB26922F5 for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Mar 2016 16:42:21 +0900 (JST)
Received: from localhost.localdomain (10.24.19.99) by
	G01JPEXCHKW18.g01.fujitsu.local (10.0.194.57) with Microsoft SMTP
	Server id 14.3.266.1; Tue, 29 Mar 2016 16:42:21 +0900
From: Fan Xin <fan.xin@jp.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 29 Mar 2016 16:45:03 +0900
Message-ID: <1459237503-1379-1-git-send-email-fan.xin@jp.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-TM-AS-MML: disable
Cc: Fan Xin <fan.xin@jp.fujitsu.com>
Subject: [PATCH] ntp: Upgrade 4.2.8p4 -> 4.2.8p6
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
X-List-Received-Date: Tue, 29 Mar 2016 07:42:32 -0000
Content-Type: text/plain

Fix CVE-2015-7974 and other bugs.
http://archive.ntp.org/ntp4/ChangeLog-stable

Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
---
 .../recipes-support/ntp/{ntp_4.2.8p4.bb => ntp_4.2.8p6.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/ntp/{ntp_4.2.8p4.bb => ntp_4.2.8p6.bb} (97%)

diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.8p4.bb b/meta-networking/recipes-support/ntp/ntp_4.2.8p6.bb
similarity index 97%
rename from meta-networking/recipes-support/ntp/ntp_4.2.8p4.bb
rename to meta-networking/recipes-support/ntp/ntp_4.2.8p6.bb
index f9f900e..1ecd8c7 100644
--- a/meta-networking/recipes-support/ntp/ntp_4.2.8p4.bb
+++ b/meta-networking/recipes-support/ntp/ntp_4.2.8p6.bb
@@ -23,8 +23,8 @@ SRC_URI = "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-${PV}.tar.g
            file://ntpd.list \
 "
 
-SRC_URI[md5sum] = "6af96862b09324a8ef965ca76b759c8b"
-SRC_URI[sha256sum] = "0d6961572548d2c4af96f58f763e22ac620f5afef717384ddc317a0e365cfdb9"
+SRC_URI[md5sum] = "60049f51e9c8305afe30eb22b711c5c6"
+SRC_URI[sha256sum] = "583d0e1c573ace30a9c6afbea0fc52cae9c8c916dbc15c026e485a0dda4ba048"
 
 inherit autotools update-rc.d useradd systemd pkgconfig
 
-- 
1.8.4.2


