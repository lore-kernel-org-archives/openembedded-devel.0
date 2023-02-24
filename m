Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ED32C61DA4
	for <webhook@archiver.kernel.org>; Fri, 24 Feb 2023 02:41:56 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.8803.1677206511683842615
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Feb 2023 18:41:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=q6vyuODO;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=14194d500f=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31O2ZXvf002771
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Feb 2023 02:41:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=5U6hYdqOlSsFktXJLS5xD2LO54CkzbWnKOt4VgDe1Rk=;
 b=q6vyuODOhMZt+UI2RNKOgpu9IugF5mNGyBr5feAz2WjK2bduw4+gJRwpX+4yR2ilb4mG
 +LQTthDSU4uGpQYz3YzV3IIhKWwJlpX7Tyat4XyK7UCYyitY+MvB3vA6QvJ0fcRX4NyD
 +ULswIJbP3PxHrWzNoKKCVkUjRRQPXmWIZmzTQhSOFtvCBBjjgydAABVAo33CQn+KbaV
 H4/9y0KymljGJHsx6+fRhFKWXmPntu1BB72JQAKwv0WtsS1Ik/jjN/tSAFAIarH/nbiG
 FpZJVfRHzyqV+Mf5xNTxnwP05u8v8QiZ+rPPy9bRVNh7OD0WV2Xzo8YZ94w3vhrx/UAH tQ== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ntpem5eac-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Feb 2023 02:41:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mqgT4mci71FhcRHemYw71zwkRdcOjLXKkt6lOJgKpyxzq4C79k+8OzAklpyGgBhy8cJTFl4yevRw5iZR/eCzWtxAJ61ZryS5J9aDkAK2ehXEh2eDU5Y4WnEhwDlauzSTpdKv0ve5XYpF0lw/ZfLBYGQYWJLM/e96vn9+5nM2WpNwi6zVpH1xIKrG6GYvu5bzHukA/DeNvOh9EiJRbHAfFIYlz64OboPTtGRSwV9qcjEsVZP5NLHegemfP5XKvJva70BDMOfa/D7gmGtvupWVcLaXMu3K1DDgaMxlcREI9rRHwXQBxj/cXcXxGFDNA3CPh1hNlFn942bIJBMtG2V2+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5U6hYdqOlSsFktXJLS5xD2LO54CkzbWnKOt4VgDe1Rk=;
 b=EUyrZ5oMYILupvkK0xZfDTtGGTcOzLqsTWmIM4FhVQq56fvjivnYPSNfLLrR3ikNchMca25cWnbxrQcdWRHq1fkKMCqfZ/9eF/8k9+xtrJ6229uFQO3xNvbF3PgdGdWvcF+GYNuxblqs6frRSNx45lg8hHFh7fgCztm+LZbBbeRLdbRedUrYcfTQF+5sZbDNvnMMFypu7bCQQUz3ZJSdMbYJqah68YE+LMopOD8+dDgJor9xEgK7B0yarVUQQOSqx7GcroqBiqTgz2A4Ab1iNPzveJy1Tpn2ZB0c3/kRBumrmfh5XnKc5RIriDtsOi4vFUqM/ljtz4ar4OEvyTem9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MN0PR11MB6304.namprd11.prod.outlook.com (2603:10b6:208:3c0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Fri, 24 Feb
 2023 02:41:46 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::3cb7:edf3:7304:982e]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::3cb7:edf3:7304:982e%2]) with mapi id 15.20.6134.024; Fri, 24 Feb 2023
 02:41:46 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-webserver][PATCH] phpmyadmin: upgrade 5.2.0 -> 5.2.1
