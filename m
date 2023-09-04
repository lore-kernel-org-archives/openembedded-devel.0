Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47197C83F2C
	for <webhook@archiver.kernel.org>; Mon,  4 Sep 2023 08:13:42 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.43918.1693815216238995481
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Sep 2023 01:13:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=GuEke6Gg;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7611bda6b6=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 38460Njc032620
	for <openembedded-devel@lists.openembedded.org>; Mon, 4 Sep 2023 01:13:36 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=5Az+fRsI1eJ4h0ocXE
	a2n/jS/HdDegF9UlhWDlNjk38=; b=GuEke6GgBHu219WLBnJesqgeFtVPNQclKA
	3bunL6HC10XY+gIblnT/TOWxttSfW5FfQzXTVBDic+JUacyyz5VpVqaAIOqCRnYr
	zOSvXqnj48k3EOsZrhWydX6ThazBL9nuAUYVXSODOtpLnqxYXAZUer9KRVA7YhFg
	mg+eSL0eRNgH0/X2UAR/rpc9BMCsjvCsysmmuLzUaUkM6kUTxQ2etJnsOfu7dHRC
	iko40Qz91IGYJU/sri0Mh/btOESONyL7OnCARlWFMaHSVOJ23JvuY8X7qKtAOZm0
	hAsnnilTwTdbDp7NGUjqhZQ0Yi8lobVv5X+RKob+PzA+xzvvJOhQ==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2045.outbound.protection.outlook.com [104.47.66.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sv4jg1493-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 04 Sep 2023 01:13:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NR2in/0ZlxGanJsB7UlgvjfBwgHGcf5Kjv59BdYPYoPFm1e6c0e6vSX/9tGwxPUlHxvkAO8MmAUmnBNDocHJc1fa0LBSkZ6V8keOXBFgM268WeTLXJs8Fo59zYz+WtcMBEk1dS/flmGvig78yKa6BIN042uSELfGrsFeD32BIm6XLwwPWg99IpSyZ0cuOSP0PZ34Jpg/g+28uiggkfH5iXp3A6lCWIdU8/zY+1lMekHwTkEzX9GW4vE5tVCERieNyVZ4VziSod2nRgFD+YRHWtVK7OCqelIIYflTlAbwz1MxG3h+xfQwWB6qMXU6tHWvkz7dGMZdxLNgNCkRtBpZ4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Az+fRsI1eJ4h0ocXEa2n/jS/HdDegF9UlhWDlNjk38=;
 b=DdsRUYwlZ8ugPx4mYPXos0puq6lr6yFal0ERB8c+OMGfrQkCVdXbwrFP90SGqBtGrFGsUwBBGAg/EjPEtQ0L60+Bp+lW/PNJvVOezkZRaBPJpjsyJ5NrCsfITgzcU2OJktH2pF/F8CVTKI4jm7UafdzgUckgp4GlPvntFWtFr8QKTKd+wN3PRhTr2hPmPBTfuIvICai7d/9cZ/ra31VHnh+c6EGDtMPwsw7+rbufdSNi76QdqA7hhMhei8S585nMv/Jqpe5ezJlezxbL4QTsXS99Ma2++uOntiNBKQ877VhbfnGLiWlDV1LjYgtHrOOF1L53/zTXCQMo0PewJ7vDXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH0PR11MB5610.namprd11.prod.outlook.com (2603:10b6:510:e9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.32; Mon, 4 Sep
 2023 08:13:31 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::da88:58a3:bc6b:2e3d]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::da88:58a3:bc6b:2e3d%6]) with mapi id 15.20.6745.030; Mon, 4 Sep 2023
 08:13:31 +0000
