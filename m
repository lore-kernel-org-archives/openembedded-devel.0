Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CFAAC54E71
	for <webhook@archiver.kernel.org>; Wed, 20 Mar 2024 02:17:09 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.34316.1710901019966638448
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Mar 2024 19:17:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=n1xqqKU+;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=380959ebdc=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42K0mTMg013739
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 19:16:59 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:cc:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=lyD8T/fzkzt0bnRCslE
	WnjTCShFPmCujAuooqSitJFI=; b=n1xqqKU+7ct5zZiideCp2oBg5MPwhIP0q7d
	9vsiLpNGRi4rrVmH+IqXHnfBu+BjnQli960e3Yv1k4FS9jNgC1xTHhi1C5ZjBJP/
	LJI823BUZl5Dudu0zSto2JOkvpPuxS8kvhHTEx22A+u+uA2z6umXgEIn26HJ7ZBb
	iygHnvmuMBVDKd2A38BkOOvKeif/MRX0N8Ezz95d4g++gsrQAcVZvRKvY8E0N0mx
	1veibMluRzvNvj0hDWDTvZIlFqmFL5ZFjSUtUFdIXwq3aArei9sJBpBZHu2alTdU
	xAm36VV9rEUKUJWtjufcpRfsxlwXTIgQeDW32XTRtkn7mIZvHkQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wwaxgb6n6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 19:16:58 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 42K2Gwm4006346;
	Tue, 19 Mar 2024 19:16:58 -0700
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wwaxgb6n5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Mar 2024 19:16:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZhoLH4N95VVevZgRSqVmziRAgpHzaRMyiJ3kkN35WlXTCh4P4m0zDZZmy68Tp9E1Vb2Ma1nWb5S06yhn1fziDeITvIIK3e2iuifTO1TVZqZfjFXfxZmvERpIyDZGXySNSjcsmNkxBGU9zt4a2sZNtShfUUlVtkqQKHbuYuzPmlcCRmMiVDMCb3Z95WM4Zido6aPTK9dZYIGTlEuIqiYLfmon15ZJSUaNKTZ+phOTA+s0b/pM9HPTmlR9hJuvG1yY73BI6oD48h31rJJZg1tfnmYuC2h4Qnjqb1Gpmki6R/4Gna+CijpWjbT9AR01BijKEDWP4/keTBDLA8yb1k4oNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lyD8T/fzkzt0bnRCslEWnjTCShFPmCujAuooqSitJFI=;
 b=JBj1lY5o4wEqK1LAfxVu0zE7bS2ZEfERD11mkyU9Tf0AiCfVMynqOEzGm0ALeTR1RidYgPjHDsW1ljmQBeLaOlKplIBakSWQ8bk5opASpfnmxDN3r/vqK4Yu7SBh6nqIKPetKJt1sfdxI2WnVEzPFNAUy4d4T64FSQseYf/BLoKWM5lu/tJ8A5Z3l0Fkzp6EGBZ+0w44VRQsie57RuVuV4o4RIfkgYaK4B8DuxKEUs+cElctBfy+Hadyz5vQ7uqf7n3XirQJTgiYE3Dhb0ys2y3gb/WW56hYWBxZJmoM338WHX7hxffc7yn8udTi3JdBhch1xRlUUFkWlv5H6qPVbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CO1PR11MB4833.namprd11.prod.outlook.com (2603:10b6:303:99::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.11; Wed, 20 Mar
 2024 02:16:54 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7bce:b7a0:1830:98d0]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7bce:b7a0:1830:98d0%5]) with mapi id 15.20.7409.009; Wed, 20 Mar 2024
 02:16:54 +0000
Content-Type: multipart/alternative;
 boundary="------------KS0ytQBRF8t2SOtOv1HqAYxD"
Message-ID: <bf93de47-fffb-d174-8e49-f04b84dccbce@windriver.com>
Date: Wed, 20 Mar 2024 10:16:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [oe][meta-oe][kirkstone][PATCH 1/1] openvpn: ignore CVE-2023-7235
To: Yoann Congal <yoann.congal@smile.fr>, soumya.sambu@windriver.com
Cc: openembedded-devel@lists.openembedded.org
References: <20240307092113.3674886-1-soumya.sambu@windriver.com>
 <CAMSfU+5fWfoHoguf12vNjE+Lakd3bxGQ1TStUf7xOPgKCjaccg@mail.gmail.com>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <CAMSfU+5fWfoHoguf12vNjE+Lakd3bxGQ1TStUf7xOPgKCjaccg@mail.gmail.com>
