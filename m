Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53C0BC4332F
	for <webhook@archiver.kernel.org>; Mon, 12 Dec 2022 19:29:22 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.53256.1670873357109292963
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Dec 2022 11:29:19 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=KnY/vjnv;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9345c419cd=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BCJSelw022554
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Dec 2022 19:29:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=content-type :
 message-id : date : subject : to : references : from : in-reply-to :
 mime-version; s=PPS06212021;
 bh=4LAkdLJDS3GusPdJI59p/b7HGtKu+1YLa5Qj0DzBXKs=;
 b=KnY/vjnv4ykPFP502J5neU/vpNsV0Z1wadO2L2GEQ7TimDhfxZs7FVSCHMn2smruncyR
 BOdwIiBz/ZZt4ftRQz2eMP7SYU7dJUgEgov3nMUwEBPaN4I7lPHEANGa0S3EoZgL8HOV
 zqBwoAbDJBrQmMT1iHCx8m1s0jtrnLZw4VOnNwiMeQYm4pMT8AztWOTxZt6Q0jEQs/Lr
 ebWe6q8vcv8DXuxzaHw9+uQEvXRzwMKKsPK9BwFgMgCfYr/mJc/GnCCGsdbI1Dtb2PGz
 LgCz9IaAhoQs+WldZ4jD/8ew1V/4PYEDcUZaGbBpRzFU5m+kYGfF1mbAdHBhmhxuLA4d SA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mchn0ssc7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Dec 2022 19:29:15 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BCJTFJZ024118
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Dec 2022 19:29:15 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2175.outbound.protection.outlook.com [104.47.57.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mchn0ssc4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Dec 2022 19:29:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jfaxiz5sZSyuhBuP3JEjZuLBE8JkzBdfiQh2g7NmRPujJlz1UmqFpY0ujzdmT7dwVq+0Ev+6L1f04H95mk0ytuCZRXVpRbckf8UkHO7AUzUQPGDyhlfKmWQvVqvT6cKevKm9RXSSyA7bF2oCQFl2Kb+1gMzZWNH2ML+MKdSbYTAGEFJNfrdJmi4Ps7zUHhFrZiIc535sueX7eX9tXUfsQIyHwctxS5+dZ31y49f9u2ZyBt9gBrY2uD+nq1lhvNAFejvxGaSrEZvkz9bfNBBK3Ylgyx7Bw6dN5poyDmN07vNIfuI/hBRYrOKlmlJ1p3dNDHDf7ZZ7gDjlX0xydbMBfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4LAkdLJDS3GusPdJI59p/b7HGtKu+1YLa5Qj0DzBXKs=;
 b=FF4CxYIhYG7/WjEpAWJkSanC0TOvl+4Nxk+bEUOZNR7Q5YnZ+lkk+OiZxoe0hfBUXdl+LgVV2JmuQyF77sN4qzorJSDZDyzEYO9htrdVo+2lTwpzzqq6uOR+MLV/5Sje3qZSbfWNZGIDfgF83qQMNFSZArG0OLgxnyqNBz03LOZC331C1FpXNL27fuZAiNKDb5ydLz/c/kB/tRaA4ESE6Q5Cw+HhqtaZ46fFch8Jkq8KiOeMqv8blKfc0+QLkizsbdr6oS0yIqZvx4SltsHxuRNjtNTtZeBHF8FThQxeAbPx4bvJBYPZL3LasB7XLJmftkWrR/BL5ymOtDuFux8N+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by CY8PR11MB7898.namprd11.prod.outlook.com (2603:10b6:930:7b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Mon, 12 Dec
 2022 19:29:13 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e794:335f:5e0f:8d36]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e794:335f:5e0f:8d36%6]) with mapi id 15.20.5880.019; Mon, 12 Dec 2022
 19:29:13 +0000
Content-Type: multipart/alternative;
 boundary="------------ijFQY6IizOfPV21SDqgJcbm6"
Message-ID: <8ac2cffc-e10c-c4bf-5e53-052398a80264@windriver.com>
Date: Mon, 12 Dec 2022 14:29:09 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [oe][meta-oe][kirkstone][PATCH 1/1] xfce4-settings: fix
 CVE-2022-45062
Content-Language: en-CA
To: openembedded-devel@lists.openembedded.org,
        "Polampalli, Archana" <Archana.Polampalli@windriver.com>,
        Armin Kuster <akuster808@gmail.com>
