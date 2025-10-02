Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D217CCAC5B0
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 10:00:55 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.71])
 by mx.groups.io with SMTP id smtpd.web11.5071.1759399248215123041
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Oct 2025 03:00:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=GJjAxcJt;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=GJjAxcJt;
 spf=pass (domain: arm.com, ip: 52.101.84.71, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=uGTQUuLQ/hkNiM40wFmeuGAYytQfUkb8OTzPC/V/DMfPZA122uLscHkpHO6kdBkWiz4vxd68JYbtzwu5BTBsA7W7aWZ/AnC8n9FpsrYE6OHe3o35oF2T7Y4R7fa1PXVtPiuyqi1E89q+KbCMktFr4E+QJh2Fndz/0qvWK0lWYjHXg3BVcheOaj13ogiGJTllAHHfmeNIWXVq2vNiMysVXLaM9mZFjtbSkVr/AQo/oTJSD269FxCvtprwc7ehhu+xCuitvWdomaHcOgN4nDjRjrTLDdxmjxDrYJvvjRrvQc9oMwBsd+gp26FlB9jXftX5AjMV0GimOwiY1JCgGC4/aQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eQlsINYn4ljAc1o8YfAGhHoHP/62Z468HxdTr3+yff4=;
 b=EDegMZ0ujFUaJW++fH/huiH9Fo7XaD+6h3v2qs1fKRIzswdg9heXbtXEhtGuOXswONfrTZ7iTOmb1heFiyyKqT/JXrgr4EUUBiN9nLclko4VLe7W61K7F+6QYRfl+0Q5K3v+RtB6jvirdIOOozMniy75KvxFVebGL/DkfBj1XmEtFHvU1EMouLuZ4HH+ORS1RvgLANH27hIygyaq4BTVeU0bVFRWYCH//m7zSBTPlU1NULETfwKXk8p32ZGN6TG9BQdoOoRdfy+tEH7whc2xNUCKxBgFqrL72+bTmLtRy8MgHaVDvTuUtHT0IiMbFItTj9NbskhMV8TvUqfIreWQKQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=t-online.de smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eQlsINYn4ljAc1o8YfAGhHoHP/62Z468HxdTr3+yff4=;
 b=GJjAxcJtarbiUSbOwsM1DO3c/Q3oCOph0r43NMiVJzfNkPoF9035KjxKh8DthPqoNHpQoL7IHJruboHU2K+roaAe3VPknWV36VNjH1MVW6LfrEl1EcjG53jUNiyaugmQ0akYseIwcik84kFmYsb/AMyRZg9Vh9SsCsWasvlvCOs=
Received: from CWLP123CA0231.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:19f::17)
 by AM8PR08MB6482.eurprd08.prod.outlook.com (2603:10a6:20b:367::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Thu, 2 Oct
 2025 10:00:39 +0000
Received: from AM1PEPF000252E0.eurprd07.prod.outlook.com
 (2603:10a6:400:19f:cafe::6a) by CWLP123CA0231.outlook.office365.com
 (2603:10a6:400:19f::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.14 via Frontend Transport; Thu,
 2 Oct 2025 10:00:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM1PEPF000252E0.mail.protection.outlook.com (10.167.16.58) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.15
 via Frontend Transport; Thu, 2 Oct 2025 10:00:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xeevz6FFVyRkcJSDb40Olkb7cgWpJqtwAhbweP1M/f+dXORNrwC8W6HTAIuy0WR0zSpqfXeDvV/sDWMBV16fC5ymn//1S+Se75X8r07XXgRwuWvdFsAPNEMdk57jWXL9K2bH+ajNHlxEy83BL+1aE2JA1ZdzXczrrC6vgmtFIcRHDDkWgmbwER8cjI/mfdd3C/LXKVCCG8MVnugUe9kG8DnXjwLWubY6342kx1y7rw+RngU/bayRFXo0PlFe64dtNuO0XoVw92uWf9KB/kEMiRpKmHSgk/5AIpGbfF+/mlz+gvAtJQzTxU/eV5KONvfq46QuvYr3IlYBEDmbZXoG8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eQlsINYn4ljAc1o8YfAGhHoHP/62Z468HxdTr3+yff4=;
 b=ZCbXB8pmh5m7a/K5IN4UQ9VgM1GKtQ3WKdqXty/6Qgf13cvf6Z+2p0JUeuZWB/x6kcN5F+LrjxMeP5gI+zM/2PyODy9GntFeEAE1Qnj8+mTI7vaRvxQhhYgnVgR1vCJC7FMTUq2imBOUCmqPlMVX6ktdJiHEsye4O6rY3QUxLIol1rwhd987Odqo4U5hlSoyJ0nf2J6+04ANtnNKbsQSlOX59fGxt/TRoLZnwOZbC4S3xJuV0UNo35tGI1QD6LmMbEAORntBK2S1hXUl+o07XgkoHtNVisXuzgODcRpQgi+Q3NDnJN2wpArmdXJZSLvcTe6/ybht/YNlPl3l+9Ot3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eQlsINYn4ljAc1o8YfAGhHoHP/62Z468HxdTr3+yff4=;
 b=GJjAxcJtarbiUSbOwsM1DO3c/Q3oCOph0r43NMiVJzfNkPoF9035KjxKh8DthPqoNHpQoL7IHJruboHU2K+roaAe3VPknWV36VNjH1MVW6LfrEl1EcjG53jUNiyaugmQ0akYseIwcik84kFmYsb/AMyRZg9Vh9SsCsWasvlvCOs=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB9274.eurprd08.prod.outlook.com (2603:10a6:10:41a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Thu, 2 Oct
 2025 10:00:06 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9160.017; Thu, 2 Oct 2025
 10:00:06 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "f_l_k@t-online.de" <f_l_k@t-online.de>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][PATCHv2] telepathy-mission-control: add recipe
Thread-Topic: [oe] [meta-oe][PATCHv2] telepathy-mission-control: add recipe
Thread-Index: AQHcMzgPNxsTfXicpEaFxd1EAEMqQLSuoCuA
Date: Thu, 2 Oct 2025 10:00:05 +0000
Message-ID: <A6BC85FC-FDB0-47A7-A95C-3478460C6CC4@arm.com>
References: <20251002010054.41854-1-f_l_k@t-online.de>
In-Reply-To: <20251002010054.41854-1-f_l_k@t-online.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU0PR08MB9274:EE_|AM1PEPF000252E0:EE_|AM8PR08MB6482:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cdb1c5c-ec9d-4759-eaba-08de019a8a2a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?eGpsSGVYem9oNjcycjBVMGxjZ2QveHJSTi9UOU1saFNpWGllZTE3NUFSMU50?=
 =?utf-8?B?azhQTWR6MlBkNVlGa2k2bkFMZ3oxbkUwbFNBSHlRTVpwSmhMMEpESlRpcGhL?=
 =?utf-8?B?MkdWRWFTbFMxUHJ4WDdpdm0rY2tyY0JXb3lSNEFpMFVhMWRCWG93ZWNaS3lw?=
 =?utf-8?B?SFczblNwcHptd09HM3NUWVBBNmtpaFdzamgxdHE4VmlIcDFhNSsxeDE5U0Ft?=
 =?utf-8?B?cUsxdTRyb1pZSTdBMlgzb3kwTmo2ajB4M2lhZXVWSlNnM3ZBNW52bWUvWW9X?=
 =?utf-8?B?NXVyNFFtZlU3TXlZS05yK0huWm16bElYVllqTFRRY3RwQlYxUGdhZGd0cm9H?=
 =?utf-8?B?Vk5oYlB5UE4wQ3Y4WDFEb2FFUWlobStFWXFmdkxHRUFqVm8yK2hSUzlycDFh?=
 =?utf-8?B?NStSbldyaVdUdjcxNjc5Q0szN3E0dFBwc3AxenFZejh3Sm1UeTNrWmllSVFn?=
 =?utf-8?B?Z2JrQU1PU0JGWHRRZHJUT2NnazZRSmtWSWY4TVB4ZTY1bjZNLzl3SWpHTVc3?=
 =?utf-8?B?VzhnVkZqdzhYdmZVbHpObEozQ3dyNDRUa2pBNmF6UEs1NGdPS1RNTS9yb3Ft?=
 =?utf-8?B?MlNNTXFDeFFVdkRQYW5yclR3aWpCb2tlMUI0Q25SeU5zMkJ0QUJzKzNqUGtC?=
 =?utf-8?B?dHFzNTBpWTdwV0hGNE42Tk9hV1Noa1ZDVVV1WkJ0blVoUCtETHJUVFZrdE51?=
 =?utf-8?B?VmFDYStzL3FaTFdOckhrdlpmT2k0S2pGTkVwbit1NC9iS2tTS3Q2VEhZbW1j?=
 =?utf-8?B?L3pKeDhTdktPVUhLV3pOYmJRQk1VVVp6V2Uzc3hSMlZBSGdlY05QSzJrWlkz?=
 =?utf-8?B?elptcDNLQ3FoRkJMK2F1V2NHQW5YbG4xMXVSZllNYmlOMEdZQmFzVldPck5E?=
 =?utf-8?B?d2JxMUsvNDYzbGdtQW1IVm1DL29HMEQvK2F2bStYM2MvbVRmTnpwekdJTkE4?=
 =?utf-8?B?R1lka1FVK0dwdVprb3JJdU1jQ2NEWldGdDdpZFdORElOYTgwV2tOWVFobEdS?=
 =?utf-8?B?eUc3TzhMTHJsT0tkdWNpTTk1cTJwRDNPbyt6Zis3Ylo4c0xrQm1pUmYwYVFi?=
 =?utf-8?B?WDRoekYreHZ4TGtsbWpEZ3Zab2lpKy9PYlp4WFZGYWt1ZGo4RHRUQzZuR0xF?=
 =?utf-8?B?dTFyNnIvTHhPM2loZnNEL0hiUmNabkhDaEY2M2xWYXhMTUNpdlJNZXJ1TVYz?=
 =?utf-8?B?ZGh3dEs4amxoY3dhUlFqWnBBQnUxVjl2Z2tlS2NhekFiWUNTOTllQ3p2MGhN?=
 =?utf-8?B?MzYyTzZDYUprQnluQ2dvRnQyWmtnRGFhSE0xWU5td3NHbkZPa3NOWTc2WFZw?=
 =?utf-8?B?ajExcnZlYkpqMXdzQXJnZytweDQyOHlkLzJIbE1GTjNHNzMwb0REOHRZOXhn?=
 =?utf-8?B?Nm9ib1JVZjRScG5BVEQ5SEEzbE9lS2RpQUVkVTk2Z0NqdTMxOXhOcXd6OGQ1?=
 =?utf-8?B?cVNYQ2xJNFcwUWNUY1JFME03Q3BsS1JqOS9IbG5YY0tMaTFCd2lmQzJDZGJz?=
 =?utf-8?B?dFlnMWFET21SUzcrcU4zSFJwUkIxdC9DU3pyczQvV1NnMW5iQXlUT2phVUpS?=
 =?utf-8?B?dmNBV0c4Nk5Id2pzUWdJWkVUc0RMNlJCMUNMaFo0U0kyVGhJM3hFc0hGNGdq?=
 =?utf-8?B?WGlCUzB5ZVZ2Q1JBdHVNNHZrUWo4dFhrWlJzSGRzdzZ2VDFtUEZRaGdleU9Y?=
 =?utf-8?B?MEo4N3FINUlWV3ZVYld5cVI0NFAxNEU4Y3lBOUlZVm5mUitMcnRGeFA4OHg1?=
 =?utf-8?B?Z1FQQjR6V0dlSUtjQ2ExL29jS29xNUpmMGlTMjBFVHFVSC9SNEdtVVFhcnd6?=
 =?utf-8?B?YU1uazJ3UkVXUDQwQ05FYU5BdFVtTGkzQmJLNE5ibm1UNFNybXNaSFoxNlht?=
 =?utf-8?B?ZGVoWFB4M3N0ekFxMmcvU1FsZk5vM0tlSXVnUVhhSlA5MFpyY1JaSDlMaitV?=
 =?utf-8?B?QlhFV0VDNnNhZTBWTUFLWHRCTWdTVUw5TGRYa2FraTF5dWFqRWJrbld2YnlV?=
 =?utf-8?B?MktKZ25PWGpBYnowSlJTVjM5TGZ1S1NZclU2SG1MekFVNFB2SlRTcGt0L3Fl?=
 =?utf-8?Q?2/rCfg?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <70F1B29D887BE6478AF718B2941FDED2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9274
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM1PEPF000252E0.eurprd07.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	21fbd352-04e0-4d97-2f9a-08de019a76a1
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|1800799024|82310400026|14060799003|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?V1cxbTJiTDZ0QTFBVDlYeXlMdnB0alF5RUxHQ2JtaTdJMW9zdDdrTGRuTXRw?=
 =?utf-8?B?TCtwelBveVVZeXJQbXIrVGdZV2lZem5HSzBkTjVUbHM5OFNmclpLUG8vZG9q?=
 =?utf-8?B?MFlmaC8rUDZwSm1pb0FMMjdoektwQnRwQ1NFRXcwME4vS0hZZUFIWnhnRXdG?=
 =?utf-8?B?eXBtRTlIZXV2Q2tBSXpXQ2lyVmtpKzhuZDZCUlNYRXF0TDRmeHladnZGV0hG?=
 =?utf-8?B?VkdKdzFWTmtGOWZkT0hqN1I5SUFLTHhoMFkzSlEvajNtMUk0bXhUcDIvc3ZQ?=
 =?utf-8?B?QzF1a1hsK1ZDZkVaYXVKZzN4dFFOWnVDbndqb1I3UjV4dndEa0IrU1g2QUQ4?=
 =?utf-8?B?emZrQ3NsTi9aM0FkUWtXQ0c5ei9VemtyL2NGS203WERwTERqU1hxaFdOSmhE?=
 =?utf-8?B?dHltd0VpeFFYckwzdmQ5VE1IdmhlVkxQSnZLTDljYi82UmgrazAvaW5FbHZR?=
 =?utf-8?B?TFBNTHI1TlBZS0ZXaC9HaTVsRkxzV2d5dkRadFF3VWVmbWVzZXk3VnRmWGhk?=
 =?utf-8?B?WTRhdVYrdFp1MkhWdWhyNytaS3NQd2cyOXhyZ0syWTBEVDNXM2ppbC8xa0h6?=
 =?utf-8?B?V2RkWXNkRFdDUTVTeUNjcDdCTTFWdTZSYURXZjQ0eFFJcWk1SlVaaTZ4ZU01?=
 =?utf-8?B?QjdYelFsQkd5MTJqcE5tYndia1ZZYWt5UThpV2pXY2ZKVUU2Qk1UMGhob3lS?=
 =?utf-8?B?eUwyd1Y0UXREM3BQd2orQStxU0lZcS9MYzA4dnorWlY3U0ZkTTNCVDg4NGNX?=
 =?utf-8?B?SGlzS3VucDltOU1VTCtydytjUmxzazhsSHpEOWhGKzMzaTZ1djcwZXd4SGVi?=
 =?utf-8?B?akhMeGRCTTRBUFhTTVp5ZkErblR6Q25GaUNRdUtJS1czbkNwd3N5emVSQ3JV?=
 =?utf-8?B?WUtCUVVpQ2U1R002N0t0NGpGbzRpbG5GK2ZlYmI5U0VKQTJGSFFmS1M3bEtL?=
 =?utf-8?B?VUJvbjh4RGxMdXNuRWRRTUhieHl4T3ljNFRqVlBtb3V0S25pOFk3Zm5wcDJI?=
 =?utf-8?B?TnBVR1Riam56WkFpNmpMeFI1ditvUDZTeGJYbmduUUNENDVEV01OMjFYTStl?=
 =?utf-8?B?Zmt3WUpIMno5WnN5L29XMnNGQlNqd3JXL21lbmoyRkpYQ2RNQ0pQUThlQWhI?=
 =?utf-8?B?OUlFbEw1eG1rNkFFaDJ1Z0VhbmpvK1RRVDcrdVd0V1RHOWQ5TzBNWXFGUVZa?=
 =?utf-8?B?LytvODhCRjh5M3BhRktFdUJheDAzVFNranV6TlVhWDlSY2J1UkhVeS82Wkhz?=
 =?utf-8?B?V1BHTTJFKy9IRE4yTlljaUQ1bEZibW5VUXVIRExZYU85d2VKM1MzcEE5cCtW?=
 =?utf-8?B?aHRGeHY4T0M5dHhaa0lzWVBTd3VXQkoxNGgwVmhrb2x1ZktLcVFVdnBDOG1K?=
 =?utf-8?B?WlJkU3FQTllHK3VyenVLaDF3RFVaS25hTGw0dm5nbVZXSldYNUpuZmMwK3E4?=
 =?utf-8?B?SFJtUzIzd08vSjkwL0tWZlNxbWU4a1M1Y0E3ZjUzTy9VYUtjaU5HcGdYRXlX?=
 =?utf-8?B?SDVNRUJWaS9VdGN4d0VWUUFHT0liRmtWd2pjeFE0Q01SUG1FbHIxWkJLSTA0?=
 =?utf-8?B?MTMrV3hCUmlOTk41V3BJMnZyN3F3cjN1bEJ4dVNMZFRNdVZ4SHVnVW1yYytV?=
 =?utf-8?B?OHJtelVuckxlblNKU1kwdzJvelNsaFVmRHdISTZUUU5KQ3JDM3lPMUtvVVd2?=
 =?utf-8?B?cEdrMjhFenlVb3o5YlVEN1E2eU9FU0lHL2d1SDNrdVlzWFVDc25PY2FFVFdN?=
 =?utf-8?B?ZjBqazVveVcwcWl4VmRzTmNCb29nRDFuUG5jSnBLRUMvWHVnS0orVXAyQzRF?=
 =?utf-8?B?bmZCUk5YZUxnV0lBdURNQTZCamlFVVVERVNuQzZKdnZSd0NGZGRhVmN1cjR4?=
 =?utf-8?B?aWMvMXVFY21ESUR0ZTExeVZFQ29lOGFmeDRaUk9LZFNLeUJ0YmdheVJaRUly?=
 =?utf-8?B?QTJUcWl3MFQ0MFd2RmlodnhlU0Z5dTkxQnhINHh2enJWNEZGUFh6R0YraVdn?=
 =?utf-8?B?ckYvajlScjlLZk1kRkVGS2VJL1BWT0pjSkhaRC9VK21KNnlucUFoWkU4emR4?=
 =?utf-8?B?dFhNWU10eW5PU053bGx4UXFaNXI5aTNuM2RaNVdUSnNzSnU4UGwvUEp4dmJ2?=
 =?utf-8?Q?8um4=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(1800799024)(82310400026)(14060799003)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2025 10:00:38.7494
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cdb1c5c-ec9d-4759-eaba-08de019a8a2a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM1PEPF000252E0.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6482
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Oct 2025 10:00:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120164

T24gMiBPY3QgMjAyNSwgYXQgMDI6MDAsIE1hcmt1cyBWb2xrIHZpYSBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnIDxmX2xfaz10LW9ubGluZS5kZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToN
Cj4gDQo+ICd0ZWxlcGF0aHktbWlzc2lvbi1jb250cm9sJyBpcyBhbiBhY2NvdW50IG1hbmFnZXIg
YXMgcmVxdWVzdGVkIGJ5IHRoZSAnZm9sa3MnIHRlbGVwYXRoeQ0KPiBiYWNrZW5kIGF0IHJ1bnRp
bWUuDQoNCkNvbnNpZGVyaW5nIG1pc3Npb24gY29udHJvbCBoYXNu4oCZdCBiZWVuIHRvdWNoZWQg
Zm9yIHNpeCB5ZWFycyBhbmQgdGhlIHJlc3Qgb2YgdGhlIHRlbGVwYXRoeSBzdGFjayBpcyBhbG1v
c3QgYXMgb2xkLCBpcyB0aGlzIHJlYWxseSBuZWVkZWQ/IERvIGFueSBvdGhlciBkaXN0cm9zIGFj
dHVhbGx5IHNoaXAgdGVsZXBhdGh5IGVuYWJsZWQgb3V0IG9mIHRoZSBib3g/DQoNClJvc3M=

