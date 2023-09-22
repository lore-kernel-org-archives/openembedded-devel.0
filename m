Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B3FFCD4942
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 12:12:02 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.19579.1695384718792605914
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Sep 2023 05:11:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=YFKgZbQD;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7629d4ac35=narpat.mali@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38MCBsWB012687;
	Fri, 22 Sep 2023 05:11:54 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=gvDEe
	VmKfkPjz5FJsRNxhzHrhtqTVuWnElxjo9SgAKE=; b=YFKgZbQDokszTtIe7PrZ9
	zxlRL7dijY6PpfZItn7p5HGpXe+Wz/n1ouFfRkf/LXuyTH//yoJhHrgwXRwYyMzG
	+lE+baIQV4KZ1wfqCbr96VCDhtwg9ZYSfcLDBRtStk/LUC2WXbVswRqxLcx2B/6k
	0x5W9mI7en8OS4VnxNjazxP6u+agmuZpduvtqHJiLf7xBz2Sc3XMI6Bsb0jEUR4G
	2W2IEG5Ze80/7D5J/cO679h/to85lnIRzM0+z2UxO7cGuplXmE459utdn8TWCWCB
	686Xy/U8McMe+al8RRhQmvw479IN0L6vcaDnJtO5m3HKsBV3Al4XqcMTm7wNIaiY
	A==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t8tr5rs39-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 22 Sep 2023 05:11:53 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 22 Sep 2023 05:11:51 -0700
From: nmali <narpat.mali@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <akuster808@gmail.com>
Subject: [meta-oe][kirkstone][PATCH 1/1] open-vm-tools: fix CVE-2023-20900
Date: Fri, 22 Sep 2023 12:11:26 +0000
Message-ID: <20230922121126.2352442-1-narpat.mali@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: kasEzl0R5fJQv7GWme1KxmfL-QsspB4i
X-Proofpoint-GUID: kasEzl0R5fJQv7GWme1KxmfL-QsspB4i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-22_10,2023-09-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999
 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2309180000
 definitions=main-2309220104
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Sep 2023 12:12:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105059

From: Narpat Mali <narpat.mali@windriver.com>

A malicious actor that has been granted Guest Operation Privileges
https://docs.vmware.com/en/VMware-vSphere/8.0/vsphere-security/GUID
-6A952214-0E5E-4CCF-9D2A-90948FF643EC.html in a target virtual machine
may be able to elevate their privileges if that target virtual machine
has been assigned a more privileged Guest Alias https://vdc-download.
vmware.com/vmwb-repository/dcr-public/d1902b0e-d479-46bf-8ac9-cee0e31
e8ec0/07ce8dbd-db48-4261-9b8f-c6d3ad8ba472/vim.vm.guest.AliasManager.html .

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-20900
https://security-tracker.debian.org/tracker/CVE-2023-20900

Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
---
 .../open-vm-tools/CVE-2023-20900.patch        | 36 +++++++++++++++++++
 .../open-vm-tools/open-vm-tools_11.3.5.bb     |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta-networking/recipes-support/open-vm-tools/open-vm-tools/CVE-2023-20900.patch

diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/CVE-2023-20900.patch b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/CVE-2023-20900.patch
new file mode 100644
index 0000000000..1b51e500aa
--- /dev/null
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/CVE-2023-20900.patch
@@ -0,0 +1,36 @@
+From 108d81c70d0a6792847051d121a660ef3511517d Mon Sep 17 00:00:00 2001
+From: Katy Feng <fkaty@vmware.com>
+Date: Fri, 22 Sep 2023 10:15:58 +0000
+Subject: [PATCH] Allow only X509 certs to verify the SAML token signature.
+
+CVE: CVE-2023-20900
+
+Upstream-Status: Backport [https://github.com/vmware/open-vm-tools/commit/74b6d0d9000eda1a2c8f31c40c725fb0b8520b16]
+
+Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
+---
+ open-vm-tools/vgauth/serviceImpl/saml-xmlsec1.c | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/open-vm-tools/vgauth/serviceImpl/saml-xmlsec1.c b/open-vm-tools/vgauth/serviceImpl/saml-xmlsec1.c
+index aaa5082a..ad8fe304 100644
+--- a/open-vm-tools/vgauth/serviceImpl/saml-xmlsec1.c
++++ b/open-vm-tools/vgauth/serviceImpl/saml-xmlsec1.c
+@@ -1273,7 +1273,14 @@ VerifySignature(xmlDocPtr doc,
+     */
+    bRet = RegisterID(xmlDocGetRootElement(doc), "ID");
+    if (bRet == FALSE) {
+-      g_warning("failed to register ID\n");
++      g_warning("Failed to register ID\n");
++      goto done;
++   }
++
++   /* Use only X509 certs to validate the signature */
++   if (xmlSecPtrListAdd(&(dsigCtx->keyInfoReadCtx.enabledKeyData),
++                        BAD_CAST xmlSecKeyDataX509Id) < 0) {
++      g_warning("Failed to limit allowed key data\n");
+       goto done;
+    }
+
+--
+2.40.0
diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools_11.3.5.bb b/meta-networking/recipes-support/open-vm-tools/open-vm-tools_11.3.5.bb
index 4670a85a67..cf3af007b9 100644
--- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools_11.3.5.bb
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools_11.3.5.bb
@@ -45,6 +45,7 @@ SRC_URI = "git://github.com/vmware/open-vm-tools.git;protocol=https;branch=maste
            file://0002-hgfsServerLinux-Consider-64bit-time_t-possibility.patch;patchdir=.. \
            file://0001-open-vm-tools-Correct-include-path-for-poll.h.patch;patchdir=.. \
            file://0001-Properly-check-authorization-on-incoming-guestOps-re.patch;patchdir=.. \
+           file://CVE-2023-20900.patch;patchdir=.. \
            "
 
 UPSTREAM_CHECK_GITTAGREGEX = "stable-(?P<pver>\d+(\.\d+)+)"
-- 
2.40.0


