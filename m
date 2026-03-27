Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF28110BA435
	for <webhook@archiver.kernel.org>; Fri, 27 Mar 2026 07:43:50 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.67026.1774597421762031296
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Mar 2026 00:43:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ZSA4yN5O;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7546e51c1f=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R5XYU12780612
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Mar 2026 07:43:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=iGFvvSUWmDs8UgN8Ve6Z
	A5MIgW1YDhnBSKdOi36vBPo=; b=ZSA4yN5O+yY3S0o8W3VxBH5bd7uaWtJPPaip
	upq92Zkg+xO8dhlrkt040t64xwBVyGEkqZfjTx2uS5gbCAfTbteddrOU9n+Va28k
	/Rdz/V22l7FvxnoRGHmY0bkhXkFv5YUDQA0r0y38mda5Kk3giUFbCYcQvZJ+SJMk
	ZTKNnJrOdVJwLz9/VbhCyQsNV9dmPqxTIbKlXBWrzplkqmlBAheiBUlQUo+mRiK7
	EUy9gHFkKeHuyVzH8VZHc8QiQq4CW9vDgTwD+QBxFfz708x9TH4vqk5NLa9qpQJ+
	Bu7dk8jWpMPwYyKdxaIJLo9E0PLtK2Re392gfLEX+YIFeGqF9A==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012020.outbound.protection.outlook.com [40.107.200.20])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d1ja6ypav-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Mar 2026 07:43:40 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rakflp4So1+K75HMfPiD2l6HOnrR+Jc1+0/W2Ws0LWMcoJGsg9mzdyD8Df9hrEb8HhCgDcvsfC1gpA2FISCuBui02v+LNpqK3iCNE5OPyfJPioKLri5IuCbngM1CZ2HBl0k4L+NURaZDj4OjN/zj+uJlw4ZhR48WFkluTcVsjIF+bFSgYjXdfbbN7v6BnHknjlkyino60zSYqTBMl82lgZFqJyBWXcJc/2yRD8P1DgmC0AW7xRimPMYEvuQgTti3i09c//a75Uel69POinZFMaBwDH9tYN2m2mEg7vgvDMKvpqM8OLvFpOECzMOX6vdzSVxaTlOJg9zp80eRNTwQ7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iGFvvSUWmDs8UgN8Ve6ZA5MIgW1YDhnBSKdOi36vBPo=;
 b=dYN75X7W1L70dTGxigdDiQzTUokmY/UpqyQzVeWswfxVmCacrEVlJaoPKFtK7sGoMLX9SmErhIiSb4BVWobnzgUTMMUYraTJKceH3YE4bVq6CX6s0Rt9GiWjg/HfLUd/EugmiKZRnOkewXoyGkOsWGJPKHw2GqJVpPwITPu77ipbJTkVLmwA7AcEbEuGWrsC/NzCw2cyb3LGJPpdaANO4JlO/RyFJkQBGqH1viXoVGk6eWTZlMZi2w8/3Ma61CnzGpJaggF8J/JsNGCCeYYZu/9zyyJf21SaHGxyXq/qMvnd0QLoeKPX7BlPtXIg5hcBWfKQVzULKU4VtzmbhWCnRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by PH7PR11MB6380.namprd11.prod.outlook.com (2603:10b6:510:1f8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.8; Fri, 27 Mar
 2026 07:43:38 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9769.006; Fri, 27 Mar 2026
 07:43:38 +0000
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] dlt-daemon: fix do_install failure
Date: Fri, 27 Mar 2026 15:41:03 +0800
Message-Id: <20260327074103.2222755-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: KU0P306CA0008.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:17::13) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|PH7PR11MB6380:EE_
X-MS-Office365-Filtering-Correlation-Id: f29280a5-9270-4610-b14a-08de8bd48eb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	fX2KlOS3n17RaXkowwXCTL0OZTFYBDZUzIDMqIqWnA1Yo1C9bOGWYybQCixMCTAcmhn0xHeulAaO1Xubo6bLg9m25UoCUPxfYhQH3neZ90KobajJanI/BYcZ5E7oE7WNMFQqR/gTlUoVOv6VF6Vl64xVlqd55wB35GLJMogh6uKBysXY5Dxb17fr6QIHDAOGtTKFdwTyFT3ff6ZhwGwqiOBZI4sHoUKwWZqyYz8ZT2LHk3bZw9AsDR42E0TFYpGD8xdMnlycMzmt2JM3/9jPivcymy5ztbS23cHn2vqEnlGG/y9g2MxMtmuJqHbvLiTD8tKEO+7SZQQRnFaRvVrm32raR3jPYXIEtx/0R1yJodpcZ4kG7daRuBQaTzhwBnzL3qyPA+Ir63g1xVXCKq5gs49KoTGZ/fUGNiZQR7mo3OABLAOu6uddDropN+d68BxeMPV3IaNe3LS4xeSa1mcBYLfwQGF3qwFFH+hFUCAtYiDiQ8r1mGgKlc+RLHCqNDqClx8zypW3TgOo63Q3uDfxK7b9hC27xuTTd/S6qY2PLL16fWBPzOFO3pgFt2jrZ9FsVmlaAMCmRkJS4mQJeKR+8c0q5we2UVP3gvDgwQ8DWIVkuha+ZvizDGIQvFqAT4TGYKZKwWoRfeTiXY9VG35nloLED1CHfJmJZJtk9e+CoFQ1ABgmLoreS/aL+HbkFOSRw8YcjRokykLYGq6ULx+AKpcvv2iumdDpCz9XBSPFZA9Kiyu02lNgGzfe7iMP6+9QXg3RYwiOd/jnYtbC/CNELhgVtTBV4rgXhg3kK4tJZOc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3Bg2H/JmpzybaLyxrUL5Xak4Eq97iJCUbO/VavIY/Z2oaJEYL5X2oLkv9W5f?=
 =?us-ascii?Q?iUQXZz1r5+Hadv37YOG4iBF+KYNGTgS0XyfPh2oCrm5eBg7BlS53IsRvMV7s?=
 =?us-ascii?Q?G0tn3bvsHHMZFCwprhi8BGCT2faL4J1E+ZndH8phWqu/yFBCiNsgUcdep2je?=
 =?us-ascii?Q?yyyoCG4k1YHrXR6ZXm2y79bbIz5i+KinTMT/y3sj5uVgfVHmc7aIkCdgfQ2r?=
 =?us-ascii?Q?4xI6bZg2c866Z8M5Wol1CyqMRsZ/zT/F4OUXvHXnkeePEPUSWtf1e5lc6TJc?=
 =?us-ascii?Q?QokbAACpjewFe6tOXGzMUEyKDBxvy7NoxBVUfYwUZZ30qbIvl+lPMtJd9nD3?=
 =?us-ascii?Q?ewbircj0KN7cgrxL94ox4yGWuIS8F4byMa3qaJvZ5Ltbj0CV0jr0XW8R2u7Z?=
 =?us-ascii?Q?QK/HyJNkTSPlW2u+Eii1N+NMDAUFmKVPb7KeXxJPT0E4Oe4ioFDJeniPXKaX?=
 =?us-ascii?Q?cT6A/Iu8yJmgq0LoMe+iGMgOK2EEeQG9mlnDRb4AH85TL0sFOT/Bz4WyMkjW?=
 =?us-ascii?Q?Eg4SmJPoWWbioesQy9jYo4qeHX5DiDu7kWaFVX9RNw6Xz4ATD88t6eMveJOx?=
 =?us-ascii?Q?SKhALkFIkxnza4F9t63NOPPU2ikvy9CNBjUyD9ivGOb9qt/8kgwpJR2Bv5uA?=
 =?us-ascii?Q?TjyHki3wFEpRMRH8qSE2Bp5+8vKRC6v4d5Z8JNH1ewJ+3/4ed8pwzTLAC9qI?=
 =?us-ascii?Q?gINO5pQPpu1FIY5lC1uInn6UOhnKDcLN0qX6ANBysuN+uG7Mkm+hB0YtspqS?=
 =?us-ascii?Q?BflZy0S5GGdAyikHva7gbhctMEb217QRhn8+SEBcrSUAMFT4L/jN3NjA23Ci?=
 =?us-ascii?Q?yYiYSiU8u6o5a+UzS32MqGkHluJmOLsPkJPgh2t/REO67JAPZkB5pU/WwQ3j?=
 =?us-ascii?Q?qUU7wzrp8sV99cc4AxqlkYYjP43k5Tc/iyWy91s98KUcJJIkdI0COUk7fFte?=
 =?us-ascii?Q?Sa9k7EYXcvxpbooQ6Va8pHfA7wtacDBpmQypem0X3WLrmQiJlQSM8lC+Nl3+?=
 =?us-ascii?Q?m6e+JhA7An2IObCE0+QahoVdTeFZ2sIs0QXidRr2ks4BJJJE5zOs0+I54wj+?=
 =?us-ascii?Q?92gGyHUqxcCvl1w9s55cXERBIHbJpa0vfRMSw14PV/cSzV5Dj10J1RUCsjCd?=
 =?us-ascii?Q?C4UJSOqhAipN6eA8pAKz935ep44QGM+vH13XTa/iv6R2LZHtOlSAJLM8ATsU?=
 =?us-ascii?Q?BxhwHXEpRUpF4wjzdTu0VyHRDVc0SAnRwRCgiY00DIvuggox+acrdO9PY3Pg?=
 =?us-ascii?Q?xnnJCwFC2ABpsX+s+Yu1YePOEcEpS2Pgp9pxrkzWiBzzOw/2e7j3lHti4Uem?=
 =?us-ascii?Q?JeE33c2PZMplWfhfdbX2KenR7PRQ4/6pXBknt04pmp6/lWjEGdHU/Jjo9pQW?=
 =?us-ascii?Q?TJ8OkqQDka6x68WomwkVvDd8XYawzCIAdU8PX3tCBYDtIiQnZz9ac/7JPwhg?=
 =?us-ascii?Q?q/ZKXHQ0s/aVpXQx3ESugBK+IYl/Fwe0NMekFHL9HHLFPKwjNKXUxWIZ4P4b?=
 =?us-ascii?Q?9Io7M7nKrYZI06og5iE2QL3Soo/TYBWeFb+u+KCGiuEovajdkZZNeIexRHT4?=
 =?us-ascii?Q?Ir0M9ocPqZfuGzd+TI78GC8mAn/hNWY8mH5DpUkK3IqxGlWWhL5KdjTasmkQ?=
 =?us-ascii?Q?HtNBF83C0Sk1iHyjk/2vOmU9ueI7zuXgUpW1tZ/VJ+48QYNiT+jjBypUwSzT?=
 =?us-ascii?Q?Qg/wSRRTiTsb5McJtYRZbM2UyeMqgnZiAAI6SOmDpTOv4iZgJbtrWDdqduVB?=
 =?us-ascii?Q?RI/nhL1Yff7hkUi2Hw+wcm4finDaXEI=3D?=