Date: Fri, 24 Feb 2023 10:41:37 +0800
Message-Id: <20230224024137.3212992-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0070.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::15) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|MN0PR11MB6304:EE_
X-MS-Office365-Filtering-Correlation-Id: effd4a88-02a3-42fe-ee60-08db1610abe2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	mj2QgvxTeTW3QN0I9m969WG8Ooqz4AQss1J/2V9Vaowpc3uISBnlofK1JHLXsGruYoVZpPvNi2J9V6wQSL8WpAxDbqQqX/VSl0fGCCXU1+VCspC36bA8jo/HeiOLHRZtAL/Y4ic996/lpc1GSO6LnhGbsVfBqzcWTNdU8so+yQ2NnMqTG4HXdJEuGt7goqdCAN6C+EIY/PAwknKLzrcMUfgPBOxZaF75NVkOKHT0mFHZah+tmppOAcm2lpXai9lSyeIVO7sypCjYmtNnvG37PIVG714OE5xe4nnu1zgiQ41hTQWUVSTFc4nnGiUspVHAoDeGG5g/XlsrLYxSWm8yasl23gqAwC66Bllj4ww8klTVi32+mNIBrt1/bx7+t3tadEOPrMtYZxVA1Ku/DXBZjheVUiHDYeR6+3YrzDW9f0HAIVFfOx/LwsIfCQ99i44I4gbnOqNq7VgVfBJb+udqPyNAh/W21wnfy0R3G5uoVo/ihTgX7vdeLEs1Kc8m6tagpq4fKUfFBzHVYlkH8YsxgVo0OQAeP5wv/wqvxYMtUhge9easFzLY5Y5azlS+qiMMpqIdevGF+kqOK5YkU+quIcRIz6frnhm099wfFwO0zNe7CV8YE11ws7ddJ5bWWDrONWG0NYmYFWUk9BCJIXsbY4QfIuScdp2pi2djALBcPjiJBpfv1bKUwoNjmRMiX9p6
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(39850400004)(136003)(366004)(376002)(346002)(451199018)(6512007)(186003)(38350700002)(8936002)(38100700002)(26005)(44832011)(5660300002)(6506007)(1076003)(2906002)(41300700001)(2616005)(6666004)(966005)(6486002)(478600001)(66946007)(66476007)(66556008)(6916009)(8676002)(86362001)(316002)(52116002)(83380400001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?P1bgj0II8Q8hqNPq06eLFbj7Dyuj+vG8yYPeC0V5cATuQzLnxfevNH5sSX3H?=
 =?us-ascii?Q?Aj4QOhJlYD24/FQ7LqqphipHCWWwwO40U/9Nkpubdasm+JR0xg/LFrX7VumR?=
 =?us-ascii?Q?q7V/hS5zD6c2UzY/917Qb9ujtNF4NEaoB/M9DEjM/ed3Ka+MmnDZICfvhH8R?=
 =?us-ascii?Q?yKgahumcNjPwjNF7ywOfZicCB2nKiNxPoQ/oMxCL+tHXqblPZksBMzjMuUM1?=
 =?us-ascii?Q?FfVn3SyYJVN2Yr2vUFz3rsGCsFNjDMGTFPQZCL0Li9yFcZWkS3G5qndonyES?=
 =?us-ascii?Q?AeuNBThAsWvrp+nNavUJCSRZDD7jMzZ/1vD6hYWS1sCy1giBI8Gfxo9ojnSu?=
 =?us-ascii?Q?EuKP+qtQTNouYmiBMEONEKcMZs05AliNrzLqzKcBlCTxnfBr01pzDr+NQlTn?=
 =?us-ascii?Q?qZ+hRaOnItuGn9GIqEx1RhVMB/vvtT6jdexgr7qlkHG06E/Tyg5qbMoyUTMw?=
 =?us-ascii?Q?IREkWX8dj75jeEBSR3Yp1KQ7Ht9AbiZl/E8Jifi1UBMYYCuPNU4n7G1gsXEp?=
 =?us-ascii?Q?9KRvrQKbff4YZReXsEwRu+1Km2SmbpdC4KutrfUmXpZwumTRSksxXzEN99T7?=
 =?us-ascii?Q?ZnTlC6tevjr9EiHRK8sH0o5JTElIifGi9r+cxlUWZHowszl+ZukeKH5aYN7v?=
 =?us-ascii?Q?3wzkK6U1+rl7DETNbwh90eym+Nn/Oovedoj3VCI42BzULRLIdCfKlDHTWJo/?=
 =?us-ascii?Q?ADC25xAtGpg+nU0Ax+QrkXgUqPiJWMMVKbex+bxzTR5ajhwqzDvKB3Zy4ON9?=
 =?us-ascii?Q?T5m8ctUr75JVVdMZl4twFa0S2p/iplpFJvG6++One2p8j7EbwOhuDbG38EqJ?=
 =?us-ascii?Q?bDY1VO6fKlrrJBiR2rfkP8Je9FEj7M5eAQRLg8tvyO8PNaWHsAsL0OwTMJjE?=
 =?us-ascii?Q?m3c5DRqL0da8vWxR6kozsudcLprpHjYcNqz98ckDO7NiGWJXy0zGi6/E/MUK?=
 =?us-ascii?Q?a2acD5dVnwSZaQfy2pv5iSv3+mHZjsIvYFxL1Alhaj3ROgVOg8QxRYRhibHp?=
 =?us-ascii?Q?9CTz7cyyb4JNbDUgCoCIu8dPaexOIh5F5l7EcpTXvrg32mVBku6lbp0mVEdK?=
 =?us-ascii?Q?e8zukxiSoYChtmDGFpMo9MiNr3ArcD0/WkbKh/jekUS3gPLPmcyqB3+e3pxT?=
 =?us-ascii?Q?Sog+qjj6jOAOXeOVpkGp+AQ910leQTNgrhkXxAPWKz3IAoPtgOHB2VXeQjpZ?=
 =?us-ascii?Q?OgqYPpzHT4x97tB16Uc+j6S1SnJdv65NPRJR6PE6H1Z3cqZCE8VCjFt6Oa+C?=
 =?us-ascii?Q?zQfQgxU+xe9pHHXb6DmaP1et33hRu4pWnjLRdSq1JjrJc4dVm5xnEK/RE2Sr?=
 =?us-ascii?Q?MGTO/5NSxE6KvM+e9Mxiby9kXycZi4WuqMb8VIvmvsZpZPA7A/BKAXOh0hjg?=
 =?us-ascii?Q?0ygY5JyCCRJ1WOFiuDPaVv+kBLHbhtqpJmNl8htanWmTddIshOzXyv5wDPiw?=
 =?us-ascii?Q?31l7DQA7aSXmRiuBHrrFKF3C4TjwAcf9m759YF+sI1IVYvdr83hwrDQSsroC?=
 =?us-ascii?Q?X9mfEt8zFrZ7G5T66E+9XBXd8Q6qFfv1V1taOZ4ufjG/M5NY3ViVI94Lwp6x?=
 =?us-ascii?Q?WqPEVF+TYQ5zVPet96TFKsJtCqqNfJ/37u9CTvc7h3Z7zdsIQD030oLdqDn6?=
 =?us-ascii?Q?Gw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: effd4a88-02a3-42fe-ee60-08db1610abe2
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2023 02:41:46.5067
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z+p5TFqu63AWrC2U66pl9kt4aYx9/rLptv5g3I1eXYK/iq05K6SdlqMZYO1iSqtIGblo8CveUf19P0JOD0fiZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6304
X-Proofpoint-ORIG-GUID: b0ni5Ab9w9m91Y8g0dbnyS-_qcWDr7fr
X-Proofpoint-GUID: b0ni5Ab9w9m91Y8g0dbnyS-_qcWDr7fr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-23_15,2023-02-23_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=942
 bulkscore=0 spamscore=0 malwarescore=0 impostorscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302240018
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Feb 2023 02:41:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101241

Release Notes:
https://www.phpmyadmin.net/files/5.2.1/

License-Update: Update copyright year to 2022

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../phpmyadmin/{phpmyadmin_5.2.0.bb => phpmyadmin_5.2.1.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-webserver/recipes-php/phpmyadmin/{phpmyadmin_5.2.0.bb => phpmyadmin_5.2.1.bb} (91%)

diff --git a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.2.0.bb b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.2.1.bb
similarity index 91%
rename from meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.2.0.bb
rename to meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.2.1.bb
index 45de45564..34b710e88 100644
--- a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.2.0.bb
+++ b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.2.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.phpmyadmin.net"
 # Main code is GPLv2, vendor/tecnickcom/tcpdf is under LGPLv3, js/jquery is under MIT
 LICENSE = "GPL-2.0-only & LGPL-3.0-only & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://vendor/tecnickcom/tcpdf/LICENSE.TXT;md5=dd6470bbcd3436ca317f82d34abaf688 \
+                    file://vendor/tecnickcom/tcpdf/LICENSE.TXT;md5=d0ff7e060074497f34481cf574e8a581 \
                     file://js/vendor/jquery/MIT-LICENSE.txt;md5=de877aa6d744cc160ff41c26a8e4811f \
 "
 
@@ -11,7 +11,7 @@ SRC_URI = "https://files.phpmyadmin.net/phpMyAdmin/${PV}/phpMyAdmin-${PV}-all-la
            file://apache.conf \
 "
 
-SRC_URI[sha256sum] = "66da31ca295f06182ac3f2e6e96057dc824c459baedf4b29de6ed0d3be039230"
+SRC_URI[sha256sum] = "373f9599dfbd96d6fe75316d5dad189e68c305f297edf42377db9dd6b41b2557"
 
 UPSTREAM_CHECK_URI = "https://www.phpmyadmin.net/downloads/"
 UPSTREAM_CHECK_REGEX = "phpMyAdmin-(?P<pver>\d+(\.\d+)+)-all-languages.tar.xz"
-- 
2.25.1


