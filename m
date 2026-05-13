Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A88CCD4F24
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 09:34:45 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.70])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3733.1778664883102571394
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 May 2026 02:34:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=WiU4h+Jb;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=WiU4h+Jb;
 spf=pass (domain: arm.com, ip: 40.107.130.70, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=icCR4J3Slmr0lGJTCKVo4Gg6stqKmQXwc3hgPK0N+VdhfTBDhCMbmbiR0HyY9fjnDw79qxws8GINhBRRNQUcN4y+bVSHcK45Ozr9z6U6CJ1Fji5v/xItrT/iWqGZ8GoIarSXCQ5dF6CcmPtr4rhAIb43U1338LlXYrarh+5Pdkg361xLr2jUG4HP7I8RXRNBPGfYAuOP5bDBg+Ld48wJIJ+oOm/aH+3OLxT59DLfUIqllqywZpMhX7Dc6v9Nh+/pekL8icmMv7Px232HsJVkplfXjgU8iCvyUFP92gLxejmSF5NOty9QxiUuTA9doX1dN7nf2I3B02XzNGCRld0RSg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZiyAfWn+AacaNtwmCg3LQLOUCYlXp/Fd+Kor1e9eljk=;
 b=c/sHtAuAm0J7ykb67j3wtr2MWcHfw1omg3kb+zdI/NPUp/7vzhrOQvJdOmeQG2X17UqYOMjL+GK5+4SL90chsWtB+bX3D0HZYT6zc/Fcb3fDt13oUasO3muuVO3H8tKX9JD+xSXvL/AxLhol3IjfOmnCtsboUbjUk0zvHnyvBr2wxyoxuaSmUcfzPHINC69CCsxc1ppmg99eOIX3kDiEdS8ymGUfaaNJWc1LmGJ25bDwnP62viBkZRvrjDCSjNokHW+3LW6TtlvBiCPITG8vYOy6vFc2SxnUFJGddshVmTttITmhhuhpOvgxpDapXRR1ViP0uh3/ATBmUz6MSStBFw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZiyAfWn+AacaNtwmCg3LQLOUCYlXp/Fd+Kor1e9eljk=;
 b=WiU4h+JbiROk/q1cFWdzHJDW9tV1d+JMtAauCnQBhja37nT7b/1Z2zu/X9va1PkDNaRjs6/8WmODbaq4ZF6vZZT8vuEB8ZwtfNYisfMAddCGw/4NjrihYBPuPxvWF0L4bnaEuC9YaequBD8C+ilYOVV4n7XDJhUY0NlVLXUpZlU=
Received: from CWLP265CA0441.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1b7::7)
 by PAWPR08MB8959.eurprd08.prod.outlook.com (2603:10a6:102:33f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Wed, 13 May
 2026 09:34:38 +0000
Received: from AM3PEPF0000A78D.eurprd04.prod.outlook.com
 (2603:10a6:400:1b7:cafe::a1) by CWLP265CA0441.outlook.office365.com
 (2603:10a6:400:1b7::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.12 via Frontend Transport; Wed,
 13 May 2026 09:34:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A78D.mail.protection.outlook.com (10.167.16.116) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Wed, 13 May 2026 09:34:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fylggthUNCIHkVv5bvfvGS1FIPfR2BXFxz93jVPxZd1qGCPWk+Gw/zGI4ef80+VmcALXDD4s8a/PZhZ01NuQwyV767xJt7mX6wnCrcBH8woNXkct7XXK9Uk6GaRsVDRKWkcxh3/f9tlDh+ZcuQM+WySDh43A/W7yacc4vj0zcpbJncvLOIjYIz0PvbnErCWs03dTkIA25/cwuJLsIqf/EYTGN35yAOcNTdRt7H8Wn3KJ4cySj1c3YxrVSjx850aOzVtKt8lg0Mqr9w4cANoE/LCRPhj+SFv4kwUxFHOb0zVcvhwJ73z1Fcu7Khu2s3ghDDcLnsmtQ6+XtpAnpJ9pNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZiyAfWn+AacaNtwmCg3LQLOUCYlXp/Fd+Kor1e9eljk=;
 b=nrLDcr3d806jayCZxMbKc/VvTsGJkwOsK98N1y7sQEFW0fZwDpjWjWBbOHIXO4CDT1MIE+ZGawyzmoP9+AsbT+xRdkl5V/r39KTZetiKXJQzYOSfILfdOW+G0bpL7dH5FbdAsTi1DLYjzUiPFe6wvIBq3XGHIHzCqG9msHb+cse/owbweUK/blfd4ywhjRp691qxnGFf6rlXVEr9TcGYArBQA72d6A9TTWW0gti8yc3BDFR9lzzTQzR+NiEv8/r9++/iT2zLzeQg1i//AO+agFqsHu31KIYOUD8znyM5nVRE+MXaJjHvI4eQZpS1aCeftwt+gBbmHflTCbma3okTtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZiyAfWn+AacaNtwmCg3LQLOUCYlXp/Fd+Kor1e9eljk=;
 b=WiU4h+JbiROk/q1cFWdzHJDW9tV1d+JMtAauCnQBhja37nT7b/1Z2zu/X9va1PkDNaRjs6/8WmODbaq4ZF6vZZT8vuEB8ZwtfNYisfMAddCGw/4NjrihYBPuPxvWF0L4bnaEuC9YaequBD8C+ilYOVV4n7XDJhUY0NlVLXUpZlU=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by AS4PR08MB7407.eurprd08.prod.outlook.com (2603:10a6:20b:4e2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Wed, 13 May
 2026 09:33:35 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%6]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 09:33:32 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Ankur Tyagi <ankur.tyagi85@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [PATCH 3/3] libhandy: add recipe (from oe-core)
Thread-Topic: [oe] [PATCH 3/3] libhandy: add recipe (from oe-core)
Thread-Index: AQHc4i28Pm5h6v26oEKZehOfjR0mq7YLEoYAgACgMgA=
Date: Wed, 13 May 2026 09:33:32 +0000
Message-ID: <FB5684A6-68E9-489E-87E1-5A394C089CF1@arm.com>
References: <20260512163727.3832144-1-ross.burton@arm.com>
 <20260512163727.3832144-3-ross.burton@arm.com>
 <CADySD0EJ1NrpB7KdQOKaSMkdFsMbRuy9bJ0onwu4hY6gSaAdPg@mail.gmail.com>
In-Reply-To: 
 <CADySD0EJ1NrpB7KdQOKaSMkdFsMbRuy9bJ0onwu4hY6gSaAdPg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|AS4PR08MB7407:EE_|AM3PEPF0000A78D:EE_|PAWPR08MB8959:EE_
X-MS-Office365-Filtering-Correlation-Id: b54d45fa-ccca-447d-ec07-08deb0d2d9c3
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|376014|1800799024|18002099003|22082099003|38070700021|11063799003|56012099003;
X-Microsoft-Antispam-Message-Info-Original: 
 CAafOiB9GNivUHSQw7N8iuhCTF1tnJTBjY5uJ4QfVkHAnKlACObtevmYRcZmnEoAgyZ9A4CUB2jQKOos3WzQ/TpYtn45H56N1Hkk8tRJc798Ux46pR1uZ3d/a3fLS0Ph68j4SnXFKRfx1+vmQtEkWkuKsXVFwcIQjp6LQpjjaQZwIblTn4/iww2YTyWwJRc1dHFKE17myKiRtHtI9kOEEDbYjsOil1NCuuy0W8gjYIaFHsOzG4yT6CM69xl4CY2OkNgZaAXdRp2vHzJtOziM9BUDPfW4OI4uWZKF5RiVRE8EfWALO9Ka6iv9kGUwyNWXJh3N1Ma4VPWph4+E17sUsRE6ouZTGGlGGAoNkymdspKSmT6OkYOnK++2W8r17sZrVJ4dwnh0vooNZSbO2q/Spu068kA0gqAmgfWsT9NKVTxTIOpnFDcqMQnHlOf+QAg9j89AcopL7Gat0SE0DdOP0suGfHwjNsaCT4SoFoGyw/A0lxzDvmUIzSFd31I404KYGC9C9Gx05qDsa3rSQGif/uRgqbWJaR85U1CNrTdxmV97xq6/FKUAZ0+slz/bEasZVkhjWozo/+y/yilAJQKnZM8C7kYa8Nx7E3wa5q+aw7ghdRrcdZH4+MXmxEpZ/BjbXVTXHSESs8hFJHdJkbzOEPbiqJl9eUezBPSkgfdtdPpKlazh1Tq74sbOcS67P9VibolgLu6eyX+j3PWijwCZ7nx9A+XgkPQ0tNtokMIPEzDvCVBsya8vkukvj+XI1Eif
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(22082099003)(38070700021)(11063799003)(56012099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <F530585BE7ABEB448F544BBA6FCD3F6A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 TiPzyrKrOGcma3UJ2VH+eMDnISiGGKAVwixxmtaGcpxH/ZyCfB5g7XEdMdJHqvAvtOmPidDcYR3C1OOLbRuoMmNzgHDdfHkNoh0pjrVhYFCLONuAmS3Y8mVtlMQfDvr47THvI8vWcvmfkOukmXL8p6Fn6XACKL3QmFCz6fHX1I4MXhp+5hb8RtbPU3Duo11wZehKsfLphpRsaaMoKgISlKuDnrBnurWVL4sdjF+N8MCE1LQgSYvKFvuZ0z1G8v8gsyJSNWX1d/PZSpKEBsOQVB4zenEtUNwCvAvu6eWlprvE4u+1Gq3kvNKTn7srB69y9Pt7cB2PVTci4pKQcMzkKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7407
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM3PEPF0000A78D.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	699a681e-6af4-47e4-105a-08deb0d2b32a
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|35042699022|82310400026|376014|14060799003|1800799024|11063799003|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	E5L2Xc/RJp3r7osAnesE+aVXf+7Twp6FIpCoXvG5qsEnSPj3O0e45u5lJJj5BoCjGlsH8Wq7AtgjiJk3XqS9VnCD0cTOFC8kW0aYp5dDrCUKrNtqrKsjQ7iQk9dg4N+aDX8xmJqrw9vxUQUc5tJpAX5ys7pVYYlvOhLE88exzyp8j+/Q8UuH3zAZF6EFX12vKktZfrd9FJm3aVuzrGvPgWhK1Z1XlYuN9bvPaNSMTXUbW+ZIcO/odvSthmWWl4v4p4GRR4yLJBQ1PnPCbL7Suh1l4cxnK3pUBH49Zr2ViP02/fosdFM2C94KF5JZHwOBV/oXtrkRALn/sG2QNZZkQv8Z2XaF9fm9yWYxdQDmXT5oSAnJt7kJZlRHq274KJqgn34CkKyTbDF5SfPY05k4Xwle2md2w0fKR0SqoXDCaRocXvnjpGwa27/LtvKksAl8cKYPAqcwQgfDjL2YkB0GkfhoPxsW6HneSlsysACMiMo/C+70vIqBMRQx22XAAf2JYa15uqcq+7F7IJbysBBSXoXgGulc/cYtkKxBplXtaPLtePyYTPCrX53nha+GZfibsq6WhAhwVU2BYuaIndq1J80tvAgVMrYNvMaiCRSSO13SehlImnoaZfWqAZh0LuDJ78A66dW6s16+r4Iz7SYSoQk7px1+4rTPbCeQkDW1Rs6/+Pzo9QFIW5FM0YhmEIxufz+LgR98MX+SnP1pIOVY3tWsD6wQ+WiboOHFEp+A2HY=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(35042699022)(82310400026)(376014)(14060799003)(1800799024)(11063799003)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	fG4IGcZCoyv235M4XSaBYz99lvPflFou1gB84oRNjoLk0ZCUpfKVhmuUWb949rBxDkYcmf62S/50FJ2wYWZdBoR+7NzXeynaZ0DS+dRUK1zkblbYRwP74DS1kt5RvEeopwo8QnBO9E1Ky3H9Cbl5KszcYypvoqjS1CYyIhnFbguZmyiLk0jF59ZpT3SBSyGSNKFcqYvdsp96DS/numRV0k3zKr1HCUH0gywpco0FZZ3E/bORffNmG5vzBGukK9yxSvU5sxDQ8NH4YAcXptfIv+KVnvUCXn5Th+udOqQX482UetQ3z4qGNAcovcklFhF240jtqXzix44I53IGl5RibAhsWbKMTfYAGgbkwR7CT5jr2NK6ysWJDPuJHjP5K4f8RkgQ42brCL3j4xZqrc4M13fc4LoavFnNjtTnkhTc1AUsP0iGoMCBLDw88op/LL/r
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 09:34:37.5853
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b54d45fa-ccca-447d-ec07-08deb0d2d9c3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF0000A78D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB8959
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 09:34:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126962

T24gMTMgTWF5IDIwMjYsIGF0IDAxOjAwLCBBbmt1ciBUeWFnaSA8YW5rdXIudHlhZ2k4NUBnbWFp
bC5jb20+IHdyb3RlOg0KPiANCj4gQ2FuIHBsZWFzZSBpbmNsdWRlIHRhZz0ke1BWfSBpbiB0aGUg
U1JDX1VSSQ0KDQpJ4oCZbGwgYWN0dWFsbHkgY2hhbmdlIGl0IHRvIHVzZSB0aGUgdGFyYmFsbC4g
V2hpbHN0IGRvaW5nIHRoYXQgSSBub3RpY2VkIHRoZSBsaWNlbnNlIHdhcyBpbmNvcnJlY3QgdG9v
LiAgdjIgaW5jb21pbmcgc2hvcnRseS4NCg0KUm9zcw==

