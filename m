Return-Path: <ceggers@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F3D9C4829B
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 06:07:47 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.88])
 by mx.groups.io with SMTP id smtpd.web10.1151.1707718058762926422
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Feb 2024 22:07:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arri.de header.s=selector1 header.b=C3Bkb7mb;
 spf=pass (domain: arri.de, ip: 40.107.8.88, mailfrom: ceggers@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cAGq3a7qkSmpg4fmyWrrS3e3Pb/ec433EkTXkp0uDBlPp1kcxAZIlr8TM/4W25yQuK985s5z2UQsEfXN7fs4tMze7LUsp/CBuAcEOhzPlP9YV4COrRNuOhM5ag3gi+NE+V+CEOrstIiTMZEliORB+5IBlONehrkEWlZXWREmJDklyPkjzRbMq2N1PamyDn4cUwZNRrhfiK+W+emIMsFjyJogAkgxAM/v1Q4YVp34Xct4EzaesqlOm+GjwPfniONZ0XDMc2nt6OEqiLy/hM9ROfJsvAQZsR3lWYzh2Cn2lXOThcI2XKA98bqcMTEQHuGsKqSbDgKlcZGEb+1eGXBVcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dy1pems0rde95d+wwcWdFw1wdtEeW1LoDZzWe/Iu0vM=;
 b=ZqBUdFV4Ta9duY7BLp1cAM+TB/aP5PpfffJl46xotIfcAx9e7KB/MrndY071DnY71EuJAy8SttnD46yOxgI0rBTlxedh4GZI+XzCtzO99HoZ8OgQgTFf4Ootm5OIv/K2QMnbs61dLb0Qf1BpkIhdWujZZS5cmBdMBO4TnE1/5K7IiyFIKYZWvaDGVovPCEUbuO5mIywptTAsuIlW9BOWPn/4lhnHfk6iEIn2QFNBoJ0Thg6I1aoX4nJS0HYKbemKq+nIKhMbNXPTQv9GgApwLRGD/caJamdRYWj3fElstx4iaUsJAUi69JayF3zVBdZfL49J/PeFFfn/v7w9UfCWcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 217.111.95.7) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arri.de;
 dmarc=none action=none header.from=arri.de; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arri.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dy1pems0rde95d+wwcWdFw1wdtEeW1LoDZzWe/Iu0vM=;
 b=C3Bkb7mbhg69M77AUvReJGToVPSeJu3aOyAFHgvSzkekBQTz6Kl6Inz8i4OjyDkCDPlTrmWEuM3t05ei01r0Dgypr2i9yHiLjcOvx+8XmOoDWMC7tqs6w4puQ2HAkI/c3MiRLGLeHGiPYjbIKxvb5URXFNvFqCDbzJBr55Zd6J4=
