Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F383C05027
	for <webhook@archiver.kernel.org>; Thu,  9 Feb 2023 04:02:39 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.6385.1675915353858980515
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Feb 2023 20:02:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=ZuAvttMt;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=140437523d=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31942XGT013397
	for <openembedded-devel@lists.openembedded.org>; Thu, 9 Feb 2023 04:02:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=IZvNkDQEDpFUSgOqI32vcUPMBzeSRm1h0vI6qwh5ySI=;
 b=ZuAvttMttjVX+ZhlCsFr2v9XKlUps/cOA9XzsER09EAURsuwUKlOaY82N5Rv46yDr8ij
 uPhmpk0glIBxNoUQ+Y7o3jsjPUopbmBIzGxBfU6ae0RS0Xkw8EPdTKp5nunQkWi5REU1
 aK11eXkojiIzlHcijEwQRz/E8e5pUh/sawZuPSONFWrj4OxYajZXmSOMnoG5EMwNgbU0
 ThE3IpcQxNbPkI3BAjt51DrvP6AE4Wwsx4kPS/D1AN9OE+HGPeUwJ+2cZhJzg/EbCIBF
 SGi99TsjFKKvwvJHjbC8JDTBfGs486G5opZLF2ZJSdIN92WRR6NRDQ3Byk8k4gERXpmL jg== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nhck34x6h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 09 Feb 2023 04:02:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hQNnEXYrvxD6ISK9719J+znutKdKsbmOS4t9v8CKgsxX32wM3mvVdYEh7kuBDij3bExDFbByynLh7hn/w6ysk/XLb0h6QA9wky8KeLNg2BFqqwl1+HnbZheL7e7UWhHVlvLiBPP6xxFGvduUURfEmYQLYRkIUAvHHZaXX46K40cp6VEJoVRgeH+nHg+D0PJx8YKwaX3O6rbZKbIvQCKM9CQ0ZJ6bZ7dX48jzgxbyCKrAgoBMCKCefznuibAsOX6k+YriM0SvUUMCZ8zZJOCk93lwOI+B5yovBh+AM4O2wNVjEhDPksMGx3ZamrbgL6xjGB50N5N7/P5iShfJw5JyNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IZvNkDQEDpFUSgOqI32vcUPMBzeSRm1h0vI6qwh5ySI=;
 b=ZMu6W8dSEGHfXOhPtOwmAM/yS1CCg8/X8bjZywP9wAyjFKp/FGW2QEtQlabsjUYUEZAgKnvqWGjt+1gr0lEX9p5sP71/qa+I00RAkoLzu3j3sY6Jz+EG2StSC2WIjDx66T9qnuzeXAVO+ECfzNxvD8UE4ktjI4y24pj6vO34tDKM6SviRKWkXZs10yB7qvN3Roe3JkL1HV+k5lxqOgrRwFU4OkDIeDnyG21mQy3YqYwbRyBCKGdOCpPwX6crWStaHv7BrywL18yHzAr2qYgYhIemlotv00Sx7GrYyGC89p3PDKZv97RXxisyfU4yPvqyJzvhf3mc3AklKNdb6Vl+TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MW3PR11MB4764.namprd11.prod.outlook.com (2603:10b6:303:5a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17; Thu, 9 Feb
 2023 04:02:31 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::3cb7:edf3:7304:982e]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::3cb7:edf3:7304:982e%2]) with mapi id 15.20.6086.017; Thu, 9 Feb 2023
 04:02:31 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone][meta-networking][PATCH 1/2] freeradius: Security fixes for CVE-2022-41860 CVE-2022-41861
