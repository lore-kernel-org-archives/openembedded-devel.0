Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67804C77B73
	for <webhook@archiver.kernel.org>; Mon,  8 May 2023 10:09:28 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.103677.1683540567914208245
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 May 2023 03:09:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=TI9BWBpo;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=44921be6e8=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3489oa0g023695
	for <openembedded-devel@lists.openembedded.org>; Mon, 8 May 2023 10:09:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=a6CcjNNV5EGaqonvWZiFa8zfS9MUf4tvxo7WG+4NZ+A=;
 b=TI9BWBporthbuaUxHgtvxet6qfqxN7ULLc5EH7BOsn22Huq3wfEuQDY6S+6ILAK/rbUg
 PlC0g6WJRuVDTNw2bTNu6UZEk6tQSgwKEoLhxTwueZbs2OlCzPwjnW+HN1EMdLfxAzbn
 5WJEqrE6QwxlfqxoSVEr34NqEKQ1HJPPq9nwqHuoJGLAoWxOao0S7XEbUz+wlwqvgPkb
 XTTsgErZSlr/9Ot0hTrHJQ2qio/1eeaC8x1g9r4Xbmfhu9Bneq/tK7q0iWr2Ww9SC1eh
 rjE0Ro/5Ag7AQWfdr1agpG7mujbNrc4E4nC5unBZrt9UG0Qta9nUvk+wA4iy4gOnjo0V Pw== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qddvc1jyj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 08 May 2023 10:09:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bn6znNaBlFSgQMjfeGAn0pmdhuYpRGaIFVCqF7v+419/2urBT+TwQx3bdK2m/Yn2IM2T7At86q6ZmZP0skQ9B5hqJv/eUttBLTi0NA9ylXFv42+neDCWaWfR57SwXDiLBdSp3YHMTNXMP5ODuGA31UEo7ASuiyVLX4vUGtcyaRa8PcqVzm4FcZ/A3X6TpmNsz6uLHzN5s1OEG7llIhHrFDCZtzTnTreI+vOlf+otgFBgqQUU6u/gvMTQ+fcHIrUZLYyhJWsjN2FKM0xT/bawuTbLL48AMknir93jpry3mBEGWGO1+KtRP6lJUgfLMUpEiMYQCbVpAwYt88IQBriNew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a6CcjNNV5EGaqonvWZiFa8zfS9MUf4tvxo7WG+4NZ+A=;
 b=NoEBKT57+C76IKcfEUAA0vukIyihSNDB81Onb61yg6KyO/ThTzqrMPXxhd/rWP42afmM4NVkXqoLEw3MZAnAcPh6gFMlg9Gipws/CeoA202y2p/c2LFTJbZTfv44OF9KhPs5gnOTTxD72E5YbGtZozxegNrQ1Vr3Uwh1eQOppdd5udtDDvayP9Q7vmDgxndzihQhD0J5ekVShZQxBY+9SSKwMo5+GjE60bFO3JqH3kgRZmWGG0yEPWFun4VZgohnDNiFU62DUTysHHtViRB57ILv8PuSUlBvGclj8ql8ZZLF3hhXfqqOvKv2cOnxYEyb1XRbkHnCXmJyptoEIDisFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CYYPR11MB8308.namprd11.prod.outlook.com (2603:10b6:930:b9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 10:09:25 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::fa8:8cc5:a5da:7e07]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::fa8:8cc5:a5da:7e07%5]) with mapi id 15.20.6363.032; Mon, 8 May 2023
 10:09:24 +0000
From: Qi.Chen@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-networking][PATCH] frr: add CVE_PRODUCT
Date: Mon,  8 May 2023 03:09:13 -0700
Message-Id: <20230508100913.3679773-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.40.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0030.namprd05.prod.outlook.com
 (2603:10b6:a03:254::35) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|CYYPR11MB8308:EE_
