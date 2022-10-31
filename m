Return-Path: <xiangyu.chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB1CBC38A02
	for <webhook@archiver.kernel.org>; Mon, 31 Oct 2022 08:01:39 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.6747.1667203285201437940
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Oct 2022 01:01:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=c7vdmkTi;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=830306a705=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 29V7wuDF000707
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Oct 2022 01:01:24 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=Y3fT39hOcCqG0ew3lxqHQLgWC+p6U6zi1JoM9ABQiRI=;
 b=c7vdmkTiGJWkqk9+styNCkDMXNFlVt1FpC9tnysiR9UEr30PU/qy+wV1f+prrCu4v+rM
 E0Qzk9I+rXUuwJ9NbXJu2wZsIs05DEyDlo39E/tY0wbsID9ORaQjdLLBgv/dTUwwIKBA
 GRHFh/Nl3XJv0/4jMu1+oPSvYFlittOymY1P38KQqNrSBrGAQeslcsddFNoJjkJJFkTQ
 /WF8McGsFGqmHnvQwDqU3xd0I1vaRp+cXTlctyUvXabV+QhR9MLPaaI7P5h0lsYvHYkx
 xubMoIpjp+qCWxp2IgylJkTBzwBdUhwsa/sVXnWcywCjZFN7TUVO8Ce4OG3SbORgyevt yA== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kh3pkh2ue-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Oct 2022 01:01:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JaGgvAarVtRuOcqbzR/8HWyxR//YzFamRYHINz6MTPbxlSHPal8xFfAvaV9d843IO2YKZsgf2a1jXKJCRmn5shPYYsbKPyMIsuZUYXA+QwLv3aP4K4UbCsalyUljiGdNlc3WF2OrYmPiEmTjfpmQfiqynfGvt0cXmhnlRBG+jvW4zz+rzU4Ksp+cPgeLlH8fhusuqZrDclqHrfaAmDGFz9jQ8mCQkLvrX9OlOACqJQNEsFAw6S6ajIp57axWTVkt97Laot4uRzYfzcwIpjSZI82svh/gyrQ/PHr4rgd7ro3DjgXhtNhVSSnuLLA7QuMajWTeOTpjG8jocW2eziPptg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y3fT39hOcCqG0ew3lxqHQLgWC+p6U6zi1JoM9ABQiRI=;
 b=DjIob6JBKsC+um7c8yFVidPcRxOZaE4/f5+WpOJLcBsx99DeBd29STICIubWudxk88vsoJDodIv4meQeuLzM0dUvrOIwDXzOsObbk0MoncgIP1sAy4xVH8aFSVi6hVZsYLHVXImO8th9JsINZet9O1DwMG3L8XIAviAUze2BKogPvgElOEUN/qslcTGrlYnyyTyK7O6My9qo8APh+UlEkW8K8lNTIIBVh0Xzo2Jr05Lo89nO28ZnEjLj5H6YjfBHwi3f9QHNaJktV7mCDCHyu5ugipTiEdMrSjCcBlZsJBdxoXZ/Eg2nxG2Zhf+UzXo9hgrUzW61ddi3BEqiTQnL+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by DM4PR11MB5390.namprd11.prod.outlook.com (2603:10b6:5:395::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Mon, 31 Oct
 2022 08:01:22 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::99b5:140d:8487:5f3]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::99b5:140d:8487:5f3%8]) with mapi id 15.20.5769.019; Mon, 31 Oct 2022
 08:01:22 +0000
From: Xiangyu Chen <xiangyu.chen@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH] =?UTF-8?q?ipmitool:=20fix=20typo=20in=20.bb?= =?UTF-8?q?=20file's=20comments,=20using=20=3D=20instead=20of=20=3D=3F?=
Date: Mon, 31 Oct 2022 16:01:05 +0800
Message-Id: <20221031080105.228383-1-xiangyu.chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0128.apcprd03.prod.outlook.com
 (2603:1096:4:91::32) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|DM4PR11MB5390:EE_
