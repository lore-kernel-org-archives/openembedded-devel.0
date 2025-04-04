Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB28DC369A1
	for <webhook@archiver.kernel.org>; Fri,  4 Apr 2025 10:54:42 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.113])
 by mx.groups.io with SMTP id smtpd.web10.8467.1743764076838542480
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Apr 2025 03:54:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=mVgLlrn3;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.130.113, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hLwOPsVBG+aHbdpM1/SgOsMCtUJ0j+B5RdVDmiXmfwd4kp8X0NhTQ+xc+dyYAf1/MyPwcbgBxqntwH+yOIygr/PxUK3V0/aXFahb6pvnZm+MWsJkrGXB4UkQaVzNK+imufAAmHsVwx9EaRuBHqpf1M3aZ+KZNW2PlPq93y0hD8XwqvqI28H773NnQtJMONCu+zB3V74pJ2voXYH2Uj7l1+gLwDYEOuuedNNF8uFYyzHFPy4Lp5pjcMGpqXDQQ5TKXaRjz/z9UdfHh54udduDwtz2rtZO8vNp7Zp5l96tg2ec6jUSHUyCJFBotYBACptERXMTAtyzJoUzxT68HNqe7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gq2LcczDs6o1NS1a6z5f636L4rQouzzGAWUeO7QDKZ4=;
 b=gLJZUmDyNTOFdtGVdmfnBDNqtX5gXatV4+1637QwUv8y1AHye3lYRVF0GJVsPqiP07lJGyaT27zPpViftKuP4gCyEtyX7G3N3GBZjgPFD1WkdPRbSLTwMmDkMXxiyrXhegjhVaUCm/GvrhQ03eUbup/KSdWjWE3LctqMWNSwE4mjCz9BCR30Y5SVS/0xLCenyGx+rOe8E/n4a5EtaWwQOD3lm1WORPjuF1GjCtYQrDRLIdjJX9TogG9vBYhcQsc/h/w56KjZbAUW0+enmPHTm1+D4qSOje0C4wByPbK9vfrMXY6UWCV9xKCxwLuilfI621fdxrHHw/25zm1mcJj7PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gq2LcczDs6o1NS1a6z5f636L4rQouzzGAWUeO7QDKZ4=;
 b=mVgLlrn3Z8EON5xtbAv9evENwyImhJ+qeMkh1oBoMLx4wvP7Vfg69fCK+QGfoq85oYy155eNI3DuVSezz50PntFeoIjvXGBljDcgLyUiTOwiLrQN/X37y9xsbKEe/9IfqYfuEBi9XFy3tIwVcOGJkUVxWH6pAiXuHlc4jyf3fXw06gUY/fHvvNfyI6WOUYtxyjoHrzzgs6RaYxeYbe6etnAWkHK4d8qPhNG9zIFUAJbA5MT6KX/oLcsSIlglL3t2v1vMvFU6nvdd7/Vid3LjYDPDkAdsEvt5w1nuNk/QaM87/N3mRUdvGgzNaRN/kj/CXTGEWJkZyeT9ExN002YmrA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by AS8PR06MB8167.eurprd06.prod.outlook.com (2603:10a6:20b:3c1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.42; Fri, 4 Apr
 2025 10:54:33 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%3]) with mapi id 15.20.8534.048; Fri, 4 Apr 2025
 10:54:33 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: raj.khem@gmail.com,
	Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH v3 03/11] dbus-cxx: Support using alternative runtime D-Bus
