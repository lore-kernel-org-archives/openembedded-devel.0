Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 296ACC43217
	for <webhook@archiver.kernel.org>; Wed, 13 Apr 2022 15:48:06 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.1256.1649814191113343345
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Apr 2022 18:43:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=NPDE5uIv;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=11025416ed=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 23D1aSOc015002
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Apr 2022 01:43:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=6ssnoemDFFnCw3ac5C6MGoeDvIA4rCo7Y7h3Y03Tu0c=;
 b=NPDE5uIvT4JM6OFMTSdMh4qhh3hpdeAMLB2vrQOreUNe4CG2OV+tJYZoUrPHNrXBAcuv
 nRYvar6unnWrTeckJPaJjWYUeby1/vP75dZeF/ACyPpj67tXwE0F6Cz6LaEqEcPY0BhK
 V9exXA9JjG5yu9cvIGRg1lU6spVJqlU9qs2g7dF8T7BHgYYjcJ1zEQezRaAmFu3nt+gV
 ed98MUZG32dBE76m+JNcKN7LhRylCgYu9q2yAoyCZKSl/dCiIv5ofQKgop6/J0jW1dhf
 v0Oi2xHkVVe0Pt8dq3FDMaKnK6+jUFaDOI85WCaysl6rZI1hadqqMLpBWNwGnOItWeBk kA==
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2046.outbound.protection.outlook.com [104.47.74.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3fb6fwaqk9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Apr 2022 01:43:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wdhk9jLo2bKXQI6YUbxadDnxfjNdD+aAFOxUyAncgt2jWwYwhCIBL1pxHk/OXrvM0eChrQh6nhxFU/6saGVplhPsKp1qtShy0su/9rFOAIa5v73upSqW7NGqFYQUEGjnP9Gz0z7ebJzBMSUE8tE3K6R/fxdDnVIRNA0VMyfpRPHlzlYRZzwp44jJhOYeYgPsvzwtyr2OpQHk9DHJ7Fov7qEntye4N2rCTp/LdOP6ZG2HRp9fY4oxQAQzfsl8+E68MXMBYEWUJ8aPk6gnYPvlKmUobQsrsA0js5TB8pco94IhcyEaRrdUJXYnX990DZaqiHh6knWjsBg9Zb62PVOp3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ssnoemDFFnCw3ac5C6MGoeDvIA4rCo7Y7h3Y03Tu0c=;
 b=j+H1e53Wk3RTNHKifQB6erBYh/VOSWXRHYSsFrnhtWmwFCO5i/FbosCwNZCMrH5ESbFV78dHi2XALbJZtWc+8CtTOqcshh5PNJXWp8uYjDQqswSp9XlEA21I6wLAFpOgQuEZzvNth0LMse1zwd3LjUMSfXgSU9QrqfhsDmC0RgHUkOGoDTzrYPux+g+gFD11du3FTqrVcA673UGFAncW2qEHk07ong2IvtV6jAj0XV5aum+aTGxc0BdVsGO5JRjA6JNcxwoQ0lHkr4PaHbMRBCmtchSU6EDhrhPeAOBamVzZQhqmFs1RO+1TV1/uknuWyKyipp8unC+lZt8n9qfkAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SA2PR11MB4875.namprd11.prod.outlook.com (2603:10b6:806:11a::6)
 by DM6PR11MB4011.namprd11.prod.outlook.com (2603:10b6:5:19d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Wed, 13 Apr
 2022 01:43:08 +0000
Received: from SA2PR11MB4875.namprd11.prod.outlook.com
 ([fe80::18fb:1525:3574:8501]) by SA2PR11MB4875.namprd11.prod.outlook.com
 ([fe80::18fb:1525:3574:8501%4]) with mapi id 15.20.5164.018; Wed, 13 Apr 2022
 01:43:08 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] frr: install correct initscript
Date: Wed, 13 Apr 2022 09:42:56 +0800
Message-Id: <20220413014256.991092-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY2PR0101CA0015.apcprd01.prod.exchangelabs.com
 (2603:1096:404:92::27) To SA2PR11MB4875.namprd11.prod.outlook.com
 (2603:10b6:806:11a::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e0c88f9e-4a9a-481c-b8ba-08da1ceef5db
X-MS-TrafficTypeDiagnostic: DM6PR11MB4011:EE_
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB40118B218CEFEA6046AD99E6F9EC9@DM6PR11MB4011.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+ZhKnrTLcJevGBDhehCmC2JD80jQZCxU7vHkwKIw+7jW2aa2juYRR14tp6cIVhSYQmsZXNC6YGHirQqKPTCiikavpbswfiIJQ2sXNwzUeHVPaKrqtC3YlF8Xwr+dgijMgC5OczvIe/p841b+6hLaM6D7j7edmdo6nR1eMniWGfa0CK5WP4eNRVAgozINk/S/KUaqytYb36XRKihFr8OXe0NDYh7lQ27g6pT/QN06Az5Z/sKnKumQy4GUPNTtger89V9FU+NUnvbunDdemWLgr5Drs2IcDVtPoeX1QVGOb7RDjlAFV5L3BUoSuBVg8yUMC71BknESmtR9K5gnn042nFsb/leIQiy6tiBGvxhUmdFwEhnghjQ1PIU8xTuaPIwYt20JDUdh/a4GPeuOhoBK4O7PtOfu96A+OAqd/qhxsO6fHH9z575kLaSnXJA1j6vc3wuSEe5hdfaINgU8HenAtxaG7s9of3v5K5T5B126nd0l/FQG/bbVdMlwAnxRhHe6I4f1qbTY7mmMhzQHBJ94Swy2q98AI/RsK9MDlmYP46WQxPdAwBZtf2xYS8C+Arr1sLPefMnJKDitSomIHcl6hSOGV0ttLCu/RXnRi/smbGnwV04cAkGdbEyn2CsEMNTbdvZXQTKYOwR4kr3VKRyDXaoGj6j8iEk5ol+sCNEvLxBfArrdaI2zibLrFdtIHig2TohtBW7B10plBHkW4WNc6Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA2PR11MB4875.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6512007)(52116002)(6506007)(6666004)(83380400001)(26005)(186003)(1076003)(8936002)(2616005)(38100700002)(38350700002)(5660300002)(6486002)(508600001)(4744005)(44832011)(36756003)(316002)(6916009)(86362001)(8676002)(2906002)(66946007)(66556008)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Pgel6DjTbIO9xtRmvJgW1/ggqkwjsQdCxaiHnYnb+QPxq19NDv3+KMDS2Owi?=
 =?us-ascii?Q?iIxWBCeWhi1j+XM+HKBRFNHG4tSw+B/74CGV4WhvluVcB4MZ3D1Ni2LsQS+j?=
 =?us-ascii?Q?maqAlyP0p7MiyNiCyckaB/KINjx6ToMSD6COm/1NTg6hLMxoyYVPhV+2DyaO?=
 =?us-ascii?Q?9SLvMW28yFsScSUZnQe5JwhOa11beRbehRb+Q9CDmsrmEwo7l2qu4u3H5qjZ?=
 =?us-ascii?Q?QmtfEpvxh/bRDuc4fzcX9Zg8hal03nKuDAUpSFpBWAlgBoimsqE7yrQeOSVr?=
 =?us-ascii?Q?uIqDeMGbhk6QF11eMPcWrU4/kOKV980ttzBZJk4ei0bVZkvkZQih+GpyXhm4?=
 =?us-ascii?Q?0F+Y7AdffE7CEgq3qVdSt4bVp51iZ6NvO24NRVrLKvRNzJqkpucNJboVyV8d?=
 =?us-ascii?Q?5si/+zEWsxpI6ljoaElrQlLlqDtBmK9dmr8x7MWr+pF87hJfkDFjdvvVHxyw?=
 =?us-ascii?Q?G8jrw2WyhJJ6urEf91UZJ2xlG/yzFcE3pxTKCLEiztUjPIF1MM8yHuF7a7uQ?=
 =?us-ascii?Q?+oVPuIyvAKdKxwpQac4Q5ifolBAc90NQ3+MsBFjCd5l6cXsIZ9FzwjnTdmtR?=
 =?us-ascii?Q?531HVlW8rCH2ggC+q6JTYdow0hhj8z9ajgIUkOXi/XxYVphED91EOUiQS+mn?=
 =?us-ascii?Q?2ZS6dUzoSIQAF4hkeYvmpLlgZY7ZZ7i/6axTvUtETRkmbz+NC60195z8fOap?=
 =?us-ascii?Q?B9Sd7Vmai5ZOLc5nRoMrdAs5fGyAEKXR9sGSo/Ok8/nfdPmG94jH4nzHjfDS?=
 =?us-ascii?Q?+K+MwVL9MgMHKuQsx92TNkJRoKE7fJmAohKzmRtSF3ekl8et5v6QgVmSXFPQ?=
 =?us-ascii?Q?D1aE5sUYgTmuzIW4JiPl0WupbvwV/Rfo6zH1ae/mUrtFWcOk5l5TSlzOmBq5?=
 =?us-ascii?Q?4oI4FJWDHkiwPu4kCsBiNeZbstLp9D8og+oVWKwppGUrXQRgSlJqvDIFWj2z?=
 =?us-ascii?Q?p85ADfREDht0Cao1Wn1MN9GP9kguRhp2DQOf1bo6odmtgu+9JfsQoRGqEDmT?=
 =?us-ascii?Q?QqEoEwqW3Ty6KSpvL8FBsJexGN2w5EC/1ehCsqq6HaeMrN59ktKQNdo6kj+x?=
 =?us-ascii?Q?e0d6nR7WbhjH7oE94Q7nRUiYSgAb5CWcZaLeLONdMByjFnnRkE1mb4dwOg1O?=
 =?us-ascii?Q?r0xhiPUuHX9nnYlWsotuk0MEPVG9FZNGmo5TvnzG/3UhmJ+/Ze6j0UxDShDs?=
 =?us-ascii?Q?KJEMkr1rK8Rz14kVjEeufOhP4YcR4rWmd9fH818iwpaczHOt7Un0xPJtItJp?=
 =?us-ascii?Q?AcdIjaTPqc6F1rruS71oAwBlYViKjLIFPG/7HviNO6R5h7zmsBsgCK96uDZv?=
 =?us-ascii?Q?nbIpMbHSObaVkj7J8lysBM6vu5G8fR6m/7o8MVdUgxXraCQKvsSDUpUJbMlo?=
 =?us-ascii?Q?kzHAJa2oDWi9XG26bihNr1D21oMELcyt39d1dD4dBOWRxjlitEkHkcbHoN+m?=
 =?us-ascii?Q?CbzmnToWSAv23Ry4CE4kzLP6sYEHsbF75Gs47EeiH6nC8JUV4bj+/UQo+8vN?=
 =?us-ascii?Q?+e/BtXKu8Pt12vxOFfkmLoB2A9dtcOUp9pxzu+zYcuVqtq0OVOFUYUm7mBhA?=
 =?us-ascii?Q?Stiu3tuNwvvz7Sqo0U9a/vu2KWchZzzqyYv35c/M1SAt/wvyAcNJ5RCk80T2?=
 =?us-ascii?Q?BJfHVcomCXizyHsgjS7RZ+qNxyoVIBOZZK9vq1kTCq5slvRG+lylcDaBNIMr?=
 =?us-ascii?Q?El01hScvjV2sy41W0y+tuAaSy9lB2+GtDKosRWY94k2hZWoFJ6/qYucoSr3H?=
 =?us-ascii?Q?8HA8VTBNTA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e0c88f9e-4a9a-481c-b8ba-08da1ceef5db
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4875.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2022 01:43:08.1291
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 sqfE3YtaZvpctLn+cmFJOOAXd+2f6G72xrZe7sPM1+xW49B8UkTmpZRX2ePIuqAAMi/3gWL3Da1sW5W4W1nPJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4011
X-Proofpoint-ORIG-GUID: 0RSnsTJLMHdcvZ6CyzRTU_zW4sSaTihF
X-Proofpoint-GUID: 0RSnsTJLMHdcvZ6CyzRTU_zW4sSaTihF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-12_06,2022-04-12_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=834
 malwarescore=0 spamscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 mlxscore=0 phishscore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204130008
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Apr 2022 15:48:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96604

Install frrinit.sh as initscript rather than frr.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-networking/recipes-protocols/frr/frr_8.2.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-protocols/frr/frr_8.2.2.bb b/meta-networking/recipes-protocols/frr/frr_8.2.2.bb
index b1e2e55b5..91e306f08 100644
--- a/meta-networking/recipes-protocols/frr/frr_8.2.2.bb
+++ b/meta-networking/recipes-protocols/frr/frr_8.2.2.bb
@@ -95,7 +95,7 @@ do_install:append:class-target () {
 
     if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
         install -d ${D}${sysconfdir}/init.d
-        install -m 0755 ${B}/tools/frr ${D}${sysconfdir}/init.d
+        install -m 0755 ${B}/tools/frrinit.sh ${D}${sysconfdir}/init.d/frr
 
         install -d ${D}${sysconfdir}/default/volatiles
         echo "d frr frr 0755 ${localstatedir}/run/frr none" \
-- 
2.25.1