X-MS-Office365-Filtering-Correlation-Id: 72a8cedd-31bf-45c7-b8ab-08db4fac4ce2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	yR9480k6ccNCDVWcLnS7HMqAOzGRi8NRDbrqOZyda+iE4LWfzZuxeTwUj89KNFeNN7qpnc53HDJMN651fuLAN95uR0EHzAw5y954BmOdBmQPCMLpLn9MqAAXNJ/bQw+4omCPG4t23hIv7If02BgHg6/Q+QRdX2zvgH6rY0vIBEsR1NZDNb7d9jJx53SgcGaYn4q4Dzvd88PImTWVVCiogv+g7h1X6HAkmKXTYPBZ2TxOgzwKu6131wcHpePzB2Vz/M6JGd+/EiL9k5OGOOHrJYNPYf39Mi+sucQjGtfpDmGMsYaOkNO/WEK6Y3R7PZGLx2JnvxpcFEl5Rhad1lnndaYeKF/AZ7qtAjDryJBmRVTxTWGLEoflIfvinh5VgDs8d2wH5aAMC2ssNQBNbmbwCIr7Qn+ZApejKGfJNd47MCW2Euoaa3WkSP1GDKEKmVrFcmbD7Orc5TB1tHoHeOkWUV6G3k18swPE4h906AvMqHdz7pns98RVCJhfbECdjJM6srcfgTl7Ceni4pgYN1M16TAw2lhRbjxbSlA5ZyRGL4tdzD9/L6gwnE2uMFVb/lOSB51HOO6ShFQ8csm6JD+NWM/3xXfOc696tUXYYo7KnWeyKOQ1JpWnBLcxRkfEOelX
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39850400004)(346002)(366004)(136003)(396003)(376002)(451199021)(4744005)(2906002)(5660300002)(38100700002)(38350700002)(36756003)(86362001)(6506007)(478600001)(9686003)(186003)(26005)(6512007)(6486002)(6666004)(52116002)(1076003)(316002)(2616005)(8936002)(66556008)(41300700001)(8676002)(66476007)(66946007)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?V7ukfV8eMLtivh73dt0HsZwUesnVq+ZBlV3Q1+ApTD8s5dBGgCbCceH7b+Ms?=
 =?us-ascii?Q?eu2i/xR9N46YoZS9gA+h8htVILFD7TzVlGwXbDzzjZCTB4ajJA+/HPjEBfka?=
 =?us-ascii?Q?TS73KaNFjQ52SoPCVjHwJ+/BhmBdWskrvJrv7cj5mt/mFp4e+JRKO2/vYGz1?=
 =?us-ascii?Q?0sd2SkvNUdDOZyJB3gJ276WDYW51ydH43vdLF5EqX8xjdlLU0r6jmTqrZ9he?=
 =?us-ascii?Q?Gl9A+1AQWeiDT80ldm3kDOhpztmHA+EszV9mQfw+Q6pW3txkHPzVVvMH5y7e?=
 =?us-ascii?Q?IgIeu6uL3c5u/2KMxvQLFS6M74tak4IA+ay/ghw8lA0rYEQgwdoF2KIcTvbF?=
 =?us-ascii?Q?WXtVtXpArQ+HKIedMsFt4qAcMsjAdQsNLabLOOR71TgJNkaR36A9fMA3w+Ox?=
 =?us-ascii?Q?o8d+5kb2+yAqHAogIuLMKc1vYxH8EGd6ZeDljxoTjKH/etQW9egqYvnb14gN?=
 =?us-ascii?Q?NDhRhpfoIDb4cwKdYSsSGbRJ0hLpmnOz9jPL1ggbQU+9Pd4GWhqsyJTN+pqP?=
 =?us-ascii?Q?7JR97vFYbpiKkvitBeUdjP61Ry4LLo9mWbzt/qzagX8sU7uC03KJ3TBpsbgy?=
 =?us-ascii?Q?2gxNcNtZBvAniH36avydMyhGaMSwm4aeEZa6EOBYtN2ne7N8iT5uViIxXmzU?=
 =?us-ascii?Q?zJk18PPpqvV8RUfnuTG+PSQ37QYmrbcuWUxrWy6rR1sA++qe5LbibajhzIok?=
 =?us-ascii?Q?CGPMT3wxD/7/7Tk1WtIUZQPX5ToI1StsGOiLJOIg3Hxsxpjm9aMCLRwVwkBd?=
 =?us-ascii?Q?DeL1uubAQo96QHE7+y89OINZMlK/Cxoc/y6xUCLSYqjfRiUythP+9BMuEUoq?=
 =?us-ascii?Q?6yi/A/T6tzHw93UcvIk6wakbBg92svIjsDjhP06bSIKYvgWNp2eMBOvORwPb?=
 =?us-ascii?Q?u6gNDN61K2Q23Tb+6CM+Nd5TNL0lq0iADm7rlzea8jIdz2VB3M/53OPH4049?=
 =?us-ascii?Q?jbOZYPbRAFLjmOyHzYTOur4XCq/WJv5rE9qyk+/JMPMzz9aG/5o+6geDj83S?=
 =?us-ascii?Q?zWtpzM3G/gz44ICLOoBx6M/irCRVic9r0p3+siExWSRJ7pn7M3FSQzoF3CRo?=
 =?us-ascii?Q?Nn3ipAlFtFI3IV0Qd7tvGiLg1GW1Y+n3arvIGpo9UejnktIdTdq9a3aiLLWo?=
 =?us-ascii?Q?+MFEB8hcBMjaVGBDMh5jTxThxsXbrllFDArz6pbH8Mb1ol5yHddww0psfLCY?=
 =?us-ascii?Q?1itZ7nYcKgzljKAi9U/7ei5GmAu7wSZnQ7CueE3UeuJJivLdpXrkQVedlxMK?=
 =?us-ascii?Q?g27/wkilUyrdsNx1AMlQIsSWXQAh0LbTCTSy4DV3uXk9jYvgS/IoGQHGfjnZ?=
 =?us-ascii?Q?psnvSZFZJZOMS1/WfAzyApOLsIYoTaTsJUpH1dRSxj3AbTyaNEfEb9tddOlQ?=
 =?us-ascii?Q?ZWTp+51gdkmJurVoQXT+eCUrAQTaw0Nz4i2yYa871HdnWj5LWBk5bo7xzLP+?=
 =?us-ascii?Q?eMQgkNN5rOclX1v62ahmpKr690Wdj+W46LBq0265/SSnGB2OuGxC/OtkT6qK?=
 =?us-ascii?Q?/ICpPKjOr6akJNjTu6KU+45+XGjpRLbuf4vnpTZfRsIisJSt2nnRslZOFjIl?=
 =?us-ascii?Q?BWBguteXiZSRCmGpeHSqiUtH8Ac4jG/sYSiUbQFfV57MC7Bi/yUNgZkx47T2?=
 =?us-ascii?Q?Cw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72a8cedd-31bf-45c7-b8ab-08db4fac4ce2
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 10:09:24.8457
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y0rABs8ntw8D5tyv05aP8wIXKUwkKV6HetPdRKeMINmnmwsdeHu6UmdG3Ps76Apb5aNOmXs/I0Apx2h8Quldkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8308
X-Proofpoint-GUID: DOYs90xBkPZN57WUTzfxcRK-Lti9z6iB
X-Proofpoint-ORIG-GUID: DOYs90xBkPZN57WUTzfxcRK-Lti9z6iB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-08_05,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 clxscore=1011 impostorscore=0 priorityscore=1501 mlxscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0 mlxlogscore=516
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2305080068
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 May 2023 10:09:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102400

From: Chen Qi <Qi.Chen@windriver.com>

The CVE_PRODUCT is frrouting in NVD database.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-networking/recipes-protocols/frr/frr_8.4.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-protocols/frr/frr_8.4.2.bb b/meta-networking/recipes-protocols/frr/frr_8.4.2.bb
index d01d895a80..9669260945 100644
--- a/meta-networking/recipes-protocols/frr/frr_8.4.2.bb
+++ b/meta-networking/recipes-protocols/frr/frr_8.4.2.bb
@@ -18,6 +18,8 @@ SRCREV = "62ac43de9f3bc470586cf4f51fadf013bf542b32"
 
 UPSTREAM_CHECK_GITTAGREGEX = "frr-(?P<pver>\d+(\.\d+)+)$"
 
+CVE_PRODUCT = "frrouting"
+
 S = "${WORKDIR}/git"
 
 inherit autotools-brokensep python3native pkgconfig useradd systemd
-- 
2.40.0


