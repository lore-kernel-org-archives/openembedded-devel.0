Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B73C8CAC5A8
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 08:37:20 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.9107.1758184638514927339
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Sep 2025 01:37:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=rX5MMHNb;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1356ab658e=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58I4ehGn2372847
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 01:37:18 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=sUoNjFqzqxJ526p8eCS//Vk2cyHxfva8CQlt3vT0LvQ=; b=rX5MMHNbsR40
	KealGrnzjTotFRRId3xLS3ybgcZEs9F1vPYmbSV1JJ7AhBqhhbvfi/8P5a/pvfUQ
	zjBse2V7LjdSCTVzPrzRv4+s+L6f8jIY3pATCXJ6GlEo9GjQZGXFWTEAyr7oy43j
	mXVQeub/XpjA+3CjsFSJTyfKNzgXyfB4pzSsudWJLqFYq5gJQjDVA8hwXKm3fVtW
	CAs0SXq7cWhg6j9C+OuYddDFpL9lRpbmqE9pQ/kPzYWhEkrgN4ytudeT8mKKC2sm
	LxcJx02+6cBzIXv/jPNAX+zRYDiLsqktcw71U3VproW7lYt5F2VX2VXXG0c+EJoY
	uI6y0RlqQQ==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013011.outbound.protection.outlook.com [40.93.201.11])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 497fwr1svj-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 01:37:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qDfkGtFDlaXs4V7ygzfy533SkCO438ZiaN871ASMJ5sAZPf5moskkIgxEzvX8pWuawJwJO8HrNdq15Bd/pPBDcoi0XEf30CfaZ49KWy4dwz8bu7Wbea4pVIGx1+neOo7HxydHMPyK6dK89a8jpa33ow63oyfzW52qfDX2Tb3oaRWxTO1h/saotcTzbVUp9AzwR92Sa4UyzyOCEb9FTJqic9VfsbbkC9zgmoB8id6ti736Tds5chEUeTcUHkqVOo9aEATJCRxAnMcdvcD26ZGml8fFYx+lFAnwn/AE872+pIzTAg88wDsQIb537nMN1t9NUt2+U4i/h4brf2lmgkDFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sUoNjFqzqxJ526p8eCS//Vk2cyHxfva8CQlt3vT0LvQ=;
 b=x0/DwG7f0BXihF09aUmZXNMfcwqaWP2ktFDOqQeT6/D5IFAf/dlW8llHuWSjDoZCbFUcbo3bHrOBZov5Zw/N5/3ViloBZneana2cFA0HdE6T40Xu6y77C1VFBPa6TC3wiaf2iCBT203zOCEVoIw0G0fjetvrH/5UvD4fMDZWOGNwei4/QSL92TFFHY6nSlzn0FULEMQ3zibq4Mpm1pyJlcCyASxhyupHTHEris4ofBImVp52IYWzQCzZDbYXRl0Aa15yc1OekK3qZ7MsgzLHDfIX3kexnRbHiAYPyXg1XjTcgSIU2NZqsWO8JY4GjyFDpCWgmM2ajczPsYquMmptvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by PH8PR11MB8062.namprd11.prod.outlook.com (2603:10b6:510:251::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Thu, 18 Sep
 2025 08:37:16 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f%4]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 08:37:16 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 2/2] wxwidgets: fix CVE-2024-58249
