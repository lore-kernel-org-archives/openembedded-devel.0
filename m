Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B22EC4332F
	for <webhook@archiver.kernel.org>; Mon, 26 Dec 2022 05:27:28 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.131737.1672032444610533647
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Dec 2022 21:27:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=sFb3zBTN;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=93595062a2=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BQ5IO5N008262
	for <openembedded-devel@lists.openembedded.org>; Sun, 25 Dec 2022 21:27:24 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=3wMD/W73CFyWWoMDwTqq9F6Cwa+XZjGHcOo3nWHVE0U=;
 b=sFb3zBTNtRNvlzt4DAU0PwZRe/+Zdu4SavwePJxwHZS3gZhQCxEbURhh8VIIOnrY3/J9
 pzOqV3Gn68M8VdrXBF94vokq7IJp0LXyOM/U/+0fa+v/juS42gcYK9OWGbqPt68OY/kJ
 s/VwflC3va+NhAuMfjRgcRFLs5n+hdXH6JByheWgRiGAGtBkGVwVmiBOKjruclcemi+j
 o8nGQW/1eilBTEK0tDWYziih6Tf/TXMrUpAozCShEqXXjagZVkpnNcg7q415ptT5NVgF
 vkEjPM5NVNsyD8c8og8F5tV5ocj1gFhY10kna6hsgVyYXFXAeLlb6OmYzx5fJITlLDR5 Ng== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mnwk88vpp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 25 Dec 2022 21:27:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QpXppQB/lFUS9xteLKzefBibuCw+o2dwogRK20pi86/J9Buv3mtPm2/GrJBqTcP/UukjoULVJiK399gZxY2TUQdRIN4zgTj26pbfbb4uP14DgP/7dEsABWeeZW//i1w5SijTjnXKUQKy8+fif/nxkfLo07iSWHADqPABcncymLNWlZwLSEk/Qwbfmny8gDofnUDUcXB6g1g8+UHqm4RbAH0SUT9VHjT3a98BqJcQPCeQ7HH/5J4I82EplCubc5InUNP+tQIg/KrbSVo0sbpgMCohgbzPUiZ9pCynD7q+A8NdrRQtu3vKb0is75h3unAWvCazGpUmVkNK5ERlYd+fJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3wMD/W73CFyWWoMDwTqq9F6Cwa+XZjGHcOo3nWHVE0U=;
 b=GTHQypKWXNf2D6V5/1xytzN8sdh//573k360+/ye+/E99bl4NmLonDNPgIZdxwTdNFmVefYRA3bTzJFAIUuWkaHh3RHAmFC9NFQU6LeATPBqTA+BD+Kf9O6xKVlJiZbPuL/9VEiTR6TPabqOKvY0bZo6MuP52jBX8XLP4/eEGDDnVlZNUUc0kiAHiI4CZ3gPG8plKhUeNkMWE6r5Z5sRQGd4/K+Ues88m9QRDn9/KIjzgiAVjhcH2Po65eKRbRzsG6cKsI7fFO/DINJs+IW63+RAgXRxAvddsfzcWEpDuUqFkB0x4dYrzBFUz6luWUl1BJlH2R1Q5hINy/y/ynA7KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by BN9PR11MB5467.namprd11.prod.outlook.com (2603:10b6:408:100::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.16; Mon, 26 Dec
 2022 05:27:21 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::eb7b:3a04:80bb:4a5f]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::eb7b:3a04:80bb:4a5f%6]) with mapi id 15.20.5944.016; Mon, 26 Dec 2022
 05:27:21 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] open-vm-tools: upgrade 12.1.0 -> 12.1.5
