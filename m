Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6A57C25B74
	for <webhook@archiver.kernel.org>; Mon,  3 Jun 2024 01:52:13 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.73586.1717379528741698380
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 02 Jun 2024 18:52:08 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6884dc6aeb=mingli.yu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4531VVJB008343
	for <openembedded-devel@lists.openembedded.org>; Mon, 3 Jun 2024 01:52:08 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yfrux9c7x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 03 Jun 2024 01:52:07 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4531q7vx003340;
	Mon, 3 Jun 2024 01:52:07 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2040.outbound.protection.outlook.com [104.47.56.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yfrux9c7w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Jun 2024 01:52:07 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PeZsXe9Qx/6wRIsQGkzxUeNek8oBibIvPWwxvklufkkc1vyhWN2ztBtri+yqN43MNhkoAVuISGtMNHHtAg7cpmF58B+SK50RGxOKIQbNgREXrK4WpDrQ2wKBNT+UM5sNgzzQQ9iaMANSsxSIlHjke6RD6khT6F1rcm4f93/aLYfhjbLg7OmbM6QYBN+qXSuOSxeF1YIQ8bMz2Z+OLi0gTHoM8BQf24WqFaRV/stDHzAUVn/ao/c1X4g9YxDDKknZgKbx4jOxsKhXdvVfSQgo3GqY95wzGOT4tj6Rg+82NfW1feq0+j6PXpr3IvmrzCzuQV2Twybqt3hcDDTvxcd7kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1hYpbZxiuHzODQyVjLh1o8wJtIwrFTCZ7MO8iJgnlzc=;
 b=kPT8OIDKhWFXDbknHPooc4pcJsukH2YxpEWr1NJG70cvWH8CsGb5Zes8fzfL0BOBOf6QdkFxoHXPuAywcNCQ7mHMd9EIWFAkkdUVaIcpNXmscpTYfsu5xfsW2VlO8QWs+kdYo14Ih30nTEHNQzUCPj/ZurmE/t22fSUrcQDWRjesa+jpms+Z1PfCFpqKcEuTHSq3wbP5FD8/PaF/1Ml+r6cVFsxx3NBjYJS2pf0Xwsr99z89HEQ592H/VDq8obP0fx0+RpId1HIX64abfEoulonNUDVxXHeOlEgjI3iejyO02QCrChnTuv2Fam9ooP1KKC/4AK/Ai1nW+K5dRoz6Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by SN7PR11MB7707.namprd11.prod.outlook.com (2603:10b6:806:322::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Mon, 3 Jun
 2024 01:52:04 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::b03a:b02:c24e:b976]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::b03a:b02:c24e:b976%4]) with mapi id 15.20.7633.021; Mon, 3 Jun 2024
 01:52:04 +0000
Message-ID: <303da9bc-77e6-4f2c-bdd7-d72ed34754fa@windriver.com>
Date: Mon, 3 Jun 2024 09:51:58 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-python][PATCH] python3-dasbus: Add new recipe
Content-Language: en-US
To: Tim Orling <ticotimo@gmail.com>, mingli.yu@eng.windriver.com
Cc: openembedded-devel@lists.openembedded.org
References: <20240528095659.4123056-1-mingli.yu@windriver.com>
 <CANx9H-BYs2hEx0FZorOfjHSq7qFZjCtZUU1Upnyw_BiJyNJmDg@mail.gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
In-Reply-To: <CANx9H-BYs2hEx0FZorOfjHSq7qFZjCtZUU1Upnyw_BiJyNJmDg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYCPR01CA0092.jpnprd01.prod.outlook.com
 (2603:1096:405:3::32) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5009:EE_|SN7PR11MB7707:EE_
