Return-Path: <Poornima.Lokesh@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EE64CA6012
	for <webhook@archiver.kernel.org>; Fri,  9 Oct 2026 10:06:56 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4479.1791540412459634552
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Oct 2026 03:06:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=fX/zrFJq;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4742854fca=poornima.lokesh@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6998HQVT3400541
	for <openembedded-devel@lists.openembedded.org>; Fri, 9 Oct 2026 03:06:52 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=dDP+ZxU4inky7JhlJEih
	SJZBSlGXCFq+hz0YwJ3eHvw=; b=fX/zrFJqnBatfmn1KShpz1DSeiCpNno48vH/
	CQEEhBcIxUm5Oer83Z93N/1U9O8jrr1ZhMTMjAn3RjwcP2SiNxudncNKkihNjGl+
	8Dx9pvvY4MYLMAE9CJAdYJnANtoCj1hDzB51rqEUMV7ktvuoYtm3egAtlmgoaOxH
	k9JGncSCdKFOHdrU+seFWcd5myJBhMJoFLZ0gK4xSnVgDALoaXyJsqTSb6h48dX0
	v/oVHF98UePw8AiaS5+FWiilskclsnvq3kdfciLKRF1V3HWYXTWR9yliA6fTTofl
	ltE41qCWzOX85OW/sZUONxJ8W/Fk/cezZPN3K9XrhksPXqbFKQ==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11023072.outbound.protection.outlook.com [40.93.196.72])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4h5xevj8vt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 09 Oct 2026 03:06:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MHqz/+guKwlN/dE4Ls6mdHcKHHgZ18tqDG5MP74f13DK3TUP8jURLyRSmJ3fjHIPTmC+0WWWw1Dnw2lI97P0hwTkWNZd1NIYIcnlC/N0Ik5BEYRiolk+iVYGIQpwNPV6WGhqYJ1ODOMsUFelUCUGBG9ESaNzBxv1Fy6LangAVvrJGngWu/MzF3GaDWH5xqVyV/2mwRfILRq4z9aJD4aYh4IrJy7pGvSBbvqFlcMgyB6QTXsY0D6pHeM6UrdbrJeghnCN8dOSxrJ10ghm5JRNg3BZlyaRWPbgPJ9uk4KTAjbvHeY4KawhT2I/l8hKMmplCYNr6a33TTH3QDVEgzFybg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dDP+ZxU4inky7JhlJEihSJZBSlGXCFq+hz0YwJ3eHvw=;
 b=lBSKU8JKMh4JZX/QDPso0CCBIkA4XqTtHbUiAa+jH7vPRvLIvKWcToxqQh6d2VYCy485oZmcK8maoMpWvjTqfhOIhoneFBZXj8aOP99L4msgNVE6MJvHBkwLwylXr4bcwb8nILR+mku7UFn3R4PVbmxQQ988XlY1YnvOMAbUIxubgke1LVx5KCXhk8dmqkh7EqGcX04sG24zkqnxww6sNORJNWt/kQe4AQcDwxyDINRHcjzNYR0dJC6tbs610i2WMgVajuMpXz3J5SWCd1ax3+upzwDqvuUtnytBlP4lQnjF3NyirEDke/TH4cm4GKvwz1c9k1Bs2V3A4fIkbVxTOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from DM3PPFCA3BFC2BF.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f4c) by SJ2PR11MB8471.namprd11.prod.outlook.com
 (2603:10b6:a03:578::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Fri, 9 Oct
 2026 10:06:35 +0000
Received: from DM3PPFCA3BFC2BF.namprd11.prod.outlook.com
 ([fe80::8a71:6d5:1f9e:f8ac]) by DM3PPFCA3BFC2BF.namprd11.prod.outlook.com
 ([fe80::8a71:6d5:1f9e:f8ac%7]) with mapi id 15.21.0496.015; Fri, 9 Oct 2026
 10:06:34 +0000
From: Poornima Lokesh <Poornima.Lokesh@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][wrynose][PATCH] rabbitmq-c: fix CVE-2026-44235
Date: Fri,  9 Oct 2026 15:35:52 +0530
Message-Id: <20261009100552.2096839-1-Poornima.Lokesh@windriver.com>
X-Mailer: git-send-email 2.35.5
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0036.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::11) To DM3PPFCA3BFC2BF.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f4c)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PPFCA3BFC2BF:EE_|SJ2PR11MB8471:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cf64403-d1f7-42cd-8832-08df25ecfffa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|52116014|1800799024|366016|18002099003|13003099007|38350700014|11063799006|6133799003|3023799007|260925021311599003|10067099003|260925022911599003|260925021911599003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	aQsP6KRaVvKCgGQf0Nmhgh9oVj/WSM4FJl4coUbkKiQq/xo+g+dvD8dh4JxmC8IYs2TfsPVuoc02GAyvS+hV8i//mTU7GMpiic6TeY3AW0mXlGic8mSxz2a4Iz38Fua4SiKGZS2K5SzxsAUOTBHAxLLuerOXxU1OZzwxdGPKzeYnIZORkEDuhfGkOPpywC9Pvh2QqmSkpaiQgoDzapmYXL7Ftzjg4Rf2WKKkCpuEh/OGilnOm3VjwM+09L4ecdzxV3XEVyxSFcQW92lyTiChvzoV/AufNMfpF0l6Yh+s4Vv/701Yy9Qd4isMjY4n7mY0OngqN0gFqaTT1k5Urj+/Z1UkoUr6iYrPXPLws/R/Net9wpf8lAoS1vbVSShwPFVPSDGnL6Dn6lapvZ1wrg0QJmVS+WNNAg0HHOSrwlexvxvox1GVXboKGRJ6ekaIPAGKSwXaRRLiZ/yAHGa5tVBcmtIDg53fE7g6Qtb5/KkqVHmVmZiYAl2sYS9plUb8CVz+EsBoBRRCGFFehDLJWoPqE++xkq+1COf2va/ldw7Xc/IdzVddc/iieAFHhAwv4REJdR8PeRlYMEW2NvCTC2WrXLpN98FXzUuptBDnA1FrC8WRmquC3yCqdLU/nQIRE5ulZawN3j4tL9DCaVzoSgIzmNVR9ycSPNh8naGIRnIHWYF97m/9vAKO1jpCoRGRw9V1AzCWPJ9v+uC6vqUEuqApZ1FM73ImgsQ01zVWTMDg0So=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PPFCA3BFC2BF.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(52116014)(1800799024)(366016)(18002099003)(13003099007)(38350700014)(11063799006)(6133799003)(3023799007)(260925021311599003)(10067099003)(260925022911599003)(260925021911599003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?UyMUqvidAchQdVzGQRIsDQ0P7fkqKiScYkZis6MHmyoqkrSzxHlPTCh6haqQ?=
 =?us-ascii?Q?Et1SUf+2V9z1zkUMCLXwYPGlaKfX8wQzCU2rkcB3N1e6ib0cWXiqgqotjuu6?=
 =?us-ascii?Q?WjOfAP5dof1Uq4UmLvjoek256yZq4GcIkjC00N2WW4Kivci+KrMq0L7E8qKa?=
 =?us-ascii?Q?j/1orIBCN3PeBcxRkAiVWFQ0urIBxV7wIgrNWaNpqOM/U0hDPw7Sst1bjjEg?=
 =?us-ascii?Q?YcdXic04fGzMYi/7wXsZ8GiJnLcj1hkGCMHdwkgqY9XdzEY5qTgs3DBtEHFW?=
 =?us-ascii?Q?hSiU8cEvjtIwVsIemU+h/xDY4TU6fPqWOI77iDG2HZJZHaAUE7tEZuqWg6rD?=
 =?us-ascii?Q?RKK4KLa8WRIEs0ZYvAKa3WLYafauNPvVvhJQfT/xnFrGWjCejDq969xfF20B?=
 =?us-ascii?Q?p4TOWz6ZTqZBLlE22cg3wWGEE4sRnoABcvCqZlAvllIDxMc12rnPhO/Ck/oR?=
 =?us-ascii?Q?uUdX/Vgz4bMuwhcM1cw/VXwbTTM0Kdo8cFbzpRnJLIFkiO7xIZyjXZYmprzI?=
 =?us-ascii?Q?VqmLmsuz+lcDGYeSklA+pwl5O+D8ky7wXOO2krKyNts/m7vTFfP+oLEg4Trs?=
 =?us-ascii?Q?yb5W/RlCAKc/9JnLGA6nGZtwqyuG5X4Kooijdz0RICFxPcOkugAr3aAR7T4l?=
 =?us-ascii?Q?Bpox9CCOyBVlSryi9moZU7V+iApjTwBgWf6UKb91SnCvo4v8U357OolY/uAY?=
 =?us-ascii?Q?ItdxJarwCVXuQicY6Pr826OJZVjwZ9hpmBsoctI63CchgPmEMTnzanMe+trD?=
 =?us-ascii?Q?ZeZtfvT9KFDlMOH17Gzc3EPWQHI6vcW/i2+E5n71lYh56ckbY0gi1Mf2ieXX?=
 =?us-ascii?Q?1uX7Y8xqSlLezZDJg1Qa96RwGAaeym1dr/vRnlRJ/+RkFY07uJ8dOl6UugI5?=
 =?us-ascii?Q?iE5qbpxFi6+1sK+EKgXeytroFh4G2jUTZweSeGafGQGufV+b5jj7O4Spdhkd?=
 =?us-ascii?Q?bJCyH7qjubT0GOST0QPuv0LNJrVlrfJsfrq5ydX/tSh9sAlx9ftuUcgd5tQo?=
 =?us-ascii?Q?66W+zUHZ4O/s3hDVGAfFYZajlps4hiVNsYV8+XaRPmhgrnhVul5hFKJ1ZAJ5?=
 =?us-ascii?Q?8ZqA1GVXBW909b+mi3VKZN5LS2nFcxv3v4VMLdeMpR0VQ7CgdHzkUPlz8zyh?=
 =?us-ascii?Q?NnVcdOEpnG3dnulGiOiRfZC0C4dcZK8AqxFfT/oOeRrGHn19/SeeJxlTGgqz?=
 =?us-ascii?Q?fpO/AjPO7YfKOXi7zN3jxClHBKiLy2w7uJ+GwrdI2Ln3Qwq/LBMBjwZX3npV?=
 =?us-ascii?Q?0xKG3mmhlcQ7h1DK12mY/H6RRkHmahKHF2ZG4NbeRerFLb1nf+lji4kTyjHc?=
 =?us-ascii?Q?tvoknjo9eeC/8aqu2dFDnD62Ewa7ePI3+d6CuOeFH8AjC3fbGOJFeG5FvjKd?=
 =?us-ascii?Q?skzYRFQCdgOzSSPY47iK3wkOg4rpmNfFnHyJH7hQm1hKdwxm/1Hs2CFzlBKR?=
 =?us-ascii?Q?CCQt8VylT79B8mfc02hLBsuXReUoQfNgtxIuXK8qGGpIiJM7BywhnxTNfa6O?=
 =?us-ascii?Q?KWYLotavEeqsrswauRfqLxk664PdpJ1UMaVIKyZ50+CiYrLoiZcGHHDxD97n?=
 =?us-ascii?Q?aWDnh1fCEwNF75Px7jksfkfeT9enKsU7Ie/1mMYCr7jhwa3ltNpzkCETWY+o?=
 =?us-ascii?Q?Q7f5WBstPG0uUfa4awf3zJ2LoLEYYWStWdwq4/rLJEdjj0JbKX8j3i+P0+P4?=
 =?us-ascii?Q?v4SszRnWUwHNUT+KObMwkReWAGooKzOAdaX4i+3SWvCt1rbool9E9hcu2jJT?=
 =?us-ascii?Q?X1Wdw6I8/DBnhweWoN9mBIuYal95m2g=3D?=
