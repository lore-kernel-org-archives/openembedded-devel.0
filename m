Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 204DDC433F5
	for <webhook@archiver.kernel.org>; Sat, 22 Jan 2022 14:12:40 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.8542.1642860758842895740
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 22 Jan 2022 06:12:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=ajBTU0bV;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=8021fa1707=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 20MDxHBi001309
	for <openembedded-devel@lists.openembedded.org>;
 Sat, 22 Jan 2022 06:12:38 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=jHyKc0xfaU4X6g6cf617TBjG7Kmx6CDmTNAXDdc979I=;
 b=ajBTU0bV3gU3IDyfx4RlvPXIXA67RhrrrvyrlP+YqXTS4CCwnEtrOGSdqSPZHb6Sqm00
 heNxhJCrI8VrVkWZ5ekzjlk7glnMZytyy7ORoGSdc2EMYWb7SrSc0BKEg7/lXMn5kO5W
 vKN6RYngWM0PPpu6FWeX3F1Y7/ak7Lna5Eu4C73q6wBE1e/5zpKCapIgo9hr82SywC1z
 zIvL+A1wbNNxP2vgGDu0S6mHmOgOyLELdGlfd0XJ3VuO5bJq0PFP/tEGmUlkBkU2WqEP
 8PxxlPmNr/UxCzNBDkB4DexB+9TlC1Uoe9/ufz/BFqZz1sLpyJ+0TliR96yqA7H47Hia Xw==
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dre390499-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Sat, 22 Jan 2022 06:12:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EmezAW9QerA+AVJ3C7jtntdwvvpYhJNRAjUZvxr9wU8YG02lywyYtiuud1ZAfeqwlnYB50qDyhU3OOFcOcNi0O/ZUJlYFwy7j8+JeF5UvjqUj/6zKB54vkunQpbjz8DULHNX9IbnmY2YwFJglRK+dvYLgm3TpO1WxvI8pmr6WXscU6EJ83hwrcNYpq+ktcYlCPmRVLza9IbVvDB85XCb62JINHi+c60J+yR88TsSrvTzfDq58uIIhSOjQsk4E5wMNgKpciXrAKZAg3dLW/p2U/rue07s+Og+4C6LlAbg7EMEDZi9n2BFEWi13QYV+cbN/CTBO0e7INwHYOZ41NzR8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jHyKc0xfaU4X6g6cf617TBjG7Kmx6CDmTNAXDdc979I=;
 b=nHvTdTDNqtD5KMKVEi4i2qDdCRrIUs8z5Ph3sSV4lCEgjYg9WEAi3ZwHfQTz3oibq/rtyPz0e/+BlZzu51DzutrZvRDngrB4a9DC2kHhw80MS1QttRp+CqEMGx+CX4LPniuIm9KTv2Vr5GnNE5zziqH3MQLg8VeIT++qUPjqSWlV+IcZLdutd5AcejTyVEsi2d4t2dSEqw/y8A02FrBQipqZmZXvUV8rNvMWl65dflv5ujOnOAVLgvaHA5djJlT2k5DawAp+2e8BnToZxhHyRZYbjPz5fMpGmgKudQNiG4C4W+oLyM5yTJQ4CXnh15z+9H59FYCeIi3a0F4DC9h5SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by DM8PR11MB5671.namprd11.prod.outlook.com (2603:10b6:8:3c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8; Sat, 22 Jan
 2022 14:12:35 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::1446:8499:7fbb:a706]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::1446:8499:7fbb:a706%7]) with mapi id 15.20.4909.014; Sat, 22 Jan 2022
 14:12:35 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-webserver][PATCH] phpmyadmin: upgrade 5.1.1 -> 5.1.2
