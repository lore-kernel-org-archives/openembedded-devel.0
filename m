Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4892C433EF
	for <webhook@archiver.kernel.org>; Tue, 28 Dec 2021 07:38:34 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.35897.1640677113885204960
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 23:38:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=KUsTneHc;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=7996075b3e=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1BS7Z83i011424
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 23:38:33 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=HYT47G6lcjRpzMD8G6ias/IaLYvUDiSPTvw9fj/jr70=;
 b=KUsTneHcKKHI1rbGzzouUgYCUqQJY1OD+qlzOBzAHOTXUv8xU6y64R79TqsTVSQwZ/c4
 cGeykOrfQSSz9MvnNKa5fRZ94Sl5gknPsGSkEspNsVMx5bxTHMnpPvzCf2/y8SGftwjy
 4SN2asjo1zMMiurFl4do3Pvf0Bgu5qEMrZsepUzsd8cY7RxhK0M50hQ1gNZ8ANDExbWP
 dfJ7IKTEK2tDc402pd06qp271gcKrf4TITeyIjoiRsyrzaFc5WdZnkUmLz5oG9mooOkg
 2YC06NN7P65eDAHrpt+u0ULJX0e+pqkl/g/ad4WSJSNAlwKaI8Ayi+VtSyOYPXzkb3Ro YA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3d7m0c08b2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 23:38:33 -0800
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 1BS7cWww015370
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 23:38:32 -0800
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2107.outbound.protection.outlook.com [104.47.55.107])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3d7m0c08b0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Dec 2021 23:38:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TWndiYY1ttDjCTwPevxAcsG3rdNf3eCR8PUlIJ1TB7BgNZ+6+/RL0hH+yjRfRON5vRChZU4Z9X2CWia5kjII7OViE9lwMMlQT1tXUv/rJVVt9Ao/tn0uw/TFjyumgAg0ea7VyCU2wKqA0E5+cf/gLsfI27VBHxTOuexcYggWGsYvAMdELND2GHHvAfbKhB4Gc0wT/pBlpl9QqW4+Jlw9tO2eJ8ISSxL8+rzRcUozeqF90AzvQr2HAOc6bT6ixyF9lIzqXokbVuGMO3liJm1xKuEAYz01fF+h8HgOrRmjh0y+hME1AKuU4IJDXN2mNjysCtal0UOGlCo/jTXIKztxDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HYT47G6lcjRpzMD8G6ias/IaLYvUDiSPTvw9fj/jr70=;
 b=byQjUSvpYCVmMKkXw+gx9j8PnojaWYl3903dB6rSdFddgETNijOjV5MAhDeETbr4Ra0fRdGmsd3508GDUvcDAfY8pYoiVN21EgCbLLBnMQBOIufu3Z3mfMYtQTX2Oau1HevT2jFQShKBRtndCLXRDJxhqBBu6ERrYFUsdaC4eUkjt6WqX7rpFgXagnPFkusId7Wmr2Hb8zkdLoaJ+iodfKuIlVAURghGmw0j2Aofv5LU1lkWkMJE1Vk6+25/e3LP25wBkh3T6NaPyoqFgDde/9epwnCUMK1CgjVsc2RycdT0Dw04rA5tXGY4q3I0xFaR5hMrhIIIQsNstwntO4FJVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MWHPR11MB1584.namprd11.prod.outlook.com (2603:10b6:301:e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Tue, 28 Dec
 2021 07:38:31 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::8962:26c6:20fe:eaa4]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::8962:26c6:20fe:eaa4%6]) with mapi id 15.20.4823.023; Tue, 28 Dec 2021
 07:38:31 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org, akuster808@gmail.com
Subject: [meta-networking][hardknott][PATCH 10/19] samba: add missing runtime
 dependency for pidl
Date: Tue, 28 Dec 2021 15:37:57 +0800
Message-Id: <20211228073806.868759-11-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211228073806.868759-1-yi.zhao@windriver.com>
References: <20211228073806.868759-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR04CA0057.apcprd04.prod.outlook.com
 (2603:1096:202:14::25) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 408c6a1d-e0be-4812-3768-08d9c9d50bf5