X-Exchange-RoutingPolicyChecked: 
	heLcA8TVVu08REzuO1QYMxFlFCADsxcKAWEyAHLbxlh+riibaNyWZEsS+q6TPXYd/UgZux/Ly5SLgjr01B0VaJyGD+gzIExEWcJc5Gk7JEMG3kXWL72Li9sfi54lzj+zpcbZv06CFbcGIMoI8foyBIauUL3Vdh6UA9YURbd/dt+N0mMhKh6gbcobutM7sVCxD07N9jBAd4I9Pbufse9m6aWcNvd+BU/7TI/Q4vsZCr5UojaSezYsWopDcDNvTVXbPT1Ig4gevLpeS/OJdg2CEhvSjiRGVpJPZz3Lutkb4/ArQiEhCMGURA4lVSL9I8dL9EBN31o5NJUz5ArpVFBIuQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cf64403-d1f7-42cd-8832-08df25ecfffa
X-MS-Exchange-CrossTenant-AuthSource: DM3PPFCA3BFC2BF.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 10:06:34.8403
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yPBlQ7SXi7hVTzL7k3FH9m9I3crmSYILmQk8IaJkRrsWGM5QmaH+W+FSwgYzTT67eUYsYuujEjk1mP1nbbf5lOhuOgya8mx3JKcW6I1WEsk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8471
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA0MCBTYWx0ZWRfX4S7xgWxPR+L/
 V2PrnTOeQ9pbytqWanUHg1n0SXpvC1f7z06Yub5gdhQptFQD6bAwzJENF0bBI+jd9C4mG3gNJaN
 oUHbppeSk8A+OmqHNmkkcmzTAj4BwBjJFwO44emKgMzxFbU3SY3O22xpxdP5/gUCBg+hEs5I8+x
 /0fWFXBy0LPlVXjdMnkW2+pqvl+UwzZEywHIJfzsEIgrqsAOUuvRglaFElnCRWsrxiSQifmJgmM
 kcprWHphn67hhjwprWf/jTHN6I6R9ruY/dlhpfGgm2AaQyjaLKBe0Hy1aPpG5r2lJVTB2eMTg6g
 NtZ3C7eAEwZjJ/8vTXskivb7UlBVKxBGC+CEVgQBnyhzFHXHDj0Os5nQ94sD9/4MU9uBkj8JATH
 7FtbOFonV5ccZO9Dg6chd2On88TCuzlBX44SpUhtFFkmxKxeEQoaskUnAO9rToulkzfBeR3Ui4b
 Hs+pq7PDLO5d6Y6RlfA==