X-MS-Office365-Filtering-Correlation-Id: d315bba5-c3d5-4a35-534a-08dabb16199d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	XtcP9u9SB3azyYoBgsJG7okJhtFSfjeb8DVlUMdBrYVAzad9nMk0iM+ru44VF17FH9IdtXHmLQMJxjG9fK7cHV0e3BrPtv9/UgU1Q+Ui42uV0Nb3T8VpioXpW4t+faEY4azsM4wuD013Bi+0kRM4uj/kYdwGGXc9blkhxeXF2Jk48MnBtXPGUeGie4gDDQ81zguKlqH4XW9pBs5T//m/eItdktFkY+/t7IjB1vhU6Mxav5qnlkatGenw0852QnPZ5VAmc6oVKBePv8KjOsm7rhF3jDA8H8VUw0QSCuB4i2hpXwZZo6HMD8cHXExgGVppNBcplCPzh/DqcgCrjIpbNWJ0gA6pF8eNuvFob5Y5TZ7olDaROrniFHAKWo5zki574cBX+ev45t03Nfo2tmeA3cv4L3nJZiNLLsm9/PYE9ri0MQ708UulewI9L6cFArMYLidZXOIoRuvRHPsZZQxGzIPM+DnlZqPCFaS+9bFlGoN/DBeH7KYscOT7lwGJd72MybLJvk0Ux+OHUskpBiKC7t8x672P8u3WSSgKJQf8JYQzLOJi1eCGwPGbHS7k2uqn3MKGnCOPWRKW7uld6QblOoqV1cs2eH0tXBOMKkjue2A81RFY+y2NEdGLo0dERMD7Ie21L52ks0QU93USl5i18gnEJ4DMc7Re/o8kq33DNadEqrv5a8lQuyP6yv3Oq0j04Ecp8vX+xix0S7EPy4AUTb50ALnFdq/thQO2kj78M/QKkJPtznU8TanpWSAV+h7bBuWIgdYK7U5NX1FRhbA+PGTtSPQX0LdgWkSuqR5WYc8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(39850400004)(396003)(376002)(346002)(136003)(451199015)(38350700002)(86362001)(6512007)(38100700002)(5660300002)(2906002)(44832011)(66556008)(41300700001)(8676002)(8936002)(66946007)(66476007)(6666004)(186003)(2616005)(1076003)(26005)(316002)(478600001)(6916009)(52116002)(6506007)(83380400001)(36756003)(6486002)(142923001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Qy9STCKLX4AAhpGrtRhiBmF5tsZBBuACGsTbLifsoR8H5/4FGUOhqtVfBAq+?=
 =?us-ascii?Q?+5EQOmq3/blITF9IWjOLFMNyn1kiaemT8QvO6WNBcM5GpFIXqaszncOVv5Ow?=
 =?us-ascii?Q?vyFOaXrY7zHZ6E74fWCzC+zfgae51MawLJt6IqUTqQkbUoFjPKNPBZmTniqj?=
 =?us-ascii?Q?C+UhJQGD/K4g9uotsRMAGekgHEsJjACgRhv64bEji+eTk2xbKVQCAsaaEQv9?=
 =?us-ascii?Q?b8kfgeMobJAqOOxY5HR71NFYDATq9BvS++TmsHRJuIddld3i5xk9HvIuNPrB?=
 =?us-ascii?Q?w9c0UwAXTs5sVbQsoAXzl69WNLKx3R7lGZBiQTfTNQiVZ0dckLx1CHbuyDMx?=
 =?us-ascii?Q?QJeIKnaqSFPxSn4JjfWy4im+nV2/712JelJoUm1XQxcnc90eOsS9d4x96db3?=
 =?us-ascii?Q?8Zx3mVW2y2rkGX8BQNdb2M09djhXVtf7L/vxDzcd/4WQT3eITIaMCDnZvDBE?=
 =?us-ascii?Q?E7gymn+5W3adv5cyOGjyRYG6fyTISPShvQ8O8SyqAy549VrxwJCylOHTAULE?=
 =?us-ascii?Q?2FtM1ukYuBgFPCN6Z50qYS2be51HobeTbxL3HJ0cHIOx6yYWrY5OuV18T3ls?=
 =?us-ascii?Q?F6uaLXjvDDYw9X7QK4sR3UrYJ07gGd4WnZNMhkcpvGZRbfTGS2BSHs/Lj61A?=
 =?us-ascii?Q?pJebD0d2htk1IMpA+d0HDY3wqLTcZT/TbFT7gKm9a+3MP0lXj9r0a2btkuAk?=
 =?us-ascii?Q?XOidNadedd8yjSjDT/TjPxgvznIALfc/7f30aeLIj/3TngwSzq2fjiaZ9SjD?=
 =?us-ascii?Q?VzEtdVy1z4H5SlNl/czOOX8eUlLni4JrsVkOoNkthKGJmMX2vooTHWWq0jbM?=
 =?us-ascii?Q?mG2+s2tubyRH49k3ICd4bxXLiJr++OYXZx/8zKE7RHDKqmaz9bHMoAhAToLd?=
 =?us-ascii?Q?ip8h5HWZI4GDvB1EChV9biPVZ21Rnr2dAdgK6PpRUHHRR8/mpgTVXyVB4v2F?=
 =?us-ascii?Q?do2jYzX8gcmxIx/DVcOZm2QwKr83c7MbIQTnrzNTp9P/e1lJnrBya1cbDxwz?=
 =?us-ascii?Q?KZIAzff696McXiWbt1GnTemvaBtWPAa24opPIlYyzv3u2EDE2E3uWk+k6Dtf?=
 =?us-ascii?Q?A5ktIDp1dCAO/cw30kPYoYb4BttEfCXsz3LdYTpM3oqVbgrBiUVf+F8YDubV?=
 =?us-ascii?Q?MCbuASDcXIReijslOBQ1br3IRJdSFEYXt8WVYHJrj0nE/eNjc4FRDNND3qxD?=
 =?us-ascii?Q?0EbRx4Z4e3cZZEE0U9tBya/aNyQFLO1S8kt1ZnT+/O38jYfPFMNhJ1d7T3z5?=
 =?us-ascii?Q?Z3KV086XXAoNmCVw1G/RQUGn0bnylS1wyzZzP6OBfWHtQMNVC35LG4dEIuJ1?=
 =?us-ascii?Q?1siUjKMLEDLcgn2qZX7x7sRRYA/yUbl3yIlIgJAgEgHvJER7tp6uOmJ/DlZq?=
 =?us-ascii?Q?PGVzVuE8gaj6HgVbwWIjHonAkkxCN+XIfyqGbNlZP6VqAQ4T7+xiG8dbXop2?=
 =?us-ascii?Q?WVAjUksFXCD895eslFS8r88Ar2o7LMjiTSK0XNl16fCc66BSRQ99e9/A1iaX?=
 =?us-ascii?Q?6Gy8pNrMg02wdgE6dA10lFYlBYO09oSGcaYGWrsN1fReHWmcnkTi0gX6CfI/?=
 =?us-ascii?Q?PchMeqHmiKlD/9NIuP8zQPe2ssKlrm3U27wkwFytNHi93R/iw5TViNM4/lfL?=
 =?us-ascii?Q?VA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d315bba5-c3d5-4a35-534a-08dabb16199d
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2022 08:01:22.2886
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vm+hzYcay/UJa1jNA48KvbZ/fpyCEFvSGZLYBaxUD1nhM6RFtC9mi/whZRAKnPB2q4sW4JNSvrGmJHaFAAnya7M7rGTOn7yW57ds2+69WII=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5390
X-Proofpoint-ORIG-GUID: nAd-AYs7ZaUyU45le2PMvSPLDuYq2iW8
X-Proofpoint-GUID: nAd-AYs7ZaUyU45le2PMvSPLDuYq2iW8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-31_06,2022-10-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 mlxscore=0 clxscore=1015
 suspectscore=0 priorityscore=1501 spamscore=0 malwarescore=0 adultscore=0
 mlxlogscore=858 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2210310050
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Oct 2022 08:01:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99364

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.19.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.19.bb b/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.19.bb
index 0a600e23b..a8d203e59 100644
--- a/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.19.bb
+++ b/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.19.bb
@@ -30,7 +30,7 @@ SRC_URI = "git://github.com/ipmitool/ipmitool;protocol=https;branch=master \
 IANA_ENTERPRISE_NUMBERS ?= ""
 
 # Add these via bbappend if this database is needed by the system
-#IANA_ENTERPRISE_NUMBERS ?= "http://www.iana.org/assignments/enterprise-numbers;name=iana-enterprise-numbers;downloadfilename=iana-enterprise-numbers"
+#IANA_ENTERPRISE_NUMBERS = "http://www.iana.org/assignments/enterprise-numbers;name=iana-enterprise-numbers;downloadfilename=iana-enterprise-numbers"
 #SRC_URI[iana-enterprise-numbers.sha256sum] = "cdd97fc08325667434b805eb589104ae63f7a9eb720ecea73cb55110b383934c"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


