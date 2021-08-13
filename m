Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.32679.1628829752638759591
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Aug 2021 21:42:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Lb/S4yAF;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=38595f8eb2=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17D4dJ6g004117
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Aug 2021 21:42:31 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=bSZxdcUMKKUBPKosWb9BUEVitM145NRwwhpuvKmvlvI=;
 b=Lb/S4yAF4a3/HcTsiAme0U49cWwfOMTQTzSnT5CO9IXsGAq2KNs76d5NK9ce2jW5FzZP
 hfQxGt6VqJBqY1seTL8o7NNi09VfE/TqXxe+b0zjEJiKkuG+hCDd2LZHuXjBUOmd3XLJ
 hO1SefgvRxxAYC76KljMRzJ5mOpkFyee98x+Xog3c1ZIoXsrSoN0rZPWzH5zN0Sx+d2L
 gR7BnaA0CXYq5W3GEHWVqLIW5g+AoTgqnCcQQICaOix32m4n+oYIsDazerOCrGtb1uUm
 zckPdi4p9wxZZxIC45/Zundde446UiZKTLMQ+3/PqRXGksigO63jfdVgehxAu90akgGy lg== 
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam08lp2048.outbound.protection.outlook.com [104.47.74.48])
	by mx0a-0064b401.pphosted.com with ESMTP id 3acucv0w8g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Aug 2021 21:42:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZrrRLj5pqcWe4EnqBPMvpeXf1zkC/HiXT0ipkkWXoV8yP3VgygvAxwePIjPnGQO0iRQi0nEeUTX4YlUAcAnTvhAw5Clj2Q37GyPj/0HNErcznVltoHBdQ0yOR/kkxyAZDmvHqYInqsxTH5bp/Ll+oAyMwzZx0h4ZwWZpAhWIJum67EVPaO0nj+t+8B1cvGPE9Zp4LupNlIwj7Quvs/2TacG9LnqSFjTDMSdWrsnN9X0/M8wOMNnrfedK5tTx9MSfDIo5PsidzI1QrcziZ0669gdV+fnwb9TOJRK0nx9R0ydMfrJtOYPMxUifD/R8kgTq+89e2jWo5FANTJnm+swv9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bSZxdcUMKKUBPKosWb9BUEVitM145NRwwhpuvKmvlvI=;
 b=CEvw0bELr63ZfEP03YGeMEtJIDl+eddpw6n6OLFpBGEvmtPgZe9d5+BSJeYGgf21msJsKaG85Oryp+WjPaUX+nAX/B8hKOVTprOGqfuwk3jU2U6x90ys/dw/tzHPd4K4aypXRAhgUyevNJTIW7sddPS86ZiuL8nchzm0C8WQMtrXMb6bBAyqi1hZuidPv/atnNR5rymvqCillQueCgs64U2yf1rr6bcnegEl+LBEJ/+9tX07VmAvf4zgEVQC8Qt21AO9qI/r1fCU6J13fup/YC3WlcUJ9EdlS0pR1xpoT7PMVtdAFHxgV4p8pOdP2bU6gznw3Ws+zMvp/sJRRcd2dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MW3PR11MB4620.namprd11.prod.outlook.com (2603:10b6:303:54::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.21; Fri, 13 Aug
 2021 04:42:29 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::fdca:2b03:6e20:2d99]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::fdca:2b03:6e20:2d99%2]) with mapi id 15.20.4394.021; Fri, 13 Aug 2021
 04:42:29 +0000
