Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.1939.1632278840746529336
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Sep 2021 19:47:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=i45+fWi+;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4899b7e81a=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18M2gIwF022535
	for <openembedded-devel@lists.openembedded.org>; Tue, 21 Sep 2021 19:47:20 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=pHhjAJcgxZWYXhuyX+yztEIy4Dn7fEnFquIrSmMPXuY=;
 b=i45+fWi+PEJ8iQaRxKNWN6bTFcejVuDqZlhrFej6eTLipm8BcZagg0dc/mfJsczY198X
 ZOwjoqrS9avMXypj8HOb0Dv4wz5dI3WqeiLHwnNToOQsaTCjwdeJ7b9M+c0zOWWRN6eR
 96zPd9mS+oBmvQUoLMUMqDRRv/Dr9rVHcbjY/Obz3PscA8zipXtWB/yDfqTjO5O35eXj
 VHSoBDmFtKUs5zJ+XOKzeTcc3KNDQIw2HWZmpsfItnmsyYRagiH5LjZind7wCmBEVc/z
 5i4drKUF+ITNWHqrBmqoCoL47RYVQuYp3+11rrkhnXcREAcjxRMglFLf8jGZ+1K/JBUv yQ== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2171.outbound.protection.outlook.com [104.47.58.171])
	by mx0a-0064b401.pphosted.com with ESMTP id 3b7q3m85ft-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 21 Sep 2021 19:47:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aYdvVCeGmOvdSJfjRZrlnFCyxdhQuzPEvymERvaLdAoGwfYUti2231TM0tAjUyT22Dai1FhJqQPjSNz5U2HzKJfZZkHYtqn0eEN3euKCHERtdedGAocRAmRvxoOyTSKP0BWWPwo366Ir4s4JKpUAC9Yn7K9h8hdyqMd7N6DCUSGHzWFR1fTl+cI9+pAEwTyQeqc7S+ISaCAES0E2ZFfDgptT0gQrzc/8ri2nTt8KqsBFPn/poKZe1l7ARHPcXWupWBsFSgxE+zpvIP2gaS0JjAqcOyTqABVc+cfW7WcRMCqCkRrvCfsZetTz/vC9wNQDK7QieUsp81KbqgPFQ411SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=pHhjAJcgxZWYXhuyX+yztEIy4Dn7fEnFquIrSmMPXuY=;
 b=fTUR7KPaaLTVPe2Wql30Q2LEOdiSIkdeA+DmVzRbxKyS5CR59x1KApQDw7CkiOV+qzV+mGr6af5+2o15YWMvlql9CzwwHBS7PjcRMLQ8khHRHQ0m30m5/myJye/V6uwGdFcWYoCIfZJajKjgNmn53ec0LrGHiZLgUPdSaP6oh7WzM7cH3/wBnh16wHPr99OyS/Rg8gXVpQhbEB/sAaycvo40mj+Vf43Sa627fRyB4cwfhFbCJmOwX4mmGp7ZVpOMxeahGbhfs3UsoyYSaACUFdWe2RA5fLRUw49ZK4WFRIc60/8c6tySmQL5tFaekgRcShyXxuIbfus1a/8a+q9LKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by CO1PR11MB5171.namprd11.prod.outlook.com (2603:10b6:303:95::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Wed, 22 Sep
 2021 02:47:18 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::3975:1563:a18e:2017]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::3975:1563:a18e:2017%9]) with mapi id 15.20.4544.013; Wed, 22 Sep 2021
 02:47:18 +0000
