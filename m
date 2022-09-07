Return-Path: <virendra.thakur@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4C38C54EE9
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 17:08:06 +0000 (UTC)
Received: from IND01-MAX-obe.outbound.protection.outlook.com
 (IND01-MAX-obe.outbound.protection.outlook.com [40.107.222.61])
 by mx.groups.io with SMTP id smtpd.web12.1346.1662570483136098038
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Sep 2022 10:08:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=Q8nJ+WXQ;
 spf=pass (domain: kpit.com, ip: 40.107.222.61,
 mailfrom: virendra.thakur@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=STTEB+zwzohwIpvZkxFpM9HIMI7MbjO/8cnYA89hpzWWVdw2VoBa3KZg31tKdQFt6cAnEZbT8gJ7Onv/SxXcrcRpV7eBvswjX5c2FDyC+Ic1s2Yfqvu1fvZQ0XirXPXvVpikCgHOspkWrLKFnNYkSS8/xxU2iizZIMuKdOP+8djmbWZmPvhxojqw8+ymN/rd47yXw7hXhPJlXxWaVeA5+txCzUKwXAN0gYfRD2G2Z2jfEN/NnZz1zoImb972joYDJdSesclYBGeo1KBfz6ersej71RFH3e+HV89PrWD2yAOZb5F6sQKkLP4PSBmURt5s5DP1Uk9YVUuRFgTsemSSfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fnofx8VnWaQDiAa7FMsf6Kzs43830Dt4lHLhwIrH/Jw=;
 b=X5C5HjSTi8CLwytGv9FzFXxfgOn1jiSGOBA96vpuR96SBUl9m3TihLXUiBF4ItH/oiU5kPMMBfyREGRPSY/WvbYvQDx3dKIYnuD9jOfpyOJGtejjlgY8t+SOsOMbIcqNtWRDkhL8FVrbIAkTxqkdWHRehQREFwlgyb+GTSfjt2+sDg2HNR/WOKp7cvpRklBGk+10Yp7eSl0T6JGH6d6ebFZrQFrziz2GJ3wVPR7Cr/b42Y8scU2nFfTPjBkjN+d/9bRzDHGkI2Fh3X855SfZAWKVDcGtoxTYeeFIi0v7P3SfkFl1FpmB2C27kGzPeIqvsvFuxYOXjnJSDOvicfIZIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fnofx8VnWaQDiAa7FMsf6Kzs43830Dt4lHLhwIrH/Jw=;
 b=Q8nJ+WXQ9QHKzXOeR6m106Ecwi2eFBGjY7Uyh8Duc9T/27FO8vr+H8Zp1zADCsS4Qhh/jy9XDmxQ/xeLFOvUHrVxfAF8NLqCly7m55O+hzW/hlAQw9c+yGbmBpNnaVb05tns6t10XAmp//0zNbHXAEGArmAv6iIVWC6NxRBz+bE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kpit.com;
Received: from MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:3::12)
 by PN0PR01MB7848.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:c9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12; Wed, 7 Sep
 2022 17:07:54 +0000
Received: from MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::2427:1977:88:b63b]) by MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::2427:1977:88:b63b%3]) with mapi id 15.20.5612.014; Wed, 7 Sep 2022
 17:07:53 +0000
From: Virendra Thakur <virendra.thakur@kpit.com>
To: openembedded-devel@lists.openembedded.org
Cc: Virendra Thakur <virendrak@kpit.com>
Subject: [oe][meta-java][dunfell][PATCH ] classpath-initial-native: exclude
 BB_NUMBER_THREADS from sstate hash