References: <20221208070305.1138128-1-archana.polampalli@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20221208070305.1138128-1-archana.polampalli@windriver.com>
X-ClientProxiedBy: SJ0PR03CA0183.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::8) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|CY8PR11MB7898:EE_
X-MS-Office365-Filtering-Correlation-Id: 66093080-90ce-4024-9b5d-08dadc772682
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Tz6du3tFKL+kzQxZpMwg6s+tG3ZibJMzEOL1UIAuYTLmxdPda4DpAGXfA+tR2vmfTSTvYjvWYFHTDnV4t38bvZqJQZKVXGSfY5hpx196gt5RGT/iOrCbmKM8kELgyBN5ux5kamPtVFW6cAvYQPcNlCPFhMFyhfVDoKRmVlh47cSrfqEfCiUeNK9QnFNjV46yInGF6DZCmMixm5Inp2+DQMMNPi1J7UNMb9z0mn1GxgMq2rJYs74h7ll78W3mOIMN8qFd+yoyqSy9AmHMdZubSx4MHzf64YawPAi/tEVPpAtyfI0BAKlWXSt8LY52N8RPF3omPwdvEnBlxgI0f7HR5t9GNidJkQYyt1OFrTYtK15hi/8fXBHsTjFnVlyMjYwT68RSztPyNtsW32bxuB9fn6nCSQFKLrtnHPTCAeFpD2GnUxsK6QScJTaPMb5QNkjSOfxfDqsFpZsk5+/vlSd/luLrkX1cnA/VHcHDnUAjRWj87CZ4zXTyqLsnqqUDWkrYo4piN6v7bCsJ5aUzQfqlrDFKh+jClKTyOEwV4wmfRm72V1gKDNRMfjd2T3V6B2mVMHT8HZYSZq4OM5MbRKDlchSLMy7BWNdwdN/O+n0uGDbcUnbYrI1i60IOiIoeJ6mXfl7wD4D5ytXAqfDyf07QtIKjAY31ff72EtJ4HHvT0MvT77kFkDncNuo12QEkl69rEzrUJ3Tfmnlpa5RFwCFNRKd15T5Rzsvpd2HLQ0PLCNnwqbvQpb7Gkt/70FpBDIMw+B3ucZfutOY/4Rlv6z6somCw2mw9cbx4cPseXLqLECc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(396003)(346002)(39850400004)(366004)(451199015)(66899015)(31686004)(2906002)(166002)(30864003)(38100700002)(26005)(36756003)(41300700001)(31696002)(6666004)(8676002)(6506007)(53546011)(86362001)(6512007)(33964004)(66946007)(8936002)(110136005)(316002)(5660300002)(66476007)(66556008)(478600001)(6486002)(966005)(2616005)(186003)(66574015)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?L3Fza2V6Y2t4RmFaZVFTUnBaRU56L016V3hnY1dnUjJoUCthd3ZnNGZBQVpq?=
 =?utf-8?B?bGxFbVUvZ0M4TXFWb2hUTmNpd2JPM05RWEF1VjRrekdWdDFkUVVubWlZaGtX?=
 =?utf-8?B?SDFSaGpYdDNNZCtRamFZUUxMTFdMOW5xSVlIdjRocC9vK21NQk5VTklLQVNU?=
 =?utf-8?B?Vm5BN0hTZ001ZDVqZ2tlcGZmTWkzNHBGb25aWWhLT205QlNRMTdzQ1BtZGx1?=
 =?utf-8?B?d2dRbGV5dnhMMlpzT2ZaMzN2Q3V5UWJWTksvTHd1OGlJdjY4SGNUWGN1eEtu?=
 =?utf-8?B?RjJ0VkVQS2hVUzdxKzU1Rm12azdLcUNqRVN3UEc5dXUwdUFBcjBCTEhNNUlD?=
 =?utf-8?B?RGdxVUViWTg2OVdGUkxJcE14MXo5RlZsdVROUmsxNDBUeENkOFFoY08xMTla?=
 =?utf-8?B?Zzdsczd6YVdGR3ZUWmc2eVM0VDROMUVmbWRVK3cwSUdxU09tb1pOTm42VVlB?=
 =?utf-8?B?Q3pMR29qNEc1ZStsUFIzbTlPZFcrbFRqWGkydTIwS3RkTjhrMXN1RGswT2xX?=
 =?utf-8?B?Z2czUmZ4WmVsdVFRS3dudThlYUZDWi9vNGR0UFlWVDF0OGdvVnNWeUwyM2lC?=
 =?utf-8?B?Q1Q1UWU0dGhjN1FSSlI2UGRMVjJiTEpFbStVbExlNGpPVlZmTHRZa0lYL3Ex?=
 =?utf-8?B?QjRzWkQvYndGeDM1ZU0vMjNUNlhpOVVFVnBxQ2hwM216ZW1tNk1ZOTVsYXlr?=
 =?utf-8?B?NU1RRHpVU3ZTZWRkYjJnbjI3RjRuazFFWU5UZGFKcGcvMUhxbDQ5RG5sS1Js?=
 =?utf-8?B?UHB6Nzd6NXBHamtWNThDNVpWUDRjNXhiRG5jSGN0NTNXY1FXckNMcEZQbktK?=
 =?utf-8?B?WCszeE9GbXB5YVVaOGlhUW5vS3llaUVvaDZjRDJYWU1ZL1BYNjZFZm1wQ1Ft?=
 =?utf-8?B?cXBQM1ZZOVNpbU1sdDdhaCt4VGVEdm5JLzVLOGFtS2VUeGlMeDBKUytubE83?=
 =?utf-8?B?Vmh0SzdKdkZDNmNkNlovNkl3OENRcmxGTkd3cTdNd1JoWGlpMWdYQWpPK2Nz?=
 =?utf-8?B?RlpOT1k1MzVkM0VaNHlQemIvSkhqLzdNNFZtQzhrNmFIampmN0Q1Q3I2bmRI?=
 =?utf-8?B?cld2TnU2alNiVUJ4ZFN5dzdPRjF6ZmxEVlhvbFB1T2NHUUY1QklKSE9WL0My?=
 =?utf-8?B?aFV5cnIySGVNMnB2dTJIZHVkQ282Y2VJU2ppcU9NWWRzalg1TllnVERaeUts?=
 =?utf-8?B?VkY0MnNOdHdpN0dMbGt4cm81NC91RytqNlBKYy9xZ3lMamV2eHliZVJOMTJB?=
 =?utf-8?B?bTB4K3NGV0xjRDBmVzM5RVlFNG13YnB2YXhUVUcvRkFWazVrbUNNMkpCejl0?=
 =?utf-8?B?c1pkeG1YTDRFcldYbVQ3MHpLM1ozZnIxaW55OHlzRVFkMnVMSWxoUG53VXBj?=
 =?utf-8?B?T3dDck1xQzJQaGFOaTJjamVzaFBoTHNJV2tObjhad1lHb3hJRDVtdEJlL1By?=
 =?utf-8?B?Tk5BZzRiZ1haaE5jeGZtNzNaVkw1Uzc3UjRGWXZmRGY2Yk9KdHR6cTVMdU5x?=
 =?utf-8?B?REtDb3ByOWpycFZyYjN2ZDhQVHJUTXlFTytRaWsxd3lVSUVUa0VEMjU5TTdP?=
 =?utf-8?B?WDBvUnZsWXF5Y3RLYUVhWW0zZG45MkY4TVdwUDR2cExRbmQrVFgwSkNjMFl2?=
 =?utf-8?B?RzlsOHhsOXNDdHdxNW5Tc25IVzRGdG5aNmthdSsyVGlMZG1MR3JxZzVrSkYv?=
 =?utf-8?B?TXZib2JJYUpncitFRC9CaU8rdE5wb1Y5U1hpSDhMb3lEcEF6citNa2ZVcGdV?=
 =?utf-8?B?NVc3bVZ0WUhmZzAxRnNnR09pTlk2VlNjTndJdUluSkpma3J6bnZjZisrSThB?=
 =?utf-8?B?elFZT0RZQ3FhS0dVWXlrNVR2bEg4WWdtd3dSR0htM2tvRVVBaEFjVXNaZlBn?=
 =?utf-8?B?QVh6d3NHTytrTnI4UUMzZFIxdDJFWmg0eFB6MHBCY1luNVh5RVZxcGdJTjNS?=
 =?utf-8?B?VGdrbHIyVGJnbHFlWVdsWGQwKytYMW5lU0lDaXJUUVpDNnpDWFk3b3FZN3VO?=
 =?utf-8?B?TkFjRTczZmlTYnp1dkFEQXBBd0pEeUt5N3lUV3ZIY09oV3FUVFBhZnRIb3N5?=
 =?utf-8?B?YUd4MTFGZkVUZ3ZabUxCckxYcHczcVJGbzZaTjB5cDZxU0MwSEVaMVZnWkcy?=
 =?utf-8?B?d2QyeXlpV25IMGtRd2xPcVd5Y0wrQklmNUtNcWowQy9NdzhCdmpCeUtNNjkz?=
 =?utf-8?B?UGc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66093080-90ce-4024-9b5d-08dadc772682
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2022 19:29:13.3221
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ymDRJsLyZ+CwdEi5OR5q+UfKXpbm5Zl3ZNGWAdfN+rEDsO4CI3dcSfJDNQgt50qyh2t7Ffc3iDlmjkxenQhJ0POBay6vfeRjk2b9501/CNg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7898
X-Proofpoint-GUID: vBsQYfkbC-UWr0v6f2C4ia8BN76YbQGx
X-Proofpoint-ORIG-GUID: WEDrQhkj1BVWgPY-RkgJN2F8seGa-wmb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-12_02,2022-12-12_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 bulkscore=0 adultscore=0 mlxlogscore=999 phishscore=0 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212120174
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Dec 2022 19:29:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100064

