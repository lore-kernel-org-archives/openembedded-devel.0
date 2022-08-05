Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 501A8C00140
	for <webhook@archiver.kernel.org>; Fri,  5 Aug 2022 08:33:49 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.4633.1659688427299835291
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Aug 2022 01:33:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=eXki/YO5;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=52163d968b=mingli.yu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 2757x2b3031638
	for <openembedded-devel@lists.openembedded.org>; Fri, 5 Aug 2022 08:33:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=y/jzTD83hOGS1+eqDhddSeesZIubVOvstWVdRke6bsw=;
 b=eXki/YO5FW1+sna29Swvpr/egRAEeLTZnumFBYPLYD82FyEMMfm/N7pNx/2mtfBLCqWd
 Njx4gnMJj5JVeOnh/QztbMKBjUu2s2QHCH6jNgxwxwbbQkFDhfyqBMW0OfFVCVbW9ZOf
 bOVKJ1R0mSS7rZ2W2c/Ufr9wBwTsiJyzZAWH17eYxouJSOpyNMsSGS15CCzSyLaTC+pn
 RbBC/w8tCVvddnRAgLA+5715FFnmRmFlknmv6HLPpCxwcdja7qM0xCR3egnbiuqEMTwa
 eOzxrQR002x1LzuwUzvHI1ScwnkqgCtrU+1WCJbXIVENv5OvZ2yiHNofA/kP0MshaFs5 Og==
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com
 [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hr400969n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Aug 2022 08:33:45 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 5 Aug 2022 01:33:43 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Fri, 5 Aug 2022 01:33:43 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][PATCH] frr: fix buildpaths issue
Date: Fri, 5 Aug 2022 16:33:42 +0800
Message-ID: <20220805083342.726297-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 4-wVSiadav4rYVLZaOSg_05R_xr09vTM
X-Proofpoint-ORIG-GUID: 4-wVSiadav4rYVLZaOSg_05R_xr09vTM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-05_03,2022-08-04_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 mlxscore=0 bulkscore=0 adultscore=0 mlxlogscore=707
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 spamscore=0
 malwarescore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2206140000 definitions=main-2208050042
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 05 Aug 2022 08:33:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98134

From: Mingli Yu <mingli.yu@windriver.com>

Fixes:
  WARNING: frr-8.2.2-r0 do_package_qa: QA Issue: File /usr/lib/libfrr.a in package frr-staticdev contains reference to TMPDIR [buildpaths]
  WARNING: frr-8.2.2-r0 do_package_qa: QA Issue: File /usr/src/debug/frr/8.2.2-r0/git/lib/version.h in package frr-src contains reference to TMPDIR [buildpaths]
  WARNING: frr-8.2.2-r0 do_package_qa: QA Issue: File /usr/include/frr/version.h in package frr-dev contains reference to TMPDIR [buildpaths]
  WARNING: frr-8.2.2-r0 do_package_qa: QA Issue: File /usr/bin/vtysh in package frr contains reference to TMPDIR
  File /usr/lib/libfrr.so.0.0.0 in package frr contains reference to TMPDIR [buildpaths]

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-networking/recipes-protocols/frr/frr_8.2.2.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-networking/recipes-protocols/frr/frr_8.2.2.bb b/meta-networking/recipes-protocols/frr/frr_8.2.2.bb
index 05195a3f6..f0d0dbf7c 100644
--- a/meta-networking/recipes-protocols/frr/frr_8.2.2.bb
+++ b/meta-networking/recipes-protocols/frr/frr_8.2.2.bb
@@ -73,6 +73,11 @@ SYSTEMD_PACKAGES = "${PN}"
 SYSTEMD_SERVICE:${PN} = "frr.service"
 SYSTEMD_AUTO_ENABLE = "disable"
 
+do_compile:prepend () {
+   sed -i -e 's#${RECIPE_SYSROOT_NATIVE}##g' \
+          -e 's#${RECIPE_SYSROOT}##g' ${S}/lib/version.h
+}
+
 do_compile:class-native () {
     oe_runmake clippy-only
 }
-- 
2.25.1


