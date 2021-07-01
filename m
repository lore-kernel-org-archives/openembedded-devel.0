Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.5001.1625133433049974725
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Jul 2021 02:57:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Y6PCoyJv;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2816976379=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 1619nwM7010740
	for <openembedded-devel@lists.openembedded.org>; Thu, 1 Jul 2021 09:57:11 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by mx0a-0064b401.pphosted.com with ESMTP id 39ga5r9bcf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 01 Jul 2021 09:57:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ElPbSMx0Yi/hAvBEvxjM41IoytdNO4+udi0ElsRZhKqJ/r+HkUHQm/ufAu9cLBBN0Zi5RJj7/UqXXN1TWn5VuplzlAeHL2r4jxs1rA9tQUT7PHJQBvObDDIuwnMavReXSlB5k2OvTEjHK2s7JmMnZlKYQx3NxNvVeJtHwB/cXB4bVkqXCrg1K3jDrs/NL2G8nzQBtXjgqLLOZLs1Nx86sZJcXgkWmhTk8tksJzLvlJ1wcwsRWlCk3RWWn2g09A/duwLkPY1buB2BPcZZJROfNnVExbSxQYfAPmKn81nK9ro9vzrnRUiUtA5Gii40KmT+v9lbjmwX8BFV3HFTHLRuMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fSPQ7fIxWBforAHyQvWHViQbXfzfBcD3srN8nE9EIno=;
 b=SxYl8vmpF3BAVEROAK6FlfheNI0w7J3lpDpLFWrOIv5cAjzhxe4wkDx8A1O9Az+46HpXqtOK2n7R2AuHD2mBqU8+3AfYwIL8wFO9ml828kim0cjRFaFg4AlarlA5+nIU2WRDrppkXhAXNmjfM+30R8RoqhWxU7+T2fYQpArCDjYDIlhInrbwj1n/Ibw3+5aP4w3pGg3Y6zENqJhcrVNneDGOvfv/+ptIkKwx3Sthi8ny3reeiumJildMo85UD8BvlCx8pIS89uYoGV8wS1064+37ylpvZcPGiA7JbW01/p9YWTRrAiaFOYyanzHoX7hCvmeKZAFS4gS2rtEHPre2Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fSPQ7fIxWBforAHyQvWHViQbXfzfBcD3srN8nE9EIno=;
 b=Y6PCoyJvmXHRwa79i2lwCz2rxGsGIeENNej3+1I3bOlvRp0LGg9dymt4IIdqnr6YVX0e4Ez3rB2+Qk/PhmYLVgAq7qUXyACDzqdOT9ixY+FyP6y0dTNDgLSO0GEEGYIxNA80nd0XzSSKdRi+PRCMvtg3smD7bydgBcPoUzlJAl4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by CO1PR11MB4802.namprd11.prod.outlook.com (2603:10b6:303:96::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.20; Thu, 1 Jul
 2021 09:57:10 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::6ca0:3d02:dcd0:626c]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::6ca0:3d02:dcd0:626c%6]) with mapi id 15.20.4287.023; Thu, 1 Jul 2021
 09:57:10 +0000