Date: Mon, 26 Dec 2022 13:27:13 +0800
Message-Id: <20221226052713.2954060-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0086.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::27) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|BN9PR11MB5467:EE_
X-MS-Office365-Filtering-Correlation-Id: 916dc2e9-7200-49a7-2d17-08dae701dd01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KQZIrSf1k6AZaKKWjUaPWybCGmTqQZrma1gUptNypPMBlyeFOPo71Rc36nbvHfLhh7SAKO2s3ouCUyedUMQ86BMW38OxU/dIg3IM61XNs50eh/exaR/04qvXR6HIWZAvosR0EjgFNRQ0viGgxWk8gMyX0WJ68e+ezcxpRMGHCRPOfG4+pUhtLA5g00YF8ypF1es+/sqcTyvexoFXPyPjYf+w8qUI8/dwHQd2e2xau6MN36b99S44nkuJ8UQV+/AR7+prFm7sgTPsiG2kYdZT+xmDvKqNLBxR8ypgTRunWl0kksg5DjaFaOTIZqdTyNJKRuAOwIiNNmAYoJnYvgCkdvdRTy+63vDXwR80RKK/p52u9l0e/gUQvw9BFrkZ099+MOgU6RaQQw9y3l1/nLkw5J4i/5AFYKH9ouVEA4+IaDHaKV5OOsxmBbX9Bqn0MRq/yMktmHi+L01XkEu9FrKSVEXrT9mP7G4CNtlfUBBi0FGfgVNN24cLVGVWqGW008xmkHsiyHVDcWTUKSUuUbbKZeVs006lBGa86OfzwsPH9Vyyl0mELcB5icKUIy/3sCwT2+3Ww9rS8dPuk6BGalh2jyS7B0My5a08Gsmi2WW1OPe89S2nzhA0UtaQk3SxbudxvqwYHDqFwpeSdJfSViLPNAcQQURKv24SbNws40+QjB9ItnVAsZkLIOdH1yTcvHuH2PoS1j1ffp5os+3lbXBppSrU8Z1vRENQLYukQ5YVmmE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39840400004)(396003)(366004)(376002)(346002)(136003)(451199015)(6506007)(2616005)(26005)(186003)(44832011)(6512007)(1076003)(478600001)(6486002)(966005)(52116002)(2906002)(86362001)(316002)(6666004)(6916009)(36756003)(41300700001)(38100700002)(38350700002)(66476007)(66556008)(66946007)(5660300002)(83380400001)(8676002)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3e7tJ28mMuWqIujbBvAF8CQzhpilZBHux6M4KF/mS8RV8xDXIAInk/EV1xZw?=
 =?us-ascii?Q?Yo7UFT8bTPfMDR/YZt75WE6CmtRv8WFptLwm389If6iaVy+4QnFqPoBdQR/c?=
 =?us-ascii?Q?mt6w/hyUOJlL6SrlNwZrt+3LEz/geFYTBWQDjY9zYlXfGq7ZvgRNSl0bVAm8?=
 =?us-ascii?Q?ij7//XWlwTZ3/WqiDTtW7vmRS+lpW0IFuS2bjtbkqB2FNJdGsngnVU+1tU6d?=
 =?us-ascii?Q?qgH1w+oA46dn957rannWFvbRxhN0kgm2UWLGAZbVXM5wRrSlRk4usNlD3FRL?=
 =?us-ascii?Q?1aI8Rhk/V83tvX+MIU9Umouep8qvTMDEadAadJh4oxRjLkEBmSShvEstixZy?=
 =?us-ascii?Q?XMWGslJ3ODqU1vlhDNh9uT24ib16cq9okkgu1F/1GHUDeblLCNFwzHZsc8Ab?=
 =?us-ascii?Q?xCiY7ATpopjlpAG/BDW5oUZOlnPtrcrqSfsFpgkmSnPLAaDqIYzrvdahz6W5?=
 =?us-ascii?Q?PqAJ89Hlz2uGKfreZntIv5ae9ukpY3iUW3YCnWDUvUvf6JCbcR78c9FpZrGt?=
 =?us-ascii?Q?uFp1VUPd2T8iTSQTRdZjh70vBC3WGZGm2E5bUJFiDDz7qQYNcJAfFbZofit7?=
 =?us-ascii?Q?SOFd35dJh/DqGqOAR8P7/18psDN3rDQFnzoQh9zO66Zx2Ma0Ef60CPhI9Rmh?=
 =?us-ascii?Q?Byopm1ti9qfPmXp2dKUPElGxgFeXUZhtLVms7Lw3PucavIfy4chw77wWepXz?=
 =?us-ascii?Q?OTup7XJoiRAhZrPSfy98zKEtDUyz4Lrn3l+VhpOJWcrFXvxgaLtdI5r9BP6L?=
 =?us-ascii?Q?gulaEyul4IHqIc80hf++2L2b5YR9cc3cokEhHSvIxFknB/qSwnhg1aCrXGtr?=
 =?us-ascii?Q?YZkHViR1Yq/byK1GPXvFNvbKw8t7m6VjmKrXF551fhvqIGuJBFbHM4InhMMx?=
 =?us-ascii?Q?FOk+vjTn0FjXLY81RVUHtEeTdeZyDpcRN5f2mcxzlgFqOczvY4IPvR5IsbkB?=
 =?us-ascii?Q?BZa2HvGv2ik4Q13ORdTvdCL3J24U+ljpx3JsjsvYG33GWlOeEnIxIIAxHICh?=
 =?us-ascii?Q?B0hFpW1Kz0lOKHoLu12KBATvp72f4hD8ZYl/bJDKEd/9ZV0FbmzH5V7u9P3u?=
 =?us-ascii?Q?XwBnN60IfFWomR0BvUusuLNAfIiutNWg0Mo5B+HP1v7CCH0U7xGOnUHIIySX?=
 =?us-ascii?Q?NErqOLGUI+vf31rD6cKDkx5rZe5fz/yys0FnMC7McZRJ0Ri8aKqw8fsoJW++?=
 =?us-ascii?Q?nSO9up8K1tsxVUA92DBIz0pz2AO1rfSLuK2m4uzPCmvjQy+IRp0VSPJMawLr?=
 =?us-ascii?Q?Evl2SQcGlfuB6+Vbc+Z2QOPz2ae9FoARPftdC4yN6sdoJUQ5QQVFKBa8XxOk?=
 =?us-ascii?Q?YJwP9A0D0I2cSpMUYpG/+qYb6yIdT+ziyfIB5Cl7NTFaC/pIvbUNyiSRF4TK?=
 =?us-ascii?Q?SIwRkTfctd0cqNafz2NNSYw9pCOteAqcixE6G9g1NgY6UNJsSiRzsXyeuwpO?=
 =?us-ascii?Q?gs4p382rjFkZDAFpErGX5hBnHhM29bG9Lu8F7mM3Hmp8JcXYPnEJ1fLiufCA?=
 =?us-ascii?Q?bdKmFlvACWH1fT4ZuPUA1n6mNxymh6H9gzvhSJbh5Wrt1BwjjurA8402P3/q?=
 =?us-ascii?Q?7buwfQnrBE2lHi2rdR7+c1MYz38ZbE2WQvr5Hyqa?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 916dc2e9-7200-49a7-2d17-08dae701dd01
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Dec 2022 05:27:21.7671
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H1T2AimyAhzbhZdg3ReNlx4wAk+9h5i/uWXrhczdD5hjxiuqaPZyq7c6mQfNR8Ubg4qewMFfpz/2SOdDGNiBkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5467
X-Proofpoint-GUID: f7kuT_HMT7aqMCa6-YjrnvUhjwlvFMxL
X-Proofpoint-ORIG-GUID: f7kuT_HMT7aqMCa6-YjrnvUhjwlvFMxL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-26_02,2022-12-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=958 suspectscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0
 impostorscore=0 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2212260046
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Dec 2022 05:27:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100238

