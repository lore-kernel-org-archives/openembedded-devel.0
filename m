Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DE78C4332F
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 22:14:31 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.77])
 by mx.groups.io with SMTP id smtpd.web11.34311.1699395263401129845
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Nov 2023 14:14:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=z1011t0p;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=z1011t0p;
 spf=pass (domain: arm.com, ip: 40.107.20.77, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=hLDb8jgdDoJxUe9sLyeX5G6LdEF6jsYhpq1UU15B7+EuXxO0uH7fIdH0diXStKKoxpcV/xq279jc3+fcEKiMKTG42TD76vIMdhefJx1uQ3dM1ru8wvaB2JW0JwwkrvQyfSZGjZi0wztUnErCxoWP/Gf2OJEhYF/xsKT251L/y2LE8TUkGtInB8FTf54H2s6r3WUs8GTnh4KGoIB7F2cGqVEBwBST+k47hgRsfh4OmaDIHhLHkGQ+OWVlXobMEQerSHFJ4PmCrMdfweqTpshNGi1KIcEad/ETP3TdLIe8kTyIomTVzBM2+E2VeloAGcOE8GT2ZwpwFLeF0k2WObGY1w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lu+TGd0cqTxraLCiXVVgVPC7aY4/+JpVYhbygn4oYEQ=;
 b=nfk+OJbhjbgz4JzQ5jYdpUsv+/qvWa6JM+ddF1uC+25ugwR2lofnm5bRcKCrdUyA40gpbvizrQTLbni7aPgQUJsgT5ved3u0rPeExsX1ocBDLqM9eqiNbrc0UCiTzftpoX1hKN98awjAGUkvtBx2ZasRaeu9alEO9oWgSOYviTif2NL8PtLvG5268NeinkBwUHLTc+y/ajchYy8uLjNpRvNkwdhcAOR/l+fdUXhq6scZfJPoBchlmVMzuEVQS5Y9WTeQDFwfIbOC5MfPH1KNoeh+79iPr6/7inK/ZittHI1a32NgayQkU/sbXCkm5SEV4qLTfu44KkCERWO4eJilvw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lu+TGd0cqTxraLCiXVVgVPC7aY4/+JpVYhbygn4oYEQ=;
 b=z1011t0pH4ZvM49jUvwszadT329IsaOSPNelNpaofhRYwRUDyfBXp8bf4TMxtCFGFQkQUb4ghmW69vLoz8g8cVJHoDDamGHgdZacRxhMDU5/KWTcjUUfLegA5Il2OE2gCMjG5bEW33A/2ySI0IStnWsMsoZj2MSUt5xBqV+HqTQ=
Received: from AM6PR10CA0010.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:89::23)
 by DU0PR08MB9680.eurprd08.prod.outlook.com (2603:10a6:10:444::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Tue, 7 Nov
 2023 22:14:20 +0000
Received: from AMS0EPF00000190.eurprd05.prod.outlook.com
 (2603:10a6:209:89:cafe::6a) by AM6PR10CA0010.outlook.office365.com
 (2603:10a6:209:89::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28 via Frontend
 Transport; Tue, 7 Nov 2023 22:14:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF00000190.mail.protection.outlook.com (10.167.16.213) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6977.16 via Frontend Transport; Tue, 7 Nov 2023 22:14:19 +0000
Received: ("Tessian outbound 7671e7ddc218:v228"); Tue, 07 Nov 2023 22:14:19 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d735c5715b51db1f
X-CR-MTA-TID: 64aa7808
Received: from 4ca14dd263d1.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id DDB9A23A-9D08-400D-8ED0-D083683C4BA7.1;
	Tue, 07 Nov 2023 22:14:12 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4ca14dd263d1.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 07 Nov 2023 22:14:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cmYhat4y04YDAHhbvSCufrOxjU5mOFs4m6sMW1+AB1TzEeBwGEttpmjI9Iu2qxv+SMP+qOetKowAJSf1xwBoxrOWOHXINg6NrrUBMA2E5QdKxok0C//wB8hC9SOzmRl+pfZrE6MV79enK1ULqHcsb90HlKOnMg/ekfLiJhXWQwowjW4oGGh87nSNnD0JAX8xf0Awn1ubzv1MguV2owJykvzpSmLdIEOJPBxcVi5yP4muUOmnLZi3s8QkzTAH/CJp8KFjroh2AG50XjO6nAaGlJPN0NflF5NwTkpPeRaN8G9Xjfz94OjHudE8dyKGXU4XguYyJepu/29xAZgGzL4xfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lu+TGd0cqTxraLCiXVVgVPC7aY4/+JpVYhbygn4oYEQ=;
 b=I3H+leHSgPk58u4a8hqM1scKqxxyV96jNsjU4UfyAG45HA5uw6amWPfUlDodJPinFap0H3WNBD8xMQlG8MQQEPcvX+D48zHaz1BFBOumbNfEaiyePCeEEUtNkJFlRsx/RrxmQB8P7d0lZFgITwCN1fZWoFHPzwR0ycYRgxMHPAp7iNm2AXM7WCENmUC5GddaxkDlo8vgTdMEwDLZutSdW5H/tWIsOamhKc19j7vwACTWKmaZmRUgSf2MhERx1JEzDcoxIusMX6rvtkOlfZu1Ad7n6cAyqIt0ET6DBOABhy8HOkFT4zZv4Y6YIUPb2BNh6QllHiDsxlk/C+dnhbCQLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lu+TGd0cqTxraLCiXVVgVPC7aY4/+JpVYhbygn4oYEQ=;
 b=z1011t0pH4ZvM49jUvwszadT329IsaOSPNelNpaofhRYwRUDyfBXp8bf4TMxtCFGFQkQUb4ghmW69vLoz8g8cVJHoDDamGHgdZacRxhMDU5/KWTcjUUfLegA5Il2OE2gCMjG5bEW33A/2ySI0IStnWsMsoZj2MSUt5xBqV+HqTQ=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB7337.eurprd08.prod.outlook.com (2603:10a6:20b:444::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.25; Tue, 7 Nov
 2023 22:14:08 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::d066:526c:84ed:fb05]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::d066:526c:84ed:fb05%5]) with mapi id 15.20.6954.027; Tue, 7 Nov 2023
 22:14:08 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "Joakim.Tjernlund@infinera.com" <Joakim.Tjernlund@infinera.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [PATCH] [meta classes] sed -i destroys symlinks
