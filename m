Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7EF5CA100B
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 07:44:56 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.71720.1756799091488932780
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Sep 2025 00:44:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=fctvD8v9;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=134031fe91=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5824bFs41268186
	for <openembedded-devel@lists.openembedded.org>; Tue, 2 Sep 2025 07:44:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=Y8/wZbCHmpxOG2JlbWJlk/2Zl+ZLwo+nZFosGHL55hU=; b=fctvD8v9Ch1k
	65v+BHtk832oT30jtohpZlC2m4UL9ToP3rB2CjovUlZQpXPXE2BT/Q364+2DAL5i
	KnwxR8WNJF8gfpiCp3YTnk6eLHaALEhxAjECnCSpI1MQzK/Pn4Lt0aSYLi0g0rLs
	y0r9gMMEf0pFWVCMcxTZHJDW2E7/oQE/3ZCQ6RbElgxpLNzQmZndOv6iIvbJ/JzN
	nzEshPOyRzuxLYSjDWkpUl8QKbsKIZXilVo3CvgjQhBIidrC13vED8/22KZmMMM7
	SosVpRnj9nzg2HnYJLhaBUPHYNaFpRmAx7Mu2KfhONZ+Tm0nks2MWJGae+XUaMJn
	ie+QTZEPZA==
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02on2081.outbound.protection.outlook.com [40.107.212.81])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48upgyjdsk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 02 Sep 2025 07:44:50 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A1cTXs/+Z9lHDYS1D6oaL21mY19MY11sfoK8fZqhQ5j3FiCwwgr1F5OXUTz/E83dc+RCIlNRKyWlSiZjf4FsM5h3rTFRtF8FMyw6QY1MjwjDi3Itc7oSUGhApTHSs0pcK1tENFIbDZYR9lbPPozvWAScAP5+S8yIOa6J9QbnK7Jy8pvG30ihlFwBDEEVDLLq7UTe8ARIus6XpMpodlTMhieKnVgA8pX/Xe8aSKAvLfa/4iiZQDDx8st0oMvYP8U0u2mM5sFxb6DHkD8tncAR/BoxOgNly9/SsAVFLa8kn+tHyPpFJv4Ouc/eHAG9PUt63rKvo3irkvNDev5rzk5gyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y8/wZbCHmpxOG2JlbWJlk/2Zl+ZLwo+nZFosGHL55hU=;
 b=gdi4rIvODxE2Tg+lMjfHcv/qi4bwrOE5qTd1+Zp3jNXgi+77ey7cmxXtDpjyvvB7i0VL1eW18Y7up9LuK9TCtAM0MWgEWq2DiBZnT1km6775d2kFsCKeuSvKAFo7lSh2CQc7QeWaev5NStR04MbXZXNweHpZAADTWQJK0d4XYySkWL7S4wRjkYlR82p6iiTsrqOCWGoViyIYRSys4a9oVbPcnYg5ZOHZ7dLEHRfSZ+Au/N4asIeS1FW/S561Mo7ihSyS/VNZuqXhuHdQHH6Ko2m1rspJ91ZAurMTsC/jVF1wuchpMo1Yob6B5U3dAEWPkmRalFIpcwhJC42tCHMeAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Tue, 2 Sep
 2025 07:44:48 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f%4]) with mapi id 15.20.9073.026; Tue, 2 Sep 2025
 07:44:48 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 3/7] gnuplot: fix CVE-2025-31177
