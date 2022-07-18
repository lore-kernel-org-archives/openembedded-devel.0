Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBEF0C43334
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 15:31:12 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.45])
 by mx.groups.io with SMTP id smtpd.web09.28713.1658158263664350217
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Jul 2022 08:31:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=NKckxyD9;
 spf=pass (domain: arm.com, ip: 40.107.20.45, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=OdcGkFa00jUVX57zgz/Hsbh0VyWh3e4ZjGUwAiVfqednvPFKf+WChr/Gj1oJQZHp9ADoxm8sXIMs+I9SMJPsHDGu5IxeF27JmZbXJts70Uz7szKGyl8oddIDl+AXa7RY0m5sbf3ZSaSmTDwtwCViAnTP16fn69cLciyzTjYTYKAPZK0TN0GUMV4sxvN5Sc/3Uq07NtWvgBBvmKQZkmEkWBoOHOKejLlp687GmKlpO99zP3+PMnNXpcVwGYPEYPINrYTXo0GkjSa4qF/yixgB/LHWs56R0rIxrCNKgXyA+D2FVVKnLYNU+hyShxaqHGZKeZK3NUMFD2K5TJNpKkqG6g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tgtLhX2JvUagFoIyKUbTAii8h7qCcRL2fthxXr5q15U=;
 b=OPsYsCUQ3JuAk5HpxyW+wvKP5ldwd+LaSOs5pXFw45JLS1iHBJTRc3vvFPfzCGV0cQeW/oOoicYM5rhDOPiK8rK40+WkAo2yYwcz2RDlJl/fru1YwEp0JVQ0VdyTnhMzF+XjIhppc38PKQPtGsVnvhaoDG9HCLABDcgLGI3b0LLQlHBI7kQReqSOL0fiO2yCnayY33LFZfzvAtLnj/6nyTpIr4Jr9BWKnjIY3Kw6nurY3pANAn+nkksO//CDzMC2ZXX//tJs5MA/cOLPPo9yFU4XCcASxECv8kQv9q1gEXLjN1EAkaD2U85qwGdy5XO/kuEK8Avrv+10Ge3G5m1A7g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tgtLhX2JvUagFoIyKUbTAii8h7qCcRL2fthxXr5q15U=;
 b=NKckxyD98z+fUVMyN4XBYCk2114wkIlgSYg1PppqqOVo6lw4JJyBhhmci3maMdj7gjzk27PHIWdnhxO9EDgNpvDpxzmyW2a8FkWRd0V8RGxY7ViEixyhe11o58bxCFGRLpOxgrqOBAcydF4xt//m9c1uCJ4igiHLCNOXxyqBORw=
Received: from AM6P193CA0052.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:8e::29)
 by HE1PR0801MB1913.eurprd08.prod.outlook.com (2603:10a6:3:51::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.20; Mon, 18 Jul
 2022 15:30:59 +0000
Received: from VE1EUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8e:cafe::53) by AM6P193CA0052.outlook.office365.com
 (2603:10a6:209:8e::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.12 via Frontend
 Transport; Mon, 18 Jul 2022 15:30:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT003.mail.protection.outlook.com (10.152.18.108) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5438.12 via Frontend Transport; Mon, 18 Jul 2022 15:30:58 +0000
Received: ("Tessian outbound cc6a8ab50b6b:v123");
 Mon, 18 Jul 2022 15:30:58 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ee5c82ad1dd471f2
X-CR-MTA-TID: 64aa7808
Received: from 57ac669ac3c6.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3CD0A661-B881-48C5-B81C-8A5B257E39C4.1;
	Mon, 18 Jul 2022 15:30:52 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 57ac669ac3c6.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 18 Jul 2022 15:30:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RTMg5doTfRjozgbcaYm7yszlndWqjAhJkDI7CM8rPbWyFtE83ekkAdQwasKxYDlxTAKWxQOJbUTCxH1xmQKjspKvkLZj0XVHiHIqi3YVMZI0MCnQUsXH/ej3OLmguMnELBsOrPoUcpGgNDJOaiJY3Q/1AILK7a/7KY0v3gsZ36jr8dXFHQszZ+pOREFZWjt4E594OKFTIzvSQum42G1dNCd3lRqQfzPmF2ITV1G3TyMeu4YXuRLWY6CcvCkE5CzMrM8hQmqVYx2psFzvez06i+gJIQADteReJ9sQLcrYrl0iFs/saCVS2sC1FD+I1zwS6Z4FQWZ4y4sNvLZ26QfUxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tgtLhX2JvUagFoIyKUbTAii8h7qCcRL2fthxXr5q15U=;
 b=KLcejq4paslpOogJaymurgzsN5s2gNt1uAL26MSOZrCPSBnUoghmZZQYCQpwSHIPYqUFewfBIK/i6+bGy6xtuYEqG5ckyfFP8HQCtBFs5Eu3Z8b60ycZCINmvU3EMr6Q54vyEmVWrhnyx5cSBRXZYrG0+XgI3f20L2WYeBWU0kd1SS/Q5n5KiFWKUz/92omuaR4dyr4VuP27GoJsBrkyPkNBYmVp+6rrn+MsOvu/yA7XNgZ3DHeRT++LdJdDjk7zFrSTeOeObxIBUqLgAOwFxXRmGhhYjbvbEAqhXRM8ML/1MVkzJtS+96yPI6j3jqCr8om2ibCdeKhYXzXeYnU0RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tgtLhX2JvUagFoIyKUbTAii8h7qCcRL2fthxXr5q15U=;
 b=NKckxyD98z+fUVMyN4XBYCk2114wkIlgSYg1PppqqOVo6lw4JJyBhhmci3maMdj7gjzk27PHIWdnhxO9EDgNpvDpxzmyW2a8FkWRd0V8RGxY7ViEixyhe11o58bxCFGRLpOxgrqOBAcydF4xt//m9c1uCJ4igiHLCNOXxyqBORw=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS4PR08MB7997.eurprd08.prod.outlook.com (2603:10a6:20b:580::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Mon, 18 Jul
 2022 15:30:51 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::fc06:20ca:a7cd:4d72]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::fc06:20ca:a7cd:4d72%9]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 15:30:51 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][PATCH 3/3] python3-pycups: Inherit setuptools3
 instead of python_setuptools_build_meta