Thread-Topic: [oe] [PATCH] [meta classes] sed -i destroys symlinks
Thread-Index: AQHaEbiDzMRCmgoEw0WhtxtMH4SlnrBva/QA
Date: Tue, 7 Nov 2023 22:14:07 +0000
Message-ID: <02BC91B1-A3DE-419D-A1AA-6F73A3A7D1AB@arm.com>
References: <20231107202439.2647261-1-joakim.tjernlund@infinera.com>
In-Reply-To: <20231107202439.2647261-1-joakim.tjernlund@infinera.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB7337:EE_|AMS0EPF00000190:EE_|DU0PR08MB9680:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ba9241e-dcf0-4fba-9fde-08dbdfdee3a7
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 ihiupJ5R6+wVeZB/s+OZT7Lfw9ei+A917pfbvKWQvzhj+jLEL7z1z9YQsDHaOr266Xyg6P0rN7lbXtw00boDguQd/OJb7br3pnQh6mZA9KfxiUPcl8pD+o/0ioa5KX1RRxa5CnShpCYsEZ8TVE0lPaFYCW2DxL6jTttlwF3dfE7LfgBv/gdDwxwfiasVgSaawfanrXZTMKdghXNzo02RpTpmZKRFjzqXreC6sX4Mj3XNhyRiTCTBFamp9MIDNQaLdQnUTF3HTRJ2Ks/21nJPM5diKTwUMAAU6+sY2FhOKUg4iddfkp+5pYdPH1vCwEUaDoAwkT3yjbcduRjOrrMIYwTRMoHNArVeAHqhlRQmJ/DwbR2NmVJbtwsziuUWIU2tq74TbN22RfZpb06LMWtd5DTY1gb3doOqn5ox22HmAomysH2nTHpvAm90sXv84fqrKQUKyNIOVQTQhdjIzgeh6MaCTkCLCWFXhPNh2PIVzKF34QWUnBCpe9CyrotVHOrZiI7LIbllD2TpXHJLb8hVG4ExXeVU9ZNpexeUyFNQwnibPFEEiK6Yqvwgj0qaHdQmVBZrpFiOa8anyPl0DwQbUUQXGO5aEO6d65GRYpj3ndwYQAyySKjZQ6SPqpVhooDtImTUQe7a3zQ2l7bqmsP/+g==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(39860400002)(376002)(346002)(366004)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(2616005)(66899024)(66946007)(66446008)(64756008)(76116006)(66556008)(6916009)(33656002)(36756003)(316002)(86362001)(38070700009)(38100700002)(122000001)(6512007)(83380400001)(66476007)(6506007)(71200400001)(53546011)(478600001)(966005)(91956017)(2906002)(8936002)(6486002)(4326008)(26005)(8676002)(5660300002)(41300700001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F05C8FDB099C0F4D8DABC7793A4B2711@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7337
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF00000190.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	dedc29e8-88ed-4841-3676-08dbdfdedc5b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CGeUT4a7gzu9tVq0fsPel1zHLuxeNDDMQfwl67YJn2BOyQOhyCzI0yfOIHOJIwRmxsm/yt9fyfW/h1xJf1WPv4V9DPrguWrOT5xphAK9wHD220W/iVHun2C3P4qrC8gV3PrYbN25Ujl7GEbKI8WWxKwKBZHZKOvRp8PrhdBl6IbHdSUtEcBabToOLWYsjqKgk4HYrdbCX7MGzNrdqq7HQoWrjL+8sDB7VlF3C2Hk+KMrKhoBbcmqeVZ/prj4wW18PCLPjA/4FWqwtVh63BKhx0kk96l9mhB2SdDV7Ev3P0TU8SfTisjdOJOKSxuixDAUlaLciw+j4jjPe/bWAlYVl+vorfOja3h3wGkFLpSZjC/+sLJyotSnuvopy1p95dM3p+MhB/9DfhUXkyeTtMsGQZbgetpvR1+ueEDViRMFVrajlx7DU0dPT3rePPh3DSyGvl+jJW3ngAWkP6VnSNhevYGKWBSentBHxlc4dd5U7sqWCX3zvuvh0caTxMkTE/C/CJZaXjD9iGKAusF9cUXTzK4kVpMJOZn8v9fmRmWMvK/ic2yQ9Pok6ubcanRBBYl3CxyDrqlq5+/KgBMSw7YuWxCJ/vQ7dCNu39qA4H7tv397HLTGq1+QXLsM9kStdIGb1xSyLQoeW1yQ0NItZifh5UKOCBwOuoiUVOBBK64HSxdqOmN45o9woxfzSEX0sNYzQLiwf4n4HlIFJOXeSdkFiJjJmGxgv8ZuDqYOqlfV31E=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(376002)(346002)(396003)(230922051799003)(186009)(82310400011)(64100799003)(451199024)(1800799009)(36840700001)(46966006)(40470700004)(47076005)(36860700001)(83380400001)(82740400003)(336012)(81166007)(478600001)(6506007)(966005)(6486002)(70206006)(6512007)(70586007)(26005)(2616005)(356005)(5660300002)(2906002)(86362001)(8676002)(36756003)(33656002)(4326008)(41300700001)(6862004)(8936002)(316002)(66899024)(40480700001)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2023 22:14:19.7579
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ba9241e-dcf0-4fba-9fde-08dbdfdee3a7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF00000190.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9680
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Nov 2023 22:14:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106462

Hi,

You meant to set this to openembedded-core@lists.openembedded.org <mailto:o=
penembedded-core@lists.openembedded.org>.

Cheers,
Ross

> On 7 Nov 2023, at 20:24, Joakim Tjernlund via lists.openembedded.org <Joa=
kim.Tjernlund=3Dinfinera.com@lists.openembedded.org> wrote:
>=20
> In /etc/passwd is a symlink, sed -i on same file will replace the
> symlink with a new file. Prevent that by expanding the file with realpath
> before giving it to sed.
> ---
> meta/classes/rootfs-postcommands.bbclass | 4 ++--
> meta/classes/useradd_base.bbclass        | 2 +-
> 2 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/root=
fs-postcommands.bbclass
> index 5c0b3ec37c..55cc863dbf 100644
> --- a/meta/classes/rootfs-postcommands.bbclass
> +++ b/meta/classes/rootfs-postcommands.bbclass
> @@ -148,10 +148,10 @@ read_only_rootfs_hook () {
> #
> zap_empty_root_password () {
> if [ -e ${IMAGE_ROOTFS}/etc/shadow ]; then
> - sed -i 's%^root::%root:*:%' ${IMAGE_ROOTFS}/etc/shadow
> + sed -i 's%^root::%root:*:%' $(realpath ${IMAGE_ROOTFS}/etc/shadow)
>         fi
> if [ -e ${IMAGE_ROOTFS}/etc/passwd ]; then
> - sed -i 's%^root::%root:*:%' ${IMAGE_ROOTFS}/etc/passwd
> + sed -i 's%^root::%root:*:%' $(realpath ${IMAGE_ROOTFS}/etc/passwd)
> fi
> }
>=20
> diff --git a/meta/classes/useradd_base.bbclass b/meta/classes/useradd_bas=
e.bbclass
> index 7f5b9b7219..72732a4d57 100644
> --- a/meta/classes/useradd_base.bbclass
> +++ b/meta/classes/useradd_base.bbclass
> @@ -154,7 +154,7 @@ perform_passwd_expire () {
> local username=3D`echo "$opts" | awk '{ print $NF }'`
> local user_exists=3D"`grep "^$username:" $rootdir/etc/passwd || true`"
> if test "x$user_exists" !=3D "x"; then
> - eval flock -x $rootdir${sysconfdir} -c \"$PSEUDO sed -i \''s/^\('$usern=
ame':[^:]*\):[^:]*:/\1:0:/'\' $rootdir/etc/shadow \" || true
> + eval flock -x $rootdir${sysconfdir} -c \"$PSEUDO sed -i \''s/^\('$usern=
ame':[^:]*\):[^:]*:/\1:0:/'\' $(realpath $rootdir/etc/shadow) \" || true
> local passwd_lastchanged=3D"`grep "^$username:" $rootdir/etc/shadow | cut=
 -d: -f3`"
> if test "x$passwd_lastchanged" !=3D "x0"; then
> bbfatal "${PN}: passwd --expire operation did not succeed."
> --=20
> 2.41.0
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#106461): https://lists.openembedded.org/g/openembedde=
d-devel/message/106461
> Mute This Topic: https://lists.openembedded.org/mt/102450721/6875888
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
oss.burton@arm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