X-ClientProxiedBy: TYAPR01CA0129.jpnprd01.prod.outlook.com
 (2603:1096:404:2d::21) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|CO1PR11MB4833:EE_
X-MS-Office365-Filtering-Correlation-Id: 34d52828-40d2-4204-4790-08dc4883cfcf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3fSz/k1E34z2VK730Kot5cO0d4HVk4UORJUg3zAlH9O4aoVspEvsduEUdkkiW1DzPm+IExiHezY/rxCF1vVwfF7AkJNUlpJQzjeadN2nhoWRrwdLSrWPBww/+KVyGsletXB2wD503mgljEh6OORG8bG6D8VZ1Xq7BjeonXtqoKxY7Lzjar/JDMJX1Hb+0GiG1XR2UhPVIZYd431pOrHnkiowfdkTJCyvQxN7JwPH89kQsklXj5siHJVyhnBKnTb6KDm3JD6MypRDmwwQFYZi/ApI7Qg78e7s1FjYKCK100WQSdoDAkEoIHIced2k1osuH6y+32TNM5lKSFjqsPAI3oNZB9bYOaD+vSbfrERt5054od8AzU2ZZLQQ7DryyraijA8sgA+xDALt828kbrv5JUI6OSjEdsfQD3xPfkFONohMM5FunkU4CrBkb0DVuZIg2fVFy8z6qoGjZUtC7EbBoziTtbzm7aed73fqhRcDwOeFzDLNRcXdj0SCOtATCu+u1I4YIxiOadDDN04IDf0NkW4OtP3SrHEpCxBDtvE5eypiBmc/lJ6QG7z9iO9kuMtZJRriuLIDKPz6HAQUEMdDla5u2FKcAD08q+WPpfFqPxQFaPtpw7pzE6T6eAhCuEWc
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cVVONTFxYzlJRjF5TWtTUWFvZkhSamJZNHlTRTdVRG9PT0xzN1V2N3BEY1Fr?=
 =?utf-8?B?UmxoamE3UmxiT2pVVDI5ZjVpWms4MlRQM1k3NzJNWXRZeE80YnF0OWQyRFhX?=
 =?utf-8?B?WElVZDhzQ1ZDWG95ejdBL0JWcEpsc21LVkFKd1k2alROVlliTnYwK1NSVERL?=
 =?utf-8?B?Mm1wU0tzVTRpcTZqbmhJRitUd200ZjVHdng5OFB4Z3hwaUczeXhtZDRqU3Zh?=
 =?utf-8?B?NWlLWmk3UEtJV2ZuQjJmYlZKQm5Vd0V1ZldFUXplRkQ0RkxObjJsY0FmdUdS?=
 =?utf-8?B?MVBTajhUeHpSdHVpRzdlR0NHMjdLRXRMS21UQU5TcDc0Qm51QUZVOE55eFVL?=
 =?utf-8?B?SDc1TUhHVytrUjNscW9KOC80VlFhNGdSZ2VhczcrYmx1ZDZmNmt1VzNHaVBw?=
 =?utf-8?B?dWxSZVZiTGpIMTJZc0pnOVJVcWs3QlUyUFNlY3l4T3Ntc2dmTEZNWEdVZ0Mz?=
 =?utf-8?B?UThmM1FOTjhFRWJLYVJnK0xHVFJ5TXRBWklwU2dVWEpvYXZWUkVvc1dsRHpz?=
 =?utf-8?B?dE9jV3BVa0k3N2VkRlBVZWZ4RXRqUEFER05NRUd4ZWVyT1pDcm05eXFEVzha?=
 =?utf-8?B?RnFGblpuWW5PbkR0bEVOTEhDRXBKMWU2RGRRcmhmQ0diSTJ6Z3ZoRmNyWHZF?=
 =?utf-8?B?ZmwvTW9zWUVUdUptUVdxRmtmMXh0TEt1eHlNLzVONWROOUxFL1NNY0poRmlx?=
 =?utf-8?B?dlJNRDQ2U1N5Z1A3Mk5vZU5uTGRBS3VaSHVhUzFjVENOYWFEV09rejJiZXRH?=
 =?utf-8?B?dFJCSkZuVERkeDRkOCttMlJ1aHY3ZkI1S2JNaEhzWG8rREtJeGJBVWdoSGR4?=
 =?utf-8?B?WVdGZXlaa0VvTWwvK2xXSzJCSDBGN0c0azJpdENYV3pvYXFROHdKNGxwdHZl?=
 =?utf-8?B?SmUrZURoZ0xnY3BZMTlQYWZQR2p4TEc5MzZEZnU0N2RkM0svSGxjTGRVNXlO?=
 =?utf-8?B?ajdHenpVWFdUR3lvdnZBSExHT2ROZkQvYkEyQVUybS9OOFYycUFKZzkzeVhV?=
 =?utf-8?B?WDlLQjdsVmgxaXRNdmIrZXhJWGsyR1JEWHI0ejMxanRSdTJ1UWhBbys2dzhh?=
 =?utf-8?B?cDlkUmc3N0hPWlNHYW1LUDBLa0s4VTJYeHFJcEh0YUpHT3F2K0FqTkRGbDV1?=
 =?utf-8?B?THpZOVVTL05TNWwrWlpjeDYyV3hVc2dNUlg1bG4vM2F0MzlrSUJlNGNNZGxE?=
 =?utf-8?B?ODJ1djdKUjhDT1lOcmM4WlZyd2lnY1NPbmZvZCtIaXBRRW9EcDlNcWd3d1ov?=
 =?utf-8?B?dHd3NUFQVXpZc0xCMTl0dmMrNndzcmFFenE1Y1dSSjk2blZhU2hYS3NhWVJs?=
 =?utf-8?B?VVVFcERNUGRIRHluemUySy9XOHBibzU1S0NyL05DUmx0TUE1ZlMxUVJRTVZQ?=
 =?utf-8?B?TGFwa0x3UEFGSUhTcFd1Wm5VY0xSNlNXK0JRZ2pxdk8raHZVRFhGRWpQOUQ5?=
 =?utf-8?B?SVJoem9jZ2Y2VXpoc1kvZ3JzM0pHOW14c3VVMWhtN3IzUEQ1ZDRJcnJMSkFo?=
 =?utf-8?B?Vk5oSE42dkFpSXVjWFBoQWpiTTV4V0ozL0NZRFlJYjFiS3kxS3lqZ0kvcUJK?=
 =?utf-8?B?d0xUOFY2T3pUMXN5S3ZNbTNHVlZPYlVCc21HMDQzOHJiVlFGRjF4SG0wL3Mv?=
 =?utf-8?B?SE1NNEt2a1V3WEh3SUhleXA2OERyTWtPWEZES2tWRzFCZ0pKY0psZy9iTG5I?=
 =?utf-8?B?eXdPZUU3ZC9Ddk4wa3lVdHc1OFM3MFlyQlE1MXo0Z1RYYVo5OHF2SXo2OFJX?=
 =?utf-8?B?dnhwR0daRGNocTQzWGVQSmMrd0VJOU1aaDNhN01zeWsyek92ZTFMMVduTXJy?=
 =?utf-8?B?UUZPVUlYYVM3OGtkQXU5aStFL1ZhMmgvNEM2UkNST1ZKUWdvc3o0S1BRTHB6?=
 =?utf-8?B?RHd0NkZkdGFlSzY2UkFaR3N5bkFmNlR1SDBVeWwzVnR2MWdjcmtKeWZMSXoz?=
 =?utf-8?B?Q1lNR1U0YWZ1K2dhcmNyZ2xDKzRFRUQ5SFRRZ0ZXTVBLMjJ1Z3B3MklhaW5k?=
 =?utf-8?B?eEZVY1F1NU1KWXBBb1hJckdRei95VkhFeSs4ZWF4VVFsNlNURHI3ZU5qUm9F?=
 =?utf-8?B?RFdqN0E3SkRFeUlHdWpRNXA3V2FsejllR1Fma0t2V0lGYWl4YXZGSjVjL1pz?=
 =?utf-8?Q?F6cb+niWnLL1XLHR/zNssQT5/?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34d52828-40d2-4204-4790-08dc4883cfcf
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2024 02:16:54.6611
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4izTnNgGTeJSQD4ezbJVnsmNRp7O4w1LaZgGWdDQMoq3CY+Su9m0IuDs2dko8YbtGvzbDMaaDaSA45XdgUdanw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4833
X-Proofpoint-GUID: roTAsv7dqfg0gu1k6t-UrfPmcV6I9sRI
X-Proofpoint-ORIG-GUID: oRRHXLuJ4nuXDMdSvtRT-HnFyTbOrvkU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-19_10,2024-03-18_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 clxscore=1015 bulkscore=0 impostorscore=0
 lowpriorityscore=0 mlxscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 spamscore=0 phishscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2403140001
 definitions=main-2403200015
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Mar 2024 02:17:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109480

