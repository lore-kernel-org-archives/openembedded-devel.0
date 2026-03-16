Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF262F53D8E
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 19:17:20 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com (PH7PR06CU001.outbound.protection.outlook.com [52.101.201.55])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.59105.1773688632127550950
 for <Openembedded-devel@lists.openembedded.org>;
 Mon, 16 Mar 2026 12:17:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=qXq5xiuh;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.201.55, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q6DcZIQSrVtLIxKb8DROC3BAPT65qiL0qc5//uIAZvG6DigB+ZtGq8wMUd0I6hytcl07+9yyfSq40Rl5HNKARMGLPB1XlcFkZuvi6AwxMl1s/0l2u0Z8UJ+/B9wtMWdb5NPs0kCur20kWiJnpRTgTDqkhrgIUvF2uwT9DjFP6zxnSu6dPuJrfKeF6ewh4FVc3tl6KUri5SRFZZuCXYdSO12q+HhBKcwIMAr/Fug7cxZ/5Q5Us1Qvenz3YDmaD4xMnBd4B9CGT1hKv2l6QCkbWy+jW3P6EdRyvEvZ6iqsxwHarfPZXMywoMg1x2N/4w+WE3zNiYasxOS/rO+pxYip8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kkhtTi2mUz6Ad6Dm/99zkK8+b40n9EWC6Nh2+zM1ZyQ=;
 b=ECY5CVqqONyPNgf/Jx11UEEQKjbH2wVVHOni+09cJM3mTAWn9ANMO0pcI4bG5ouxEpJafmmEckwKTPZ+BPfQQfLULEuZBk4wncQgG8ICJSgPfU51sr1yd8BALyCbWSBo4ijvInvSD7aON/dYf8hNHlIn2i4LWyp3xF2CJbZGBGaf4Urm3pI4RcAVwtImfogDp5CCPgjWaRlyLVsOAClbKIzEzv93QbwsX/fSdch8nR8q2YFEoO+r8Hgr1kpveQ8N3gbbpAHeRfkty9Zb4Lg3TpDzIZYmGRPNmnE2+HQonvVGN2MoL5HYpKMRXUglOlsxnZjVLFEKNmbDDIZEiqSPvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kkhtTi2mUz6Ad6Dm/99zkK8+b40n9EWC6Nh2+zM1ZyQ=;
 b=qXq5xiuhxS2PYyZh45uNt4dEVQXKQJuF33nzeB0gvLUHY/etBGsBeuTNRUA5yc1eP6Wg/1cgHTIKfqtDotOHawtjc7vnxN8qj/gr3SkmNt7hwWoFSHfSWBLoVjRLpqnNIe1pjyvGGeoyIW0kbDuczgiSKsVIPIJHAbdbpuvKJwU=
Received: from SJ0PR13CA0100.namprd13.prod.outlook.com (2603:10b6:a03:2c5::15)
 by SJ0PR10MB4654.namprd10.prod.outlook.com (2603:10b6:a03:2d2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.22; Mon, 16 Mar
 2026 19:17:10 +0000
Received: from MWH0EPF000A6731.namprd04.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::ac) by SJ0PR13CA0100.outlook.office365.com
 (2603:10b6:a03:2c5::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.24 via Frontend Transport; Mon,
 16 Mar 2026 19:17:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 MWH0EPF000A6731.mail.protection.outlook.com (10.167.249.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Mon, 16 Mar 2026 19:17:09 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 16 Mar
 2026 14:17:08 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 16 Mar
 2026 14:17:08 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 16 Mar 2026 14:17:08 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.39])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62GJH8jo1816917;
	Mon, 16 Mar 2026 14:17:08 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 16 Mar 2026 14:17:08 -0500
