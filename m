Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D81C0C44500
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 12:56:41 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.0])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.91468.1783082414404664602
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Jul 2026 05:40:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=j+/KP9eF;
 spf=pass (domain: est.tech, ip: 52.101.65.0, mailfrom: yunseong.kim@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uUomLyo80aWumMI7TUbRrYk8CRVdqns4e0vdOobGTdOox6p2DfyMRciKAgSakLiJsYcGaSese3roy3kbcZlSLtwxWCWrEpeA5h+hNbGkntWnCH8je9r2hg+zuAPdfZTcqfhiX+G/t7OO08niceeXw+OyoRod31RxfrC1YDQZVf7AGf3e58AFkbwGNNrAMMQlf6/AUAYRmQNqs9ZbhO0TfNzIEfikdwD2u5BWGrdfDlTQByVftYfKaRgoJJC7fx1EGbDlvl4cw/TW76wPaeA+uBnBc7S6L+taO6Hm+VVCPm4pLSXR3MLUJOIlPAko/S9WA1wSdgsOlI2k8MmCccgD8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oCb/6+Wu/oPcd8e5zZ1ebR9e/28e+5JGoL6L8SjJeI0=;
 b=TrWc6yU5fH3ohOCFQdwyRGTVPDChgxLlVrkUbGulDpbpfPSFl7ScJsOzYovmu+xVGXD9I+AkmE090S5AVb++78swSpHiSpCLKQbyVoSrovruLUoHcMKAdJN4SlFXg9U/z1M0+QJ4x3jff0aXZ1Mv5hGh5jBnjocexQj4FNjBrLv6nQiLI34H+muLGx9WjJjld5GrzAhd/En24+SgHN/TzOwwuyQhUCyGDpVqLjJARzRLkZBBztJvr7afvc6gT4QNFwwnXwOoSFzpmyBX+BPWDJ/eXs6fnA/PIcF0c/4Z7o7fHrtPeS8meJVBykzyUMntX2RzNGx4CElqQ/Ah6MO0WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oCb/6+Wu/oPcd8e5zZ1ebR9e/28e+5JGoL6L8SjJeI0=;
 b=j+/KP9eFAHeVXBQ84aFcFgpfYLFXDx8NL8tX/9u1NbJT35d1OLmdn2xSHN1oPkLTMQBwb17C4lR6cxJRcIcPyXU8jjCkv10tmSu8RmLaayTv93jGR7C4fu2EWyQYt9BiRwium94mvkTqG6LFnKiv+mEOMYVh59Q5o9syKkghWAj/CKH+7fnAMdAXOK0EVNFHHFmCThBML+s/Arm7aXhpiHoKfwUOAkWCLt1cFi3yWbVN56f8815IIRCVmGKwqjCmY58OzeEJ06aWWn4Q7iad64TNjfsQRFpEaVZvrsZ7kXpGqdl5GDXb/ZwK8N3/9oro/hYipFXnj7nZTGb1HUXSdA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1752.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:39b::19)
 by DB9P189MB3573.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:5f9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Fri, 3 Jul
 2026 12:40:10 +0000
Received: from AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
 ([fe80::69fc:c4d4:200b:e4b4]) by AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
 ([fe80::69fc:c4d4:200b:e4b4%4]) with mapi id 15.21.0181.010; Fri, 3 Jul 2026
 12:40:10 +0000
Message-ID: <81a6a4e5-5523-485f-82f9-570f0f121ad3@est.tech>
Date: Fri, 3 Jul 2026 14:40:08 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][scarthgap][PATCH] libyang: upgrade 2.1.148 -> 3.13.6
To: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
CC: openembedded-devel@lists.openembedded.org, yi.zhao@windriver.com,
 wangmy@fujitsu.com, Martin.Jansa@gmail.com
References: <20260702161521.84024-4-yunseong.kim@est.tech>
 <CA+s=J=x=UXDjX=v54irVpP6Ctebm9--stdudLe32cE=S0kFYCQ@mail.gmail.com>
From: Yunseong Kim <yunseong.kim@est.tech>
In-Reply-To: <CA+s=J=x=UXDjX=v54irVpP6Ctebm9--stdudLe32cE=S0kFYCQ@mail.gmail.com>
X-ClientProxiedBy: DU2PR04CA0001.eurprd04.prod.outlook.com
 (2603:10a6:10:3b::6) To AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:39b::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1752:EE_|DB9P189MB3573:EE_
