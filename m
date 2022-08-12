Return-Path: <akash.hadke@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD238C282E7
	for <webhook@archiver.kernel.org>; Fri, 12 Aug 2022 07:52:44 +0000 (UTC)
Received: from IND01-BMX-obe.outbound.protection.outlook.com
 (IND01-BMX-obe.outbound.protection.outlook.com [40.107.239.52])
 by mx.groups.io with SMTP id smtpd.web09.8335.1660290761287076859
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Aug 2022 00:52:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=fQnQFono;
 spf=pass (domain: kpit.com, ip: 40.107.239.52,
 mailfrom: akash.hadke@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cnvmdkxqpGlMCzIompS804zHqmmi1tvuOET59Li/s5TQOCaYgsEeITNg76nL4KEsOi/xDYjCEJukDbbxB4h9LQnDrCvzMyafTQxHe2kTZR61XfoVpKSiAqzbGF1X0tW5bBEZUadUqjrqUZfqxwgpijuWgZ3SG3jIOhO94TTpHIaP82EOVzlNwcGVYRWklsU+ZK8B3hPFj6gwY64g1O0IGAUycCPdUSe3g4z6U/QDQ31EscH4TA7DaYXgNjipNCSXCZW5qEKcLjUqHHGmi7WY2P9SPF7NDk8Sqt7ntMl4xQ2nKurp/bZplisYgUrzMTwHsvLO26xck2hnp08ADZJFng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zhVV1jZj552/LjVwv1BB47MW1PFYh7Rhg7hocqSOrmY=;
 b=FSE9LypfMkm5NCBAG0Br1DWxXn/8OBdMWYRgmYShqctLlfxGOiIpQzvbRpuTPEhc1X+t3O8xIuk3m9qOyv4afiA0xlf/qI4WClCcGLh680w0ap7lIXqX1R7fkeggNKkoeBrMVBIVuPtv+eUQZr8b/C2uptO1nYQV7iZHEX9/ecIqs/F9X8MbOLJgOgQog4s3VkWD+KkZi1uwOe+xT/H87PiKzrjnCobeA8rg2A+64dD8Nn4Wv7pnaVSlQqL8821gsF/suGX4lF40i68B4WmmelIjoCIEYm86AiOnRuDu9mRg+NKHiFjmFAy0H9OBR8m6Efyx0dKoxNepcz4FOH0jrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zhVV1jZj552/LjVwv1BB47MW1PFYh7Rhg7hocqSOrmY=;
 b=fQnQFonozm3Obpho6qeQcIDp0TDo8RYu29+Vl7RisrmdAIIxwwzrE/mxZYcnQrA69wF7wPOSQaFPbtXsu7fGJcYE5gIQH6KrihzpVp7075fi5nd/pLyE7LyKv/TIRnV+R+NW6xFHRE9IF6DAehIojmFbl4xZkL7y1sJEW8tdbRw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kpit.com;
Received: from PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:89::13)
 by PNZPR01MB8490.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:5f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Fri, 12 Aug
 2022 07:52:36 +0000
Received: from PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5d77:6438:def1:ac50]) by PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5d77:6438:def1:ac50%5]) with mapi id 15.20.5504.025; Fri, 12 Aug 2022
 07:52:36 +0000
