Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C63FEC32771
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 15:09:45 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.29917.1660748977503793178
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 08:09:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Jp/aGNNn;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=522867605f=saul.wold@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 27HCVGKx006899
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 08:09:37 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=hpT9KllBZzd3jse2T2rn9SylHcpRyvmcBxFmKiS6GvM=;
 b=Jp/aGNNnhjREs79sUBiWzjFb3s0kEjaiUDzz7lbsKl0UyEB3s1KEri+wLywQC6rLCS0P
 H8sfsUss27z2d+pe9iaEl5ZuJtLVnVaaUJYA6lSFycVeAO0K5uQmTbfk8TWgWbW+DOb5
 AJ/aagB4OUOQF423iJUGG10CNQ2Vz2FPkba3+YvsU6/dxUc6vGx6rvpHEwQ60m7xA9qE
 DW4Lo6Ss6t02jLck6mc9RL6vOpbX1OHMnA7OLcJ62KrbrERXBK0hf8+mtMYJxJ2gwxCX
 23LuT4UB+PkMEFFc/My4Yw3D4pjFcGBQRDtpwSmJpRZM0RfPSb/gYKxO8DHdCuDwAnGE KA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hx783bet3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 08:09:37 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27HF9Uhc031006
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 08:09:36 -0700
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2170.outbound.protection.outlook.com [104.47.56.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hx783bet0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Aug 2022 08:09:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AKZj5gWwTenm5cxgqJ4l9viGMwpOdszSfkU/C0TE3YsYaUCshLpyv34KeeNaChIalpvZltEXujxSA21CzGgVtj3DYiyGRo/vsA6Ih0T1RYDczYXMpK5yFH8UyM3xPiyNqJSlmf86r2070kiMLa2J5yWmf3E08XAVT9awSPL42rGFkfZMhLZRUWTCPqRtsR8jMh/oUqVQFRoFsx8Q//VI2FuG4lgta5VjdEUkHX3qtNfgw8NfDLvQC430ebOtTsKOcNO6tjH0fzt1HwdInirFfPOP8uMFPkGMrULIgJVRHrWjpy31ZjHS/Hpafbm5Tj2tkOYWiCmo5g05PceB25BHog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hpT9KllBZzd3jse2T2rn9SylHcpRyvmcBxFmKiS6GvM=;
 b=WZohZRo06Y6NeYfg2HkVfe6qwLhb+vEJSl8oJg1UYqCNXEyFHABKT5tzsGY2FWLVEskQtXAVVwKamE5edIS0m/1+yTvZs5Lq+mhJWyVrzgUHycqPBSwTtmC+Nxd09MR45D7ICdEV9ndJXwwFiBst3PCkgdTerlk/MU60cQHIdTTiL+kklTZXA7UCUvLR2qDmKNcgpAYuGiDBx9nOj3TJcviTUIGw+G9h2IlJAAcKrBQEcJZUGm4ciuoLFjcHJkHLP/BoaNdWlp8M+Rpe+YH5FIE1gCMYlMHKbo9h4WbQL1tddHY6JjFO5qH2AIJ/ZhdHmrTG9CyprjchD/RSiPi2Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB5818.namprd11.prod.outlook.com (2603:10b6:510:132::11)
 by MN2PR11MB4493.namprd11.prod.outlook.com (2603:10b6:208:190::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Wed, 17 Aug
 2022 15:09:33 +0000
Received: from PH7PR11MB5818.namprd11.prod.outlook.com
 ([fe80::2db4:2f02:b7de:e4d8]) by PH7PR11MB5818.namprd11.prod.outlook.com
 ([fe80::2db4:2f02:b7de:e4d8%8]) with mapi id 15.20.5504.027; Wed, 17 Aug 2022
 15:09:32 +0000
From: Saul Wold <saul.wold@windriver.com>
To: openembedded-devel@lists.openembedded.org, raj.khem@gmail.com
Subject: [oe][meta-perl][PATCH 08/10] libnet-telnet-perl: Fix LICENSE string
Date: Wed, 17 Aug 2022 08:08:51 -0700
Message-Id: <20220817150853.2823101-9-saul.wold@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: ef054a11-e987-48bc-cbcc-08da806271d0
X-MS-TrafficTypeDiagnostic: MN2PR11MB4493:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zM8Ld9hjf2s+e+6E+xSn7gpoYM7PT/AS+QYE7vlfkAtLAmGxOJTcI5UaWsA8L6TGl+5vZ7SS90jzm7swwiSJiaG0DBP9qjK9UfcqNVjpIPLJbU6CXsKRqgGFgYoaYnAtwyOGZzZqKrBLUq1uelTygB6/bfStHmXoeumx4XuPxXg+gMEztnvD7vkn0D+rfOxMlTr7sADQKeDEUSHL9zBxeTcxyPZ7RAD03MdjwkqAEvCzaoUUMs84DwKrFNEutEuTPDwWlrbufYzFoh27ADk8B9LYpSsfX6cNXVx/gk68PAf1d86UajFWgx8cc/7irfqIdsP9n8b8+qIGGwFFTOK6lAt4VoH+GuhVQRYnn7W4QwV2inxG6kn45Jr+4N8XGcAWT/eOSnoq6/Ei9/asSjzkO40Aci9QR+uRU9LY5/oqXpBcYRAh30xmcZs8meCLk3mHSmPzQma0oQAQpMau+ecVfBzgSl8KbjIn/+4ie0qL4PKLJY0NXaR6JhwDyjt3PNEEQWlX5t9rpWpK9J0JvPROc03Rc6BYdi/jaZEdujdtxiwYD56V1FSKWdQX0MTAmLILtkf0DwDeytNa2afvqrkHLetuKfYyg6q1GQ2AM5gZVkfimw63ZToBk5mOjvHDtYLptDySnpvH83BMsrnkaGF1c1Ixi9v6SlivBwHBgnKGNTovKvP8icx1yR/+NIlCFZSYBtGhnC8Aj9HtsB4AbxKvyW+YdJXHGDXG91e9c44XjfUczDq/r8No7f1+KZlBodgUSi8D4/Io4DFRvNm1yxvkhFeBjDf+fqE382xIIljR8KYrpX+ojKKRlELymelyBlqy
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB5818.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(346002)(366004)(396003)(39850400004)(41300700001)(4744005)(316002)(478600001)(38350700002)(38100700002)(6486002)(66946007)(8676002)(5660300002)(66476007)(8936002)(66556008)(44832011)(26005)(2906002)(36756003)(186003)(86362001)(6506007)(1076003)(6666004)(2616005)(52116002)(83380400001)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Hjy843ofAAw7PCfPCOLj45QIQhfv5+1emDLB2wh7BeOTjn9eZiufzJdYPEoo?=
 =?us-ascii?Q?pyeal12WHOdEdqq3lw8OsV0jqsBhWSHDooR1F6WJ+Il7UW1YF8azWsotht3a?=
 =?us-ascii?Q?T/GrGyMLTWqg66HbfLagygxn9RHjhW3F/kFkxeAyYZFduRZan42Q99m7EhM7?=
 =?us-ascii?Q?4x2+jEuyaQdlKAilrjhUw4Wgpx+CE+8ZEkjYZgn0m2jM8fmbYu0Q1+dUNAkn?=
 =?us-ascii?Q?G09mJInrJzIYRo01KX+YwUKihNKGEdxfEMB6G/tXjtPH/uUu8+NYm9mWkNZc?=
 =?us-ascii?Q?L/flD3YVUAvY778mkOeSV+IFQEbQ/krrkjJYeusUEssp7a7zZe1OAG+tUV9C?=
 =?us-ascii?Q?+8+wn8YG/5etEAR04cksFczh9yeTQlbymsmVu38lJMLZ5OPGgx7W4TXOHeMj?=
 =?us-ascii?Q?txOga6gIx5vmc6Rsanht2qYgX9JpYQX9FOwmqayGofq8SX1d+xbW49FzYHv+?=
 =?us-ascii?Q?88K1IafLk6OL0wqOc15ETyQYNzk3YQbG2YlVE3nH/DRGFjrsarrAi08wD26A?=
 =?us-ascii?Q?jNwR/VbOvBvE8Ac53nZR5ODieTBEj4tOqOYItw3zjDqg8RiFNnJVUa2zvt6r?=
 =?us-ascii?Q?Brf7ZhH3S09eCZbVhLb7JbNN8BFPad4UQZ8NS1iN39FdGgHZBv9si1PorQa5?=
 =?us-ascii?Q?0kcbHEOEInSwhM0uQqsYrTgqri7LI9/lwtTnBj8gJl2EGAqPmjIOrwblo877?=
 =?us-ascii?Q?M8zbkS6RILNwvvtTlyuu81Z6FRm04uNw2JksJnyyPrO5kyEQFXwU2xsGX4T8?=
 =?us-ascii?Q?SVG/HGF+k0d+2rnkVRvqXqNL6HEnIzNJ87bwqsbcGNvTXh4kfX5JhX3NH4Hp?=
 =?us-ascii?Q?S93HKiTOAd8YDfCmlQw5nQhcSrSUg9er/G7FVVfQOn1Xy9OnfLJkq/DsysFE?=
 =?us-ascii?Q?j515LFsru9yYftvXyIOvsXIqha92rRN0hdlF9OmrUnCJpFgDnUHFqXzhGqX5?=
 =?us-ascii?Q?oEtnPXbsPogfTz5Nuf1uFvgFIjJE23M4x8A3zbZpHiZ6Jl3mSrcaVkxLiK9u?=
 =?us-ascii?Q?O7M/82O7YvBxDkQqfl8/jcAhs/l7my9VAHCgnruNWlqhdiMrhLGVRrqZ8LNY?=
 =?us-ascii?Q?6g4wNwLifuu51jyuUyxIGIgNhEf9LOx7VM6Uf3/aFALElGvQa7KSsiojmVJz?=
 =?us-ascii?Q?BxkXasBYokH3/I7a19C//vkF+JfA45ROFGYQjtKw5r9HFuCT3H6WlkxQjFeP?=
 =?us-ascii?Q?IAfC3aENfFs5tKJ1HZKJ/ALFO+VHKn2qkYkXvF6xpw/Cgeg+/Ed+7E9nljsz?=
 =?us-ascii?Q?nreDGl9HVWUEJcN1+8cDKE+FEnr2WK2ip7Q2YcdpIDlHzClqtsbMkRUldVlV?=
 =?us-ascii?Q?kmig0oGmAYNB6bP7rAO51gJe/g6DW/MVTE9Xr5f7GREv449yiCv5k58FhUSz?=
 =?us-ascii?Q?YtUXDzjYC2ECFgKlWNTs66YDucvF114dqizCiBaPyiPYThfyIJ0A3wtyKUbJ?=
 =?us-ascii?Q?c0czCRD9SGxLABDp3p8u2Imrsz5zXlg0nSLyXE4MszrReDiGM/Eyi093p2ee?=
 =?us-ascii?Q?0tTAbl+9iIk/dnjUMpJRHjn3/hbxypu9q2RigqlrLEK4aueEzmtXSVgcUtrB?=
 =?us-ascii?Q?IIactIOkPre0dPX8Gs4VDjFq0rdvV170yyzjFAc4gpB7T6eA//avYJX95IEh?=
 =?us-ascii?Q?ig=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ef054a11-e987-48bc-cbcc-08da806271d0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB5818.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2022 15:09:13.4130
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Ehin3yeaxuiO3Nap/fk2yMmocES+NRI0DWyvxmLV4UruWj+verUpUtJ0QOv61rK7CE65AxjGVKdRLPnj8XJRww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4493
X-Proofpoint-ORIG-GUID: ziMsDD07Ni1MnvUPIma8hhSFif48wmsF
X-Proofpoint-GUID: LxQ4XH3KeZPqxH3LiNrk3_Nn2faqUSLU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-17_09,2022-08-16_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208170058
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Aug 2022 15:09:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98303

The create_spdx bbclass does not currently handle the lack of
spaces around the op (| or &). For now fix the LICENSE string.

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 meta-perl/recipes-perl/libnet/libnet-telnet-perl_3.05.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libnet/libnet-telnet-perl_3.05.bb b/meta-perl/recipes-perl/libnet/libnet-telnet-perl_3.05.bb
index d7d420104..d1365f269 100644
--- a/meta-perl/recipes-perl/libnet/libnet-telnet-perl_3.05.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-telnet-perl_3.05.bb
@@ -11,7 +11,7 @@ shell."
 HOMEPAGE = "http://search.cpan.org/dist/Net-Telnet/"
 SECTION = "Development/Libraries"
 
-LICENSE = "Artistic-1.0|GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;beginline=4;endline=7;md5=e94ab3b72335e3cdadd6c1ff736dd714"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/J/JR/JROGERS/Net-Telnet-${PV}.tar.gz"
-- 
2.25.1