--------------KS0ytQBRF8t2SOtOv1HqAYxD
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 42K0mTMg013739

Hi Yoann,

This is because OE's cve-checker uses the configuration field to check.=20
If a CVE lacks such field, it's not on the list.
https://nvd.nist.gov/vuln/detail/CVE-2023-7235

Regards,
Qi

On 3/7/24 21:49, Yoann Congal wrote:
> Hi,
>
> Le=C2=A0jeu. 7 mars 2024 =C3=A0=C2=A010:21, Soumya via lists.openembedd=
ed.org=20
> <https://urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYdw8=
EvQ!efu39gdY-VT0kOFF-gisQEpi1N-G0Om2Sjy3YpnhJnnfYFyOjN6m7W4grKZT1tyLWrMWx=
vHBGbpnRfFU5KYbC7WVPqoU$>=20
> <soumya.sambu=3Dwindriver.com@lists.openembedded.org> a =C3=A9crit=C2=A0=
:
>
>     From: Soumya Sambu <soumya.sambu@windriver.com>
>
>     This CVE is related to OpenVPN 2.x GUI on Windows.
>
>     References:
>     https://community.openvpn.net/openvpn/wiki/CVE-2023-7235
>     <https://urldefense.com/v3/__https://community.openvpn.net/openvpn/=
wiki/CVE-2023-7235__;!!AjveYdw8EvQ!efu39gdY-VT0kOFF-gisQEpi1N-G0Om2Sjy3Yp=
nhJnnfYFyOjN6m7W4grKZT1tyLWrMWxvHBGbpnRfFU5KYbC7x8FYAr$>
>     https://security-tracker.debian.org/tracker/CVE-2023-7235
>     <https://urldefense.com/v3/__https://security-tracker.debian.org/tr=
acker/CVE-2023-7235__;!!AjveYdw8EvQ!efu39gdY-VT0kOFF-gisQEpi1N-G0Om2Sjy3Y=
pnhJnnfYFyOjN6m7W4grKZT1tyLWrMWxvHBGbpnRfFU5KYbC1oOLnVU$>
>
>     Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
>     ---
>     =C2=A0meta-networking/recipes-support/openvpn/openvpn_2.5.6.bb
>     <https://urldefense.com/v3/__http://openvpn_2.5.6.bb__;!!AjveYdw8Ev=
Q!efu39gdY-VT0kOFF-gisQEpi1N-G0Om2Sjy3YpnhJnnfYFyOjN6m7W4grKZT1tyLWrMWxvH=
BGbpnRfFU5KYbCzrRMlgD$>
>     | 3 +++
>     =C2=A01 file changed, 3 insertions(+)
>
>     diff --git
>     a/meta-networking/recipes-support/openvpn/openvpn_2.5.6.bb
>     <https://urldefense.com/v3/__http://openvpn_2.5.6.bb__;!!AjveYdw8Ev=
Q!efu39gdY-VT0kOFF-gisQEpi1N-G0Om2Sjy3YpnhJnnfYFyOjN6m7W4grKZT1tyLWrMWxvH=
BGbpnRfFU5KYbCzrRMlgD$>
>     b/meta-networking/recipes-support/openvpn/openvpn_2.5.6.bb
>     <https://urldefense.com/v3/__http://openvpn_2.5.6.bb__;!!AjveYdw8Ev=
Q!efu39gdY-VT0kOFF-gisQEpi1N-G0Om2Sjy3YpnhJnnfYFyOjN6m7W4grKZT1tyLWrMWxvH=
BGbpnRfFU5KYbCzrRMlgD$>
>     index 218e72b7a..828cd5033 100644
>     --- a/meta-networking/recipes-support/openvpn/openvpn_2.5.6.bb
>     <https://urldefense.com/v3/__http://openvpn_2.5.6.bb__;!!AjveYdw8Ev=
Q!efu39gdY-VT0kOFF-gisQEpi1N-G0Om2Sjy3YpnhJnnfYFyOjN6m7W4grKZT1tyLWrMWxvH=
BGbpnRfFU5KYbCzrRMlgD$>
>     +++ b/meta-networking/recipes-support/openvpn/openvpn_2.5.6.bb
>     <https://urldefense.com/v3/__http://openvpn_2.5.6.bb__;!!AjveYdw8Ev=
Q!efu39gdY-VT0kOFF-gisQEpi1N-G0Om2Sjy3YpnhJnnfYFyOjN6m7W4grKZT1tyLWrMWxvH=
BGbpnRfFU5KYbCzrRMlgD$>
>     @@ -19,6 +19,9 @@ SRC_URI[sha256sum] =3D
>     "333a7ef3d5b317968aca2c77bdc29aa7c6d6bb3316eb3f79743b59c532
>     =C2=A0# CVE-2020-7224 and CVE-2020-27569 are for Aviatrix OpenVPN
>     client, not for openvpn.
>     =C2=A0CVE_CHECK_IGNORE +=3D "CVE-2020-7224 CVE-2020-27569"
>
>     +# CVE-2023-7235 is specific to Windows platform
>     +CVE_CHECK_IGNORE +=3D "CVE-2023-7235"
>
>
> That's weird, this CVE does not appear as applicable neither locally=20
> for me or on the AB:=20
> https://autobuilder.yocto.io/pub/non-release/patchmetrics-meta-oe/cve-s=
tatus-kirkstone.txt=20
> <https://urldefense.com/v3/__https://autobuilder.yocto.io/pub/non-relea=
se/patchmetrics-meta-oe/cve-status-kirkstone.txt__;!!AjveYdw8EvQ!efu39gdY=
-VT0kOFF-gisQEpi1N-G0Om2Sjy3YpnhJnnfYFyOjN6m7W4grKZT1tyLWrMWxvHBGbpnRfFU5=
KYbCwBzRMAA$>
> Did you do something specific to see this CVE?
>
>     +
>     =C2=A0SYSTEMD_SERVICE:${PN} +=3D "openvpn@loopback-server.service
>     openvpn@loopback-client.service"
>     =C2=A0SYSTEMD_AUTO_ENABLE =3D "disable"
>
>     --=20
>     2.40.0
>
>
>
>
>
>
> --=20
> Yoann Congal
> Smile ECS - Tech expert
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#109196):https://lists.openembedded.org/g/openembedd=
ed-devel/message/109196
> Mute This Topic:https://lists.openembedded.org/mt/104784192/7304865
> Group Owner:openembedded-devel+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-devel/unsub  =
[Qi.Chen@eng.windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--------------KS0ytQBRF8t2SOtOv1HqAYxD
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 42K0mTMg013739

<html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">Hi Yoann,<br>
    </div>
    <div class=3D"moz-cite-prefix"><br>
    </div>
    <div class=3D"moz-cite-prefix">This is because OE's cve-checker uses
      the configuration field to check. If a CVE lacks such field, it's
      not on the list.</div>
    <div class=3D"moz-cite-prefix"><a class=3D"moz-txt-link-freetext" hre=
f=3D"https://nvd.nist.gov/vuln/detail/CVE-2023-7235">https://nvd.nist.gov=
/vuln/detail/CVE-2023-7235</a><br>
    </div>
    <div class=3D"moz-cite-prefix"><br>
    </div>
    <div class=3D"moz-cite-prefix">Regards,</div>
    <div class=3D"moz-cite-prefix">Qi<br>
    </div>
    <div class=3D"moz-cite-prefix"><br>
    </div>
    <div class=3D"moz-cite-prefix">On 3/7/24 21:49, Yoann Congal wrote:<b=
r>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CAMSfU+5fWfoHoguf12vNjE+Lakd3bx=
GQ1TStUf7xOPgKCjaccg@mail.gmail.com">
     =20
      <div dir=3D"ltr">
        <div dir=3D"ltr">
          <div>Hi,</div>
        </div>
        <br>
        <div class=3D"gmail_quote">
          <div dir=3D"ltr" class=3D"gmail_attr">Le&nbsp;jeu. 7 mars 2024 =
=C3=A0&nbsp;10:21,
            Soumya via <a href=3D"https://urldefense.com/v3/__http://list=
s.openembedded.org__;!!AjveYdw8EvQ!efu39gdY-VT0kOFF-gisQEpi1N-G0Om2Sjy3Yp=
nhJnnfYFyOjN6m7W4grKZT1tyLWrMWxvHBGbpnRfFU5KYbC7WVPqoU$" moz-do-not-send=3D=
"true">lists.openembedded.org</a>
            &lt;soumya.sambu=3D<a href=3D"mailto:windriver.com@lists.open=
embedded.org" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">wi=
ndriver.com@lists.openembedded.org</a>&gt;
            a =C3=A9crit&nbsp;:<br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">From: Soumya Sambu &lt;<a =
href=3D"mailto:soumya.sambu@windriver.com" target=3D"_blank" moz-do-not-s=
end=3D"true" class=3D"moz-txt-link-freetext">soumya.sambu@windriver.com</=
a>&gt;<br>
            <br>
            This CVE is related to OpenVPN 2.x GUI on Windows.<br>
            <br>
            References:<br>
            <a href=3D"https://urldefense.com/v3/__https://community.open=
vpn.net/openvpn/wiki/CVE-2023-7235__;!!AjveYdw8EvQ!efu39gdY-VT0kOFF-gisQE=
pi1N-G0Om2Sjy3YpnhJnnfYFyOjN6m7W4grKZT1tyLWrMWxvHBGbpnRfFU5KYbC7x8FYAr$" =
rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">https://com=
munity.openvpn.net/openvpn/wiki/CVE-2023-7235</a><br>
            <a href=3D"https://urldefense.com/v3/__https://security-track=
er.debian.org/tracker/CVE-2023-7235__;!!AjveYdw8EvQ!efu39gdY-VT0kOFF-gisQ=
Epi1N-G0Om2Sjy3YpnhJnnfYFyOjN6m7W4grKZT1tyLWrMWxvHBGbpnRfFU5KYbC1oOLnVU$"=
 rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">https://se=
curity-tracker.debian.org/tracker/CVE-2023-7235</a><br>
            <br>
            Signed-off-by: Soumya Sambu &lt;<a href=3D"mailto:soumya.samb=
u@windriver.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-=
txt-link-freetext">soumya.sambu@windriver.com</a>&gt;<br>
            ---<br>
            &nbsp;meta-networking/recipes-support/openvpn/<a href=3D"http=
s://urldefense.com/v3/__http://openvpn_2.5.6.bb__;!!AjveYdw8EvQ!efu39gdY-=
VT0kOFF-gisQEpi1N-G0Om2Sjy3YpnhJnnfYFyOjN6m7W4grKZT1tyLWrMWxvHBGbpnRfFU5K=
YbCzrRMlgD$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true=
">openvpn_2.5.6.bb</a>
            | 3 +++<br>
            &nbsp;1 file changed, 3 insertions(+)<br>
            <br>
            diff --git a/meta-networking/recipes-support/openvpn/<a href=3D=
"https://urldefense.com/v3/__http://openvpn_2.5.6.bb__;!!AjveYdw8EvQ!efu3=
9gdY-VT0kOFF-gisQEpi1N-G0Om2Sjy3YpnhJnnfYFyOjN6m7W4grKZT1tyLWrMWxvHBGbpnR=
fFU5KYbCzrRMlgD$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D=
"true">openvpn_2.5.6.bb</a>
            b/meta-networking/recipes-support/openvpn/<a href=3D"https://=
urldefense.com/v3/__http://openvpn_2.5.6.bb__;!!AjveYdw8EvQ!efu39gdY-VT0k=
OFF-gisQEpi1N-G0Om2Sjy3YpnhJnnfYFyOjN6m7W4grKZT1tyLWrMWxvHBGbpnRfFU5KYbCz=
rRMlgD$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">op=
envpn_2.5.6.bb</a><br>
            index 218e72b7a..828cd5033 100644<br>
            --- a/meta-networking/recipes-support/openvpn/<a href=3D"http=
s://urldefense.com/v3/__http://openvpn_2.5.6.bb__;!!AjveYdw8EvQ!efu39gdY-=
VT0kOFF-gisQEpi1N-G0Om2Sjy3YpnhJnnfYFyOjN6m7W4grKZT1tyLWrMWxvHBGbpnRfFU5K=
YbCzrRMlgD$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true=
">openvpn_2.5.6.bb</a><br>
            +++ b/meta-networking/recipes-support/openvpn/<a href=3D"http=
s://urldefense.com/v3/__http://openvpn_2.5.6.bb__;!!AjveYdw8EvQ!efu39gdY-=
VT0kOFF-gisQEpi1N-G0Om2Sjy3YpnhJnnfYFyOjN6m7W4grKZT1tyLWrMWxvHBGbpnRfFU5K=
YbCzrRMlgD$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true=
">openvpn_2.5.6.bb</a><br>
            @@ -19,6 +19,9 @@ SRC_URI[sha256sum] =3D
            &quot;333a7ef3d5b317968aca2c77bdc29aa7c6d6bb3316eb3f79743b59c=
532<br>
            &nbsp;# CVE-2020-7224 and CVE-2020-27569 are for Aviatrix Ope=
nVPN
            client, not for openvpn.<br>
            &nbsp;CVE_CHECK_IGNORE +=3D &quot;CVE-2020-7224 CVE-2020-2756=
9&quot;<br>
            <br>
            +# CVE-2023-7235 is specific to Windows platform<br>
            +CVE_CHECK_IGNORE +=3D &quot;CVE-2023-7235&quot;<br>
          </blockquote>
          <div><br>
          </div>
          <div>That's weird, this CVE does not appear as applicable
            neither locally for me or on the AB: <a href=3D"https://urlde=
fense.com/v3/__https://autobuilder.yocto.io/pub/non-release/patchmetrics-=
meta-oe/cve-status-kirkstone.txt__;!!AjveYdw8EvQ!efu39gdY-VT0kOFF-gisQEpi=
1N-G0Om2Sjy3YpnhJnnfYFyOjN6m7W4grKZT1tyLWrMWxvHBGbpnRfFU5KYbCwBzRMAA$" mo=
z-do-not-send=3D"true">https://autobuilder.yocto.io/pub/non-release/patch=
metrics-meta-oe/cve-status-kirkstone.txt</a></div>
          <div>Did you do something specific to see this CVE?<br>
          </div>
          <div>&nbsp;</div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            +<br>
            &nbsp;SYSTEMD_SERVICE:${PN} +=3D <a class=3D"moz-txt-link-rfc=
2396E" href=3D"mailto:openvpn@loopback-server.serviceopenvpn@loopback-cli=
ent.service">&quot;openvpn@loopback-server.service
            openvpn@loopback-client.service&quot;</a><br>
            &nbsp;SYSTEMD_AUTO_ENABLE =3D &quot;disable&quot;<br>
            <br>
            -- <br>
            2.40.0<br>
            <br>
            <br>
            <br>
            <br>
          </blockquote>
        </div>
        <br clear=3D"all">
        <br>
        <span class=3D"gmail_signature_prefix">-- </span><br>
        <div dir=3D"ltr" class=3D"gmail_signature">
          <div dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</=
font>
            <div><font face=3D"Raleway, regular">Smile ECS - Tech expert<=
br>
              </font></div>
          </div>
        </div>
      </div>
      <br>
      <fieldset class=3D"moz-mime-attachment-header"></fieldset>
      <pre class=3D"moz-quote-pre" wrap=3D"">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#109196): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-devel/message/109196">https:=
//lists.openembedded.org/g/openembedded-devel/message/109196</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/104784192/7304865">https://lists.openembedded.org/mt=
/104784192/7304865</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.=
openembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/=
g/openembedded-devel/unsub</a> [<a class=3D"moz-txt-link-abbreviated" hre=
f=3D"mailto:Qi.Chen@eng.windriver.com">Qi.Chen@eng.windriver.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------KS0ytQBRF8t2SOtOv1HqAYxD--