Date: Thu,  9 Feb 2023 12:02:20 +0800
Message-Id: <20230209040221.1682122-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0300.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::35) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|MW3PR11MB4764:EE_
X-MS-Office365-Filtering-Correlation-Id: 51671a50-1822-4ace-4a04-08db0a52773f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	K7dEtbDtpjrirVXMbdCVVUowtuiI8t6IK0hMN1nwDviP467y12V2vltUZ3VWnS8vUVSvpXpZmXQ8CCdONNcY9ELNbDAxRrAx+U9cyAmUsFXzKfVhv7zGU2cgRuAZpXr/ml5j+G/P3rxQgRXbLZVQw3I+XIDHboPjO2EkY6aQvtRY8zmE6HEzstTzEaG+ojXANV0ACP9ZGGMYF956vtIbEkfrXHzXbztBrZ8F54gDcHArbcwk/KZYxjhWMeza2G987pve+7CnHBue8KF/2bMkKKH+0jBfuzJ23nx9k2PuikBDtMeoggKxsNcojS/ZougiIxSqnYww+16Qs1Pe0N3cc0dY4NtArvn4ViXZZ1U8sUn6wv9CVQO86Q8AFvo+jofan0eu4SVEPicia7P2Fma2jLt4/IuJwEpfSh0gFbEY0dw9Nrmw0zUWulYqpPZEIQeTJV4n6W/SAepPRaxuiuIN2F4oh4i5IlRdoM8J3digs57LLg6H1prb/9C5JgjOZcQTdQsUFTyE8ETLW5FhxeU3p+byyQ6ELxO6/cH+AkOtzKWGbrMVMGDwkqaHqydFMbvlntrV4o3K85bk182gW/LUaRv9bUxf+eESKbT6cBBj8C2HFP1Bb78CWR4aMnOy7D5xmOI6blvYBdaNa1SKcjsdyma3S/FAS1Jt99vh7P1t2Siw5Z6GX7XrvgsImUnY85akg4B1jITpGjVXq0+kD6CCh/0ICfKPyZxGM776zHRqrQCV7ELe6N822H/gfwcp61H0oV0+oJqPOURLgG4r9LUBzQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(39850400004)(136003)(376002)(346002)(396003)(451199018)(86362001)(36756003)(38350700002)(38100700002)(316002)(186003)(41300700001)(8936002)(5660300002)(66946007)(8676002)(66556008)(6916009)(66476007)(15650500001)(44832011)(2906002)(2616005)(83380400001)(478600001)(966005)(6486002)(52116002)(6666004)(6512007)(6506007)(1076003)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Lto0U+XavHlLcwZN1XYMuYB1sNlJF2dyhm3Ay8mYo5F0PtMql+hLldd89Lo/?=
 =?us-ascii?Q?NExg7dF0rqA36UCgQKX4O0Pxbe+8gI0yuWvRqJo7fiXsMyesWhneFtn1P9NW?=
 =?us-ascii?Q?vylmf1nyKqUdEzY9W7kJHSIywVn7VPz60aoZepIXdcGIUaMDTs5iH+3HYHJ5?=
 =?us-ascii?Q?W1Lo8rKTnRgxVT7OaepkFfxmwMrbIKfG4jyjGUwWnkjlrWOwNgMUZxcHl4SU?=
 =?us-ascii?Q?RSIiGKunIUVRBpBe0jOXsryzdQWRUu5KtjKgYHSqRq8La+kB7LkjSycTi0QQ?=
 =?us-ascii?Q?OyorgAhpjqGyIFOUi/5+iiB5gPgaY9AM53aacLrWsReJ2HNgjcg4I9vr0Vot?=
 =?us-ascii?Q?B+oRY/U4r5BGh9fgAEnnJD7V50//0XissKQ6+odHj+Za/6gmLQJXEjeJ3Wfj?=
 =?us-ascii?Q?sFsuhTHzqS8URByRXHp4EEolVlnYNoUnxUfBYcUDExl7E3YYVo4nfW9P3wgQ?=
 =?us-ascii?Q?9YhUESwhepcDwBB7E7O3qEVS6jq4TJlvCuRC3eNfpV//u9OogGunrLRuaW5O?=
 =?us-ascii?Q?VIwE8xxfgTYbdIvqv4/zU7xJYEv5p5HUyQMzR5JBV6LxHHQxJwdHXee4bhfI?=
 =?us-ascii?Q?T4ODO7iQT3hlnb/uvCSUFq5bxzoR7SyZWT1cZcf6byqtyw8Zfdqvkq49qmSP?=
 =?us-ascii?Q?BZMJXfWDxIpo9mOIZjop+C6aaxmltM83QvjnfR1lZhL/b2a63/LtEtrBGKc7?=
 =?us-ascii?Q?X6RibjaMfHX5bHag5Y15hsS6+tWxQBLwc8N1pj/G2T23VTMZUSe0L8FfTLmt?=
 =?us-ascii?Q?UTmHpcMioT4EN64XTmuRNG+vrWGTKcjZJRB6eRQzvxNcolebD5lnB4lgPCjD?=
 =?us-ascii?Q?WdNlMOo93gtXIYyTZkUrY8KqrppMsFaJgqrZwAXym7UL9e6orA4S5HBP+9VR?=
 =?us-ascii?Q?Tv8YvML9J+GNGBjI3c9azMkWJ579869AoGenrniKyAH1vD0N3PDCq5dh/KqP?=
 =?us-ascii?Q?p1R9FheZAkf8KsREuSwgi14ko5FOPbkIYI2DgdWGauENVKewsPKi3Erscaoz?=
 =?us-ascii?Q?QpGu9x2Dt5j8BVB3exv8IrGsRRDq2+YOe8aaBmNdl54cfPwEjcr3KZEdc+nq?=
 =?us-ascii?Q?Wd5VDDbNybxsyAVD6BpRLnRcCl0jEIzRNtQxwC+YcWL9+NfAZjVy6y+XB8o/?=
 =?us-ascii?Q?qAFMyF9C10o0U0mb5pbSOUoyorNfEEuodeIV7yxbAnWBUYWehMn1wZG+eVTi?=
 =?us-ascii?Q?+bxBRdkACaTSW0SCAQQ+9uKQhEDgkwNKheQ5G1INhIVDx4/UDtpKVFL91W73?=
 =?us-ascii?Q?Z/RFhfdfDAC/3eZw70OY+xbPjJd05rYs0RmK1bnsZ8qK6FD3G9JrCC+q54JF?=
 =?us-ascii?Q?yLbGQXIg+98TTCNCbPByLG930TDEopOZfrQua/nhucwEj9XxxLEW41qKM9B9?=
 =?us-ascii?Q?xEhXCbvxR5htR8Fk9PnCuZhGYBD+UGbqThjJ8b/Kt/VdpZj1gq0gCjc5osFf?=
 =?us-ascii?Q?1xlXYxVSMJpkBv9FtJFrbFLAaSPzp6dAFNRRKEwAbEiV8qR3SX7fow+3Pj9j?=
 =?us-ascii?Q?jmJoHhToY5yl54idT3ssmMLKSPYFJJOCK5R3IbIsRB0R5RG26ib6Eg83Pv1i?=
 =?us-ascii?Q?58xzHr/qqSQrRlRSHZ7K/WRRKBiYa7wG/4SYPhZ3tm/4MJa3DeAn2R8/FEy/?=
 =?us-ascii?Q?Ow=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51671a50-1822-4ace-4a04-08db0a52773f
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2023 04:02:30.9789
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /6elTONStMIM5uieRnI+B/xsizkZafeCFtwPrQOI25pfYCrZHziiAkD87scC9VUg8jcMdEyuNjhysf8XlCK5SQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4764
X-Proofpoint-ORIG-GUID: J7XHuDE6uiQ49u3UfuoROgxQaLevaeHx
X-Proofpoint-GUID: J7XHuDE6uiQ49u3UfuoROgxQaLevaeHx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-09_01,2023-02-08_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 adultscore=0 mlxlogscore=999 impostorscore=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302090035
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Feb 2023 04:02:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101004

