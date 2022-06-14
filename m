Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 110B3C433EF
	for <webhook@archiver.kernel.org>; Tue, 14 Jun 2022 05:03:03 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.2539.1655182979407950227
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Jun 2022 22:02:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Lb4NY1Pi;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=3164603221=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 25E4pZuB028341
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Jun 2022 22:02:59 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=HZqeewPPENiWFJ2Z3V2IcQU6TH2z1+YxeKPGScDYXDk=;
 b=Lb4NY1PiRbgVyQs7Hv5Dw9QcjzU4AhvunZW8u8tDxx8lto8URLTx+U8eYEDbgmjdoyik
 p8JbkDNAI6W0iiVABAKyIT3ajhfTW6oyH93fXIgWO7GWBMXx0s176oC37HVALzkCGGlo
 k9nj2HMFaJAunoCBrHQbYwReJVMru8Zlz+UGQ2RzxJaPCX7xBGZb73Ta7XWUaWb0kdRb
 AebGzvRJRpOpZ6+UbJ8ZAQgxlW8+87NtjTYt+SUIhI9eik4/5BqbT5b5QvXbNJJqjnXg
 nucExeoF6gF1i9RetmQHs4brxDdhoDKrbHRT6ikpQDBox457qaTo78pUh0yqExluV0lD hQ==
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam04lp2172.outbound.protection.outlook.com [104.47.73.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3gmpb5a0pd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Jun 2022 22:02:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kq4SMAAsIqxjuMmkAh49fJHyvX4Xbp1/Ww6TGk+xvHmzGWwF8bComkj/wfR4kgKXLtkWptCn/HJzzBINy4ZjCgs5tCLghsTfBmlzzavl15eCZ/ceyAzt/gE36Oq9vO2dLTEC0NZ/5986UZV2jPvo5Uti7U4ekRCWaSXs7ZQsZjaY78xCagkGse9LjLSLTh75RRZIV0gX1RJeFMTxpZFwRYVnq34NOXkdCGlj1fKF00ajt8htNU9rsyd35Jh4q+mfvLvv5AhlwtdtEWXXEonR3IBqICrxDrXTFD5FQzZZctmHgf4TqntgWmMj6dtKUlgl3CCyIckB12bXqZN7FWSYFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HZqeewPPENiWFJ2Z3V2IcQU6TH2z1+YxeKPGScDYXDk=;
 b=i5MEUpRzOHbvWk2Y7WWdel/4kzyOuVDkyLBL4FICi9zAEOnea04lF/cMEC5Ll6eJl7E+Wo5hqxUatlCiwdsCFwzxdU/+G3ze/xuM8BqRx8Nme8ylneDVbB4QCx+MCL2hR03SPE7R4DgYrQZKw2rt084RskS2UGCxrkCr3ZftkIbBgrMU6KI/VYbvVRKlK2cNEjuCema1PFJnIqzyr91QE5dqID5ZCbfsZHNsswfE6zrsk+GBl3Bh16bJIgC6AJqZZw91g99pqRbkaLuwLF+NTO12XxmSKVLYJED04EdHDqmj52onhJRdDWA8lEfX7tTsccykCx4HugLBPSLxkoqdkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB4878.namprd11.prod.outlook.com (2603:10b6:a03:2d8::19)
 by DM6PR11MB2906.namprd11.prod.outlook.com (2603:10b6:5:6a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Tue, 14 Jun
 2022 05:02:57 +0000
Received: from SJ0PR11MB4878.namprd11.prod.outlook.com
 ([fe80::f853:6ffc:1879:faa9]) by SJ0PR11MB4878.namprd11.prod.outlook.com
 ([fe80::f853:6ffc:1879:faa9%5]) with mapi id 15.20.5332.022; Tue, 14 Jun 2022
 05:02:57 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-initramfs][PATCH] grubby: fix syntax for ALTERNATIVE
Date: Tue, 14 Jun 2022 13:02:43 +0800
Message-Id: <20220614050243.879733-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220614050243.879733-1-yi.zhao@windriver.com>
References: <20220614050243.879733-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGBP274CA0005.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::17)
 To SJ0PR11MB4878.namprd11.prod.outlook.com (2603:10b6:a03:2d8::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5954268b-123a-4c11-f3dc-08da4dc32594
X-MS-TrafficTypeDiagnostic: DM6PR11MB2906:EE_
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB290690A1939C0E72D545D279F9AA9@DM6PR11MB2906.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fWb8o2/n1V40RIPjoyZaysunvh1vC+erF/nL3IPcKUq55Mm2uRlQ1n/crZXjWzpv9qT2GrupKtAyEaSPyArQZ268iJRsXsqXj1K00jgtwxXDNjzf0kQpMUmFFrEf7KWH0x1ItbfG/f2UBYS5+idN3kHnaXCV+yymT+8gUwz5zp5AHufpNzfcmcvdfdVCR8ZHd0im2E30JasAk8aEkofAJVgjN1y6w3FFpuRZ3ybU5nHFAwAYc70eeb4rpeSCHhMLBKRsSSCcoN9XEE7D9ttnSXur1s+7CdEZDX2UsDylmuV80vjR0OHRLkcT2eQdJnzjIfLhbkpeXakUMWLjewShDS37NR8rnEJ4Wux48vMIEAY+7A/RQLDv3nkDMhXDLBezFlzLlgdmrsJrGkiC7MC8/J34Zru8DxC1gzd3cxYVI4cpfZAGzrKFn/OazDTV8SMfRQTt7/AS2q663W7Ac9o+pq1yxPwUdj3A6EsaND3dk8qGI0Zr7liDXvwMUL7HKBqdPP2ulnaypOM0IeV6jAS2X93uvpoy4r4rSokdRWRHeOdm6QuCL7No0IAGebU7hD0+l5l4aHkCiwTZMPgwAQZNg1QHJz3XAGdaK7svgrkMpEYBhWPvozXLoUZLww+zNjdREVZ26l5733Rex2N0VuocIspXStKZ7unwhvswZbCpAphgrlCgUeuFq7n+GIbItAHI9Vx7tGOnhQQclC8Wbfu5nw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4878.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(66946007)(44832011)(6916009)(8936002)(4744005)(66556008)(8676002)(66476007)(5660300002)(316002)(38350700002)(38100700002)(36756003)(83380400001)(2906002)(6486002)(508600001)(52116002)(86362001)(6666004)(26005)(6512007)(6506007)(1076003)(186003)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?gohG8FLEPO37tZ6s+zcLIrCCDXKaauphZKesg9D3Lu1pvws00zKtHobUj5QY?=
 =?us-ascii?Q?q7W3RgSRnweugRPKDrOQu0RjqtzMLiprV1diklYfT/ZRKtnfJxA6cysYrgua?=
 =?us-ascii?Q?On+hxPcozhpuKndCbBqXIjrmUruqhQi1O0YKFsAFg6wVHdjjFm7L2iKRxkQO?=
 =?us-ascii?Q?4O3Wo8y8mNkH8DT6+bU3hgWV9dbkZZCCQOvqlq4677k6J8eGlwAfJuW9Fjuv?=
 =?us-ascii?Q?1biO68itjWO5T2sXDI2YIYIuZboCvtIuhe3QC7jCNnPK16F9mLSh/7m2cVuQ?=
 =?us-ascii?Q?I/bDEzEPOoYiFbevTWtr6dDCmu8EdlkHngb+CokshrFsAd3eqnJkBnaxGd3y?=
 =?us-ascii?Q?7iCa5ujt3VVGBqqneFNDkePvHEEsS/7tMDgwcT2up5rfL39cAmfbAKEHPzf+?=
 =?us-ascii?Q?pS0/z6OKvnPUZrVX2solb1I13sngdYlPdvu7GiYgR1VD0NFn0hvXe8IOtdlb?=
 =?us-ascii?Q?EYGK0NKzMlrV01AYCsy22+nEJfYn2gta3gSjzT0YhK7O/PsFZDzmVFNrkxdr?=
 =?us-ascii?Q?YQVvc4sAK4sVxyAU8MefU94fHgTFn/Abie3m0d5eFQobCfTxRPRyHgfyu2G8?=
 =?us-ascii?Q?2t4RdRFvuTPRM1vW+c/K5k31VWutj3spF4+H9docD5l6eMQFfQj+wVaim+TY?=
 =?us-ascii?Q?29B1//LruHD+OcjxYYBSBoxYxS9enjwj40PrU/5JvK2/pA46jeflYG9JsbDY?=
 =?us-ascii?Q?/j4F/9gvmMT2d4QcFzSq926PXzxWH6JVTVhVKzySxu37cIs80bKi1fi4JAfh?=
 =?us-ascii?Q?yii/oETXppCQLKvVPHAJSzqVBQr76l5Tnlxw/dSsmeAs6FwxNgaPa4ZKf5+U?=
 =?us-ascii?Q?scUNRxl0Z11IiAS6HGlnOMlMWBUpomEhUlbe0HtBLJcjhOLZGcCXDztYEnUN?=
 =?us-ascii?Q?UEH5l1JhNB3QGtYVin+a4N8dcBCEMeR2D7MrCXk9eJPJlvL8l5JDL3nCas9S?=
 =?us-ascii?Q?5MmMZfye+rjwcT9jJDGIfnBNcnBLXCTEDVUAaKC6ik2k3aJS8Cz0si7I0axv?=
 =?us-ascii?Q?bxAS9zlCveUTTzdS/SDhH3C4c0hXFW+2xOUcSO1PEElIDXvYyssfEJ9V8NQT?=
 =?us-ascii?Q?H1qf9HnR4ZPcdO4ARL+i2nuKzLohYXhClBVucUA+CE8JCNtJrDcOvMDsXgj/?=
 =?us-ascii?Q?CKzTTuidcHM9xkefiXhumM/NW8qUF0v091ekrm4cld+VedJF/jToOQskd/1Y?=
 =?us-ascii?Q?GRmvvO2SLqt5X3H+9hswnopIK+xZdEeSAgEcbcRqgghyd5isaEcxmEhtuC3u?=
 =?us-ascii?Q?nKhK+Lk4ONrxqIbnA2IXXUs3kGcpaH8M0K5B8vdMHSReRLRLvnW+S5T6Mjp0?=
 =?us-ascii?Q?NjGN00yZXSFhSrFQjFy/yL5bl1aaRHW/GvzJQHjVDnxUHhGpF4I+NK8LV45t?=
 =?us-ascii?Q?fgugivSOwZQqMMkR/yk0Sn4fVHan7yJccvPWykry4y0EZVLz2ZDqsU/SxWJU?=
 =?us-ascii?Q?AZvwcaFKdHhBT1yifheE6qBsHRuRKEj7wAjMk039PDZt8xeu71eWknqEb3Vo?=
 =?us-ascii?Q?/p13Z77I6WTvKMG/wU5VWmMj456/UXz5sRRNbm2fwPX7L5o2e5y9WKKKWom+?=
 =?us-ascii?Q?A7odvvPJ8DXPbpPVP4FYELjXZUZsLo357FDCP+ApCll/AolQXmRLFzQPFXFY?=
 =?us-ascii?Q?WtCIZX57VKg3uqy4fQt5mX9hLCK4S5qPXBYitLOXuTgPVuf7BsC0k8YC6uBH?=
 =?us-ascii?Q?AsYgRdXWfJz7h7aP3YyTYJkn0MKcxRsMwhLbUQqdXOrR1sJXe1+oSDMYUg4Y?=
 =?us-ascii?Q?BA81MiSaDA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5954268b-123a-4c11-f3dc-08da4dc32594
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4878.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2022 05:02:57.4107
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 s7U5YVDUivRCKmJ7rjmntSaTkJ86R5I8B5tw7wp+y+gg3mYoiVQeg/ZcqO/pxDZ75FqQmISLkeFz7GqE1wBCmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2906
X-Proofpoint-ORIG-GUID: ZXDK7P7LCmC-vFKslzkXGIeAqoNR4jBy
X-Proofpoint-GUID: ZXDK7P7LCmC-vFKslzkXGIeAqoNR4jBy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-14_02,2022-06-13_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 phishscore=0 spamscore=0 malwarescore=0 adultscore=0 mlxlogscore=335
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206140020
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Jun 2022 05:03:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97503

ALTERNATIVE_${PN} -> ALTERNATIVE:${PN}

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-initramfs/recipes-devtools/grubby/grubby_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-initramfs/recipes-devtools/grubby/grubby_git.bb b/meta-initramfs/recipes-devtools/grubby/grubby_git.bb
index a276bf423..bbfabf020 100644
--- a/meta-initramfs/recipes-devtools/grubby/grubby_git.bb
+++ b/meta-initramfs/recipes-devtools/grubby/grubby_git.bb
@@ -39,7 +39,7 @@ RDEPENDS:${PN} += "bash"
 RDEPENDS:${PN}-ptest = "util-linux-getopt bash"
 
 inherit update-alternatives
-ALTERNATIVE_${PN} = "installkernel"
+ALTERNATIVE:${PN} = "installkernel"
 ALTERNATIVE_LINK_NAME[installkernel] = "${sbindir}/installkernel"
 
 COMPATIBLE_HOST = '(x86_64.*|i.86.*)-(linux|freebsd.*)'
-- 
2.25.1