--------------ijFQY6IizOfPV21SDqgJcbm6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 2BCJSelw022554

On 2022-12-08 02:03, Polampalli, Archana via lists.openembedded.org wrote=
:
> In Xfce xfce4-settings before 4.16.4 and 4.17.x before 4.17.1, there is=
 an
> argument injection vulnerability in xfce4-mime-helper.
>
> References:
> https://nvd.nist.gov/vuln/detail/CVE-2022-45062
> https://gitlab.xfce.org/xfce/xfce4-settings/-/issues/390
>
> Upstream-Status: Backport [https://gitlab.xfce.org/xfce/xfce4-settings/=
-/commit/f1cb5bdafc6b9c71c541de267cc84a8c2ac32049]
>
> CVE: CVE-2022-45062

Hi Archana,

Please update to: xfce4-settings-4.16.5 as was done on master:

commit 83eb9464882752e00746c1da8e3c52f4fc06bbde Author: Kai Kang=20
<kai.kang@windriver.com> Date: Wed Nov 23 01:59:13 2022 xfce4-settings:=20
4.16.3 -> 4.16.5 It fixes CVE-2022-45062 in xfce4-settings 4.16.5. CVE:=20
CVE-2022-45062 Signed-off-by: Kai Kang <kai.kang@windriver.com>=20
Signed-off-by: Khem Raj <raj.khem@gmail.com>

