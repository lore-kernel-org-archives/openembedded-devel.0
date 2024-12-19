Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69A8CE77184
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 20:46:56 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.71])
 by mx.groups.io with SMTP id smtpd.web11.138476.1734641207437313659
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Dec 2024 12:46:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=G57JGcvl;
 spf=pass (domain: siemens.com, ip: 40.107.21.71, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZxNN70TF1UVTdf0WV0IiY42C83hmXpGrEzJe1r8lOOAtpUUSCYVuzPdfbmknwLT5c3JT2aXJwllcXdmg9/S+AsxjOkAWj5ou2yygZ3IfmPcm5Rzji4/xs0WnaWxdMGks0L/QJU3BPUJp+06ohLEzHdbvLLqYG3BXkRjJWtiSqOfxMEkg2Q0GJCe3oOIUeC4FexVhqrySkdHbr1ZANllgG8qihYNFxkqLk0D6B0mSWERl/Dg7gkXcceYT6py4AbzolsPC/IT+XWw71p6AP8z3UMtMV5gDUNo6x5FwR0m7WMiZrC7LI+g7r32foHDDmkr+N6z9BQgn2omqc1ddi0u0vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yCo+5dUAKD36z2LEZAY9E7wI12lIGF55BYlgNseZbNQ=;
 b=JiMPLVWXRubJTgIzi3TV1jU564f1HcAbwcUKFA2yhjldkwXvBXNXTfFi6eawyT2x31aSM9aXsON2XUC0s3syCjKcv+we0los+mBfUjT440SrRr8wHu/YTTrJWKhIOvh+m3dS5Lhpl8nmmaZd37fV4qQ6EAx4SMAeaPxa4k8Yn5G655bpGwgSZpJ3SIjEgUaD4Z9GXS2rT+OU+ZrJ7gEVr3k+KieyutwUZpfR4UTo/d2oLRU2nLwLn02LMK+utkMmzUlXo/yOoeFv0mU0FqUn60u3WEUZ+3dHrR91qoLYbuqjZdL/nrY/WT0JNq9BYNUwjrtT+NafZCKgKZUILzS87w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yCo+5dUAKD36z2LEZAY9E7wI12lIGF55BYlgNseZbNQ=;
 b=G57JGcvlMGJMw7acJ1IQGbiuO/M0bx0+jarTayPOlljAo32GX4Jc0mhdd09VR8uUbEK5oqpVGnB4j8JOcUmIga6l5NZeV+6mFYbkcNQO76yKFbuW6vbV+gkETJsnUh0du4ebd1nB5Hfa9FA2SybUYj9v12cT5U2cYg3LVyf32qShFzW+K2bhAvkpgiWG2vFIuso3uG0IHDCb2ZuLA94TWc4kuK//3Z+RUF/IOCYzxDMFKtLZMdncOhvU453rHCsarBk2qhTcSBc8kYdm4zFk0P4JrjVoMKiMCA1li3gpcLV/iPGjv+JwETytYMdTW6Z1qQk2Q4sLI1IyvHcSLgvdWg==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by AS2PR10MB7324.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:604::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.8; Thu, 19 Dec
 2024 20:46:44 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%3]) with mapi id 15.20.8272.005; Thu, 19 Dec 2024
 20:46:41 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-oe][PATCH 01/12] ace: ignore CVE-2009-1147
Thread-Topic: [oe] [meta-oe][PATCH 01/12] ace: ignore CVE-2009-1147
Thread-Index: AQHbUlSUwSdJgbT/mUGYHBfVLkz+sbLuB66AgAABukA=
Date: Thu, 19 Dec 2024 20:46:41 +0000
Message-ID: 
 <AS1PR10MB56976AF253D8FFE1A87E9D79FD062@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20241219202738.346121-1-peter.marko@siemens.com>
 <20241219202738.346121-2-peter.marko@siemens.com>
 <CAMKF1sqaw7-tFFzK33JdLrEQQQ++GxDb47eStx5wb6zhyrAwWA@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sqaw7-tFFzK33JdLrEQQQ++GxDb47eStx5wb6zhyrAwWA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=89de68b7-d84c-49e4-80a9-145867135b4f;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-12-19T20:46:10Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|AS2PR10MB7324:EE_