Date: Wed,  7 Sep 2022 22:37:29 +0530
Message-Id: <20220907170729.31035-1-virendra.thakur@kpit.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: PN3PR01CA0178.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:be::12) To MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:3::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAXPR01MB4327:EE_|PN0PR01MB7848:EE_
X-MS-Office365-Filtering-Correlation-Id: 3eeb7d5c-b7ea-4530-814d-08da90f38081
Content-Transfer-Encoding: quoted-printable
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	R1GeUOch0Jy43OzNRE2R1jco6khL8UpexY39XX8cthMBw706q8/AdQKQ7gIjEP3+2HgCtpE5UlehPJmzS7bv7+dmnL+QHT8qk0Y0d6wXMqE6V5FOnIzP3AoE0P4RNwPGkPYuQgv7hwj2kV8oAfj+iJdARnljlIsr8f4xuegkj225rm/yKHshK3bRz5dIVMgKgTYracbacXJ7eeTSurgv500V9Z2SAfI5rLfuTcyixLDe/GCQxfhEYev1+IrUw1CcyQOuGpxyjQAQQJKfXIBR+SgZ51etT7fxCqRQ+Rc46JVwx5o508ejXnCuIui3UYK7kkzYsiXJGDkNb9lCUooy++ZF2YdelvMIJlyELI8aMnVvtger+TdcvsdarFfM0+Ne9zgxSypLSA/N9Er+vrWFv8uGgevOGuzdGT9DFFrQQ0DHpMT8Eo7GU32Un6iN55xFXMsyN5HIxE0OrX32aSvBwlJEWmnU5M9mrK1JizIAsTQmk6UU9In53RL1uHJDTeEVLgCpS74/UkPGpccg9ZWU2qH0N6mgLGV9L5fLHH5ZoXiGByuJtTKKPaf64r8OC0nO7c9wiCCOXHw9Yfq4B3k/7PyFncH/hM22CnCZrN0VzZKq0G7zBdn5/vBqBK09+B0fBAzTnfzJCQHqAY+y8kPy9+gItKuSQF4TlQ4D9JbIlXqmUa+rdFPL2wrmTfkO8eriROSTq4oc950gqyzuoJmZlt2eldYpgafi+wzQNW9BzXWkcmyIN9wGSBHw0/RkVpEd8bWUepxnvP67AM6vnxaSvQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(346002)(376002)(39850400004)(136003)(396003)(66946007)(66556008)(2906002)(66476007)(36756003)(478600001)(2616005)(107886003)(1076003)(86362001)(6486002)(186003)(4326008)(6506007)(38350700002)(38100700002)(26005)(6512007)(41300700001)(8676002)(8936002)(6916009)(316002)(5660300002)(66574015)(52116002)(44832011)(83380400001)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?oEy/nAaw9BKtZvEHbHuFDSU37ZRdNMGINyWhX7JIMEiUp317INEw2ZfnJz2N?=
 =?us-ascii?Q?kCPLm93p2Fym35E/opXYSDZBPgwHAUYzKR39odI7fUS3YtN3NzlnPdEkny6m?=
 =?us-ascii?Q?3X/8w2KbR9u1/ruBodkCuNVWMBh7GNmamIm34y8zu57dYAOThHKGfWg0sqHM?=
 =?us-ascii?Q?1DMxZ238xKPd+oTmMBPEW6vpOFpy3vAXTPVVaNLd/2PyrmixguaJp4oaIdo6?=
 =?us-ascii?Q?oHWRhdoFLQrFtc3QHqD96Dj5pbRxMTObvHe3EwbScddXqxAgUVxTbq/dGeSS?=
 =?us-ascii?Q?fS98Zbh9Ldau86BVSEBUkABZVhoREN9d7hRYa9C9DUAbATpLWsSoNhU/1f4j?=
 =?us-ascii?Q?HGi4n5DOqv5qRmBU19MnyXnffq3isg7BYG/AjaAAniKXN2SB8/pmDfVJTbnk?=
 =?us-ascii?Q?91Iq0kCBIoZNh3snKmPCnB46zAVYeQFwR8MDuwVXkEwA0zzDR+nDCyhw+8iS?=
 =?us-ascii?Q?RXRObrhWZ2Ql6uothhPE+2Ex8WpJaQh39XdTcOWwDViT79M57E7mmLWQiAr2?=
 =?us-ascii?Q?y5TVIu9OQMdTzsatOpqH4o9Ff21TzQYPyJUIydngNdLJ3NoJLnKJPzCmc3GH?=
 =?us-ascii?Q?0slflvtsJdyRGHD6JQFyZoa+QOW390xYzaiKYxHqNhtJZU2V9/1ug3am+P3Z?=
 =?us-ascii?Q?RQQwmpagrslewFZekQM3jq6RuHlAc+VP7U+k1YIttscObQ6NoZ/OQNhf89dp?=
 =?us-ascii?Q?Dj7pepcYdf5VTJnmlPbgIDgmn7zqFAP3GhDtgxuEWenG/DWP9H0LN/83UTHJ?=
 =?us-ascii?Q?tINdMzbXf99bYGDCFKUMjO+yWLVshqfp/OJ+e5tliCtk3xmFwUac0ihQb36t?=
 =?us-ascii?Q?VKrN546gCzV7lgjZBpds2FJeTN3q4xsUvE+Xs58W4/lf6lxz93W7tgG8xQjr?=
 =?us-ascii?Q?usSm0mzkYYwogRDAVd9ZqeawKe1ThhP4VGVBN5oa/2WK4vL4NQ7pNWP/qZV2?=
 =?us-ascii?Q?5D3x104l4zYo5clzICfCOvWYEI//gXmGS9l+kZXhJRhuN+Mk1I66BE5cWAI7?=
 =?us-ascii?Q?Rhtc9SG3qM6lDrqTKTmslMjrYHpgmqZrxh1Zka1UYCbIMK1VWnq+Qhhj2lOG?=
 =?us-ascii?Q?BuFHDyNgDqqSj21UzCYUiOBPPyOB6QMa+x4o6sjxjJhBNMpsHr+hEpo0z4nG?=
 =?us-ascii?Q?aBkxIZre/+hBwgiQEu94UpEXth8CzWR7kOARKxGolImrnnS9SD48oL5ytEPd?=
 =?us-ascii?Q?2fmhd9tCr+wQdFfmmZfFPpfFUWPdW/usWEiRuGwkcF9K+VRbPAMUNpHSxQxB?=
 =?us-ascii?Q?Hf+HNxJLKisxyIT4JukELn/4WkPuN8xtcXz1JEBZYysMscuvuqD/bOCiMEP6?=
 =?us-ascii?Q?DOU/+JY4hw5uGsiSb+RiyrnbCAmb5ZxdSOq14ZBkgTLDWdm6AF6Rn8rX0UL/?=
 =?us-ascii?Q?08XOyICWwl2sJnilTlDsw0jWfVALUTOH2zdKWBaKnxq6Mx59oqMQO/KaMFq6?=
 =?us-ascii?Q?7UoumBMeHHQb3VshWayDj9+dmxjDT7/74zsA7lVrRK76s9KIp2D1JPCyXfMq?=
 =?us-ascii?Q?wMioq5aoTO+VMh7/QTo819tVNFiU+RN8hk9xrrI6eMdQ9LnvrsRlF86MjsKZ?=
 =?us-ascii?Q?96xhrKZEs1XI0z17wMBnc0cvu1FqcRPEepk1gEn0?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3eeb7d5c-b7ea-4530-814d-08da90f38081