X-MS-TrafficTypeDiagnostic: MWHPR11MB1584:EE_
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB15843E60FF28BFB426B244C2F9439@MWHPR11MB1584.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2331;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ihQ0O+zvThRH2Sma1JRGntFaZS9h06rtTZYVYBx36SJ51GW+rAipepWZsFafxtAVVGz50fPrPys7VKqJtGdSMLd+wJQNqVmb9GQMsQYSt7qUOEPZWd6CAjZgnb/QmuXATp+pwwJ3C6rm62LtsktjbJgddWxI5qj/b7U7rgG+LtAEv0J5rbWxy9wyOFn89PZQCNddo1rqVGvJdOuO/soHeV57KFZ/3+sVvMGbJOQy7GTBKMNknpvpJgf+l/b9cBnFB2M5npizS4GLEB19flbARLSvTTVBq/07tEGI2nSZAoFzfTT7PEqA6Ui6P+qrJnLVmTl4dKInzataj9zU//dTBx3qAsCFv7kZmS+PvqKNCChOQol6WanOzfJ//c578moHWC3zATBqGbCktwy4V8mYBccYhy1kDaq/wsQkbN80SO1bAScxnWLCmSHzGfujWXU6VqqZkTO+WmzLRLgbv95f2O/kcVG6FcyKAJck7plZIX6UVBqB9qqgoIs30CyQ6ElGGVOYbQRIQaOXG9hG6UqOddM3ecY2u0cyqJkIZC/XENXPFwE238581X2nau4Cm7sz6EA5ZjQN6nBurd/0Bn2HGEG1OZ7gJ3LLLpJGypuFPDfn3Z9+okHuHMtBgHWG/E2Y6+QxwuUkZADj5gM2UoHre4+f6dNZWrbZnjR3vxCZlbLdrFUQ9Srh3lk+dmRVSaFj5v4V4jeAZmx1kIviovvazw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66946007)(66476007)(66556008)(8936002)(508600001)(83380400001)(2616005)(44832011)(4744005)(36756003)(1076003)(6666004)(8676002)(5660300002)(52116002)(186003)(38350700002)(38100700002)(6506007)(6486002)(6512007)(2906002)(86362001)(316002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?xmk/J9Rkfy2Nk/D9uiA0Az6g/XvSkzJfY5Mirb1rQdUsfBh3MeCzWTAUNw/c?=
 =?us-ascii?Q?dGWMnTTB1SYJvuWo/04TcOk32lJGuKGeDpMnRcl8lvI2XtIJ50LmwO9izfsy?=
 =?us-ascii?Q?72E90sz3KI53CyT2nMG46YTrTf1wz2NIBVjLf00iAxsYRgax/jeotEMuWup8?=
 =?us-ascii?Q?xGGiad1ev3l0Glxh2ZJHFfrKMKIKVNn7Y/hTqEv6f2+qyJ1+8SflpyYAm9A3?=
 =?us-ascii?Q?lR/oeYhFWlKkpADasXHkqV5LQqhBS28BxImwoBih5JJjgO1etHx2GfsH9iOn?=
 =?us-ascii?Q?0VvMQBhTxzfNkqXCfk89NB0J/1S1Zal/IjI8b+cbgJybVGwngkeUbtqcQFue?=
 =?us-ascii?Q?mUH9a0Cb4Yv7aFC2EKZNM5c5mBO7L5RubVQPDFLGnllro214bSBWaWClwfNc?=
 =?us-ascii?Q?rIBpyFyVuiM8L2AsFinDBItvDXuTNU3PERJ1Eli/bxOT1oyDqLieeOIcUDxn?=
 =?us-ascii?Q?J4yjDrRoI+qY3qJrKzS+tW0/f60Nx8r2wW8MmyeAR7JqAJdZo+exBRkgC0G3?=
 =?us-ascii?Q?VXJRzwn/rIuqh0NKRBgGmJxkzW7QJoT4MDZEuJv57kN3jRtqqAKL3z61Oe4O?=
 =?us-ascii?Q?DhkTq/YMrqWvEAgS0ggyrIrySLXtQcfet6Nxh1FMh9/fPjVmOWJZh8il40xG?=
 =?us-ascii?Q?jGdC2FY5YtxykOzKhBT7d7oEFelTeW7PFObIkvNtL8eGmkOjcwNNCnHSWFa7?=
 =?us-ascii?Q?/FAwOW5sJE/Fy4chUl47m4pjRKdQGIpOJvHBl+l+F/4Aln5Jqe4qCECAJqT2?=
 =?us-ascii?Q?Wp/L7qrQF2xelsrQ+SKGcQ+dI50wD/KsWtzFyv7hwd3r6e+IYlyD8wsrOD/W?=
 =?us-ascii?Q?Cf8mnS1awtTX94rp0NldM+qgzsyd45XU9XWn9xsNhAKoXlFryuvBVLWxe1V3?=
 =?us-ascii?Q?mV3rlD+XcuGQxgqkSuFsmfn2fGTPwXg5Y0u0VAgCzpePXaaeeTFNhZWVPNLX?=
 =?us-ascii?Q?VNEXfqiItHKYkO1A05xEiOL/A6R3+eG05CK7IG2vUWAnhijj4731EWqMK1bW?=
 =?us-ascii?Q?sY7IjQgYS2cAo4hZp2rHDe0JRXps3E5KLzYi7qPAJfg5yMOteCu1HDsrHfJ9?=
 =?us-ascii?Q?dUL9P7vJ8spxxDDsTV4BAmCXTC2WEO/FNlHhwYunTz3mfxYBW2AORuH60MiO?=
 =?us-ascii?Q?KNP5qYn0cq16Gy2yZBMBKh5EqWK8EURl2FnUUI6f3K31HLk5cySlEow6lByG?=
 =?us-ascii?Q?wZosE3FO6XPM2W+1fp8IQ2LR0D3mgRm91pNMc59KcE/zqHXFDb/lVl/XTHb8?=
 =?us-ascii?Q?b7fcQs8wqrkY/6se+ng5KwDyeOvIx3U/Qae3j3LCo4VMayMOLOyMdX3VUg52?=
 =?us-ascii?Q?TWT2wTt2MBE8Rb5Q8nV4VIrfMOcD16cCqpnWIZv1xGQDfDpiDpKvnh7gyPoW?=
 =?us-ascii?Q?LGs+iY+TTURqeoydJRNuUKm4UqGkVuMRaBAZ2KKLPGkPY+JUIFIXh7q9Loh3?=
 =?us-ascii?Q?m16598kkGKJMSYVhkOy1uWVlOutfOOBzWzIxiP6HXvNaKZqBqkV0pU22dPJx?=
 =?us-ascii?Q?wtpKCnYF7B3TGdwc1xMwmKq9r0AOgq6D+5wi35sD1TjCcVFxM1r1j/1FfDcn?=
 =?us-ascii?Q?vRQYuO6J0Ff17SMAKgxy9WWClF3UOU2PFW7myDNzGXjxDSNfNqkgEEXyoKNI?=
 =?us-ascii?Q?bzVJ3UYPKHBFfBKHWura2fI=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 408c6a1d-e0be-4812-3768-08d9c9d50bf5
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2021 07:38:31.8598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 DHLLJRZOQoOjclsvE+rc1YRjrrKO2xCxCowkkt3otiy4FosytUNXRKCNDj15e99wDW+sZp1DdsoY/efjXUs+ZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1584
X-Proofpoint-GUID: H0_ZAygC0b97MdDxEFv_iV1QHKrpNrM4
X-Proofpoint-ORIG-GUID: I3kRWQKlNqHHo79-kpe5FG5YHwKyFJ0C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-28_04,2021-12-24_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 malwarescore=0 mlxscore=0 impostorscore=0 suspectscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112280033
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Dec 2021 07:38:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94537

Add libparse-yapp-perl to RDEPENDS for pidl.

Fixes:
$ pidl
Can't locate Parse/Yapp/Driver.pm in @INC (you may need to install the Parse::Yapp::Driver module)

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-networking/recipes-connectivity/samba/samba_4.14.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.14.5.bb b/meta-networking/recipes-connectivity/samba/samba_4.14.5.bb
index 49259c7e2..5c5ce3670 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.14.5.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.14.5.bb
@@ -316,7 +316,7 @@ FILES_smbclient = "${bindir}/cifsdd \
                    ${bindir}/smbtree \
                    ${libdir}/samba/smbspool_krb5_wrapper"
 
-RDEPENDS_${PN}-pidl_append = " perl"
+RDEPENDS_${PN}-pidl_append = " perl libparse-yapp-perl"
 FILES_${PN}-pidl = "${bindir}/pidl \
                     ${libdir}/perl5 \
                    "
-- 
2.25.1