x-ms-office365-filtering-correlation-id: 2be75d1b-2789-45db-ad7f-08dd206e3e36
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|4022899009|1800799024|366016|7053199007|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?RXpUV0kzUXUzNXZwRUZTbW9mclZQd3pSUXU2SWYyRXVnRyt5eXlRZjIyVVBF?=
 =?utf-8?B?VmJKaDVKWDFsSFhtOExlajZIeG1PelR2UGdCQkdZWW1RQ0NOWkdjd2xjSFg1?=
 =?utf-8?B?SFY5aW5jMDh5Ni80NEl3amlwdzc5Mk82Q2J2clI4RWJVa2hURWZRa0VHalo5?=
 =?utf-8?B?Y0xoNm1pNVdQNGlxNjBRVGU3VFhtSzUveFdlSEcrZnBRWnFoaWNwRy84MTJj?=
 =?utf-8?B?cVJsK3gwQ1Rwb05RNGNKekVqSCtiK2ozNWg2aEM1ZitDblVHYnpuTFZHZnVC?=
 =?utf-8?B?d0hzUnZqZjMzWjhQV2k3M25sRXREdHdxUHlwSllzbU42OExUYkF6UWU5Z2Rq?=
 =?utf-8?B?Qm9qWllMVFRxWTEzWVIyTldVS2xnUVE2WWV3eWxUYmwyNUdwSFQ2VENRLzJD?=
 =?utf-8?B?ekhEcjg0SlA3d3NLVWErQVB1WHEzTFlHaUpkdElNUU82MTVXdTQ1N1dEMXkz?=
 =?utf-8?B?SjVoTUlTMkJacE83dWRsc2tPQ1RyY1pQL1RybEsyODBlVXYvY3J0SUdGNHRE?=
 =?utf-8?B?by9sTERZcmQwR0lwYVhhc1BpRHl3RHR4cFpEbzNrTk4rZHJzaTlLY3d5QUk1?=
 =?utf-8?B?QnZKakErYWlPazU2bXVibUZZVGZtc3VDWFRLMVlodkQvSVVFeGVUaE5nam95?=
 =?utf-8?B?dFcyZ2FzK1RvNnBRQUwwZ1BVSS9JalZqVzdZTHFRaFJOVXBOVDU3MTg0WHk5?=
 =?utf-8?B?ZTdSYURIUnZtcTRlRWtabjFhZlhXb2doeExHY3Z1OFdQWGtsSU8xVWd5YmRU?=
 =?utf-8?B?UFpad3pwZ1RtRDNUTlBBU0pPZ0hjSVgzU2dWUmtaOWYvV0paZVRFeVFVbDdK?=
 =?utf-8?B?YTFvajFHb0g5a212Ulh1L0U2d1h5RzBhd3cxUGIyZWZXdjE3Tzd0NVk3YzNJ?=
 =?utf-8?B?WHVyWFBrZVY4M0NrOXUzbkE1M21XbWNoWkpVa0JBOTFPZXltTHdTOXRUeUEw?=
 =?utf-8?B?dTczSkh4V2lUdnAyZ0RaZWdiQkxiY3VnU2lUdDJVelZ6bUVrY0pUbzJsOFdO?=
 =?utf-8?B?V251NjU5aE9DbFlmU3RKS1A5OHRzMmZzS04rR3lsRkxGeCswUVk4R3NuUllR?=
 =?utf-8?B?SHhYcW55STZGOS9WSzgycGtFVjRLYVNHbjdpK2sxbUlpTjNTVUhiWnlwQkRV?=
 =?utf-8?B?ZUEyczlXckFqdUQwdURzQmxIMWRwb0trUEhrSzVBRVp4T2RqbXMwVktPNWxB?=
 =?utf-8?B?eURsWHRJUGJ1bmVhNUl5N1ZGcU5YYmFOaURJZjhML3Fham9PNzk3WDVLS1pm?=
 =?utf-8?B?N3Zub1BZRWo2c2RZUTA4b0d2Uk05NVFNcktESDF1MFJNbnZKWXpwSzBoblAv?=
 =?utf-8?B?RGVVSWlwci8xUzk0d2t3RmpmdzNZdDUxTzlFUFA2c0ltT1BjanJRT25wVEpw?=
 =?utf-8?B?NE5vVHlkSDBtbHR2dTh0OGVtQmpVbGhjejE2TzZjVjBRWXJXVG9aL3pKWWNr?=
 =?utf-8?B?SDhuNW52bU1XOGlrNTVtTndhdURQdEFseXk4UEI4Wk1EaysxY2RzOHo5VnJT?=
 =?utf-8?B?QnlxcHNNR05BSS9LZWk1TGRIeCtpZXlWUTVtZWxvN094aFBwU3dYR3BybkFT?=
 =?utf-8?B?QmQwbU00QnFkSDRBWDBVVmovNzM3Z2hWdWdyT2lBK01QZnNaMkR4MXB4RFRo?=
 =?utf-8?B?blBpQnRGb0xqT3VqdEZPT3JEYlFyNHlLeUM1UWI0LytTT24xV3NUOUFRRVl0?=
 =?utf-8?B?c1RCaVdqaksya0hCb3Rka2N4YThyKzJlOVJGckRnWlFWbnVDR3dwalBvNTFw?=
 =?utf-8?B?ckozc213TUl4VUtDQS9EUWw3M2VDZWk2Wkt0bWoySkV5T25ST3RKQnBZSFlX?=
 =?utf-8?B?K2J6cGZ5MXlNSTBFVFZnTGpVY1N3eE1NSkJLYk44SWgzcjlXc2FaT2ozZE5n?=
 =?utf-8?B?blIzVzZ1SnNxZW9SdnNYUFVCNWJlbUloMU1mdUFUMHBSY3l3TkFjZDgzcGx0?=
 =?utf-8?Q?YGSPzi2mMcJAhEa+9cWcteeIdiwehu5A?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(4022899009)(1800799024)(366016)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?MFZGRXNvM3F1elR0a3M3a0czT2o1UEFQdk5QaGY3WXBmYkV5bGNWQ3JhS0sv?=
 =?utf-8?B?UGtqUldmTkNVUzJGTnBjdzZEUEpiTDh1Rjc1UkpOd1gvZlBkOFNublE1TkV1?=
 =?utf-8?B?VjBwaHh0SVdkZTB4djc4RWFpZGl1L292VWwwd3luVTFqVjBleFNycmJWKzU0?=
 =?utf-8?B?SHlPT0lUaFpOeFBNbDNpNDd0a3gzTTR3RGhBZU4rQ0lUUkVheStrdVdGbE05?=
 =?utf-8?B?R3lpR3V6Vmo0eTdRMkV1S083SXUzaFNPY1pQT1dyTzFmaFVGQml6U1FReFZs?=
 =?utf-8?B?N1E0RHhkOVNOcFVDQ1pnMnd4Mk4zQ3MwdEYwRmFUK24vM1o2RGlpbGVacUZv?=
 =?utf-8?B?NWsvYSt0SnJqbXVURk5ydFlJWXpjTVdnUzd5QklPaXJlR2FMbUtwVitxc2R2?=
 =?utf-8?B?Q3hvMmxQQ01MWk1RVjRRT1g3ZXBGdU5ZQmJlT1VTVmVrNmZUWUV5S0NoSG1j?=
 =?utf-8?B?VTdsejdrdzlyNjNoL1dNckhsOFJoSlBHQVpJdExReEorb3lnVS9kTlgvUjhC?=
 =?utf-8?B?TENHd1BkV1pCMEpnSTJ1bWxqWnRzM0lVVFVlQ1lDRHVDYTZBVVMvakIrejl2?=
 =?utf-8?B?UnFGMmpkQ2NFY2tuNWcxWElXcDN5dzdnNC9DQ2JUQnQ5Z2NxWGNtZWhkb2la?=
 =?utf-8?B?cEdjVHJ3bzEvY2M3eWVRRU91L09lZ0cxWHl1M2RNM2JISW8zUHhaMXBEeFJj?=
 =?utf-8?B?NkFmYlV4YmhOYTBUNmdNeEpoaERaN1VHNmxNWlY0aHQ5VmVHK1RWMFlyYXhZ?=
 =?utf-8?B?N0xrNTIxT0dUNnk5WVAvQ3ozTnBSb1RoeUZPc0VBbTErcjd3bllGQzV0enRk?=
 =?utf-8?B?MVhMNmdhQThHUTdpaVR0bE8zd1BIVWVzYnd6VVVUcnplRU1QUXBudkZWeFdy?=
 =?utf-8?B?ZWxmcXEyRHdOYlFmYXk4c3Q2dmRCbjFSQVRieFZwejQ2R3Z1YVNaYmEyVzhP?=
 =?utf-8?B?ekV0SlAzTmlCdWNUczViZHBEVktCbUFDTDlxNCtUWlo1TmNQRW15MTZ5NmlO?=
 =?utf-8?B?Rll1VUdsYW1sQkM2NUpXZ1FYQWhOWnpicmlSbTY3TkVOODk4NkFaYXQ5RDd0?=
 =?utf-8?B?cGd3aFEvdmV2YUNaWnQ2U0pMUFl2ZS9iV0lJQWN4T3dvTTlqVSsrNmNEQjJM?=
 =?utf-8?B?ZDVRZTJRcURjV1RWVkgwOTF4ZEc2WVdHalJ2dFdmQjlGNFVrOVNEQXAwMnRP?=
 =?utf-8?B?Sk5qeWdkN0VkK1ZIRG0xQStUdHlKM3djc29sT25YQ3lLTHNqVlVLQ2hkK2d1?=
 =?utf-8?B?TTcyNWl2MGNER1gxR3dqQjIzMUs2RER0WTR4ZStaN0JVYytQZ2xXYVJsTEtJ?=
 =?utf-8?B?QlZGQ1cxRjZwQ29FM0JiRTRFK3F2YWVRRnNYSnNtWjRQNndoUHdNWWNhWXJm?=
 =?utf-8?B?REN4enl0RWM0YUpacldXSExUaDB4U1hidURVTDBvUllkYm01Vk44aHozK0pw?=
 =?utf-8?B?ZTFKQUJ2RHRCc0FFOFp5Y0RRNElXTFZRMnB1ZmQ5Yk9YRDV4Skt1WWV4UGd2?=
 =?utf-8?B?cVZCTlpOdXBubmVLV0tmQzNIUmNqa3lyczgxS3d3c3VBbVRHSTloaTF3c2tG?=
 =?utf-8?B?cEJyNGdTTHlNOU9OQ0J0NVFPaUMwWWt6Tnd2ZkN3a2tuTEdJR0VNaVpvWEpF?=
 =?utf-8?B?RFpMNjNHWUhITkxIenE4SGY1UnBtWmxtTkI4RnBFVnN2YjFFRVE2dldjbjZI?=
 =?utf-8?B?NWRKT0RzS1BML3dTV0p4SEpLeDg4aENIZE9hZSt2amdkdDM2WGJmcS9maEpv?=
 =?utf-8?B?Y0g0SGJlYmpteUI4NXN3ZUJhSjlzdkpWb2RqSktoamhVUXRkNjNTQ2c2TzJP?=
 =?utf-8?B?QzB1K2lHZWM1L2w4blRlZCs3dEFDYkxqVGxwelJoY1pENUtQYzFnZE43amdk?=
 =?utf-8?B?Wm5xaHJWZmlDS1JtTEFoczFMTmRnV1dDNXRuUWw3OHpjckpUZXpzUDlGcmNV?=
 =?utf-8?B?a3lJRHhicmZITnVoR3ZrRStSMzJEWUJsVUI1OFo5MWlaQjV6V21zVFNYOFNF?=
 =?utf-8?B?YkVBbllUVHpoQzVyazNsdHVXQnBJbGtTdW9PMDk0ekdXdG5BcmtDZGlTYnpU?=
 =?utf-8?B?R29Ddm90MHpKZG5zNlJZODNxSlJZOU1jRlNNdVNKNUZaU3VNVmpWUFVQS2pP?=
 =?utf-8?Q?FrbLXlzKzBjSQC3sSkd9wUaqd?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2be75d1b-2789-45db-ad7f-08dd206e3e36
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2024 20:46:41.8675
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zLfkDseX20l0U7R6ughphdSzGxtu/zIBGNXUdfviNxo+CMSkBqe+G8py0Sa9lcpP1AoWevWESNmjU/kROX11PA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7324
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Dec 2024 20:46:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114415

