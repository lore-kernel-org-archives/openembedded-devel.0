Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91290C433EF
	for <webhook@archiver.kernel.org>; Fri, 11 Feb 2022 07:34:19 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.4534.1644564854238771297
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Feb 2022 23:34:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=I4GElcca;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=9041f74d44=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 21B7Ssnv021185
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Feb 2022 23:34:14 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=9CgtJ5LsT3lo8iyKVoQv2MgCO48O4XPLju+rPMeujXk=;
 b=I4GElccaPPw+aSH8rE1Bsw5R3qXXIcS4M+9hkxWk2SnxYU/xGzALM2eOgG90dlbPhlgl
 BE4LRi7zsU62ThzHxSYGMiovPx/Bnho82+PCl8mk/H/0beWbixq+cDLZx+hd7+j/ZVXz
 dWXA0Xu44oTr2kOSQWoBmLBCqx2BSNUAUgJJeje3nna/v4Ja31uW0/tqiYJzJm2QVJhr
 u8ct28FtmIUF/Afkcx+BaFYLaEVj5Xv0IdvJDGq4cCxBp3S2LNK8vPAHC6UXIl/D1BUx
 KNQ5Efde9EKS4OhcZ0ZBBt+OuhpIsb/Z46PlsHZ4G7Jr7zI6A8StSh+fOCaBX05X9aUq hA==
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3e4uuh9067-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Feb 2022 23:34:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cxLI+7lzhX+5jp0YQcfwqew3MASpWqfXJD75p47/vQIsi3+AG1FblA4nWzo5SLQkTrjgzcNGKwRRAwCfTrU5/fhqx4tCUnHCGoxLJXuCFizGk309qHXrd4QFWUxuVMGO0GLhTlxhJQBT+1ezdomS69crYZGrMY2A3smWpwbhghaNUltEIwWSTYuh6Ku5AO9lHEIo5sh+tPM+7ovuATT8EzLfAvV9sOSXbQyTvqUpzrLzmBol+XUOzf/Eq4zhwnaeZhMGqlCxbUhLosDnJuCRp8my+oRqgGQ2Z5Vd0uHZSbiQl1/XyeaLTbo4MPdXklKHsR3zPVx1Zy+GoY0NoxaLnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9CgtJ5LsT3lo8iyKVoQv2MgCO48O4XPLju+rPMeujXk=;
 b=oN0+cRO0e5xxWRVNzRfxFpMOW7kMtAg1Y5+9UNN8GP+UvyGNv4x14qgkkuTsrJBD4qw1M8joVirMsrURi6hQQTVHiXyBWje3mtXdO09UukTry+khUkzGrWXGN0oWLxeDU/R+kXdC70s22gzGzkL6fGIwIwCbhvPLGsQWkhsfMIR0a5YAOf/7GaSvUkZviN3bNfpU5MY8FjPFtT/bI4Bz+j3gZrWz/3oR2mzzRoIUqWJoA3G7EZupTW3ra9v54T1c0jUK1p3pcX2VWNqtDnA7avd66PggE26UcK7W0OIljwmAFA0ZFRP+FFsRv0+cmY9VlgIpLtXJ8aUQOANbYWZhgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by CY4PR11MB1879.namprd11.prod.outlook.com (2603:10b6:903:11d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.17; Fri, 11 Feb
 2022 07:34:11 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::1446:8499:7fbb:a706]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::1446:8499:7fbb:a706%8]) with mapi id 15.20.4975.014; Fri, 11 Feb 2022
 07:34:11 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] samba: upgrade 4.14.11 -> 4.14.12
Date: Fri, 11 Feb 2022 15:33:59 +0800
Message-Id: <20220211073359.365090-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0096.apcprd06.prod.outlook.com
 (2603:1096:3:14::22) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b5e68b29-6519-4884-dcb8-08d9ed30e57f