From: Akash Hadke <akash.hadke@kpit.com>
To: openembedded-devel@lists.openembedded.org
Cc: wangmy <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Subject: [oe][meta-oe][dunfell][PATCH 3/5] c-ares: upgrade 1.17.1 -> 1.17.2
Date: Fri, 12 Aug 2022 09:51:34 +0200
Message-Id: <20220812075136.31326-3-akash.hadke@kpit.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220812075136.31326-1-akash.hadke@kpit.com>
References: <20220812075136.31326-1-akash.hadke@kpit.com>
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0079.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::19) To PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:89::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dd87dd68-4a7f-4f9f-b12e-08da7c379efc
X-MS-TrafficTypeDiagnostic: PNZPR01MB8490:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9APEJhBf5aWgczyWJuB+sIWCtqdgENzdtWrcpvXKEkXFFyoDtnWf6rD1OAPurlKhVRByzxBNlY+VGkcYo1zj1Tmu4r5WOjMS4pH2mCd3heb8G+vf0J225JtOgQJso0UmDTka1qp/uGe1pTtyd6L+nDuF7DwtJMQ3UcHnoWui+slIkfnD3Ny0Z3a9kwm0M79gJvvp6C9tny/cL2WXTekMZWBG9g0yBUNFtz4gYR+Lb3+3pAz2K+jCrmIJ/bNWP6jgRSvPyPZvwmoD74/aCoVLBFC69Pl6fxWDjb80vMSxVCoSc7W3uE1/skmplyEUPZOMPe10Vfwj6e5cvMgJUJVpkywuXYN/ehp7JroBV3UW4z8JOfRWaldMEtC7tih7hm7AhQSSmXwWESB9BrjbpYebowxYA+tCdcC7IHuAYu8E01spXiZu6YQweTc4JTa5fnBVTSV5Q4n30djf0cR3gM3Eje3db7nc31ZPZyNfDQmkYWIl76FR6Rjh4Fa3vGE5f7Kw4oTx9dgzOerhSwIGclpRCpUC0EoTDrO+zyrNLwue8mkc2ZhTf5du4+M06XawyWJukmbXUVm7aaftcU1QXqt/m32MafPC8cS1r6LF5/RpmLL9OZon6dOOfuVM0UhQLCLQknQxzXHBrG7o07Xpk4/Wo4yLQayqtO0x0Xgws/IJXFBcj2FLtxIeRZQOp2pQvoqju7xytzHwXKGNCNaLfI9hH3Aotv+UkX/1s4Xg4Z+ZrlNOU8G22J3IpJ5tU5APxYef9kIwMt2ri9m7w0E7c5O/wrI+LPcJKXRPQORv0yuSq7g=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(39860400002)(376002)(346002)(396003)(366004)(36756003)(5660300002)(2906002)(44832011)(478600001)(8936002)(316002)(66946007)(6916009)(2616005)(38100700002)(38350700002)(6506007)(26005)(66476007)(6512007)(6486002)(86362001)(54906003)(41300700001)(52116002)(186003)(8676002)(4326008)(66556008)(107886003)(83380400001)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?L+5WiocT9TOWCrMoT5LjNngu11ByPNLLciO15rQyceDqLuTN7iQW5DeIwCM0?=
 =?us-ascii?Q?73q/mtNjmUS1fGBNwARnQHU7y6f3xAvWz/HSrEQOC2pnLr2IQ/46mQGp5y/2?=
 =?us-ascii?Q?ksZJSiB1rQ5u8Et8Y16nbhYUuhTBvzskHjfWv+9aO5jvTky0g8v5f1IKMHoN?=
 =?us-ascii?Q?FljT51wRcvkAmP4g0UxKEbFkxiq0BKARjdZSyatm7/b4RZ5Jdk0cawD27LHw?=
 =?us-ascii?Q?XCGCgMmzMx6yqrN/py7Fp/wr00oUwvlwEnC5Yjhc1/aCRb2nek0VNxF5XFfc?=
 =?us-ascii?Q?nP19XqO1SQMteIn1agX3n7xQjzOtFIwnf9g89KN94+40E7Q3s8H1m6Fz59g3?=
 =?us-ascii?Q?StSfA8jWM/2ImxjN4Jwo3Bid5LKRVfHgM7sELqmhVnNehQKPLR+kHy2wQ65L?=
 =?us-ascii?Q?jH1gh2iGmkU3aF/sd19mmWRBboozLBCn/0D17bKVhR2QG+jmnmSPykGmDBeX?=
 =?us-ascii?Q?KCSan3Jl3a1nuByXYzjjMu/RvZbupvKp1foS+t87iwPM8D4uYlZKPhqLHv5J?=
 =?us-ascii?Q?UEAusllqzNwS76hDMXko6uszb3rbwILQwzPkwbHZyi/PV63M5URskWa4LA+i?=
 =?us-ascii?Q?L84Ydj6xm9v9k4VhUNxWPQBeWD3w6fTQQaerrjtku5GoZ4ChK9KaFU/Ii9fM?=
 =?us-ascii?Q?Aajr/LuDx8F69ARwzdZsHOaknK9ya8ByJ+BrgaZp3Bb6Y21z60xqql0ddkrA?=
 =?us-ascii?Q?sgHn/y2BzeAvxkOL011DMtzJo1TJcNNGjVNpmLtuLg1jgUIRsebMDACdjq0R?=
 =?us-ascii?Q?/CXUVdovS6/9I7NTfEXak8ivL9Jpbw4i/9gwpBytWQchpxlGjKRtnnG592Ae?=
 =?us-ascii?Q?B5JVhzeuCKOzwQi2xe4XZv7MbO2F4iluDA1MkZv0KQnLG2ofkhVWTPbOPCi+?=
 =?us-ascii?Q?6kIeT8UcoTmHws6Ig1Hk1qxclDA2bFq/3Elg/FFnSUyiIRdh3M+GudYu0V2O?=
 =?us-ascii?Q?YI713L6vPFgZeEU9hBW6jmXu72nhJZyqBcgFZpZr6StV3+0URNwFZsV6E/Pi?=
 =?us-ascii?Q?/eR0amXskx1VQbPAmLZb93aO1iVmApAR9JGMIp9HQoDv19CeLNuurd+SgRcm?=
 =?us-ascii?Q?ykoYF06y47v2Bx9gPXOdCApjb3mnveI1N3YcctQtl/XgbSa8okuwDh5DAWHz?=
 =?us-ascii?Q?juPir2zHKKWlIInYv4ELdnKy3bacLqHH8CMN1U/4RgPNftISY3/g4Lj+q+M4?=
 =?us-ascii?Q?X/3+JyKc2FKgDS+xl0IANlwqNZ0VCoIVuwmYX7sxcjb8DM6jj6zANXqoUBQ3?=
 =?us-ascii?Q?711elL9JnXJc+CRJtItMHNLZVKcCGU82b3H2Kq3jKSPa8px3OQ5+eIWnpvua?=
 =?us-ascii?Q?5dYRpkYYSWXb2EdlFiktd7kGftJApNvO8SgIaDQ3wZcBxtEmb+CqmZ23mMn0?=
 =?us-ascii?Q?PXck3l4kpnNo8XUAGhxqG4lhdAONFTYHeRshIMFUASt/GgedgYENCPZ9zz0X?=
 =?us-ascii?Q?KcEp/SHqlg8tmwuZ4BI+lEmo0BfeN/jr1TS9P0UCoEhJkvKHs9hbv/7MGGUW?=
 =?us-ascii?Q?m+VkSG4WHdGBb0kiAQSWbqrhbd+7Sd5HKCn2WlyiDP1IvtKrgl3bAqrcOtdf?=
 =?us-ascii?Q?lRE81bkZFKr6IVWYKaGksp2xiqni+b0AoJoH6dso?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 dd87dd68-4a7f-4f9f-b12e-08da7c379efc
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2022 07:52:36.0627
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 e1d6iGppkey/4UWbN3jIxIUXtkH7mN712/lhZf+bJ9lFjFQRL7tkLs9C2ysVE0nxkTbgjbUf1FN/NXDMKPy4pQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNZPR01MB8490
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Aug 2022 07:52:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98204

