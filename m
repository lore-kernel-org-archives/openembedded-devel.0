Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BBEDC7EE23
	for <webhook@archiver.kernel.org>; Thu,  2 Mar 2023 00:24:36 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.2625.1677716669511781527
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Mar 2023 16:24:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=A1e614Qf;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=24254468ab=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3220LRdB023222
	for <openembedded-devel@lists.openembedded.org>; Thu, 2 Mar 2023 00:24:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PPS06212021;
 bh=oW4N7uVOxIUIVFZoyFSaaXdA1JvA6uqIt4gIOASjTqg=;
 b=A1e614QfrwR+EwUJq6bjFu+22meCrdFIXF4YO3++cJxDH0Zn1BSeSuTI5DtzdAtcOPI5
 mBgQL1nqEzHF9ND0lJ1ma+3HzcI0c7kSvnYkfVnRfzrTmD7BaYdtmjk0VbCWfUyYicCw
 KzvJ0Dr04lvWAN2xxSH/TqPIBXx/WcanBsnfQbhSm64u25jqrONVh7V6WBrW4rkjfvpX
 KC9lVuSA68O8VGmIQkpcos126Aftof36n1NvnNk4hu8X6sV0DCQJ1JcILTtQg5EjsXDO
 KUBQgp2Zl+2JGZpYxcIVJnnO6QUCjTIrUtUzRE/pNpE/HKg9wZzED8zxXaBW70c+YZYc rQ== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nybmkcvhc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 02 Mar 2023 00:24:28 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Wed, 1 Mar 2023 16:24:27 -0800
Received: from ala-lpggp3.wrs.com (147.11.105.124) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Wed, 1 Mar 2023 16:24:27 -0800
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH 2/3] rsyslog: add disabled PACKAGECONFIG to drop capabilities
Date: Wed, 1 Mar 2023 16:24:26 -0800
Message-ID: <20230302002427.1935420-2-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230302002427.1935420-1-Randy.MacLeod@windriver.com>
References: <20230302002427.1935420-1-Randy.MacLeod@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: CA73xIBN5_Gd0OvPZxA3I2hn4rgd3fm8
X-Proofpoint-ORIG-GUID: CA73xIBN5_Gd0OvPZxA3I2hn4rgd3fm8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-01_16,2023-03-01_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 suspectscore=0 phishscore=0 mlxscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=999 clxscore=1015 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303010194
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Mar 2023 00:24:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101317

Add PACKAGECONFIG to enable dropping capabilities but leave it as disabled
to follow upstream and avoid a systemd issue described below.

rsyslog-8.2302 added a configure option to drop capabilities from
full to:
   chown, dac_override, setgid, setuid, setpcap, net_bind_service,
   net_admin, ipc_lock, sys_chroot, sys_admin, sys_resource, lease,
   syslog, block_suspend
This works fine and passes ptests with sysvinit however
there is a bug when using systemd that breaks some tests:
    https://github.com/rsyslog/rsyslog/issues/5091
Therefore only add a non-default PACKAGECONFIG option in keeping
with the rsyslog upstream.

One can install libcap-ng-bin to run pscap to see the capabilities.

Without this option the ptest result with systemd as init is:
    Version | Passed | Failed | Skipped
     8.2302 | 473    |      0 |       3

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 meta-oe/recipes-extended/rsyslog/rsyslog_8.2302.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2302.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2302.0.bb
index 727e23111..39d9516d0 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2302.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2302.0.bb
@@ -76,6 +76,8 @@ PACKAGECONFIG[mmjsonparse] = "--enable-mmjsonparse,--disable-mmjsonparse,"
 PACKAGECONFIG[mysql] = "--enable-mysql,--disable-mysql,mysql5,"
 PACKAGECONFIG[postgresql] = "--enable-pgsql,--disable-pgsql,postgresql,"
 PACKAGECONFIG[libdbi] = "--enable-libdbi,--disable-libdbi,libdbi,"
+# For libcap-ng, see commit log and  https://github.com/rsyslog/rsyslog/issues/5091
+PACKAGECONFIG[libcap-ng] = "--enable-libcap-ng,--disable-libcap-ng,libcap-ng,"
 PACKAGECONFIG[mail] = "--enable-mail,--disable-mail,,"
 PACKAGECONFIG[valgrind] = ",--without-valgrind-testbench,valgrind,"
 PACKAGECONFIG[imhttp] = "--enable-imhttp,--disable-imhttp,civetweb,"
-- 
2.39.0


