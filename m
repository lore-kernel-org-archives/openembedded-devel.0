Return-Path: <fan.xin@jp.fujitsu.com>
Received: from mgwym03.jp.fujitsu.com (mgwym03.jp.fujitsu.com [211.128.242.42])
	by mail.openembedded.org (Postfix) with ESMTP id 19F486E666
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Mar 2016 07:42:43 +0000 (UTC)
Received: from yt-mxauth.gw.nic.fujitsu.com (unknown [192.168.229.68]) by
	mgwym03.jp.fujitsu.com with smtp
	id 4a34_646f_455e09fd_a2ed_4394_87ac_b331dc218867;
	Tue, 29 Mar 2016 16:31:30 +0900
Received: from g01jpfmpwyt02.exch.g01.fujitsu.local
	(g01jpfmpwyt02.exch.g01.fujitsu.local [10.128.193.56])
	by yt-mxauth.gw.nic.fujitsu.com (Postfix) with ESMTP id 2733BAC0698
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Mar 2016 16:31:28 +0900 (JST)
Received: from g01jpexchyt37.g01.fujitsu.local (unknown [10.128.193.4])
	by g01jpfmpwyt02.exch.g01.fujitsu.local (Postfix) with ESMTP id
	778B85842C4 for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Mar 2016 16:31:27 +0900 (JST)
Received: from localhost.localdomain (10.24.19.99) by
	g01jpexchyt37.g01.fujitsu.local (10.128.193.67) with Microsoft SMTP
	Server id 14.3.266.1; Tue, 29 Mar 2016 16:31:26 +0900
From: Fan Xin <fan.xin@jp.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 29 Mar 2016 16:34:08 +0900
Message-ID: <1459236848-1236-1-git-send-email-fan.xin@jp.fujitsu.com>
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
X-List-Received-Date: Tue, 29 Mar 2016 07:42:46 -0000
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