Date: Sat, 22 Jan 2022 22:12:26 +0800
Message-Id: <20220122141226.421624-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0209.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::34) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b44dea87-9a15-4d24-5a94-08d9ddb13d1f
X-MS-TrafficTypeDiagnostic: DM8PR11MB5671:EE_
X-Microsoft-Antispam-PRVS: 
	<DM8PR11MB56711BE4405F87A398C25010F95C9@DM8PR11MB5671.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:497;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	IRgvxBKlT67kow+kdihwhVKFSsfH1aJOpTUt4q/0y4Mu0CmcF2RXd0tKceNFRN58csdCSuWe9YIx1zuk/CTvA4UF2pIBYSsOU4hEjVvog1TiLdOosO9mFDgUHC3qsTNmHVZEYxdL9Rvjc5ZStPf1mJq439Qpaa0GCLFWWsk3RNZSd4DGeZLA9MsKosnPGYBq6VOxYIS+RcxfdmBxd8g695e415fF9XIVnsusJ/elrlmPZXFjq090r5ieLZhoEMZyw80nYQNIkPjToTMxETnthjJdmCpT2xrJtiiTQkPibaq3jLNuXPAmerKTRc6J6Nle0mzseRma5miJczF96lGmw+0/8hlhhhIPSITu+tV0B60bOzeIKoy6+EhhEc8XBNJrfYu9mr9qG0fYr0KDRcNwwUVMY9uJwLqrYaRTFTGB20QrksfDKEulhbNPpYdK1vxZoG2lPdkOKD9Lqo6lewVqIoiXZ76GfbpOGzPzncSmHsz56Ez84w+zEJhZhKk1nyO8KnoMIrS/PLAuG8eKUd1eyNY3xOQpZXmaIKkd1A4NRHQOM9bk92YTm92fb+M57ZHnYhb5oRSfJmT6/ZZHhaZY1lzv8NgzcsRprlieWoJruHlIS2cuvDR0Pll/nYc1H5cn/j4vkFZrRkf0ZqFbroBrZn0JAF9aF6u85ZKy7+ptKEXwKJ8ymHFD1dgRTJzg/njY5G6FVApXV8cHEsOh7PUUK1vtcRPki7GlgQ0aPT91rjLKu/hbq1k5wLJnM7CE+ZBM/2LaCE3tLO6SfY0V2p3WZ3hFP1iQcfYTAxgGZVRA3uI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(36756003)(2906002)(1076003)(2616005)(8936002)(66476007)(66556008)(86362001)(66946007)(6486002)(508600001)(6506007)(26005)(316002)(5660300002)(38100700002)(52116002)(38350700002)(83380400001)(6916009)(186003)(6512007)(6666004)(44832011)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?faatQY5sKNYUV41n3CFAmua3MHc6Vzg28oH5BZA6NIqnNUbS6kB6ux3eegbJ?=
 =?us-ascii?Q?xMPUW8jfydtwEViBU3rxng51Se8bbP6yDGfgRXr7Gn6q2kZ2iJQ2TMY9Rh+g?=
 =?us-ascii?Q?8iTocpQKr71HLNW9NGAlmMBCVAs5XuGcjv+x7Egj1Ec2NFpuP+WmJW7LSWF9?=
 =?us-ascii?Q?s+sxB3Y9NfmL9HeMJN7xbDXyDyySvJo7PNTIvd6svnGodbxGKE9TupjmztzL?=
 =?us-ascii?Q?vFYmx6MD7sP/8tbA30fxP+UeMeCpLRbg5VLZatp+eY5zo9Edn7AuGAnFRKrp?=
 =?us-ascii?Q?TDMNWZVgtxG9vjUJ7Dcc6U0BzQDTrvC4GFsdVOQFV0X9Ke4QFj4R4SJbR/3e?=
 =?us-ascii?Q?qqXh5XkFNLaxJ9fZTF5xRGXsRvvzXjLCaeZCg3As/ysfIIXRZblNI0631JPu?=
 =?us-ascii?Q?O+4myyI5YDuY1UJvxbCOg8XLDJf537sfVSiVw6OBC/wJZAGLW4Vh+N+U84A9?=
 =?us-ascii?Q?vHkpyWWo1aTfshPcAs4DgEYuSDeBU+34a8E8od8DXV735+p88kor03G1dnjH?=
 =?us-ascii?Q?t6g4n4ERZQiKT+Wdk3nMVrij20Q1WWRgTKnU1GXOicUB+A7NY83k/gRv/JtD?=
 =?us-ascii?Q?+PYxVZvd/t4NmvbDyka6mg7I4l4QB15MrQ7jwsyS4FoCxiTy973/ugb0BKk0?=
 =?us-ascii?Q?FNCVl3sN/9AUXrkqqkzu5Dn8hxKJnmGE/e6NMLe1QudcLHnfbzSvQ+2qBDqB?=
 =?us-ascii?Q?QasrCE3ZXH9iAL/eVMpjEcGIWrytoN+6MZHqtHsgdYVG0wGe9nedBRTaxbDn?=
 =?us-ascii?Q?BRJrcoC6ZHaio56C8I5JVXrDngP7jYjdHCrvXTfn/PhgBWt7C3pycXryaFVY?=
 =?us-ascii?Q?5LqMpaOpOzQdOVIej2v84kHbB8sHfMH/YOwWLacXM3uB0jYspAsmWEFyl81Q?=
 =?us-ascii?Q?Kr8iZKNmcROJiCTz9F+GB6IxRJR9Dwukl3aI5Ouw0HuzwbGNtkdV4x3Bi/Y1?=
 =?us-ascii?Q?ETjYgWHHBOjY2nr7ACCOlOn4smoo8WXKOqCZEeLuQQ01z31CXwmPLpQ9QLa2?=
 =?us-ascii?Q?Nlfe0lRWH9AefYoZT+6NypZWsl6tcIsMti5aFqbvYvCy6grsLwYTKShV44RG?=
 =?us-ascii?Q?f7Ol48miOfzF6u8ElqI9+nGMslv2ZTFsPcdQ+uhLpXlIfmoN1bwyzoCh4nH1?=
 =?us-ascii?Q?sjTRot4InPjFiBgd25MX4WjgjMnl+RmoqhRPPOrA8DR53FjmLqxdbB85fs+V?=
 =?us-ascii?Q?oqPF+Igsj0zSmYsoWuVBqTIfJg/8iqnxch6NeqosdlI9IfmhLAZccrVJdYZ6?=
 =?us-ascii?Q?0UWTQyzzQ4hxypm7BO10rrXI9qR8tQzRAeez+YhrG30eGejfpZISFw6xD1LG?=
 =?us-ascii?Q?JfU0qvvzPLHJVXmakxtEbuSoG0y7nbCZ/GdTq6pmxb5kk6P3pgPF/wB4GNsf?=
 =?us-ascii?Q?sVfDnBTST6eVUmp03sAFgnTWKc30dmI0f9Jytp4AxYPX/izoEbWB2ZKSNPnH?=
 =?us-ascii?Q?HVBHHAPSdWStSzK6dYQnCpJeO0b7+XeTG/j580TI2W9rPYYbzUY0jtsfOHOO?=
 =?us-ascii?Q?TvPJPwKJUpBi16Y3uccCIN1BctAGkwcSe+NpWw7fSZ/OAPYzrPgJDYUrcDeZ?=
 =?us-ascii?Q?wEhmIXUJteC/A33XH05jb2HfxEHA+L3vgvz9+HEWEFRGNwkV24zvJqJD4Y7F?=
 =?us-ascii?Q?jQZQC9/fKjB0YTjJksoKcgc=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b44dea87-9a15-4d24-5a94-08d9ddb13d1f
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2022 14:12:35.6863
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 FvvqMBh8kwDPw0MzAi1r0KJ/3jFoHNMQRzAtdnYqZe93P/20+r9SeLiV+0w0EKQESBP3htdWRDLTLELD31jrAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5671
X-Proofpoint-GUID: BleV-oFyI0wzAnfbvuAKyMNxNIg5qh3v
X-Proofpoint-ORIG-GUID: BleV-oFyI0wzAnfbvuAKyMNxNIg5qh3v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-22_05,2022-01-21_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 spamscore=0 malwarescore=0 suspectscore=0 adultscore=0 mlxlogscore=894
 bulkscore=0 phishscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201220100
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 22 Jan 2022 14:12:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94999

