Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4D66C43334
	for <webhook@archiver.kernel.org>; Wed,  6 Jul 2022 03:52:50 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.2241.1657079569570114348
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Jul 2022 20:52:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=H1wfZPab;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=4186396729=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 2663oOx2028403
	for <openembedded-devel@lists.openembedded.org>; Wed, 6 Jul 2022 03:52:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=I4e5/VdHqR0oel1rti3kHM3Ky2S4pe0KWrRx95FuD04=;
 b=H1wfZPabPxyhIIrOEJmID8TuaGeEvOPP2aGidgKJffMpjQGkbZrkayiKH+BjUKWPrbJj
 OTTgZDVT97ERvbzjxw30WS2KCQ8v9wRaVpkEAMgczrRv16Q4kg8rSvH3MgtY2T6jZViX
 u2f+Tt4a8uuuleOdknlpwL955XYrqCvGqnhXYHPWRHfKiYkBeqkKeqOEMRQLgob6M5jn
 yVKnhlAnZSCWNccZnbfKvzeqiGn9ulXUFMzMXv/nZOeb6LJvTnkt4U3VDRtWF9+F2MUN
 X1H+hTShzzxw6S0kMfAtZknjwR7Nq/kOHoXNk1eH6m4MpDqF6DC6M8yJGveu9EIOdz7x dw==
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3h4ug7g859-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Jul 2022 03:52:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TDaFBhT/dO7T9C3XPdQxme2mI+A5++XItyudhbh2v8v+tyUbJjQJCtd8/PEVd4+ttF3uTarwsUz4Uu+0iOMWVbM1pmpkDO1pC7bJdzmqSSBNRnRUCURgYg6T3rPM+Q1ryf4NYEBnCLIetPFuPvt3D4UKGFyQKzYfM0vPFedjoCIZNXtVtACOTJzHCkc2m+M2Mzjs4QFsz1P39HG9tE5/KXt1saVQconLDNNtYwRCK5pE4QULaJGkw72yFNQTeUwuS0pxOF6vzkU3f2w3S2ZpiuPKLGTVWK0JArWAXqSv4P0cjmwKCXmIn1+f8Amfricyi6S3Js3FdUuJHcl4Cj8vkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I4e5/VdHqR0oel1rti3kHM3Ky2S4pe0KWrRx95FuD04=;
 b=LIGG/SF0zyYDNonTNw9N7M3/eQ6/I7pal8CQ06dCuXjRzi5/ozX/NZznNBVVePstVQnNHmZrtO5JHhZeYXyw0j0P4q+tsuomrMSEzudO1UXSMoHvWOpDRKPTgR7XOkT6duIw1eSnn+idR6YuJTqFpjqOXJehTDbKYshXtrWkPldWXTEv/3AvtYaJczdnFibi/VRy9qwuia6w5dxJY8XI5h8m5G7aBLIh+0r7jabj415vvYafqMBur+jnTSiA0EhC640LbS/IhyuJdUMEZhgLaITFt6Yihs7vEaxjwYIALp5ruzhM7e4SlBYMdA+Kn5m9eVWUVCyk/5V46kbb8xpUPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CY4PR11MB1974.namprd11.prod.outlook.com (2603:10b6:903:126::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.17; Wed, 6 Jul
 2022 03:52:45 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::c4dc:c0e7:a0f2:7a0f]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::c4dc:c0e7:a0f2:7a0f%6]) with mapi id 15.20.5395.022; Wed, 6 Jul 2022
 03:52:44 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-filesystems][kirkstone][PATCH] ntfs-3g-ntfsprogs: upgrade
 to 2022.5.17