From: Qi.Chen@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-python][PATCH] python3-blivetgui: switch from master to main
Date: Mon,  4 Sep 2023 01:13:19 -0700
Message-Id: <20230904081319.2610881-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.40.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8PR05CA0003.namprd05.prod.outlook.com
 (2603:10b6:510:2cc::24) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|PH0PR11MB5610:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bbfa09b-4fe0-4452-e1c8-08dbad1ed3ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	MHf5MNoCwUnYwBTp0zWitiC/jZA2jpkgfYE18O/TtQXUU7MfxCYxOoNyaiGyiOJC2IqmMi8mFH8or/GM2EoyJh/uj/nczJbcoT08Dmq2BpOcoTu8rVnDkwBOLHxIsTlN3MILuzlYe3d5/X+aw+aonUph3D7148lZjeFWTjWVkR0HVoQPkJXMi3X+62OqkPbphuAK6/2uXr/apPIx2aY2D3QARoZv0FLoIQW4befgkqQJD3ION3ify2qgFB4c7JA8REiQHyvKK3RQ5K5uQlGKWUVlU2Xvpviad0iRd4O0MD301r3ULIeYNMxAO/11DWDTaK8qwSz5quZFcKZFjt2Dqng6HzCjrZnq6ciIhLq4BwsDWCUh9bYEChQaUBtHEvIHv9XdJzEDMPjldmYRvH1RvaumHVqDNIX22/4VjbCL5yEowALdP55wqJQMK5VZBjrDsCyLy7u0CLn3QKtQFz86mQFhWsiaSb8tXoWXiXF9SAYky59WoLusqiXvGc7UUENtx9aRcZTe26U+fxfUYkljCjykdN51JaDwmFr+wqBiHoxXWywyhtur6dh72cqLoT9mz+DR0xXUVYwK08CP3UBzE00jVt+CDZ+gqiEG71xZC0OGgzafYVY56eiWMgNIN0ya
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(396003)(39840400004)(376002)(346002)(451199024)(186009)(1800799009)(52116002)(6666004)(6506007)(6512007)(9686003)(6486002)(8936002)(8676002)(83380400001)(316002)(6916009)(66476007)(66556008)(66946007)(478600001)(41300700001)(5660300002)(36756003)(38350700002)(38100700002)(86362001)(26005)(2906002)(1076003)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?R61mpGa+OvSAll9D/z4jbEbaYJ2RqMau70SeamJCljeb2lqOQouaPF70QgL6?=
 =?us-ascii?Q?yj8Q7F55htIdRk7AHxC1ikVygi8cgDnf8uE9Rmpel1h9svxFBxCHkAMKT3G5?=
 =?us-ascii?Q?J2TfOSeyahTcxhioTldQioCSkKB1KcncAtp9MPaU6Vv2kG3puLrB8G7Ly3ww?=
 =?us-ascii?Q?/uuX4DMHuIHmtkwLQ8/jWuZXHU7WuGT9pJAR8VVl6xOwBq9Drp25yxq43Jnn?=
 =?us-ascii?Q?7OJRCrL4uL1TUkkwroOwzUNaG5fRym/OdBVo9wM+SkSCGnrZsgHy4lOsfQ3T?=
 =?us-ascii?Q?ZNr3vgais9G0NljQp5xXSyPNxRKLod5ctH2tDOevz5uRlGz89VJ12soJvROF?=
 =?us-ascii?Q?wTu/gxh/sOW/Zsh/Tw29XrBlVDwexUcPdOKfMy3BkcvzbEQZxAPqLgKjY/yl?=
 =?us-ascii?Q?7fAmDOUk+Zmd9PFLfV6pZz2Ea0eGA0b9nBKRi2riMAC3U8Y/cDYOt8cPOzKO?=
 =?us-ascii?Q?qHSEIVw3ngCWWvuyXi00CYxck6tP4tDp+tOmFuR/3LKKSTCuUiaSbdsetPHF?=
 =?us-ascii?Q?k53nj9z/lxzyBoKXkzus0HhvhHAKPt+TT80lZ2A4uvL3IZj7I37lTQGKfshL?=
 =?us-ascii?Q?kf7D5iOEm7AGpz4kQGlZrKkuVOvhTo7tNUSDVptp44ircUNCNVmTPQbhSVqT?=
 =?us-ascii?Q?OMPKZV08SwEM1ww+WZkfYKsHqEjeBIYpPJYja+VRROL4Y6SnKjjc+eYaHJZS?=
 =?us-ascii?Q?4N9nYSTbe0rtUYpPpLOIlLRbcTYpzxfZkagxJEeaSuYZkre0I4mqToGC/NWS?=
 =?us-ascii?Q?AYBQBDkedVh85IxzMbJbO1HQOyHMTz8d/3O9JxpJLzIei49rts2kzz6LSKQs?=
 =?us-ascii?Q?+4B3CkpWPT9PLBfNHSPcOshD75bQfim77EchhHYW3NFjgr8tqLmOMjzZvbWd?=
 =?us-ascii?Q?I8MGpyKyQOkO1uCF+pK+uy7i1Ja54JAF6w0IsqADLepV7UFXpAezln23Cok4?=
 =?us-ascii?Q?sTsiKw2xHCCp6uQLz2eH3kdKeVy18QTixjfhMZ9mPbL5xJx4kKTm7Tj1Jedz?=
 =?us-ascii?Q?PdMt9deqiacqNJF1Y6KAIPFVXFJpLBll3ERcgA1gvrjVAZOTRXOoDymqg8Ee?=
 =?us-ascii?Q?btgBOlfCHO/zAEGqkS4jTTnr5vqqCXbYU+FVZl8fqkxjeURl1kR62Ca1pVe7?=
 =?us-ascii?Q?Mqh0Tyx1N13cSitK2O+viLRZ9TAnIrB4UfeEEctIQzFa0XpmfQzO4nUFdzzu?=
 =?us-ascii?Q?cpGnCDKX1ApoNe7VoRkotbe3ennGo/abyKA06L9bceRhwnX7IQTjHEvBOWFM?=
 =?us-ascii?Q?TwO+2SAKZO6chtwlUPfkNWbexwqhLwVkqc9KPlRnpUJlY8t2Y9LztKT0G8+X?=
 =?us-ascii?Q?yjKxoHiduQQaUVYBRBvKMZwtbd8TW3au2d7J8YTHF+s01x7kH0l8rkHaSzhd?=
 =?us-ascii?Q?eRU7hsb1Vh7iK2anG8GkpRQsf8z0CBhL3cXgJG8ZhzdDdSmbU88ze2ff4Jnu?=
 =?us-ascii?Q?y4Y5UOv2SDVigsKUKUohhAyKN629n7jMM8S1mZ+h8lZc59oi6giJKf+qUvAO?=
 =?us-ascii?Q?sE/3Ih7n1O6GA/wFivC32LoMphca/RP/Brw4idGSH6A0N1HO8wo/iL3vJvxf?=
 =?us-ascii?Q?0hY0lz42S4at4PlTWnCUa0J9gib0AnSscQnzdQ/3w/+QB4klfJGhuTVjFHRS?=
 =?us-ascii?Q?aQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bbfa09b-4fe0-4452-e1c8-08dbad1ed3ba
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2023 08:13:31.7459
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9ADou6P0a+wMwYxrjO9wjOfj16XZrkePn7jnxeTRLJ+PilURKFLl8gjxhgf3VboTrcme/g61O3GkVAKkicFoXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5610
X-Proofpoint-ORIG-GUID: hYZkqWrAkcyvn464BNbtPkOVxpE6vvno
X-Proofpoint-GUID: hYZkqWrAkcyvn464BNbtPkOVxpE6vvno
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-04_06,2023-08-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=756 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2309040074
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Sep 2023 08:13:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104705

From: Chen Qi <Qi.Chen@windriver.com>

Switch to main branch to avoid do_fetch failure.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../recipes-extended/python-blivet/python3-blivetgui_2.3.0.bb   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.3.0.bb b/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.3.0.bb
index aba127897d..42bcf4651c 100644
--- a/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.3.0.bb
+++ b/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.3.0.bb
@@ -9,7 +9,7 @@ S = "${WORKDIR}/git"
 B = "${S}"
 
 SRCREV = "42512ee48494cee71febf04078d9774f0146a085"
-SRC_URI = "git://github.com/storaged-project/blivet-gui.git;branch=master;protocol=https \
+SRC_URI = "git://github.com/storaged-project/blivet-gui.git;branch=main;protocol=https \
            file://0001-Use-setuptools-instead-of-distutils-in-setup.py.patch \
            file://0002-Use-symbolic-list-add-and-edit-icons.patch \
            "
-- 
2.40.0