Date: Thu, 18 Sep 2025 16:37:03 +0800
Message-ID: <20250918083704.181400-2-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250918083704.181400-1-peng.zhang1.cn@windriver.com>
References: <20250918083704.181400-1-peng.zhang1.cn@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYWP286CA0004.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::6) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|PH8PR11MB8062:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f62c028-5f81-4c4a-0f41-08ddf68e92b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?qyAD54QuZQS6+nhYDEXGkTsND+ywhU5zHaUJUj/00hGA8IYOLjmjQJcdSOcH?=
 =?us-ascii?Q?Zyp34ntU6FLlmBgMybLORBqRhrcJAp8rxam14TQ37K7po9+BdAfVTdB3qAYw?=
 =?us-ascii?Q?O82bFVCtpz+RNrOjTZb6nu+NCklp8jXHm7fXrOSdTfS42zZ+nS4FAeZbrWSA?=
 =?us-ascii?Q?WreriQP4/adv6+x31yHN98dEQmsm8zwN3egcqK6pd/NsMdqHMwrmfza2g2n4?=
 =?us-ascii?Q?v9O/UbXmcJ52t7ppldFlKlznr0Mqmq5HNT+R3L/kvXzOxJnSK7otUx5BMTpw?=
 =?us-ascii?Q?R4p51fdyT2gsyjX2L90Retw/TBnQPzNbnac2bBkUe2o1nUGKUIGP6rjLDrAj?=
 =?us-ascii?Q?/r7LGo9XVYZIEgj2n930Ep7mNwyHvMwV1wAVvpEmyIhFcKSalR/NtTbD6ane?=
 =?us-ascii?Q?7JP6odqa5pkUxEb1kSlAvzYdGODpoPhd20yAkjKMV+K7LxuU8NV/oUTR5xJe?=
 =?us-ascii?Q?sdpweyB6jhiwNo63lcm6eDbvxXf7AfiYboAjiHDITNhkSAZFDaHapeJoncUO?=
 =?us-ascii?Q?Cx8ijrXWCfdUMAlr0Zj3T5uMRHaVcT3XAUDWV1fjs1tpQe8tz8XAN9aCGXwa?=
 =?us-ascii?Q?oNTX0by+z5clptEZU00Gl/QhW/Ax20ZGQczXNVFsh8jDM55gm59xfJRc2tAA?=
 =?us-ascii?Q?Ixw6XFn23ydst+RBdVEjN/7KCl2inJT0PaJSGR/PFf8GG+pX5OAAwvnx+udl?=
 =?us-ascii?Q?kvbSmDeepezAecx8vq6BD1Nb2vjtldmEDOlKPK+p4PjVYEK7p7VNfoivzcjD?=
 =?us-ascii?Q?TT8shegVR0J1+x4APiUJWFiRnAfWK8BXEaUNqESuUzaOo6B8Mn6XKIGiLwZP?=
 =?us-ascii?Q?5AEotr/YhsB1nPUyw9/0JxYTb+x6CJeaVww9BOnfYEVR8lOIZbeeoJTljJX9?=
 =?us-ascii?Q?SsZWg2RVvzuYWD/reZyPEnzigvJZ/BvJnFpAoQYOxpxYLUIKYl6wvf8mAzNQ?=
 =?us-ascii?Q?mMOELnptDbCFQIpf+dnsMsJhL85J2kRii7oAo7nM1VLxDUiTfMCeXJmDnJ+Q?=
 =?us-ascii?Q?SJ7jTydPEb9kRNpdJYB1wX2CSCYqYJhGdzN6WINk6FoWPaTj5WpvPOyKxZJ3?=
 =?us-ascii?Q?DlUc91A/xHw1Fmv+BExPb/Li7LFt7t+o5fqKbP+JkHkxXoUV64XP6UlOzxk4?=
 =?us-ascii?Q?hZbi2EA2V9jKzW/a9wntp6RVYf4IXi7kIlpfF8ZPSByNIJ9wbccAora2d7gs?=
 =?us-ascii?Q?xwK8naePhuE6EAMRJA6a5Vt7u7JXtCyJYfPciuE49RasbnNF76ZlmppCdHad?=
 =?us-ascii?Q?DaX/w0TRJvczQgDKeijTqzN3eCSSSJipKPlgwZ1mbiVN61xsipu2W168S2Nr?=
 =?us-ascii?Q?kfNhZBiHkTzpl7vCJeF9ISowqWKD0OX1+M8wsexktuRyvMb/1cxf9XUyn5vI?=
 =?us-ascii?Q?SupM8aFkQF9h8ZrD/kevf1RlRrrIu4KnhggnlyoJc+T9NTsmfT3X+78CKz5l?=
 =?us-ascii?Q?cfSi6WQ0O23dVd3dawSSL7BRajfsy6c6P8QebPtF0Ua+3H1a11IWc6rjleyW?=
 =?us-ascii?Q?DzA8JO3fhDRN/xc=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?OHsdgNa+j6Orc1GLMs8FQwPb5OFfTJXwayYtC0FLeUVRR21CSqyk3BMagzl/?=
 =?us-ascii?Q?37Eh53igklwf1RBuHsBmo1uFVff4YKAETkB1JLjgD4IKcr6FNuO4GQMiWHUS?=
 =?us-ascii?Q?T+dITkraLMMiXvx4i6+hJuy6oB3BSnMS0oyiZ/ObwDq+k0BuhaiopgceuUbD?=
 =?us-ascii?Q?IAT7DAdW0xzCTj9Vzd7jF5BaAAEntpV7Ci0T1FdBpNr5T5uyVjjAcc86Z6kk?=
 =?us-ascii?Q?Mmb538q8pkYNinf5xLkWUvIg90WqS39+1skVbd85vRuFdI8WWbs1byEH4IPw?=
 =?us-ascii?Q?MlWMBps1f/PGpvqwyNgXN2ZrM8uE1xmN4NbUoL3RHVpBrTtJyCpBoHvwPRIG?=
 =?us-ascii?Q?ainYv+dPwfbVApnFPcF94UD6KjTMiNpRcAcRVPiysqEubRlZZ5zz7Cmn3sqo?=
 =?us-ascii?Q?31UrJR15gXiZQxR0n/21Qy+DU62mBfGm3YpEnuewOK5pYe/AKfUrSQcuNf89?=
 =?us-ascii?Q?dz7XyxJDsaB0qh6jqys1SZ7LulYCxkyy7mAzvqvP4QNUW34V9Qx0xzWcEc07?=
 =?us-ascii?Q?+kkziNUgu0Yr7+9aORWx8shZZ6PNiD8qdkAT3C3M9Ne8zDy3Jb5CvmAjrfUW?=
 =?us-ascii?Q?SAuEUJ2mqEkXfkNbFupc6N/EwJpRIvfYs/+NX3ukenE9/ujgfk19mDUDg68h?=
 =?us-ascii?Q?NyWM1RcQY8pTE6VXQc2XW6bVw7d+Ib1od6qT/2RZjP2wN84tyIYaKmQ+4j5m?=
 =?us-ascii?Q?AWpD3YP8xbyilZdL6ozcqMA3atXuqQabjhXaSRMP1BXx1kRp/jbfQHqoILVJ?=
 =?us-ascii?Q?XYdPasgIT/rbEcEXCZ4gztL3xWuYo6N+3efjfs9VVYJtZOnOVhG+cz+6isoC?=
 =?us-ascii?Q?qtLeVmB1O5rDViGgNpUKt63r50iYwNDBjEcP89yZFF3218My7k9zc5U2mk7t?=
 =?us-ascii?Q?mrhDbSRmmLwZbFdkhdGKMh63pJlfp3+FNOZcAsWr8oaj8IO4CPRMc2N+1lkX?=
 =?us-ascii?Q?+i76kUPoCktiLgYxPdQB7AT4/VV3PW1lWzoiR/+9Ua1WpmPCRONoLZqhRUTO?=
 =?us-ascii?Q?cON3bAHIcLChBYoEgB8DDb6Un7egViP3FLzsJEa/q52gVKOLYp6XWtRs2YZg?=
 =?us-ascii?Q?3PLJD7/kzOtXGr0U3l5PLqeU4R8i6zpg1wW4FNMcwTXCQxUXOutd2vEEiH+N?=
 =?us-ascii?Q?//0pbTdtPIqwZIfrTybdKxERFsPz/KmRavRnJn75e+rpiC6QdEN7aN55Fmls?=
 =?us-ascii?Q?uaQvohrLvuj534A8jJ6iozcTZqI5GmuVEOnZYA1Sggud+dwPYLjY1tH7hAoJ?=
 =?us-ascii?Q?oRibKVWm/Tj3oSgW+d5OC18ZFFnTjtkKWRdlBmRbemMpOJk0jOP4Z+Y63U6H?=
 =?us-ascii?Q?33ZBHT8rQS6fwQ6lx2nNxB4khQYnSPMAe2YAaFb3glVTywtJw0qaj1Bh7izq?=
 =?us-ascii?Q?iPFKbAfX1eiZ8jZctK9lagLspwn/SrEdDEMxowuk+s8TLcadQUIQ5Qkya8cf?=
 =?us-ascii?Q?pdZOxaU3XB3Mwnqy3cpo0c+zo4Iivn6hr1Rn8Q/S/L6p/hf6HNyoP1foSX74?=
 =?us-ascii?Q?YQ9tBf2ZX7HBGehDv6kMoiVRiZzTEieBYQKt2brhd1aQikOuKvlR0iDdbLLr?=
 =?us-ascii?Q?aqN1hrQuRsInqsJc43XtOHLDsHjHDCvCrhOZspzIbjgr+QtIhtzYkP4JEYaA?=
 =?us-ascii?Q?ug=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f62c028-5f81-4c4a-0f41-08ddf68e92b9
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 08:37:16.5865
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B7CQt57N25z7plSpGolTvIzh13tSadF4O9O9moTFiklGkB1FlOG7NY+HaWS2T9n+RXviPoaWVsEFQFbY4r81T28yXVHasHJNRh7HtQjjr2M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8062
X-Authority-Analysis: v=2.4 cv=Jay8rVKV c=1 sm=1 tr=0 ts=68cbc4be cx=c_pps
 a=NzAOMTrFL2nmaFUJOsdohw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=IFCbucT4AAAA:8 a=3epcOkmVbHiDymNTJPUA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=cnuYUo6HLIWjuL6tXTi5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE4MDA3OCBTYWx0ZWRfX0KHojjNW8VpR
 y6wM0QMT/tTnWy6UHamxnkWaqbu1Y/wcEMkoCN5i2L6CgBV/QPt+Io5AEYVYOonv238n71brEtV
 MnWWQ2B1oIBK39Th6tFKsWt1JjRK0jhUoZZolwGsHOeSkHCh4v2ZNNsIi9jsadj7Aervj8jeQzR
 lC7rp+S1iBfW4pOIKsz70fs6Y1ZE00Wowcg8FbwTrmae4NDXol4mmfEIV0jXUzWYjYJ5tkPldxh
 IaoqJYUGfpk43UPQnT1hAJWT96Q549kxe6G9in481cMRAwJqMiWLn4bmvlR8YblP3ltpDLKXRpA
 ZfhT1W6iDH1GVwPWMfibVqWN3rONMGtMbRCFXwddIQ21k9u2HkCcQxxamfIwrY=
