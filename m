Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.4575.1631245982043456614
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Sep 2021 20:53:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=gDc4NUDh;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=48872d6ca6=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18A3r12i007577
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Sep 2021 03:53:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=XIuXkEJTAK4InQDdK2/RfOmoxQ7z8bgW7v92c0mSBeE=;
 b=gDc4NUDhwP9DFB0n4uj6dQZkw2KjuRr7vCmwDuBmF1/lWhSM5Xt6m/aA6jUAimbTcXkB
 3620QsRZRd7c096Uxigmnb7JhQNqRQZGpiJSctsMXCervidqIBX3to9bufChW+kRut/j
 VpT5LxdtlsPltjexczXQpB+XXBFc5Iu97KWC47hNL6RttSLkA6+53ZgVGLqrXPtjVkgx
 g/P2cS64KY/vWx4aHu2+XrhmWuAac5Kv5AvFzBB1mkrfiIOiLZToYsl9rdSQGmvvo/VR
 IRjTn2oYleUFCP64DUhkCTfrkdlRTDF1WwHaqho9XHNlC+S65l8VVVjEo64Yg1Aap2xI mw== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2102.outbound.protection.outlook.com [104.47.70.102])
	by mx0a-0064b401.pphosted.com with ESMTP id 3aytea06u7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Sep 2021 03:53:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IpF1/NfiBcGRXwb58g1JOxIj6aVomtEbvusAOwlXeOO235OEtI5wh78MdQMKuGO0QsksOEoDBlHlSMXFTeX4dgylyaFXCikVH1cH7i7qp3vvngz5bUEdmeLz0O9JrX0ize0vfaUliy+3W0rlG0cZh5crVGJ4rYpHMXPRO/yj1fKLV1d0GHZWLZ/7FutRiu87sw0dQ3O7NI8orRw/NTgWho3voH5fkk9WMWoI0vSFdU9x5ksfTdzWvUlR938WhmiSwdxdXzwROzAf/aMxLQXgCl51iJfTlDzAEZzf28sX8X/nRsKMjO3ncD+2kWdGQMfCxYzskvCpHf+r39oH/PJpEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=XIuXkEJTAK4InQDdK2/RfOmoxQ7z8bgW7v92c0mSBeE=;
 b=Ma4YBtrN1z4jtn0MQf2VBXNUCLSkPdDquWrTElSSmiopJU8Zf+hIR5FrnJmxMNMwKts+ecgsW1oPdYspzIz5pukMbWDz6w1PPnrARFAExIc7ePSXNGKHD0ZQ54Y1chpTNgv+347mEUM7EPs9kPVNc/RYpbZ+D5AX3x2URZRPeLvBkFI1N8uYSuuSrfE762splQTRes641DdP+Wz5mnWPMxK0hL2iTV2KR7FVhkN4tCeK4UmjJ79qIW0PZRckjiCTE9LI4BxdzZfFPyc8qsIaA2b4fzNC1v/iZzom7Ccro4oMjlQnygbn3jmq18f9msP9SRHy8X0uzspoybBH1nuzkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SA2PR11MB4875.namprd11.prod.outlook.com (2603:10b6:806:11a::6)
 by SA2PR11MB5148.namprd11.prod.outlook.com (2603:10b6:806:11e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.17; Fri, 10 Sep
 2021 03:52:59 +0000
Received: from SA2PR11MB4875.namprd11.prod.outlook.com
 ([fe80::e469:3075:63e2:ca4]) by SA2PR11MB4875.namprd11.prod.outlook.com
 ([fe80::e469:3075:63e2:ca4%9]) with mapi id 15.20.4500.017; Fri, 10 Sep 2021
 03:52:59 +0000
From: "Yi Zhao" <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] krb5: fix CVE-2021-37750
Date: Fri, 10 Sep 2021 11:52:48 +0800
Message-Id: <20210910035248.67534-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: HK2P15301CA0018.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::28) To SA2PR11MB4875.namprd11.prod.outlook.com
 (2603:10b6:806:11a::6)
