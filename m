Return-Path: <fan.xin@jp.fujitsu.com>
Received: from mgwym04.jp.fujitsu.com (mgwym04.jp.fujitsu.com [211.128.242.43])
	by mail.openembedded.org (Postfix) with ESMTP id 135747197A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Oct 2017 08:46:38 +0000 (UTC)
Received: from yt-mxoi2.gw.nic.fujitsu.com (unknown [192.168.229.69]) by
	mgwym04.jp.fujitsu.com with smtp
	id 7ce6_1bb2_cbbf5a42_b7fb_42d8_9c1b_a8b5a856a4e2;
	Fri, 27 Oct 2017 17:46:37 +0900
Received: from g01jpfmpwkw03.exch.g01.fujitsu.local
	(g01jpfmpwkw03.exch.g01.fujitsu.local [10.0.193.57])
	by yt-mxoi2.gw.nic.fujitsu.com (Postfix) with ESMTP id 7AC81AC0095
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Oct 2017 17:46:36 +0900 (JST)
Received: from g01jpexchkw37.g01.fujitsu.local (unknown [10.0.193.4])
	by g01jpfmpwkw03.exch.g01.fujitsu.local (Postfix) with ESMTP id
	5EE8CBD68C1 for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Oct 2017 17:46:35 +0900 (JST)
Received: from localhost.localdomain (10.54.205.122) by
	g01jpexchkw37.g01.fujitsu.local (10.0.193.67) with Microsoft SMTP
	Server id 14.3.352.0; Fri, 27 Oct 2017 17:46:34 +0900
From: Fan Xin <fan.xin@jp.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 27 Oct 2017 17:46:28 +0900
Message-ID: <1509093988-29131-1-git-send-email-fan.xin@jp.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-Encrypted: FENCE-Mail/3.1.1
X-TM-AS-MML: disable
Subject: [meta-selinux][PATCH] audit: upgrade 2.7.6 -> 2.8.1
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
X-List-Received-Date: Fri, 27 Oct 2017 08:46:39 -0000
Content-Type: text/plain

Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
---
 recipes-security/audit/{audit_2.7.6.bb => audit_2.8.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename recipes-security/audit/{audit_2.7.6.bb => audit_2.8.1.bb} (96%)

diff --git a/recipes-security/audit/audit_2.7.6.bb b/recipes-security/audit/audit_2.8.1.bb
similarity index 96%
rename from recipes-security/audit/audit_2.7.6.bb
rename to recipes-security/audit/audit_2.8.1.bb
index 5bfda7b..52ae4bf 100644
--- a/recipes-security/audit/audit_2.7.6.bb
+++ b/recipes-security/audit/audit_2.8.1.bb
@@ -15,8 +15,8 @@ SRC_URI = "http://people.redhat.com/sgrubb/${BPN}/${BPN}-${PV}.tar.gz \
            file://auditd.service \
            file://audit-volatile.conf \
 "
-SRC_URI[md5sum] = "55a81bbed973b58a90590c949e71dc3e"
-SRC_URI[sha256sum] = "fa65289cffdc95a25bfbdba541f43ee1b12c707090a38fd027dcf9354b9014e7"
+SRC_URI[md5sum] = "76ce8b6a00a1dd0b52a87312eaec0e8e"
+SRC_URI[sha256sum] = "1becde92ff6e81798fa8878820ab2497d867036a6596f55109504b37c8b33b6c"
 
 inherit autotools pythonnative update-rc.d systemd
 
-- 
2.7.4