Date: Fri,  4 Apr 2025 10:51:42 +0000
Message-ID: <20250404105150.870898-3-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250404105150.870898-1-niko.mauno@vaisala.com>
References: <20250404105150.870898-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AM0PR06CA0133.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::38) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|AS8PR06MB8167:EE_
X-MS-Office365-Filtering-Correlation-Id: 170ceaf4-9840-4bec-64b1-08dd7367159c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?FvB5YfRLqD9tzb2K4WF5LQsEtrJP+sGz+s1NQWZEyz3hD80EYW9ND8ASPVYw?=
 =?us-ascii?Q?RTt2RLjGomQr9jW+GxxJCjt2NDOhMrewtgQaw4ddBYHnCxclX+Fl9Ny2Gp4E?=
 =?us-ascii?Q?7oeL4BkY5vAkopSe7wQV1NaqqMGrz3CqNRxn2UNAIwjvmjaRXMA9YcWNtKbO?=
 =?us-ascii?Q?JRIg8lNKvcIyrz7zWdR3PIkGrb74rnNlhXge7njhLt+mXC8SDjtNTgEyx8Ad?=
 =?us-ascii?Q?P97pv23/Fo21CwqWAjrtUmV3z/cm2HFulO9lkfff38foO3NGPLi7KsEJwUvU?=
 =?us-ascii?Q?KN5ycrp9ii3y6K3ZqsF7IoxM+b2AVA3+BKwdQ8eK8GTKMfp7nFFbx0MWJO+A?=
 =?us-ascii?Q?4bIqJrUmJq9hx/0IhrA0lE5zcEZVrGVooF0BUm4hiVOabUnyU3zO9JfXj83N?=
 =?us-ascii?Q?6CYc0jFUXVmE4TMzYkefzhOqtiOQ6CT6sgYeou+ypSmyAxM9qLD/Aa4ZxhAk?=
 =?us-ascii?Q?3mL+RiHxjX/nFTL5AlrCgjzSD5V1mvdpsjt9aGOOOgqP1hzFWlFvxYQjFBVX?=
 =?us-ascii?Q?9rKA/XQbfiFzaoCBoAOXAKIHzUHAJ5Ah44kzd4O43jFvkrwziVbK5IkaSZRk?=
 =?us-ascii?Q?oF+KVPIyMBQ+JTsu46e5+36Gb9PyEWDlXA55gl/vSE/zOHgChsA3s0VT1h/V?=
 =?us-ascii?Q?PGgITbOAizUSEvlKONCAQ4nf8a1VIt7NrmEG4PIkBcE8Sw1iiWwqm4UNMK5d?=
 =?us-ascii?Q?SvaN7ZLduA2DhffY9KNA9LqgYjMHGmWEFzohtklmx4mQMGFmO3VR8CQ91SRJ?=
 =?us-ascii?Q?fAeedwdPu/72GcnBlkKKa2jV2eQ6m0x3JJ/QUr03zIPLGbe4OoHYYkXHRd/b?=
 =?us-ascii?Q?bzqlR0V48dhz0BPKgXFRRzdZxll0f7dBtirUrlgui9cXbEOPLXuvTt1c17Kc?=
 =?us-ascii?Q?N5JG9fzIvuNJYLpr/RmEVsbonWD7pA+5kZGf4zdEElcNi9wfF08d0yfLANpN?=
 =?us-ascii?Q?V4aTy9MSEJDS6uSCoQTQhT2V65ZpP7PVQO9WHTt4PY3QwKHu3K7DpMl5cCpe?=
 =?us-ascii?Q?JyUmgMD4vvTLWzaXhC2iqiN7bEN8dTvJu3B1DvSopwSYjqsXJg+gzBnCEA21?=
 =?us-ascii?Q?PEb1S10p7Bw7J3S/TQurJLIB+/1HhIrs12tRjbEwarmmBj1TdQg36RYZk5N9?=
 =?us-ascii?Q?W97SmWhr13traqm+t6yANC0qhID12liDuIFyjHiP5Y/k62OQ9EBe+TZiGOAl?=
 =?us-ascii?Q?FJIPYxutypqo62wcP5r5eUTyJZ/tWF9BuqElz7RdQ/jn8gxpN/J4SYWfGa4X?=
 =?us-ascii?Q?OoexuvpETRY9mRQ/fpx9oEEnDYo+Pebe2dPV7w8vyiNT5S6zHrPBty73NL2t?=
 =?us-ascii?Q?BWlIOJ/qT88cA5cP4VcsjKDJfwEPrOxleXyG6icN77t1L5j29Mt6nFNVXaVo?=
 =?us-ascii?Q?5emek9hr5DHSL69qRTdQ8VspGrsSaZhA9czRLo3zzu5x2EARQnNix3hB0txX?=
 =?us-ascii?Q?65aXy+zDN7uZI6tOeD7uwb/BOBROiHHq?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?dWJrZv5Dzesz4fzHXgZ+2iyDarKf706uE6whltUYqn6nOKxUjXokBHxrMZc7?=
 =?us-ascii?Q?0Z1yqJD/219YBWBQmPBpKXO8I9Gn+NvCizHnz+SPIW2vMkjLMDn+fjyhFLJW?=
 =?us-ascii?Q?rjabbnGJeBLeJwEqmBn93sphleQulRe6xJESDcufH9ApGFFHRH4kZ/jXVGfe?=
 =?us-ascii?Q?lGjC5eXNoLeGJn3nj4cCD0puu90N7i8DcL9M/1sAafhEpRGzhAu23HGi9nAG?=
 =?us-ascii?Q?CafgXtg+9C+tzF/T5hFBc1BvCy+s5Hz7igQtik+h0n8lu8A0ihT+AZagU3fq?=
 =?us-ascii?Q?NZKF6xvOE9tqJiW90AswMfEJV5VSCmESXSewaudkIW3x1N5zQI0EUCn3UChU?=
 =?us-ascii?Q?iLqx0hK+HlOGE0PAjk3uVIX9NhhYj81ohG4W1R6p1RWRcmcLx0jMg6FoIBVw?=
 =?us-ascii?Q?On6f1zkRUIgL1+7jSSWOqZQ3abNV2yFwsFPYjEzVepewKkSjeShH6TBgxcbt?=
 =?us-ascii?Q?Z7lTlxHMi2dwJhlVOJs4z+MHQkbzR/OFp334UHcfhGuWwPtzmfS2lGRN9zfj?=
 =?us-ascii?Q?9zHMmP4z5OOttyUv2MhacVRV/kwEh2n5JMz8yYYFLClhIkIje5Y9UQZjtZMr?=
 =?us-ascii?Q?q5Xz1xe5AJisFchp5F8sVbLtX7nXcIJCEmXEsL7UhSd+VZjIq6MM4Q6T+yfu?=
 =?us-ascii?Q?Bfg2KhHx3A+1H/6lFr7SR7rwF2p0Kd1xnGkpG+du+R44GFrhHFuqt4au69Sd?=
 =?us-ascii?Q?xnuv5Wlgu3/Gd/7qPE5yjAShcK5xpSO4DiSXfkWSaGv3mg0eDLgfOHDkxCvN?=
 =?us-ascii?Q?MIy9W4lnfAlze6BdJmR25AWJwFeE84+qPMk5tII2ZT7VFHI9dUYz6FSZuFOi?=
 =?us-ascii?Q?yuebrjcRiaQ2iTU5BmqHpu7V4Rj7FEfP99v9P5X6ylTgIHlB5XPo2M8Y8pK2?=
 =?us-ascii?Q?pF2o3Jd6miU4ef4QW6/ixi+RoacdRxffC1cac6BZFnuaSR7agSj1FyDvEJci?=
 =?us-ascii?Q?Rhijt85XVOHt9/0yuLTelTGLnCu5DUeEJt4WeERw9gtbDFG/7no+rcNTeGs7?=
 =?us-ascii?Q?YLKdnN3g/2jwGR5QRYQQj4cNVi8Wi9leHl14f2zwrM0Jxv32oPdzpQ7KiuEq?=
 =?us-ascii?Q?85l1Di/kyzw2ZJ/YxrzEhpJsrdMASjJTBC1SQ847enz0h2reUxe7t1mBjR03?=
 =?us-ascii?Q?qkF3864Fl/2dnUtV/B/UJ3c+QdYUvY7kEMW1nWzidRkxXQ2bTCInTywWPZKc?=
 =?us-ascii?Q?wW58kdIMCV+kHtJgGqXmF6QOLQg8B9Hy3F9gbOAo452jwV0jee60ZQv+4voJ?=
 =?us-ascii?Q?ce06abEp1tdh/xLMsoqtgIVX5YcHYBWU5FfImNphMYJD/DPeHtXN0MxoD5pU?=
 =?us-ascii?Q?tLEMD72oVBG8yrhMyhAs7T857EmW5TFNeczaS9sxaAlKNY0/1+MnzKHB8myy?=
 =?us-ascii?Q?qOrDpr2Zv1E4z05dB9KUA0mO0wkL/o0RtK7eQmlZrllFtmz3Ww0dfNNnW3FM?=
 =?us-ascii?Q?tIPGGBFOL6MpipXkip1uLJCqP8VGX6GJVoFf9C9abNHT+oz8wTr5MVx/7k9E?=
 =?us-ascii?Q?hrcc2ZgJadG2UeioCjVjeLb5/vv8iD/zW/tq8CMCaRlGXdJb59riI+cBHZ+d?=
 =?us-ascii?Q?29ELUp2n3kMPnA8IgjtqCgKBSjSS3jw7XX3c3v6BGK9aPyNpu622+bh/wPbb?=
 =?us-ascii?Q?gg=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 170ceaf4-9840-4bec-64b1-08dd7367159c
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2025 10:54:33.8935
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ow0e4F26Hjp68uTA1WPcyiOAXudlJLHbyzGuErp7IkyBZe98opouBvzzMvp3U096s60k8zBOf+gAWTD/rxOJRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR06MB8167
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Apr 2025 10:54:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116575

In order to facilitate using e.g. dbus-broker as runtime D-Bus
implementation, change the Freedesktop.org specific D-Bus runtime
dependency to honor oe-core's new VIRTUAL-RUNTIME_dbus variable.

Furthermore mark the runtime dependency as target specific, which
avoids unbuildable dependency chain issue when bitbaking native or
nativesdk variant of the recipe, when dbus-broker is preferred.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.5.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.5.2.bb b/meta-oe/reci=
pes-core/dbus-cxx/dbus-cxx_2.5.2.bb
index a10f7f22dd..992a414009 100644
--- a/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.5.2.bb
+++ b/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.5.2.bb
@@ -10,7 +10,7 @@ SRCREV =3D "f2637e726207ecfbdaaf02744e1b36e54f929c9d"
=20
 DEPENDS =3D "libsigc++-3"
=20
-RDEPENDS:${PN} =3D "dbus"
+RDEPENDS:${PN}:class-target =3D "${VIRTUAL-RUNTIME_dbus}"
=20
 S =3D "${WORKDIR}/git"
=20
--=20
2.39.5


