Return-Path: <libo.chen.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36F1CF8DFF7
	for <webhook@archiver.kernel.org>; Fri, 17 Apr 2026 08:46:25 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40214.1776415581933072658
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Apr 2026 01:46:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=V7Iy/h52;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=856723d307=libo.chen.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63H5uJIQ3558827
	for <openembedded-devel@lists.openembedded.org>; Fri, 17 Apr 2026 01:46:21 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=gQkNNFbLYzQ3plK0nk2kflVQhGNOkTD04t98+lS+or0=; b=
	V7Iy/h52pD/dQeyuWDQzC3QFGe9Oouak3uKp0S2+GAiUblAb7OFAIqP4TRGvlLP8
	6kHOj4xEU57WBY3jtGXINeIzkaF8qx7j3Y8111Yk8LrPobQgJeoH8GoAzrfp8It+
	2cYNB1pCfR+553axX3RYMXqEROu18KRmtTEgIJJCgtdh9wWgdcjncP4dWAdQYxFB
	/zkkhEmIdD6wcCWe1eCXgRiscgmH3s/+aC7AM5yveKTsMmWJc1KdZRmBA4P/viAx
	0m7PVgaKmiAn+zW7/oXtrZnhatF44byN8Un1V32mU+wtIl3X7STX37NbtsA/aNRc
	v9xbq+ngGgz98YGre9UXZg==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013064.outbound.protection.outlook.com [40.93.196.64])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dh87mvsmy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 17 Apr 2026 01:46:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Psyshcq+MajCDV+jjr6uSAf+mUg3Z2tvck25wtXPAxB50rFHnz/herWnvnkcjsGPOwYXhaluyIJZhDjUM9p033Tjp3lG8Mf58CHrPyNYfCcq+Yp+yTcozLyyGK1AnIUBajfIk0iqTiPReyeX0m3CRxX/5VB1+hZwqZcnFFvLwabCV5TfW+izHSoo+pOg3XEfTNA6dul8V2v6OT0IrnBla+Ptegjx2GiGusYa9br4F+fmE8SvKhD1REblhMDrvG/ni+rUuvMQyAl8nFd5a99d8Z1NjRoi9S7zIUASSrNegotcFoMzQQynWrmBVJANyO0APm6hUW9vGLdMQBTbbC1khg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gQkNNFbLYzQ3plK0nk2kflVQhGNOkTD04t98+lS+or0=;
 b=NcE9lU7VfG2wMv3uQ1zyTQ7annt1OlDS+JYm/TEenuJgMKZe1LToTPvi8r3vszj5aP7VWVaY77aOU33c6PO9RnB7gojbUAQKsCmo9bbzA1XGE9o0W1Utt4zwrFop1uk5lWUFHfl+fvNIq3hRiLCPK7RFQrx37CucXDKaaMp68xf24yackEggOrUSqcfc4OgTNQbwDSKPnBnBrlZ+MePB1XGejqPURz4cIblzBXJTCpT9tOqTsheit9cLiuzM+3u6GbD/gGNDyD9NhAHRRYZyj75K4rxqzY4RO9H1R8yS2ei+mU0InLoLeiAV8gxhoNzUIUHbBERfqdpEgiz+tCj6iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BN9PR11MB5354.namprd11.prod.outlook.com (2603:10b6:408:11b::7)
 by MW5PR11MB5810.namprd11.prod.outlook.com (2603:10b6:303:192::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Fri, 17 Apr
 2026 08:46:17 +0000
Received: from BN9PR11MB5354.namprd11.prod.outlook.com
 ([fe80::4a0e:caa8:c2fa:8700]) by BN9PR11MB5354.namprd11.prod.outlook.com
 ([fe80::4a0e:caa8:c2fa:8700%3]) with mapi id 15.20.9818.017; Fri, 17 Apr 2026
 08:46:17 +0000
From: libo.chen.cn@windriver.com
To: anuj.mittal@oss.qualcomm.com
Cc: Jinfeng.Wang.CN@windriver.com, openembedded-devel@lists.openembedded.org
Subject: [oe] [meta-oe][scarthgap][PATCH v3 08/11] hdf5: fix CVE-2025-2308
Date: Fri, 17 Apr 2026 16:45:46 +0800
Message-Id: <20260417084546.3482902-1-libo.chen.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CA+s=J=ztc7LcbsPH-QsFCSduqQX7Abqt=4Ve2S4s1ZSK4+DQkA@mail.gmail.com>
References: <CA+s=J=ztc7LcbsPH-QsFCSduqQX7Abqt=4Ve2S4s1ZSK4+DQkA@mail.gmail.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0165.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2cb::14) To BN9PR11MB5354.namprd11.prod.outlook.com
 (2603:10b6:408:11b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5354:EE_|MW5PR11MB5810:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f51d37d-4438-4610-7777-08de9c5dc9ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|13003099007|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	mEJjbB2hOyxyaPIB0rK8biksH/vSEHBNPxMNFEiHJ8ZZPO663qIxCVkdA+N1j+QlOG1PK6+qduO1Xmxs2kLUggWnO+RNkRXOcV2oJWN1hYDfbfjeCwHIui+Es5LmsMeUfNVA0idil3vhRSZiGpHidWwl2ONSmM5JPqpz9CEQGkZupkvZ/RcB+liO0lbq0yX5DHBCmJTk10eWIFxjRlGrPV61YQtZequK0lW8HzVLcG0iCDfyJcTntZQOKES7Ikrm0N3SKttia5PB5zyjdrdPyterhswB0HiX+JTzj4VajeQQvOPQ4G30XLVwHMHia5ouo3s5DprBfko5FEoOPgoubY+GT4Z/8SzhbjlU6ybDwAzKo7OXDBdihvzUkwDRldGsPRyPdKJ52raeoUokakRAyQ5erLMX/e+S4FtljDIQT0EmI6Audgincr3khn/BVkwGMSNUNIP/ERqdz0Mjr/QrQ+fQC2BKpbZkisupR37tauM+XkbhwCdjJ/u+Db6zfBFTZzJnOI3KPOCroP8PsdkqMl43hTHpqUWswZ4KHdI8bdOPcSCcgOaNX0Lvf43LgiQzTbZ0/8miBgRfCRgYzv9e5rVBuTKmek6Trb7CEQh6xHC+RO6Lvh5gKHPxHkkxsDriqZ+zrfEUWv8fZHmXyFw5Vi9Dh10ckgb1Ecx2vgAOPNYqtKF4ynKNrirbexBdxI5LftyaeJvxeDbY+lMX21MLfTQ3RHnIFr5TVJqsJe9odnJMJLkfczT/DgqOD0Sf3EebXcfodCKG3QSR7I+aZr+HtjyC3tf/gz3r4dTbasK61E0udwJKUrg0rZ8VZAuXap//
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5354.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(13003099007)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?7essQEPRNMkYh+hhX0lSUhGa5X+u8hoJT237xBaCBgEYyOxDavON8vRXUl4W?=
 =?us-ascii?Q?8L87d1cd30biKF0NnpGu8WAG0BEXCwOenRMXKUZBhOonxur4CPeq/1PPlsCL?=
 =?us-ascii?Q?fyd4dJehkop+bglY1EqSzmcYqTKC2CsLzXO38/RzaMZdqBbyisBAqQehNBjC?=
 =?us-ascii?Q?m2Ddx8+2gOLimBrAbPqE/0Ql/NUe+3ZdKjd7Wcg/PfOnrt4n8qBySNpWCZ+O?=
 =?us-ascii?Q?nlIPKmvDdt3gCxjLNOVnUlWMx2B3GpTR8trDxbDoUtIe4f/KyCLsusm94myI?=
 =?us-ascii?Q?nLsD87zpLtRNa3ONNCOaHZvl0nssGI/vaQ8ydp7uZtR5iPt1ehuQbqC0fAnd?=
 =?us-ascii?Q?04CuXPN7k86AVARF803uR16N2yaygE3cAqaCrRGfBc/MHRtlafsMLLSJbce+?=
 =?us-ascii?Q?TmWALoHNusFpmTsL/KkQWSBUa0v4d/GElAmZRoyKOw8l/4uVwQhCxG9vsNK0?=
 =?us-ascii?Q?z7g6zkMZdhmIZXCmljTJJ1EgWRc7P/XUnMzgyev1MEQxmUB2ywZUFGlAOZf/?=
 =?us-ascii?Q?8cU1L4ix5QNqrp5YozLAFi+RmGVInrfI9oG6zkPhPI9bN5zW6YW8WCZyoa5b?=
 =?us-ascii?Q?QCPPJi/ABgOUvJVg1Z377YYuDIHFojh2Om7wx+0oeLtLoPuFT0f88DzabDpW?=
 =?us-ascii?Q?fRMcXKPWgSE0P7z7QjWQYV1h7e9mkwuQ6tVPErnrq5JcsuZUIiqyQ/455c9S?=
 =?us-ascii?Q?iRBQy3OnrWBI7se1QC9XRJmeROMWHx3h8cFuMrpYpw/6COKBJX2e46Ud95LH?=
 =?us-ascii?Q?C47lgsfuvlFZ3QYt+eMiNUMfdiQCiZ1mEk0Qqrn9TKbaLZ1vh6ZFTHZZYYZC?=
 =?us-ascii?Q?ijuZPvBaQ8qGba67nGfKXR5WtqDza5s+ndQ8TQqpg5UXUZHtFUMdzUxJr2RQ?=
 =?us-ascii?Q?cmOlnerbnw0frj6yKdGLd8Tcu3nIMURvJSbUl9WUGRJ2sJxY9MQmdzxX3q5W?=
 =?us-ascii?Q?frs/B7DfwASpSRCDxsIPD9+GiRjRlEEOpa9OPzua+W12KL6DEe77ka/tZyYo?=
 =?us-ascii?Q?Glwk8Fx9269pQj58tVYGP1prSHfp44RLXy0Lgvaap5TJPKUfoSyCDF8LiijS?=
 =?us-ascii?Q?Q+zVFo7D7a80m1Nr33WjKCFhM153on95YIMCk+wjx3QQThUKSvWa8agizZb/?=
 =?us-ascii?Q?bSsJN9Fp0qLLRQkWl2qkuszb35SpLbqEoWULJW3Z4OQ+G5UkZluitOmF9ws6?=
 =?us-ascii?Q?2drdPlaJBjPduolKg418gKbX9IDpHN6Z0TqhyoUIBFjsXUagFQJXN0yqMjTb?=
 =?us-ascii?Q?uhy19ynrnBcGjpP/J0r/6agAwuD/UZn+moUR7ftH6ZfYGpwAM2NEwjOGIc+v?=
 =?us-ascii?Q?YpI4fOuJHIU8rbIV/YNzpj+ERIgGjfKS0IPJF+s0KayD6l9WHtsFrR/PzXJ3?=
 =?us-ascii?Q?zddKVCmL+5lGrna/hQMBIPOoP/wGPRsU6pYSo2pv9UYCZjlmtruhbT3N0Xwn?=
 =?us-ascii?Q?hl9He6zRvMUOOlEMbA7ab3u7oJwwB4nH42+nIHHigyWYiTZasTb1+IfgYqiA?=
 =?us-ascii?Q?IDeYYv0TzryNQLbkD2ON5MOd2enS7iL1IIg8UCI13jJMDFqUEuEGKtQGSO5V?=
 =?us-ascii?Q?g12OJVfV6Ht1whvjbcGf7ZYqHRDVEoYyVQ9b3sYoEZPx3CCXF1Uk3bwJD5jb?=
 =?us-ascii?Q?bsZ2Y51RSIJoB8Dlo+apn3ikm6Mu3srapK46iwAMJ2tQP4Ya2yt1RWp5gULz?=
 =?us-ascii?Q?tO5B62YPNhTQ+2XqV1PN+YiEve21X0ff5kuq65GACupBVNdhCnhGmNpq2Mbe?=
 =?us-ascii?Q?Kmq72YIIF/tJB0ZEzrcmyiHRKL5aMxE=3D?=
X-Exchange-RoutingPolicyChecked: 
	klgBrBKxoOeAyfvAud0RW/5baEZ0mYN6lCejUrNEUGDIBKFz+U5jCBq81FwvS+AIp9IGNXJA17dFSQ2XivfV4HuHnU/Yk7b2qV1qlk3OEKpu5m3YMTQodV6IdOrl1kbxZktJo0htNg4+TjL4SzkCrN5dLD1fYpC1QRptcOE4OLtYtaN70MLPwZCkysGKxpbg+3K8mQ43wWc7tyiNs/6h7C5MBCeFfF4hp+7waxnSLqDXByu4duq/McaL4OBpxkoRlVo7D+UeEG8w/DvqUHuyrFF9xvbww+J0pcxa1pOUHQElh/gW84XRw2Pw7jv8uHZpqdjjec98aT6hYnEI6aemAw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f51d37d-4438-4610-7777-08de9c5dc9ed
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5354.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 08:46:16.9427
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AU1rZ3qFYqRV28j6iA4b+GJCYkX0dv01A3GE/NZxBW6ZbSbuQJkzbFVSmOW0oNPOvzaineAO8vrLSVBsKkm3l4ULPMJrBnb8YBj5GuvLQAA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5810
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDA4NyBTYWx0ZWRfXz+Ua+pvftl/F
 uN3Hp24U5jRom7T45nrX7Yw4hVEUSuJqEbbzLf3RvOlw/DMocvU+uWtj1Rwo6w+Dnsi1VJj/cBT
 +YgDGGaaYUDa2QN++eDhkQmEnSR9qiR5ueT8IEELCKKfNW9Py6dquglUOFADdk7+fzKdVmLaACF
 EA1yD6aTWFRufHaT3TXlcxpyIdDM8mv0bx6nQn5pgccO/r7Oe1opVMuLfmGf/vvnKy9IOUNw1/E
 zOo1dmon8anjUS5qdI86AEu4JgKNsmZ7mndVYlEqJEs1KLX4zdqg2IdeccLAflircdSIQBDyllb
 pxnxH4XPtns1jS1M8/iPxNA4UCp0zdk+4UQnUkit6e1PyCSDpWOcWLg0mqwfZPJBOrTVwdRwOG/
 +VR9f6bs7x05O0rw/vLqa37sbwoj3TJEZjM6l7ErtH05pVa/6raIFrVyarcOVx7Gi9rB84NGfui
 sAoBq+byeCIYhAlSV9A==
X-Proofpoint-ORIG-GUID: Ysi96yFEG77RIgK-FRP32EJUClYmXYzq
X-Authority-Analysis: v=2.4 cv=GupyPE1C c=1 sm=1 tr=0 ts=69e1f35d cx=c_pps
 a=Kac4Oh/pgoirBk7HbaAweA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=PYnjg3YJAAAA:8
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=inLRmMHjSyNTGiKv4Y8A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: ztpyjTymlW9b9keFD0VfWWMdaSlrnj8-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_04,2026-04-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170087
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Apr 2026 08:46:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126429

From: Libo Chen <libo.chen.cn@windriver.com>

According to [1], A vulnerability, which was classified as critical, was
found in HDF5 1.14.6. This affects the function
H5Z__scaleoffset_decompress_one_byte of the component Scale-Offset Filter.
The manipulation leads to heap-based buffer overflow. An attack has to be
approached locally. The exploit has been disclosed to the public and may be
used. The vendor plans to fix this issue in an upcoming release.

Backport patch [2] from upstream to fix CVE-2025-2308

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-2308
[2] https://github.com/HDFGroup/hdf5/commit/2ce7fdc4cf147d280aa6d49686297faacc250e40

Signed-off-by: Libo Chen <libo.chen.cn@windriver.com>
---
 .../hdf5/files/CVE-2025-2308.patch            | 333 ++++++++++++++++++
 meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb |   1 +
 2 files changed, 334 insertions(+)
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2025-2308.patch

diff --git a/meta-oe/recipes-support/hdf5/files/CVE-2025-2308.patch b/meta-oe/recipes-support/hdf5/files/CVE-2025-2308.patch
new file mode 100644
index 0000000000..336a0d2697
--- /dev/null
+++ b/meta-oe/recipes-support/hdf5/files/CVE-2025-2308.patch
@@ -0,0 +1,333 @@
+From cbce4c2ecf6f5557605890eec125ecfaa4371131 Mon Sep 17 00:00:00 2001
+From: Libo Chen <libo.chen.cn@windriver.com>
+Date: Fri, 30 Jan 2026 16:43:04 +0800
+Subject: [PATCH] Fix CVE-2025-2308 (#5960)
+
+A malformed file can cause the scale-offset filter to have too little input data causing a heap buffer overflow. Additional checks on the maximum buffer length are required during the decompression.
+
+This PR fixes CVE-2025-2308.
+
+CVE: CVE-2025-2308
+
+Upstream-Status: Backport [https://github.com/HDFGroup/hdf5/commit/2ce7fdc4cf147d280aa6d49686297faacc250e40]
+
+Signed-off-by: Libo Chen <libo.chen.cn@windriver.com>
+---
+ src/H5Zscaleoffset.c      |  177 ++--
+ src/H5Zscaleoffset.c.orig | 1781 +++++++++++++++++++++++++++++++++++++
+ 1 files changed, 105 insertions(+), 72 deletions(-)
+ create mode 100644 src/H5Zscaleoffset.c.orig
+
+diff --git a/src/H5Zscaleoffset.c b/src/H5Zscaleoffset.c
+index fbf12d6..8355b13 100644
+--- a/src/H5Zscaleoffset.c
++++ b/src/H5Zscaleoffset.c
+@@ -69,21 +69,22 @@ static herr_t H5Z__scaleoffset_precompress_fd(void *data, unsigned d_nelmts, enu
+ static herr_t H5Z__scaleoffset_postdecompress_fd(void *data, unsigned d_nelmts, enum H5Z_scaleoffset_t type,
+                                                  unsigned filavail, const unsigned cd_values[],
+                                                  uint32_t minbits, unsigned long long minval, double D_val);
+-static void   H5Z__scaleoffset_next_byte(size_t *j, unsigned *buf_len);
+-static void   H5Z__scaleoffset_decompress_one_byte(unsigned char *data, size_t data_offset, unsigned k,
+-                                                   unsigned begin_i, const unsigned char *buffer, size_t *j,
+-                                                   unsigned *buf_len, parms_atomic p, unsigned dtype_len);
++static void   H5Z__scaleoffset_next_byte(size_t *j, unsigned *bits_to_fill);
++static herr_t H5Z__scaleoffset_decompress_one_byte(unsigned char *data, size_t data_offset, unsigned k,
++                                                   unsigned begin_i, const unsigned char *buffer,
++                                                   size_t buf_size, size_t *j, unsigned *bits_to_fill,
++                                                   parms_atomic p, unsigned dtype_len);
+ static void   H5Z__scaleoffset_compress_one_byte(const unsigned char *data, size_t data_offset, unsigned k,
+                                                  unsigned begin_i, unsigned char *buffer, size_t *j,
+-                                                 unsigned *buf_len, parms_atomic p, unsigned dtype_len);
+-static void   H5Z__scaleoffset_decompress_one_atomic(unsigned char *data, size_t data_offset,
+-                                                     unsigned char *buffer, size_t *j, unsigned *buf_len,
+-                                                     parms_atomic p);
++                                                 unsigned *bits_to_fill, parms_atomic p, unsigned dtype_len);
++static herr_t H5Z__scaleoffset_decompress_one_atomic(unsigned char *data, size_t data_offset,
++                                                     unsigned char *buffer, size_t buf_size, size_t *j,
++                                                     unsigned *bits_to_fill, parms_atomic p);
+ static void   H5Z__scaleoffset_compress_one_atomic(unsigned char *data, size_t data_offset,
+-                                                   unsigned char *buffer, size_t *j, unsigned *buf_len,
++                                                   unsigned char *buffer, size_t *j, unsigned *bits_to_fill,
+                                                    parms_atomic p);
+-static void   H5Z__scaleoffset_decompress(unsigned char *data, unsigned d_nelmts, unsigned char *buffer,
+-                                          parms_atomic p);
++static herr_t H5Z__scaleoffset_decompress(unsigned char *data, unsigned d_nelmts, unsigned char *buffer,
++                                          size_t buf_size, parms_atomic p);
+ static void   H5Z__scaleoffset_compress(unsigned char *data, unsigned d_nelmts, unsigned char *buffer,
+                                         size_t buffer_size, parms_atomic p);
+ 
+@@ -1261,8 +1262,11 @@ H5Z__filter_scaleoffset(unsigned flags, size_t cd_nelmts, const unsigned cd_valu
+         }
+ 
+         /* decompress the buffer if minbits not equal to zero */
+-        if (minbits != 0)
+-            H5Z__scaleoffset_decompress(outbuf, d_nelmts, (unsigned char *)(*buf) + buf_offset, p);
++        if (minbits != 0) {
++            if (H5Z__scaleoffset_decompress(outbuf, d_nelmts, (unsigned char *)(*buf) + buf_offset,
++                                            *buf_size - buf_offset, p))
++                HGOTO_ERROR(H5E_PLINE, H5E_BADVALUE, 0, "Scaleoffset decompression failed");
++        }
+         else {
+             /* fill value is not defined and all data elements have the same value */
+             for (i = 0; i < size_out; i++)
+@@ -1603,55 +1607,69 @@ done:
+ }
+ 
+ static void
+-H5Z__scaleoffset_next_byte(size_t *j, unsigned *buf_len)
++H5Z__scaleoffset_next_byte(size_t *j, unsigned *bits_to_fill)
+ {
+     ++(*j);
+-    *buf_len = 8 * sizeof(unsigned char);
++    *bits_to_fill = 8 * sizeof(unsigned char);
+ }
+ 
+-static void
++static herr_t
+ H5Z__scaleoffset_decompress_one_byte(unsigned char *data, size_t data_offset, unsigned k, unsigned begin_i,
+-                                     const unsigned char *buffer, size_t *j, unsigned *buf_len,
+-                                     parms_atomic p, unsigned dtype_len)
++                                     const unsigned char *buffer, size_t buf_size, size_t *j,
++                                     unsigned *bits_to_fill, parms_atomic p, unsigned dtype_len)
+ {
+-    unsigned      dat_len; /* dat_len is the number of bits to be copied in each data byte */
+-    unsigned char val;     /* value to be copied in each data byte */
++    unsigned      bits_to_copy;        /* bits_to_copy is the number of bits to be copied in each data byte */
++    unsigned char val;                 /* value to be copied in each data byte */
++    herr_t        ret_value = SUCCEED; /* Return value */
++
++    FUNC_ENTER_PACKAGE
++
++    if (*j >= buf_size)
++        HGOTO_ERROR(H5E_PLINE, H5E_BADVALUE, 0, "Buffer too short");
+ 
+     /* initialize value and bits of unsigned char to be copied */
+     val = buffer[*j];
+     if (k == begin_i)
+-        dat_len = 8 - (dtype_len - p.minbits) % 8;
++        bits_to_copy = 8 - (dtype_len - p.minbits) % 8;
+     else
+-        dat_len = 8;
++        bits_to_copy = 8;
+ 
+-    if (*buf_len > dat_len) {
+-        data[data_offset + k] =
+-            (unsigned char)((unsigned)(val >> (*buf_len - dat_len)) & (unsigned)(~((unsigned)~0 << dat_len)));
+-        *buf_len -= dat_len;
++    if (*bits_to_fill > bits_to_copy) {
++        data[data_offset + k] = (unsigned char)((unsigned)(val >> (*bits_to_fill - bits_to_copy)) &
++                                                (unsigned)(~((unsigned)~0 << bits_to_copy)));
++        *bits_to_fill -= bits_to_copy;
+     } /* end if */
+     else {
+         data[data_offset + k] =
+-            (unsigned char)((val & ~((unsigned)(~0) << *buf_len)) << (dat_len - *buf_len));
+-        dat_len -= *buf_len;
+-        H5Z__scaleoffset_next_byte(j, buf_len);
+-        if (dat_len == 0)
+-            return;
++            (unsigned char)((val & ~((unsigned)(~0) << *bits_to_fill)) << (bits_to_copy - *bits_to_fill));
++        bits_to_copy -= *bits_to_fill;
++        H5Z__scaleoffset_next_byte(j, bits_to_fill);
++        if (bits_to_copy == 0)
++            goto done;
++        else if (*j >= buf_size)
++            HGOTO_ERROR(H5E_PLINE, H5E_BADVALUE, 0, "Buffer too short");
+ 
+         val = buffer[*j];
+-        data[data_offset + k] |=
+-            (unsigned char)((unsigned)(val >> (*buf_len - dat_len)) & ~((unsigned)(~0) << dat_len));
+-        *buf_len -= dat_len;
++        data[data_offset + k] |= (unsigned char)((unsigned)(val >> (*bits_to_fill - bits_to_copy)) &
++                                                 ~((unsigned)(~0) << bits_to_copy));
++        *bits_to_fill -= bits_to_copy;
+     } /* end else */
++
++done:
++    FUNC_LEAVE_NOAPI(ret_value)
+ }
+ 
+-static void
++static herr_t
+ H5Z__scaleoffset_decompress_one_atomic(unsigned char *data, size_t data_offset, unsigned char *buffer,
+-                                       size_t *j, unsigned *buf_len, parms_atomic p)
++                                       size_t buf_size, size_t *j, unsigned *bits_to_fill, parms_atomic p)
+ {
+     /* begin_i: the index of byte having first significant bit */
+     unsigned begin_i;
+     unsigned dtype_len;
+     int      k;
++    herr_t   ret_value = SUCCEED; /* Return value */
++
++    FUNC_ENTER_PACKAGE
+ 
+     assert(p.minbits > 0);
+ 
+@@ -1661,8 +1679,9 @@ H5Z__scaleoffset_decompress_one_atomic(unsigned char *data, size_t data_offset,
+         begin_i = p.size - 1 - (dtype_len - p.minbits) / 8;
+ 
+         for (k = (int)begin_i; k >= 0; k--)
+-            H5Z__scaleoffset_decompress_one_byte(data, data_offset, (unsigned)k, begin_i, buffer, j, buf_len,
+-                                                 p, dtype_len);
++            if (H5Z__scaleoffset_decompress_one_byte(data, data_offset, (unsigned)k, begin_i, buffer,
++                                                     buf_size, j, bits_to_fill, p, dtype_len))
++                HGOTO_ERROR(H5E_PLINE, H5E_BADVALUE, 0, "Atomic decompression failed");
+     }
+     else { /* big endian */
+         assert(p.mem_order == H5Z_SCALEOFFSET_ORDER_BE);
+@@ -1670,67 +1689,81 @@ H5Z__scaleoffset_decompress_one_atomic(unsigned char *data, size_t data_offset,
+         begin_i = (dtype_len - p.minbits) / 8;
+ 
+         for (k = (int)begin_i; k <= (int)(p.size - 1); k++)
+-            H5Z__scaleoffset_decompress_one_byte(data, data_offset, (unsigned)k, begin_i, buffer, j, buf_len,
+-                                                 p, dtype_len);
++            if (H5Z__scaleoffset_decompress_one_byte(data, data_offset, (unsigned)k, begin_i, buffer,
++                                                     buf_size, j, bits_to_fill, p, dtype_len))
++                HGOTO_ERROR(H5E_PLINE, H5E_BADVALUE, 0, "Atomic decompression failed");
+     }
++
++done:
++    FUNC_LEAVE_NOAPI(ret_value)
+ }
+ 
+-static void
+-H5Z__scaleoffset_decompress(unsigned char *data, unsigned d_nelmts, unsigned char *buffer, parms_atomic p)
++static herr_t
++H5Z__scaleoffset_decompress(unsigned char *data, unsigned d_nelmts, unsigned char *buffer, size_t buf_size,
++                            parms_atomic p)
+ {
+     /* i: index of data, j: index of buffer,
+-       buf_len: number of bits to be filled in current byte */
++       bits_to_fill: number of bits to be filled in current byte */
+     size_t   i, j;
+-    unsigned buf_len;
++    unsigned bits_to_fill;
++    herr_t   ret_value = SUCCEED; /* Return value */
++
++    FUNC_ENTER_PACKAGE
+ 
+     /* must initialize to zeros */
+     for (i = 0; i < d_nelmts * (size_t)p.size; i++)
+         data[i] = 0;
+ 
+     /* initialization before the loop */
+-    j       = 0;
+-    buf_len = sizeof(unsigned char) * 8;
++    j            = 0;
++    bits_to_fill = sizeof(unsigned char) * 8;
+ 
+     /* decompress */
+     for (i = 0; i < d_nelmts; i++)
+-        H5Z__scaleoffset_decompress_one_atomic(data, i * p.size, buffer, &j, &buf_len, p);
++        if (H5Z__scaleoffset_decompress_one_atomic(data, i * p.size, buffer, buf_size, &j, &bits_to_fill, p))
++            HGOTO_ERROR(H5E_PLINE, H5E_BADVALUE, 0, "Scaleoffset decompression failed");
++
++done:
++    FUNC_LEAVE_NOAPI(ret_value)
+ }
+ 
+ static void
+ H5Z__scaleoffset_compress_one_byte(const unsigned char *data, size_t data_offset, unsigned k,
+-                                   unsigned begin_i, unsigned char *buffer, size_t *j, unsigned *buf_len,
++                                   unsigned begin_i, unsigned char *buffer, size_t *j, unsigned *bits_to_fill,
+                                    parms_atomic p, unsigned dtype_len)
+ {
+-    unsigned      dat_len; /* dat_len is the number of bits to be copied in each data byte */
+-    unsigned char val;     /* value to be copied in each data byte */
++    unsigned      bits_to_copy; /* bits_to_copy is the number of bits to be copied in each data byte */
++    unsigned char val;          /* value to be copied in each data byte */
+ 
+     /* initialize value and bits of unsigned char to be copied */
+     val = data[data_offset + k];
+     if (k == begin_i)
+-        dat_len = 8 - (dtype_len - p.minbits) % 8;
++        bits_to_copy = 8 - (dtype_len - p.minbits) % 8;
+     else
+-        dat_len = 8;
++        bits_to_copy = 8;
+ 
+-    if (*buf_len > dat_len) {
+-        buffer[*j] |= (unsigned char)((val & ~((unsigned)(~0) << dat_len)) << (*buf_len - dat_len));
+-        *buf_len -= dat_len;
++    if (*bits_to_fill > bits_to_copy) {
++        buffer[*j] |=
++            (unsigned char)((val & ~((unsigned)(~0) << bits_to_copy)) << (*bits_to_fill - bits_to_copy));
++        *bits_to_fill -= bits_to_copy;
+     }
+     else {
+-        buffer[*j] |=
+-            (unsigned char)((unsigned)(val >> (dat_len - *buf_len)) & ~((unsigned)(~0) << *buf_len));
+-        dat_len -= *buf_len;
+-        H5Z__scaleoffset_next_byte(j, buf_len);
+-        if (dat_len == 0)
++        buffer[*j] |= (unsigned char)((unsigned)(val >> (bits_to_copy - *bits_to_fill)) &
++                                      ~((unsigned)(~0) << *bits_to_fill));
++        bits_to_copy -= *bits_to_fill;
++        H5Z__scaleoffset_next_byte(j, bits_to_fill);
++        if (bits_to_copy == 0)
+             return;
+ 
+-        buffer[*j] = (unsigned char)((val & ~((unsigned)(~0) << dat_len)) << (*buf_len - dat_len));
+-        *buf_len -= dat_len;
++        buffer[*j] =
++            (unsigned char)((val & ~((unsigned)(~0) << bits_to_copy)) << (*bits_to_fill - bits_to_copy));
++        *bits_to_fill -= bits_to_copy;
+     } /* end else */
+ }
+ 
+ static void
+ H5Z__scaleoffset_compress_one_atomic(unsigned char *data, size_t data_offset, unsigned char *buffer,
+-                                     size_t *j, unsigned *buf_len, parms_atomic p)
++                                     size_t *j, unsigned *bits_to_fill, parms_atomic p)
+ {
+     /* begin_i: the index of byte having first significant bit */
+     unsigned begin_i;
+@@ -1745,16 +1778,16 @@ H5Z__scaleoffset_compress_one_atomic(unsigned char *data, size_t data_offset, un
+         begin_i = p.size - 1 - (dtype_len - p.minbits) / 8;
+ 
+         for (k = (int)begin_i; k >= 0; k--)
+-            H5Z__scaleoffset_compress_one_byte(data, data_offset, (unsigned)k, begin_i, buffer, j, buf_len, p,
+-                                               dtype_len);
++            H5Z__scaleoffset_compress_one_byte(data, data_offset, (unsigned)k, begin_i, buffer, j,
++                                               bits_to_fill, p, dtype_len);
+     }
+     else { /* big endian */
+         assert(p.mem_order == H5Z_SCALEOFFSET_ORDER_BE);
+         begin_i = (dtype_len - p.minbits) / 8;
+ 
+         for (k = (int)begin_i; k <= (int)(p.size - 1); k++)
+-            H5Z__scaleoffset_compress_one_byte(data, data_offset, (unsigned)k, begin_i, buffer, j, buf_len, p,
+-                                               dtype_len);
++            H5Z__scaleoffset_compress_one_byte(data, data_offset, (unsigned)k, begin_i, buffer, j,
++                                               bits_to_fill, p, dtype_len);
+     }
+ }
+ 
+@@ -1763,19 +1796,19 @@ H5Z__scaleoffset_compress(unsigned char *data, unsigned d_nelmts, unsigned char
+                           parms_atomic p)
+ {
+     /* i: index of data, j: index of buffer,
+-       buf_len: number of bits to be filled in current byte */
++       bits_to_fill: number of bits to be filled in current byte */
+     size_t   i, j;
+-    unsigned buf_len;
++    unsigned bits_to_fill;
+ 
+     /* must initialize buffer to be zeros */
+     for (j = 0; j < buffer_size; j++)
+         buffer[j] = 0;
+ 
+     /* initialization before the loop */
+-    j       = 0;
+-    buf_len = sizeof(unsigned char) * 8;
++    j            = 0;
++    bits_to_fill = sizeof(unsigned char) * 8;
+ 
+     /* compress */
+     for (i = 0; i < d_nelmts; i++)
+-        H5Z__scaleoffset_compress_one_atomic(data, i * p.size, buffer, &j, &buf_len, p);
++        H5Z__scaleoffset_compress_one_atomic(data, i * p.size, buffer, &j, &bits_to_fill, p);
+ }
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb b/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
index ca1e8d7076..b31a8d8cfa 100644
--- a/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
+++ b/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
@@ -28,6 +28,7 @@ SRC_URI = " \
     file://CVE-2025-2310.patch \
     file://CVE-2025-44905.patch \
     file://CVE-2025-2309.patch \
+    file://CVE-2025-2308.patch \
 "
 SRC_URI[sha256sum] = "019ac451d9e1cf89c0482ba2a06f07a46166caf23f60fea5ef3c37724a318e03"
 
-- 
2.34.1