X-MS-TrafficTypeDiagnostic: CY4PR11MB1879:EE_
X-Microsoft-Antispam-PRVS: 
	<CY4PR11MB187946770DC2E434C3D8FDA8F9309@CY4PR11MB1879.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WK7/4q/zOOCXyJMBYyllCfoKxBwTk0JSK+A/XSB995FfxrAXtFfK6nyvNdPIHWrWD57GHjlBm3giHzDvabqlvKeovRAmeaczEDcBO6iUIPwlZZXRJ4b3BB61oKJJfLYQZECUNpMXu9WllQADWXW0tric/q/9Wd9N8bgFkc+uZkkz+jenUCailh/rodY8F7HesZdgdjmndTptXWRtEcJ/TDttvC/CY13hxc8NQifNWcBP2/gClPWMBDO14fJt3B7ERH9EE7Ojy+3Wyf6zLxt198ihHtcgas+BHL7BjQanU+ZPtdcQHVxeQ1xh4Z2XaaDH0+dLnBe5Kx2x51vVpHcSX261kEgtZGU5AjS2xxuL9Gl0vZWWWU5+U3nDKu1yRxzZLMVz5fJ0qWyChIImGg8NdNfT48rL0YqUwe6MhVINHA9rTjeuD2vTDBUJwxTmVUHZhcXZ8ca0BdWfzkeOfJNrIEcxsDkPjj4kPc/QYHTeGoWCDdfRhaGa3w0eeHdxtQ8UPgBoF4MWarqOWJLYpVswCzLFnTYB+5CKIkVzPF/fYyRxnbINSqobRKmtqeELxAqnN9iRbVompfD7/+MQO4IO95s3QnchYV0aptzeYUjdD9gGxdA3K/W6IpyGyvhTGRFql/fp3PPxO6UjPN/Gf06enrKTN9d0F2BQqRr3UfB4b7VX4uQFr1YhTzjpbduPpcyaJPG3P/eA1XhYDsOvWJtLBqKuz+yFXNLu5Se8rTEcjjBByWmcK9ACgRT7TDG2/kdm1+hjzN+AhIgoVFWVejwY4aPxStVCnfswzIne8MJASQJ+g1wdyuflCwgkDk6OhYhbpV2BB393Pk7h9yCPQjT6LA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2906002)(8936002)(86362001)(66556008)(6916009)(186003)(966005)(316002)(66476007)(508600001)(66946007)(36756003)(8676002)(83380400001)(26005)(2616005)(1076003)(6486002)(38100700002)(44832011)(6666004)(52116002)(38350700002)(6506007)(6512007)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?YpiuhDYPitE5INa0jQFfxutP65HXW7xkkAsPM66FJ/doC5XWAjwUyXjX8567?=
 =?us-ascii?Q?abzj3Iixjqxlch8rzSc+o7ql+BnrxkRhQyC92V7aZEWnMLeULxm/MyxM0U6V?=
 =?us-ascii?Q?pwpPMLlwgWoc5ZJ5Yo+aJGwPy781vJ/Q0rhXp7xYWSPKhWqa+0MGSekAwWUR?=
 =?us-ascii?Q?HSn6X3WPsLyxcgcOrVAfnJPEhQQHiFiI0wOgEQ5San6mlYL1RjvBz8fzuINp?=
 =?us-ascii?Q?kzPsW8d+PIHB2vslJcfqXTvLUojgad056iD7fmPc6xGXcs37jGe1fEsqDGxS?=
 =?us-ascii?Q?m0JIwqdbQZ2aaXLbvLiK5EiWVwjM1R0BY5DAH7Czf3NMQVeydQb4zYU8Fpwy?=
 =?us-ascii?Q?no/U+ep59EK/56fZTxyTHL8yQXMO2lSgQXeLb/l2Qd0noFM3FoxuAbGil78M?=
 =?us-ascii?Q?RPjSyAN852N4LMxWJFWEk8Fm7FIH3Z6SsspYYwvSa8OF8VlbnoilimXxbluQ?=
 =?us-ascii?Q?PLnPDTAt+o8ktbh9GiWB+1nqY5lIjfPnGFuX3qRJfEQAlUB6GKvAWAc60PBG?=
 =?us-ascii?Q?U4Bo1pZpV4zYnzFzLgf5ELCTEOsb5MQfzPcCVd8uFApk9HmoMjRf5xPn3FKy?=
 =?us-ascii?Q?nwpg4cenPCeHnuVeJneCBwREoydt+Sx5eDNALRHdTlhh4+x3/h8RFggEnAM9?=
 =?us-ascii?Q?9P1gFkfftbp3B0BC2dPmutUspfwuRr7z7r2lCaYp7b9HDUw2RCvSaZl3jIFp?=
 =?us-ascii?Q?+3wnRpPbDivYLyeRE4FmpkfrIYgCudc47rM/ApDF/MYGdSfoc2p8QkLRhd8d?=
 =?us-ascii?Q?WYqCFVijO0rnABtJ26B5WvOsXKJdfhv/88Z1SWLD2tOdEsJP24FxjP13UnJ6?=
 =?us-ascii?Q?Xtss1ipaUbE+aBohagnfCXlUTGRuMWaWmjePSg9MHqLuwJFe1oQIuGkNMuKQ?=
 =?us-ascii?Q?aDbPy04wtAx7lOxe94FeFVBxE1GFE+rYzsY/SRLS0rZuJDRDSxmlh4D2zFem?=
 =?us-ascii?Q?wPe9HtEqi9QlrFLIQn+G/UfP2qhf4goEKzCZvPdT9BROIb35phmIXscnDaED?=
 =?us-ascii?Q?JZpPMjvRTHuKxj/tGuPiYYrXryW205PcfMIo1rH24WRz1P/F/cc3d13XdlA4?=
 =?us-ascii?Q?4NAz5m1PjZRrYrbQ52U3rcVScGPDPlLHY8Rqz9gubNAECdQjvMmONGxXftoa?=
 =?us-ascii?Q?yICvZFeRLSOGCcG6Nz5HiKun7XlXupltsQR9kIbHGsZs7OFiyXcAyA2Gi2Y8?=
 =?us-ascii?Q?2mQjaJVW0JJJijlnjh+Ys0+ub9Z94B0uNrb8162GYydSSibSyeJp/gVZbVqm?=
 =?us-ascii?Q?wTAQpZSXQaLuRk66crP4+/TpWq0+crKbzB07DL6ZR/CWgS1TyFE9mYCP7zg+?=
 =?us-ascii?Q?IzzGZyc6w3CS3jan8mTHkmKWUse8SuMU1MHi5phrxSkGB8mQ7bo+INqe5ecw?=
 =?us-ascii?Q?4GFHiFfQJjCga9Cv+ByGcCy8wd73MzFK38cMzwfpi25DcehX6FespQW9TDT+?=
 =?us-ascii?Q?+tTC/ZROWKVK2O/kfwPc8AN/o6U4wuv/VllADaVpZueOMZE6p1xeyqSDlD8Y?=
 =?us-ascii?Q?vQvH4e1k5swSXGt0PxyRRphNd3pP4f4KgK/VQEkwy6lRIbeSOm4jB4aij+tc?=
 =?us-ascii?Q?SbHo8MRMzDcPkm9LWt8rYVe+ENqPr06ECCDrqfvtCEASDQtN52JR7AIB9nv8?=
 =?us-ascii?Q?/XupNie9+lSwoatRX/NhahU=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b5e68b29-6519-4884-dcb8-08d9ed30e57f
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2022 07:34:11.6099
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 MDPdsw/NJdr7PZZTGaOItRjiQbyCl5rACnRDYK+Zg9Lz4/iDeBJXlKkq2BHDoUTN03MtgCRIa49huzg1nBMAUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1879
X-Proofpoint-GUID: lPcu_3Hd6-0l7MABrJ90H4RrGL60wC9o
X-Proofpoint-ORIG-GUID: lPcu_3Hd6-0l7MABrJ90H4RrGL60wC9o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-11_02,2022-02-09_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0
 impostorscore=0 mlxlogscore=513 phishscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202110042
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Feb 2022 07:34:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95295