Date: Tue,  2 Sep 2025 15:44:28 +0800
Message-ID: <20250902074432.1068537-3-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250902074432.1068537-1-peng.zhang1.cn@windriver.com>
References: <20250902074432.1068537-1-peng.zhang1.cn@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::9) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_
X-MS-Office365-Filtering-Correlation-Id: 23f048de-365d-41b5-76c1-08dde9f497d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Ado1J+KP+h/x0zZHUhH23YzOBfety0n6P3UdPc1awSU5UfVhino4IBGERcwx?=
 =?us-ascii?Q?AHIUlBXXqk0eL3b1J+cCWg8BrcXZg6zMCb673C171/8ARJNXWLytI9poLmFw?=
 =?us-ascii?Q?BjvQA0XnGzQcUuUUbI65C2P6kxhz0uVe0cV73IvffAZa2LG/xL9soVW2L5nl?=
 =?us-ascii?Q?UcrtE5LDDb/jPKJcKGSxYxCXvnH5pCwqYlZjI10emVzzRIgTHVHtb+9q88Z0?=
 =?us-ascii?Q?XDTz7on/GFmSXSWGtOvitEwo1TUUNEQFZAe0HMVKrZrXZKaZqt+KYQoHAvLV?=
 =?us-ascii?Q?+yGclOivc68MEhcr9a1wuknZ0/tf0IBWcJ05lezWPT0ZPDUgTmRxA0QM4nqf?=
 =?us-ascii?Q?r4HCrELg4fA5IuLhTYkM8AWnwXLSQjyb7/lWAbqI63BThHwnNRELm1TgSYiS?=
 =?us-ascii?Q?GOnZFxwfE79AupVe1DZW6j4pX49Yu94Yb8qN0IMtbLYz5q6rvRoO8DMSu5mg?=
 =?us-ascii?Q?gswLkJepQRh4CLvWX1MLtx++JhesXoLBth8dL+SD5g1AmzJvPgUWUo1ZH9jU?=
 =?us-ascii?Q?cI1wMy2Mdt/kQDJmo4pth+zAnDaTGirOidG+0CIT2bfGafHDK4rB8YABqUHQ?=
 =?us-ascii?Q?cgCyseD1Yy78VFxVYcZ5Bbwe8VW0kRTre2eBueecrsOfjhneS95nbnDRYkcy?=
 =?us-ascii?Q?THFEO6Py6AinTmyajZgJPEdF1QIyhDmyF4KV+ai646dOjGg/VzuGezXn7CyA?=
 =?us-ascii?Q?xvrwExciQV3mw3ApgaDMOA7HCOooFypdNz8YVvzMbXN4InxVAHM18KYSwPTf?=
 =?us-ascii?Q?qKMvv3gTyN7Omuzb6x9M31s3pw7/LBYm7L8NhGbWqgLVxxOAe4vxJ8DSrSrR?=
 =?us-ascii?Q?ez8PsXKydSy9v3itUyMTqJCDflPryMBF/3j7J9yP1NwuGu0qxCF09+KIqfNu?=
 =?us-ascii?Q?vtDogwGsj3Vh0RZIFgtkK4V4Pv3O8LhEMPPa8WtW7lOR4bZYpFEoIlS1XAGG?=
 =?us-ascii?Q?dEydq+CZUmUpKFJBB1OcHWf7rD3GJWor/+MTb4hUSkXkso0Aq/CMAjeYyVKy?=
 =?us-ascii?Q?w3nHyCZU7iwXM0BEYV+NA07VTjPBddhqzVsFhkRLzYpGV9FNUfTN+3HpFLvL?=
 =?us-ascii?Q?5sd5h8aB5eBp+T3fL6tMwcvnKnxJfXyWGdgB0/RHYDHNfl4td4zmu53kBquN?=
 =?us-ascii?Q?IWYhe8Q1vXt1Uh85/46O6HJZThhxAWvG9DCmJ/V6/hjrZdkbTqjovE3o/168?=
 =?us-ascii?Q?BmkrUs+ThQPlzQ82K1M1rEoGlf2GkB7pC0GpN7Va++SieYVyMqty6jASqLca?=
 =?us-ascii?Q?XgE+xcnMnOvPZ6bLydOhFjVAvYlGvOvuODnT/DxZu75dHu4cwxQa9aL7aTIc?=
 =?us-ascii?Q?s5ZFp7sotanYC2IsMgexIMUWHYpSLDmvdfNZQC3Z07AqjwM7IJqUuCLCsabf?=
 =?us-ascii?Q?BnIIm2aft01tU9LEj/oYOECSXdyvHpfIKAUx9tFXpFjAc7sSwkiV9d89w91u?=
 =?us-ascii?Q?aYvhz7CGQmEK0KoMF55kI4B/gs9O5a1W?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?jvP5ID0g66LFSVy5vr53TzV4AiVxEHGB2SOOpQrp4tT04QYZ6yt8NMBXccre?=
 =?us-ascii?Q?bQk851wYsRfA95aM756pUrWswtE0eKBma68Uoyz19eHeVsn8vdccF4JUwObg?=
 =?us-ascii?Q?om+eyEAT8y73YUjnREROgKQpkQGjrWQZFZLFioeSfOVZOYL8t/XdeTneXZmD?=
 =?us-ascii?Q?QC8sLcodJ4gNZnE9tJ6OHtdAGsZ5Tc5qtYYyHu2zLqaOgXWXqNY6Gyp6ksWJ?=
 =?us-ascii?Q?KsWYF0Gy9PfmR5APkrQopuOfpbx1plElbmyHMTHaI4U0Y02+Ub6bEx992EM2?=
 =?us-ascii?Q?AMyJz95um6AWfO0ichxubLmCfwg18T0HyjcLgOaNtwNN1dHElSEmO6ZctaZe?=
 =?us-ascii?Q?tjTDKLd+J40uuT19WKxo0udBTKLkZT+nMsSP4VQhgNc2BYC9Ge9v/PP7RqWg?=
 =?us-ascii?Q?23jMghnJ0GoIwF2q+bvRbg05c8m2EEmNM+HVwyBSYxgbw05n3dUlXLJnOVMY?=
 =?us-ascii?Q?TxRc5sEBtg0+g6j4PfNrf7R/BmXjRKz+LHTjhr6KxO/60IQCZN8CQrfW8xcw?=
 =?us-ascii?Q?YJ66dPPeYleNRToJfFUIl5W0GB6X+4ZeVir+sceUySk2jOvOXyFgzSZmufR5?=
 =?us-ascii?Q?0b5ESqjVQifTfs+wxybWS0fjG6D1b41wyk+/WTFJNNMuEmfLYs0vK4qZDOuN?=
 =?us-ascii?Q?VRw1ws4MVs5ZxmQSc1R4H1o+Ozn+ONNID90fxfw9W3WqcCOXGAeJqn7LQHqm?=
 =?us-ascii?Q?YM9pqRP5R20gFzOjRUAw4IjiGvr331HmgGycIyPr4l50J8udR+AsRVdXYCYM?=
 =?us-ascii?Q?O6FS5nCPgRmBFEvVRur1Vh209ijnAaJN61453UkkzXOO2yi8I7jYZbGhdmPK?=
 =?us-ascii?Q?VTvYestv1Cf1WJv8btvb0a9LOAqQW4GkpqX/SdWkI/2jwIRQ41M2Z7wwzh8k?=
 =?us-ascii?Q?NrNrcrg/DUSIoc59UXw3eJ5FHQKOmWgNaZVPxWYjy1OCCTdKzQr1NvhhXgkF?=
 =?us-ascii?Q?UikvV/EPf6BiWN+x4AVSEOePMXpyOWKBDamNsiRFn0mgyg5deX7KuHOfcqEe?=
 =?us-ascii?Q?wA6GzIP2foNDgFdxAC8vNKwQKUqMffM174NGbS72HaB/G2VqeDTH+HzAGakA?=
 =?us-ascii?Q?cQ8jlPSS8hh3EYruTXOqvGbNeQ4vO1fZEIe+PGL+bYuYJ6cwJQTW8bm/yz36?=
 =?us-ascii?Q?a3WBGglWm9XlwudcJBnFeYyolI1+91gGs0LYpCTUS4Yk1ieTV1c7d8dZDRBw?=
 =?us-ascii?Q?DN6NSzrYwLEzFt0AxL2U8zrjznNZV6P29SgrZt8+WBOFQSYpKrJatheTHWs5?=
 =?us-ascii?Q?MGDpFS+K03THO5r79B5RRadtSe5aOsJNPrELDN3L9HgIU+5LXZP5lkXgWzeR?=
 =?us-ascii?Q?XI4GXYUGsRsjUKkhvF0Vtqkl177e7MDD5eFX8sDoC8bWu6HMmfqlkFYyRHFY?=
 =?us-ascii?Q?HvbJegm50W8V64Y1VQVJqq4oY96/i2Q5QxwftH4BcM4FXHW4gc3WTDS2tZ/+?=
 =?us-ascii?Q?/kx/AzDXF66w2W/aMfTU70zrS+U1R9wCUjfA0lRje+LQgBnKoLs4XfZlyBfz?=
 =?us-ascii?Q?nr5zcw5iTse/GUKJ8r9DUmRTStYmzz9A1AGBJOHln6gqr7sv3MvwO0TFe+aO?=
 =?us-ascii?Q?S/ICCgBgUYHPsUwaPRbcaF8puY4TzR4nORSU4hvl7S3qxm+WnHke36rjAnCE?=
 =?us-ascii?Q?gQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23f048de-365d-41b5-76c1-08dde9f497d5
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 07:44:48.8376
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bdc9dfUr+xGGEehzqo5KbBG3BFDMK5hdqH33l7+qZ2JjeutKWWtWh6x3zoMF1cjLJ73TJdGyJFf5A1Gogwe3XyipQcZEFKvZCx/QyHNo6u4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8562
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAyMDA3NiBTYWx0ZWRfX2iT71KHIK57P
 BYQIxrfjn2TQZsx6lkbCGuIvkZ6gOLWKENnvhmul5S6EAeYBe1oYREQfX9Bsjmkbr0a/xP6bzG+
 9DOiVyFnpeXnhpWH8rx7hiq6jGo8aOZ74T/GfhK4OgEtaGrFZ+qLzR1cjH8dKkURnLygEzKFkaI
 r1fWY/GNxR7xBm5s64fpnCEityADyF+eIwIU/X1OeH9b2jjEPn0Tz6J0bTiNskHM2VfMYxx517j
 +QjrYWkZOLDMJJMAYc1XP7DLy5NsP32uN+8tQmh/igj2ZTphfxitgdDeW3toPs3in7mVLJph1sd
 mwrZklW5fIxwswo8lCQjgS87oiQkxlTQWItSWY0kcOY2nhL93o3j7b9eMk74uE=