X-MS-Office365-Filtering-Correlation-Id: 064ecfbb-7604-4cc1-acb2-08dc836fc45e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SzdHNFB5RVU5NkVPWVJRSnA4akl6cGpBTVFQbTYvcGZuMmlLdmR5VDV3UGZ4?=
 =?utf-8?B?U1hPbTNkb0RERzVZQ3RMaE1FSWZ6cjZNYTNsdFhBendzSGgxL2hFZEkydFVv?=
 =?utf-8?B?cUVsME5PclJpWHMwS0wydjlNbVMySEpRTUFDVGFnODg3eTJzeGdlTStKc3Mx?=
 =?utf-8?B?Rk1udm8zYlB6V00yblF2OGw3NDNVeVRxdnpHRDdwdnJWbnZEbG8xWGQyU0pi?=
 =?utf-8?B?c1EzV29Eb3BlYjF0Qlh5ZmZPQ0xudUF2R1F6STBZWnVjYzlqTFpzc09INDlh?=
 =?utf-8?B?MkVOSEZoSFUwL0UvUkh0V0ZaMTJOMGJKNmV2OE4yVlpKL3lOTDBlcUw0MXlt?=
 =?utf-8?B?WXY0KzlZSjNnMGV6SnE0MXlrYStkTnc0N0NiNUVYVlMrY0s5RVR0MzdkOTJC?=
 =?utf-8?B?TWxrTlF2QkFYOUsxdEVYdDZwM0t3cTRWV0lmQytnNWdSbWc4aDVHME5FZktx?=
 =?utf-8?B?TUsyUk81N1p2NHFRS3lkSGtMd3VnTFc2KzNPMjFDTHlLRXNBMkRlNWJ4WXBQ?=
 =?utf-8?B?cC82NzhLOUNiRng5LzUwRUJvdTlWemV6M2FlNDFqdDhJN1ZqZkdnMkpOditM?=
 =?utf-8?B?dmVCdjRNbUZBa25WdXpBQUtzbVBESFFmb3Q5N0VON2Z0b1NvUTJBakFoYUov?=
 =?utf-8?B?U25zL2dXRmFiQit2ejM4TEJOVW9qcXBqOG1GUnRnK1VON095bUJOVnBXMGFB?=
 =?utf-8?B?TlN5b290WHpsRnFnVnpsbWxJeDZHQ2NieGlXRkdMeVlxQlJqTUVkQzlHOTA1?=
 =?utf-8?B?Nks4TWJoL05vaFBia1E3MlFQY2l2bGhQYlZyRGlPdUpZa2tVZ1drOHZNZk84?=
 =?utf-8?B?QTVIWmFTcUtibGFyNmlNUGQrZVRza1NSSnNKVGZURDRBcjFwemhYeVB4NUUv?=
 =?utf-8?B?MEh1cDkvTk1HVjlqUmNReStwM1B5RlU0R3hpdWEza0k4V2RjR1JkNytoR256?=
 =?utf-8?B?d0d2QzdWc1Nndll2aW5jRldlYTdSQkQzelNkR29Vby9rMVFyOHY3NndZNjk1?=
 =?utf-8?B?WS9KekJncHdnUlFrVlQ1SnNFQ0RiRnN1ZnFOSFhDazBCekxpOHNYTUJQam5Q?=
 =?utf-8?B?bmQwTVlWMlQvdXcxVFVJYjlGUjJvcTdoUW14cldCRlM0dnlkdGJhdW9SbTRa?=
 =?utf-8?B?akZiVTZxSTYwcjVwazFqRWwxVXVCWUcrNFpJRkZlbmE3bW1NWFJGR0pyUWt5?=
 =?utf-8?B?SWdoL1NLSmw2bndXQ0p3TmUyejRYUUFtVXMwRWlvSi9BczZoZjhraXhHRUdl?=
 =?utf-8?B?VW5RNnNmZlBMQ0wwVG5DMldFRm1nZlRDNVJTYkZUOXg0R3lCcU5YYVc0Vkx3?=
 =?utf-8?B?Sm11NTU4dmpwU3VTSkFCY3piSUU2K2pQY0kxSU4wN3lUazhvY3ZST2NSZ20w?=
 =?utf-8?B?UDFKMFpHM0lTVlB3Ty8vZjFsVjRmaWN6R3VRRVhiT3hmSWtmdnZUQS9YeVBs?=
 =?utf-8?B?eWcvcW9wWVZSaytsdTRpU3dMSCs4Zk9EL294bGFSU2U5bGlEVHNJWVdNdDZP?=
 =?utf-8?B?TTZySFZvYkFSMGp4dmRNa0k0QWkvRGFZc1VrMndDMmNjZFJJNWxENHVubVJ2?=
 =?utf-8?B?NHoxR0tXblBoRnRtaHZIOERlS3IzNDN4RnVtd281VllUZ0QwV2w5QTgreXpx?=
 =?utf-8?Q?uV0dI2bWeph5sK38lfkn0nRzA5LM8cdoeaqfFeyM4tqA=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?R3BwRlRvSG1zSEx3emtzR1hxZ0tyL2pOTThwbVZscWZWY2xETmFvQTBWbDAv?=
 =?utf-8?B?Qk91V1g0SWFKZDRnZFRmNjdWcEJXWWpwSEhsUUkzRUwzRkFWdXZzR0xoRlUz?=
 =?utf-8?B?Tm9zaWpXa0k2MWh4bXFyaHg0VW94azBmS0g0b1ZlNDY1d3FXblk3SVUxR3pU?=
 =?utf-8?B?U1FRN0pkWHZEUVF5MUxyRjNTdHdiWVE0M1o5K1JFOWtUTEJjbEY4NDN5QnlR?=
 =?utf-8?B?Yi9IY0swTkxxSUh4YTM1NjltWjNrdTJKWDAxOVpaVDRaV1pPbXlzbStKR2hN?=
 =?utf-8?B?dmx1RUd2MkdRbGV2clg4Um85Q0UzSWhzeEZwVVpjNHJ0bElaaE41VldFelRw?=
 =?utf-8?B?WFc1VElHdlpsd25jS1pTSTNYRXJFYmpTaWFVbHFrZDNXWTUwMVlLM3Q2blRn?=
 =?utf-8?B?Tjg2dU1tVXA4aWpCNWFuVm9XU0YvVlM3RElEcE1tSzJyYXRYbGV4eVZMMk5m?=
 =?utf-8?B?WmJvcW5YQnNNN0JvYWk3aldvSUV0VmI1ZUZDQ2Y5cmpjQlJTSE9UUC9teVFx?=
 =?utf-8?B?RG5makE5T0FYSVhIRjNHd3VEUzA4dlpwcGoxOFB5a1pKazVhc2xFcmdiT3Jp?=
 =?utf-8?B?amIvNk9hTGRTeWZReDhLRUFuMzJlemhjS3E4L1l1SE1hbHhmSHg1amlkbjJt?=
 =?utf-8?B?N09CLzFucnl4NXZWdkd2YXdsRXFuM3c3UmlVbHBjcXRjL21GRjc4NGt5bDJa?=
 =?utf-8?B?YkhmelBsaFFzR1dnREo3WW1FcXV3QVJxYjlUcHBpcVpUK0dCR1RBNjg3cXN0?=
 =?utf-8?B?blZRclJGTkEranpId015a25zcXBlS3dZaXZJWGJ5dzRnN0k1QlpoeDNQUTVt?=
 =?utf-8?B?ZmM3ZWdJd0ZPUHV1aHRSZ2FkSWRIUW5jMDdIanR4QVVLZDdrTFRVN0xDamYy?=
 =?utf-8?B?MWNvZDBHREc3UEo3N0xqd1dqQ2ZuU3J4NDl3ZkduNUJIZy8wZXVua1l6QWM2?=
 =?utf-8?B?d1NIVi9XR1EwdUM4L0dXUU96NFkxL3hMSWM2K2NLV3hWQU9lNE9MVkVjczhD?=
 =?utf-8?B?STJncC9mTE9OdGFDeHdMQ3duZVVsbHZ5d3I0K0xrd2dMYnJLVTc4Vk5idmYr?=
 =?utf-8?B?RE9JWVR4bEJZcmMzYWROTEdmVThRc1NWMTJoWmtIWVR1dFVFY25DQnc3T3p1?=
 =?utf-8?B?TU9CbnZFUTl4M2NTT0NiMUE2RU1qeUg2WVRjSHoxWnkzUWFieG81RStvYW5N?=
 =?utf-8?B?bDZ5aW90aGNKalp5Q2NyeGlPYVAwcGFyTjkwQ1Q2Zmp3dnlGL1YyVGxZZXNK?=
 =?utf-8?B?bmw0ZGdmckY4QjNjUjZNc0IxZGhMRmlYNzlpOXlua1pDeDNmdlNGTnNoOEtt?=
 =?utf-8?B?cDM4ampUZkQra3VZUWNEMC9kZlpTeHpkeENqR1FsNmlxZjFSL2FuQURuclYw?=
 =?utf-8?B?WUlIaXZyMHNwRzBKQ0pBZ0RudHNQb0RidFNwRHFMdlF1NlgxMWRreElQN3hu?=
 =?utf-8?B?OFo0OFFvMDZxNkpsV1ovSkpqVFNUbHRaN1BMUlM2MzlPNE5jbDdEUHE4NUN1?=
 =?utf-8?B?QWJLTEV5S0wycWhhbWlOV0s2UE5va2JrTmdYRnJodS84Rlh4OUdWTm5HZ1Vs?=
 =?utf-8?B?MDVQTmVLMEdIbTdhT1ZOYXpLSHlxWEh5TGRZc1lGK1JvL0NlWEZKNFhLWFoy?=
 =?utf-8?B?NlZKTTlBaGhKVmdaVnR2WTdaL294Qm1UbzhTMXVGZm81d2pmckppUGVudEFP?=
 =?utf-8?B?ZjZNVVdDWlZEcHBsank0MUIyNU1UTzQwTmJVcTR2ZjEyY2lzU3pBTVBRdjNx?=
 =?utf-8?B?ekc5WE5hUlI5bWg4Y3RpdHhaQTN2VTh0bUlmWXFqcjU5SzIyRXRJQjg1ODJl?=
 =?utf-8?B?WVU5WmIwM25jemptbmt0TVA5VHJzNWxiVm5ma0pLcGxxVUJqUXlHRVlTY0VR?=
 =?utf-8?B?N01FYjQwSjNRUDFWbitlWFJHOEpHUTkrdDdSSnFkS2pzaG9KcUpjVWxoOXFP?=
 =?utf-8?B?MGczWG1EdlRpUTl6bXpvZ05ENVlYZ2dUeW5qRlpBN1VzQ0NqWVFLczRydHdW?=
 =?utf-8?B?YzlqbXdTeW5rNnQ4d0RmODdoWE9KNGNBdFNYUGJMOU9KcFhiTm90SlRmYmUx?=
 =?utf-8?B?V1dBcWZ6S3M5M25FM2M4ZDNBbStMcWdnR2V1eFNpaGhTL2NSOWJMdEhnUmVh?=
 =?utf-8?Q?87fQwdP/78ScJKfKXPORe67oi?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 064ecfbb-7604-4cc1-acb2-08dc836fc45e
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2024 01:52:04.1304
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HUNwMEjB6/VlmjuZxwM0ohKTKCHOcSfjck1k1BPjfTdmE2UAjrJdCh7qYkg6Z1UAKqIWntRnq6HCkzS80gfaoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7707
X-Proofpoint-ORIG-GUID: 6bvBINHgamsZ6SAVrIy-IHGRyc3CqdZR
X-Proofpoint-GUID: 0M0_KIskj_4139DQFn8rUpwMgUNqw9ux
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-02_15,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 bulkscore=0 spamscore=0 mlxscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2405170001 definitions=main-2406030014
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4531VVJB008343
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Jun 2024 01:52:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110665



