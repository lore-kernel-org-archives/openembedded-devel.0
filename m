Return-Path: <fan.xin@jp.fujitsu.com>
X-Greylist: delayed 673 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 04 Sep 2017 04:55:22 UTC
Received: from mgwym04.jp.fujitsu.com (mgwym04.jp.fujitsu.com [211.128.242.43])
	by mail.openembedded.org (Postfix) with ESMTP id 588ED780E4
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Sep 2017 04:55:22 +0000 (UTC)
Received: from yt-mxoi2.gw.nic.fujitsu.com (unknown [192.168.229.69]) by
	mgwym04.jp.fujitsu.com with smtp
	id 76bb_167f_e8ed16c0_01a3_45cc_a4fa_7b8a17f53e2d;
	Mon, 04 Sep 2017 13:44:04 +0900
Received: from g01jpfmpwyt02.exch.g01.fujitsu.local
	(g01jpfmpwyt02.exch.g01.fujitsu.local [10.128.193.56])
	by yt-mxoi2.gw.nic.fujitsu.com (Postfix) with ESMTP id CAFA1AC00C2
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Sep 2017 13:44:04 +0900 (JST)
Received: from g01jpexchyt38.g01.fujitsu.local (unknown [10.128.193.4])
	by g01jpfmpwyt02.exch.g01.fujitsu.local (Postfix) with ESMTP id
	AEF78584279 for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Sep 2017 13:44:03 +0900 (JST)
Received: from localhost.localdomain (10.54.205.122) by
	g01jpexchyt38.g01.fujitsu.local (10.128.193.68) with Microsoft SMTP
	Server id 14.3.352.0; Mon, 4 Sep 2017 13:44:03 +0900
From: Fan Xin <fan.xin@jp.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 4 Sep 2017 13:44:01 +0900
Message-ID: <1504500241-24419-1-git-send-email-fan.xin@jp.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-Encrypted: FENCE-Mail/3.1.1
X-TM-AS-MML: disable
Subject: [PATCH] tftp-hpa: Add HOMEPAGE info into recipe file.
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
X-List-Received-Date: Mon, 04 Sep 2017 04:55:24 -0000
Content-Type: text/plain

Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
---
 meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb b/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
index 7f56713..fff661c 100644
--- a/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
+++ b/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
@@ -7,6 +7,7 @@ remote machine.  This program and TFTP provide very little security, \
 and should not be enabled unless it is expressly needed."
 DEPENDS = "tcp-wrappers readline"
 SECTION = "net"
+HOMEPAGE = "http://freecode.com/projects/tftp-hpa"
 LICENSE = "BSD-4-Clause"
 LIC_FILES_CHKSUM = "file://MCONFIG.in;beginline=1;endline=9;md5=c28ba5adb43041fae4629db05c83cbdd \
                     file://tftp/tftp.c;beginline=1;endline=32;md5=988c1cba99d70858a26cd877209857f4"
-- 
2.7.4