Date: Tue,  5 Jul 2022 20:52:33 -0700
Message-Id: <20220706035233.72938-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.37.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR03CA0022.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::32) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 86b49eca-b54c-431d-ce34-08da5f02fb8d
X-MS-TrafficTypeDiagnostic: CY4PR11MB1974:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5Xjk95MxsIVULhdhebKqKGrbZ5aTmZbMLG0H31prTjij871pAlroiWFZN2cOOG0utiFkU049T4VPPAOntIMuKAij1jTamwmnSLv5ge8XLpaPgKVvIjjG/qTs53P7MHQwL3HFZqTPdqnuIsU9TgdaVAGLQ0RryOpxXdLvxG0e9rdznCcAAuAua7M7EVngCvIR9sYPceyANeunRJNaMxihWWMGZXZf1UA9IrO46bxydZhrA5Ajf0lWBMTyyfkTAvV/MXK75CARlPr4tHwqFqeP97Yf6t1uAK+LWqufiWGy9780Y0285EIIjXQ2MoltNBRWUnQnOhoad01Vwlvm9d9OU1Yosc3z3GZeJ5x96nDF4heofgZZu9eDCdI52vw/yxhu+2But6xFUsMTHAyJbd+nXp2UZ/2yb/14xRZlSwe5y5Sas1O+LtDxOek5Kg+1jWbqrSVkk7VSyJKEqinIh8I23niE3R0wC9GLHwAlHZTN9YNnSyu0NpCL7gQovqfmBNGQAwRV3rX5TCYcn2ddkApagfK/WsPmG26In9uDTJx6608tcvI/0Z+0aAMkMLf9QS4lXdWGaG2puDYVsywZlmbDJkIgPk+c93ilBJoi/L7hGM99GKm0/pgBuGcoslATeC/4hngL1L3QBbBdPxdwBd5fiL3Y/Mk9JQHP0hDm8mRaXC1LhhZD3YScTHhkJwHITkfBBPNT6wwt698HD2DrMtBOFQAfZFAqICo6PDWxNhUePuux9jfCkpyHMfTglV0YxzfLtVzs8Fl6UqqhZgDCmAsGeDatA5wyl/VyhZCmhL2nlyq9nWOt4eyftshtAWWunYONlzEGccohZqAEf9h0MyX9nQDA49TU8/wp7bp1awsiH403pha/dwhvZ/9JUQnxUpmf
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(346002)(136003)(39850400004)(396003)(376002)(6916009)(966005)(6486002)(26005)(6512007)(186003)(36756003)(316002)(66946007)(83380400001)(1076003)(86362001)(2616005)(5660300002)(38350700002)(2906002)(52116002)(478600001)(8936002)(6506007)(66556008)(38100700002)(8676002)(66476007)(6666004)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?C3NFVFMpuMWxTINhttIC7On3LGz58el9k3SpeUSKEwRbmUzmuZ3cA6ABJq5c?=
 =?us-ascii?Q?2Uofi+mwVVt+/+o0k6+ka/cKJNBnnYHVQQZhmkM8LZtE/OfYS6b01VaOnSRi?=
 =?us-ascii?Q?OaE6raYCh3iiued2WAohJQ6S7fBfcJHAhCW4LH2pgwn33Q7Ivdji93WSsek9?=
 =?us-ascii?Q?UYJOvcZRoxwdgsuT+V99c0sayS33eItPRaA64HeYd/F+Oqby9BnIU0261Dpf?=
 =?us-ascii?Q?Au3d+4hxiFpoFeknFWCcsmWbpsRZXkGECHpWNy4FwNz2WeBsTbbY1BSasNK1?=
 =?us-ascii?Q?YneCMBJiaVDNrFk5sA60X34GF1opj7yXvBqhWrl7b3CeRSr9PFaoAgMw9TFt?=
 =?us-ascii?Q?v1RhnIHWIDQiVk7jORG9T0TeGFAPwTxxbtkIy9dV3xwb/E+Q5xQ3lWd/iiXo?=
 =?us-ascii?Q?bwyBlvIoPUo0NJ3KNCwZdfEA8hKSg88FxgnCVh2SVF9Fu8wakZvx6uGLwcwb?=
 =?us-ascii?Q?wVDaGNf7uRWSCVcYExnql5aW4bIw6kyleaBIMAWLq/pr35wMIA3G1udP3Yul?=
 =?us-ascii?Q?9Waqvw4UDhSiTYiQAGqnwcdtaCLvbeFu7JONWdsURBQV0B7H+TJm6XIyP3DF?=
 =?us-ascii?Q?NJWMrJPHyZge0IfypRDUmGyL7BuEpAsWgbJa8pFqTAjz7NAy1sJp6c1924ta?=
 =?us-ascii?Q?RyiP/Y0BgAQj81ceOwiN3FAGb0uimsuLM0Z5qHXvBrVE9wLYLnthWGhq9n4y?=
 =?us-ascii?Q?yl2ucX+KxvTbU+qJt6X83uLIWnYkZRhd/74Wq8W7ibiRlGGsDkshaAn1axss?=
 =?us-ascii?Q?xZIJUVVMWIKvYWo+DT6GPn9F+4JnSxjBRxj9KEXyTAFzzhwdWbFz2zLBRhul?=
 =?us-ascii?Q?97C2fkyVfCvk5lnr1i+znxFM0inQ0XAx8BqXUgc9aPKSAS30iDkP7LCNvM8Q?=
 =?us-ascii?Q?Uv1O2N5L3yuveN9L1CfpFg27eysP3I/E7WrUYSCVJcyNW7SXN5bmavQUxeFK?=
 =?us-ascii?Q?sNc1Qeht9pWCJgL094uy68UZrPI2p/uEHTnCOv5Jz1xdsTqPDSosQ720sMYc?=
 =?us-ascii?Q?x+GRisL+MorGUyqMKO3SJYZJxlytE9lL6puW/aW7evjshSaX/NzBqxv99uE/?=
 =?us-ascii?Q?0SKGTgc+PmZAtqxDv928ftSCGhph1whDFHvuy+uunYF+KZ86WaC37s+uehKv?=
 =?us-ascii?Q?RKhE2t/l1MmaA38eygZQKUcgkZSoWd4PANGS4qWzvXzjJa7MOEpWzKlWN/ds?=
 =?us-ascii?Q?E9QCEvOSPmpSYnm1a+/DmsfP0KYeoP40tqB4F+bb0ruxt9eb1lYfjHJsu7Ul?=
 =?us-ascii?Q?2r0siQ8ehBAf6elnFKrQy0RQnV1xqAs+XCdPj/rNzwZZ7omHG56yvDUd82v/?=
 =?us-ascii?Q?7kgtYH+iO9o32tV0/vWoTCnzrLiiM41KTqSAKHoVoxgfwmopM7bL8sPzYrZk?=
 =?us-ascii?Q?rFu988ejyc/ZEHY5T4IB6WBjdouA2Ziy26bFk50k2yoKM5AyqFDh9gKH9bBn?=
 =?us-ascii?Q?iLvVcPncDhfP4awUVHm99h53QKJKZt8s8so3Tn0XdkbUoSnDN/pQmLanVFuV?=
 =?us-ascii?Q?fHNV6nBgkgMa1Hq3uFMS+lXwP1sKN2udYHTxMvZfmy7TPDb9GfOY/NffL9Ps?=
 =?us-ascii?Q?eogM0mzXm+4rYk8fuSjjMNbHv9q+Ed6Q/qaRRWeT?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 86b49eca-b54c-431d-ce34-08da5f02fb8d
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 03:52:44.2387
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 YlXZNrhgreLAcfNUu4B3HVc5+wBXbSQ72sAM7z0kFqJxGh/l4j/dQHDLr8CTsnq7XY+BJ26sxQhBOAJ37taSmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1974
X-Proofpoint-GUID: 8kfBoc115ZB1M_qYgZHfLpc5RnXNhqGV
X-Proofpoint-ORIG-GUID: 8kfBoc115ZB1M_qYgZHfLpc5RnXNhqGV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-06_02,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 mlxscore=0
 mlxlogscore=738 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207060014
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Jul 2022 03:52:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97719

