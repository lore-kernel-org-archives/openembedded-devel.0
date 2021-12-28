Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E71B4C433FE
	for <webhook@archiver.kernel.org>; Tue, 28 Dec 2021 07:38:43 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.36241.1640677123370326808
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 23:38:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=g7opjS5Q;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=7996075b3e=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1BS7U8Ow016785
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 23:38:43 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=kmN6vbKmaDY7n27o9CMcOHekeHLS/4ymTSuWWPp2+9Y=;
 b=g7opjS5QzYXWMmi4ICzpUb/1/PYM/DfPwM2swyNGSCRVPwEt0b29AiB650+3Hv3Nu7V1
 8qJW7fYM6UJJ/RByh/FcxC4HNUKPV6+Qcswx1jFeMWQlfRCzQm6287JjPvIoJhBs7lTQ
 aKWzxNtD4gD9Gff4OVFg31zQZb6DX50tka7GT0YemNMd88uSNURS5gwrEq7jRMvFo8Eo
 vXpkwsaCqeSLKl1SncE19sSU6fTqKWRWQaZXhf4fyCCfu9qKmUmJQ7BM8f2CMNj+IITS
 XP5WG3pU2poqX6ILYXuimpOXZ9qt/iF15/iPuIH7CxacjvkRwzw3dGK3DH6tjrBltmDy +w==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3d7kpw88p0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 23:38:42 -0800
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 1BS7ccBP001356
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 23:38:42 -0800
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2048.outbound.protection.outlook.com [104.47.56.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3d7kpw88nx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Dec 2021 23:38:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MmvYh8DP/W5Gp3x6ISgaEDIsREoiuyVsstR9e4STwARsx0ds1NJqgK8A7JdhzDasZfYEGznLWGQ3WMUkr0SSyGnwJTfkaNsgqSef+jDk79gzWO6si4AXkwDZF1cIP4tSv2OkgdA5eIdfeboiUOrFfXnYV8tKbGLbLTPyo4l0DMQcXu+RXbLfFdChaVI2UOHZ0943GlMJULy9tanIz6YfVZ6a9sWsyRK16/urFAsSl+RbdSQ96Vo/RtYWFIrmGHEjdfTxmxiBPw8Aysfrr9ETkL8HKamzHdm4qHH6OVaodveC+kwtYPQSdWexgwU7w61WkXWmL6dGD9u3mqTp6UT9RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kmN6vbKmaDY7n27o9CMcOHekeHLS/4ymTSuWWPp2+9Y=;
 b=ggoPcZ3ELfoZR/o3cf1cTQKDtNjR3P4pW6UMWfWvwOaWwguXpyWDmPwEUf7e34lL9cjNhSZactsh9VMM/wFekLdoFgYW3xYmP1pCm4xWy3xOrX/5hgC29p4mZsLvjOAuqIyjAeDolp2p9pXH1hnV6zbXL9oKmpzWpd7DhSl19qZvR+FhwVL1YVF7aYN5IJebNIRJZx29qY/xYGHGxuJeuPwvrhoQ6r6jiNN1UeZyF0/tP9GEaan8OJUTlxC+eQVGrg1bgEATJJdQonL0SN/eaH3GN9oZBv3bpGBxg88JIiMnCycEdc1GgAAHVVt5jYbtetNeI81acRsgJZwErvVsJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MWHPR11MB1584.namprd11.prod.outlook.com (2603:10b6:301:e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Tue, 28 Dec
 2021 07:38:41 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::8962:26c6:20fe:eaa4]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::8962:26c6:20fe:eaa4%6]) with mapi id 15.20.4823.023; Tue, 28 Dec 2021
 07:38:41 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org, akuster808@gmail.com
Subject: [meta-networking][hardknott][PATCH 17/19] samba: add pyldb to
 rdepends for samba-python3
Date: Tue, 28 Dec 2021 15:38:04 +0800
Message-Id: <20211228073806.868759-18-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211228073806.868759-1-yi.zhao@windriver.com>
References: <20211228073806.868759-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR04CA0057.apcprd04.prod.outlook.com
 (2603:1096:202:14::25) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 42f17727-2af9-41f7-7f0f-08d9c9d51170