CVE-2022-41860:
In freeradius, when an EAP-SIM supplicant sends an unknown SIM option,
the server will try to look that option up in the internal dictionaries.
This lookup will fail, but the SIM code will not check for that failure.
Instead, it will dereference a NULL pointer, and cause the server to
crash.

CVE-2022-41861:
A flaw was found in freeradius. A malicious RADIUS client or home server
can send a malformed abinary attribute which can cause the server to
crash.

References:
https://nvd.nist.gov/vuln/detail/CVE-2022-41860
https://nvd.nist.gov/vuln/detail/CVE-2022-41861

Patches from:
CVE-2022-41860:
https://github.com/FreeRADIUS/freeradius-server/commit/f1cdbb33ec61c4a64a32e107d4d02f936051c708

CVE-2022-41861:
https://github.com/FreeRADIUS/freeradius-server/commit/0ec2b39d260e08e4c3464f6b95005821dc559c62

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../freeradius/files/CVE-2022-41860.patch     | 118 ++++++++++++++++++
 .../freeradius/files/CVE-2022-41861.patch     |  53 ++++++++
 .../freeradius/freeradius_3.0.21.bb           |   2 +
 3 files changed, 173 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/freeradius/files/CVE-2022-41860.patch
 create mode 100644 meta-networking/recipes-connectivity/freeradius/files/CVE-2022-41861.patch