From: "Yi Zhao" <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 1/2] samba: fix shebang for pidl
Date: Thu,  1 Jul 2021 17:56:58 +0800
Message-Id: <20210701095659.113682-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: SJ0PR03CA0281.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::16) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by SJ0PR03CA0281.namprd03.prod.outlook.com (2603:10b6:a03:39e::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22 via Frontend Transport; Thu, 1 Jul 2021 09:57:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e7f926e3-a857-4855-f089-08d93c769798
X-MS-TrafficTypeDiagnostic: CO1PR11MB4802:
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB4802847183E5DABF3812756EF9009@CO1PR11MB4802.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:949;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/6UvRZaQB/AgTGUZeUPp/kWW0Dx2fpmIQEZxh1xIOkQRaSxtmSS4paeG1MOoXYLetV+3K2gdbSbpmlpSzdL6ki+jbe3A5saRrkFdh9m8Ft7/v9PGyPZbut/f+j8JH2uvoXC3WGXVq5FV4ABJ2zccEkChtUEPbyeyfq7p+9XCaOxMLy7YmRBoWHd0rY4SKeK0/HxLOL/EwczNzYj2pQzrBY/CaGjqsYXi576swKQyIn8uc9ufnHTuO2HMVHU4D/nH4DzoyiWFes59HFQT07A9/PNHhnOq1riZ6NBcFcMisyUr/1IVaxtL6KXE6g+1yT8jOu602nvCvLPwH4lWuFw8dHXvJ2nsJn2DJMUMo9b9kEDESC02axsfZzuUfGgxnvakmnm3XE0Bjkp/GnaEYC6HAuYYowUrSM2eYzm6R1GD6/n+EWJVwy50gHUNGjEMJ7t7FTh3rPn5ffzgrIEhD66wrpzs0MSWsXD12bWmnvQTDBSw3pqU2DZ4BzbE4teJ9eYs73qMLtxj7Yua6xIt6jVXNSyM1wRfZiCJiKyMOp+oPAXVlf9+ehPWvoOg6dkkYzdH8akV9BkUC4PBnYBhRpWiX9Ak4/IKV+Wz2BFJvi3wk8fMZM5Ji7Vkmicvh6pkCLiF1p0VXmaSpvj5N1EjqzGLNnN1R+ljEyVq0bIdRXMdMUGsLSW9F2vlxYDJRIyGc6bPig9xAFIHj/ZWFvpKzuB2Nw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(396003)(366004)(346002)(136003)(376002)(186003)(16526019)(83380400001)(86362001)(36756003)(44832011)(8676002)(66476007)(4744005)(6916009)(6512007)(26005)(66556008)(5660300002)(6506007)(6486002)(2616005)(478600001)(316002)(52116002)(2906002)(1076003)(38100700002)(38350700002)(6666004)(66946007)(956004)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?nDyQeD2f/v4/k0UFUdbDlozzv2yiDtfFgaaPxcbJGVCq9hUHknI1p/5wxa8g?=
 =?us-ascii?Q?CajVqbDuycN4rgnPzgLgXDY+SpP4LfBS3alGC3AcINoK3WMgnZdGzj7huRj2?=
 =?us-ascii?Q?Fo/59G5IawvlR5u5vFA0kFiPFQtLoTUiiEf35xg/JTDlcx2EhkZkSBU2Jy+T?=
 =?us-ascii?Q?eOhrA8aF+BRNzt46Y+KA61aC4b0R4FoBnHnxm/+x/G7uDbhCoe30AXmwxC/w?=
 =?us-ascii?Q?YcAQ+sUdV41TWp5m/0tMKqSkTnPZFfdOn7hyKgLByqU5q73TnpAp+2lXjGQZ?=
 =?us-ascii?Q?e3JDWFsqhBE4UuKmTs1K2crh6gNI2hX7cMMp4FaEAd0P858V9mLPYHOAJ768?=
 =?us-ascii?Q?O/5X/frzzNdiMaeuzL7ysdxTUnQRtJsnRXfWFcITN3RI0rjos+saqm+SH3Ym?=
 =?us-ascii?Q?UmeUvPFtNb8MOXG281LxLwKA3DMDSGdn8eW9baEwbeSjnOEU1z1ErVxeJ/7g?=
 =?us-ascii?Q?bSWaq+df7EKVfI8dz1nYBN5JiHCWadrgz5XIoHECpIDMe6OyZtQIo9r0UZ+W?=
 =?us-ascii?Q?ucn10QO3h9tp7HP3zISSkxBtTRwCergm9Bjf+OhJ6qgunQRomK+9Tb3WkLlW?=
 =?us-ascii?Q?5ObtsY01JTFw/0A3iplUaZ5ZB6Sq2goPpGRZoCeyLzrgP3nEfmv9SOsPf1qp?=
 =?us-ascii?Q?4+sovkyUDkkziiCx06MWPA4EJ3n345MwQi5ldGfxymPuIyk7moBUa8VQukG5?=
 =?us-ascii?Q?Igzkvh3MOq09ejvyt+huep0MGLMTMW6Ayfdy9tXOfTChqkG1v5jVsRQjUP18?=
 =?us-ascii?Q?cGbV48IT46ryEE0kPMY78dV9SNuhcpPyOoJoRZ2mXk+BcMBxKesDDa5aCfMm?=
 =?us-ascii?Q?SdBuHHKWRkZHNQj/o+fR7SkOuMLRjxMGWeRDyoQsHsXqmuH9KkakD5vTRRHy?=
 =?us-ascii?Q?+JhF2c+tHyiIKpJOBK1RpvJpoq5/kt56U33JwGSdBpdmPVB42nEAeilJ9Va5?=
 =?us-ascii?Q?J4d7P3cLRwLSmoFme07DeNTtgBTGXP2Zd9IjJLgXFJFOXhhCj1RjSXnjCJW3?=
 =?us-ascii?Q?6LBeEkK7t6wAq3zvz3Mvz8xfVESqM42Pmuctigm3kpsdLKLPzjTtBSfsCf5s?=
 =?us-ascii?Q?DzQ+uLcH9GO4VexDOd7GUxG4WzJaBnt/tv41olQv0KG+GCROmp3/14cfFlzb?=
 =?us-ascii?Q?su06fFkXwr9K1lPkgLnJaph3hLE09MLM2BCerMjA7WQ9i5BbLATDY93I7oY9?=
 =?us-ascii?Q?oMjvr5LClIWwC38nAh9HxDx87EmSOw8FNv5dwn/t4peWNZQiyRCZGVaF/Efp?=
 =?us-ascii?Q?+JVI414k8uWtbPegyziVrJfL23fNv59jh9zoaJjlbE2oZ5IO3pHDpvz4sXs2?=
 =?us-ascii?Q?nueskIhYsHjLtWrZi89YgXSn?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7f926e3-a857-4855-f089-08d93c769798
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2021 09:57:09.9404
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Be2YMrBrlvx5SP1mfSHT8TpgyTUpLrzljuQ0hdwTajrBo2ZI2npa1Ks2OpLpvbxVHIV/qIf2HjwbcsbfowY0XQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4802
X-Proofpoint-ORIG-GUID: 3C-HxCPWXkYFE5jYlyZv6fa0_WwUte7a
X-Proofpoint-GUID: 3C-HxCPWXkYFE5jYlyZv6fa0_WwUte7a
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-07-01_06:2021-06-30,2021-07-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=899 spamscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 mlxscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107010066
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The shebang in pidl points to wrong location:
$ pidl
-sh: /usr/bin/pidl: /buildarea/build/tmp-glibc/hosttools/env: bad interpreter: No such file or directory

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-networking/recipes-connectivity/samba/samba_4.14.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.14.5.bb b/meta-networking/recipes-connectivity/samba/samba_4.14.5.bb
index 018bbf163..49259c7e2 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.14.5.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.14.5.bb
@@ -211,7 +211,7 @@ do_install_append() {
     oe_runmake -C ${S}/pidl DESTDIR=${D} install_vendor
     find ${D}${libdir}/ -type f -name "perllocal.pod" | xargs rm -f
     rm -rf ${D}${libdir}/perl5/vendor_perl/${PERLVERSION}/${BUILD_SYS}/auto/Parse/Pidl/.packlist
-    
+    sed -i -e '1s,#!.*perl,#!${bindir}/env perl,' ${D}${bindir}/pidl
 }
 
 PACKAGES =+ "${PN}-python3 ${PN}-pidl \
-- 
2.25.1