Received: from AS9PR07CA0055.eurprd07.prod.outlook.com (2603:10a6:20b:46b::14)
 by AS8PR07MB7623.eurprd07.prod.outlook.com (2603:10a6:20b:289::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.35; Mon, 12 Feb
 2024 06:07:34 +0000
Received: from AM3PEPF00009B9D.eurprd04.prod.outlook.com
 (2603:10a6:20b:46b:cafe::fc) by AS9PR07CA0055.outlook.office365.com
 (2603:10a6:20b:46b::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.17 via Frontend
 Transport; Mon, 12 Feb 2024 06:07:34 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 AM3PEPF00009B9D.mail.protection.outlook.com (10.167.16.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7249.19 via Frontend Transport; Mon, 12 Feb 2024 06:07:33 +0000
Received: from n95hx1g2.localnet (192.168.54.31) by mta.arri.de (10.10.18.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.28; Mon, 12 Feb
 2024 07:07:33 +0100
From: Christian Eggers <ceggers@arri.de>
To: <openembedded-devel@lists.openembedded.org>
CC: "William A. Kennington III" <wak@google.com>, <wak@google.com>
Subject: Re: [oe] [meta-oe][PATCH 3/3] nanopb-runtime: Enable shared library
Date: Mon, 12 Feb 2024 07:07:29 +0100
Message-ID: <2723178.mvXUDI8C0e@n95hx1g2>
Organization: Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
In-Reply-To: <20240210005921.1909326-4-wak@google.com>
References: <20240210005921.1909326-1-wak@google.com> <20240210005921.1909326-4-wak@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [192.168.54.31]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF00009B9D:EE_|AS8PR07MB7623:EE_
X-MS-Office365-Filtering-Correlation-Id: d8c5e7c1-fa30-4a68-80f9-08dc2b90e769
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zEO/afMb++i85ht3+oyiRxxz8zrlPWVZ2ABA+8EONXxsw/F5pbA1CCX8I2SXWJgGRAEPqOQZwmPUAOm0VgsAStaqLbQ5tYOYwUehwER3GqpG0Pt5oIHJx5yQb8sVqlDH9KpksmgfYc1xGC6s5JtS7X1LjIRwqMoA/VzqH1cXwv23IyVjshMAprZWUFpHTKaW8ETpSz1GqYe3T4ICg5nMglZNhhhCctS8a6L/4SPNF2KBES0WYupkX0E79AOr+AqMUWDyV7bEWHL8LPgMtiD+BWjegb4G8ZTyLv0BrvGMaZZHEJ+/cpq4Kz4lrOeONat/zujkkYofksZ1geakB35lsp7AsCg+4yLzbT3u+1OW+YDEb68+dzkcBMlFWkNlmL2g3yUGOiliHo0Ra6BFQaNoGWk+k3SqzVUxviTTg9Y08O6tG+78cYnSfrzxlXSTB8PXdXxoZJGa3hMqAuFb1Ch5BjD3ejw84hUtlBebHLnuO+AFYkRa7MamkCKPaSLLL+AA1RdQ7QJ6GmGhMGP+2QpIGup2duR0ZKex4f46gZQLhDXT+91gnAycX+2Pw+kjECUDOkVq9h0uWB2I1GA7+NsObEtlJmhof6Pr8gjphi0zMbo=
X-Forefront-Antispam-Report: 
	CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(376002)(396003)(136003)(39850400004)(230922051799003)(451199024)(1800799012)(186009)(82310400011)(64100799003)(36840700001)(46966006)(6666004)(9686003)(478600001)(426003)(336012)(16526019)(26005)(54906003)(36916002)(2906002)(5660300002)(9576002)(70586007)(70206006)(4326008)(86362001)(8936002)(316002)(356005)(6916009)(8676002)(81166007)(82740400003)(41300700001)(33716001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2024 06:07:33.7035
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8c5e7c1-fa30-4a68-80f9-08dc2b90e769
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[217.111.95.7];Helo=[mta.arri.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF00009B9D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR07MB7623
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Feb 2024 06:07:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108705

On Saturday, 10 February 2024, 01:59:20 CET, William A. Kennington III via lists.openembedded.org wrote:
> Some users would like to be able to share library code between multiple
> applications without embedding a static copy.

Some CMake based recipes have a PACKAGECONFIG for this:

PACKAGECONFIG[shared] = "-DBUILD_SHARED_LIBS=ON,-DBUILD_SHARED_LIBS=OFF"

Particularly for permissive licenses I personally prefer static linking
due to performance benefits.

regards,
Christian

> 
> Signed-off-by: William A. Kennington III <wak@google.com>
> ---
>  .../meta-python/recipes-devtools/nanopb/nanopb-runtime_0.4.8.bb  | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb-runtime_0.4.8.bb b/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb-runtime_0.4.8.bb
> index e36abf808..e43931a4e 100644
> --- a/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb-runtime_0.4.8.bb
> +++ b/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb-runtime_0.4.8.bb
> @@ -2,6 +2,7 @@ require nanopb.inc
>  
>  EXTRA_OECMAKE += " \
>    -Dnanopb_PROTOC_PATH=/bin/false \
> +  -DBUILD_SHARED_LIBS=ON \
>    -Dnanopb_BUILD_RUNTIME=ON \
>    -Dnanopb_BUILD_GENERATOR=OFF \
>    "
> 





