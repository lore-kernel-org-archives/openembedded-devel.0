Return-Path: <abhishek.bachiphale@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D42D4CD4F59
	for <webhook@archiver.kernel.org>; Mon, 18 May 2026 17:14:18 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2393.1779124450811665319
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 May 2026 10:14:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Up2Da5r7;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=95986d85e0=abhishek.bachiphale@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IEHFtu1522306
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 May 2026 10:14:10 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=+jDFepGEyvlsmKV5i1BhmRvRNUH/VbCXfIrIKeojy9c=; b=Up2Da5r7GTog
	ynxQ++AzdC34cqm2HnhGDCtuuRuVqiBStuN2H6Pps5ySr2sGdFmqGv4p1zdTdrIF
	2oy6NV8gmUtqr2QikfSNHa1tzeDXff5rNQrFgDVQroL+I8qJFyvMoRIX5ytfIEGY
	g95gZ0d3sU5ZK23pekLrDeyYwuj7sKktrmFmfUAhGLp4JcBW86rLUauLL0Jm5xp7
	pDdIqMN+rrFxr8i7L5RYnvBKcQA279GlCN42Qc1ZLaQOCFXeal/9tlC6npdnch6/
	ZknCKTxkt52r00gaOSsaOMwhBi4U9pQ1+o0i7eb+HZEX7c51+gxMA9f0Gw6xpw3X
	1OG3aXvhSg==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010053.outbound.protection.outlook.com [52.101.61.53])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e6kux29v5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 May 2026 10:14:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CAnyIaEV8nyJsNfpCS0DzgGHnUrFWGB3yhXxvZoSCefd7JThAv/dLbVi92fyMzp2AbPLqxX4mVIbErwqOrXhTMX652BsEbTQ2Fay5YIFMkPQ8m+vzJEhAiA1wh8SRk4+HFm5XnOkm8a5JAgwtsu/o9fewh54ElQWeAfmGxZZymvh3zgS/QYvaRUZ2wjy1DScbziiahuZrQslREB6kd/m6eoXAtkxtoR8ENMVLtd1ZgMKT7sEN81WyKKOAmK252lUv4+j9hkXytpIIaeEINE+fK0hnifcDrtJFzOOQk6BkotAYbs8QIQ3F+J5xKih7o1rPWQunegt/VtzauR38HV61A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+jDFepGEyvlsmKV5i1BhmRvRNUH/VbCXfIrIKeojy9c=;
 b=ixcw/Ou2XLEkcUu2GE/nfjIimmxcbxGgyENeTyCNWKj9WH5inYoMtY7oQZJR5j939Rgtn/KCC5ASTICCM0GKZGtbW1otvt34cdRgC6A7mh8xJST/HH9gfrj0frGcpsZc1pNBI9SE/VTyWXnMn4XfjJBguJNpxs+vOyUEFRPVv6uJgfSbcJqdvHDDFTjN7NBZQxN3dQ5SAjkhDFjjHOb3XPVEOoVNCZtl+B264Ml3uqaD428tf/wKGw1ldNVPKclxCqYNGX8tF5ZVSGoNUIGZiBMT5swuOvkFbazoeBlyVcJpFZBkaKXUd81TptNegSsdIBniOui01Eavt1X99BdylA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA0PR11MB8399.namprd11.prod.outlook.com (2603:10b6:208:48d::9)
 by PH0PR11MB4840.namprd11.prod.outlook.com (2603:10b6:510:43::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.21; Mon, 18 May
 2026 17:14:07 +0000
Received: from IA0PR11MB8399.namprd11.prod.outlook.com
 ([fe80::ea10:3d10:93bf:f83c]) by IA0PR11MB8399.namprd11.prod.outlook.com
 ([fe80::ea10:3d10:93bf:f83c%6]) with mapi id 15.21.0025.020; Mon, 18 May 2026
 17:14:07 +0000
From: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/6] dnsmasq: fix CVE-2026-4890
Date: Mon, 18 May 2026 22:43:32 +0530
Message-Id: <20260518171336.470608-3-Abhishek.Bachiphale@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20260518171336.470608-1-Abhishek.Bachiphale@windriver.com>
References: <20260518171336.470608-1-Abhishek.Bachiphale@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY6P286CA0001.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:3b8::18) To IA0PR11MB8399.namprd11.prod.outlook.com
 (2603:10b6:208:48d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB8399:EE_|PH0PR11MB4840:EE_
X-MS-Office365-Filtering-Correlation-Id: e099a5c7-5491-4bd2-a28f-08deb500de5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|56012099003|22082099003|18002099003|11063799003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	BLKVkGcfWvJry6vJgSOuEin6dDfKsD0wQlhSpfxgjQqJD/vWJCQIRg1iwS0h8b9niS1EMikdH1OaI2lJkxemWefoqI6vS6L7p+kLnRpdaRnpnj+nGkE/Gb/2WEdLVcQXazJTEjcP/G0+uYervOGyzfHt1OfxzLWlywsUbISrH+Dc5qih+ZD699aNtLLmqYjXze1QmBJC02LxApVEHNtd/OY2mq1Z269T7dv0jK3N+ZtxagkgKjhcPflEWf2T5MCmf6CoxqPqZWtYM0gOUNYIYMuPwK+3+C1O6UMrrm3VnrIofehXW7Hzq+y5vjJL5y1PeDpTpNsOSz9PjeVfmcaUAcZR/P8HV/iSi1HENXfsSF6j/3bKZDeEXx8cKoL97yCRAZR/ae+VN8Fq7RAYCUtUiiGKaVV65iWPVx6iC9v8u+GCEbOvEHfPBumP/8X+jqGHp1VNXvnEBpRiikxAiPk28u5AOaxGlENcFPbzGWeSBG9LZaXxZZ1PYGseOJ9iZCgutp57Cr9ZrivgPVK6MWB/MO8HUbzZOZELTOwiYn9K8+5iU0YZtxfMD90i563x4OVrYFPi1lt04cZ/c/a4yA93U4qf6g+fKSnVPZRUqRZ7CSRQelgMPc636eF7FNMQidqQzh4pn7pDRpiWNa9rCw5Sm16B4iHDK8CAydWDK1H7FRjWhwAovMMOAj+NT3FRP8PBwSHnGahnWxowerRmhcunSQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB8399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(56012099003)(22082099003)(18002099003)(11063799003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3qB0+D3Vxxwx4agbdbaHqw55ESdQlwYqqWf1NpvFXs0ELGUxZomGKDdkBb/j?=
 =?us-ascii?Q?8Vqw+S2CdOPsxA3o9Nmwd6gQh4jx7R9/6YL1OPMnOsf6hm1xdG993pRh3UL8?=
 =?us-ascii?Q?DUE54TeFyki1sj+z2FyLP3X+ERvWU126sBEsHOAGgHYnro3AgTNkuR00Ps27?=
 =?us-ascii?Q?I1KkQYL3iZAcutUf57mbVMfWwOzycDszgL03TsCDcldV4LejPfXoC54cFJKk?=
 =?us-ascii?Q?NuFcSoDDZ9UvJPQDStDQM+0k3RXjynWLPrxYoCmh5mqIHxoLJPRpNq/yyYWm?=
 =?us-ascii?Q?2UFrxW5k9QD5Oc8WNhbovANMclzljw6kiwFu74q3hbZRXo4n0P++5KKGN7ju?=
 =?us-ascii?Q?8NRmklKhrW+IMGzdS7/6dc4Ze0qY2gXlx66AlhmPmJa7WchjSna7TyU1SfT6?=
 =?us-ascii?Q?pu52XyU1FPpNw3eBvFC7SYY/hbagoQL8zoDmwc9/9ZLtePNsiz9NAUuYsT8w?=
 =?us-ascii?Q?wZuQiXcw4ikJ3tDCajFONIxaAFuvSM22K5rUQ020aql6yM8PZzb0IPmCVC2+?=
 =?us-ascii?Q?etRpSXZJ1nkClMGGsl2DtIXSNMPlXTC2cbWIUIvpZ0UxwgfoVVH/IZlza5J1?=
 =?us-ascii?Q?7vAo+WmFy8l7dhWjugcbVZX6JyQPi3zH/CnvgOLz/4m1aZ1OKxQuAQwMPqG4?=
 =?us-ascii?Q?GZ518Ml0WJBQBBt/TiUPXK+9N8Gpe19TW2R1DceieKkSCm4ySfLfbVO9VbiW?=
 =?us-ascii?Q?KJoIgqlqH1J/MWB4tP4/B11zw25ptZkd2NUIbDigoFEI2XJTPGHjuyKiE1mp?=
 =?us-ascii?Q?QBZoZga//A2i3Ewy6Pv1TN6yazlMAxsuf0as5MvtZXjWQfkseW/2e/TTzeky?=
 =?us-ascii?Q?oLd52kd0XQum1lxga/Z3ZnjNEAE5ECQoSYGkRfF48fhPw3o5V2UiW5UnujJJ?=
 =?us-ascii?Q?BY/zvtPOLX4WlR3fapTR1vG1TZG4fZDvjGL5Fi9zxpN1lKi4nlkC32oGabhO?=
 =?us-ascii?Q?FzbpPMQgwoLGKqc7MiwOe5vhqVBh8IbmwMA109QmT5MEGOU6tSGhPbxl0I9k?=
 =?us-ascii?Q?fZV/C+nTmyQRTgQBZNTLP6jndMzb7KiOu5tPdK53PMpvQ6DHHIq0KM++qqd8?=
 =?us-ascii?Q?lceqifg3IGvLrjEBLg7/iXkjoDQvBhWhgrGl1aInUDpwKW4lRuj3NHj7MlE/?=
 =?us-ascii?Q?Ib+Ovr5/gA7gybqvTpMqI3jV5GAqXGkQMAmtbSUj4IuHh0sBcW/u2FzleC1P?=
 =?us-ascii?Q?tPvwIn2LnW1zIzf1bVKf5Efn21iqj288+rtzfbEdiLyg5F1bIUV6Lx7DT5Gw?=
 =?us-ascii?Q?5qnKWkFH08eU+W3nd/cGxYF+WtxQo3SYT+GzY9EF47etAsP8F7r/JYB1qU8P?=
 =?us-ascii?Q?uUbLCIhJMOMhIeYTZobuIDJsWWbpBynm3EiXOJAib57sZIm1P/zIO66XyOEE?=
 =?us-ascii?Q?m0npQ9oXBMuSR/0vciWrzBnmRrW+GDnGLTL5/CFMB7w5dBLfM0YppRd3RAoH?=
 =?us-ascii?Q?aalk8R/B7FtZwqwKMbnk4g2qtgzonIEgzs5F4EUPlfjDsTgS69mGpTtNIAKF?=
 =?us-ascii?Q?LAM+zy7rBOJ+mkJYAKAZWgyDc0NB7KroJI9U4MKvJkIGvx3ahWhNJ2dp+T7m?=
 =?us-ascii?Q?834w2lGOl1m/nPSlWn3tsYjBOYnBForTamJpc+FviOY15yhzYrDAnpyjz/84?=
 =?us-ascii?Q?wfdAEjanuH3yWFEbnoeLCTlpIOzX24XAd916EzI0T+hzb9pMMvCguTDBj7fC?=
 =?us-ascii?Q?Wf30TPIU1rJUzfM8KeGD+pWUVo6lANKDEtcQbYAVcxZqnr+g13S/ke3LcGX7?=
 =?us-ascii?Q?MlJlNAW1FXWvL/L/T9X/qPG0bIF57u/0qB+TDWqZxa2Nj5yJQKZ5?=
X-Exchange-RoutingPolicyChecked: 
	aySbarV0SCwU/pVZe/WNtJfTxxWv06/wVqb7PkzdKkWSuOJKvaQVAKxg+JCALkWlAYXL32s0UZzkEoxhJiUAII53KK4bIF0EWY9EH+cFCMiRUyVrFQ4U14d1C9Sj5p05vE4waWpyOKjhHXQ0XV3APXGF8r4y+EaGdO02MmmW+8lNRY8FUJ6XCns16A6PU+QeMSOsZIUJVZkplVXK5ebqdLE4r9HRMYAg5SHQsQWEoz1NYCd+zuHZevrU7Qg9F+SA5ttgRHsCCiDP3Kk5pNurnpDhQyiB+vQs2ACoJIq6oJAbEPwsxFN/L+cAVFtHhg06Y3o8W9sj64/sscspNK6BRQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e099a5c7-5491-4bd2-a28f-08deb500de5d
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB8399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 17:14:07.0436
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wf/OucXNPozSTI9X7he2gOkblai+I6TblXQ8wow1unI+rNeWTO/8vYqlZzvjCjczbqQltXrI4Np41lUyG6U41TRcgyMJUxAXXjzXDcSmj2QZPnuLwC01v//xgOe7VJv0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4840
X-Proofpoint-GUID: xHU9KlnQfZiNV77ePSfGcrEiE1s888au
X-Proofpoint-ORIG-GUID: xHU9KlnQfZiNV77ePSfGcrEiE1s888au
X-Authority-Analysis: v=2.4 cv=NMblPU6g c=1 sm=1 tr=0 ts=6a0b48e2 cx=c_pps
 a=ynjcjXHaqbEn4NYQb+mZsg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=PYnjg3YJAAAA:8
 a=omqxvBYPAAAA:8 a=t7CeM3EgAAAA:8 a=VBowi81kAAAA:8 a=-pdwg6xDX3jAI0Pq2SQA:9
 a=LHRESdT2jHCYgTnjdhDM:22 a=FdTzh2GWekK77mhwV6Dw:22 a=uoxt2CKr5i4t67rzx1zf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDE2OSBTYWx0ZWRfX/aR8AtefnjCz
 F4L8TTsrjbvsjhSgZHxudbHbuAV0FpCLXFMfdUyQC94IxchsnDC8FDy4NKQxPvYuQZViavgjrAz
 6V022qJZMRJclTkDoFzqk1gFJDw8RU6eU0UNli+W6pEx4JLTueMb99MhpIWuiIwN4g9YxsFuYFp
 wI9AcNC07ecrEFWmG/yfyfCGQZoPAqWZXqb+59A8IE5WR9WY0+Ii+DYW0Z+s7FOqrz61D3sYxh6
 uRtEbzadVWRObLvdOJpmjkhEOwHd89yT+ZAsQfVnZuoWGAsvEWzOwUQ+pFRQrmarPoplbKVDJwD
 yz4gF+frCkrsgm4L58ucP++SJbqNrkvtPdguYSaJvM1vfzt2Z7MXUYkm/UFGwy1Avk77krZRftw
 9D5KrOBSCdFniCUzx7E1og+LU2Dw/StztOafbgOr9eDajcT6isokSd5ijuANcD9kids0IZhDDqI
 D3HTxeemx3y8AJvufZA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1011 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180169
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 May 2026 17:14:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127052

A Denial of Service (DoS) vulnerability in the DNSSEC
validation of dnsmasq allows remote attackers to cause
a denial of service via a crafted DNS packet.

Reference:
[ https://nvd.nist.gov/vuln/detail/CVE-2026-4890 ]

Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
---
 .../recipes-support/dnsmasq/dnsmasq_2.92.bb   |  1 +
 .../dnsmasq/files/CVE-2026-4890.patch         | 50 +++++++++++++++++++
 2 files changed, 51 insertions(+)
 create mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-2026-4890.patch

diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.92.bb b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.92.bb
index bef058aa3e..61cdccb241 100644
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.92.bb
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.92.bb
@@ -16,6 +16,7 @@ SRC_URI = "http://www.thekelleys.org.uk/dnsmasq/${@['archive/', ''][float(d.getV
            file://dnsmasq-noresolvconf.service \
            file://dnsmasq-resolved.conf \
            file://CVE-2026-2291.patch \
+           file://CVE-2026-4890.patch \
 "
 SRC_URI[sha256sum] = "fd908e79ff37f73234afcb6d3363f78353e768703d92abd8e3220ade6819b1e1"
 
diff --git a/meta-networking/recipes-support/dnsmasq/files/CVE-2026-4890.patch b/meta-networking/recipes-support/dnsmasq/files/CVE-2026-4890.patch
new file mode 100644
index 0000000000..4a7673817b
--- /dev/null
+++ b/meta-networking/recipes-support/dnsmasq/files/CVE-2026-4890.patch
@@ -0,0 +1,50 @@
+commit 4fdb707633afe8028118bcaf39b4882f634b5999
+Author: Simon Kelley <simon@thekelleys.org.uk>
+Date:   Fri Apr 10 16:24:02 2026 +0100
+
+Fix NSEC bitmap parsing infinite loop. CVE-2026-4890
+    
+Report from Royce M <royce@xchglabs.com>.
+    
+Location: dnssec.c:1290-1306, dnssec.c:1450-1463
+    
+The bitmap window iteration advances by p[1] instead of p[1]+2
+(missing the 2-byte window header). With bitmap_length=0, both rdlen and p are
+unchanged, causing an infinite loop and dnsmasq stops responding to all queries.
+    
+Reachable before RRSIG validation
+(confirmed by the source comment at line 2125), so no valid
+DNSSEC signatures are needed.
+
+CVE: CVE-2026-4890
+
+Upstream-Status: Backport [ https://thekelleys.org.uk/gitweb/?p=dnsmasq.git;a=commit;h=7b151eb60609a0139474918222806f9bcfb4fe71 ]
+
+Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
+
+diff --git a/src/dnssec.c b/src/dnssec.c
+index 4bb0495..3951620 100644
+--- a/src/dnssec.c
++++ b/src/dnssec.c
+@@ -1348,8 +1348,8 @@ static int prove_non_existence_nsec(struct dns_header *header, size_t plen, unsi
+ 		  break; /* finished checking */
+ 		}
+ 	      
+-	      rdlen -= p[1];
+-	      p +=  p[1];
++	      rdlen -= p[1] + 2;
++	      p +=  p[1] + 2;
+ 	    }
+ 	  
+ 	  return 0;
+@@ -1512,8 +1512,8 @@ static int check_nsec3_coverage(struct dns_header *header, size_t plen, int dige
+ 			break; /* finished checking */
+ 		      }
+ 		    
+-		    rdlen -= p[1];
+-		    p +=  p[1];
++		    rdlen -= p[1] + 2;
++		    p +=  p[1] + 2;
+ 		  }
+ 		
+ 		return 1;
-- 
2.40.0


