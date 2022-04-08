Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7916FC4167E
	for <webhook@archiver.kernel.org>; Fri,  8 Apr 2022 17:09:35 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.72])
 by mx.groups.io with SMTP id smtpd.web10.3088.1649403026558679978
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Apr 2022 00:30:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=DvL1ho8B;
 spf=pass (domain: weidmueller.com, ip: 40.107.8.72,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ELV+JsOZgcByBLzoFkFjGlUKL99dJyQ+kH8RPVK+7VFH8vpmzSLkdZJJau7zk9AEN5q7mWgEVboO6zN6DqWS0saH8PqdJ4USZCsWK3rSiLW5g+YJHYYBVgPzXG3fZk9IrjDCYMJ+t/98cqew1mxTiLYChb8XaZ449zgB4NnsV1njRsok/qFK8Se7STdLCFtASCO3R9DK968GtROo6UoAw0p1RN2uo/BY0nj74FuYXgaxgv4ISUrKSZk6K0djORUhPFpFvDXG/z7DBBiwwSxI9eKKEXnkMV+3TFNaMW/5Sw0ABN/2NkD9rvT3xMlL+n5aJJssCtDCZD/JAJMef2q0Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Nwuf8mjtmn6h5W9DzK8qz0usUIEdC5lTOiqoNmeVWM=;
 b=l0OqNd744eahjXfNK3MpEHjHQC6KLOMkF6qHAOc6sh4l3rm2zEBRnYgK6mv+Qge0jaKzEqIXIodIfhbrqezDlrFgme2KbhQIzZOjK1SGgyYlSZaRAp/y+1YhntZQ4pTowsxHE3j9WgIwW07Ft/R4+Uw54RpkfAPAChSw433u4hOZeUq3wSHGyyadYDun1KXtB6lP1tH2EP7oQPNH/Ar5WqFqC+rfXzlDBqfhcVsY3TvcxJbFULmsfSGmpEZTsiOuKpCHNsnFzELNni5+RxRsVGzhZQ547UCUDi7U6k3hdxCRGrjiOoQY4clh0l4ZGx5zVtNiV1lNnhVa9Fc22t2maQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Nwuf8mjtmn6h5W9DzK8qz0usUIEdC5lTOiqoNmeVWM=;
 b=DvL1ho8B41T8pWubzp6Rq2zbiQoIEMs83XfrkDA99433zvp9AFpNi03nYXmaaqfFeHA/uiR9ns+ZPUWgQph18AxHQC+Skh46a1n8WDxsrBZllrxFdqdEXTIXSgiBY5UYIwTXTvYIcxVTjapuKiRbOOle26N7pZYR5y76IGh6y4Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PA4PR08MB5919.eurprd08.prod.outlook.com (2603:10a6:102:e0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Fri, 8 Apr
 2022 07:30:23 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::c53d:64fa:866b:b512]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::c53d:64fa:866b:b512%7]) with mapi id 15.20.5144.022; Fri, 8 Apr 2022
 07:30:23 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-devel@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [meta-oe][PATCH v2 2/2] grpc: remove useless link with libatomic
 append
Date: Fri,  8 Apr 2022 09:30:04 +0200
Message-ID: 
 <20220408073004.20207-2-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: 
 <20220408073004.20207-1-stefan.herbrechtsmeier-oss@weidmueller.com>
References: 
 <20220408073004.20207-1-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AS9PR06CA0104.eurprd06.prod.outlook.com
 (2603:10a6:20b:465::16) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 547dd2be-36cc-4367-3f86-08da1931a45a
