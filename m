Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B87D3C28B2B
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 15:09:45 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.29916.1660748975361035218
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 08:09:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=VkRez1FH;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=522867605f=saul.wold@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 27HCZMFM015376
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 15:09:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=gB0DB1xCTeIajFqsljqno20tRWdTNHW21z3gznIE69U=;
 b=VkRez1FHiGDYPQS66X7DV1ShrVFq08oc/LL3969oA0vTzQszTtL/HK0M11vYpkbH/qPu
 /N1ygaYY9sWymEXioCAS5135Vp64HAorhJbbtJUj8YveVqgk+VOg+UiJsorZCupS/h1J
 YJJENvkkvHcK4TpBxDMlT2acaet+wmSLJYdef3OCUD/dtOIYpLTH4ewjif94l0vtpfNU
 UGDJHJ3U4JOELxTOXUUXkBOFgMSs3hccl2gnZu4mgIxWMxewtyTDNijT6t+G6VJTsMsF
 f40n1RTId7RG3Y+t/q0ViYjiGeK6NzQNJudScgN2JppEppl7r/gu+uvn9Hfdwog3u5DA GQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hx160uk49-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 15:09:34 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27HF2U0a012695
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 15:09:34 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hx160uk42-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Aug 2022 15:09:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OCMsgbjUBy5rSQTr48ihv7b5TIopdlTjLMdzBVdAq9shxFh+FMHvwAKiitQkYoawlgObfcme7OJqqpUsM3P6e0KoasfNLqBw4mAR7DwSA0Fb7cBaHSfCVTOIUxchd4gC8GM99z72BGOZNofCRHMPfHEgnjxxN3Q0HkLL5B2cxZZwkBhHIklByTOpUaadKVbXLN6aZpWVX4HuQTpPLF/lyuFoDMWEJ0Zr6fVXzFv17GFUa5MCJAKVaY1sH2+q3VtDEtuhITVac52oj1HZMEc82+iZjN8hQNeHVA7M2r9+r8L1MeD5C2W7WUPwX49ELRi7edQtfKEPn90Ylz9T5G/EnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gB0DB1xCTeIajFqsljqno20tRWdTNHW21z3gznIE69U=;
 b=aT9ArLr4u8Zpp4J0P2KKayZeTMtnJJ2VZZyfvvf08OMqNr6EufSdxJWdqRpaRStybMH5mKVQ6DO/mE/Ah/oi4KHjzCmvSgxnmV1DGCHzlYybxkVGPDKUZrzvPYsFNZ1wikBPEQovbeUToYjfYIqxMDQuWMABnTx6ZcX78zawwl60KOEw2aipOqLNRoGRjDjcmaAvaDeQS1gnRHzBAT5WkgY5Qo+T2og2xmJVdIHO8aI6UV9JgZa5QNZtU08jcjDow2tqpflCQdhJp3CmYaZJ4No0sob3aLrqb5Dmyqm+m1Cb6gZCmM30H+Q6MeeEdNjOZBxHwGMZrHmfuFlCzAVdVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB5818.namprd11.prod.outlook.com (2603:10b6:510:132::11)
 by MN2PR11MB4493.namprd11.prod.outlook.com (2603:10b6:208:190::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Wed, 17 Aug
 2022 15:09:31 +0000
Received: from PH7PR11MB5818.namprd11.prod.outlook.com
 ([fe80::2db4:2f02:b7de:e4d8]) by PH7PR11MB5818.namprd11.prod.outlook.com
 ([fe80::2db4:2f02:b7de:e4d8%8]) with mapi id 15.20.5504.027; Wed, 17 Aug 2022
 15:09:31 +0000
From: Saul Wold <saul.wold@windriver.com>
To: openembedded-devel@lists.openembedded.org, raj.khem@gmail.com
Subject: [oe][meta-perl][PATCH 07/10] libnet-ldap-perl: Fix LICENSE string
Date: Wed, 17 Aug 2022 08:08:50 -0700
Message-Id: <20220817150853.2823101-8-saul.wold@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220817150853.2823101-1-saul.wold@windriver.com>
References: <20220817150853.2823101-1-saul.wold@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR04CA0035.namprd04.prod.outlook.com
 (2603:10b6:303:6a::10) To PH7PR11MB5818.namprd11.prod.outlook.com
 (2603:10b6:510:132::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 35c71512-45dd-4604-4183-08da80627133
X-MS-TrafficTypeDiagnostic: MN2PR11MB4493:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	r/ewnsuupxRdja02eFyVTUH+mT9NUGDG6TgTWCuTiwLkCObWVQuv6xCaGC0sPqiScsK7iaK5nef8KBJI0bJK/R5NB/mVq/qGHMrjrBHyuw8NLfz6rKDG2lpzxfcrrO0s8AZ0rz6Vkf3ydTVylq5kGuHwe9no9u4SI/TIHH0dBX5k5TPG65qaA37IJuvyB5+ogXHnZ/qaR1LWB67ot2m9lC2Fjx8f7PW6OsuL9xWxe4CIEtUFhUSp/abjkA3PFCg/0uJOGt/A+NdFn+yG1jDPHLS+aEVUE2TnRBMAIPRQTk0CNFmth4fGODchiYVflBLwTOoolkv/rHTZnSje5n07w4fbX7WJGbUpGl29Asr3x+a2M3JbtK/G00h/k1XXxsnlsV5RFSmw3WP/gVJb1n5t+o7UvsVNpqGWKNxONa4NeLb99ghAGTs8gGmC5S7VPXMHJdVUUWjdeJ0ktAT2Xv6kIvxK0SieJL3P4vEEfnGzfbGTdBamXB38ZNgkPu1aPOtOAmNyk2VJ4TfxgtgWOAjoTbFtf71vTejSaNgy0Oj9R1iB35CNOXHkGgnscskjvBXHwZg9xQQGmUCZ/sT4+YckULdzbsT88epj0bRyHs181y3asxx3obYH67O/mtvJQ4jpPVGHL+xFyUgfyVgRB+pLFjvE9kPHdKxZ7c8UdWUtmR1Hep9rdCYxc22KYkYzyBracWX4yT3+bI0NaGs2JHFQZpQB0/gElIFgaW4mTuWbQ47Gza4C6nChrY/AyqTJUBWqq0dWNeUCH92cQ3MTbZtmVwMo3Dc9eDzZkby33lT1iTU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB5818.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(346002)(366004)(396003)(39850400004)(41300700001)(4744005)(316002)(478600001)(38350700002)(38100700002)(6486002)(66946007)(8676002)(5660300002)(66476007)(8936002)(66556008)(44832011)(26005)(2906002)(36756003)(186003)(86362001)(6506007)(1076003)(6666004)(2616005)(52116002)(83380400001)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?XoKkEcXbAyXoYb7z6qUisqkSO8lbO8Nnt2W0i/Lon7J3vdIx1QdIhp5tXddb?=
 =?us-ascii?Q?DKLwKmroAGj3FdxEOuu4/RfX5VwpFfFdBHrvzRipPs3/g12wRYuKqi3KKQHT?=
 =?us-ascii?Q?vCkMs7EZWJjTDTqI8hITPDoROyGWasmjveOMLsFivYj6US8AZ6IRermX/1Xf?=
 =?us-ascii?Q?e+9pJoIYBH8CFJRkbHk/EqBF7PYUJr+qdAo12YlPjMQlqySMm0B+W9h0UUqy?=
 =?us-ascii?Q?t+oSkwbwxvVxviT2UDIsV3+vv9At7T/SQE0G6ft1wHF8Q7akyleoKaNsSsu9?=
 =?us-ascii?Q?XP2vZE7ZqiiR/C+LV1jd0d/BI/DamYk09r14wpBQxaphNsOFBJtHqer6WGAZ?=
 =?us-ascii?Q?W4Kf5R5UCmjbsVU0M15P8dxbVV+saKgF+Y4uLLoJJYDnTiOrQjn6oU7q5WSi?=
 =?us-ascii?Q?F2k7WoSPamvNeGhUUf1S23vTU+5BgQNvhPjgx/1FH6rFYmlkJOVb+1a5X5KL?=
 =?us-ascii?Q?bZr23Hg6MjEsiqU00rkBiYZlIDChMn+9evfp8DHx8WIdo3riJKkzw2Uf2Dga?=
 =?us-ascii?Q?JK9Xq8BpwQpwMuqKlfRJP9xa9Wh4mXuPC+XPNm6XuNcgXPf1ab+cLssdE0sv?=
 =?us-ascii?Q?x7Ngp+E292Mb7d9PUsa0wfVMnnZOBQMQolvh9hTKlgUSrev7wvqKMdgsS3NW?=
 =?us-ascii?Q?8ETOnix3kyx9SnMVEj9cJrh7p6RNjlw1Z5pczOuwQApRssgtB+xAK8MqVpn1?=
 =?us-ascii?Q?j+Il4gFDOnCUdKrS6NrhrKL6YBCsKdBc/CDQtgiPZEQLWBpXk8ZD10yoV8Tx?=
 =?us-ascii?Q?xJPAi6xlM7QV051D6UfRNGTlaz3A5SBwpTDq5xsvgR9HI0BJxqwK2fEjHCzV?=
 =?us-ascii?Q?Kn6tuStyPnTfR7rTvJq0QV3rrmsvp/DSWCfh43JdocNIcIG1TBQY09jH/t7M?=
 =?us-ascii?Q?PSLsoDCkwO9BfcbJ30MDALJu2e817AjVRZJZT9KlRL9y0Fsg84bypt9FqN2t?=
 =?us-ascii?Q?Msf93ZkAsgHBuuaYZZHPZG/0UdsibKVBx5DmuodeXSLOmv/8BRmR8BavEna5?=
 =?us-ascii?Q?jm1C2CgsxXTK2d6gDZEQC5KAVdSFSmpUq+4HDDX1TgAzlPECp6G8OnjEGtdl?=
 =?us-ascii?Q?URMnbM9LeOE829RHXLWA/FYQvzCyyhDUcqvnW+SXe6EKOD/IX+/TUGsNHmwh?=
 =?us-ascii?Q?jfbEIREh7koIhDTZN65RJpsK9ib8zMsltky2ejA6PhW7jXneFYg4aaDGt6vh?=
 =?us-ascii?Q?aKUgZSfmm8nFj2p+v/3yRtdWtAcQVLDPKW4chfOfaVIS2mmPJwsypwrVCLVP?=
 =?us-ascii?Q?UqyXq4F3qIPD/DIDF1PTlKj2vPUA0EX9cRE/dvtz2O6jMkEo0zxz4+3UdZ4G?=
 =?us-ascii?Q?t+Qvq6fWUWsLIjVgdpU1d2B0N5PR6JOgSGkFR6f+31UAGrT8EGvG1QVOmWUe?=
 =?us-ascii?Q?Rs33aoNgivOg3lpYoqMMdw3rp5jTwDUCK+exavU/Fezznx8rZxEHdO8X5wlT?=
 =?us-ascii?Q?WMSV/Lli7mogoZOzU6q5ArBhWo54fhPn74PCiL1qKzIbklAfmsAY3F37e8Li?=
 =?us-ascii?Q?rHGBBaB/dxPMwusPdtgLDPqkAXBa7ReCQCW/zJIEfmIgw8o/CzubziM+8NPO?=
 =?us-ascii?Q?5cZitB5Sej2VBsGvwl7OkumDpUJNYUKrdjhxu0+UOeLsDVTxnkSBCp5Rt/bz?=
 =?us-ascii?Q?Mg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 35c71512-45dd-4604-4183-08da80627133
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB5818.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2022 15:09:12.3351
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 myu1CC8CeqyQqnNJcIZoAWWDa2SuSBB4m+GeeI8JpJobE9gmjEDXMszLxo09g+hkt5S5ZwVHVxTDscWDOuPJIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4493
X-Proofpoint-ORIG-GUID: 6eE4Dw8nu5hPQyvgwky_al-EtlBSQsD7
X-Proofpoint-GUID: GaTVuscrVHT4hcyVZ9MH3qWV1hqTRmzZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-17_09,2022-08-16_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=999 lowpriorityscore=0 malwarescore=0 mlxscore=0 phishscore=0
 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208170058
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Aug 2022 15:09:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98302

The create_spdx bbclass does not currently handle the lack of
spaces around the op (| or &). For now fix the LICENSE string.

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 meta-perl/recipes-perl/libnet/libnet-ldap-perl_0.68.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libnet/libnet-ldap-perl_0.68.bb b/meta-perl/recipes-perl/libnet/libnet-ldap-perl_0.68.bb
index 293f42120..dcc5ea88b 100644
--- a/meta-perl/recipes-perl/libnet/libnet-ldap-perl_0.68.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-ldap-perl_0.68.bb
@@ -6,7 +6,7 @@ deleting or modifying entries."
 
 SECTION = "libs"
 
-LICENSE = "Artistic-1.0|GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;beginline=3;endline=5;md5=4d6588c2fa0d38ae162f6314d201d89e"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/M/MA/MARSCHAP/perl-ldap-${PV}.tar.gz"
-- 
2.25.1