From: wangmy <wangmy@fujitsu.com>

Conflicts:
meta-oe/recipes-support/c-ares/c-ares_1.17.2.bb

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit c49173b09c998bb3893ae873f68823647f1a7e18)
Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Signed-off-by: Akash Hadke <akash.hadke@kpit.com>
---
 .../c-ares/{c-ares_1.17.1.bb => c-ares_1.17.2.bb}   | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)
 rename meta-oe/recipes-support/c-ares/{c-ares_1.17.1.bb => c-ares_1.17.2.bb} (63%)

diff --git a/meta-oe/recipes-support/c-ares/c-ares_1.17.1.bb b/meta-oe/recipes-support/c-ares/c-ares_1.17.2.bb
similarity index 63%
rename from meta-oe/recipes-support/c-ares/c-ares_1.17.1.bb
rename to meta-oe/recipes-support/c-ares/c-ares_1.17.2.bb
index de27d736ad..19e35db2d7 100644
--- a/meta-oe/recipes-support/c-ares/c-ares_1.17.1.bb
+++ b/meta-oe/recipes-support/c-ares/c-ares_1.17.2.bb
@@ -5,14 +5,11 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=fb997454c8d62aa6a47f07a8cd48b006"
 
-PV = "1.17.1"
-
-SRC_URI = "\
-    git://github.com/c-ares/c-ares.git;branch=main;protocol=https \
-    file://cmake-install-libcares.pc.patch \
-    file://0001-fix-configure-error-mv-libcares.pc.cmakein-to-libcar.patch \
-"
-SRCREV = "39c73b503d9ef70a58ad1f4a4643f15b01407c66"
+SRC_URI = "git://github.com/c-ares/c-ares.git;branch=main;protocol=https \
+           file://cmake-install-libcares.pc.patch \
+           file://0001-fix-configure-error-mv-libcares.pc.cmakein-to-libcar.patch \
+           "
+SRCREV = "6654436a307a5a686b008c1d4c93b0085da6e6d8"
 
 UPSTREAM_CHECK_GITTAGREGEX = "cares-(?P<pver>\d+_(\d_?)+)"
 
-- 
2.17.1