From: "Yi Zhao" <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] samba: upgrade 4.14.5 -> 4.14.7
Date: Wed, 22 Sep 2021 10:47:07 +0800
Message-Id: <20210922024707.235696-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: HK2PR03CA0056.apcprd03.prod.outlook.com
 (2603:1096:202:17::26) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by HK2PR03CA0056.apcprd03.prod.outlook.com (2603:1096:202:17::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.9 via Frontend Transport; Wed, 22 Sep 2021 02:47:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e4ff09c2-dabe-4619-ddf8-08d97d734b02
X-MS-TrafficTypeDiagnostic: CO1PR11MB5171:
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB5171955FD2ECAF3A4F211112F9A29@CO1PR11MB5171.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:421;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	AFzfs+cWl6YNWLQD9F33kwPgLEnQ8ixvt1LkAAssTb9iBqWGzo3fhoghBquApXJiqsrG/U8NjEKtibgAkL+eoKKjmCAvZH3theAtqDdQuVBXVFQ1BGsFTiL5XIdRBrSaOAm0B7Scgf1NdC9uFYmzAsvF3UfjxPCrL/d8pp7T/6VPD+RP+zIKkz4l3axDQMFez8XxKnlf9zgT/t4i5eaNXkuz14MYChMbUFqEcIk4/J6ZJqGxEvHXVP3f51j1GgcJV01ovByy8UsI+obaiqs3gZkcQ9cvI9R5FWECZk3XfJb0IlVoZggUma9HlwdWfh5r0m2aII/TODyajpbF6khSTER6IXwPZoHkbdWo4mulyokl/kxhxYV00475f0lgy9cm6qdqwf9E2UBrrqUAOxuMx5TFgDeDF+DWYC6XV7/CXVUKZ/uLW0AloMVLbOVRgQcLfImmJsHSEsbVc9MV2OuG2Q86+MXzN58+30DU/4bmyeZLSnHJWQX0c3/Zn1uqspum4zRfwWRtrLO4d3ql4FW8YQKWZkOaf7q2fhYkI+z9+Q3MTxQUEMq3GDl2vp9anw/+3FLeK1I4MylCx1/KCTKiWQGSNaF8NAO4wYEVfVmMX/UsJzH7PKChSnkevBsIPDXRPKlQ75eJXkV/R/RZ2HvW1oJ4pg14XZ0d3BWLl3zhDLb3GzVRHng+SFRFiKthgzhZ/NEXCZ8upLMCdLn5WuIkSWMkogm0Qd1KGe64w3v4RDWWu+ueVBq+HBJgmyqz6GXqudCY17tp5BJdlTGhWeOPWcshv7THaUFRl0ALeFIj2NI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(83380400001)(66476007)(66556008)(38350700002)(6916009)(966005)(2616005)(956004)(1076003)(38100700002)(8676002)(36756003)(508600001)(2906002)(66946007)(6666004)(8936002)(52116002)(186003)(6512007)(6506007)(44832011)(26005)(6486002)(316002)(86362001)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?23R0kxhEvcR2zuGsNlhsFGp50S1gBSwsb+1ByCSOmGQK16tGpTwkRu0MpNmS?=
 =?us-ascii?Q?9dEoV9Dv8wp0HzkGpSQLblkcAETGPXtBrtvrIAUcvnMIWjCjQMniln9OG8Ps?=
 =?us-ascii?Q?nfsbsjO61qjnvV+gS7NNdfO6XWWNLxlNDtI2uZ7z8Jg2M99rFO7sVWNTXGiC?=
 =?us-ascii?Q?wqdtJIzOgD+y94Efm6SIkS/T0BXzaJBF+3wrdK4Izi4ODksBrRavUxLIKhkF?=
 =?us-ascii?Q?emq6r+cMk3Q7zNRDvO0DKI4TAYfQbhljLMiNg9WdCse0pNbaZNDGxhy1ONBW?=
 =?us-ascii?Q?JgapdrexIMsecw7bHE/s8vteOqK9PDPwSe08Sn4wJgjd6ljGeXrChEQfHqQJ?=
 =?us-ascii?Q?+QEQs6sP4PK+DME5L5qT3oyhyWcTni5PHgJunKSlHLlHex2Lk3ln6XNycAJo?=
 =?us-ascii?Q?vzP5Wy+O4WBfWTtexeSdYb7dOJ20CRFTP/P9CovLWdBCLG3Lqn2YCFVFuinQ?=
 =?us-ascii?Q?cQJOEIVuJBa0EYB//q1P/qPOgQFp3MOp8usWi42ayCj5dDXGS+7u6zSvMct0?=
 =?us-ascii?Q?5En/g8+qh87ccDVhZ4tnvTgf2Y5PolwsenMsCQH7Ea5P/GwNDkmrHTd0GdEp?=
 =?us-ascii?Q?oFe/pt6Rjw7fLxItcOJDSrHwOfokxKosE/aG56YoW92C3VPAHZ9bZyQdaD9l?=
 =?us-ascii?Q?xmt3Vn2/r18TzMs6XoCc8/ZVdSlR2CjbEuZzWNi5HnChCusJHWG4Q5Bol5b9?=
 =?us-ascii?Q?7lBV2iBTPbEfqWScvMI34K9gDTWBLk+sXa4L7DT9c8YP3PJtDgKMfjZJFDZq?=
 =?us-ascii?Q?NpWxgQ4qF6mPe/X12RFKm1OBW3oA5WrOWmrFy2h8p4m635Aciw68RAJ7I9CV?=
 =?us-ascii?Q?RxmH8cxO7A8K79oHf+NCuygNXAWvZt86RjKx37YjXKUs4GGaTrAJXBKpOLN2?=
 =?us-ascii?Q?zZRA7dscrVAtpm3RKnXFu26n+zXYph5xa3JWC+AHBFj3wYe5sTSDJFAKur6l?=
 =?us-ascii?Q?PrP5pp9kknnsI2J15eh6KU425P/Udh9P4xhTMokbkJP+Y40LLxWmGGeheqZk?=
 =?us-ascii?Q?wGStIlePvmnHpIZMCJ58KmGubzvoaTt2HwvzyDpcRBetC7bFvf+JvHpYFcF1?=
 =?us-ascii?Q?dxXE0SDAfAeXagtRoXo+TprjfQtt+N9sPaL8Q2JjEAQB2Q/vLko3zE30wzM1?=
 =?us-ascii?Q?67Oa1j1T+e2bVFMHwexep4ZHFimJGJWcaUKVyaUSNeOzs7A0yQ3e/fgBuz64?=
 =?us-ascii?Q?PRom7bePWqSLXHB6O6xB/xtpaGhr5iYX+e+kni7MGETxscEdSaQ2KNSD1uxq?=
 =?us-ascii?Q?0ScbLPRIUwdGQfQzgLVAc5oGmM+XxSUZR1U3x2C9H4ndUtXEeqD390iRKEJb?=
 =?us-ascii?Q?MgSMein5iVq7XK5WpgtE7Py0?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4ff09c2-dabe-4619-ddf8-08d97d734b02
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2021 02:47:18.6002
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +GZWjHqDERLW2dCbK1F2S0Ir7I3/UFcs8G794CSoxYy0glkUiXQySFTZsd0yBqEwQiAo22xB2wu4wmrBfW3EfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5171
X-Proofpoint-GUID: 3MrqEl5tcGtUsuKvyHi_Eo-z65h0wC8F
X-Proofpoint-ORIG-GUID: 3MrqEl5tcGtUsuKvyHi_Eo-z65h0wC8F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-21_07,2021-09-20_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 adultscore=0 phishscore=0 suspectscore=0 mlxlogscore=916
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109200000 definitions=main-2109220017
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Changelog:
https://www.samba.org/samba/history/samba-4.14.7.html

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../samba/{samba_4.14.5.bb => samba_4.14.7.bb}                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/samba/{samba_4.14.5.bb => samba_4.14.7.bb} (99%)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.14.5.bb b/meta-networking/recipes-connectivity/samba/samba_4.14.7.bb
similarity index 99%
rename from meta-networking/recipes-connectivity/samba/samba_4.14.5.bb
rename to meta-networking/recipes-connectivity/samba/samba_4.14.7.bb
index 2bc43e714..68a3f97af 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.14.5.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.14.7.bb
@@ -34,8 +34,8 @@ SRC_URI:append:libc-musl = " \
            file://samba-fix-musl-lib-without-innetgr.patch \
            "
 
-SRC_URI[md5sum] = "96d275e31387e6c403d6c16465d15b7e"
-SRC_URI[sha256sum] = "bb6ef5d2f16b85288d823578abc453d9a80514c42e5a2ea2c4e3c60dc42335c3"
+SRC_URI[md5sum] = "f0db8302944bb861b31f4163fd302f66"
+SRC_URI[sha256sum] = "6f50353f9602aa20245eb18ceb00e7e5ec793df0974aebd5254c38f16d8f1906"
 
 UPSTREAM_CHECK_REGEX = "samba\-(?P<pver>4\.14(\.\d+)+).tar.gz"
 
-- 
2.25.1