X-Proofpoint-ORIG-GUID: 1khH8Y9wfGX57tmofK4zCplwn0oDcSZ_
X-Proofpoint-GUID: 1khH8Y9wfGX57tmofK4zCplwn0oDcSZ_
X-Authority-Analysis: v=2.4 cv=c6A+0h9l c=1 sm=1 tr=0 ts=6ac8bcbb cx=c_pps
 a=WENG6qyhB+KjION9BEm1PA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=PYnjg3YJAAAA:8
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=QQB30U6hSjCU2OfcO20A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA0MCBTYWx0ZWRfX4WytRNsRy5ib
 kSC2xVU2toKy1JPIWjeOurXcNsOYeKp55kY5gUd1/K9REKVi8vZL66Uk6/FVePy6dKNl07jmoUP
 aR9LPqpbJ9IbaZFx71uCLAMVHww9PXtiR5/iPdT7l/ypwHamhNHo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 phishscore=0 malwarescore=0 bulkscore=0 spamscore=0
 clxscore=1011 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090040
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Oct 2026 10:06:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130693

size_t underflow in AMQP frame length computation leads to an
out-of-bounds read in rabbitmq-c.

A malicious AMQP server can send an AMQP frame whose stated body is
shorter than the per-frame-type header it claims to carry.
amqp_handle_input() then computed encoded.len without a lower-bound
check on target_size. Because encoded.len is a size_t, the
subtraction wrapped to a value near SIZE_MAX. The bogus length was
passed to the method/properties and table decoders, whose bounds
checks could no longer constrain the parser, causing an
out-of-bounds read and client-side crash during amqp_login.