Thread-Topic: [oe] [meta-oe][PATCH 3/3] python3-pycups: Inherit setuptools3
 instead of python_setuptools_build_meta
Thread-Index: AQHYmMI50u3lEzO0akuhQsSF9GVvM62D4VeAgAArYjiAACvygIAADHxN
Date: Mon, 18 Jul 2022 15:30:51 +0000
Message-ID: 
 <PA4PR08MB741175BD7E0D708EDB46A8B2E88C9@PA4PR08MB7411.eurprd08.prod.outlook.com>
References: <20220716031434.4021879-1-raj.khem@gmail.com>
 <20220716031434.4021879-3-raj.khem@gmail.com>
 <D981D817-D78E-4CEC-A685-7BABEF22530F@arm.com>
 <PA4PR08MB7411E748A14F4EBA9B9E132DE88C9@PA4PR08MB7411.eurprd08.prod.outlook.com>
 <CAMKF1sqKO=B14tYy2MW1q+HOVf+Zawk0PBYeadWMP48GNMDFiw@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sqKO=B14tYy2MW1q+HOVf+Zawk0PBYeadWMP48GNMDFiw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 65ee7ef3-d83d-4f5e-7165-08da68d283cb
x-ms-traffictypediagnostic: 
	AS4PR08MB7997:EE_|VE1EUR03FT003:EE_|HE1PR0801MB1913:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 trRZcvGgfq+lXA2XmVIbxLE01k83SkY9QyswqkFlwYcyWpyBlGpLSbuzLkGxNkai2UtCBT0ulWhYCTXvaXdxLH/QJWRdu6+VTECIfIbpIW0u0RJvWGvqmzh1QtpLsacp0RCDCG+6wMvhu/VfsUymKrt4sZMlK93Yb1Tzxy/y4fz8Yqm7C+SJufDE76soB20AuRJ9NaqMcjdhOXj1RqIF4aZ97WUQfkjWSiu/WhJlOYiV/RWSt7SvqLvqRQ6zU6EwVR3G8Gl7WylgUYyGYtYSvZV5SyJivr5RC/ylzs44+7zub7SYrSZs7JCbvCSJ3SLiQb28epqVVc723rCWVHB9Q39sNhil5n7Uv27HdJkmna0wgLq8hixfSknzP5ALyt7cliuBRAMKE5K5A+tWHuffSVw+zCPSjuIGwUkSUOjc0fQwE7FpLvcOgGFm9ZGNMSxUW3oQZuvcSsdwvpqFZ1FKmoWTCb+54kn5UHPbDOuj1bQjWhwOKfoU/nkUVNrG1S+RsslGxSRPKsz4uue2wRzh4B0BtOh6X7EEjk11zwmp+KPc3BVdwLRfU6HA/uG4WLxcGWSur/2ZbtjGtaA3D2HYvzMcFwLxgeUZxE6DHDhEQhSTCoxkmt6u9TJDRDcKUKoQiEj13U2r78Y+WSPed72kAmeqXOpZHL9PdMbzV0EZxjKYaomtytEvSJAlJXjYAM86jj8rUjGqgWbNPCrWHgpTVJ9AL2oRrjztsQ/C96gC/Xywg/qMcZaZhrxnKCQcCvPikgpKUAJa2FkX0J18rpIMmeMR780iSU0nWFcZlM6Gk+B8azQyUj01g/7edmVUItD6
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(396003)(136003)(366004)(376002)(39860400002)(26005)(122000001)(6916009)(41300700001)(9686003)(186003)(33656002)(66476007)(64756008)(478600001)(2906002)(71200400001)(38100700002)(8936002)(86362001)(316002)(91956017)(53546011)(83380400001)(6506007)(7696005)(8676002)(5660300002)(4744005)(66556008)(76116006)(38070700005)(55016003)(66446008)(52536014)(4326008)(66946007);DIR:OUT;SFP:1101;
Content-Type: multipart/alternative;
	boundary="_000_PA4PR08MB741175BD7E0D708EDB46A8B2E88C9PA4PR08MB7411eurp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7997
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	6b95cbab-8974-4fbf-b3bd-08da68d27f27
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8GJOP4Lkas451dZE31HNKvIioL7/NX8ech7K35/euCfspK0MfwWyyJNboAeyapTxfnWlmNG84OMJaYb34olWfaymJG9LFCBclKyKgrPSHV5NfjTk48Xi7e3EeUiI9MlIVjweHgag0Lli23SdduqK4HMTKw7emUXurTZTKvpl9G/WZlR7THO+ziv7Gwv8ut8nv8tOHU2Q4zU1MrATa6gk/CpzlwYeV0LpdmRleBNdBDFtFBx5Nvc0lPRRAgz6lXGf3TeFUyH2QOzUEcfDcrEh+uJH+4yTD8TfWDnEVuEvbhRNgIdPnb7bBYP75KBH1rkBplEhRnxFOIKJ0pxuf9OwRq+MLRLWO77q2WZnPFlCUa/1t/rSAUFFcGZxUWM4Q+t433vtHTtMCi4l+ME3i/a4I378Mg3VMyBQ1YSleQMwTzGDJcFm9/0IwkwCni4NbazyyCRRqdU9L1EQf2QfnqCT4qSFvKqvd4Jpb9tu/HxISlsxBgMyvrLrkeqjU5aPqP63+HeEV7rVLAtOZnSjUZ2ELLZjwuoUwNCPoOBAw3LoVGW0mzAOTgbMBibOi75mghwATK2Abyn4/ot5hsdCCpgZ4GMDtTGiX8mgyfPQXC3nBE9W3MT7mmHCE05/62Vgs0lepaVuIG146W9SC1o8MAG+XrSuDdGfvNt8b70mBhkru2POGwmMKxI8cdXkdKjSeDsVrjHskuzn3t2C0vKXC0MyTOGCumRTTE4T8uLTk+kOLK+C7ar6EeeDhRjv49SVUW14qE7Vm4/nVT5GhM6vd7x91Nl66+T3yprqICcL1HpQtBIcFyUpHO6LtK3PREoBn6qj
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(39860400002)(396003)(376002)(346002)(40470700004)(46966006)(36840700001)(82740400003)(41300700001)(478600001)(9686003)(356005)(81166007)(86362001)(47076005)(7696005)(53546011)(6506007)(316002)(26005)(83380400001)(186003)(336012)(52536014)(8676002)(6862004)(5660300002)(8936002)(4326008)(55016003)(82310400005)(70586007)(70206006)(40460700003)(36860700001)(2906002)(40480700001)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2022 15:30:58.8509
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 65ee7ef3-d83d-4f5e-7165-08da68d283cb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1913
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Jul 2022 15:31:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97880