X-MS-TrafficTypeDiagnostic: PA4PR08MB5919:EE_
X-Microsoft-Antispam-PRVS: 
	<PA4PR08MB591998B438B1DDF853BE57C6D7E99@PA4PR08MB5919.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	h7MoVNVRgd70ExQBvi++Kbc9xPd+u2J+lWLTJUp0MvNjIyzO4o/NLUS7FvYin20jxXtrg2Al1eYqp4ZHx9AiL+m5JzP0ZQlhFXlDJTy8Nc5YoRYEfCq4Ia4A5+fbVRWMa4yyPNmYOTgZZ99cjGo+ZMadu/stobbIkV2PlsErersoh8YjcCy2hyMeXPyJre9ZOubSMxFI/3ud1wYrh0PKUEe3/caD6JQSzMs1fSWmRYLRz5lK5Oni2XSDn3K3AxOQVpVOCIR6GItpGAP2ewwL8YhZswJtIXMr3gwzcTCafDlILFHTPX6wfbRu1u/yaGBNOoMCIozc//q3H8EXI2ntxzOtzHIFzf/RjyWRjoHr4oTqLBl//c3HE2nk7isardR2gnt1QzTWM4tWsJmzWbQoYFaFJIJxDbFCiFInsMa9q81gm04KjwespFQqNfdFkL/0rdAj27P/BVUIe5gzrEGSD9epx7egGec9BfPtEB7KLqHvEuuWILrS702w7biEFKkuNVl0olIg+JHtWQEkkP86nS/EuRBvsBBHL/eSLFrajQV9643i4eCUMDq8UBdtemmj0/wmGkpG1NvENgLyvbFNFabNjGMYPItfzGg7idKmUTGqqX8k3uos2guK1Ndsh9DWE3rGfUKo1KtIJeaLg0DHAHtQrwbiprtOZJAQjn2TQQYkxHhkX+f7tSB98+59Xa0FEvlgRk1lB9Htl0IodLFwkQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(508600001)(6486002)(4326008)(5660300002)(8936002)(107886003)(86362001)(6512007)(26005)(186003)(2616005)(6666004)(52116002)(2906002)(6506007)(38100700002)(66946007)(66476007)(66556008)(316002)(8676002)(36756003)(6916009)(1076003)(83380400001)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?tFohncpR0xbxc9zwJs3/OJ6h5ufVfAn6X1eUCQh2527LltlXjBF396u1ijfL?=
 =?us-ascii?Q?c2xMMyZm3wmjIkv8w5dfdCg1J41y5ATNIn2CrCMgLUF6Bu2mQS4ULTV8RcNM?=
 =?us-ascii?Q?ULopyHA6BzbxYuOPPi5H2vV98Ej4txRYZN5y5iZfGrsgQzzLZQZF8rwqNXT4?=
 =?us-ascii?Q?QQgyecHah07hcP7lp17veE1o9fXg2jApEBFqww5rpXRTnk3+mPUoAMDtb3bS?=
 =?us-ascii?Q?4u1GFx12kkmF0GpHntbUCrGK+bhrBfcQoBKiOnqniSx1itysdyb2rk63wVwt?=
 =?us-ascii?Q?4HL/slk4K7vwWkOfSK//2hEdHwEOc/Q/qlbUlMwZpZi6cKa2ZHlBdFekhQNO?=
 =?us-ascii?Q?EKvX3WoMqVlKJHMSaLdKKRCHlQoheKsfuT/eE+d68Q7Ssh7eI98qG43nz3uA?=
 =?us-ascii?Q?Qme7JN1gMrLxkIfwUhAjXhFmbTuCaGU8l+J4MHAZhoE9oiL+Bi9ANV0nFGhJ?=
 =?us-ascii?Q?6X73wWnarJkrxZzC3lGVOUzJ9YzIdHE/Ezt1/NnSg38M92qUOW3+Inulu/Ge?=
 =?us-ascii?Q?4JyfiwQeu7TtYkBhPcQ3AZriC1++oiL7HVny2YLHTYCTfIh9THIMwtDirQnU?=
 =?us-ascii?Q?T+FV6V1lXu/46cswCEnru5SXYFcDMV0RYhLzlLDDvxMhK6sZ9JPVbaNR3W8i?=
 =?us-ascii?Q?rbFmWSYxfdHoc1wLnBGuWja8/sWWISValH/zD376V3e9G9cMwMFtSQW+oI7G?=
 =?us-ascii?Q?AsJQPVM7y938r7QoauHoMfbvxST8jj90KSOylyOCYHYA1wTXp1MwCtNyLDpu?=
 =?us-ascii?Q?v0jxe4x0gKrjdl3qjh+xUs9FgsuZiIxf9LT9uplfrgJN4hhxwQ0PQDC2Yo30?=
 =?us-ascii?Q?GhmyQTmFGKSvz99+r4eLLhLiTEMgqsEXMXD+MwkwFY5drpguftsgMSKEBtGg?=
 =?us-ascii?Q?VGtc80wqurUTkFFrx4Ar3sakmWWLsEuhQcNC7v1tTLvjISeTczdN6zYqYYkQ?=
 =?us-ascii?Q?rKwz7Ifv71NcPvrhYfDtOZeru1j3WRieHhKx97Fee86E2bF//6ebmKyFMVQ/?=
 =?us-ascii?Q?QvVwL4ocpdc6hk9XhVRRDQnOGvf2wdJfyQvc6qrE+sPvfOLAxu8Zfd3TLyIY?=
 =?us-ascii?Q?SaOQrQkYHYVgjvP3V6bDLVawzkL4bgzMwA9ZjXvkRNbXFSx1IDSdZnHFEmvd?=
 =?us-ascii?Q?6szUa+iaRakxw8G7nJFgvIUez9bMQq3tOFEvuO07DUoOcFeNEVTQejoV0xXf?=
 =?us-ascii?Q?ABpdqXi6Kf3fhqSoVe+STU+oYdccQZpmHD2CAxUSTJIxERsvr9bTy+y8Vtw6?=
 =?us-ascii?Q?X6ECDcJtp+QrH2tCjexC5SfDvqL4HzhY1EXHWZZT0wDfemEjTH7oCXqy9PkI?=
 =?us-ascii?Q?ge3HR2rfmdI8fXi7EiU9ktqQ/QoQlsYaavkGz6nb/Lkruo8yFPdhX2gbNQ+i?=
 =?us-ascii?Q?6vn+U2djF3hIj4ps+ePPVJiCkXA4/LfcPR35s/DWJ9807FP+HRMvlIuzhd5h?=
 =?us-ascii?Q?YdboBlYp+PePRVd6Cq2rE57hMiCZNN8sKf5GD2vRcbbcIx6c2gyIh6L4NWuI?=
 =?us-ascii?Q?eqV43E1QEATe4rivL802JD9/3zUN7crKflg3/bdKNKcs3DoEhikc7MhCuJvY?=
 =?us-ascii?Q?Rl+1VzIguQXf8pPYsbp540Ssid1c9vap9wBHUEeXDiGSUbOEgwG+5fEQw1pP?=
 =?us-ascii?Q?ANzs949Qr/okXoQYPwi7V0fXLREjea6BcSpH4zl1yLp3/XM3Ys1Wuw8TwhGk?=
 =?us-ascii?Q?/wPwcao9C54ndkU3NQvuwDPUFDfYLR4YMNN7K3EEeBZ4Qq3uol1dIokqEs8Z?=
 =?us-ascii?Q?WCdbteah2fBPGEJK+vhDBOXkpBM4VUs=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 547dd2be-36cc-4367-3f86-08da1931a45a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2022 07:30:22.9378
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 v6kE/SPiZeyKJeek/yQ7r+QW1RIkW0ZBBwm+yNchiuk8quGQpwhSxMLkf7Fs1Jww59KRpITn4x0Z26kX85IMgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5919
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Apr 2022 17:09:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96472

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

