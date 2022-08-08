Return-Path: <ranjitsinh.rathod@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC149C00140
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 14:10:08 +0000 (UTC)
Received: from IND01-BMX-obe.outbound.protection.outlook.com
 (IND01-BMX-obe.outbound.protection.outlook.com [40.107.239.86])
 by mx.groups.io with SMTP id smtpd.web12.26055.1659967800505477410
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Aug 2022 07:10:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=we+L9dLx;
 spf=pass (domain: kpit.com, ip: 40.107.239.86,
 mailfrom: ranjitsinh.rathod@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aaWdy+ldA2wYV8muCSYMJhPzO4VYA3q15px5X5hrJD32vjY885BgWcYPhe4vAa2Ye3GUNJg+K5DmkQj9BPHT1q30bjy99NhXqfjeEPCqdoFL9mMOwwmIWw22MUBlXOFH19ZHFuo4cMxG+s2o2dbBNGwzaztfnEkoNydUNYuDurg0bPAEKmtWk6gsqJQyBaHXh9wxINUNH5eDWnH1BAaY3jlqi92lFzUhAFmLq96bQ+Y+qHVLuGHhWG3UvyaqjBLYRJjTdKOMaZ/OHZ5+G6ILMAgSe74fOQusbUiqY1Yx/ECzjlWrdTHH/mCzReis0yr6MNZZi7xqfaETf0zMD3wYCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XqHah/jFJd9DAy6O+ZSwb2SauzC6kIEoZQRuEzjPpbo=;
 b=g/pEUxp5MahIQFtWu9stuAyddGush7SSZ6SvaXB3ksBO112qxXIrWwjNHRqP1+LIsxLU4F5QgNSybCVs7vF0+L+TDVF5tWGrg/etvQ49MBKzjT5AFQN7gbZ5q05T60kMFg/m+dCp3pzy2KiWHY+SoEVg4ICbx6csw/qvxuKCI3mCPvp0f07WS0aF4/HKtuXbX/lAUbOZLXcSuzLcJ1MQNJAVKNzuzuAdzgIjCRtSjA4cSZvqyw+rdYLnolIdZIfxBpS3T8qGv7dzltqlOW0Z/XRlg8Sg2RiOiSDn8+X8CmnvF0LgC4UL7VuwcawuXkJrXK5AafZVDTO8/V42rlfr7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XqHah/jFJd9DAy6O+ZSwb2SauzC6kIEoZQRuEzjPpbo=;
 b=we+L9dLxBLjOXq9+8yjyGu4Ze88Za7F33d1UEzpEghmlzPGuK0hH63eBgVm9N73fLdtLl2N6couFAum4HPHnIgCe1xVy1EGO1FZdFEtpecZymN6Op7u+MiBEEchlMUnGkUrvzyXSNvDyq8lV0dwK4ranKGOWmqeJ6zYtuspoz3M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kpit.com;
Received: from PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:8d::14)
 by MA0PR01MB7867.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:2a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.15; Mon, 8 Aug
 2022 14:09:55 +0000
Received: from PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::6986:8621:f6e5:e4ed]) by PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::6986:8621:f6e5:e4ed%4]) with mapi id 15.20.5504.020; Mon, 8 Aug 2022
 14:09:54 +0000
From: Ranjitsinh Rathod <ranjitsinhr@kpit.com>
To: openembedded-devel@lists.openembedded.org
Cc: akuster808@gmail.com,
	wangmy <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>,
	Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
