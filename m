Return-Path: <guocai.he.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6CA4CA0FE7
	for <webhook@archiver.kernel.org>; Tue, 26 Aug 2025 02:29:22 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.55510.1756175356099781253
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Aug 2025 19:29:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=H1vjOroA;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=03334bb704=guocai.he.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57Q0o2iC1768620
	for <openembedded-devel@lists.openembedded.org>; Mon, 25 Aug 2025 19:29:15 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=4mjW4+r1ZDa1Pr6RB5Z3/per9iK1PJBLQIB19lGenJw=; b=H1vjOroAPH/x
	L3yATGd5stl6DfgyZ2UT2X+qjnt0c2CEn3ZBSid5FyWXiBJW/10dRom8SF9iEGKn
	3MF8SRKQfaGWzZcvMmbOcBEljvrLenjXenkIdAPVpTJzrIyncbN/8IeXiAUmdHRy
	t6FDwFImqzEwNj8Vca44clsbGusvyXHa3Z8kP6YP7DY/b7ltwn4zS3kwlOCP6l7p
	JqznR8fVD0CSENSZgPyIzIakPXQjahy6CVZPB0217HdgtF9cooYkqWWEvbEPouRb
	+gXAo36t6hB5i2Yknotm7RIppuyjhMe9mZT84U9ApgaPdpe9aDKNrKyukokbvDX6
	c+y+W+4sBw==
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04on2048.outbound.protection.outlook.com [40.107.100.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48q8x22d47-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 25 Aug 2025 19:29:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XYJ1TfHCP1tiCi6V7r17xL4mzAT/0riOwyqCEVqPxVySWIEiEXTeoxZ7MgKmD0gevlGOaI1KJ8e9h/DCtwICdihpuELQ2jalJn6I0MDFMKlh7JTadd3lSz+rC3gWVhc4fgLs3bfgRhjmYxwcCT9YHPH3mWrj+Q9YkBKaKMOSUEz52sg+XnrAsGaSfk/S7JnZ5HXsVPDkqaVt8gwjo5aU0Um3xuE4kQfs2nFzLbEhDOPwtKg7WdDtF5eqxN6/TnoWvkP+e+2mYwntB7JT3l4dDXymtcGo/4EsWwDjdrOrmU9DGToLceTM3hMB1fOlTRc7U3X8jOc3/zDcKbJMo9+nzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4mjW4+r1ZDa1Pr6RB5Z3/per9iK1PJBLQIB19lGenJw=;
 b=i406nTz2Q/KkSZxl3MyAGisw9MUuO5K5iZjWsoVoVCcpiFchpoV5iy4a6M7GADGqgRj8uqtDEJ/rFLl2BTNj5o7R3fQcROIAZVJWEHZRt8WIr3gFbIn9oMgd93VocXnpXyiVax0GrLnYLRjbthsx6golUeG8WkwFx/kW6cMmWBBNGmxcRBRnVbS49BX5FAPFM4oKrPb50Dml1NpS+j/VWMzQlE6BEz3Xv7QZbQm3YTaBMRUniG2qXtbdYEJ1gsRY+4AU1fmEpmTq/6mF6IO7Fy9mJ7afuROznV0TJFbJAZKInnWhCKeL1Wl0zg0OCay4uooTVeiRqKCZziEYGTJJSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5586.namprd11.prod.outlook.com (2603:10b6:5:35d::21)
 by CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Tue, 26 Aug
 2025 02:29:13 +0000
Received: from CO6PR11MB5586.namprd11.prod.outlook.com
 ([fe80::813a:3211:c8fd:1f86]) by CO6PR11MB5586.namprd11.prod.outlook.com
 ([fe80::813a:3211:c8fd:1f86%7]) with mapi id 15.20.9052.014; Tue, 26 Aug 2025
 02:29:13 +0000
From: guocai.he.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][kirkstone][PATCH 2/2] unixodbc: fix odbc.pc file generation
Date: Tue, 26 Aug 2025 10:25:31 +0800
Message-Id: <20250826022531.982942-2-guocai.he.cn@windriver.com>
X-Mailer: git-send-email 2.35.5
In-Reply-To: <20250826022531.982942-1-guocai.he.cn@windriver.com>
References: <20250826022531.982942-1-guocai.he.cn@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0196.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:19::11) To CO6PR11MB5586.namprd11.prod.outlook.com
 (2603:10b6:5:35d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5586:EE_|CH3PR11MB8441:EE_
X-MS-Office365-Filtering-Correlation-Id: d9215792-5a8f-4f88-c788-08dde44858a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Dm0mTdOM+GeWYhFvbmnhOOKRMa+msCtgj2uVWUx3Sj3N2Uv7voL/4fQzcb9R?=
 =?us-ascii?Q?i2Uitw7DlcdCAGC8pZgIdDu5OYP5MGUj7aMkrNMmcvPGvQjclW9VXeFKJf1O?=
 =?us-ascii?Q?GAikaR/1QieYqE6T8E2hlfM2Y7vLpBP9L8lalMS09kuwM9Y67KstCRRhvLX3?=
 =?us-ascii?Q?poGGywAdyCWiG6VxEpnOV87Fr77jJv6XKfG6m4SFtqV1knF/ZbcbH2pqbvqu?=
 =?us-ascii?Q?/1//m6vvI5hMcYLobhV0u2R5Ax9MB1Dx9jxhoePQszwXn2AA4ao7FvVFqJIv?=
 =?us-ascii?Q?UvhGcVpWMZRhbGRjSDxj7UevXKPBjnvSpbpanH//tsM11EgaQXlW7e4Z76E7?=
 =?us-ascii?Q?3FEiVUye1zQyTw6JQ1e56tCdJsayhWyL7e+Dp+EuX8X3mdwqtbalSfbv9xwo?=
 =?us-ascii?Q?9XKkZph6NJ9cxIj2BnVKb6AVME3XZX/AVcoDgLyuGXtmEu1ZOd5Hiljh5av9?=
 =?us-ascii?Q?sD/cUdQrBIR/qm9KoazaAi04DyUWxhuIUngdCn9bAHVoiuiT2X9GOZ7GjRgE?=
 =?us-ascii?Q?WnWh7iOcodESBRWzMkj0n5R7vRJV+EORvC2jUOqiLg4j3HMuOwoRK9ulc92f?=
 =?us-ascii?Q?zzhz/nAETdzgFZOx41oiuZHStSk51ZHD2xPeRfOeed1wG7RoUfgbfmVQX/wu?=
 =?us-ascii?Q?lej4XCL+tOJBKsDZA5paC3Gybj0PQFS+BRO6unmftWHg5Z+Wzs6+2l6F6v4D?=
 =?us-ascii?Q?NgIAZ2s+v+0Yf6R+UJ2+zIuXhnvpoaJbleusuwXf9Hiqh9/iApYHh4foX2rb?=
 =?us-ascii?Q?nDikR666rWxHCinTEcyE9MoF0sl/PykgeG6bluW/H2SnlECmONqQUV+0xtVP?=
 =?us-ascii?Q?TagqzDpHTd1Z3F1sDMwb/+2T9OPH8FYUmhJoWu2W4l3GDud4AwDsfLi/PEl1?=
 =?us-ascii?Q?m1r7EclDWlVhddyiqo+oXPxaOHCHm547oAZPlk3mSqiuP3VBMIqGlUQvdZKs?=
 =?us-ascii?Q?9o0XoqGH3CRqDN0wND1dppCsWu04M8vYqokO9zcHJsDFiuX7vYfQI9NsyWME?=
 =?us-ascii?Q?yVkQu3gKQcx+9Xqllz66anZ6/BNiNGdqLArStarvNpIZit4UpHaW37wXa4jj?=
 =?us-ascii?Q?P5gsmw5Ay2/ytfs8EvpIv9eiAh/2FhukeozTdiVHvSF2P91tvx7wL+pU5FFE?=
 =?us-ascii?Q?4vsETrgn0cozny2sBPEXS01/wkxRKeT6U0zUCwKfVxb1qFvRocwv20z7c/zo?=
 =?us-ascii?Q?H3To5HcqgY7f8o6pXLBUEDngtsuAIWC0nGqESDj1OsF39IXIQT5+KWdvR5OB?=
 =?us-ascii?Q?ab2sLW5i6dl8FJYY22K6nB1TyuhO5b7Ote8q3e+4h/Aa/8rhQqhDhcC5Q2xR?=
 =?us-ascii?Q?tE7Fw5RrE65tj0mDEw2ty+/0gPYfJwN3kSw503njf8+inMNgnpMjKKeNqDZX?=
 =?us-ascii?Q?wa4G8H5XcOZQKtPGa4YBqzp3zc46gTfukymwBuDq/r2Sx3XZreLelpiT8tAC?=
 =?us-ascii?Q?T/dlboKCgHQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5586.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Wa9kv/Wls6Jw1yIIWMVcGQUyUhvlcF9BegUfjwTElUViwtiRygtJhFwJuc9H?=
 =?us-ascii?Q?CkzZ7jXpm5C+CS2IoNLmc6wKYe5Uo6lgZXxTgkGHW9YUeDTF5AiBvOji8LR0?=
 =?us-ascii?Q?l2EACvT0h+J7N+1rT+kz2rWUrTo70dCO6f3xmFV0ekzer+HYFUMM/0BvClhH?=
 =?us-ascii?Q?niTK+FJN3D4jtcvHAGQ4V4MH+7IRvJvSs0L/564yvxQsME8/6ZjSczrGqZv2?=
 =?us-ascii?Q?Kmp+U7nPrUMlYjeEK1+Ji4LxJrTw7NJUUjQk/vIWUstlAMy9/551X2+Wff/C?=
 =?us-ascii?Q?CLuoT2DRgnjrXth3kOMraXCwO0/QMHG3LVSlhQyuVvsHcI1SjKYEqgxIyKhj?=
 =?us-ascii?Q?R4MSqPE2bwNfgHtEsNsC8RELJqgy+HAfP9suwzP+1Kxa7EXPxsETd4RKWvuw?=
 =?us-ascii?Q?4PnjrnHzDm3eTt6voEggCZ+3y8O0/jOxO0lMd8K8jJ62PqMXLf9J7n/VGKEQ?=
 =?us-ascii?Q?/U/i5m861R43BN7B+7vIV4WamrtNYCbmgnYDpi0QJZJ706rbOC3sbYtYBUEb?=
 =?us-ascii?Q?xOSag+aFAVdoTGr/Sg1bvl3VLv+9iz+Y7H/UdxJvByLoH7ojd8MbXlqzPn/A?=
 =?us-ascii?Q?zT99aMaWJJ2KvpB9XvtWWT+wgPn7aSnJ3Wjp+HFdSkUavWa6LmK0oUaXQSTy?=
 =?us-ascii?Q?lsqYyCdhM+4Zzdj3DL3xES3CmXlhH1+xhjNWSrpYP8wmr7utmpSzH+8jJUmz?=
 =?us-ascii?Q?LhBM1UWlUrWYH8FLCJTV1My+Krx/Uauqhr/Q149NaSbZX7oauhNLFMcw71og?=
 =?us-ascii?Q?L7qB7ZBwFchXB46BDJx7nB/ZFyUfM+aIVkwi0toCFk1EReF6UQU6dl/9vXdC?=
 =?us-ascii?Q?EdYqi8gOAQpIgJt56oObfC6PqZK+Lqxp1+7Bm0WchsjJF7oImjDG3EeTbo9U?=
 =?us-ascii?Q?EBTnTLnjSO5operfHTGYUQwpA1KXG4hbXRKHS8jQa6y27Wjlio0MDnmOLJmu?=
 =?us-ascii?Q?FqR9STQqPm4/SVXGWNKr/KduP6TUS7K11Q5cqaEugSzl5gYLRlcdIlViwdOD?=
 =?us-ascii?Q?mZnfeTzi2E0a0CzNg9tOyJ/QKvabD4yh5CPKY3eSnShYN5BfJeuRVspaDbmU?=
 =?us-ascii?Q?tqpr/+zOHvpFr1nN1qPVNLLglWOKtySuk3tClUke9bYb8fv75iOHeEJKofwR?=
 =?us-ascii?Q?bXxj1SmEp72sIqysmqA7vRMEhIQB17ZhfgTlpsVheGtCGt2W80TL8NCecPJy?=
 =?us-ascii?Q?7RadWHAV9poeGhlH73vLlvd/Mthy+WetzfoZXNroufhGHKfMjQoDH5juY9gD?=
 =?us-ascii?Q?SB9jtpa+4ccxE4wVoozjwIoqjgAAWDsrxGazI+IgmxhTW9mh4SCzOBDQ5bl3?=
 =?us-ascii?Q?KlsA5cbnq2Um7BVQbyQgdHzI1iWz1M+K9meLFbya20G+hEwThFdf9mJZ8Mmd?=
 =?us-ascii?Q?Cs/DOBghwx0alIj9afWH+5NTjiPvDUHA5oRtH+vQx/JG99zQcYg1PYbka/3s?=
 =?us-ascii?Q?IjiSP+7F3qNMr+L8Hy0bRTOz7UTInL2UTRpvkaJSWizVnzB1RDWjf6RTLDmB?=
 =?us-ascii?Q?M+Cn/ZRcjUYRT9g56blQIpIluyREbAoamfhDw8z18Ge31uS82qOtXsxEl8rc?=
 =?us-ascii?Q?ar7zN+zHr7sQDLMkndQ/Z3WhrXjOT8WsnCwUB9hWQa6eulLhdouNMYvu4B7V?=
 =?us-ascii?Q?2Q=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9215792-5a8f-4f88-c788-08dde44858a7
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5586.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 02:29:13.5267
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GoMMol6T9niS5aHZqKQSDlkPFpVAZ4NeZYCiK4EbCKXPY2/OOAtEtG7o7ou5IFm/a3BUk0aBTlBlMbLl2CXHu9ji4dHSmnUo6FlPoJHnZNg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8441
X-Proofpoint-ORIG-GUID: wMnjPdWOqe7OJFq8ypw5C_WABnDfYA7m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI2MDAyMSBTYWx0ZWRfX4moJxa+WENNl
 mUTQfx5psIcQ1dIgivi/AtSBDYJbe1lPEQrY56RnPp+HCv4cayWEuixQNQWmC3B5qAkeTbr+dQV
 oqvzyGFH8TPI1gtgHvo2a2W7pe8uK3x4TZXuoqGgP4zxs4QGOy0xU86LOebwEiSAIRzIFLxMUkm
 MKohaShRLAFnejNsUhQKaOYbHycvSyIp4ZHX0TpeEFOA88rofwGoLwmEqgII9NoDXEQO24sGXAu
 YH6MYTJp5wXQ/MYDB0GUEYUy//oAxxLQSM0pBDicaVHJF+hvXKy+0xguCFhPgDo9rZjePuoA94+
 VOwOrQFkExt13E2pWJ17J1h2mijWKQUWQOV/KEvN2oMp3zVwBJUhm1mfsLjN/k=
X-Authority-Analysis: v=2.4 cv=JfW8rVKV c=1 sm=1 tr=0 ts=68ad1bfb cx=c_pps
 a=IGreAyPUPBSHjVw7E5NCrg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10 a=OGsvooznAAAA:8 a=t7CeM3EgAAAA:8
 a=pGLkceISAAAA:8 a=mkHrBcZMAAAA:8 a=uRfLOlAZFTe6pboXpXoA:9
 a=_MKx33s3DjsVgJzmPKfz:22 a=FdTzh2GWekK77mhwV6Dw:22 a=1kRi9TBWcLYPZ6U7oU-V:22
X-Proofpoint-GUID: wMnjPdWOqe7OJFq8ypw5C_WABnDfYA7m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_01,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0
 adultscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Aug 2025 02:29:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119104

From: Guocai He <guocai.he.cn@windriver.com>

The build process currently succeeds but the odbc.pc file is not correctly
generated.

The error message is like below in log.do_compile and log.do_install:

  /bin/bash: line 1: ../exe/odbc_config: cannot execute binary file: Exec format error

I can see the message comes from the following line in exe/Makefile.am:

@sed "s![@]ODBC_ULEN[@]!`$(top_builddir)/exe/odbc_config$(EXEEXT) --ulen`!" \
          $(top_builddir)/DriverManager/odbc.pc > $(top_builddir)/exe/odbc.pc.tmp

It's running the exe/odbc_config program we built out. But the binary is for the target
platform and if we run it on the build host, we get that error message. The resulting ulen
and build_cflags in the final odbc.pc file are also empty.

Fix the issue by using qemu usermode to launch the target binary.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>

(master rev: 4cbd72f7b942af44da0704f66c1b0feef8699fe6)

Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
---
 ...add-CROSS_LAUNCHER-to-run-odbc_confi.patch | 54 +++++++++++++++++++
 .../unixodbc/unixodbc_2.3.9.bb                | 18 ++++++-
 2 files changed, 71 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/unixodbc/files/0001-exe-Makefile.am-add-CROSS_LAUNCHER-to-run-odbc_confi.patch

diff --git a/meta-oe/recipes-support/unixodbc/files/0001-exe-Makefile.am-add-CROSS_LAUNCHER-to-run-odbc_confi.patch b/meta-oe/recipes-support/unixodbc/files/0001-exe-Makefile.am-add-CROSS_LAUNCHER-to-run-odbc_confi.patch
new file mode 100644
index 0000000000..c763a9feb6
--- /dev/null
+++ b/meta-oe/recipes-support/unixodbc/files/0001-exe-Makefile.am-add-CROSS_LAUNCHER-to-run-odbc_confi.patch
@@ -0,0 +1,54 @@
+From e886222c70d4b251f0785f670477b7aee938e5af Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Wed, 21 Feb 2024 13:55:41 +0800
+Subject: [PATCH] exe/Makefile.am: add CROSS_LAUNCHER to run odbc_config
+
+In case of cross compilation, the odbc_config cannot run, the error message
+would be like below:
+
+  /bin/bash: line 1: ../exe/odbc_config: cannot execute binary file: Exec format error
+
+Add CROSS_LAUNCHER to allow the possibility of running odbc_config correctly in
+case of cross compilation.
+
+For example, here's a possible value for it (Yocto project environment, aarch64 target).
+  export CROSS_LAUNCHER="PSEUDO_UNLOAD=1 qemu-aarch64 -r 5.15 \
+  -L /PATH/TO/unixodbc/2.3.11/recipe-sysroot \
+  -E LD_LIBRARY_PATH=/PATH/TO/unixodbc/2.3.11/recipe-sysroot//usr/lib:/PATH/TO/unixodbc/2.3.11/recipe-sysroot//usr/lib  "
+
+Other projects can use the launcher they like to allow correct generation of
+the odbc.pc file in cross compilation environment.
+
+Upstream-Status: Submitted [Personal Email, nick.gorham@easysoft.com]
+
+As said in the official website, https://www.unixodbc.org/, the way to report bug and send
+out patch is via personal email. So there's a public link above.
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ exe/Makefile.am | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/exe/Makefile.am b/exe/Makefile.am
+index 03f3d5a..5f33cf2 100644
+--- a/exe/Makefile.am
++++ b/exe/Makefile.am
+@@ -59,11 +59,13 @@ slencheck_SOURCES = slencheck.c
+ dltest_DEPENDENCIES = $(LTDLDEPS)
+ dltest_LDADD = $(LIBLTDL)
+ 
++CROSS_LAUNCHER ?= ""
++
+ all-am:
+-	@sed "s![@]ODBC_ULEN[@]!`$(top_builddir)/exe/odbc_config$(EXEEXT) --ulen`!" \
++	@sed "s![@]ODBC_ULEN[@]!`$(CROSS_LAUNCHER)$(top_builddir)/exe/odbc_config$(EXEEXT) --ulen`!" \
+ 	  $(top_builddir)/DriverManager/odbc.pc > $(top_builddir)/exe/odbc.pc.tmp
+ 	@mv -f $(top_builddir)/exe/odbc.pc.tmp $(top_builddir)/DriverManager/odbc.pc
+-	@sed "s![@]ODBC_CFLAGS[@]!`$(top_builddir)/exe/odbc_config$(EXEEXT) --cflags | sed 's/ -I.*//'`!" \
++	@sed "s![@]ODBC_CFLAGS[@]!`$(CROSS_LAUNCHER)$(top_builddir)/exe/odbc_config$(EXEEXT) --cflags | sed 's/ -I.*//'`!" \
+ 	  $(top_builddir)/DriverManager/odbc.pc > $(top_builddir)/exe/odbc.pc.tmp
+ 	@mv -f $(top_builddir)/exe/odbc.pc.tmp $(top_builddir)/DriverManager/odbc.pc
+ 
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-support/unixodbc/unixodbc_2.3.9.bb b/meta-oe/recipes-support/unixodbc/unixodbc_2.3.9.bb
index 66881a223e..0f6aacb37e 100644
--- a/meta-oe/recipes-support/unixodbc/unixodbc_2.3.9.bb
+++ b/meta-oe/recipes-support/unixodbc/unixodbc_2.3.9.bb
@@ -11,23 +11,39 @@ DEPENDS = "libtool readline"
 SRC_URI = "http://ftp.unixodbc.org/unixODBC-${PV}.tar.gz \
            file://do-not-use-libltdl-source-directory.patch \
            file://CVE-2024-1013.patch \
+           file://0001-exe-Makefile.am-add-CROSS_LAUNCHER-to-run-odbc_confi.patch \
 "
 SRC_URI[sha256sum] = "52833eac3d681c8b0c9a5a65f2ebd745b3a964f208fc748f977e44015a31b207"
 
 UPSTREAM_CHECK_REGEX = "unixODBC-(?P<pver>\d+(\.\d+)+)\.tar"
 
-inherit autotools-brokensep multilib_header
+inherit autotools-brokensep multilib_header qemu
 
 S = "${WORKDIR}/unixODBC-${PV}"
 
 EXTRA_OEMAKE += "LIBS=-lltdl"
 
+DEPENDS:append:class-target = "${@' qemu-native' if bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', True, False, d) else ''}"
+QEMU_WRAPPER = "${@qemu_wrapper_cmdline(d, '${STAGING_DIR_HOST}', ['${STAGING_DIR_HOST}/${libdir}','${STAGING_DIR_HOST}/${base_libdir}'])}"
+
 do_configure:prepend() {
     # old m4 files will cause libtool version don't match
     rm -rf m4/*
     rm -fr libltdl
 }
 
+do_compile:prepend() {
+    if ${@bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', 'true', 'false', d)}; then
+        export CROSS_LAUNCHER="${QEMU_WRAPPER} "
+    fi
+}
+
+do_install:prepend() {
+    if ${@bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', 'true', 'false', d)}; then
+        export CROSS_LAUNCHER="${QEMU_WRAPPER} "
+    fi
+}
+
 do_install:append() {
     oe_multilib_header unixodbc_conf.h
 }
-- 
2.34.1