?

$ git tag --contains f1cb5bdafc6b9c71c541de267cc84a8c2ac32049=20
xfce4-settings-4.16.5 $ git branch -a --contains=20
f1cb5bdafc6b9c71c541de267cc84a8c2ac32049 =C2=A0 remotes/origin/xfce-4.16

An update to the latest 4.16.x stable release will pick that commit up:

$ git log --oneline xfce4-settings-4.16.2..xfce4-settings-4.16.5 | rg=20
f1cb5 f1cb5bda mime-settings: Properly quote command parameters

Also the update seems sensible in that it's only bug fixes and=20
translation updates.

$ git log --oneline xfce4-settings-4.16.2..xfce4-settings-4.16.5
83ea11cf (tag: xfce4-settings-4.16.5) Updates for release
f1cb5bda mime-settings: Properly quote command parameters
f7707d8b Revert "Escape characters which do not belong into an URI/URL=20
(Issue #390)"
b532324f Back to development
b9729c85 (tag: xfce4-settings-4.16.4) Updates for release
55e3c5fb Escape characters which do not belong into an URI/URL (Issue #39=
0)
7489b73f I18n: Update translation pt (100%).
d314651f I18n: Update translation ja (100%).
51a8327d I18n: Update translation ru (100%).
42aa66d0 I18n: Update translation ru (100%).
341443f8 Prefer full command when basic command is env (Fixes #358)
8d4106b3 Back to development
024399b1 (tag: xfce4-settings-4.16.3) Updates for release
af601e32 build: Fix intltool lock file problem during make distcheck
0875cfba xfsettingsd: Fix recursive lock in libX11 (Fixes #369)
9195b3bd I18n: Update translation el (98%).
bfbe5173 I18n: Update translation el (98%).
222f2d1d I18n: Update translation el (98%).
dbfd87e5 I18n: Update translation el (98%).
4e7af67d I18n: Update translation en_GB (100%).
2ddf22e0 I18n: Update translation el (98%).
48e206d2 I18n: Update translation el (98%).
448f39ec I18n: Update translation el (98%).
127feac8 I18n: Update translation el (94%).
f82ba7dd I18n: Update translation en_GB (99%).
0654def5 I18n: Update translation en_GB (89%).
8cb73fd5 I18n: Update translation ko (99%).
22d9b99d I18n: Update translation en_CA (96%).
f30b6393 I18n: Update translation sv (100%).
2270d3e3 I18n: Update translation sv (100%).
066891c3 I18n: Update translation ko (97%).
08e417b2 I18n: Update translation ro (83%).
5900ff21 I18n: Update translation oc (100%).
dd3de2c9 I18n: Update translation oc (93%).
b220fdc3 I18n: Update translation et (100%).
842986a0 I18n: Update translation oc (88%).
80aac3e8 I18n: Update translation ms (100%).
c9329f00 I18n: Update translation et (99%).
09af4cc7 I18n: Update translation kk (100%).
77bcf8c5 I18n: Update translation id (100%).
1fc2d34a I18n: Update translation hy_AM (99%).
d84f3fdc I18n: Update translation pl (100%).
90b8f2e1 I18n: Update translation gl (100%).
4611d543 I18n: Update translation ca (100%).
c1ee5b28 I18n: Update translation lt (100%).
33a6052e I18n: Update translation be (100%).
a23c5fc5 I18n: Update translation et (98%).
20d866dc Back to development

Armin, or anyone else, any concerns?

../Randy

>
> Signed-off-by: Archana Polampalli<archana.polampalli@windriver.com>
> ---
>   .../xfce4-settings/files/CVE-2022-45062.patch | 58 ++++++++++++++++++=
+
>   .../xfce4-settings/xfce4-settings_4.16.2.bb   |  3 +-
>   2 files changed, 60 insertions(+), 1 deletion(-)
>   create mode 100644 meta-xfce/recipes-xfce/xfce4-settings/files/CVE-20=
22-45062.patch
>
> diff --git a/meta-xfce/recipes-xfce/xfce4-settings/files/CVE-2022-45062=
.patch b/meta-xfce/recipes-xfce/xfce4-settings/files/CVE-2022-45062.patch
> new file mode 100644
> index 000000000..1e999a7c6
> --- /dev/null
> +++ b/meta-xfce/recipes-xfce/xfce4-settings/files/CVE-2022-45062.patch
> @@ -0,0 +1,58 @@
> +commit f1cb5bdafc6b9c71c541de267cc84a8c2ac32049
> +Author: Ga=C3=ABl Bonithon<gael@xfce.org>
> +Date:   Sat Nov 12 22:27:36 2022 +0100
> +
> +    mime-settings: Properly quote command parameters
> +
> +    Fixes: #390
> +    MR: !85
> +
> +diff --git a/dialogs/mime-settings/xfce-mime-helper.c b/dialogs/mime-s=
ettings/xfce-mime-helper.c
> +index 7149951f..b2d8e50d 100644
> +--- a/dialogs/mime-settings/xfce-mime-helper.c
> ++++ b/dialogs/mime-settings/xfce-mime-helper.c
> +@@ -453,8 +453,43 @@ xfce_mime_helper_execute (XfceMimeHelper   *helpe=
r,
> +       /* reset the error */
> +       g_clear_error (&err);
> +
> ++      /* prepare the command */
> ++      if (exo_str_is_empty (real_parameter))
> ++        command =3D g_strdup (commands[n]);
> ++      else
> ++        {
> ++          /* split command into "quoted"/unquoted parts */
> ++          gchar **cmd_parts =3D g_regex_split_simple ("(\"[^\"]*\")",=
 commands[n], 0, 0);
> ++
> ++          /* walk the part array */
> ++          for (gchar **cmd_part =3D cmd_parts; *cmd_part !=3D NULL; c=
md_part++)
> ++            {
> ++              /* quoted part: unquote it, replace %s and re-quote it =
properly */
> ++              if (g_str_has_prefix (*cmd_part, "\"") && g_str_has_suf=
fix (*cmd_part, "\""))
> ++                {
> ++                  gchar *unquoted =3D g_strndup (*cmd_part + 1, strle=
n (*cmd_part) - 2);
> ++                  gchar *filled =3D exo_str_replace (unquoted, "%s", =
real_parameter);
> ++                  gchar *quoted =3D g_shell_quote (filled);
> ++                  g_free (filled);
> ++                  g_free (unquoted);
> ++                  g_free (*cmd_part);
> ++                  *cmd_part =3D quoted;
> ++                }
> ++              /* unquoted part: just replace %s */
> ++              else
> ++                {
> ++                  gchar *filled =3D exo_str_replace (*cmd_part, "%s",=
 real_parameter);
> ++                  g_free (*cmd_part);
> ++                  *cmd_part =3D filled;
> ++                }
> ++            }
> ++
> ++          /* join parts to reconstitute the command, filled and quote=
d */
> ++          command =3D g_strjoinv (NULL, cmd_parts);
> ++          g_strfreev (cmd_parts);
> ++        }
> ++
> +       /* parse the command */
> +-      command =3D !exo_str_is_empty (real_parameter) ? exo_str_replac=
e (commands[n], "%s", real_parameter) : g_strdup (commands[n]);
> +       succeed =3D g_shell_parse_argv (command, NULL, &argv, &err);
> +       g_free (command);
> +
> diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.=
2.bb b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.2.bb
> index aa4265f7b..6757c48f4 100644
> --- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.2.bb
> +++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.2.bb
> @@ -8,7 +8,8 @@ inherit xfce features_check mime-xdg
>  =20
>   REQUIRED_DISTRO_FEATURES =3D "x11"
>  =20
> -SRC_URI +=3D"file://0001-xsettings.xml-Set-default-themes.patch"
> +SRC_URI +=3D"file://0001-xsettings.xml-Set-default-themes.patch \ +=20
> file://CVE-2022-45062.patch"
>   SRC_URI[sha256sum] =3D "4dd7cb420860535e687f673c0b5c0274e0d2fb6718128=
1d4b85be9197da03d7e"
>  =20
>   EXTRA_OECONF +=3D "--enable-maintainer-mode --disable-debug"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#99991):https://lists.openembedded.org/g/openembedde=
d-devel/message/99991
> Mute This Topic:https://lists.openembedded.org/mt/95517736/3616765
> Group Owner:openembedded-devel+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-devel/unsub  =
[randy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
--=20
# Randy MacLeod
# Wind River Linux

--------------ijFQY6IizOfPV21SDqgJcbm6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 2BCJSelw022554

<html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2022-12-08 02:03, Polampalli,
      Archana via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:20221208070305.1138128-1-archan=
a.polampalli@windriver.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">In Xfce xfce4-settings befor=
e 4.16.4 and 4.17.x before 4.17.1, there is an
argument injection vulnerability in xfce4-mime-helper.

References:
<a class=3D"moz-txt-link-freetext" href=3D"https://nvd.nist.gov/vuln/deta=
il/CVE-2022-45062">https://nvd.nist.gov/vuln/detail/CVE-2022-45062</a>
<a class=3D"moz-txt-link-freetext" href=3D"https://gitlab.xfce.org/xfce/x=
fce4-settings/-/issues/390">https://gitlab.xfce.org/xfce/xfce4-settings/-=
/issues/390</a>

Upstream-Status: Backport [<a class=3D"moz-txt-link-freetext" href=3D"htt=
ps://gitlab.xfce.org/xfce/xfce4-settings/-/commit/f1cb5bdafc6b9c71c541de2=
67cc84a8c2ac32049">https://gitlab.xfce.org/xfce/xfce4-settings/-/commit/f=
1cb5bdafc6b9c71c541de267cc84a8c2ac32049</a>]

CVE: CVE-2022-45062</pre>
    </blockquote>
    <p>Hi Archana,</p>
    <p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; marg=
in-right:0px; -qt-block-indent:0; text-indent:0px;">Please update to:  xf=
ce4-settings-4.16.5 as was done on master:</p>
    <p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; marg=
in-right:0px; -qt-block-indent:0; text-indent:0px;">
</p>
    <p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; marg=
in-right:0px; -qt-block-indent:0; text-indent:0px;">commit 83eb9464882752=
e00746c1da8e3c52f4fc06bbde
Author: Kai Kang <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:kai.ka=
ng@windriver.com">&lt;kai.kang@windriver.com&gt;</a>
Date:   Wed Nov 23 01:59:13 2022

    xfce4-settings: 4.16.3 -&gt; 4.16.5
   =20
    It fixes CVE-2022-45062 in xfce4-settings 4.16.5.
   =20
    CVE: CVE-2022-45062
   =20
    Signed-off-by: Kai Kang <a class=3D"moz-txt-link-rfc2396E" href=3D"ma=
ilto:kai.kang@windriver.com">&lt;kai.kang@windriver.com&gt;</a>
    Signed-off-by: Khem Raj <a class=3D"moz-txt-link-rfc2396E" href=3D"ma=
ilto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
</p>
    <p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; marg=
in-right:0px; -qt-block-indent:0; text-indent:0px;">
</p>
    <p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; marg=
in-right:0px; -qt-block-indent:0; text-indent:0px;">
</p>
    <p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; marg=
in-right:0px; -qt-block-indent:0; text-indent:0px;">?</p>
    <p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; marg=
in-right:0px; -qt-block-indent:0; text-indent:0px;">
</p>
    <p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; marg=
in-right:0px; -qt-block-indent:0; text-indent:0px;">
</p>
    <p>$ git tag --contains f1cb5bdafc6b9c71c541de267cc84a8c2ac32049

  xfce4-settings-4.16.5

$ git branch -a --contains  f1cb5bdafc6b9c71c541de267cc84a8c2ac32049
      &nbsp; remotes/origin/xfce-4.16
    </p>
    <p>An update to the latest 4.16.x stable release will pick that  comm=
it up:
    </p>
    <p>$ git log --oneline xfce4-settings-4.16.2..xfce4-settings-4.16.5
      | rg f1cb5

      f1cb5bda mime-settings: Properly quote command parameters</p>
    <p></p>
    <p>
</p>
    <p>Also the update seems sensible in that it's only bug fixes and tra=
nslation updates.

</p>
    $ git log --oneline xfce4-settings-4.16.2..xfce4-settings-4.16.5<br>
    83ea11cf (tag: xfce4-settings-4.16.5) Updates for release<br>
    f1cb5bda mime-settings: Properly quote command parameters<br>
    f7707d8b Revert &quot;Escape characters which do not belong into an
    URI/URL (Issue #390)&quot;<br>
    b532324f Back to development<br>
    b9729c85 (tag: xfce4-settings-4.16.4) Updates for release<br>
    55e3c5fb Escape characters which do not belong into an URI/URL
    (Issue #390)<br>
    7489b73f I18n: Update translation pt (100%).<br>
    d314651f I18n: Update translation ja (100%).<br>
    51a8327d I18n: Update translation ru (100%).<br>
    42aa66d0 I18n: Update translation ru (100%).<br>
    341443f8 Prefer full command when basic command is env (Fixes #358)<b=
r>
    8d4106b3 Back to development<br>
    024399b1 (tag: xfce4-settings-4.16.3) Updates for release<br>
    af601e32 build: Fix intltool lock file problem during make distcheck<=
br>
    0875cfba xfsettingsd: Fix recursive lock in libX11 (Fixes #369)<br>
    9195b3bd I18n: Update translation el (98%).<br>
    bfbe5173 I18n: Update translation el (98%).<br>
    222f2d1d I18n: Update translation el (98%).<br>
    dbfd87e5 I18n: Update translation el (98%).<br>
    4e7af67d I18n: Update translation en_GB (100%).<br>
    2ddf22e0 I18n: Update translation el (98%).<br>
    48e206d2 I18n: Update translation el (98%).<br>
    448f39ec I18n: Update translation el (98%).<br>
    127feac8 I18n: Update translation el (94%).<br>
    f82ba7dd I18n: Update translation en_GB (99%).<br>
    0654def5 I18n: Update translation en_GB (89%).<br>
    8cb73fd5 I18n: Update translation ko (99%).<br>
    22d9b99d I18n: Update translation en_CA (96%).<br>
    f30b6393 I18n: Update translation sv (100%).<br>
    2270d3e3 I18n: Update translation sv (100%).<br>
    066891c3 I18n: Update translation ko (97%).<br>
    08e417b2 I18n: Update translation ro (83%).<br>
    5900ff21 I18n: Update translation oc (100%).<br>
    dd3de2c9 I18n: Update translation oc (93%).<br>
    b220fdc3 I18n: Update translation et (100%).<br>
    842986a0 I18n: Update translation oc (88%).<br>
    80aac3e8 I18n: Update translation ms (100%).<br>
    c9329f00 I18n: Update translation et (99%).<br>
    09af4cc7 I18n: Update translation kk (100%).<br>
    77bcf8c5 I18n: Update translation id (100%).<br>
    1fc2d34a I18n: Update translation hy_AM (99%).<br>
    d84f3fdc I18n: Update translation pl (100%).<br>
    90b8f2e1 I18n: Update translation gl (100%).<br>
    4611d543 I18n: Update translation ca (100%).<br>
    c1ee5b28 I18n: Update translation lt (100%).<br>
    33a6052e I18n: Update translation be (100%).<br>
    a23c5fc5 I18n: Update translation et (98%).<br>
    20d866dc Back to development
    <p>
</p>
    <p>Armin, or anyone else, any concerns?
</p>
    <p>../Randy</p>
    <p>
</p>
    <p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; marg=
in-right:0px; -qt-block-indent:0; text-indent:0px;"></p>
    <p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; marg=
in-right:0px; -qt-block-indent:0; text-indent:0px;">
</p>
    <p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; marg=
in-right:0px; -qt-block-indent:0; text-indent:0px;">
</p>
    <p><style type=3D"text/css">p, li { white-space: pre-wrap; }</style><=
/p>
    <blockquote type=3D"cite" cite=3D"mid:20221208070305.1138128-1-archan=
a.polampalli@windriver.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

Signed-off-by: Archana Polampalli <a class=3D"moz-txt-link-rfc2396E" href=
=3D"mailto:archana.polampalli@windriver.com">&lt;archana.polampalli@windr=
iver.com&gt;</a>
---
 .../xfce4-settings/files/CVE-2022-45062.patch | 58 +++++++++++++++++++
 .../xfce4-settings/xfce4-settings_4.16.2.bb   |  3 +-
 2 files changed, 60 insertions(+), 1 deletion(-)
 create mode 100644 meta-xfce/recipes-xfce/xfce4-settings/files/CVE-2022-=
45062.patch

diff --git a/meta-xfce/recipes-xfce/xfce4-settings/files/CVE-2022-45062.p=
atch b/meta-xfce/recipes-xfce/xfce4-settings/files/CVE-2022-45062.patch
new file mode 100644
index 000000000..1e999a7c6
--- /dev/null
+++ b/meta-xfce/recipes-xfce/xfce4-settings/files/CVE-2022-45062.patch
@@ -0,0 +1,58 @@
+commit f1cb5bdafc6b9c71c541de267cc84a8c2ac32049
+Author: Ga=C3=ABl Bonithon <a class=3D"moz-txt-link-rfc2396E" href=3D"ma=
ilto:gael@xfce.org">&lt;gael@xfce.org&gt;</a>
+Date:   Sat Nov 12 22:27:36 2022 +0100
+
+    mime-settings: Properly quote command parameters
+   =20
+    Fixes: #390
+    MR: !85
+
+diff --git a/dialogs/mime-settings/xfce-mime-helper.c b/dialogs/mime-set=
tings/xfce-mime-helper.c
+index 7149951f..b2d8e50d 100644
+--- a/dialogs/mime-settings/xfce-mime-helper.c
++++ b/dialogs/mime-settings/xfce-mime-helper.c
+@@ -453,8 +453,43 @@ xfce_mime_helper_execute (XfceMimeHelper   *helper,
+       /* reset the error */
+       g_clear_error (&amp;err);
+=20
++      /* prepare the command */
++      if (exo_str_is_empty (real_parameter))
++        command =3D g_strdup (commands[n]);
++      else
++        {
++          /* split command into &quot;quoted&quot;/unquoted parts */
++          gchar **cmd_parts =3D g_regex_split_simple (&quot;(\&quot;[^\=
&quot;]*\&quot;)&quot;, commands[n], 0, 0);
++
++          /* walk the part array */
++          for (gchar **cmd_part =3D cmd_parts; *cmd_part !=3D NULL; cmd=
_part++)
++            {
++              /* quoted part: unquote it, replace %s and re-quote it pr=
operly */
++              if (g_str_has_prefix (*cmd_part, &quot;\&quot;&quot;) &am=
p;&amp; g_str_has_suffix (*cmd_part, &quot;\&quot;&quot;))
++                {
++                  gchar *unquoted =3D g_strndup (*cmd_part + 1, strlen =
(*cmd_part) - 2);
++                  gchar *filled =3D exo_str_replace (unquoted, &quot;%s=
&quot;, real_parameter);
++                  gchar *quoted =3D g_shell_quote (filled);
++                  g_free (filled);
++                  g_free (unquoted);
++                  g_free (*cmd_part);
++                  *cmd_part =3D quoted;
++                }
++              /* unquoted part: just replace %s */
++              else
++                {
++                  gchar *filled =3D exo_str_replace (*cmd_part, &quot;%=
s&quot;, real_parameter);
++                  g_free (*cmd_part);
++                  *cmd_part =3D filled;
++                }
++            }
++
++          /* join parts to reconstitute the command, filled and quoted =
*/
++          command =3D g_strjoinv (NULL, cmd_parts);
++          g_strfreev (cmd_parts);
++        }
++
+       /* parse the command */
+-      command =3D !exo_str_is_empty (real_parameter) ? exo_str_replace =
(commands[n], &quot;%s&quot;, real_parameter) : g_strdup (commands[n]);
+       succeed =3D g_shell_parse_argv (command, NULL, &amp;argv, &amp;er=
r);
+       g_free (command);
+=20
diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.2.=
bb b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.2.bb
index aa4265f7b..6757c48f4 100644
--- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.2.bb
+++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.2.bb
@@ -8,7 +8,8 @@ inherit xfce features_check mime-xdg
=20
 REQUIRED_DISTRO_FEATURES =3D &quot;x11&quot;
=20
-SRC_URI +=3D <a class=3D"moz-txt-link-rfc2396E" href=3D"file://0001-xset=
tings.xml-Set-default-themes.patch">&quot;file://0001-xsettings.xml-Set-d=
efault-themes.patch&quot;</a>
+SRC_URI +=3D <a class=3D"moz-txt-link-rfc2396E" href=3D"file://0001-xset=
tings.xml-Set-default-themes.patch\+file://CVE-2022-45062.patch">&quot;fi=
le://0001-xsettings.xml-Set-default-themes.patch \
+            file://CVE-2022-45062.patch&quot;</a>
 SRC_URI[sha256sum] =3D &quot;4dd7cb420860535e687f673c0b5c0274e0d2fb67181=
281d4b85be9197da03d7e&quot;
=20
 EXTRA_OECONF +=3D &quot;--enable-maintainer-mode --disable-debug&quot;
</pre>
      <br>
      <fieldset class=3D"moz-mime-attachment-header"></fieldset>
      <pre class=3D"moz-quote-pre" wrap=3D"">-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#99991): <a class=3D"moz-txt-link-freetext" href=3D"ht=
tps://lists.openembedded.org/g/openembedded-devel/message/99991">https://=
lists.openembedded.org/g/openembedded-devel/message/99991</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/95517736/3616765">https://lists.openembedded.org/mt/=
95517736/3616765</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.=
openembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/=
g/openembedded-devel/unsub</a> [<a class=3D"moz-txt-link-abbreviated" hre=
f=3D"mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
    </blockquote>
    <p>
</p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------ijFQY6IizOfPV21SDqgJcbm6--