This is a security release in order to address the following defects:

CVE-2021-44142: Out-of-Bound Read/Write on Samba vfs_fruit module.
                https://www.samba.org/samba/security/CVE-2021-44142.html

CVE-2022-0336:  Re-adding an SPN skips subsequent SPN conflict checks.
                https://www.samba.org/samba/security/CVE-2022-0336.html

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../samba/{samba_4.14.11.bb => samba_4.14.12.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/samba/{samba_4.14.11.bb => samba_4.14.12.bb} (99%)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.14.11.bb b/meta-networking/recipes-connectivity/samba/samba_4.14.12.bb
similarity index 99%
rename from meta-networking/recipes-connectivity/samba/samba_4.14.11.bb
rename to meta-networking/recipes-connectivity/samba/samba_4.14.12.bb
index 0e125891e..5be4d2d51 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.14.11.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.14.12.bb
@@ -31,7 +31,7 @@ SRC_URI:append:libc-musl = " \
            file://samba-fix-musl-lib-without-innetgr.patch \
            "
 
-SRC_URI[sha256sum] = "3d9ebbf3280c7cf5eac1b15aeff8857b31151abaec4d2987be015a66c2945d98"
+SRC_URI[sha256sum] = "155d9c2dfb06a18104422987590858bfe5e9783ebebe63882e7e7f07eaaa512d"
 
 UPSTREAM_CHECK_REGEX = "samba\-(?P<pver>4\.14(\.\d+)+).tar.gz"
 
-- 
2.25.1