Message-ID: <DH4G570ID0LD.1IS5KSPDMXJ5I@ti.com>
From: Randolph Sapp <rs@ti.com>
To: <rs@ti.com>, <kai.kang@windriver.com>, <raj.khem@gmail.com>
CC: <Openembedded-devel@lists.openembedded.org>
Subject: Re: [oe][meta-xfce][PATCH] xfce4-session: update for emptty
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <189B995EB7159C24.1328210@lists.openembedded.org>
In-Reply-To: <189B995EB7159C24.1328210@lists.openembedded.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6731:EE_|SJ0PR10MB4654:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d1044cc-c30c-4d2f-415f-08de83909efc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	QbScaVuAs4dP3ZQJ99zjIyJsY3H/dEQl2yjgItbaco8Iq3/0lch0te0c+1U8bNG8lsg7TtL8EcboTY7Vr5yTEVD4ODiDbryiInrt9BhhPEvtHRM38rbaEwmj8ZlSOwKDjpIx4oJZQmGi828gYoJOSEKbh3J6bsjdgjXY61W6gmToeF3+NDYhzX5z3EnmjUwfOAGAzP/QS8wzVWIC3ja/+hLBkHEMzWRCi+fKM8kZ4+ekL60pMbFzWZZUYEzvNN2VL7S2HQzTCCorJbK0m5LfcrClwSVK04Tprngh0a246SPnFlsDTlTY/aeaf4Hb9u0rvXPTCWa3C3zlK8H1jXilX1gDzQs9z7Pg6HTzgi2d2cZ+T6vcai0QTXqfwGrgdHzzuQAMgelNpejOBS0d3yDnaC2Ako7iDvTGjODgr0sGZzAsxyE0oEQX0Qm5ZUUxAvNqTYSUBNly3hoteNjcmxZTtV4pgqNxDuusX6gJPHlRnkhUP7oORbpUlCppBAoH+quFQu1Pjpo5o9x/0izbxWg9cQWJCNN3kdDnYCk8FOLtDUlNVakxZvaCrdFbVcG+qjeRztE0cns9MOlFJefh5CkY4oW1UOO2UTGcw6Gn7xjP0QgILqSmmtZgMDu1GoBI/16TRgyYuBMWnauWsT2tDNJjkVWUlbjI2bDfN50XrzsvW/oGVzQPJY0XtPpPqFaLdTOGXnU2DnogEixgwZwwJoKRx6i4ol/Mx2/1E739aQZmN2DhX/AOv0VThLYnqYP0CP3VH8MofDNYU1mix4ZhMJXHwA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	lCLYrX7RIH6A3Ozxus1riOCx6BQXUHZBWKLbVkvDHTsJoeShUN6lCKABOUnuiM/sZxr/n3js+f+a9F4gSCMqnt1D9APXtjS4D6hyNagTwyWTeUHzyTcNAmuYIUOMc1u/J5cKrn9XY8e+zCgqU/6chWTwKTh+ejO2GF800hTpQkLTfDS6zYA7ZRlIEO/9b2PmBAzqq0Qq3r/2JYRtj8C/kaS7PO8BqlHEKC7SSzt+oGN1u3JybVa5ZuaNfLbGa5LzEQV22wPdr6LGdt6n7sbq+l3xN8vIdx5OQcA9ntYgH2cGRLIPgfmbDsBxwzjGNSXWUMXjg3Z08HgrGpUmwOAQQKEfMEojZo8wxq7507f3Ox1zxNVIA8b/k5JHIxLMqTtc2iD8MVPE7vzOzzL2VgirkFWOZ2NUd4bZkzK2lKLRmcUgc6CplJBcmng+Ox0uSMuf
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 19:17:09.7694
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d1044cc-c30c-4d2f-415f-08de83909efc
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000A6731.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4654
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 19:17:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125284

On Tue Mar 10, 2026 at 4:51 PM CDT, Randolph Sapp via lists.openembedded.or=
g wrote:
> From: Randolph Sapp <rs@ti.com>
>
> The x-session-manager alternative link has been removed. Instead a
> distro should choose what the default session is by using the
> DEFAULT_SESSION variable of xserver-nodm-init.
>
> If the default session cannot be found the user will be presented with a
> menu to pick the session themselves. This relies on the xsession and
> wayland-sessions desktop entries, which XFCE already provides.
>
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>
> Sending this now that emptty has been picked up on oe-core's master-next =
branch.
>
>  .../recipes-xfce/xfce4-session/xfce4-session_4.20.3.bb      | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.20.3.bb=
 b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.20.3.bb
> index af7ab98ae5..3690078daf 100644
> --- a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.20.3.bb
> +++ b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.20.3.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fc=
e4486a80fdaf4a4263"
>
>  DEPENDS =3D "libwnck3 libsm libxfce4ui libxfce4windowing virtual/libx11"
>
> -inherit xfce update-alternatives features_check
> +inherit xfce features_check
>
>  SRC_URI +=3D "file://0001-configure.in-hard-code-path-to-iceauth.patch"
>  SRC_URI[sha256sum] =3D "dbf00672c5316a30b7001fe852e6a5ba9f889afeab8a2475=
45a160d4302f1fa2"
> @@ -19,10 +19,6 @@ PACKAGECONFIG[polkit] =3D "--enable-polkit, --disable-=
polkit, polkit"
>  EXTRA_OECONF =3D "GDBUS_CODEGEN=3D${STAGING_BINDIR_NATIVE}/gdbus-codegen=
 \
>                  GLIB_COMPILE_RESOURCES=3D${STAGING_BINDIR_NATIVE}/glib-c=
ompile-resources"
>
> -ALTERNATIVE:${PN} =3D "x-session-manager"
> -ALTERNATIVE_TARGET[x-session-manager] =3D "${bindir}/xfce4-session"
> -ALTERNATIVE_PRIORITY_${PN} =3D "150"
> -
>  FILES:${PN} +=3D " \
>      ${libdir}/xfce4/*/*/*.so \
>      ${libdir}/xfce4/session/*-*-* \
> --
> 2.53.0

The required emptty series was removed from oe-core master-next. Please hol=
d off
on taking this patch for now.

Randolph