The sed commands to link with libatomic don't match and is therefore
useless. If they are really needed the problem should be fixed in the
code for example with CHECK_LIBRARY_EXISTS.

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>

---

(no changes since v1)

 meta-oe/recipes-devtools/grpc/grpc_1.45.1.bb | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.45.1.bb b/meta-oe/recipes=
-devtools/grpc/grpc_1.45.1.bb
index 292ea7f9b..7275f451a 100644
--- a/meta-oe/recipes-devtools/grpc/grpc_1.45.1.bb
+++ b/meta-oe/recipes-devtools/grpc/grpc_1.45.1.bb
@@ -59,26 +59,6 @@ do_configure:prepend() {
     sed -i -e "s#lib/pkgconfig/#${baselib}/pkgconfig/#g" ${S}/CMakeLists.t=
xt
 }
=20
-do_configure:prepend:mipsarch() {
-    sed -i -e "s/set(_gRPC_ALLTARGETS_LIBRARIES \${CMAKE_DL_LIBS} rt m pth=
read)/set(_gRPC_ALLTARGETS_LIBRARIES \${CMAKE_DL_LIBS} atomic rt m pthread)=
/g" ${S}/CMakeLists.txt
-}
-
-do_configure:prepend:powerpc() {
-    sed -i -e "s/set(_gRPC_ALLTARGETS_LIBRARIES \${CMAKE_DL_LIBS} rt m pth=
read)/set(_gRPC_ALLTARGETS_LIBRARIES \${CMAKE_DL_LIBS} atomic rt m pthread)=
/g" ${S}/CMakeLists.txt
-}
-
-do_configure:prepend:riscv64() {
-    sed -i -e "s/set(_gRPC_ALLTARGETS_LIBRARIES \${CMAKE_DL_LIBS} rt m pth=
read)/set(_gRPC_ALLTARGETS_LIBRARIES \${CMAKE_DL_LIBS} atomic rt m pthread)=
/g" ${S}/CMakeLists.txt
-}
-
-do_configure:prepend:riscv32() {
-    sed -i -e "s/set(_gRPC_ALLTARGETS_LIBRARIES \${CMAKE_DL_LIBS} rt m pth=
read)/set(_gRPC_ALLTARGETS_LIBRARIES \${CMAKE_DL_LIBS} atomic rt m pthread)=
/g" ${S}/CMakeLists.txt
-}
-
-do_configure:prepend:toolchain-clang:x86() {
-    sed -i -e "s/set(_gRPC_ALLTARGETS_LIBRARIES \${CMAKE_DL_LIBS} rt m pth=
read)/set(_gRPC_ALLTARGETS_LIBRARIES \${CMAKE_DL_LIBS} atomic rt m pthread)=
/g" ${S}/CMakeLists.txt
-}
-
 BBCLASSEXTEND =3D "native nativesdk"
=20
 FILES:${PN}-compiler +=3D " \
--=20
2.30.2