X-Exchange-RoutingPolicyChecked: 
	muMlycNvRO+lroAteXXX01wKMl54hxd7HjG1mOX7gPIc5iVv8QnF7eJ+DYwZx5j4trbjT1mp0bzld5tJ+NV3U0hV4U0zaGTnKK6+DLobu8UAnDK2qzO6OHNawVopGeeomeXdIYVJmY53NIEUYvm7yasH4PZi+joci6MBCZgeyV+4/dtuYENtPUgiJs2a56cNvGsh9KwkkmgZYjMukFGeouHN4mfm1dBCik3G90PpRkckErzNtFB5Z6+/au1yyQ26kUvZeT5qfggdLnRUy8g48w6zzrgCwyHKDgXZCA5Cc8kTRcxc1mZuGQ844V91htbKXF7k43H0RsDuDm2O2nA9Xg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f29280a5-9270-4610-b14a-08de8bd48eb0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 07:43:38.0021
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1oswEvv0/pg5TzvK7MFaNJH+n9/bvU25yZg6EQzySDwM2ay/1dKfkqVPBHBkG7juod1iGcsqA2gH374QkMlg182mOQWQbo5L+JQrLi3qcuk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6380
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA1NiBTYWx0ZWRfX4hA80+HWO/24
 IaK5veNeiFC1dE7ztF1ukGkMW8bU6HPKmDkDTg9v7TnSwYFbdOR+s4olqigIHhWRQIv3yO2yOMH
 GpiK7xIYbaPOPdXyBXM4SZupF4Z+LZa4IbdQqEhr008GxeOWDYOq7DLaCA4WlMaAD3wMUJau7n1
 TAvD6KwWis0O+SsPDRj0U0hXV9fwEJCU3XTff6/q8t5pRvvZ+pjHDU4yp+fjtVS01sJag2VwRFf
 fiiRH7D1TNcvJugWvSk7u3UpU1sxc7yxd2TWgIN0P9T00Y6GQW9H0f/q3MSSpTdKFZGYXa+qn8i
 Kp8C3r1L1QPkzcdzaKsoqhPzXip80PMfXx7pns9n7TtvGkfH1Jmy1QVehTXAGKdUUm2Gk/nuEHx
 sI3Q5o2Tr6N+rnz2gR0cDFgyhI+t3Fz1DDmvBjiWsKB2UGK3T6de5pUQ9ONNV0L0TFJVtbOGbRR
 gEmbMllIz3oVs7EJqKA==