MIME-Version: 1.0
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by HK2P15301CA0018.APCP153.PROD.OUTLOOK.COM (2603:1096:202:1::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.1 via Frontend Transport; Fri, 10 Sep 2021 03:52:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9b5e6bce-9c12-4320-ca4d-08d9740e7b28
X-MS-TrafficTypeDiagnostic: SA2PR11MB5148:
X-Microsoft-Antispam-PRVS: 
	<SA2PR11MB5148DB55F3A462CE3FA2EB0BF9D69@SA2PR11MB5148.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	iEFwtu6Taw4X2Pj+C1fXNuYj7JrfBVlHzGCo7Rqm9u5A1I2A+O/gQUG+rt+Ol5HGOqAyFFvmhvWSJ3cH/Or+Xscn5tSm0TQ43RiUJVZElsVCQAPtymRMcKcM6MVisOTeRV5FoTzgizQT0o3YfW5wIgK8Smao4HD+CQHclkpyHmZN45psV4STPdKk3Rlw6/DhZhVoUu8G0u0Nn7SBjqUDAlFvPgV8G3CF4oNB+1/R8rz2th48m3EI1hU5TvBN5RftCvzJAhlWU1nFM540fEEppvDYpNWFHWOBNCpIH+Hbx53boEhzEmMpP1l1/D7gDZVUL2XdhPj1ba7r/PshmqPhEUEr4SnjDdLxFBi9vQ6b4Oe8Kcx5h+tcN2ui2z4v6kgs7CYENnhQTihfCvnQ5d/RnCh8O1mV24vs5AnBjVlN4uPSarlX0nuMd5G0DjyXGzflMX9Luuf9MMMrcAwxtzL+EPCaA8S2tYx5EZJrIKIpMqWBDdMNaFrqzoq9L7Wr4gM/VLs1eMDxCx871nBjoAmRSUpwGgCAX88Exysga1sELSLJiHSWM0uQdqfz3KUreGZ4U6IzVmIEZqZAB6NoKENK+rT7ivBlA9Tt/3ZNvGNdkBH+XYukNztYGSSbuW5mh9sJgrgGSUBpY5SA1OcjqFwV2kh6P2aD0leJRy+j1ZYjuCb96mKJinTuD+SZC/zKobBBYQ5VP1ZrGbWKYZHJi+yntakR+C0nEpMPVJED3nfH5ND91h/ug3J2vGcHyIB3HpfvcSEuJRhvmVvUa3tXtB7xAFwM2ESqMj5SKM3XYV0XemMZz6xOCi0lAZsEjAZY/aERgX5lXXwwraAtgrsIK9nyCw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA2PR11MB4875.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38350700002)(26005)(83380400001)(2906002)(316002)(86362001)(44832011)(1076003)(2616005)(38100700002)(8676002)(6916009)(966005)(36756003)(186003)(6486002)(508600001)(6512007)(66556008)(6506007)(66476007)(66946007)(956004)(8936002)(6666004)(52116002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?75ky20+y+cJs5PwErGclm3jAUytQeVzZ8c1pveqU6bnyk1SrtyFOyhgM++Uh?=
 =?us-ascii?Q?I8SQU6GzRtWacGz2p0itpzCvgWAeecEmIor+GK4+IYx0o7RnrefsGHgqju3z?=
 =?us-ascii?Q?XMH/flQQq8Z4pRiZj/Ju/khWhOd18pWhOCYaNr3Sk+bzihsrRb4xlbtnCG6f?=
 =?us-ascii?Q?q6BnP5Qoy2gUEEyV22TmrhbsrYI6o1F7C1ynJuu+OjW8nwhHvPMHI/NF/CKY?=
 =?us-ascii?Q?PMvMn30BN41VzzHHshQz1BjUJNTXwmEKZbeBO1VVKJNdLWXnbdzGXnE14VBK?=
 =?us-ascii?Q?aYrgalMlnJD4T8Sp3ABD/GiZ//q8HJC0EZSPbt2tT/5GCY33uzm5uJROWb+8?=
 =?us-ascii?Q?e7agRztYllRUIeBjawRZxtpbFUVYubbn3h17qdx6kdsuGzWIqQsTpgj4qe9s?=
 =?us-ascii?Q?0RC5rKHE/iYcedACOJPuvpc6puhl99+QfXRADdKCqaeVdpO9xhsTa3rfcp3h?=
 =?us-ascii?Q?EDZN9q55DZmQxBIq9sxpVz21nJLLt114+KWBP+vAUSkvGjAAC1AgtcVJnu22?=
 =?us-ascii?Q?DipjoIbAGQugr+LaoQ82VIdJax9H1p0RprPsuSqWPBTdYK3vKPFYHoCraKIo?=
 =?us-ascii?Q?wahoOETmjKS1gMBMwykDlYCfBnm/bL4pRtgbmY+JPh54tpJJpFIhCCnpW0Q4?=
 =?us-ascii?Q?3dOupC+JL3LFVlo/iFmxypzg+mu7r2g2bkkUoKwiOz0oVfvkhssU7OYxos3r?=
 =?us-ascii?Q?1wUSLdaRilAIa2PhvxeAiIt/xKospVUlBflY0W1G8JGsyxYBXgK1HfgMcamm?=
 =?us-ascii?Q?elyakAbBLRZasvCYJRZuM1iiuNaQoTH300e+5WO+unuLzgjQDoU5LkW6mlHY?=
 =?us-ascii?Q?zF8Mgaci3TFmiZ8Vv2Tca1U5FW+kzph5ZqwE0kpzdhUGsc2zB88rV5TPxy9H?=
 =?us-ascii?Q?j9w4pSsGu1P70Sxve9Ch9BWcNKJ982CYVqNYRZ6iuDDOWit0xnaTzsXp9oCE?=
 =?us-ascii?Q?9/whnty4+PwKxlD2CaJEnFLrl0pUiqO/h7KOCBvyg8PwgqqLslgRczDSgkC6?=
 =?us-ascii?Q?HZLCZgUhAcAt9e042Clj+1AkxK0jujM0FxwCejRQbexxA74nq1zxN4UUSHmD?=
 =?us-ascii?Q?qo/SHz3cboGkl6hBLR3hxW3rIWfukc4NwNZtlpgM4MT7IfD4w1cIqS6wRL9O?=
 =?us-ascii?Q?O51QI6yPxP1jbf1mobWShU2EAv2nVvxqWlDKnkGu0BmFzzmcNrQ+EXKKffvW?=
 =?us-ascii?Q?9HofOspFoemscme1EeWcMSqXYATZ9S8Z6fIZRiU9iSe8foyIgam6uksxPSJe?=
 =?us-ascii?Q?yTaMK6z2Jyu7puD4JhVG8ostdmBw/Xzw40JqNjDy/Iw4Do+OPSafKfdZjyqC?=
 =?us-ascii?Q?QGej20EuKmyjmHoYZdJ6ZfFv?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b5e6bce-9c12-4320-ca4d-08d9740e7b28
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4875.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2021 03:52:59.5754
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2u2E4AoBl4Ys7GPPEHSts6k/B31ScQjGaHxufhnm+670kE0z0DACOF1qC9Y7inJg83RSjcC6NHYsybyiWTW0gQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5148
X-Proofpoint-GUID: xWRpmeYE2MTO7HAVAZMMCnL_1EiOlOYx
X-Proofpoint-ORIG-GUID: xWRpmeYE2MTO7HAVAZMMCnL_1EiOlOYx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-10_01,2021-09-09_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 mlxscore=0 suspectscore=0 clxscore=1011
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 mlxlogscore=649 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109100022
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

CVE-2021-37750:
The Key Distribution Center (KDC) in MIT Kerberos 5 (aka krb5) before
1.18.5 and 1.19.x before 1.19.3 has a NULL pointer dereference in
kdc/do_tgs_req.c via a FAST inner body that lacks a server field.

References:
https://nvd.nist.gov/vuln/detail/CVE-2021-37750

Patches from:
https://github.com/krb5/krb5/commit/d775c95af7606a51bf79547a94fa52ddd1cb7f49

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../krb5/krb5/CVE-2021-37750.patch            | 53 +++++++++++++++++++
 .../recipes-connectivity/krb5/krb5_1.17.2.bb  |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/krb5/krb5/CVE-2021-37750.patch

diff --git a/meta-oe/recipes-connectivity/krb5/krb5/CVE-2021-37750.patch b/meta-oe/recipes-connectivity/krb5/krb5/CVE-2021-37750.patch
new file mode 100644
index 000000000..c67bca32e
--- /dev/null
+++ b/meta-oe/recipes-connectivity/krb5/krb5/CVE-2021-37750.patch
@@ -0,0 +1,53 @@
+From b3999be7ab59a5af4b2f1042ce0d6b03ecb17d4e Mon Sep 17 00:00:00 2001
+From: Greg Hudson <ghudson@mit.edu>
+Date: Tue, 3 Aug 2021 01:15:27 -0400
+Subject: [PATCH] Fix KDC null deref on TGS inner body null server
+
+After the KDC decodes a FAST inner body, it does not check for a null
+server.  Prior to commit 39548a5b17bbda9eeb63625a201cfd19b9de1c5b this
+would typically result in an error from krb5_unparse_name(), but with
+the addition of get_local_tgt() it results in a null dereference.  Add
+a null check.
+
+Reported by Joseph Sutton of Catalyst.
+
+CVE-2021-37750:
+
+In MIT krb5 releases 1.14 and later, an authenticated attacker can
+cause a null dereference in the KDC by sending a FAST TGS request with
+no server field.
+
+ticket: 9008 (new)
+tags: pullup
+target_version: 1.19-next
+target_version: 1.18-next
+
+CVE: CVE-2021-37750
+
+Upstream-Status: Backport
+[https://github.com/krb5/krb5/commit/d775c95af7606a51bf79547a94fa52ddd1cb7f49]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ src/kdc/do_tgs_req.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/src/kdc/do_tgs_req.c b/src/kdc/do_tgs_req.c
+index 587342a..622b48f 100644
+--- a/src/kdc/do_tgs_req.c
++++ b/src/kdc/do_tgs_req.c
+@@ -201,6 +201,11 @@ process_tgs_req(krb5_kdc_req *request, krb5_data *pkt,
+         status = "FIND_FAST";
+         goto cleanup;
+     }
++    if (sprinc == NULL) {
++        status = "NULL_SERVER";
++        errcode = KRB5KDC_ERR_S_PRINCIPAL_UNKNOWN;
++        goto cleanup;
++    }
+ 
+     errcode = get_local_tgt(kdc_context, &sprinc->realm, header_server,
+                             &local_tgt, &local_tgt_storage);
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-connectivity/krb5/krb5_1.17.2.bb b/meta-oe/recipes-connectivity/krb5/krb5_1.17.2.bb
index 197c1e096..6e0b2fdac 100644
--- a/meta-oe/recipes-connectivity/krb5/krb5_1.17.2.bb
+++ b/meta-oe/recipes-connectivity/krb5/krb5_1.17.2.bb
@@ -31,6 +31,7 @@ SRC_URI = "http://web.mit.edu/kerberos/dist/${BPN}/${SHRT_VER}/${BP}.tar.gz \
            file://krb5-kdc.service \
            file://krb5-admin-server.service \
            file://CVE-2021-36222.patch;striplevel=2 \
+           file://CVE-2021-37750.patch;striplevel=2 \
 "
 SRC_URI[md5sum] = "aa4337fffa3b61f22dbd0167f708818f"
 SRC_URI[sha256sum] = "1a4bba94df92f6d39a197a10687653e8bfbc9a2076e129f6eb92766974f86134"
-- 
2.25.1