Subject: [PATCH 3/5] c-ares: upgrade 1.17.1 -> 1.17.2
Date: Mon,  8 Aug 2022 19:39:30 +0530
Message-Id: <20220808140933.25968-4-ranjitsinhr@kpit.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220808140933.25968-1-ranjitsinhr@kpit.com>
References: <20220808140933.25968-1-ranjitsinhr@kpit.com>
Content-Type: text/plain
X-ClientProxiedBy: PN0PR01CA0020.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4e::8) To PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:8d::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 388112c3-20fe-438d-9457-08da7947aafc
X-MS-TrafficTypeDiagnostic: MA0PR01MB7867:EE_
Content-Transfer-Encoding: quoted-printable
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	FzFuh1EQYJ4Q5zn2wERz0XHIURndgPPNRKyOL/SiMOghjouTto6IQnPhbAzgVXYyL2Cyv0t2kK9P9HGVXetuDuId3GPhLnrjfKeRxBFhsstzLOtTtenz8LU0QNdIZm58TbrIL6gwP8xr+2bQdCUGDfBsfZmiaXqJDYQfG1+flScFVxxIobPT2sg7Z6mmdkJpE2NHZutP7qJqu64kcjam1kKBY+Z9GGMoQ3w6GyqC29W2BaZ403YMSY94ojkJL/isLp9JqC6qn4Wb+sF9N/Iv6gRWrg/S7ypA7uvJRbbHbBcahWAzIRhGiEH2aXSgvYZOnhharcKYEGnvsam5yuU05msanRFopy9KT58asb9WsjvnwfAgqX7afsdo9oNUX2bmFL8Xr5HA8GEMPNa96M/UO6modTqgw+szJAGoaNbKIswtwNZ4RPhpj2xDvNGbp3yjDMpvWKAQE1L0p1d1iLjNI76SLGGS2ue13ZnznRSP7b7QTrKEInsl05jpETczL5LYVCxMNOA2XLWvE8AF8i3VKiEzLANj9mZ+1eNElinD/VKnc6IYKsumu3C6C+mR76nXqwY5PwD2nsFI2FyvZIe7/cS1npdGmcpj1fTIJqW4aUAAZnq7NgG55xk75U7FO58hC5LAhA5p6Z3oHZDYwSsLI1CUZDWvTvQ9eqOh86MsAOvZMnjVsucxiYaITySRDM2b2Y5gWEnoCZdlHy1oAhQ5Th9asr1dXQOJlhAPtZsYEsHD6PoTBEAyTdpQFhPOg8/JqPK3gM2fWGtazPmRgAW9ttX889wtkd9vpnpECvB9tllUwATL+8nsI1mjUn6qK8m0
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(396003)(366004)(39860400002)(376002)(346002)(41300700001)(6512007)(6506007)(26005)(6666004)(38350700002)(52116002)(38100700002)(1076003)(83380400001)(66574015)(2616005)(186003)(8936002)(5660300002)(66476007)(66556008)(66946007)(2906002)(8676002)(4326008)(316002)(6916009)(54906003)(6486002)(36756003)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?TCFgnWPzmN44rmlv7o2g7V+uBukCb+5/Zv1Q++ECT6UIDfCT6curzcGi6TTp?=
 =?us-ascii?Q?IUif9tA1nyvb2yCwnSoZgV7Xv4wD0wGd2dOagoL3Gn9Hdex0xqEw9qOMOi7V?=
 =?us-ascii?Q?OGyZJJWTAIWQwcyZWOkQVMeRJtq5MmUUjRZaUVbCf5z8cnRJf1RfdWgVzVAu?=
 =?us-ascii?Q?5jY2qFwyO/GGkM0LeFVZL6MZ6uoQa0zrO4Lxl7MKElfX3qKIqz2RGVsEUIlk?=
 =?us-ascii?Q?LXO9X93IDBFmydDkcD10/CztwtY6qqO58w7tk/7OMLxVsnM67SDCpoATLgqe?=
 =?us-ascii?Q?O9fCM8mWJcKSAb5lPXglgJbx7CuG2xGHGqN0RQAuxKeNBiWq5quLTL9UWTVy?=
 =?us-ascii?Q?urkO6D2TpI3SzMV1o/RWhvQDHgsV8OMQfnsQK+urGAyaaxEAc/ydbPdpCibB?=
 =?us-ascii?Q?OgypAcPfCT2zLEp9dhimG2pjBOjH6s/o6oRLJ7ClnH0beLPnfR7RTgf+QCxb?=
 =?us-ascii?Q?eWMXl1GqOIWi9zO+jDb8vfGBPbZsEtRNb9aEGyJxWYpALEJrCL5cVU+YV7bd?=
 =?us-ascii?Q?VVk3TqPbrbqDJVyfBP0MrQcrJHv7Or+feoT0Js6DGCqMt/n4gGshZn0FVYqM?=
 =?us-ascii?Q?6cD7/pfIAPB6biz5EbPPtBQj6C7sgydONuMPsUrWip6SGpJpFvDHmQzeiRwe?=
 =?us-ascii?Q?QuzfrxFn0ptjzo3aHw0DPdyEG0Yh2BOnd7xImum2w+LpCp71owlOjsjzVPbT?=
 =?us-ascii?Q?CKhsCFrnNhyUWzGQ8DjWhGdXWXtcMmrS6VGKHONb7tRbbdin6SYPud5MXF3l?=
 =?us-ascii?Q?0mxsi7Jegpk05Rib+Xa0VSLYmuG8QJkFA5vBjAJ+v6H01zdJ6zFkj9xQ4jeC?=
 =?us-ascii?Q?fMuyDexhr3gWC9pPWKDcXlorLeqv1vqc3nv25aTVUg9KYqyZlxl1H+YJBCOA?=
 =?us-ascii?Q?TUi4frKXm2VzVGmUeRA3Selqg1XuM1jOsT6QJcYz6GDxKWBLPwl6/ILMXZde?=
 =?us-ascii?Q?Sz9xDnUw6OFy7y3K/V+41lbgB4WR0EhAvicf8I9+crKGAQoS1KMPTEAQqxwe?=
 =?us-ascii?Q?lmtbVt2E6lbrFIhY7sHICmjTd9ve780PPQAUWuK6jdlzVJt14OIaiXVvoVb8?=
 =?us-ascii?Q?Em7K+fb8nIBTEARpACwL5KuBW2lFBUjG6C4OBKkpHsUHBHokD7W9SEkzt4ZR?=
 =?us-ascii?Q?eIPD3UopiPeafT9yDYHG6cNYOGsQq0cXCNagfyi7P0NbW3tL1ZDhLxBYt6TM?=
 =?us-ascii?Q?iQ6LeyW64KoPKN/bMq2dqVizJy5iQUU25GAy6knk8IITGRatPnkAfwWr9HBa?=
 =?us-ascii?Q?anbtCgGQSTROjf0Bj1Dq4IdnKGekqBkIgfD7Ovn86ZyuQMb2KqQ35Vt+vzLF?=
 =?us-ascii?Q?6cTSO0WwAzmvW4jyilKkha6syUp9ueqnfjuQlEfe1KUxm5DtZGkKQ6Zr/tnw?=
 =?us-ascii?Q?JWvrCsVaRyIOkNX6294QNgtyr27L/ue0xzz++Y2LhK/Pw1J3BcSyh/SciczS?=
 =?us-ascii?Q?TQiJ4vAd9NfoszCfbPAHmPUuknSZ2zjuZHS2sY3VS5AlNEc/PuWCKv5lmEbM?=
 =?us-ascii?Q?Tw2B3CZ4XPYzj7dyToXcLFx5pG5tU4Wyl2qrQTb3zF4ZfsurIdJ+dvsiYVrr?=
 =?us-ascii?Q?IxfeRVU0b5ydJXWNYU6k5aCR7NmbJQ6eovaXNojDwB5AdAa2kpUdQhLMZSWL?=
 =?us-ascii?Q?VA=3D=3D?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 388112c3-20fe-438d-9457-08da7947aafc
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2022 14:09:54.6071
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 UPkMeX7mZEWlthEln9mke4Gu5Y448dA6m0L3fB2w3gErLQWEWgggm3ZdEj4iIdpluh6+nfIv/VT6yvW+PCWNuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB7867
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Aug 2022 14:10:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98154