Release Notes:
https://github.com/vmware/open-vm-tools/blob/stable-12.1.5/ReleaseNotes.md

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../{open-vm-tools_12.1.0.bb => open-vm-tools_12.1.5.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/open-vm-tools/{open-vm-tools_12.1.0.bb => open-vm-tools_12.1.5.bb} (98%)

diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools_12.1.0.bb b/meta-networking/recipes-support/open-vm-tools/open-vm-tools_12.1.5.bb
similarity index 98%
rename from meta-networking/recipes-support/open-vm-tools/open-vm-tools_12.1.0.bb
rename to meta-networking/recipes-support/open-vm-tools/open-vm-tools_12.1.5.bb
index 19e4ee11e..93d3d59eb 100644
--- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools_12.1.0.bb
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools_12.1.5.bb
@@ -25,7 +25,7 @@ LICENSE:modules/freebsd/vmxnet = "GPL-2.0-only"
 LICENSE:modules/linux = "GPL-2.0-only"
 LICENSE:modules/solaris = "CDDL-1.0"
 
-SRC_URI = "git://github.com/vmware/open-vm-tools.git;protocol=https;branch=master \
+SRC_URI = "git://github.com/vmware/open-vm-tools.git;protocol=https;branch=stable-12.1.x \
            file://tools.conf \
            file://vmtoolsd.service \
            file://vmtoolsd.init \
@@ -49,7 +49,7 @@ UPSTREAM_CHECK_GITTAGREGEX = "stable-(?P<pver>\d+(\.\d+)+)"
 SRC_URI:append:libc-musl = " file://0001-Add-resolv_compat.h-for-musl-builds.patch;patchdir=.. \
 "
 
-SRCREV = "6f5e4b13647b40a45c196dad76b1cb39cc6690b9"
+SRCREV = "30339ef6ded308f0147fe80f89b9bca3ace1aef9"
 
 S = "${WORKDIR}/git/open-vm-tools"
 
-- 
2.25.1


