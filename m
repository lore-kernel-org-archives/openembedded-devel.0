Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29A30F55439
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 02:03:48 +0000 (UTC)
Received: from TY3P286CU002.outbound.protection.outlook.com (TY3P286CU002.outbound.protection.outlook.com [52.101.229.1])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36961.1771985026037047348
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Feb 2026 18:03:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=selector1 header.b=g4zCkDmp;
 spf=pass (domain: fujitsu.com, ip: 52.101.229.1, mailfrom: liuyd.fnst@fujitsu.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eidLpKqoDMznfur/yp4hgDA532lKA0WVJ36H80eAbl+je50/fL3mHDjTDcsldI2KHVPpB0FSPBGfHfUmKyWz8WK8TD8Xz55VP3dIZjpFM7mfIeXHL5M846YXKLYogFqmsKfML2zfhpXK3AOtxWADDiB29lQmH31rmeRCQqXCEi45vS2U0zBzU+UiWUw6EFDABMiNAGuD5bO/qGp6QV6kI9Jmyw4SP+PQTrJEJhIEI3e2E7n3lsrxBCN6O+pJ4S63gnEo4HUUpMiGOCjFhVX61NjGgJckFv3paJILJL1V7RCLRXAgzVqnVrY1jaHZ/2gKU4fjbFTki9kvl37ljIvydQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DNiqx2YY60F8ej7SLbjYR8iz+KVnQEmutnabkXoc8C0=;
 b=ICNBlrj+InjtdAv+kiJrUSYbeqDWsU1lV6EM30utWIZpOY5ixJfc0zNlnGtF9P6B3fnyJ+ObIwUCc3yu0LFd0zNG0qKAgW5920iswQcbb0kE3ZkC7EOQaeDmcV7oN5Lqe9XcGxzcE5t/YpzBentOyxIHz/eh2z6lKdGzt/x7EkVfRj1eYnSBa0lEw0Myr2+bvvhBu2+feTQKo17UAT775W/WC7RZzT5zF5UajS4etoLoy2QGWWs2ppit8d/dti3vzKfPa0vVAoefdH9xivPsIYFLZxLSbuRPaE4lzhQf0r3o0dpuZMEPth5uRJZWudOmouz3WSpL34eR5fVS1qWO8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DNiqx2YY60F8ej7SLbjYR8iz+KVnQEmutnabkXoc8C0=;
 b=g4zCkDmpdkjYVfQ0EH62mhcsfUN+RCJixUWcsGy0rtgauLj8H1CSgcYihI1paqvqnOq4TB4SoYkJFB1NOGGBZKgSLNBlIkhVvh2qUme8CHjfPZWKksOib1Pq6JbkSNOuS1iZjvO1IdeuNAsaSi89Sn0wmbjWfSlQQXgcbP5tzxiFEAaHT4eBLfr43t9KYxsyzBTqxcPNCLztqYmxwQj7cHPaTsp1YwCe+muJBDhr3zGYgKFAl6e9+yJ0ewjbDf1ds6Z/TyYBTZQHvcWMmQMHw8kCozYTWQXc7+eE6/3qn9QKAYraARnNVNVvlMre3xSEaRB3PDWXjV4Js2R+XRZ/bg==
Received: from TY3PR01MB10110.jpnprd01.prod.outlook.com (2603:1096:400:1d9::5)
 by TYYPR01MB7069.jpnprd01.prod.outlook.com (2603:1096:400:db::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.23; Wed, 25 Feb
 2026 02:03:42 +0000
Received: from TY3PR01MB10110.jpnprd01.prod.outlook.com
 ([fe80::65d2:5fd:bb96:1df2]) by TY3PR01MB10110.jpnprd01.prod.outlook.com
 ([fe80::65d2:5fd:bb96:1df2%5]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 02:03:41 +0000
From: "Yiding Liu (Fujitsu)" <liuyd.fnst@fujitsu.com>
To: Gyorgy Sarvari <skandigraun@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: reply: [oe][meta-oe][PATCH] tigervnc: Fix do_rootfs Error
Thread-Topic: reply: [oe][meta-oe][PATCH] tigervnc: Fix do_rootfs Error
Thread-Index: AQHcnrZBk8IdNwtO7069Lij3B+uHcbWRMzoWgAEcAoCAAGanGQ==
Date: Wed, 25 Feb 2026 02:03:41 +0000
Message-ID: 
 <TY3PR01MB101105D2BD6EE318659B34BC69B75A@TY3PR01MB10110.jpnprd01.prod.outlook.com>
References: <20260214013547.22916-1-liuyd.fnst@fujitsu.com>
 <e9706102-3c2d-4173-99ab-32116e0a49ce@gmail.com>
 <TY3PR01MB10110979EF0CC170FA92E1D319B74A@TY3PR01MB10110.jpnprd01.prod.outlook.com>
 <33690966-4c3e-47ab-94eb-ce708c3ee793@gmail.com>
In-Reply-To: <33690966-4c3e-47ab-94eb-ce708c3ee793@gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=True;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2026-02-25T02:03:40.986Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=1;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB10110:EE_|TYYPR01MB7069:EE_
x-ms-office365-filtering-correlation-id: 47cc540e-f601-4aec-25cc-08de74121974
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|4022899009|366016|376014|7053199007|13003099007|38070700021|8096899003|1580799027;
x-microsoft-antispam-message-info: 
 =?gb2312?B?N1NjcnBzWEV6cDNTOXZzaXVZZVRIMGdBaWw1SlpIeUozQzdJTkEvMDIyazVv?=
 =?gb2312?B?U2dvaDBGSkEwUnBpMGxPY1FRdGZZbi9zNzhIb1FMdTJBNGhTWHhCMXNrMXgw?=
 =?gb2312?B?RzRlTFVmQTNFN1laN2l6QnlTb3Rka2ZwU1VIenp4SWJ5WnVtMDlCaHVJdEo2?=
 =?gb2312?B?d3VST2FKWFlpYUJURzU1aUdjQUQrbC9EWVFQSFd5TTMzaE50VCs3YnozNWx3?=
 =?gb2312?B?Um9DbENZN1BoS2dValJMOFM1dlFBYU02QXhLZGpCS25NaklCL1N0dnBvNjB3?=
 =?gb2312?B?SGFUZXk3K2JIVlBEbEQ3UGlMMDNETmU0Sk9Gb2E1bFdvZWtsdFY0dk9VbHlR?=
 =?gb2312?B?RUQxQ1ZJejU4VFpEUi9SbEQ5L2dmOUU0YXVna25NRjFRMU5JVGsybHdkUzBR?=
 =?gb2312?B?L3VuTElmamtFTFA0UVJiOUs4R1RrVVF4ZU9QOXpaZlEzSUdQUERJWEQ5Yy8z?=
 =?gb2312?B?RWlNUWI1K3dZMzl3ZE12YlU2TUdPNEFxQnhrYXA2K2tRbStzVzR0OFp2K2tk?=
 =?gb2312?B?RmJUaFA0VjUyYXB2eUpmNG5RcU9tRmlCaWZpdTVVaUxXQjhIUXhyMmdBZ05h?=
 =?gb2312?B?WTRhUkNQOWVoR0pBc1F4N003bys3NWpTaGNnU1daOGVMVTl1S0lZd1NoeHRh?=
 =?gb2312?B?dzVvNVh2dHFvaHZBZFFzbVJWY01WNDFHMHkyUHdoS2ttSDZ5YTNvSGtQdWpI?=
 =?gb2312?B?ZnEzK0RUUVQzM0hRYU83YnVydk9Hd1pWTWNuajREVFZNdDhUblVjT20rbm54?=
 =?gb2312?B?Zk9mWkg0M1FWZVJKZ0JKcmpRREl0NHVGSXhtSUtxYkxvanNUNmdUaFlpWWJI?=
 =?gb2312?B?SDZrZk9CaWd5WGdBeEM2R1FmdzV5UVQ5QWNtVTlkMUVtMzR0aVNqaU1TT3RP?=
 =?gb2312?B?R3JnVFVWSDJLSGphaXgxZFphaHVTRnZhUjdNWXRSWU8yMkNlNGxEb21rOURK?=
 =?gb2312?B?VmdCMGVEb3ZhbFQxRnE2QmJhVzczZ3lpZVFpeGdWdU94eFgyQXNwcWdzak0x?=
 =?gb2312?B?ZDZndVVQZGwxc3RpZ2FNT1Vtc3I1Ykcwd1RCdlRSNWtNcVBrNVBMWXk2Y1FM?=
 =?gb2312?B?Vmt2a2tKNE5YQytSdUlSbnJ0bEpCMmN0MnVGeEloTFpuS2ZiTVhpQlFBU2pi?=
 =?gb2312?B?QzJUU0cxekhpM2EwdjU4Z0xuUlJxUXZzL1RVcFF3MmRxNjVQdU5sUXJNQlZw?=
 =?gb2312?B?NXNMbWUyaUs5TmFzV0dVelZTQkhSOXV6eVlCQ1pyTitXT05JbUJ1NTRWRURv?=
 =?gb2312?B?YXE3alZIMjFPMEFCUjRKTzBxYklFcVI0VGhvcFk0NG50MUlPT3Q1VnBYTEor?=
 =?gb2312?B?L0w3ZmxNQWI1ejNsdmZUSE5WSWI4WHdsbWZPNUVKdnFxSFd5N0gzdTBKTnpQ?=
 =?gb2312?B?bTF5K2lNb0lGRy8rQ2picHBZMjFJWTA5SUhpRGpVQlM5TnNCQ05RUGRKVFF4?=
 =?gb2312?B?SUxxZStPQnhYT2dBM0VtNkxId1V4VjFpVGdVZ1kwdWZET2lTL0d0c0ltMy81?=
 =?gb2312?B?SDlicHNpYlc1MzRYTlRhelBqZG9qOWtKQUw4SnRRQVFRUTJrK1Q2Vm8vMzJT?=
 =?gb2312?B?VXk0M292ZUdOdGMvR0Q5SUdCdEFFTGFhREloc05OSlY1aFJCRHNKMHJiOTBn?=
 =?gb2312?B?UmNvSFlCdE1SakIxZC84TXljVGxDYVpiNERBVlZFRW9hY2RqQkhGTm9XTWtl?=
 =?gb2312?B?ODhLNnJzWTdPNmNuMEpVVUJKUTJXNFpDOFJHZlpVVkFvOVM2OGF1eDl1ZVM1?=
 =?gb2312?B?ZVdhVmdlM0c2ZmFUY2tqYWlLU0k0am16Y1RDODBSUndNbktGTkk5YWdObVBz?=
 =?gb2312?B?NDNlZ0hNdmlpSy9VU2xZQWhEb0xqSDFXb1BPRGVYVS9qS05waVAya2ZmOVRl?=
 =?gb2312?B?em04eVNlOUVGMUN6V1VCMitqdStjWlBEL1ZObjEySGNNY21scUZlc0dZYW5s?=
 =?gb2312?B?M2J1YWxWUXF5d1ltVXRscFNCa25OYWdLWHg5L2dsT3pEbk5rV1h0eGtPTGRi?=
 =?gb2312?B?YjRZV21rMXcrR0lEaUJ0dWJTWnVoaC83Nk9CUEd6dlpLMnBmVE5BNkdpbGx0?=
 =?gb2312?B?NnR3WGxzaGk2REkyUmUvSjF6M2F4KzhUU1Vtam1pN0FuQ21hbzFOQmU4YlJy?=
 =?gb2312?B?bU9KdzhGK3VFckpqZDN0S3FWdXlLdytSV2J3WTZKWlR3aVRCengzS3VpWFJh?=
 =?gb2312?B?Unc9PQ==?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB10110.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(4022899009)(366016)(376014)(7053199007)(13003099007)(38070700021)(8096899003)(1580799027);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?gb2312?B?SGdtUUhqUkpyVXBEWCt4bTJ4RGt3aDA0aE04anRRaWpSQlhnZkNYTGNJS0xW?=
 =?gb2312?B?MFRlU0tTdTJRc3ZxYVNXeWUwMDYrUkdRRitWaHNuR1JUY1crQlpJNjVRZHE3?=
 =?gb2312?B?M3Rkb2haTi93S2wxaXJBcVJDNXRZWXhZWVJobXkxNWIweDRoVXlCclFvRUhz?=
 =?gb2312?B?cTU1U0ZYRHJ0UnVPTGFZZjROeFQxOE5xM09iRTZURDhpRndrWUE2c3BEQ2Jn?=
 =?gb2312?B?U2E5SXVLRk1wSHE0OStHelp6L0dOaXdhd1lMRnFqbWlHUFlOSVEzbGZCOFBs?=
 =?gb2312?B?MTFoUzhmK3JZWXhldm1tVUgzYTlVdlg2L0Q1V1lBZmVWekE1WHI0Ym5aM3RD?=
 =?gb2312?B?SWpBSHR3WXRmTlBqa0w1UFlIb2ZmWU84WnEwYk13R3Q2ZFBuMllGWFZrWHJR?=
 =?gb2312?B?U2V0OW44WlorcXFpaEhJOENNWFFablN3RzNHbENTelFEZFBMaW40ajA4N0dN?=
 =?gb2312?B?WkdRaFBUaDQ3aExjVEhnMVJWMjI0cVVrVnBRajlRaVg1eGZIRkZKcjZwTzV4?=
 =?gb2312?B?OXZqVTc1bE95NmJvcHpQOEdZR2oxYzZMRFArSDZzRHoyYXNmSnpXQjNrNWpa?=
 =?gb2312?B?dFNWRDNTVGxsRERSNXVTN0d5dVk2OWQ2YnVBdmY1enhjSXE0Uyt0TkUwZnBN?=
 =?gb2312?B?ekI5MFgwaGx2aDFhZmMyb2VJTzBKaWRqQnRSN1ZtZVhuMmlLY1N5ajA1RmVL?=
 =?gb2312?B?b2hFRnlEaldCdzZUUVBmdlhEazNDa01NY1hWSmRxQTdDZTEyRGE2N3dCaU9t?=
 =?gb2312?B?UGp0aW0rQk80UU5kL2ZOeFcxL1Z4WXExbnRtZm5mUldxVUdLSmNQR1RvSnlU?=
 =?gb2312?B?bWNPL2JJYnQ0a01vSlQxdGRrRTQxS2NNWktXU2kxVmdjZFROa2V1dGxYR1BS?=
 =?gb2312?B?UmV3RFdNSzJhR0toWHNLUG82ODA0T1I5czJuTVZBQTIvTHk1bWVPeS9Ubm5Q?=
 =?gb2312?B?eHUvVDZpVXV5Tk5pdDJBYjRZYTQ4aEVzOThYYW9TVVRjUW9oQzVkSkVXVFZZ?=
 =?gb2312?B?Zit5V2k0Q2ZoQkRpb2J4NWprOVpMSXhMYXVNdWY5RWZCNVcydTRkMCtoYU4y?=
 =?gb2312?B?TWlSODUvVUhTdjlua2dVOUU4ZVNZcWFrS0RzYmNSZWZRSVg3TnRlUHZUYXow?=
 =?gb2312?B?RGxiTUxIQ2NJRWhvY1Y4RTRZbjFRb2lGczdDU0dQeVF3T2ZVQ0pXMDBOKzBU?=
 =?gb2312?B?VWdNaGtrYUQ0Sk41d1EvZ0NkdmFkc2ZkNEwyNFMvcTBTWDJjbkhSZ1ppeWJV?=
 =?gb2312?B?UEx3dzAwZXRlb2lnZzE4Zm9lY2JQVWVGM3VDT1YzU2M5YmM4N3dxK3lSYUR0?=
 =?gb2312?B?dkFWVEwwdDkvTVEwVTFwQzdkbGlCTGxueGQxWENTeGpwckdtYUhZZzhMcEdo?=
 =?gb2312?B?d2h6dG1KQXUvc0xDSjA4VUozV1ZJZlVMOUFzM3FhSGo1cHBQOXpqVVZXcTRj?=
 =?gb2312?B?Uy9VSy9NVmpXVWJ4VzhORy9vK1kweUZWd2pHaTlybXd2VDNpQjl3bENyNTYz?=
 =?gb2312?B?U3IwaXMrbEM5WXRDVXZsOVd1b05MeHVvbXM1VWdGeU8yLzd4Z1VxUjZHU2V3?=
 =?gb2312?B?aGs4QlRJeHdnTWh4VTJIZ0E4S1RESXVRNTZTY1dMYjl5cXRCa3RQSDVxR1hX?=
 =?gb2312?B?bktqVFlkcEVFdllORGNmcDBhQmR2RU1MNXhvTEh0TGc5Q091R21yNUFJTmhM?=
 =?gb2312?B?OEdPQmQ1M3dGb1E2T04wZ2RpaEJnckthVVFpK29TNjlxYS9xVFp6dmlkVHNz?=
 =?gb2312?B?KzAzVHQzN1VrMlNTYXovSXdwbEVsb0FGMEhzSGJUN0dCVitWVzdoNHVWalZh?=
 =?gb2312?B?M3JCNUI0K0dXSFovUmJOMEQwN1JuQ0VzTU5UOEJ0NDBqU2ZoTDgwd1B5QWxF?=
 =?gb2312?B?bVJYUWtaK1JiY0NTOVhLV2RONEhweUtjYUdvYzhIK0l3eGEybmJnbmtWR2Jr?=
 =?gb2312?B?YkdBRlREZEtHTUVielBYbnZBcUNPUkJZZDFyZDA5QmpKUEhhQndpdzJ3TGJl?=
 =?gb2312?B?S0ZZVE0vQ3Q5Z1IzaWE5WFlab0RlaDlqb0lkbksvOWY3Q1lHOFFxMHIyekha?=
 =?gb2312?B?bFR1MGFmSlBBcHhyNnB1MzhwQ1UvZmc2WHNWcXdxMENlRGNDNjNRZmZlVkxh?=
 =?gb2312?B?YnprWDd5cHErMU9MV0NpeTBIdm1pOGU1SGxINXdYTzhjajBUZ3NuNFAvWjda?=
 =?gb2312?B?STIwSVlxNkdFU2lVYmRUTUZ1VjlMT1Nwc0RFUE51eTFOMEYwc1JvOXBmeGNJ?=
 =?gb2312?B?MENwMEVFV1dWV2FxZUovQXYzRXg1WGJPQmZlRXFJSFBENEd4d3JkVmpLeFdS?=
 =?gb2312?B?S3JTWStTR2o3YjZqWUxic2FmeUxla0Q3b0QxY09GSGI4R2o4c1NrUT09?=
Content-Type: multipart/alternative;
	boundary="_000_TY3PR01MB101105D2BD6EE318659B34BC69B75ATY3PR01MB10110jp_"
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB10110.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47cc540e-f601-4aec-25cc-08de74121974
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2026 02:03:41.8232
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LfCppQ3VQerBgyYtn7ahfprcyuxElQnC1glVhtTmt6oSrxkA9rHSkXfgqMpjBUuHcfL+FF4gxWCNUQ3eSU7u8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB7069
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 02:03:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124603

--_000_TY3PR01MB101105D2BD6EE318659B34BC69B75ATY3PR01MB10110jp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGkgR3lvcmd5DQogICAgSSByZWFkIGFuZCB1bmRlcnN0YW5kIHlvdXIgbWFpbC4NCiAgICBJIHdp
bGwgc2V0IHdlYWsgYXNzaWdubWVudCB0byAiU1lTVEVNRF9TRVJWSUNFOiR7UE59IiBhbmQgYWRk
IGNvbW1lbnRzIGZvciBpdCBsaWtlDQogICAjIElmIHVzZXIgd2FudCB0byBlbmFibGUgc2Vydmlj
ZSBvZiB2bmNzZXJ2ZXIsIHZuY3NlcnZlckA6PGRpc3BsYXk+LnNlcnZpY2UgaXMgbmVlZGVkIGFu
ZCBmdXJ0aGVyIHN0ZXBzIGFyZSBsaXN0ZWQgaW4gdW5pdCBmaWxlIGl0c2VsZi4NCg0KICAgIFRo
ZW4gSSB3aWxsIHNlbmQgdjIgcGF0Y2guDQoNCkxpdQ0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18NCreivP7IyzogR3lvcmd5IFNhcnZhcmkgPHNrYW5kaWdyYXVuQGdtYWlsLmNvbT4N
Creiy83KsbzkOiAyMDI2xOoy1MIyNcjVIDAzOjQ2DQrK1bz+yMs6IExpdSwgWWlkaW5nL8H1INLS
tqEgPGxpdXlkLmZuc3RAZnVqaXRzdS5jb20+OyBvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZyA8b3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+
DQrW98ziOiBSZTogcmVwbHk6IFtvZV1bbWV0YS1vZV1bUEFUQ0hdIHRpZ2Vydm5jOiBGaXggZG9f
cm9vdGZzIEVycm9yDQoNCk9uIDIvMjQvMjYgMDk6NDksIFlpZGluZyBMaXUgKEZ1aml0c3UpIHdy
b3RlOg0KPiBIaSBHeW9yZ3kNCj4NCj4gICAgIEkgIHVzZSBmb2xsb3dpbmcgc2V0dGluZyB0byBy
ZXByb2R1Y2UgdGhpcyBlcnJvci4NCj4gSU5JVF9NQU5BR0VSOmZvcmNldmFyaWFibGUgPSAic3lz
dGVtZCINCj4gVklSVFVBTC1SVU5USU1FX2luaXRfbWFuYWdlciA9ICJzeXN0ZW1kIg0KPiBJTUFH
RV9JTlNUQUxMOmFwcGVuZCA9ICIgdGlnZXJ2bmMiDQo+DQoNClRoYW5rcyAtIGEgYml0IGFmdGVy
IEkgc2VudCBteSBpbml0aWFsIGVtYWlsLCBJIG5vdGljZWQgdGhhdCBpdCB3YXMgbXkNCnVzZXIg
ZXJyb3IsIGFuZCB3YXMgYWJsZSB0byByZXByb2R1Y2UgaXQuDQpEaWQgeW91IGhhdmUgYSBjaGFu
Y2UgdG8gY2hlY2sgbXkgbGFzdCBtYWlsIGFib3V0IHRoaXM/DQoNCmh0dHBzOi8vbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1kZXZlbC9tZXNzYWdlLzEyNDQ0MA0KDQoNCj4N
Cj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tDQo+ICq3orz+yMs6KiBHeW9yZ3kgU2FydmFyaSA8c2thbmRpZ3Jh
dW5AZ21haWwuY29tPg0KPiAqt6LLzcqxvOQ6KiAyMDI2xOoy1MIxNsjVIDA0OjAzDQo+ICrK1bz+
yMs6KiBMaXUsIFlpZGluZy/B9SDS0rahIDxsaXV5ZC5mbnN0QGZ1aml0c3UuY29tPjsNCj4gb3Bl
bmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPG9wZW5lbWJlZGRlZC1k
ZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPg0KPiAq1vfM4joqIFJlOiBbb2VdW21ldGEtb2Vd
W1BBVENIXSB0aWdlcnZuYzogRml4IGRvX3Jvb3RmcyBFcnJvcg0KPg0KPiBPbiAyLzE0LzI2IDAy
OjM1LCBZaWRpbmcgTGl1IChGdWppdHN1KSB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZyB3cm90
ZToNCj4gPiBGaXggdGhlIGZvbGxvd2luZyBlcnJvcjoNCj4gPiBFUlJPUjogY29yZS1pbWFnZS1t
aW5pbWFsLTEuMC1yMCBkb19yb290ZnM6IFBvc3RpbnN0YWxsIHNjcmlwdGxldHMNCj4gb2YgWyd0
aWdlcnZuYyddIGhhdmUgZmFpbGVkLiBJZiB0aGUgaW50ZW50aW9uIGlzIHRvIGRlZmVyIHRoZW0g
dG8NCj4gZmlyc3QgYm9vdCwNCj4gPiB0aGVuIHBsZWFzZSBwbGFjZSB0aGVtIGludG8gcGtnX3Bv
c3RpbnN0X29udGFyZ2V0OiR7UE59ICgpLg0KPg0KPiBIb3cgY291bGQgSSByZXByb2R1Y2UgdGhp
cz8NCj4gSSBhZGRlZCB0aWdlcnZuYyB0byBJTUFHRV9JTlNUQUxMLCBhbmQgYnVpbHQgaXQgb25j
ZSB3aXRoIHN5c3RlbWQgYXMNCj4gSU5JVF9NQU5BR0VSIGFuZCBvbmNlIHdpdGggc3lzdmluaXQg
KGFsc28gYWRkZWQgc3lzdGVtZC9zeXN2aW5pdCB0bw0KPiBESVNUUk9fRkVBVFVSRVMpLCBidXQg
dGhlIGJ1aWxkIHN1Y2NlZWRlZCBpbiBib3RoIGNhc2VzLg0KPiBBbSBJIG1pc3Npbmcgc29tZSBj
b25maWcgc3RlcD8NCj4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBMaXUgWWlkaW5nIDxsaXV5ZC5mbnN0
QGZ1aml0c3UuY29tPg0KPiA+IC0tLQ0KPiA+ICBtZXRhLW9lL3JlY2lwZXMtZ3JhcGhpY3MvdGln
ZXJ2bmMvdGlnZXJ2bmNfMS4xNi4wLmJiIHwgMSArDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL21ldGEtb2UvcmVjaXBlcy1ncmFwaGlj
cy90aWdlcnZuYy90aWdlcnZuY18xLjE2LjAuYmINCj4gYi9tZXRhLW9lL3JlY2lwZXMtZ3JhcGhp
Y3MvdGlnZXJ2bmMvdGlnZXJ2bmNfMS4xNi4wLmJiDQo+ID4gaW5kZXggYTU0MTNhOTEwOC4uMTI4
NTQ2MzJkNSAxMDA2NDQNCj4gPiAtLS0gYS9tZXRhLW9lL3JlY2lwZXMtZ3JhcGhpY3MvdGlnZXJ2
bmMvdGlnZXJ2bmNfMS4xNi4wLmJiDQo+ID4gKysrIGIvbWV0YS1vZS9yZWNpcGVzLWdyYXBoaWNz
L3RpZ2Vydm5jL3RpZ2Vydm5jXzEuMTYuMC5iYg0KPiA+IEBAIC05NSw2ICs5NSw3IEBAIEZJTEVT
OiR7UE59ICs9ICIgXA0KPiA+ICAiDQo+ID4NCj4gPiAgU1lTVEVNRF9TRVJWSUNFOiR7UE59ID0g
InZuY3NlcnZlckAuc2VydmljZSINCj4gPiArU1lTVEVNRF9BVVRPX0VOQUJMRToke1BOfSA9ICJk
aXNhYmxlIg0KPiA+DQo+ID4gIENWRV9TVEFUVVNbQ1ZFLTIwMTQtODI0MV0gPSAiZml4ZWQtdmVy
c2lvbjogVGhlIHZ1bG5lcmFibGUgY29kZSBpcw0KPiBub3QgcHJlc2VudCBpbiB0aGUgdXNlZCB2
ZXJzaW9uICgxLjE1LjApIg0KPiA+ICBDVkVfU1RBVFVTW0NWRS0yMDIzLTYzNzddID0gImZpeGVk
LXZlcnNpb246IFRoZSB2dWxuZXJhYmxlIGNvZGUgaXMNCj4gbm90IHByZXNlbnQgaW4gdGhlIHVz
ZWQgeHNlcnZlciB2ZXJzaW9uICgyMS4xLjE4KSINCj4gPg0KPiA+IC09LT0tPS09LT0tPS09LT0t
PS09LT0tDQo+ID4gTGlua3M6IFlvdSByZWNlaXZlIGFsbCBtZXNzYWdlcyBzZW50IHRvIHRoaXMg
Z3JvdXAuDQo+ID4gVmlldy9SZXBseSBPbmxpbmUgKCMxMjQ0MDApOg0KPiBodHRwczovL2xpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtZGV2ZWwvbWVzc2FnZS8xMjQ0MDANCj4g
PGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1kZXZlbC9tZXNz
YWdlLzEyNDQwMD4NCj4gPiBNdXRlIFRoaXMgVG9waWM6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZy9tdC8xMTc4MDM0NTAvNjA4NDQ0NQ0KPiA8aHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRk
ZWQub3JnL210LzExNzgwMzQ1MC82MDg0NDQ1Pg0KPiA+IEdyb3VwIE93bmVyOiBvcGVuZW1iZWRk
ZWQtZGV2ZWwrb3duZXJAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA+IFVuc3Vic2NyaWJlOg0K
PiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtZGV2ZWwvdW5z
dWINCj4gPGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1kZXZl
bC91bnN1Yj4gW3NrYW5kaWdyYXVuQGdtYWlsLmNvbV0NCj4gPiAtPS09LT0tPS09LT0tPS09LT0t
PS09LQ0KPiA+DQo+DQoNCg==

--_000_TY3PR01MB101105D2BD6EE318659B34BC69B75ATY3PR01MB10110jp_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
Hi Gyorgy</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif;" class=3D"elementToProof">
<span style=3D"font-size: 12pt; color: rgb(0, 0, 0);">&nbsp; &nbsp; I read =
and understand your
</span><span style=3D"font-size: 11pt; color: rgb(0, 0, 0);">mail.</span></=
div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp; &nbsp; I will set weak assignment to &quot;SYSTEMD_SERVICE:${PN}&quo=
t; and add comments for it like</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp; &nbsp;# If user want to enable service of vncserver, vncserver@:&lt;=
display&gt;.service is needed and further steps are listed in unit file its=
elf.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp; &nbsp; Then I will send v2 patch.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp; &nbsp;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Liu</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>=B7=A2=BC=FE=C8=CB:</b> Gyorgy =
Sarvari &lt;skandigraun@gmail.com&gt;<br>
<b>=B7=A2=CB=CD=CA=B1=BC=E4:</b> 2026=C4=EA2=D4=C225=C8=D5 03:46<br>
<b>=CA=D5=BC=FE=C8=CB:</b> Liu, Yiding/=C1=F5 =D2=D2=B6=A1 &lt;liuyd.fnst@f=
ujitsu.com&gt;; openembedded-devel@lists.openembedded.org &lt;openembedded-=
devel@lists.openembedded.org&gt;<br>
<b>=D6=F7=CC=E2:</b> Re: reply: [oe][meta-oe][PATCH] tigervnc: Fix do_rootf=
s Error</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On 2/24/26 09:49, Yiding Liu (Fujitsu) wrote:<br>
&gt; Hi Gyorgy<br>
&gt;<br>
&gt; &nbsp; &nbsp; I&nbsp; use following setting to reproduce this error.<b=
r>
&gt; INIT_MANAGER:forcevariable =3D &quot;systemd&quot;<br>
&gt; VIRTUAL-RUNTIME_init_manager =3D &quot;systemd&quot;<br>
&gt; IMAGE_INSTALL:append =3D &quot; tigervnc&quot;<br>
&gt;<br>
<br>
Thanks - a bit after I sent my initial email, I noticed that it was my<br>
user error, and was able to reproduce it.<br>
Did you have a chance to check my last mail about this?<br>
<br>
<a href=3D"https://lists.openembedded.org/g/openembedded-devel/message/1244=
40">https://lists.openembedded.org/g/openembedded-devel/message/124440</a><=
br>
<br>
<br>
&gt;<br>
&gt; ----------------------------------------------------------------------=
--<br>
&gt; *=B7=A2=BC=FE=C8=CB:*&nbsp;Gyorgy Sarvari &lt;skandigraun@gmail.com&gt=
;<br>
&gt; *=B7=A2=CB=CD=CA=B1=BC=E4:*&nbsp;2026=C4=EA2=D4=C216=C8=D5 04:03<br>
&gt; *=CA=D5=BC=FE=C8=CB:*&nbsp;Liu, Yiding/=C1=F5 =D2=D2=B6=A1 &lt;liuyd.f=
nst@fujitsu.com&gt;;<br>
&gt; openembedded-devel@lists.openembedded.org<br>
&gt; &lt;openembedded-devel@lists.openembedded.org&gt;<br>
&gt; *=D6=F7=CC=E2:*&nbsp;Re: [oe][meta-oe][PATCH] tigervnc: Fix do_rootfs =
Error<br>
&gt; &nbsp;<br>
&gt; On 2/14/26 02:35, Yiding Liu (Fujitsu) via lists.openembedded.org wrot=
e:<br>
&gt; &gt; Fix the following error:<br>
&gt; &gt; ERROR: core-image-minimal-1.0-r0 do_rootfs: Postinstall scriptlet=
s<br>
&gt; of ['tigervnc'] have failed. If the intention is to defer them to<br>
&gt; first boot,<br>
&gt; &gt; then please place them into pkg_postinst_ontarget:${PN} ().<br>
&gt;<br>
&gt; How could I reproduce this?<br>
&gt; I added tigervnc to IMAGE_INSTALL, and built it once with systemd as<b=
r>
&gt; INIT_MANAGER and once with sysvinit (also added systemd/sysvinit to<br=
>
&gt; DISTRO_FEATURES), but the build succeeded in both cases.<br>
&gt; Am I missing some config step?<br>
&gt;<br>
&gt; &gt; Signed-off-by: Liu Yiding &lt;liuyd.fnst@fujitsu.com&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;&nbsp; meta-oe/recipes-graphics/tigervnc/tigervnc_1.16.0.bb | 1 +<=
br>
&gt; &gt;&nbsp; 1 file changed, 1 insertion(+)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.16.0.bb=
<br>
&gt; b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.16.0.bb<br>
&gt; &gt; index a5413a9108..12854632d5 100644<br>
&gt; &gt; --- a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.16.0.bb<br>
&gt; &gt; +++ b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.16.0.bb<br>
&gt; &gt; @@ -95,6 +95,7 @@ FILES:${PN} +=3D &quot; \<br>
&gt; &gt;&nbsp; &quot;<br>
&gt; &gt;&nbsp;<br>
&gt; &gt;&nbsp; SYSTEMD_SERVICE:${PN} =3D &quot;vncserver@.service&quot;<br=
>
&gt; &gt; +SYSTEMD_AUTO_ENABLE:${PN} =3D &quot;disable&quot;<br>
&gt; &gt;&nbsp;<br>
&gt; &gt;&nbsp; CVE_STATUS[CVE-2014-8241] =3D &quot;fixed-version: The vuln=
erable code is<br>
&gt; not present in the used version (1.15.0)&quot;<br>
&gt; &gt;&nbsp; CVE_STATUS[CVE-2023-6377] =3D &quot;fixed-version: The vuln=
erable code is<br>
&gt; not present in the used xserver version (21.1.18)&quot;<br>
&gt; &gt;<br>
&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt; Links: You receive all messages sent to this group.<br>
&gt; &gt; View/Reply Online (#124400):<br>
&gt; <a href=3D"https://lists.openembedded.org/g/openembedded-devel/message=
/124400">https://lists.openembedded.org/g/openembedded-devel/message/124400=
</a><br>
&gt; &lt;<a href=3D"https://lists.openembedded.org/g/openembedded-devel/mes=
sage/124400">https://lists.openembedded.org/g/openembedded-devel/message/12=
4400</a>&gt;<br>
&gt; &gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117=
803450/6084445">
https://lists.openembedded.org/mt/117803450/6084445</a><br>
&gt; &lt;<a href=3D"https://lists.openembedded.org/mt/117803450/6084445">ht=
tps://lists.openembedded.org/mt/117803450/6084445</a>&gt;<br>
&gt; &gt; Group Owner: openembedded-devel+owner@lists.openembedded.org<br>
&gt; &gt; Unsubscribe:<br>
&gt; <a href=3D"https://lists.openembedded.org/g/openembedded-devel/unsub">=
https://lists.openembedded.org/g/openembedded-devel/unsub</a><br>
&gt; &lt;<a href=3D"https://lists.openembedded.org/g/openembedded-devel/uns=
ub&gt;&nbsp;[skandigraun@gmail.com">https://lists.openembedded.org/g/openem=
bedded-devel/unsub&gt;&nbsp;[skandigraun@gmail.com</a>]<br>
&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt;<br>
&gt;<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_TY3PR01MB101105D2BD6EE318659B34BC69B75ATY3PR01MB10110jp_--