From: "Yi Zhao" <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] augeas: add selinux to PACKAGECONFIG if enable selinux distro feature
Date: Fri, 13 Aug 2021 12:42:11 +0800
Message-Id: <20210813044213.125664-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: YT3PR01CA0002.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:86::10) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by YT3PR01CA0002.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:86::10) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.19 via Frontend Transport; Fri, 13 Aug 2021 04:42:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 679aed8d-02ed-4a77-277e-08d95e14c1e5
X-MS-TrafficTypeDiagnostic: MW3PR11MB4620:
X-Microsoft-Antispam-PRVS: 
	<MW3PR11MB462035F931FF3D19D49C99C9F9FA9@MW3PR11MB4620.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:312;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uL39UtQWCfBmIDbsSuabpIq4OjIuisXxf/d1vH48CljMdPKBhapOhG09ZJJbo68rePhYcDmDGWPtA7VnGb6/2FVKUgOV80UV3HK2WFpcTTyENRdp3tjslga4AxgV62F9KC+a1L2PnW4OFTMYUqmyfZPFIjgvj0KVA51rbAKsRcL8Nqg7Qlo+IHNNSx47HeVmPTSog6vUU5nWTDtz2VSuPi/brcfAht8tQs3Uf7gBpbsgmAZkKrImyzbF7GgUcKuKKBLlTDN2sFBxFnstJ38hN/i4n/VhRYcVFfdSerIUqWbK4CMJxkFPv06TXrvQNbbZmmgmcuge1gHicCjl3tupDKrkC563YTZXXZY5HDZXrfr+9reJtkZ61b2loqq8PjhJRNlYEa9K5RMvXo2wBQxNxArzdCRc238+q3PB61hWpASYxE5QmNiBvQaccXTe3iZMNMWrM8YWVwrp0KWT8w84wGYP7G0CBoXjxYZZ2akPcxYm9imK7JLfJQPwyYPnYh6aCZmhIMcNiQ+AF51biGcVQFRFHQEpz4j6ckp+IVLLvT6NqeOBv1H6L3gm/Befl1dcyuwGdM3qul+jGmJxTEpPbUhRUKc3ERMx5P5ikbIRuIOmko782BW4cmDN7ajfrtFCA5Gv0Pjy7IWfxljJHSzUl5A6JiEt7ngQhoCQuStsJlHShOmp8LU7hYzwnOPAv0nco2WyEC30fz5d7+kHFNmOrA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(396003)(366004)(376002)(39850400004)(38100700002)(86362001)(66946007)(66556008)(66476007)(52116002)(8676002)(8936002)(36756003)(6916009)(38350700002)(5660300002)(478600001)(83380400001)(2616005)(956004)(316002)(6486002)(6506007)(186003)(44832011)(4744005)(2906002)(26005)(1076003)(6512007)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ct6LzVGxpDPB+BZ/cXhuuMFwmS59nYoEoCl6vmnWD5EG0ABbK4V+/yg5TUDS?=
 =?us-ascii?Q?AI/FlPxLKonWG2giXUrm8+Hruq7w25xA7uqoYl92RKx3cKFFWAU5I1MpDFFM?=
 =?us-ascii?Q?g5JfXF/Z9DBL95ZZ+Tjn2AvfsO3AiYSmzTnLsCYbtYafXS+IaPeVn94lqDwC?=
 =?us-ascii?Q?StNzxOib2x4y8VHCtYiMHE34kD/1rwuliqYDn0UhzGjwd6x0fRvrG3pDEsfQ?=
 =?us-ascii?Q?47VlkRxSOAJOeQgNLBO7IFcdxu1XwvgXIRVrcIb2nbFHXQqIAmpne2JOM9Gb?=
 =?us-ascii?Q?ovZU9wY5WBMT9SQkpdq9w49iMMeuVXPJUWoe0vqDknZdvq4PbCy9V6UC2Aa/?=
 =?us-ascii?Q?ivVxMey0gsIRpcf29aoJUV2bRWguauuEZIbfbm3mE3mzVwXZAHk2mbhLwDZe?=
 =?us-ascii?Q?zvEAc3fJIbpP2XRUTQcBlPPUPMmqXGZ7qr0uwIqArvdxc/ucNJfJLXi05Ekr?=
 =?us-ascii?Q?XRbOBeSZ+g8ilt5zs/Oo6S1S+0hWS1/EU1/7ArjOMljEUbTSKoYzvFu4+Q7c?=
 =?us-ascii?Q?IsHv6pX+lHD9p2I3kv2ngwsP+Ri0q9eAQuPV82oU/eBHqP2FY831c9+gxhlp?=
 =?us-ascii?Q?EzLxiVoadCc8v5KbA6ounucZuIIOsPUewRFmjBSyPZXXsRS18k+HB2FGUTL4?=
 =?us-ascii?Q?eazbEBQNPlt7A5h5uYWQ63xyPOneOcWDKUlLV4KaUQbv3UORIGwhXRHBe7kt?=
 =?us-ascii?Q?fPiUXcbb4XuGhcZpg2CyVogTfh2bhNAo1Veu+HRmJ5IwJawa0UsKFlio79RE?=
 =?us-ascii?Q?CfNsrGvLIqEgHqvaicsS/JSkqAcvhFUtBzhAT34AHEoH/hT/Y6BtBlIX6mrs?=
 =?us-ascii?Q?cyHksnjXmOLfbDIjzH/JUr8n5rSijLP5tELy4171FvsLTcPORyjMUJdFipHd?=
 =?us-ascii?Q?NKT12ehuOHqC64Xwu6CdwlE27VZtMuLnX+juheb+RNI22cW3r8yhIWQh04o5?=
 =?us-ascii?Q?i5GZAQ+JDHtbziXx3fKmAdC+aAGX5RXgh7SKL4gTKMxPx1ppcFefrhseh3WS?=
 =?us-ascii?Q?5Dp/uqqpiTW2qCpOQ32n7ZPIAVhDaBTDmfnQwSOUdxU/Uhns5/hICWRFsHBS?=
 =?us-ascii?Q?u6woIFhDQ+iAkVVf4U6EzLtdaAl9miE+ImDbgQlgAEUGGwmbczWOVFZP4Zlr?=
 =?us-ascii?Q?8jecCsiZJ58RX9CcWSzk5JKMhIDRSuq8ApZa5SMflpH3Wmf6YDQmf+Y94mBB?=
 =?us-ascii?Q?gYOus0lnpl41wFeCz4V2n58yQ9kjUV3vTd/W4cxLdY0iGnllEQFuLaHigXjZ?=
 =?us-ascii?Q?NQj+3qwTskgwViEqjUnwPNSc6e0j2KANKCLQRYdD9EiDGl/u8sE8Eh6W/bli?=
 =?us-ascii?Q?YGpNAhHplND2OixaMhJ+/Icb?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 679aed8d-02ed-4a77-277e-08d95e14c1e5
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2021 04:42:29.8916
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qSk6n+SBozAzPB6bCKV/idX50AmFc7t79OVGB1Eqy6cgNrP1+oQ1VI8QVQNt5aWKeWYDKjfmJyqpSqV0uDalGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4620
X-Proofpoint-GUID: tomhmliyBTJC23wNtexiceXx3CP__Nc7
X-Proofpoint-ORIG-GUID: tomhmliyBTJC23wNtexiceXx3CP__Nc7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-13_01,2021-08-12_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 bulkscore=0 clxscore=1015
 spamscore=0 mlxlogscore=765 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108130028
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-support/augeas/augeas.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/augeas/augeas.inc b/meta-oe/recipes-support/augeas/augeas.inc
index 23a057135..d83ba493e 100644
--- a/meta-oe/recipes-support/augeas/augeas.inc
+++ b/meta-oe/recipes-support/augeas/augeas.inc
@@ -27,7 +27,7 @@ do_install:append() {
     rm -fr ${D}${datadir}/vim
 }
 
-PACKAGECONFIG ??= ""
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'selinux', d)}"
 PACKAGECONFIG[selinux] = "--with-selinux,--without-selinux,libselinux"
 
 EXTRA_AUTORECONF += "-I ${S}/gnulib/m4"
-- 
2.25.1