On 5/29/24 23:16, Tim Orling wrote:
> **
> *CAUTION: This email comes from a non Wind River email account!*
> Do not click links or open attachments unless you recognize the sender=20
> and know the content is safe.
>=20
>=20
> On Tue, May 28, 2024 at 2:57=E2=80=AFAM Yu, Mingli via lists.openembedd=
ed.org=20
> <https://urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYdw8=
EvQ!Y5NUwukPKP_HnepOX_NV-Oa4tXfkyjxJPk4ygBglVwbOyv4Lc_RjWWNA1peUyA7SsJfU7=
GkiYG6VXIHkUo__zHc$> <mingli.yu=3Deng.windriver.com@lists.openembedded.or=
g <mailto:eng.windriver.com@lists.openembedded.org>> wrote:
>=20
>     From: Mingli Yu <mingli.yu@windriver.com
>     <mailto:mingli.yu@windriver.com>>
>=20
>     Dasbus is a DBus library written in Python 3, based on GLib
>     and inspired by pydbus.
>=20
>     Signed-off-by: Mingli Yu <mingli.yu@windriver.com
>     <mailto:mingli.yu@windriver.com>>
>     ---
>      =C2=A0.../recipes-devtools/python/python3-dasbus_1.7.bb
>     <https://urldefense.com/v3/__http://python3-dasbus_1.7.bb__;!!AjveY=
dw8EvQ!Y5NUwukPKP_HnepOX_NV-Oa4tXfkyjxJPk4ygBglVwbOyv4Lc_RjWWNA1peUyA7SsJ=
fU7GkiYG6VXIHk4El2d1U$> | 15 +++++++++++++++
>      =C2=A01 file changed, 15 insertions(+)
>      =C2=A0create mode 100644
>     meta-python/recipes-devtools/python/python3-dasbus_1.7.bb
>     <https://urldefense.com/v3/__http://python3-dasbus_1.7.bb__;!!AjveY=
dw8EvQ!Y5NUwukPKP_HnepOX_NV-Oa4tXfkyjxJPk4ygBglVwbOyv4Lc_RjWWNA1peUyA7SsJ=
fU7GkiYG6VXIHk4El2d1U$>
>=20
>     diff --git
>     a/meta-python/recipes-devtools/python/python3-dasbus_1.7.bb
>     <https://urldefense.com/v3/__http://python3-dasbus_1.7.bb__;!!AjveY=
dw8EvQ!Y5NUwukPKP_HnepOX_NV-Oa4tXfkyjxJPk4ygBglVwbOyv4Lc_RjWWNA1peUyA7SsJ=
fU7GkiYG6VXIHk4El2d1U$> b/meta-python/recipes-devtools/python/python3-das=
bus_1.7.bb <https://urldefense.com/v3/__http://python3-dasbus_1.7.bb__;!!=
AjveYdw8EvQ!Y5NUwukPKP_HnepOX_NV-Oa4tXfkyjxJPk4ygBglVwbOyv4Lc_RjWWNA1peUy=
A7SsJfU7GkiYG6VXIHk4El2d1U$>
>     new file mode 100644
>     index 000000000..c07464210
>     --- /dev/null
>     +++ b/meta-python/recipes-devtools/python/python3-dasbus_1.7.bb
>     <https://urldefense.com/v3/__http://python3-dasbus_1.7.bb__;!!AjveY=
dw8EvQ!Y5NUwukPKP_HnepOX_NV-Oa4tXfkyjxJPk4ygBglVwbOyv4Lc_RjWWNA1peUyA7SsJ=
fU7GkiYG6VXIHk4El2d1U$>
>     @@ -0,0 +1,15 @@
>     +SUMMARY =3D "Dasbus is a DBus library written in Python 3, based o=
n
>     GLib and inspired by pydbus."
>     +HOMEPAGE =3D "https://dasbus.readthedocs.io
>     <https://urldefense.com/v3/__https://dasbus.readthedocs.io__;!!Ajve=
Ydw8EvQ!Y5NUwukPKP_HnepOX_NV-Oa4tXfkyjxJPk4ygBglVwbOyv4Lc_RjWWNA1peUyA7Ss=
JfU7GkiYG6VXIHkyZ--IS8$>"
>     +SECTION =3D "devel"
>     +LICENSE =3D "LGPL-2.1-only"
>     +LIC_FILES_CHKSUM =3D
>     "file://LICENSE;md5=3D1803fa9c2c3ce8cb06b4861d75310742"
>     +
>     +SRC_URI =3D
>     "git://github.com/dasbus-project/dasbus.git;protocol=3Dhttps;branch=
=3Dmaster <https://urldefense.com/v3/__http://github.com/dasbus-project/d=
asbus.git;protocol=3Dhttps;branch=3Dmaster__;!!AjveYdw8EvQ!Y5NUwukPKP_Hne=
pOX_NV-Oa4tXfkyjxJPk4ygBglVwbOyv4Lc_RjWWNA1peUyA7SsJfU7GkiYG6VXIHkMNwIRNw=
$> \
>     +"
>     +SRCREV =3D "413cf9a0b7c231468f1d28d9a29dd8dd8bda15c5"
>     +
>     +S =3D "${WORKDIR}/git"
>     +
>     +inherit setuptools3
>=20
>=20
> This should inherit python_hatchling since a proper pyproject.toml is=20
> provided
> https://github.com/dasbus-project/dasbus/blob/be51b94b083bad6fa0716ad6d=
c97d12f4462f8d4/pyproject.toml#L7 <https://urldefense.com/v3/__https://gi=
thub.com/dasbus-project/dasbus/blob/be51b94b083bad6fa0716ad6dc97d12f4462f=
8d4/pyproject.toml*L7__;Iw!!AjveYdw8EvQ!Y5NUwukPKP_HnepOX_NV-Oa4tXfkyjxJP=
k4ygBglVwbOyv4Lc_RjWWNA1peUyA7SsJfU7GkiYG6VXIHktJoxsjs$>