X-Authority-Analysis: v=2.4 cv=eubfzppX c=1 sm=1 tr=0 ts=68b6a072 cx=c_pps
 a=cgbmBu2E7d3MJV5ACatOOQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10 a=PYnjg3YJAAAA:8 a=FP58Ms26AAAA:8
 a=t7CeM3EgAAAA:8 a=NUDn1NH1TUvyvbo-074A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: r5NiReLs4Hs0qMwnq3sGflFxUrS9OkP0
X-Proofpoint-ORIG-GUID: r5NiReLs4Hs0qMwnq3sGflFxUrS9OkP0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_02,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Sep 2025 07:44:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119171

From: Zhang Peng <peng.zhang1.cn@windriver.com>

CVE-2025-31177:
gnuplot is affected by a heap buffer overflow at function utf8_copy_one.

Reference:
[https://nvd.nist.gov/vuln/detail/CVE-2025-31177]

Upstream patches:
[https://sourceforge.net/p/gnuplot/gnuplot-main/ci/226809aebb345e74d371bb43a2b434b490be527a/]

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 .../gnuplot/gnuplot/CVE-2025-31177.patch      | 40 +++++++++++++++++++
 .../recipes-extended/gnuplot/gnuplot_5.4.3.bb |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta-oe/recipes-extended/gnuplot/gnuplot/CVE-2025-31177.patch

diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot/CVE-2025-31177.patch b/meta-oe/recipes-extended/gnuplot/gnuplot/CVE-2025-31177.patch
new file mode 100644
index 0000000000..dcacf538b2
--- /dev/null
+++ b/meta-oe/recipes-extended/gnuplot/gnuplot/CVE-2025-31177.patch
@@ -0,0 +1,40 @@
+From 36a4355010a81a78cf9df03d3c76dcd599ed994b Mon Sep 17 00:00:00 2001
+From: Ethan A Merritt <merritt@u.washington.edu>
+Date: Wed, 15 Jan 2025 11:56:13 -0800
+Subject: [PATCH] dumb:  more stringent tests against y bound of dumb terminal
+ charcell array
+
+Bug 2756
+
+CVE: CVE-2025-31177
+Upstream-Status: Backport [https://sourceforge.net/p/gnuplot/gnuplot-main/ci/226809aebb345e74d371bb43a2b434b490be527a/]
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ term/dumb.trm | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/term/dumb.trm b/term/dumb.trm
+index c93afb94e..bb22ca25f 100644
+--- a/term/dumb.trm
++++ b/term/dumb.trm
+@@ -637,7 +637,7 @@ DUMB_put_text(unsigned int x, unsigned int y, const char *str)
+ {
+     int i, length;
+ 
+-    if (y > dumb_ymax)
++    if (y < 0 || y > dumb_ymax)
+ 	return;
+ 
+     length = gp_strlen(str);
+@@ -784,7 +784,7 @@ ENHdumb_FLUSH()
+ 	y += i;
+ 
+ 	/* print the string fragment, perhaps invisibly */
+-	if (ENHdumb_show && y < dumb_ymax) {
++	if (ENHdumb_show && (0 <= y && y < dumb_ymax)) {
+ #ifdef DUMB_UTF8
+ 	    for (i = 0; i < len && x < dumb_xmax; i++, x++) {
+ 		utf8_copy_one( (char *)(&DUMB_PIXEL(x, y)), gp_strchrn(str,i));
+-- 
+2.43.0
+
diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot_5.4.3.bb b/meta-oe/recipes-extended/gnuplot/gnuplot_5.4.3.bb
index 18722b3641..18f98aa503 100644
--- a/meta-oe/recipes-extended/gnuplot/gnuplot_5.4.3.bb
+++ b/meta-oe/recipes-extended/gnuplot/gnuplot_5.4.3.bb
@@ -17,6 +17,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}/${PV}/${BP}.tar.gz;name=a
            file://gnuplot.png \
            file://CVE-2025-3359.patch \
            file://CVE-2025-31176.patch \
+           file://CVE-2025-31177.patch \
            "
 SRC_URI:append:class-target = " \
     file://0002-do-not-build-demos.patch \
-- 
2.50.0


