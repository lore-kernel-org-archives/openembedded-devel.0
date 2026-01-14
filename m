Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DB4CD31A09
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 02:43:41 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2044.1768358612852767308
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Jan 2026 18:43:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=LhwKhI49;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5474b6bc00=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DMpSgJ518362
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 18:43:32 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=P7g+o9k2aZ77dP3UlGX26arKt3uoQRxLgMEkWhBeX1Q=; b=LhwKhI49iZbI
	7eZKzrSk4U6vfyJm1E7FQzbiAs1S2XoOgXqBB4qmqHY/bWz1BNuaB2ysG0IAeGSh
	bIN0X/hjZL2jxhnTTckhUQm/SCrLHwyMoIhHDomaNOtEn8R4Tvhrtrkpo7kuEwlz
	B7iN/2ymFWRtTUO/JF5+vkn+YEFfCysmu+gPagXwoUCH1W4tZ3xG6bAZvhJN9Nng
	+ltcaSONAMAa4Lqmf2QSdJ+QHNPTsGO2vj5KTXZ71lvgKiEn83odtWUomwCM6M6g
	KD7C4IpC9+K+pgrx/me63Te9mw+8Jixp0FKx19ZQ12sjJUGDpJ1NDgy5wetOqOqq
	EKwM4iywFQ==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012044.outbound.protection.outlook.com [52.101.53.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bkq5funt0-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 18:43:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X3evzIK4UCuPVCkv30AIhtZgBItFfEVH6VBmzRP2vFTIbquaMnvcd4NYCltPvjR0IsqD1JqFXpz5heu0863tMGZL+dU7NovOqtV9vanUwqj+rjlhjlP3+q/rsva9nKXUvNS067Wc9kLS5ZzrH6cQB9x9ywm119I/JsHr6Yc5RN3ieD0SJzxRrSxaNWIynx4n9a2ucsnDVg5A97Io8iw0LQbChicoSoKI3hiIwBZQJ2e3QEHd18q9x0jhtwX+S6u4EHswIEgosODLYRC/bwXUVkkFPO/7OBUNGlSWaqHt9zx0wnpibbnU2xl0HNQ5XPQ9ucSF+fSus7jK3bH2n5Zx8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P7g+o9k2aZ77dP3UlGX26arKt3uoQRxLgMEkWhBeX1Q=;
 b=bEecSKdkSSWl9yLJE6+ZjUPTgzL03/pQlnQqCaVuaLyEcv6mEjdhtWmpbCAJetbQJTUZ593S8SOZJAdhLTR7mw1D5vHnh5FiBJnnG0zxJDb9q3IIPsWbGsNHZ5q6z4j42/vd0SNIpF0k8MYFxgREacbPWQfeiKRAaSHWZkWrGzYa9kVD1T5hNZKSKdQkgNowPstzs9wKAqi5DHkZoPYGNZOu/hLJWdPU/ob/1BeCIxsmBdizmqsTeJ8s3AJBnmxHtqXwf/byO4hmOMqjTWDRbN+ng9MeDR22E3K2BQIyvIYd1cjOvJgelPbGSy5Zn9yR2v7K5I2ICFsZmSBVMxs2qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
 by LV3PR11MB8742.namprd11.prod.outlook.com (2603:10b6:408:212::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Wed, 14 Jan
 2026 02:43:30 +0000
Received: from CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::7b99:70e4:edb2:30c2]) by CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::7b99:70e4:edb2:30c2%6]) with mapi id 15.20.9499.005; Wed, 14 Jan 2026
 02:43:30 +0000
From: haixiao.yan.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][krikstone][PATCH 2/2 v2] python3-django: Fix missing JSONField in django.db.models
Date: Wed, 14 Jan 2026 10:43:12 +0800
Message-Id: <20260114024312.1180159-2-haixiao.yan.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260114024312.1180159-1-haixiao.yan.cn@windriver.com>
References: <20260114024312.1180159-1-haixiao.yan.cn@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0041.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::10)
 To CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB8189:EE_|LV3PR11MB8742:EE_