From: wangmy <wangmy@fujitsu.com>

Conflicts:
meta-oe/recipes-support/c-ares/c-ares_1.17.2.bb

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit c49173b09c998bb3893ae873f68823647f1a7e18)
Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Signed-off-by: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
---
 .../c-ares/{c-ares_1.17.1.bb =3D> c-ares_1.17.2.bb}   | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)
 rename meta-oe/recipes-support/c-ares/{c-ares_1.17.1.bb =3D> c-ares_1.17.2=
.bb} (63%)

diff --git a/meta-oe/recipes-support/c-ares/c-ares_1.17.1.bb b/meta-oe/reci=
pes-support/c-ares/c-ares_1.17.2.bb
similarity index 63%
rename from meta-oe/recipes-support/c-ares/c-ares_1.17.1.bb
rename to meta-oe/recipes-support/c-ares/c-ares_1.17.2.bb
index de27d736ad..19e35db2d7 100644
--- a/meta-oe/recipes-support/c-ares/c-ares_1.17.1.bb
+++ b/meta-oe/recipes-support/c-ares/c-ares_1.17.2.bb
@@ -5,14 +5,11 @@ SECTION =3D "libs"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3Dfb997454c8d62aa6a47f07a8cd48=
b006"

-PV =3D "1.17.1"
-
-SRC_URI =3D "\
-    git://github.com/c-ares/c-ares.git;branch=3Dmain;protocol=3Dhttps \
-    file://cmake-install-libcares.pc.patch \
-    file://0001-fix-configure-error-mv-libcares.pc.cmakein-to-libcar.patch=
 \
-"
-SRCREV =3D "39c73b503d9ef70a58ad1f4a4643f15b01407c66"
+SRC_URI =3D "git://github.com/c-ares/c-ares.git;branch=3Dmain;protocol=3Dh=
ttps \
+           file://cmake-install-libcares.pc.patch \
+           file://0001-fix-configure-error-mv-libcares.pc.cmakein-to-libca=
r.patch \
+           "
+SRCREV =3D "6654436a307a5a686b008c1d4c93b0085da6e6d8"

 UPSTREAM_CHECK_GITTAGREGEX =3D "cares-(?P<pver>\d+_(\d_?)+)"

--
2.17.1

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

