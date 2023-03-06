Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91801C6FD19
	for <webhook@archiver.kernel.org>; Mon,  6 Mar 2023 11:03:23 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.30598.1678100594897725898
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Mar 2023 03:03:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=qhaxc05K;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2429e4d58b=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3269qQfw003556
	for <openembedded-devel@lists.openembedded.org>; Mon, 6 Mar 2023 03:03:14 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=VGLFI6WhILDkP3zzor0LRGXaywRbrZZrnBhjhbQLNC4=;
 b=qhaxc05KgvVUatwPOTp4SU41K3lfy8xzlgRU+TZ79Ue1otBVZv9EJFqhRCjM6YvzKZUM
 +gNkfY3/RwVt6lrEoEo85jhCvG6DtACNBJak9YRiZqYAdzfl9q6hUwv8Ncw3RooqsqFM
 CzuK5PJM0Em+yMa4yE6PcIcSVjbiuyrtPqnCTleNhgByvjI6kkx9Qx/RLImzGftj4sXQ
 rMakny7jOw103elP511MLWNszHFC5YTIm7NA5mF2gcZnUxtx85cbKzyvIppbr08xT2Qf
 l4HqZ0BuViVLi5yviT1V897FEHLY+nnJMizB0HSz/a3E2aVRV1XtEaB5S/nIjYgtddK+ bQ== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2172.outbound.protection.outlook.com [104.47.55.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3p46crhfsw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 06 Mar 2023 03:03:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J/KqyvlV5wvJdZYW1gyJkEY47owj0aZ6QNPdEBmAIs9ShEQCoJUmJt/3jB8R63MMyfmIVQ5v7liWt22gqg606TVpm6J/TpxeFg0d0grAaqU9wEgvI3njRy9VwFfqgPlUkAUNbUEiZZAqik7CPbzsG/YhAn+enKqm7vLpHF5thgS0eMV3ite+J/qYuB4nD0vsdxYe5WOrCKBkQ54Fv66M7XBLMne8m0tklF3QKweLdgmZrXIbEAFqdMtCGmhHmNsAnk08Jx1OSoXGKPBLDfsWRWuFg7nj25GUMQQzB1NkF7kpaLLGxj4JkufCgAttG4ROGaSxs3Ov1mQZgyLeP3Im6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VGLFI6WhILDkP3zzor0LRGXaywRbrZZrnBhjhbQLNC4=;
 b=PaOOQKE0nbdOHodBudA4ahx+5Po6HsNUiqZqJAIUVm8K9QSgIdxqaBwGNjKoK6d84uZepJmbHecToTE/JXDWOGsRlkgBWoCleL+r8W+c0xjWoqA2uq6SApjn8vuXaXCz1ecJmu9dxUhs5k6254DRFRd3hI6RhJPPfGm/K4uBZbaYO/mQrJhJ5HAD6uPlwPilGHtw/qpJ0EdRxFiuTzfBgq3fTQvnH9lhONeaYyVZo26DwyzeEnwqpESyLHOqiGagdGAFKmMWQIEyQ/b35q56mf11MhD3nvSVOaYUqy246cdXPgYROwtDyeT+vs0oH/n5pO+Vcpc0DqvFCuRxD0naOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by PH8PR11MB8257.namprd11.prod.outlook.com (2603:10b6:510:1c0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Mon, 6 Mar
 2023 11:03:11 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::3cb7:edf3:7304:982e]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::3cb7:edf3:7304:982e%2]) with mapi id 15.20.6156.028; Mon, 6 Mar 2023
 11:03:11 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] libssh: upgrade 0.8.9 -> 0.10.4
Date: Mon,  6 Mar 2023 19:02:55 +0800
Message-Id: <20230306110301.75991-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH7PR13CA0007.namprd13.prod.outlook.com
 (2603:10b6:510:174::17) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|PH8PR11MB8257:EE_