SXQgcmViYXNlZCB3aXRob3V0IGNvbmZsaWN0cy4NCkJ1dCBPSywgdjIgaW5jb21pbmcuDQoNClBl
dGVyDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS2hlbSBSYWogPHJh
ai5raGVtQGdtYWlsLmNvbT4NCj4gU2VudDogVGh1cnNkYXksIERlY2VtYmVyIDE5LCAyMDI0IDIx
OjQwDQo+IFRvOiBNYXJrbywgUGV0ZXIgKEZUIEQgRVUgU0sgQkZTMSkgPFBldGVyLk1hcmtvQHNp
ZW1lbnMuY29tPg0KPiBDYzogb3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmcNCj4gU3ViamVjdDogUmU6IFtvZV0gW21ldGEtb2VdW1BBVENIIDAxLzEyXSBhY2U6IGlnbm9y
ZSBDVkUtMjAwOS0xMTQ3DQo+IA0KPiBDYW4geW91IHJlYmFzZSB0aGlzIHNlcmllcyBvbiB0b3Ag
b2YgbWFzdGVyLW5leHQgPw0KPiANCj4gT24gVGh1LCBEZWMgMTksIDIwMjQgYXQgMTI6MjjigK9Q
TSBQZXRlciBNYXJrbyB2aWENCj4gbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA8cGV0ZXIubWFy
a289c2llbWVucy5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+ID4NCj4gPiBG
cm9tOiBQZXRlciBNYXJrbyA8cGV0ZXIubWFya29Ac2llbWVucy5jb20+DQo+ID4NCj4gPiBUaGlz
IENWRSBpcyBmb3Igdm13YXJlIGFjZS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFBldGVyIE1h
cmtvIDxwZXRlci5tYXJrb0BzaWVtZW5zLmNvbT4NCj4gPiAtLS0NCj4gPiAgbWV0YS1vZS9yZWNp
cGVzLWNvbm5lY3Rpdml0eS9hY2UvYWNlXzguMC4xLmJiIHwgMiArKw0KPiA+ICAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvbWV0YS1vZS9yZWNp
cGVzLWNvbm5lY3Rpdml0eS9hY2UvYWNlXzguMC4xLmJiIGIvbWV0YS1vZS9yZWNpcGVzLQ0KPiBj
b25uZWN0aXZpdHkvYWNlL2FjZV84LjAuMS5iYg0KPiA+IGluZGV4IGM3OWZiYTMyM2MuLjg4ZGY5
YWU1ZGYgMTAwNjQ0DQo+ID4gLS0tIGEvbWV0YS1vZS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9hY2Uv
YWNlXzguMC4xLmJiDQo+ID4gKysrIGIvbWV0YS1vZS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9hY2Uv
YWNlXzguMC4xLmJiDQo+ID4gQEAgLTE2LDYgKzE2LDggQEAgU1JDX1VSSVtzaGEyNTZzdW1dID0N
Cj4gIjhkMzc5ZjM3ZDU2ZGIzM2YzYWU0NDc3MjViNjMyZDQ4YjFjMTNlODg3NTkzNTQ3YWMzNTY4
ZTNiNDINCj4gPiAgVVBTVFJFQU1fQ0hFQ0tfVVJJID0gImh0dHBzOi8vZ2l0aHViLmNvbS9ET0NH
cm91cC9BQ0VfVEFPL3JlbGVhc2VzIg0KPiA+ICBVUFNUUkVBTV9DSEVDS19SRUdFWCA9ICIoP1A8
cHZlcj5cZCsoXC5cZCspKykiDQo+ID4NCj4gPiArQ1ZFX1NUQVRVU1tDVkUtMjAwOS0xMTQ3XSA9
ICJjcGUtaW5jb3JyZWN0OiB0aGlzIENWRSBpcyBmb3Igdm13YXJlIGFjZSINCj4gPiArDQo+ID4g
IENPTVBBVElCTEVfSE9TVDpsaWJjLW11c2wgPSAibnVsbCINCj4gPg0KPiA+ICBTID0gIiR7V09S
S0RJUn0vQUNFX3dyYXBwZXJzIg0KPiA+IC0tDQo+ID4gMi4zMC4yDQo+ID4NCj4gPg0KPiA+IC09
LT0tPS09LT0tPS09LT0tPS09LT0tDQo+ID4gTGlua3M6IFlvdSByZWNlaXZlIGFsbCBtZXNzYWdl
cyBzZW50IHRvIHRoaXMgZ3JvdXAuDQo+ID4gVmlldy9SZXBseSBPbmxpbmUgKCMxMTQ0MDIpOg0K
PiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtZGV2ZWwvbWVz
c2FnZS8xMTQ0MDINCj4gPiBNdXRlIFRoaXMgVG9waWM6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZy9tdC8xMTAyMDQ2MTgvMTk5NzkxNA0KPiA+IEdyb3VwIE93bmVyOiBvcGVuZW1iZWRk
ZWQtZGV2ZWwrb3duZXJAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA+IFVuc3Vic2NyaWJlOiBo
dHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtZGV2ZWwvdW5zdWIN
Cj4gW3Jhai5raGVtQGdtYWlsLmNvbV0NCj4gPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiA+
DQo=