X-MS-Office365-Filtering-Correlation-Id: 9100f69e-0a7e-4fd6-1c3d-08de5316b38c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?4WEI4B+wOhYkuysmLAAAM7eC3HdikEsJe1oCWPMFdBmTM4vqwl7oZ4z3kQjO?=
 =?us-ascii?Q?5OcPz122d4bixs+KY0MyCruijNc1LhIQtLyXYdWRaibaKR6fTu1LJKEyP7yb?=
 =?us-ascii?Q?kJ1aXHPB+n93rfK0bx82b5UlrklOcAA18r/qlxfK7fHEEjnjGpgPT7T3DJ8P?=
 =?us-ascii?Q?uisOpqzBvZRWEOHk7gQLESuhIgQveMsZoHcbhnSmU9KOszv6zp5kj42JqHtq?=
 =?us-ascii?Q?TTpcXcRhNKdrgtCv2zU3QA2fZnfT7Sy+Xlmm38U55e1VuCILmJ14+Aw2Gl/U?=
 =?us-ascii?Q?pzdQy1/h7cP0eNQGvEtzHuxRczpIlyIV/LQRp6Nnn5FBYllKXZhYMBy294+T?=
 =?us-ascii?Q?A3bTftsn1NFkZftth+XFNzFmZTFs0R2VulhZFixg3QQtmS8vWY4b97VQx2hE?=
 =?us-ascii?Q?TjmLglO/qeiycPBa4lyV1XVcck6dcvip+Jju6Fbc7YFSz7CagqnM2eXB0wcu?=
 =?us-ascii?Q?JAGObaZzV2Qye+Ml/6skzLo/VLeiYum/+oUL0YIe/aPW6Npg6yrPnzn0TCnG?=
 =?us-ascii?Q?YXGM/GYUXZX6HhFr3pWhu71xdDFd7o2kZw0nGbwq8xHaqwzifh8JLL5hujo8?=
 =?us-ascii?Q?RI6sdDGAiLtYY8TpC6MFHiDfaEAQUEMIwSgXtrBdENCX5TVit7IVXsxpceCb?=
 =?us-ascii?Q?VdoVm1aunZfFKhMuNqDoWvASCAXmeGlw+KHdT4JV21R0yswKga/Wb1QJkzRy?=
 =?us-ascii?Q?OyRAy1ssqhQdukT7LQDMREKQmVWNhxTQVuI/nT5Y5QJLyDKhlxa5tfcaz4TZ?=
 =?us-ascii?Q?q4d3d3FNztnCHgEoAHjcKg7f1eMQMuS1AVKDrfuMFpPphIBLH8ZMnuZEFED6?=
 =?us-ascii?Q?rAiTQbtEa9wfo0kr2G0MffWMYj6C0IOe3TMnQT37KGHE7UNBhSGX0rNrw8IJ?=
 =?us-ascii?Q?E00eE6Og43WmUGKddY/6wirzoEElk2U0Tkxh47LJhYoQ/Uc9dK8KKvzSeOry?=
 =?us-ascii?Q?SM7Hoj1HQTXjGxTk6oK0+8k9m64NmLK6tOUb/loNaeUYeWZ3EGm+MJzLMiwj?=
 =?us-ascii?Q?rX+8uP+TQB8UPc+XLIrFyErqQEElCJj7k3XXxkUvN5sQddC/3H1EMnGOCLhr?=
 =?us-ascii?Q?a5Y2VrW1MlgooOsUUdo1Xq39VjOe/3vL1SrS18hFMr2oOhyu330q0AfdqnhL?=
 =?us-ascii?Q?bJa0S6eq1cMjL7e/oFn92ex+BMW6Kcosxo0vbzYIPK+2HRwtQlTPI1EE+8kT?=
 =?us-ascii?Q?0buEmeJepJsa//yWAQibqzUTVBtuIfJd+9yzqUL6oTdscBDci5c5deWArJ6q?=
 =?us-ascii?Q?wOwA9+V/AxyTjaQh9BD9w2Wvz32SARWcmuIZMYUi+SeLmZcLNU2xFRr23JLm?=
 =?us-ascii?Q?vK+DyphyuJ1VFoM/zv07A9GpVTvnP02idYf/dBDry76bbvaCA58MBsPxOdyQ?=
 =?us-ascii?Q?TlB0i37ocd1DQdk6eRDaDZ+x0OsGeMGjFVpmrT3Vku9Te5vFwi+7Hq+sJbSD?=
 =?us-ascii?Q?agbHkc2DHmlbx5IcQTNMEz5M/dtJNcwppVLJK+3FOMTQ34XF+RmiYzenVL7C?=
 =?us-ascii?Q?fR9FeoemGvGlN4OfRG1HjUBiVQwr+rur8GC+?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB8189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?huRs4amZVzCU/+jx/twedAXmhHU/nrxQ0UOFXgp1kF2Ci8lO8bnXMDJsJfRR?=
 =?us-ascii?Q?eQEMw8uZ6cw+nKTQGHXOIC1VROveek9kNJTHykvlWX7VvSNJa7D/CKyq2PGZ?=
 =?us-ascii?Q?5HxHm6WxN7T7DyiMBmcgR+MPXA1E7aaWdWDpsvm/mG4tJ13BEq9axVYToH+Z?=
 =?us-ascii?Q?f6dBIqm4IfB7CJ/hNzbrGTUkqWtM9QtDgVHzSxYx6YRDAfDNG2ONNY+7htCe?=
 =?us-ascii?Q?u9CmomUbBOBXlDNfrDfA19+2lHVbYVJzkqQrGrvlPtKqH9dMz3LPL2KhtMoc?=
 =?us-ascii?Q?OM/4HwtWnKhT7obr4EWkoHyubIJhJs9q8iOLABxqmrJYCZZTZ5oWlhUm6nU4?=
 =?us-ascii?Q?p6ZeFHQiAXn1k/qWYFFD+9NrYKOamHgoVNVDRUAGtOGqc9Ic+iEb55aaMJR/?=
 =?us-ascii?Q?qq9N22+v6kpRjmHUJjuTqefLNU324kjLiZk6qmC99NVaXZqv4qdSGUzxlfsw?=
 =?us-ascii?Q?859yE6ED0+g1zy+5+yQpk74pTXVKh/jrZorNam/yiS+AIBoMLfdXO0Ya09oq?=
 =?us-ascii?Q?CaOa+wMZ+9Gxu5489pV1xzPsyDbvg3BY50t/PwCa/KhGrkBNyO8/c9RO2B9U?=
 =?us-ascii?Q?Fr2HZseK720UXEf8nOeOvHWcPFtt/E8PFLdF7oa8+Bgo2xG1/X5oC5OAMjnU?=
 =?us-ascii?Q?MkiU3SorkfoctfS0/WXAjNg0gwuofoi6hB4EBs7md8UJKKN2vWty4EJ4dTYj?=
 =?us-ascii?Q?HZ+A3DUA+ihduP8B9oxeXUiNWL4uvWzfmMO5jIOHLyzrHXhcrSr8M4nOpGKi?=
 =?us-ascii?Q?i+RIymfoetoqp6SEV/nJd7Q0avklwo26nnax5ULOcxqGvtQS1gsa146pe8IO?=
 =?us-ascii?Q?EOsWNfkMzCWZ7GZw4VU3Lh0z4gcYYV5gAv09MGERAt4svgrx4TGBQO8oRf8A?=
 =?us-ascii?Q?oUMACoEYsvzlSmWusJSrBYcmNP40QmEQMmCuQwuXHdVUVt2+PrFLxupmbNIg?=
 =?us-ascii?Q?45XkUfmQwTmux1kl+8rKzI2gQJOsaSfCo9kVLxlJOXuNMs1PfqU658XRyILy?=
 =?us-ascii?Q?03JRqc3P1TqpXXgi4IRI8hT1PnmMBarCb454o2K2a570JO9Pubbh3hwz/oqg?=
 =?us-ascii?Q?nfiQBtjc3iO4Na5ekbj9F4kddWNXBKKavC+nfSsi55bjnDUQYq4KPqjKnuLo?=
 =?us-ascii?Q?sU11ZMevW97mXpw9TQCj8EhfI14EQx+mgThc1NSgUTuEbSujtK4egmymzQS6?=
 =?us-ascii?Q?THMVZ6k83On+mNK2uSGH1F3Qpplm785DKSE9fuYgdi0UzT6vlWh52sP8Zh4v?=
 =?us-ascii?Q?CwVpJmjuoiPhXD/h6WlQmrTr7fW/2OqQIlvf1nPZezy3pc1vMFaeE0SrPAVg?=
 =?us-ascii?Q?7amedlOqvyaFPT2iz1qdtICcqM05tFJe+sSRj05GqElX86lCx/uaR2KpTzZj?=
 =?us-ascii?Q?dbMAW8WrJGsLsNehxIGnwaSxAambG0Pq2KpqCAKdQlilWkkg5+DL3l30Ex/W?=
 =?us-ascii?Q?Wrij7jEQAg4Yz1Fh5wg1VnZ09FjgQdb+UmgXe67hNE7en4Vx3m4a9eYnnuXI?=
 =?us-ascii?Q?xSZgOit0A5Yz34JmyDorpEsy0QkGvWnoE5GlbJDOkn9YJnXHuRCy7MxJKwIz?=
 =?us-ascii?Q?WTtkeL7A0bNl9vQ3z3WhmkcPY20rSjn2Ok1HX+fILY3xsD77/notTl1EkFvA?=
 =?us-ascii?Q?NHOoD+wum55nURWlTyICa2i0qQcu8ZLoduL3xhUC8oqoOo6XOEvnlKly4HFP?=
 =?us-ascii?Q?/QBMzhDVbxOIIx4h8k1oYfkw/aZ09U6cE55rgZiuNkvU0gQe6HmadgP9Zeu5?=
 =?us-ascii?Q?daJOi3D68vQNzMJE2bBVMGjwIMeO/WE=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9100f69e-0a7e-4fd6-1c3d-08de5316b38c
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB8189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 02:43:30.2437
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6yrg/Hh+6UUJazaIuA5WXR6x8hhFLjeGHna9VfqhQxnxLiDr5jtet/1x2xUQKI/AzxnbYOlLbWFoYKgBRwcaSQcJcsNLVceF0ERYCbkBeYU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8742
X-Authority-Analysis: v=2.4 cv=d/z4CBjE c=1 sm=1 tr=0 ts=696702d4 cx=c_pps
 a=j0PM1b0aAxJgDjDzr34Dzg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=vh6ZLsrIWgAaeWovB90A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDAxOSBTYWx0ZWRfXz9GtFhKa244I
 kMdDTSbzco3MUUucUHeV2/BOEk7ZygUKSzmhgzcvF6msqq+hq06K1BY/zGb73mGS9H5atpGIgQf
 G6XTB/HUBIMr8sdsS7d7q2r0N4O8484xWFVePnK+v+TYS6GfKqo/vc2sHSgzpAhEQg8kYf+SUnP
 R2ecGgdEUmy/+ESU4NKAH/mptNAtVR0/bdmC7+AF0KFbI5Q4nLRFZz/fdrNqOtgNBEldwZBFvcu
 QBMLfsCicmjYnMXAfVISCLUSjfWJ9r+YioE79LhkYXMz5qGho/U31GOTn6YIlxwcebJnCXX18lp
 jY4LO1rNjjiUJYKZTdDmrhQvCUe6MeDSPifk+E1vjdlWkDG1ghB3Y09cvFoPreC10QNVWvviiHx
 ydf1/s20ySRq5iuad+zvXlqNvfKdKoduQk3fSfHz0PKZ7On+WaqFxbozQgkcQpevNUQMGwZ+/IR
 m/vaxrTQdqkU63UkAaQ==