X-Proofpoint-GUID: Ep6gwisYKjt-JTZ9mLBe9KYJuxUb6mFv
X-Proofpoint-ORIG-GUID: Ep6gwisYKjt-JTZ9mLBe9KYJuxUb6mFv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-18_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 suspectscore=0 adultscore=0
 bulkscore=0 phishscore=0 spamscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 08:37:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119540

From: Zhang Peng <peng.zhang1.cn@windriver.com>

CVE-2024-58249:
In wxWidgets before 3.2.7, a crash can be triggered in wxWidgets apps when connections are refused in wxWebRequestCURL.

Reference:
[https://nvd.nist.gov/vuln/detail/CVE-2024-58249]

Upstream patches:
[https://github.com/wxWidgets/wxWidgets/commit/f2918a9ac823074901ce27de939baa57788beb3d]

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>

(walnascar rev: d3d3df49d5f6e8747c0b04100c4f708b4cafbbd4)
Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 .../wxwidgets/wxwidgets/CVE-2024-58249.patch  | 178 ++++++++++++++++++
 .../wxwidgets/wxwidgets_3.2.6.bb              |   1 +
 2 files changed, 179 insertions(+)
 create mode 100644 meta-oe/recipes-extended/wxwidgets/wxwidgets/CVE-2024-58249.patch

diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets/CVE-2024-58249.patch b/meta-oe/recipes-extended/wxwidgets/wxwidgets/CVE-2024-58249.patch
new file mode 100644
index 0000000000..8ba9cc1b04
--- /dev/null
+++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets/CVE-2024-58249.patch
@@ -0,0 +1,178 @@
+From e440b3a6097546a8aca66bd4c7a21be25e89d340 Mon Sep 17 00:00:00 2001
+From: Vadim Zeitlin <vadim@wxwidgets.org>
+Date: Sun, 27 Oct 2024 00:56:21 +0200
+Subject: [PATCH] Fix crash when connection is refused in wxWebRequestCURL
+
+Avoid deleting wxEventLoopSourceHandler which may be still in use, as is
+the case when we get write IO notification just before an error one: if
+we delete the handler while handling the former, we crash when getting
+the latter one.
+
+Use a hack to avoid deleting the handlers for which write notification
+is being processed and delete them later, when we get the error one.
+
+See #24885.
+
+(cherry picked from commit 4e0fca8ab9756989598d07b41e672af86eac7092)
+
+CVE: CVE-2024-58249
+Upstream-Status: Backport [https://github.com/wxWidgets/wxWidgets/commit/f2918a9ac823074901ce27de939baa57788beb3d]
+
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ src/common/webrequest_curl.cpp | 80 +++++++++++++++++++++++++---------
+ 1 file changed, 60 insertions(+), 20 deletions(-)
+
+diff --git a/src/common/webrequest_curl.cpp b/src/common/webrequest_curl.cpp
+index f50acf4f8d..64650ab6b4 100644
+--- a/src/common/webrequest_curl.cpp
++++ b/src/common/webrequest_curl.cpp
+@@ -704,10 +704,13 @@ SocketPollerImpl* SocketPollerImpl::Create(wxEvtHandler* hndlr)
+ 
+ // SocketPollerSourceHandler - a source handler used by the SocketPoller class.
+ 
++class SourceSocketPoller;
++
+ class SocketPollerSourceHandler: public wxEventLoopSourceHandler
+ {
+ public:
+-    SocketPollerSourceHandler(curl_socket_t, wxEvtHandler*);
++    SocketPollerSourceHandler(curl_socket_t sock, SourceSocketPoller* poller)
++        : m_socket(sock), m_poller(poller) {}
+ 
+     void OnReadWaiting() wxOVERRIDE;
+     void OnWriteWaiting() wxOVERRIDE;
+@@ -716,16 +719,9 @@ public:
+ private:
+     void SendEvent(int);
+     curl_socket_t m_socket;
+-    wxEvtHandler* m_handler;
++    SourceSocketPoller* const m_poller;
+ };
+ 
+-SocketPollerSourceHandler::SocketPollerSourceHandler(curl_socket_t sock,
+-                                                     wxEvtHandler* hndlr)
+-{
+-    m_socket = sock;
+-    m_handler = hndlr;
+-}
+-
+ void SocketPollerSourceHandler::OnReadWaiting()
+ {
+     SendEvent(SocketPoller::READY_FOR_READ);
+@@ -741,14 +737,6 @@ void SocketPollerSourceHandler::OnExceptionWaiting()
+     SendEvent(SocketPoller::HAS_ERROR);
+ }
+ 
+-void SocketPollerSourceHandler::SendEvent(int result)
+-{
+-    wxThreadEvent event(wxEVT_SOCKET_POLLER_RESULT);
+-    event.SetPayload<curl_socket_t>(m_socket);
+-    event.SetInt(result);
+-    m_handler->ProcessEvent(event);
+-}
+-
+ // SourceSocketPoller - a SocketPollerImpl based on event loop sources.
+ 
+ class SourceSocketPoller: public SocketPollerImpl
+@@ -760,6 +748,8 @@ public:
+     void StopPolling(curl_socket_t) wxOVERRIDE;
+     void ResumePolling(curl_socket_t) wxOVERRIDE;
+ 
++    void SendEvent(curl_socket_t sock, int result);
++
+ private:
+     WX_DECLARE_HASH_MAP(curl_socket_t, wxEventLoopSource*, wxIntegerHash,\
+                         wxIntegerEqual, SocketDataMap);
+@@ -768,11 +758,25 @@ private:
+ 
+     SocketDataMap m_socketData;
+     wxEvtHandler* m_handler;
++
++    // The socket for which we're currently processing a write IO notification.
++    curl_socket_t m_activeWriteSocket;
++
++    // The sockets that we couldn't clean up yet but should do if/when we get
++    // an error notification for them.
++    wxVector<curl_socket_t> m_socketsToCleanUp;
+ };
+ 
++// This function must be implemented after full SourceSocketPoller declaration.
++void SocketPollerSourceHandler::SendEvent(int result)
++{
++    m_poller->SendEvent(m_socket, result);
++}
++
+ SourceSocketPoller::SourceSocketPoller(wxEvtHandler* hndlr)
+ {
+     m_handler = hndlr;
++    m_activeWriteSocket = 0;
+ }
+ 
+ SourceSocketPoller::~SourceSocketPoller()
+@@ -822,9 +826,7 @@ bool SourceSocketPoller::StartPolling(curl_socket_t sock, int pollAction)
+     }
+     else
+     {
+-        // Otherwise create a new source handler.
+-        srcHandler =
+-            new SocketPollerSourceHandler(sock, m_handler);
++        srcHandler = new SocketPollerSourceHandler(sock, this);
+     }
+ 
+     // Get a new source object for these polling checks.
+@@ -858,6 +860,15 @@ bool SourceSocketPoller::StartPolling(curl_socket_t sock, int pollAction)
+ 
+ void SourceSocketPoller::StopPolling(curl_socket_t sock)
+ {
++    if ( sock == m_activeWriteSocket )
++    {
++        // We can't clean up the socket while we're inside OnWriteWaiting() for
++        // it because it could be followed by OnExceptionWaiting() and we'd
++        // crash if we deleted it already.
++        m_socketsToCleanUp.push_back(sock);
++        return;
++    }
++
+     SocketDataMap::iterator it = m_socketData.find(sock);
+ 
+     if ( it != m_socketData.end() )
+@@ -871,6 +882,35 @@ void SourceSocketPoller::ResumePolling(curl_socket_t WXUNUSED(sock))
+ {
+ }
+ 
++void SourceSocketPoller::SendEvent(curl_socket_t sock, int result)
++{
++    if ( result == SocketPoller::READY_FOR_WRITE )
++    {
++        // Prevent the handler from this socket from being deleted in case we
++        // get a HAS_ERROR event for it immediately after this one.
++        m_activeWriteSocket = sock;
++    }
++
++    wxThreadEvent event(wxEVT_SOCKET_POLLER_RESULT);
++    event.SetPayload<curl_socket_t>(sock);
++    event.SetInt(result);
++    m_handler->ProcessEvent(event);
++
++    m_activeWriteSocket = 0;
++
++    if ( result == SocketPoller::HAS_ERROR )
++    {
++        // Check if we have any sockets to clean up and do it now, it should be
++        // safe.
++        for ( size_t n = 0; n < m_socketsToCleanUp.size(); ++n )
++        {
++            StopPolling(m_socketsToCleanUp[n]);
++        }
++
++        m_socketsToCleanUp.clear();
++    }
++}
++
+ void SourceSocketPoller::CleanUpSocketSource(wxEventLoopSource* source)
+ {
+     wxEventLoopSourceHandler* srcHandler = source->GetHandler();
+-- 
+2.50.0
+
diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.6.bb b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.6.bb
index 71e2a60e0c..1cf44bbfa3 100644
--- a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.6.bb
+++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.6.bb
@@ -26,6 +26,7 @@ SRC_URI = "gitsm://github.com/wxWidgets/wxWidgets.git;branch=3.2;protocol=https
            file://0005-wx-config-fix-libdir-for-multilib.patch \
            file://0006-Fix-locale-on-musl.patch \
            file://0007-Set-HAVE_LARGEFILE_SUPPORT-to-1-explicitly.patch \
+           file://CVE-2024-58249.patch \
            "
 SRCREV = "5ff25322553c1870cf20a2e1ba6f20ed50d9fe9a"
 S = "${WORKDIR}/git"
-- 
2.50.0