Thanks! I will take a look.

Thanks,

>=20
>=20
>     +
>     +RDEPENDS:${PN} =3D "python3-pygobject"
>     --=20
>     2.25.1
>=20
>=20
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#110580):
>     https://lists.openembedded.org/g/openembedded-devel/message/110580
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-devel/message/110580__;!!AjveYdw8EvQ!Y5NUwukPKP_HnepOX_NV-Oa4tXfk=
yjxJPk4ygBglVwbOyv4Lc_RjWWNA1peUyA7SsJfU7GkiYG6VXIHkek3yezo$>
>     Mute This Topic: https://lists.openembedded.org/mt/106345708/924729
>     <https://urldefense.com/v3/__https://lists.openembedded.org/mt/1063=
45708/924729__;!!AjveYdw8EvQ!Y5NUwukPKP_HnepOX_NV-Oa4tXfkyjxJPk4ygBglVwbO=
yv4Lc_RjWWNA1peUyA7SsJfU7GkiYG6VXIHkLETnVCU$>
>     Group Owner: openembedded-devel+owner@lists.openembedded.org
>     <mailto:openembedded-devel%2Bowner@lists.openembedded.org>
>     Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-devel/unsub
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-devel/unsub__;!!AjveYdw8EvQ!Y5NUwukPKP_HnepOX_NV-Oa4tXfkyjxJPk4yg=
BglVwbOyv4Lc_RjWWNA1peUyA7SsJfU7GkiYG6VXIHk83Y-ScQ$> [ticotimo@gmail.com =
<mailto:ticotimo@gmail.com>]
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

