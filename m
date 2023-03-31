Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58936C77B6D
	for <webhook@archiver.kernel.org>; Fri, 31 Mar 2023 09:42:07 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.50605.1680255726264059360
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Mar 2023 02:42:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=345418c051=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32V74FA3002595
	for <openembedded-devel@lists.openembedded.org>; Fri, 31 Mar 2023 09:42:05 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3php647qny-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 31 Mar 2023 09:42:05 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32V9g5CM028210
	for <openembedded-devel@lists.openembedded.org>; Fri, 31 Mar 2023 09:42:05 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2175.outbound.protection.outlook.com [104.47.57.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3php647qnw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 Mar 2023 09:42:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VQ5tpbABpvZ8TsSmthXxUooLU1RcoMv38CXJo1k8cyR0dPwws88hTXcIMt78V7aK6EnR8Nzoi4MyewiDBCunsd5Trztb4dnk+gmorKaWDTSaj7U+MBq08TMj2z7NxjQ+mxS7bEy5rzq8uZz7Zrc7ExffnnGpyu6AOvPRNses1+M5LY83mp76kERjqGO7Q3I+TE3Pvc2FuVYKmuruWmlSTbW7gY96AlOMjQ3tRv3KvRXiFA0XfVv1fO7imtBe/JhcTRW3hdxCx2uKmVqKx7zqsoiTsmw1OIvlcNcLaVpW6DeDLHAqHU4mk3LtWXJYWcxT463G2ZUPWwBeH6BC32v3gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Ywan7MFTYPUJm+GCwpACOJs1QXzekWe/BJC90aVNdo=;
 b=Q5Xk47mDrfIGeYgxTvpfn26Uig09JpMimcZoMrCHhEiHhdDaMT2/XhCZ0hqTwhW0DVhI40+y4W+xTB5l07GeIOREYhVOlY2yvDkICjhkMPgbTzexod6OaLqpUqjF2LBy/fAwxnWoZN7G9Uocu5IavZCUVHZGpv/C5BUiFxesWkfVgRpw9wttVtPPcJjZ3ezDtkjzKK+/AA0+iLMiEdJz6MjDPMhAj+Ma/+2E79krL+zG/5JZF+vxc6tonvUQn+atNkBvwZ+h3zNUH7nxORW8qSwKcyDzjywuFMJdpeNes6i1DmlaDCEvcc8+5EzGfZYRRjKStVTlQUJQo1P6F5dmxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from PH7PR11MB5820.namprd11.prod.outlook.com (2603:10b6:510:133::17)
 by CY5PR11MB6510.namprd11.prod.outlook.com (2603:10b6:930:42::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.23; Fri, 31 Mar
 2023 09:42:02 +0000
Received: from PH7PR11MB5820.namprd11.prod.outlook.com
 ([fe80::e7a3:6c1:4c52:897a]) by PH7PR11MB5820.namprd11.prod.outlook.com
 ([fe80::e7a3:6c1:4c52:897a%6]) with mapi id 15.20.6254.021; Fri, 31 Mar 2023
 09:42:02 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-devel@lists.openembedded.org, raj.khem@gmail.com
Subject: [oe][meta-oe][PATCH v4 0/3] update protobuf package from 3.21.12 to 4.22.2
Date: Fri, 31 Mar 2023 17:41:42 +0800
Message-Id: <20230331094145.2362159-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0044.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::13)
 To PH7PR11MB5820.namprd11.prod.outlook.com (2603:10b6:510:133::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB5820:EE_|CY5PR11MB6510:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bbc03cc-db2f-4b97-4b45-08db31cc2e0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	xaLhHAxsAyzLyPHHxoNpla0dNA70Hd/1XdDZDtQh7/evdeVHAMqkGKcr4w778mtbPAOI5OCM8exQIv5Wr6dej0Ww1Xqc1KT2zBg3O+W9H58o7qHvRtTzAvbt/V5lJEUcGmN2yBis6HVTLbGNyyJ/lnen1cUNYHD1o24gXRzjFUDkb4BOp4TLizY+lW5ubFbFE/S/GLoRYMVOOBv+4lTqSh75+gwW/OjxCZtDaSxyffO9s6P4JYdP3XCL7t5Gh6g/XfivIHh4r+rkhOdF5wW0Ru46QRYY4cZTDa8+rycR8yNSOJnbMubVFItwYbvKjme/eeCLmvFh+aqfVHxZtV9LNRx0Q6DOm8n8QSy3+6r0z0rgDTOnW8mjOgdgEabSf9pww5MA54Mb2NeqtI1BI/YaNk6HkGAX61hsz7ZoSGIGWcR25OlM5aV1fD9S3Kiyypl1Za0LcEuVnzkmstqJu2VqoqKfhJ6coYwjNUkZEFhEbFyLufcsjMbWKw0waTFdJSgbs35UrU8n7GWnGoDf4JTDdjE7XAObuv+nEj5uev/08D/svSIeBFIzUPo3fQ1cPwSwPeX8UUGgcRoyWwx9QagteTOq2Rw3zgaZYny97r21UMs=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB5820.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(366004)(39850400004)(346002)(396003)(451199021)(83380400001)(2616005)(26005)(6486002)(6512007)(6506007)(1076003)(966005)(52116002)(6666004)(478600001)(66476007)(316002)(186003)(83170400001)(66946007)(66556008)(8936002)(8676002)(5660300002)(41300700001)(38350700002)(38100700002)(44832011)(2906002)(15650500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?HqQUstBiOuefneajNiyMugObnk/WXhVBSRPWOLJHcwcvU0fF9fIoYQPOzXEv?=
 =?us-ascii?Q?QZafbemM6bMCVK2MT/sE03VfSKKDSqzoScRBAs9ZK+t8sHCyYQPyckWkPXTs?=
 =?us-ascii?Q?pThkUKnbpiSvW7OnIEX9R3HcAgsMr3uzc+eUgkbNcvcB7UcFza+WmQinWXoW?=
 =?us-ascii?Q?zHc5tPzv5A2s2iW5WBsfQ0yfvLGfRnqFZjxGTDlQuuzdvnRFVfgBODb1zUWr?=
 =?us-ascii?Q?lZayHr/lgdhb6gly6hfPPrZuPynV4t9Yd3y/sR2zwwoKdyJlMjCag/xZx9qe?=
 =?us-ascii?Q?noZemQfMlXt41O90UpWSwej4bN/dSx33lP4kxwYEXNTqlTkVtf8aJlYALA55?=
 =?us-ascii?Q?SQ/nIS77gr+RZV1O2GcMNqSa4X/wLoN0yvG/VyKc5MIClRdpN//ptWqdsy7T?=
 =?us-ascii?Q?y2t5Af6+Iew0AVLzM//YIkKFtKM1ViqMYUlIuqpstn1noRiDhwYdHll6+1Tk?=
 =?us-ascii?Q?KcRuYdPPAwZ1twHij+ZPmWGlQ0NOUcuN7BRnHTfl2MQ2x+hFPfSqtxcRXLt2?=
 =?us-ascii?Q?+EVdOTqIpWVgEDrtrbo6fKnpqat41v1NyDx15pWykbUadYKNPZ/k2F1+zUj5?=
 =?us-ascii?Q?ydhlwODy9EtKUxF8AqrKCojB/2KTTJB2FZLdLrEWyKrcas5kMo5xsAiu8xzU?=
 =?us-ascii?Q?vmBRJP0UQIdcR1HI9xlMGxY0L5xGQ7Dt4HiylnpDj8ljjSvRll5bpP8qIA6S?=
 =?us-ascii?Q?7tRuuDSa4uFIBB2cw29DWRvp+9VBDQuWC2oU8jgxvR7JSIkefl9RsDEkBD+X?=
 =?us-ascii?Q?j5XN4QBFQpt3r9spOtYJkuV/zyRyrVg7kaatyIOW8XoT+RDBuCgJJy7ek7oh?=
 =?us-ascii?Q?G3gFJ8yLGAfIL5B7LVNxY8U09+BFMZk/UrcDUXAjrLEzZWpB7KmzCdfllo83?=
 =?us-ascii?Q?qL5apid5CxTPieJAd+zarpdp9855OSf9fYssKf1lVXyMoIHQp7sBhPpPOuVR?=
 =?us-ascii?Q?kiff+9T+ONaJhZU3skO4NY0dRbT+7XOuJmf6HZB/qL8hkxeHU7iaQT98SYL9?=
 =?us-ascii?Q?gqGxajBzQrHq9xg6KX0MPVSBm81iJurE3iHrosaXtHlaJzh02Nl/2p9ZMfxY?=
 =?us-ascii?Q?ubiYHXQ+eM5a2xAOsdp5sIwQ2EfVLSxvZHfDAlMawxfz9MukUhwJYPhFhJGl?=
 =?us-ascii?Q?TVzLziy2VNjVc2EjHtXs+LbamnK6c2peBbLWnhV2HLw5qFsv+slr4Up5arv/?=
 =?us-ascii?Q?RNF/qaGxPtyDy6lTUcXZxjjw4GSvqJlrsg3eqUzE4GfjgpAAqdsfGaPBPn0l?=
 =?us-ascii?Q?7BGrxr99YzBJY9l6/xb2MZXgNOsfF6g2fpv8ipkzs5ZXwxXDGnXi0nbmWUBm?=
 =?us-ascii?Q?VREfQBdpEAoeqiazoyXtHN2IMDATSiqNPghZj9TtO5QKtkOW6xLRibMiTh5N?=
 =?us-ascii?Q?gAC24YCZ3ZrqL93FL36TVMWZjn7xgzsjwi9DjwRb2Z85ZN4wuResVc1iBqzr?=
 =?us-ascii?Q?0H6jNKrWanfzXRoPJy9/pT4Vi5mq5MynonheKNfcOl4FPT5xQigPYgXkr6kg?=
 =?us-ascii?Q?Im53wZHjAHukbJim0q62z6JYeVkdQETGOsN7Rc5Dy9+9tRZbYVFO499VDe0S?=
 =?us-ascii?Q?yl3jeu8JL62VZGab4flGYUU8AZBZ3VWOvQxXS0F5FThjQlb/FlVxgElodxCd?=
 =?us-ascii?Q?Zg=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bbc03cc-db2f-4b97-4b45-08db31cc2e0d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB5820.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2023 09:42:02.1036
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sJEoAMVmzsG5HZttwOnPEcqPmkvp97wbbxtWWbGMWDHcYuT3OdeEs66yZiDtI3LlOF2b271X65MLLZv3QV+c07ejEsHIt0dYrlLGDdesoM8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6510
X-Proofpoint-ORIG-GUID: ZlV74G9LN_9Qmz72Roz9g6e4p3ISSe1U
X-Proofpoint-GUID: lK96kEt4HUCFX0mD8pJjTwGV2tLQ8Sji
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-31_04,2023-03-30_04,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 phishscore=0 spamscore=0 bulkscore=0 mlxlogscore=999 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 mlxscore=0 adultscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2303310078
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 Mar 2023 09:42:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101848

From: Xiangyu Chen <xiangyu.chen@windriver.com>

The series patches are upgrading protobuf package to latest version and add support which is 
depending protobuf package.

Changes:
v3->v4:
1. fix build failure under qemuarm
2. fix protobuf-c-native build failure

Tested compiling protobuf/protobuf-native on qemuarm(clang) and x86-64(gcc)
Tested compiling protobuf-c/protobuf-c-native on qemuarm(clang) and x86-64(gcc)
Tested compiling mosh on qemuarm(clang) and x86-64(gcc)

##### log of building qemuarm with clang (protobuf-c-native/protobuf failed before):

poky/build-upstream$ bitbake protobuf protobuf-native protobuf-c protobuf-c-native mosh 
/usr/lib/python3/dist-packages/html5lib/_trie/_base.py:3: DeprecationWarning: Using or importing the ABCs from 'collections' instead of from 'collections.abc' is deprecated since Python 3.3, and in 3.9 it will stop working
  from collections import Mapping
NOTE: Reconnecting to bitbake server...
Loading cache: 100% |######################################################################################################################################################################| Time: 0:00:00
Loaded 3049 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.3.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-51c56c35dcbdf990c764f62babdb303568d7c879"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "master:51c56c35dcbdf990c764f62babdb303568d7c879"
meta-oe              = "master-dev:a06ee7ad9f58f055cdd08e3807e36e0c21b302d1"
meta-clang           = "HEAD:371097cdaa0175119a6710390d11a4e967188968"

Initialising tasks: 100% |#################################################################################################################################################################| Time: 0:00:01
Sstate summary: Wanted 27 Local 0 Mirrors 0 Missed 27 Current 312 (0% match, 92% complete)
NOTE: Executing Tasks
WARNING: mosh-1.4.0-r0 do_fetch: Failed to fetch URL http://mosh.mit.edu/mosh-1.4.0.tar.gz, attempting MIRRORS if available
WARNING: protobuf-4.22.2-r0 do_fetch: Failed to fetch URL gitsm://github.com/protocolbuffers/protobuf.git;branch=22.x;protocol=https, attempting MIRRORS if available
WARNING: protobuf-c-1.4.1-r0 do_fetch: Failed to fetch URL git://github.com/protobuf-c/protobuf-c.git;branch=master;protocol=https, attempting MIRRORS if available
NOTE: Tasks Summary: Attempted 1254 tasks of which 1182 didn't need to be rerun and all succeeded.

Summary: There were 3 WARNING messages.

#### end of log

v2->v3:
1. fix mosh compile failure
2. fix protobuf-c compile failure under clang

protobuf,protobuf-c and mosh tested under both clang and gcc mode.


v1->v2:
The v2[1] patch for upgrading protobuf from 3.21.12 to 4.22.2.
After upgrading the protobuf, the package protobuf-c cannot compile anymore[2] due to the latest version
protobuf is using c++14 and some of API name has been changed, so use another patch to add support of
protobuf latest version in protobuf-c.


Ref:
[1] v1 thread please refer to https://lists.openembedded.org/g/openembedded-devel/message/101784
[2] https://errors.yoctoproject.org/Errors/Details/698756/


Xiangyu Chen (3):
  protobuf: upgrade 3.21.12 -> 4.22.2
  protobuf-c: add support of protobuf 4.22.x
  mosh: add support of protobuf 4.22.x

 ...re.ac-add-support-of-protobuf-4.22.x.patch |  63 ++++
 .../recipes-connectivity/mosh/mosh_1.4.0.bb   |   7 +-
 ...ot-compile-the-code-which-was-genera.patch | 147 ++++++++
 .../0001-add-support-of-protobuf-4.22.x.patch | 315 ++++++++++++++++++
 .../protobuf/protobuf-c_1.4.1.bb              |   6 +-
 ...e-respect-CXX-LDFLAGS-variables-fix-.patch |  15 +-
 ...protobuf_3.21.12.bb => protobuf_4.22.2.bb} |  11 +-
 7 files changed, 552 insertions(+), 12 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/mosh/mosh/0001-configure.ac-add-support-of-protobuf-4.22.x.patch
 create mode 100644 meta-oe/recipes-devtools/protobuf/protobuf-c/0001-Makefile.am-do-not-compile-the-code-which-was-genera.patch
 create mode 100644 meta-oe/recipes-devtools/protobuf/protobuf-c/0001-add-support-of-protobuf-4.22.x.patch
 rename meta-oe/recipes-devtools/protobuf/{protobuf_3.21.12.bb => protobuf_4.22.2.bb} (86%)

-- 
2.34.1