Validate target_size against the minimum required for each frame
type and return AMQP_STATUS_BAD_AMQP_DATA when the frame is too
small, before computing encoded.len.

Details:
https://nvd.nist.gov/vuln/detail/CVE-2026-44235

CVE: CVE-2026-44235

Upstream-Status: Backport [https://github.com/alanxz/rabbitmq-c/commit/1d3afbb056fee5cc9ea05680bf32288715d0d802]

Signed-off-by: Poornima Lokesh <Poornima.Lokesh@windriver.com>
---
 .../rabbitmq-c/CVE-2026-44235.patch           | 93 +++++++++++++++++++
 .../rabbitmq-c/rabbitmq-c_0.15.0.bb           |  1 +
 2 files changed, 94 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c/CVE-2026-44235.patch

diff --git a/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c/CVE-2026-44235.patch b/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c/CVE-2026-44235.patch
new file mode 100644
index 0000000000..4f55d99c71
--- /dev/null
+++ b/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c/CVE-2026-44235.patch
@@ -0,0 +1,93 @@
+From db957b8cdc980e4226b6cd6f18061eabfc8f409e Mon Sep 17 00:00:00 2001
+From: Poornima Lokesh <Poornima.Lokesh@windriver.com>
+Date: Fri, 9 Oct 2026 07:02:33 +0000
+Subject: [PATCH] rabbitmq-c: patch CVE-2026-44235
+
+size_t underflow in AMQP frame length computation leads to an
+out-of-bounds read in rabbitmq-c.
+
+A malicious AMQP server can send an AMQP frame whose stated body is
+shorter than the per-frame-type header it claims to carry.
+amqp_handle_input() then computed encoded.len without a lower-bound
+check on target_size. Because encoded.len is a size_t, the
+subtraction wrapped to a value near SIZE_MAX. The bogus length was
+passed to the method/properties and table decoders, whose bounds
+checks could no longer constrain the parser, causing an
+out-of-bounds read and client-side crash during amqp_login.
+
+Validate target_size against the minimum required for each frame
+type and return AMQP_STATUS_BAD_AMQP_DATA when the frame is too
+small, before computing encoded.len.
+
+Details:
+https://nvd.nist.gov/vuln/detail/CVE-2026-44235
+
+CVE: CVE-2026-44235
+
+Upstream-Status: Backport [https://github.com/alanxz/rabbitmq-c/commit/1d3afbb056fee5cc9ea05680bf32288715d0d802]
+
+Signed-off-by: Poornima Lokesh <Poornima.Lokesh@windriver.com>
+---
+ .../input/fuzz_server_ghsa-9mmv-r8g3-qp46.raw | Bin 0 -> 113 bytes
+ librabbitmq/amqp_connection.c                 |  19 ++++++++++++++++++
+ 2 files changed, 19 insertions(+)
+ create mode 100644 fuzz/input/fuzz_server_ghsa-9mmv-r8g3-qp46.raw
+
+diff --git a/fuzz/input/fuzz_server_ghsa-9mmv-r8g3-qp46.raw b/fuzz/input/fuzz_server_ghsa-9mmv-r8g3-qp46.raw
+new file mode 100644
+index 0000000000000000000000000000000000000000..558e9f5bff6b24ad3104b8a3038ab5b271257dcc
+GIT binary patch
+literal 113
+zcmZQ%0D&+DE+FItvaHO#6&U^l0azR#5qxj8*#?Ay5=J1KHNeNw(+|W*&5I8WKF0)>
+L=Vq{ht2+k({(TL>
+
+literal 0
+HcmV?d00001
+
+diff --git a/librabbitmq/amqp_connection.c b/librabbitmq/amqp_connection.c
+index 56ab8a8..4326ef7 100644
+--- a/librabbitmq/amqp_connection.c
++++ b/librabbitmq/amqp_connection.c
+@@ -320,6 +320,13 @@ int amqp_handle_input(amqp_connection_state_t state, amqp_bytes_t received_data,
+ 
+       switch (decoded_frame->frame_type) {
+         case AMQP_FRAME_METHOD:
++          /* A METHOD frame body must contain at least the 4-byte method id.
++           * Reject undersized frames before subtracting from target_size to
++           * avoid an unsigned underflow that would yield a huge encoded.len
++           * and cause out-of-bounds reads in amqp_decode_method(). */
++          if (state->target_size < HEADER_SIZE + 4 + FOOTER_SIZE) {
++            return AMQP_STATUS_BAD_AMQP_DATA;
++          }
+           decoded_frame->payload.method.id =
+               amqp_d32(amqp_offset(raw_frame, HEADER_SIZE));
+           encoded.bytes = amqp_offset(raw_frame, HEADER_SIZE + 4);
+@@ -335,6 +342,15 @@ int amqp_handle_input(amqp_connection_state_t state, amqp_bytes_t received_data,
+           break;
+ 
+         case AMQP_FRAME_HEADER:
++          /* A HEADER frame body must contain at least 12 bytes (class_id,
++           * weight, body_size). Reject undersized frames before subtracting
++           * from target_size to avoid an unsigned underflow that would yield
++           * a huge encoded.len and cause out-of-bounds reads in
++           * amqp_decode_properties() / the table decoder
++           * (CVE: GHSA-9mmv-r8g3-qp46). */
++          if (state->target_size < HEADER_SIZE + 12 + FOOTER_SIZE) {
++            return AMQP_STATUS_BAD_AMQP_DATA;
++          }
+           decoded_frame->payload.properties.class_id =
+               amqp_d16(amqp_offset(raw_frame, HEADER_SIZE));
+           /* unused 2-byte weight field goes here */
+@@ -354,6 +370,9 @@ int amqp_handle_input(amqp_connection_state_t state, amqp_bytes_t received_data,
+           break;
+ 
+         case AMQP_FRAME_BODY:
++          if (state->target_size < HEADER_SIZE + FOOTER_SIZE) {
++            return AMQP_STATUS_BAD_AMQP_DATA;
++          }
+           decoded_frame->payload.body_fragment.len =
+               state->target_size - HEADER_SIZE - FOOTER_SIZE;
+           decoded_frame->payload.body_fragment.bytes =
+-- 
+2.35.5
+
diff --git a/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.15.0.bb b/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.15.0.bb
index b8bc5b57e3..afdc99623a 100644
--- a/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.15.0.bb
+++ b/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.15.0.bb
@@ -5,6 +5,7 @@ LICENSE = "MIT"
 
 SRC_URI = "git://github.com/alanxz/rabbitmq-c.git;branch=master;protocol=https \
 	   file://CVE-2026-61547.patch \
+           file://CVE-2026-44235.patch \
 "
 SRCREV = "84b81cd97a1b5515d3d4b304796680da24c666d8"
 
-- 
2.35.5