Upgrade from 2021.8.22 to 2022.5.17.
This upgrade mainly include CVE fixes.

According to https://github.com/tuxera/ntfs-3g/releases:
"""
Changelog:
* Improved defence against maliciously tampered NTFS partitions
* Improved defence against improper use of options
* Updated the documentation
"""

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...g-ntfsprogs_2021.8.22.bb => ntfs-3g-ntfsprogs_2022.5.17.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/{ntfs-3g-ntfsprogs_2021.8.22.bb => ntfs-3g-ntfsprogs_2022.5.17.bb} (92%)

diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2021.8.22.bb b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.5.17.bb
similarity index 92%
rename from meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2021.8.22.bb
rename to meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.5.17.bb
index aa1b4c2e9..59576b6ef 100644
--- a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2021.8.22.bb
+++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.5.17.bb
@@ -10,8 +10,7 @@ SRC_URI = "http://tuxera.com/opensource/ntfs-3g_ntfsprogs-${PV}.tgz \
            file://0001-libntfs-3g-Makefile.am-fix-install-failed-while-host.patch \
 "
 S = "${WORKDIR}/ntfs-3g_ntfsprogs-${PV}"
-SRC_URI[md5sum] = "90da343e78877d388eb34cefae6799ae"
-SRC_URI[sha256sum] = "55b883aa05d94b2ec746ef3966cb41e66bed6db99f22ddd41d1b8b94bb202efb"
+SRC_URI[sha256sum] = "0489fbb6972581e1b417ab578d543f6ae522e7fa648c3c9b49c789510fd5eb93"
 
 UPSTREAM_CHECK_URI = "https://www.tuxera.com/community/open-source-ntfs-3g/"
 UPSTREAM_CHECK_REGEX = "ntfs-3g_ntfsprogs-(?P<pver>\d+(\.\d+)+)\.tgz"
-- 
2.37.0