X-MS-Office365-Filtering-Correlation-Id: 25beee2c-590f-4ca9-2e4c-08db1e32602d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	K+MHnPAfHbLh0sHCuE6vFi57AsP5+9OrxDySIwC0caiKtBAkGH9vpRfqZQk71cINj8cVoMk3VDBcVRo8eggjFfo29l7ZsQTN3BJ8U8hmQkxB5ewmTh9VAqRqmL8HBLnau4AgabdoPVaEMp/+xb9ySDxd9J9P5/6Z/yhHF4+xNss3o85JpeR4Pcw2/yArpFzfGZXGw7FEuH/I9d5bXhWe7/CZCMd2bdOea1tB8YCPOjZ410NPg2iSO6zUHSY2FYwtQO8trzqCEq9flmUUttieHYscUIZF5PBR0RdcCifuY/u+OrUBKmBETSuAPh08aPFcYjybU6J8bcse0UaFai3OqTyTxQePhiwt1nYbo34fIVQBbvifCtukL+0AL/yh8+0C3ElRIV67sHi//+urjBODGesPdoJdCyEs2K2ksYRxn958Vo9QblRHMuBlWde3c7ex1tXTL9Bv0X6DFGA2bvVNQDhCTZVzKpuVFBQDf5zvVJ1AL9jplip84ysktiGbkl8uvK865JG2xaGZwjQK2l1nu0id+xXokc66cZu5eeLKncXCFcnGMulI6G9BP6AlYodTwR3HvFKytcn3WGHEsn8YosSdw3CMGHAM2ICUVM4ZDzRIHWMUs0wRyulMnTVFPVnEueEkHfVxRq1bHuqeBJUoTcG2DintRm+YTZgCVcKTwaWw9yV1aNBMuPgpqP0iV8jp
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(346002)(136003)(366004)(396003)(39850400004)(451199018)(83380400001)(36756003)(478600001)(316002)(38350700002)(38100700002)(2616005)(966005)(6486002)(6506007)(6512007)(6666004)(1076003)(52116002)(186003)(26005)(41300700001)(5660300002)(44832011)(66476007)(66556008)(66946007)(8936002)(8676002)(6916009)(86362001)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zWxROhJsEeliYyPnOZl2EX7q8gOD4eQhcTkyhxqV+oOuq4PcA8/rOhhLE9nE?=
 =?us-ascii?Q?sZkP/0gBU8L5rHbbdEOb9WGiz6X2j40mmuv1nC5vx7gFK9W/jEK55fLa9vrt?=
 =?us-ascii?Q?p1UruuAvBCY6S5VnH/yzEqM7vOdmoiupgP2+QF0badx7gu8qemDZJZ67mu2T?=
 =?us-ascii?Q?76qosS3YBM8WWJRRC+bHhQZd8qPUwfsKFQHh5w+xAQk5vXpEcjvbzi2Lipon?=
 =?us-ascii?Q?uqqo+w1rQmYYBOfL8S9AKmEgD/dEmcpa2PksHUlUP5rfuevYOBFBgAbvKKwx?=
 =?us-ascii?Q?Duu+kv9PC1I6PuIyT1flXBtHvasK28MarEw8MXUSjmXpQet+GeVgZWkMRx8T?=
 =?us-ascii?Q?ZoWnnCbSUe53LIiQkx7sdUeoDYTSw1iZ+VyFO37a5Ep/gbqwSQi7fomiHPrk?=
 =?us-ascii?Q?wDb7L9Rj619IQOrZD9NPlyUg9lfW5WVyRVSMIbICpD+Z3FTXvrSLUxFRYznN?=
 =?us-ascii?Q?HA1hmEPwPwwPlDtdsWa3XpQZQg6x5qjUYTLlkgbdSA48bab0ZZg2ZM7u4pJP?=
 =?us-ascii?Q?B8SKQBVDgKj50Qn78FyPNu0b+I9/bm9opuinTtf5W0o8RI7AQlnazbds/si3?=
 =?us-ascii?Q?9NZ+zPklY8eJ/m0Rg8dzoEZlOytBFD1SWLoqRSJ/vAesSM3sV5sSHxTJltKH?=
 =?us-ascii?Q?TQ+BSvHBpiXbS/xvyuEHEIz4Xre7KGxmBfNw16rQ/VUAOP3cyTMiCEhxbXpu?=
 =?us-ascii?Q?FHtHVtJkblkdeBNKQkaYwYSCTtNllDUmMjNVwlK4uA004DxfohM2Dc3wjmTi?=
 =?us-ascii?Q?doOR23E0SsmipSLIt95ubpa1QTGreYV9qggPtx2bg8k28wKdOODR/XTXWPbH?=
 =?us-ascii?Q?R8A3OJ1uvSCl3TZkH5MckGYmj4X7roUyv3u/krRSEvx3XOxGt8N+qD/LDIkB?=
 =?us-ascii?Q?aWtOmpCgYZVsqXlC8RqNjo9xcmoVZxigEXcn8EWVRuE14Ax0ZsFML44oiMmK?=
 =?us-ascii?Q?ZMFphqIAuDllakIDXS+6d9r9qtfo4al3pt9VyVUJKg2Z7Idqdl2MVqFvOc/j?=
 =?us-ascii?Q?ByfzHAXezQsqAVoDmM/Du8gqQ6cLJxJnVYwshZcHFajLZuk0DUZtBK6Suxod?=
 =?us-ascii?Q?KAcNUtNlYB1GFNAr6bGZddhegTjHWjMmwOhdeH423vUCwyvYtpxYckjUTI2V?=
 =?us-ascii?Q?ZXOlteFZPwNeWX/VjZGX27isqsoK7Yx2WgAk09JyXtoe5KAC1F4Eer80s+a2?=
 =?us-ascii?Q?enLEOYCkyDg1+pIrLD1c8/udQ7sk2UcEMgrbON/O/QdcJ1gmDz1zcPzlUaEM?=
 =?us-ascii?Q?fmiN3eB2S5BawUWdQ6q36KVbQNN2wOMO/VBR4X3BGVnCcfoVoUpAp1QQRk0c?=
 =?us-ascii?Q?q9u8fX1eKinFdIQlj3xjfN2Dmaq8Nl85FvMtF/vUV+YmSuXoUHtukL0Ls/1g?=
 =?us-ascii?Q?fjZss8dmbKuFvvbehcfeD/eMDwIIAfHVK0lR7tGd9e9OuIfW4bmA9B4BDaCP?=
 =?us-ascii?Q?pW9T/QBYFH1vpAVpa1egk77UrtMVvXnFOoYVSsycVyqbeb/z7ZfX682K2S3d?=
 =?us-ascii?Q?a0f1GGC7PO5xRT6HUzgSsNp31pJ4Y/UhntR6qIUgjMVnHjQMnhNBUUDtuEI2?=
 =?us-ascii?Q?6Ayn9e9FIdTRFSQNuHMzhKjoShr0fVygwwuYPkrP?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25beee2c-590f-4ca9-2e4c-08db1e32602d
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2023 11:03:11.6641
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wn6GzvGC9bqSqEUCrFmWxP+hP2AQQK49x19em0+LlOFMH4BbeL2yAmb9mQho80b4hJgOAD4+gZTYROM6SSQFvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8257
X-Proofpoint-GUID: oYNC5G7ooAMDh0A0-sXaV-nllwLk2vpR
X-Proofpoint-ORIG-GUID: oYNC5G7ooAMDh0A0-sXaV-nllwLk2vpR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-06_03,2023-03-06_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 impostorscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 spamscore=0
 mlxscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303060095
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Mar 2023 11:03:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101393