X-MS-TrafficTypeDiagnostic: MWHPR11MB1584:EE_
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB158443E1B0F0AD8A757F71ABF9439@MWHPR11MB1584.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1002;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	u6yAtJTUESHaWHNikKzSW5BjnS/F5wvjtbuFmBtK0zAQ2c3qUagmSGcHrmLC0kBg1yfoy8pfgBy0CUHzcaP8gH8drPK+NIe+ut+O4/bnbGUfb8EnZrCJ3CwMwIlHOHffQiiphI2osNrXTHFcJG8yht9GouuMY9ySRS0+KXnz1F1HUjKXxOxXGIaIP9UEFwTfUMO6OAU2O0j/Kpwp9kVuKEVB6chb8w3lo5iUe1MQF3G6nxDnzjqzMdtYoLQP9qp+RxaHoWtXpKHsVdKVh4vKSsLK67h7y6eBvJpNFC0Lb0spyITrL2xHA1dxMHPCs4URuRDearq4VhKRqkcwef6Nds9/1tkNYNcdY9tXqpypW1+Gv74kIO21AkJ6FhwWHbG6Hrwkh4UBE49MgRSaEKJVhS9ROebNw5rIqDTon8RkMo9uSv/fuxf5blX9hZMznKgrkn5kJgA5NI4zqfjnCI92yD16FLOnXQvxwOkdxkVf2zu4+Lq2EyUOXZz3xEZrv7c+I/dd/5CPBfvQRFmCZd+2HnwGsZFvN5dkF6ki0q2/HvjWKZJL4I/oDGgvgXQqiyrOrA2OTjoRVY5jnfoF3xYyDnT874Hd+S7cC4pNNYlwzdVyLQ/suGHZ3Omn1uvcYp52bl2s5XJEAU+WjAsGJaL5XhqodIA3lCL59Gn2KsHhkh0suxDWknEAWix1VtS4YOyRwCeYv26xVnv1R+yY1CLnCg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66946007)(66476007)(66556008)(8936002)(508600001)(83380400001)(2616005)(44832011)(36756003)(1076003)(6666004)(8676002)(5660300002)(52116002)(186003)(38350700002)(38100700002)(6506007)(6486002)(6512007)(2906002)(86362001)(316002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?++ia4+hyatzy5Vahdsgb2Kbxfuc7p+ElWjUJZnx624T6xnEOtLMpnqoitlsD?=
 =?us-ascii?Q?d3rJa3zjJZd2xO1Cl1dOG6PGeN7FLgkIQ8TujP2sAOpblMU1XkhyWsQbhvUX?=
 =?us-ascii?Q?VaQwyf0vPj9kk2R6Svvdt6HvPzTdpVeO3fu9hzTpr8ajYGxEGF5Iq/eSdDSI?=
 =?us-ascii?Q?38ukNDXT5Hd4nSVoY5VoewkEGWBrzFotbzmm1sM9vCZV3acYxtgxeR7yB3pm?=
 =?us-ascii?Q?YuMc0j6hkb+wFgXdzZt0cZlVi+qxUehxpvaQV38XrRODv4TF292zq5bGnDHX?=
 =?us-ascii?Q?K7GgOVkijRTJq6nI359UKdYjrTIQofq4gFLBuaId//oyDsmeLCwR6NTe+PiX?=
 =?us-ascii?Q?AG7L4nw0KLoky2mZm1eEwHNGuQBQl7p2AE0On4aD1ui7OB3K1oXecZr5Y3Xg?=
 =?us-ascii?Q?S3vilQeWiJgcRdQoz+hsTMYHScaK8247cfvrfyYEruoq9H9DCl6+2AO0LGXM?=
 =?us-ascii?Q?LC0rjcXfjmxcO3PuJMIRnwEGPJOr6+f65K8R+Bt/Oa4Pw9Eor1gmgnGfHdMR?=
 =?us-ascii?Q?3K3e3dTKEg19x/uvgMZ0bOviMrs/WDOtHSQGirUf9QC1dCeHIioGWljQt7aN?=
 =?us-ascii?Q?wsRJ/NFNYLz06Ep7Z03ua0OFxvRHvgL8niWucXipwIoM2f74RxBgAY8akVMX?=
 =?us-ascii?Q?GgRi5RLD9Lalt6yHFWI7ZwQ+vZpc2hVvPEAXHp7NNGGEzgyGLC7yASKJzqZm?=
 =?us-ascii?Q?TWbKDHcSwrxopREFBaqRyI+JRTCLp0dsnfdoijSUO/lh/txmd82aGHo5lREj?=
 =?us-ascii?Q?O0xOw8CAQK1ryTg6/e0tYIpPhYSCB+LRwUR7ELOqDFQTm6opmJqtw+MIg9PA?=
 =?us-ascii?Q?dj2xCg9hbhusFuoVHivW5haR3zjUY/Nvzy7jzmN9pjh7YoRIfFAePF/p+Zgn?=
 =?us-ascii?Q?wawymKi02KdFirYtSdGFUhZyvlAIId1K980mo9gMqSBXhS/YWddNX0HpaeC5?=
 =?us-ascii?Q?N7JnoxhFJUhbhl6nexAmKOTASP8sw3SEW0b1VgaRIuVGlWzyzJmKaIy87tGe?=
 =?us-ascii?Q?H5JRypxUwswY+0jaqAWo6NbJcIzRoGBRtk2cbsK6tFZlZgUEeVWxa3b1yjX0?=
 =?us-ascii?Q?rR4ZCW7hd5X1asUGBpvZLh6dYj5EyDwIcf4yWNP4dckp0DKR1l5+y4PBf14N?=
 =?us-ascii?Q?sEo5snqHp6754kA2DUDlCvPYzudEsDOvPhYIKJUJzkkwtUB18Ic1FSI6TqTg?=
 =?us-ascii?Q?76GTBzSoOUznZCwlBR7s7buIbmPUstA4rRIlUc9gNpxxgD47MjWsny5MXePS?=
 =?us-ascii?Q?+1G6iVWrXWQXL/TDWHAg6OAReB4hdum+7+J/Dp3nXM0pcRlyPSDJwQuSaS7j?=
 =?us-ascii?Q?QU8VWTnlkYgf+ptzmSQMTt5NV7N6NE40nAYhQ8hs3ePrNu3YbejR+117Jsh9?=
 =?us-ascii?Q?KIaz+1I0P23tdmPa2g2SfvbzEPl9eZyS25HWnabe8eyvJU/qZBEg7NYgbE/O?=
 =?us-ascii?Q?mB2eAkQWejpvGmkFgm2WukVBySSkPO1DTtDIPB4rKJvfx7fhc+/r7PHWH237?=
 =?us-ascii?Q?BSLMRvhiqFuGA2w5jWWDjLd6cSH+Pur+ufHs3MmiAbGXYwTjubYgBANClTN1?=
 =?us-ascii?Q?w9TLuf7jKSdVYQCbxNIY8HDE0LF6vOiRAYZE5xt64n1W2cC+HxeS4oiHL+t+?=
 =?us-ascii?Q?rBiebu3MOmkpZ+BmMNEtzX4=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 42f17727-2af9-41f7-7f0f-08d9c9d51170
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2021 07:38:41.0634
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 zyxJ9whCB3yPxVW7n0UKWLAKhKlUfN0VwQOh1sRLtEImPbz62riWuMFie1l+8OEFohq9vnq9kXCWT+l68/N4wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1584
X-Proofpoint-ORIG-GUID: KwEPKhJdAbRGnPJ2CYYMpNAIf3x7lTw7
X-Proofpoint-GUID: zG6W0YL5NCNhnD3LTC4onGPe1KeEiXuR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-28_04,2021-12-24_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0
 mlxlogscore=897 clxscore=1015 mlxscore=0 malwarescore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112280033
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Dec 2021 07:38:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94544

Fixes:
$ python3
>>> import samba
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "/usr/lib64/python3.10/site-packages/samba/__init__.py", line 28, in <module>
    import ldb
ModuleNotFoundError: No module named 'ldb'
>>>

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-networking/recipes-connectivity/samba/samba_4.14.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.14.10.bb b/meta-networking/recipes-connectivity/samba/samba_4.14.10.bb
index 6b69c925e..fb23a68f7 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.14.10.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.14.10.bb
@@ -244,7 +244,7 @@ PACKAGESPLITFUNCS_prepend = "samba_populate_packages "
 PACKAGES_DYNAMIC = "samba-auth-.* samba-pdb-.*"
 
 RDEPENDS_${PN} += "${PN}-base ${PN}-python3 ${PN}-dsdb-modules python3"
-RDEPENDS_${PN}-python3 += "pytalloc python3-tdb"
+RDEPENDS_${PN}-python3 += "pytalloc python3-tdb pyldb"
 
 FILES_${PN}-base = "${sbindir}/nmbd \
                     ${sbindir}/smbd \
-- 
2.25.1