X-MS-Exchange-CrossTenant-AuthSource: MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 17:07:53.7206
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 lJ0ufyICKPN5sp1l/J6QmFHa/lIe0wakU8LUIC3Pyan3xO0RhLhpfqZvKaoLjHGWgE/1mBbPUhsNcmhrgo8e8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB7848
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Sep 2022 17:08:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98689

From: Virendra Thakur <virendrak@kpit.com>

The sstate-cache for classpath-initial-native is not shareable across
multiple machines because the parallelisation configuration of Bitbake
is being embedded into the sstate hash of classpath-initial-native.

Exclude BB_NUMBER_THREADS from the do_install sstate hashing to avoid
this issue.

Commit message adapted from a5257d41f32812bc9426183cc8d2b6f07617b0d5.

Signed-off-by: Virendra Thakur <virendrak@kpit.com>
---
 recipes-core/classpath/classpath-initial-native_0.93.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-core/classpath/classpath-initial-native_0.93.bb b/reci=
pes-core/classpath/classpath-initial-native_0.93.bb
index 7bb1ca1..0f97bea 100644
--- a/recipes-core/classpath/classpath-initial-native_0.93.bb
+++ b/recipes-core/classpath/classpath-initial-native_0.93.bb
@@ -28,6 +28,8 @@ EXTRA_OECONF +=3D "\
 # Ensure tools.zip is not installed at same path as classpath-native
 EXTRA_OEMAKE +=3D "pkgdatadir=3D${STAGING_DATADIR_NATIVE}/classpath-initia=
l"

+do_compile[vardepsexclude] +=3D "BB_NUMBER_THREADS"
+
 do_install:append() {
     # remove files clashing with classpath-native in sysroot
     rm \
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