ChangeLog:
https://git.libssh.org/projects/libssh.git/tree/CHANGELOG?h=libssh-0.10.4

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../libssh/{libssh_0.8.9.bb => libssh_0.10.4.bb}   | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)
 rename meta-oe/recipes-support/libssh/{libssh_0.8.9.bb => libssh_0.10.4.bb} (66%)

diff --git a/meta-oe/recipes-support/libssh/libssh_0.8.9.bb b/meta-oe/recipes-support/libssh/libssh_0.10.4.bb
similarity index 66%
rename from meta-oe/recipes-support/libssh/libssh_0.8.9.bb
rename to meta-oe/recipes-support/libssh/libssh_0.10.4.bb
index c7e9c3320..3a57a728a 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.8.9.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.10.4.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=dabb4958b830e5df11d2b0ed8ea255a0"
 
 DEPENDS = "zlib openssl"
 
-SRC_URI = "git://git.libssh.org/projects/libssh.git;protocol=https;branch=stable-0.8"
-SRCREV = "04685a74df9ce1db1bc116a83a0da78b4f4fa1f8"
+SRC_URI = "git://git.libssh.org/projects/libssh.git;protocol=https;branch=stable-0.10"
+SRCREV = "e8322817a9e5aaef0698d779ddd467a209a85d85"
 
 S = "${WORKDIR}/git"
 
@@ -23,15 +23,7 @@ EXTRA_OECMAKE = " \
     -DWITH_PCAP=1 \
     -DWITH_SFTP=1 \
     -DWITH_ZLIB=1 \
-    -DLIB_SUFFIX=${@d.getVar('baselib').replace('lib', '')} \
+    -DWITH_EXAMPLES=0 \
     "
 
-do_configure:prepend () {
-    # Disable building of examples
-    sed -i -e '/add_subdirectory(examples)/s/^/#DONOTWANT/' ${S}/CMakeLists.txt \
-        || bbfatal "Failed to disable examples"
-}
-
-TOOLCHAIN = "gcc"
-
 BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1