X-MS-Office365-Filtering-Correlation-Id: cd58c6f4-7ff7-466a-a6c1-08ded90038a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|1800799024|10070799003|366016|22082099003|18002099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 
	J4Qd6HOMI0JcF/C8Z/gaaum+nIhHttD+VAEU+OMcaW/Io9FBU2JzEcI8CjDMvb7XJJvs3RPGxCtpFUsshrPcKRr+ZFxlrIBfrfcS/+5duM2eweSAul5GtzvxIlD4sntwAHv8Yaw+QWEFzRI9YgtN42eDJO85vCVgSbL91Nr3cGajkRUhkww/CxAwSa4eKN4FQUokrGYX68bXpd6RxTFi+WF3kR047doM+2YfSsothHaxwzplxsxXsPozqnrx+q2ImXjpk7UR7SyR4UB5CfkHTjHFDDXse2CfrJWasN69r/6prEWko5/q2xA4TzyCejI6Szn459LBOHAydAHWWZNpgIIBzEFlKIQXFIr2g4/2vcnlWmybq97qqu+LaC7+L/0+lzW2eR5j90wnzXGNh/L/vlsyKcCH19Ki3hQBg5nKlrAxfuCfpFtFAfKE1rzwPYfByUOMDt+UZ1IkAFSMGBc1wRpMyLgnJZUGlLKpS0sD2b2JYq3ktWHt038EGemu1MBHFKqI9Eu1ReGjQ7tIdAk6nNvlurk53gjX2qss+vJcl0248+/niyF2pZMU9pPbnA7XHr5a3Gdhc0in+FHvpJBYe77IHxaTUGv7CQ6LkmJz4gh0nyWY/hRDukDKYlRdZlzJ9xVYqakVQ09BpkD2o9kGfa68h8USPfmzu3Gj/TG6HU8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1752.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(10070799003)(366016)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?NgUBvRxi89ZLqbWzSaX5WpMKNP5eT+Lx+h/mbP5elIGAI16DGaMLktEGch+i?=
 =?us-ascii?Q?N+hW4QyEk3e/5JFI97ShOH8TFC3+iVo26HVnz2TGVuIDVgBU1Ai/KOxOMV9d?=
 =?us-ascii?Q?K9Mdm3fl5P/J78zJriVrYTqqLV4DzS9lUvW1Fc2TykMk6H9bv9H3ZDbQSCDt?=
 =?us-ascii?Q?W4UjySVc5rqDBe7DomVCuq5wYAn9MLOrw55XKOXmZZQxc/cU0J3Rfg3Rnz3W?=
 =?us-ascii?Q?ufMmTPQ9Nq6xA95jQITh/1yYGZhzAB0eOxcAJmnrxiQCPiO9BC3HtTYhVEtD?=
 =?us-ascii?Q?UgOgI7IoQ8HDooCfZ3NARrfK5WxoDkfwL0nfVr4cuXqY3Woz2CrWazD3KEla?=
 =?us-ascii?Q?sDSc++tOphCz2hoQIYv8nyx591gDEiyCY9r+y/++Rc7jNm7ACmbI0+JOb9pm?=
 =?us-ascii?Q?GQHzCkKJXwRj461PZnb74Gc5y8XT/g0iZ9SM75yH+x7ZzcV+isI7Jeb5JNy0?=
 =?us-ascii?Q?k3UASNO7SAGkgBfX+qa+OWezUhWp/MclizrSQ0aNAhLNbUpIMtngsDKjlZdS?=
 =?us-ascii?Q?5/6oG/5mygmdvXUTm9+mGub2NcZfXp4zVceTdrjgTl/ws43NRkCIltgWgFww?=
 =?us-ascii?Q?cpw2uB7j+hwg/ztOb6YrPnWCvzcCQ7AHKklhjpc9SXgRkyK4kyPI6BtY3Pbj?=
 =?us-ascii?Q?dJj4qktIi7mtdfWkbjrCRMjlsZDqZLGFNb6O02mgwyrfs5pWuscNiOSsUMfc?=
 =?us-ascii?Q?Yvs2aBtKsTrmbp76lp+4RdRVYa8noK+mDAmUJf6S2j+yndiChpC8Aau7YIfV?=
 =?us-ascii?Q?Yq7HXnNv/q/FbLW2u1AyfAVNhl2Ppve1SSd1bblqMutyM0jpBz/mO1qKMG/e?=
 =?us-ascii?Q?HJ3Qv0C7IP+PwW/z8RDKKNfFB9Kq1wrmwnX9fX27/AZhf7fmHfyItZJAVsGu?=
 =?us-ascii?Q?xhj/aaTnw2ysZyJvu+ba6xFsW0YYj2PXedOKDrEhCqLoeeKKK28Nm8jlHznF?=
 =?us-ascii?Q?KVYvLNKvrdXixLb+qIHKi9+9YRnENgWhB++Pl97tqRlx73Rn+c9m2DxpA+nw?=
 =?us-ascii?Q?5t7Cojb45y37Wv2Y0Ec+ZCNkPhW3MT/pVWaVVXPGzh2xXZFMQe9RV0PEcYf1?=
 =?us-ascii?Q?dpqqV08K1NCFGBzir3kpGWr3EB9F9SC0N9flFFK+Lg+qa9N6eiHN4MZDLy/u?=
 =?us-ascii?Q?AJ0sVit3KNmEay92cXtK8LYRWpIkvuFsX5QMLETm4QD3nB0DROGJWWqvXZpu?=
 =?us-ascii?Q?bg+fEGE+s/8iEtD+8f7lmV3ccvq5EhzbSprFTBhai/ILzcg3uGnQqDJcthKy?=
 =?us-ascii?Q?1OBMKu9o0qNi5bkrxAatQQIC5ypDALy+xC5Cuvi5KaeWYhxNmcHESrvbBNnW?=
 =?us-ascii?Q?sX2pCtxi/mORvUHrJTGmP6J8NCw5rTPKyIspjGji2G5qizUeDaNRwpmVp1Pl?=
 =?us-ascii?Q?X7JyQivBGDS1xyDiMOZpimos0Cwwt+r15JVWOodo1T8Ohc+OS0FsTFFLDoTl?=
 =?us-ascii?Q?X5IDhoRbTeW8K9YQfNvYBU738jTnV17GzkwF7PnpjTnZkSi8d9i/Y7v4BqYs?=
 =?us-ascii?Q?ALTH5HS/b7mjKmjCwLfC4pmmgp6FT3RwygsyTWgYq9Fg4aDeYHD3S3CWzubB?=
 =?us-ascii?Q?G2Oa0XxRbranstB6hmRq2rdyzJ/yW4HAZS2Zp8IN7IAjNBuUsIch1I6hb0il?=
 =?us-ascii?Q?rDui53Zi0fW0BmU0VxykaJsMvSd3WfiJ1UQLkT8wY36D2HBli6Eu4950VONs?=
 =?us-ascii?Q?VJ6PzgXUeh8ZIpG2uhoFLRFTynb8HCPXlGr9atrM2qLnyCq2udm4QHOqzakX?=
 =?us-ascii?Q?VAJ1vAnFZTQObuDnpaPKSiwH1RWxqbjheO15+tgWAc/bGla49/DSD2KvbX19?=
X-MS-Exchange-AntiSpam-MessageData-1: rTPX42tLs+YSag==
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: cd58c6f4-7ff7-466a-a6c1-08ded90038a9
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 12:40:10.8200
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PekmdoYEKuy0deVHKapblpBVqnGsydMHrcXxRTK04oKgW2Wj0U54yue6N05vbvLM3nCR8yCGjsygsJNE3uyieA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P189MB3573
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Jul 2026 12:56:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128009

Hi Anuj,

Thank you for your review.=20

> On Fri, Jul 3, 2026 at 1:40=E2=80=AFAM Yunseong Kim <yunseong.kim@est.tec=
h> wrote:
>>
>> Upgrade libyang to align with the version present in the wrynose.
>>
>> ChangeLog:
>> https://github.com/CESNET/libyang/releases/tag/v3.13.6
>=20
> Why do we need to align the versions? This version also seems to be
> backward incompatible and that is not acceptable for stable branch.

I agree. I'll drop this patch. This patch was CVE handling on v2.1.148.

I realized that after sending this patch that preparing a CVE patch set is
a better approach than upgrading the version.

> Thanks,
>=20
> Anuj
>=20
>>
>> [snip...]

Best regards,
Yunseong