License-Update: Change JS Foundation to OpenJS Foundation

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../phpmyadmin/{phpmyadmin_5.1.1.bb => phpmyadmin_5.1.2.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-webserver/recipes-php/phpmyadmin/{phpmyadmin_5.1.1.bb => phpmyadmin_5.1.2.bb} (89%)

diff --git a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.1.1.bb b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.1.2.bb
similarity index 89%
rename from meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.1.1.bb
rename to meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.1.2.bb
index b64824c47..7d814abd5 100644
--- a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.1.1.bb
+++ b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.1.2.bb
@@ -4,15 +4,15 @@ HOMEPAGE = "http://www.phpmyadmin.net"
 LICENSE = "GPLv2 & LGPLv3 & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://vendor/tecnickcom/tcpdf/LICENSE.TXT;md5=dd6470bbcd3436ca317f82d34abaf688 \
-                    file://js/vendor/jquery/MIT-LICENSE.txt;md5=75308107741f7dcdc39127209c7e3fc8 \
+                    file://js/vendor/jquery/MIT-LICENSE.txt;md5=de877aa6d744cc160ff41c26a8e4811f \
 "
 
 SRC_URI = "https://files.phpmyadmin.net/phpMyAdmin/${PV}/phpMyAdmin-${PV}-all-languages.tar.xz \
            file://apache.conf \
 "
 
-SRC_URI[md5sum] = "e73377b11b7d38fa3f3014f2799c5252"
-SRC_URI[sha256sum] = "1964d7190223c11e89fa1b7970c618e3a3bae2e859f5f60383f64c3848ef6921"
+SRC_URI[md5sum] = "1e6e0c1a15e3c6e7c8771faef19edfa5"
+SRC_URI[sha256sum] = "3aaaa86ded6308f511f67a907c0d7d6096e1dc2a8ae05581ba55a2510abde1e4"
 
 UPSTREAM_CHECK_URI = "https://www.phpmyadmin.net/downloads/"
 UPSTREAM_CHECK_REGEX = "phpMyAdmin-(?P<pver>\d+(\.\d+)+)-all-languages.tar.xz"
-- 
2.25.1