diff --git a/meta-networking/recipes-connectivity/freeradius/files/CVE-2022-41860.patch b/meta-networking/recipes-connectivity/freeradius/files/CVE-2022-41860.patch
new file mode 100644
index 000000000..4ea519c75
--- /dev/null
+++ b/meta-networking/recipes-connectivity/freeradius/files/CVE-2022-41860.patch
@@ -0,0 +1,118 @@
+From f1cdbb33ec61c4a64a32e107d4d02f936051c708 Mon Sep 17 00:00:00 2001
+From: "Alan T. DeKok" <aland@freeradius.org>
+Date: Mon, 7 Feb 2022 22:26:05 -0500
+Subject: [PATCH] it's probably wrong to be completely retarded.  Let's fix
+ that.
+
+CVE: CVE-2022-41860
+
+Upstream-Status: Backport
+[https://github.com/FreeRADIUS/freeradius-server/commit/f1cdbb33ec61c4a64a32e107d4d02f936051c708]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ src/modules/rlm_eap/libeap/eapsimlib.c | 69 +++++++++++++++++++-------
+ 1 file changed, 52 insertions(+), 17 deletions(-)
+
+diff --git a/src/modules/rlm_eap/libeap/eapsimlib.c b/src/modules/rlm_eap/libeap/eapsimlib.c
+index cf1e8a7dd9..e438a844ea 100644
+--- a/src/modules/rlm_eap/libeap/eapsimlib.c
++++ b/src/modules/rlm_eap/libeap/eapsimlib.c
+@@ -307,42 +307,77 @@ int unmap_eapsim_basictypes(RADIUS_PACKET *r,
+ 	newvp->vp_length = 1;
+ 	fr_pair_add(&(r->vps), newvp);
+ 
++	/*
++	 *	EAP-SIM has a 1 octet of subtype, and 2 octets
++	 *	reserved.
++	 */
+ 	attr     += 3;
+ 	attrlen  -= 3;
+ 
+-	/* now, loop processing each attribute that we find */
+-	while(attrlen > 0) {
++	/*
++	 *	Loop over each attribute.  The format is:
++	 *
++	 *	1 octet of type
++	 *	1 octet of length (value 1..255)
++	 *	((4 * length) - 2) octets of data.
++	 */
++	while (attrlen > 0) {
+ 		uint8_t *p;
+ 
+-		if(attrlen < 2) {
++		if (attrlen < 2) {
+ 			fr_strerror_printf("EAP-Sim attribute %d too short: %d < 2", es_attribute_count, attrlen);
+ 			return 0;
+ 		}
+ 
++		if (!attr[1]) {
++			fr_strerror_printf("EAP-Sim attribute %d (no.%d) has no data", eapsim_attribute,
++					   es_attribute_count);
++			return 0;
++		}
++
+ 		eapsim_attribute = attr[0];
+ 		eapsim_len = attr[1] * 4;
+ 
++		/*
++		 *	The length includes the 2-byte header.
++		 */
+ 		if (eapsim_len > attrlen) {
+ 			fr_strerror_printf("EAP-Sim attribute %d (no.%d) has length longer than data (%d > %d)",
+ 					   eapsim_attribute, es_attribute_count, eapsim_len, attrlen);
+ 			return 0;
+ 		}
+ 
+-		if(eapsim_len > MAX_STRING_LEN) {
+-			eapsim_len = MAX_STRING_LEN;
+-		}
+-		if (eapsim_len < 2) {
+-			fr_strerror_printf("EAP-Sim attribute %d (no.%d) has length too small", eapsim_attribute,
+-					   es_attribute_count);
+-			return 0;
+-		}
++		newvp = fr_pair_afrom_num(r, eapsim_attribute + PW_EAP_SIM_BASE, 0);
++		if (!newvp) {
++			/*
++			 *	RFC 4186 Section 8.1 says 0..127 are
++			 *	"non-skippable".  If one such
++			 *	attribute is found and we don't
++			 *	understand it, the server has to send:
++			 *
++			 *	EAP-Request/SIM/Notification packet with an
++			 *	(AT_NOTIFICATION code, which implies general failure ("General
++			 *	failure after authentication" (0), or "General failure" (16384),
++			 *	depending on the phase of the exchange), which terminates the
++			 *	authentication exchange.
++			 */
++			if (eapsim_attribute <= 127) {
++				fr_strerror_printf("Unknown mandatory attribute %d, failing",
++						   eapsim_attribute);
++				return 0;
++			}
+ 
+-		newvp = fr_pair_afrom_num(r, eapsim_attribute+PW_EAP_SIM_BASE, 0);
+-		newvp->vp_length = eapsim_len-2;
+-		newvp->vp_octets = p = talloc_array(newvp, uint8_t, newvp->vp_length);
+-		memcpy(p, &attr[2], eapsim_len-2);
+-		fr_pair_add(&(r->vps), newvp);
+-		newvp = NULL;
++		} else {
++			/*
++			 *	It's known, ccount for header, and
++			 *	copy the value over.
++			 */
++			newvp->vp_length = eapsim_len - 2;
++
++			newvp->vp_octets = p = talloc_array(newvp, uint8_t, newvp->vp_length);
++			memcpy(p, &attr[2], newvp->vp_length);
++			fr_pair_add(&(r->vps), newvp);
++		}
+ 
+ 		/* advance pointers, decrement length */
+ 		attr += eapsim_len;
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-connectivity/freeradius/files/CVE-2022-41861.patch b/meta-networking/recipes-connectivity/freeradius/files/CVE-2022-41861.patch
new file mode 100644
index 000000000..352c02137
--- /dev/null
+++ b/meta-networking/recipes-connectivity/freeradius/files/CVE-2022-41861.patch
@@ -0,0 +1,53 @@
+From 0ec2b39d260e08e4c3464f6b95005821dc559c62 Mon Sep 17 00:00:00 2001
+From: "Alan T. DeKok" <aland@freeradius.org>
+Date: Mon, 28 Feb 2022 10:34:15 -0500
+Subject: [PATCH] manual port of commit 5906bfa1
+
+CVE: CVE-2022-41861
+
+Upstream-Status: Backport
+[https://github.com/FreeRADIUS/freeradius-server/commit/0ec2b39d260e08e4c3464f6b95005821dc559c62]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ src/lib/filters.c | 12 +++++++++---
+ 1 file changed, 9 insertions(+), 3 deletions(-)
+
+diff --git a/src/lib/filters.c b/src/lib/filters.c
+index 4868cd385d..3f3b63daee 100644
+--- a/src/lib/filters.c
++++ b/src/lib/filters.c
+@@ -1205,13 +1205,19 @@ void print_abinary(char *out, size_t outlen, uint8_t const *data, size_t len, in
+ 			}
+ 		}
+ 	} else if (filter->type == RAD_FILTER_GENERIC) {
+-		int count;
++		size_t count, masklen;
++
++		masklen = ntohs(filter->u.generic.len);
++		if (masklen >= sizeof(filter->u.generic.mask)) {
++			*p = '\0';
++			return;
++		}
+ 
+ 		i = snprintf(p, outlen, " %u ", (unsigned int) ntohs(filter->u.generic.offset));
+ 		p += i;
+ 
+ 		/* show the mask */
+-		for (count = 0; count < ntohs(filter->u.generic.len); count++) {
++		for (count = 0; count < masklen; count++) {
+ 			i = snprintf(p, outlen, "%02x", filter->u.generic.mask[count]);
+ 			p += i;
+ 			outlen -= i;
+@@ -1222,7 +1228,7 @@ void print_abinary(char *out, size_t outlen, uint8_t const *data, size_t len, in
+ 		outlen--;
+ 
+ 		/* show the value */
+-		for (count = 0; count < ntohs(filter->u.generic.len); count++) {
++		for (count = 0; count < masklen; count++) {
+ 			i = snprintf(p, outlen, "%02x", filter->u.generic.value[count]);
+ 			p += i;
+ 			outlen -= i;
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.21.bb b/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.21.bb
index 1407b798b..db37f6591 100644
--- a/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.21.bb
+++ b/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.21.bb
@@ -33,6 +33,8 @@ SRC_URI = "git://github.com/FreeRADIUS/freeradius-server.git;branch=v3.0.x;lfs=0
     file://radiusd-volatiles.conf \
     file://check-openssl-cmds-in-script-bootstrap.patch \
     file://0001-version.c-don-t-print-build-flags.patch \
+    file://CVE-2022-41860.patch \
+    file://CVE-2022-41861.patch \
 "
 
 raddbdir="${sysconfdir}/${MLPREFIX}raddb"
-- 
2.25.1