X-Authority-Analysis: v=2.4 cv=Q5vfIo2a c=1 sm=1 tr=0 ts=69c6352c cx=c_pps
 a=Og0UtPbLppQH9mpfBaDriA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8
 a=PEhX8iyEeeLNReY7-oYA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 95k3d9m7_K64k3QgAogbb_xFJ2wvbKnx
X-Proofpoint-GUID: 95k3d9m7_K64k3QgAogbb_xFJ2wvbKnx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0
 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603270056
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Mar 2026 07:43:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125777

Fix do_install failure:
sed: can't read ../dlt-daemon/3.0.0/image/usr/lib/pkgconfig/automotive-dlt.pc: No such file or directory

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-oe/recipes-extended/dlt-daemon/dlt-daemon_3.0.0.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_3.0.0.bb b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_3.0.0.bb
index 5e80acd67e..431e9f3067 100644
--- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_3.0.0.bb
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_3.0.0.bb
@@ -72,5 +72,7 @@ FILES:${PN}-doc += "${datadir}/dlt-filetransfer"
 
 do_install:append() {
     rm -f ${D}${bindir}/dlt-test-*
-    sed -i -e 's:${RECIPE_SYSROOT}::g' ${D}/usr/lib/pkgconfig/automotive-dlt.pc
+    if [ -f ${D}${libdir}/pkgconfig/automotive-dlt.pc ]; then
+        sed -i -e 's:${RECIPE_SYSROOT}::g' ${D}${libdir}/pkgconfig/automotive-dlt.pc
+    fi
 }
-- 
2.34.1