X-Proofpoint-ORIG-GUID: DbJ50Sstgs5_szzZYwgN9CaXeifgZvoe
X-Proofpoint-GUID: DbJ50Sstgs5_szzZYwgN9CaXeifgZvoe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140019
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Jan 2026 02:43:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123444

From: Haixiao Yan <haixiao.yan.cn@windriver.com>

Fix the following error introduced by CVE-2024-42005.patch:

AttributeError: module 'django.db.models' has no attribute 'JSONField'

The patch assumes JSONField is available from django.db.models, which
is not the case for this Django version.

Revert the changes in the following files to restore compatibility:
tests/expressions/models.py
tests/expressions/test_queryset_values.py

Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
---
v2: update patch Upstream-Status

 ...ix-missing-JSONField-in-django.db.mo.patch | 77 +++++++++++++++++++
 .../python/python3-django_2.2.28.bb           |  1 +
 2 files changed, 78 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-django/Fix-missing-JSONField-in-django.db.mo.patch

diff --git a/meta-python/recipes-devtools/python/python3-django/Fix-missing-JSONField-in-django.db.mo.patch b/meta-python/recipes-devtools/python/python3-django/Fix-missing-JSONField-in-django.db.mo.patch
new file mode 100644
index 000000000000..95a31305a40b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django/Fix-missing-JSONField-in-django.db.mo.patch
@@ -0,0 +1,77 @@
+From c019f2cb6fbe266e09c71cd890a22cbce3769b05 Mon Sep 17 00:00:00 2001
+From: Haixiao Yan <haixiao.yan.cn@windriver.com>
+Date: Tue, 13 Jan 2026 14:44:32 +0800
+Subject: [PATCH] python3-django: Fix missing JSONField in django.db.models
+
+Fix the following error introduced by CVE-2024-42005.patch:
+
+AttributeError: module 'django.db.models' has no attribute 'JSONField'
+
+The patch assumes JSONField is available from django.db.models, which
+is not the case for this Django version.
+
+Revert the changes in the following files to restore compatibility:
+tests/expressions/models.py
+tests/expressions/test_queryset_values.py
+
+Upstream-Status: Inappropriate [Fix the regression in the previous fix for CVE-2024-42005]
+
+Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
+---
+ tests/expressions/models.py               |  7 -------
+ tests/expressions/test_queryset_values.py | 17 ++---------------
+ 2 files changed, 2 insertions(+), 22 deletions(-)
+
+diff --git a/tests/expressions/models.py b/tests/expressions/models.py
+index fb8093849cba..33f7850ac16e 100644
+--- a/tests/expressions/models.py
++++ b/tests/expressions/models.py
+@@ -97,10 +97,3 @@ class UUID(models.Model):
+ 
+     def __str__(self):
+         return "%s" % self.uuid
+-
+-
+-class JSONFieldModel(models.Model):
+-    data = models.JSONField(null=True)
+-
+-    class Meta:
+-        required_db_features = {"supports_json_field"}
+diff --git a/tests/expressions/test_queryset_values.py b/tests/expressions/test_queryset_values.py
+index bd52b8efc194..0804531869d9 100644
+--- a/tests/expressions/test_queryset_values.py
++++ b/tests/expressions/test_queryset_values.py
+@@ -1,8 +1,8 @@
+ from django.db.models.aggregates import Sum
+ from django.db.models.expressions import F
+-from django.test import TestCase, skipUnlessDBFeature
++from django.test import TestCase
+ 
+-from .models import Company, Employee, JSONFieldModel
++from .models import Company, Employee
+ 
+ 
+ class ValuesExpressionsTests(TestCase):
+@@ -36,19 +36,6 @@ class ValuesExpressionsTests(TestCase):
+         with self.assertRaisesMessage(ValueError, msg):
+             Company.objects.values(**{crafted_alias: F("ceo__salary")})
+ 
+-    @skipUnlessDBFeature("supports_json_field")
+-    def test_values_expression_alias_sql_injection_json_field(self):
+-        crafted_alias = """injected_name" from "expressions_company"; --"""
+-        msg = (
+-            "Column aliases cannot contain whitespace characters, quotation marks, "
+-            "semicolons, or SQL comments."
+-        )
+-        with self.assertRaisesMessage(ValueError, msg):
+-            JSONFieldModel.objects.values(f"data__{crafted_alias}")
+-
+-        with self.assertRaisesMessage(ValueError, msg):
+-            JSONFieldModel.objects.values_list(f"data__{crafted_alias}")
+-
+     def test_values_expression_group_by(self):
+         # values() applies annotate() first, so values selected are grouped by
+         # id, not firstname.
+-- 
+2.34.1
+
diff --git a/meta-python/recipes-devtools/python/python3-django_2.2.28.bb b/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
index f2bb1de4f247..8e826b9b619b 100644
--- a/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
+++ b/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
@@ -33,6 +33,7 @@ SRC_URI += "file://CVE-2023-31047.patch \
             file://CVE-2025-32873.patch \
             file://CVE-2025-64459.patch \
             file://Fix-undefined-_lazy_re_compile.patch \
+            file://Fix-missing-JSONField-in-django.db.mo.patch \
            "
 
 SRC_URI[sha256sum] = "0200b657afbf1bc08003845ddda053c7641b9b24951e52acd51f6abda33a7413"
-- 
2.34.1