--_000_PA4PR08MB741175BD7E0D708EDB46A8B2E88C9PA4PR08MB7411eurp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

It=92s already in core, can you just revert these please.

Ross

From: Khem Raj <raj.khem@gmail.com>
Date: Monday, 18 July 2022 at 15:46
To: Ross Burton <Ross.Burton@arm.com>
Cc: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.ope=
nembedded.org>
Subject: Re: [oe] [meta-oe][PATCH 3/3] python3-pycups: Inherit setuptools3 =
instead of python_setuptools_build_meta


On Mon, Jul 18, 2022 at 8:09 AM Ross Burton <Ross.Burton@arm.com<mailto:Ros=
s.Burton@arm.com>> wrote:
> the picobuild 0.2 upgrade queued for oe-core improves =93legacy=94 setupt=
ools builds too.
I=92ve just looked at the logs and this is the correct fix.  Don=92t merge =
these, just wait for picobuild 0.2 to land.

Ah a bit late but we can apply the new fixes once it lands on core


Ross

--_000_PA4PR08MB741175BD7E0D708EDB46A8B2E88C9PA4PR08MB7411eurp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:10.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
span.EmailStyle18
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"EN-GB" link=3D"blue" vlink=3D"purple" style=3D"word-wrap:brea=
k-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">It=92s already in core, can you just revert these please.<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">Ross<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US"><o:p>&nbsp;</o:p></span></p>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><b><span style=3D"fon=
t-size:12.0pt;color:black">From:
</span></b><span style=3D"font-size:12.0pt;color:black">Khem Raj &lt;raj.kh=
em@gmail.com&gt;<br>
<b>Date: </b>Monday, 18 July 2022 at 15:46<br>
<b>To: </b>Ross Burton &lt;Ross.Burton@arm.com&gt;<br>
<b>Cc: </b>openembedded-devel@lists.openembedded.org &lt;openembedded-devel=
@lists.openembedded.org&gt;<br>
<b>Subject: </b>Re: [oe] [meta-oe][PATCH 3/3] python3-pycups: Inherit setup=
tools3 instead of python_setuptools_build_meta<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">On Mon, Jul 18, 202=
2 at 8:09 AM Ross Burton &lt;<a href=3D"mailto:Ross.Burton@arm.com">Ross.Bu=
rton@arm.com</a>&gt; wrote:<o:p></o:p></span></p>
</div>
<blockquote style=3D"border:none;border-left:solid #CCCCCC 1.0pt;padding:0c=
m 0cm 0cm 6.0pt;margin-left:4.8pt;margin-right:0cm">
<div>
<div>
<div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;margin-bottom:12.0p=
t"><b><span style=3D"font-size:12.0pt">&gt;
</span></b><span style=3D"font-size:11.0pt">the picobuild 0.2 upgrade queue=
d for oe-core improves =93legacy=94 setuptools builds too.<o:p></o:p></span=
></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span style=3D"font-size:11.0pt">I=92ve just looked at the logs an=
d this is the correct fix.&nbsp; Don=92t merge these, just wait for picobui=
ld 0.2 to land.<o:p></o:p></span></p>
</div>
</div>
</div>
</blockquote>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Ah a bit late but w=
e can apply the new fixes once it lands on core&nbsp;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
</div>
<blockquote style=3D"border:none;border-left:solid #CCCCCC 1.0pt;padding:0c=
m 0cm 0cm 6.0pt;margin-left:4.8pt;margin-right:0cm">
<div>
<div>
<div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span style=3D"font-size:11.0pt">&nbsp;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span style=3D"font-size:11.0pt">Ross<o:p></o:p></span></p>
</div>
</div>
</div>
</blockquote>
</div>
</div>
</div>
</body>
</html>

--_000_PA4PR08MB741175BD7E0D708EDB46A8B2E88C9PA4PR08MB7411eurp_--

