Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17B51C43458
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 13:53:09 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.71])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.151521.1783345983607125417
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jul 2026 06:53:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=IZ+CnSpf;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=IZ+CnSpf;
 spf=pass (domain: arm.com, ip: 52.101.72.71, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=x37uZ2l+aoJ3Ot/aA5tKlhSAuk0cwLxq0S2CUTvR7rpHD8CPRaxLJuTRAg88hyaM0OnnIYKw05ERi0QMtBmg/U0z5UdPBpkjVkeJ8SHg73VBy71tWVhGFCK0fjK/IHVHBCdwiUCkwn4DLzzycar6LBOCMF489lrGMBePBzCkz2szbvDYa5LJxHid7NGi4yEzsL6zI9eu+CiD6q8lP05wxlqK/XfgZrv3HA882IbEybWoU69H/sgYp6m158SCUBWkVe7cn7TSwsLvLY4i+bZGXVsLBOpY0KXVNBCHPJdgqJxIyLFwDC5yu+O1FUulJXEWvA5PP21LhNl4ivrz10y53Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ScZ7luhkcy7HFhy60oHkvabzbJMgA5KIQqBA5THQdCQ=;
 b=aAEmGyV2WoSiG3NAfDF9p/RddHPXPeM+NC82jtIiuLPOWuIWdiGgOnWHuqDzoPsEpn+O6QN6Jfzg2No3IGF17LAVOfqZgmiKGyaCDPVz/pifsxiaHr1tC1pzUHsHYet+NLcdbuJas0fUHBGvUB+WqKiOHLjWnnEM68QBE8hHxd06ld/Y5AvbSCs+yeH5k5LjE6/BaSK931k2wqKNHU+UERk5hjifbPBgr/bnO5ShM0GQoTFV8g6yM9he0SHifSSkk5PYQyRul9U11BZ5LH6/vYQqSDUMovAJh4zquEhrEyVgAxjZBVTKFUWHL+ebjd9ku109z3ueSL0v67eKKqPQEw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ScZ7luhkcy7HFhy60oHkvabzbJMgA5KIQqBA5THQdCQ=;
 b=IZ+CnSpfc1o38xAYgKRwCtg9ezUsdTFcjTHK0DSqLBv+vAOTwoyRmif6dOgZpYoVaEOO/THA+z8kNumfjUBiLWwN+zdKhUL+gtWS0tMsPR/zfqp0L+sSqnu8zkjJ2sN+uOpWnst9e0Dv4r9dJQAjYS17NjamrujUS55cnJimNN8=
Received: from DB9PR01CA0023.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::28) by AS8PR08MB6310.eurprd08.prod.outlook.com
 (2603:10a6:20b:292::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.13; Mon, 6 Jul
 2026 13:52:55 +0000
Received: from DB1PEPF000509FF.eurprd03.prod.outlook.com
 (2603:10a6:10:1d8:cafe::22) by DB9PR01CA0023.outlook.office365.com
 (2603:10a6:10:1d8::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.13 via Frontend Transport; Mon, 6
 Jul 2026 13:52:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509FF.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6
 via Frontend Transport; Mon, 6 Jul 2026 13:52:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aCK0UM0n2QukGocaGoi7KtOEKSCYr6izZDN7YjSfFUduYfmB5Pil5mfxxpdc/g3UT5+BGBVZ6XQj3vYLueA5Np6JhEvdNkoe60/CVJhXE7IF4II3y4CLErXL25jPpzf//+dpvKqpYfWZwuWzAYAmy/575VRK8r0HDHac0t++jWNA+70uvFla+ww5Bw5YVJyXobvlhqspiGKv1V9FDXhJjCp4bbywRD4SxQK6g079D59D/GovissF2+5pjaCM5U4rvylh1Ppx3Cb0JRmUmvDl4osUh4evld2Lvue6vIl7FL8WzCxkTGYRQFxpYp8PzNAmiROwRMfcWDx6GEZ5SFclEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ScZ7luhkcy7HFhy60oHkvabzbJMgA5KIQqBA5THQdCQ=;
 b=GZUXNQPe0vRNw9tx8w4WcozmRdXALilUaTNEm1qvIM4uD7nxufoll92FIAa8uuNfhctrnNIdZPWnvPPJszfAqKrA9UR9V290aXH1KS1eEXuzx8cVLtelMwVe3NVIPUYwDq1MX2+UM3S0CPmDhNdu+yVHBXjQ3NDQXKW6rKJQN7Ykw3ni38mDZPom7ysQAZ2wchGbplXMa1bSUfuEC2HP9HLZHFTPKLyhCrxJE34S9Esmul3KC4VAHPtSvnFpAGBTB2er+yxj39ZKXz+lGcrOEunej32d6OwTxX8JoofxpTwNDVcOHqJgDj/hqoAHOciFltCPY8cLPEtWwm1szrI94g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ScZ7luhkcy7HFhy60oHkvabzbJMgA5KIQqBA5THQdCQ=;
 b=IZ+CnSpfc1o38xAYgKRwCtg9ezUsdTFcjTHK0DSqLBv+vAOTwoyRmif6dOgZpYoVaEOO/THA+z8kNumfjUBiLWwN+zdKhUL+gtWS0tMsPR/zfqp0L+sSqnu8zkjJ2sN+uOpWnst9e0Dv4r9dJQAjYS17NjamrujUS55cnJimNN8=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by DU0PR08MB8785.eurprd08.prod.outlook.com (2603:10a6:10:475::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Mon, 6 Jul
 2026 13:51:51 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%6]) with mapi id 15.21.0181.012; Mon, 6 Jul 2026
 13:51:51 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Khem Raj <raj.khem@gmail.com>
CC: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [PATCH 1/2] librav1e: make nasm dependency x86-specific
Thread-Topic: [oe] [PATCH 1/2] librav1e: make nasm dependency x86-specific
Thread-Index: AQHdDSJXqVow2BXYzkGKdxqX4cPmuLZgfToAgAAFpQA=
Date: Mon, 6 Jul 2026 13:51:51 +0000
Message-ID: <D5374CD8-35B3-40F3-B3FF-3CD2B0B776AF@arm.com>
References: <20260706083445.2842309-1-ross.burton@arm.com>
 <CAMKF1spZt9otLgCQnRW40L8JE9uPfhv9bODREMid=KVAkf2qWw@mail.gmail.com>
In-Reply-To: 
 <CAMKF1spZt9otLgCQnRW40L8JE9uPfhv9bODREMid=KVAkf2qWw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|DU0PR08MB8785:EE_|DB1PEPF000509FF:EE_|AS8PR08MB6310:EE_
X-MS-Office365-Filtering-Correlation-Id: 2be719f5-1a6f-4c08-76d9-08dedb65e1c3
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|38070700021|18002099003|4143699003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info-Original: 
 B75y7cD+Cl6wYTezsrUneOJXzuhjmie/Nvm5k//Xhd/tt6qTkPDOMByPgHwaASeJo5pCWK0OFV1AFpbtFwJLzkG1oSq4TpLGzSbPM2orhL+eqJKCMK3h6sD9p809vDVDdD35O/RmQlhvx9bOxdyTwK3lgk4MtFP8ym6EoD4WM+5iaYy2towKkiY3HyDP/FBKZdiDoPBAAAgCrXHqQVj5htQn5Fl9JqLW2JfFKBAitdJgvdQb7L2j+6kYkQHWRonPL9wOh1b7pc5VkVPUinDviSIXKoEDGCYtiNkLeMAEJidaLIX0wM8C7ra+R+hTF575BAmz4oaQyejmhbXWIYpt6ga0WCXniAX8yaGnazOYjqty2z6D4nOtCuqGT36sEJnrN9iDUO55sHudLXZmYoCLYbfIAzxe8mRqJ8eycQU62Hv3/jOqsygVWT+77kkQtW9Gg7U7GAGj0vdt/r0oRCTO7Rfdpg/nC1PmIbAbzwyl9znKXwNOIzfB9o5JtVwMhG76QyGSF9ZhH44gNVKUD02XBqZnUDx6UPu4XomqUOOdwu1ekFSBG0DfcWemj2DcmGoLa7cvfo8YCvcXo1K0I4OrMXioq/OdIlJOo03/teuzuPA8IV58fiWtmu7s2RiU30GNZYuuiSpqJPyUF0PwNRZQGDaniSoEKQCUGzETSye8M9FOBzSx1DBFY+6JQxjpwyjpFUvr4SLG/Oj7kUcVFre4dCqTB65cLJyiB9m9IA/rdms=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(38070700021)(18002099003)(4143699003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <D10F886A7BA29D41933AA113F904027E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 bu84Spykfee/RXjibmfhJgPKpX586VoQO+Fv1lG4AOgL93HHoxF9Cf/fMDl5E0my82UTfzGj55Zx8ig+KrIy9CEs7iM7a+D7uFLRh24rX/38kcsaUdzk9+dWc32+GkecLVuZddHXOBlCYkm8ssf+0Ws0lfW4uLYpZOIUglREWLhW14xCLrLH+0ch7uFWPWP/obuo/3CiSZ61m2UyFMRKe2osoVMRgEbVGQkyyXDXDb+4yCud4JtAgCIpaA558OHFX4l3ZSswaumsz545SHFr2lc0cywjno0MNYvwslIlPbp+KNOkGKNxs+/Br9CV1JO21cm6h3aKXkeUXAwwzChajw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8785
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF000509FF.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	6c2cb991-7fa4-407e-c365-08dedb65bb4d
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|35042699022|14060799003|1800799024|376014|23010399003|82310400026|56012099006|18002099003|11063799006|4143699003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	bj88ZqlMp5PpLKrzMrgEyhHK3pCgtQlbVzMZKxrP5mp7+bnCazoZDYJbOApgH5nj0ewer5JCWNm52GWmu7tCtTLT6YB22aAToVHABjodMjZ5Q6icxVUmyrcQHBUKHC1Gav1g++KrLIQoFtK8E9gh7nzHWoxOp0t440utwrpYjMZ3al07rSzH8i/nZtnX9uBDjhvh91pI4p1zC1VWaTJjNqv1UmE9+k3JkCppMlgwcx872pE5zPXE9snjoU5lVLTfJ2Q4u1yXXUmHk+CqR7J+Q7S0j0SV8fsqQCiZxwJ7wjNyDWzvF+8UAaFv3qimNXR6yrQK/ir5jTreXcYJBYnaIOs8j8hZXdBxhiDl9Licahhb0Ct1POScXii1KZEOBUAK72IIL0LVCuP05H3mQJkSVneJo8chOYdbtRMJvn21cQvGaR8d/XzTTRCfqiXU/HO7RchIyE2wwWb9MKw3v0vWB7K+4/KgCKT5T0xTxVnA4L1li1WhG3G7l/W2tC/fpUb/amsOJZOlTX4JRx/QjPcm+FHkY2GXkN8+Z3Fwhk1JUByF1n1sfeVXPML6fJcEbCITc9Z+xMXDt3TJDHmhNFi2LpmenRhXSn7T5N8aMDcmWSPSVGkXrzKbqO6oxHjOW5gmgGfamlNtZ9yl5tKdHqQfqrhQYBkNwGoehC6pRpnulJBKrBIm9YoDymxeLFj1ltvFDFd2DLpTNJ4R1XjYSIILEQ==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(35042699022)(14060799003)(1800799024)(376014)(23010399003)(82310400026)(56012099006)(18002099003)(11063799006)(4143699003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	aO92miYaVQhbG2zvEgHPjJyRm6axTgVikHFE4HtCHhsDzZrnqQ0jQTSBevyRMYFG9RQSF3eaismC5VHVL+AgerqOfPS556gwDUpG9+bjVpoXPNtirLxXSn987dr8nigi8qfEai0PsfNjxf8Sqew+d6XOqUVCllYw/7wKpXAfiTV1RJ2hjacXWLEY3iZBVyInhW/enCFiK4vFU2fd0jbDhk+aJ22zCrtRT3yKyRbXIx4xUnKtbc/JKmVccw6GmOrCQms7ZDQ7UXeJy5xVuzsYL86xvjtxxVWGfb0kVWAYirOdPcZ+bd0U9OeXsJtxl+xBM67/L2v20EFGDfNyw5w5gVzHCcruLivX3dzCabhsbBRKrH+s5swGwF+HUC7dJsZPMpVAuHAHRXplAdRK/tlUwqLEmqjOhQvgRPospH1eE2A6ZEr36eKDWmM9RzutyuB0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 13:52:55.8588
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2be719f5-1a6f-4c08-76d9-08dedb65e1c3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509FF.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6310
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Jul 2026 13:53:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128044

T24gNiBKdWwgMjAyNiwgYXQgMTQ6MzEsIEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+IHdy
b3RlOg0KPiANCj4gRG9lcyBhZGRpbmcgZmRlYnVnLXByZWZpeC1tYXAgdG8gQVNGTEFHUyBoZWxw
IG9uICB4ODYNCg0KSXQgd291bGQsIGlmIHRoZSBuYXNtIGludm9jYXRpb24gd2FzbuKAmXQgYnVy
aWVkIGludG8gcnVzdCBjcmF0ZXMgd2l0aCBubyB3YXkgdG8gYWRkIGZsYWdzIGZyb20gdGhlIHJl
Y2lwZS4NCg0KUm9zcw==

