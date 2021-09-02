Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.7696.1630592667448661421
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Sep 2021 07:24:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=d6osfdl/;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4879085da6=trevor.gamblin@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 182CcknY009803
	for <openembedded-devel@lists.openembedded.org>; Thu, 2 Sep 2021 07:24:27 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=bcaLQ88jvf5M65c+yTtd809OOmX1Dqu30b2UbSK/w7k=;
 b=d6osfdl/c//5/LfBEQRe/F3S77TTUBla558E7pPmfRLtuNdZF90+VDzNTAF4W62gGmHw
 cAnHFSO73B+2uHjt/I94T4KWToOOD0DENhIzceelgYo9/BD3tu6cJHSqQt4Eb0JvfC9r
 JY2pPoA1cVzpG23Spwe46HwKxmyjQRERJl9eD/3wjx4JrApUkF9ruOQ67F+8E0pQNOUN
 JAVA3uny+T/Ibf8qPWkdFE1R1/ydBhx/SfQGJIdQgBjcTiBAwKQeOTlPSPk3nu7PPwwi
 Nl0BoVDxM1E/T8p5qPbDH5IvVWE9pzy3ZA6roBvXuoKht6tvfYXAn+LcPglOenyp1NKL AQ== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2105.outbound.protection.outlook.com [104.47.58.105])
	by mx0a-0064b401.pphosted.com with ESMTP id 3atdx6rq5j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 02 Sep 2021 07:24:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PhwVh8RiJ/TL2enCcgOkUSSo3e0hT6L/0CJ5gBmqrjyACM5W4GLFn85SZJ6ej+KGulFm+C/iZiegXi1rcp1UdWlMnFQ76sTibata6pmdyg6jmKAfvgtktBNX8E/u4yzJ7dvMyKyAbriAH+bDB7GBUTe8Bw6oOcOnsjzhoJjrSpoUWr1XXSJ14Pugi/r5jwBCJAK/X1W8OxlRPqdTO5HLRmfNJg41FmTvqHl1c5VDkIQ7ExqZ6eUzDdovmph2amYnaQ7hWSSSow+V5/s2RRw1iRZM4/XRkp+UHry+Oksy/qi9a9wIRYlgWZ6KyC1RujHfxETPjnegIHXmXmXDQIO4Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=bcaLQ88jvf5M65c+yTtd809OOmX1Dqu30b2UbSK/w7k=;
 b=DEwgtD+HJNr3NSp9cwk9st0JcOJL7xPAHxAO/foKhaqYYmTzgudyD3NrVvBLROqBt3S/QEvZdZ9QUCs5P/A3LNfOg7HFyziwznzI54kxBSXwLslfCLZZw3ERl70uZ/OTAsY+l+asfmBzAmosSf5i5DzEl+AZULklMxh0Emo6OEgRMko6IN0IO7adjjl/gVAo4uzdi7rRtNxDqoTNyyVHeWpdIH9osTVDzAtjeKxTC+fNjX4LZugObdwlCRWxPgqsAKt49aGo0Yv944vb4BFLCCPa+gV09kbLDaokynxWOxsDRxJ3fkiPgP880CVMRGlf2UXdUG2CEq9DRl/3dwbItA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB4976.namprd11.prod.outlook.com (2603:10b6:a03:2d7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Thu, 2 Sep
 2021 14:09:24 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::fdd3:dc0f:a385:34d1]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::fdd3:dc0f:a385:34d1%4]) with mapi id 15.20.4457.024; Thu, 2 Sep 2021
 14:09:24 +0000
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH v2] python3-pytest-subtests: add recipe
Date: Thu,  2 Sep 2021 10:09:06 -0400
Message-Id: <20210902140906.815125-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.31.1
X-ClientProxiedBy: BN9P220CA0002.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:408:13e::7) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-tgamblin-lx3.corp.ad.wrs.com (2607:fea8:c29d:d7c0:fa88:8bc5:c0d2:27cc) by BN9P220CA0002.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:13e::7) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.22 via Frontend Transport; Thu, 2 Sep 2021 14:09:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6652223f-a843-422a-332a-08d96e1b4401
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4976:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB4976F541AD6A85DB7CD477C89FCE9@SJ0PR11MB4976.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	W47khliKQpdlhs05PzRlrFG2qIetR7EAtGTXH5+2pEc7mPi+06UAocCfW/1gPGjWpQ70C/60cpC6xSi052LC2nSZ/IQ/LVaX88ppqLjCKKLlRUXpwtkzS93/6VIkzSxPgk6cf1XdwQlpbviFE1GZn8JWVPp7BhPdC1whvZSqzQnyvt/hWRRq+cVBDMtAyeWx7eaUz1KbUFzr9qzQbuuniTd6eEvA5KPCDzYmntrpGva+qOQSLhPyWDwne/8iiwgry+fdtpg1VB13GTDsHTWg8tyyCOE7+rPzsELdabomDSzoY+ZB38hwagVTD5pvIoKqblViYCgjsYtq2BkV4cvvCgrJsnUlBP5bfOQGrN/R8YN5sn4OgeNjnDuDO6ISxm8fSX0oKA44Cn1mxOwGQRiah6HnhSL+I9DPiuN5G6Hebmx/8XAVmFN3cv/BGH8Cbq03QrNuM9evpprru1WT5qqqR48vAV44TMVewjuR6+7eSABrmdhxCUPXD628gvChl2YkfhoEtUINWScErRXwA++gL+xNdBU6x48iEzlnw1jX28vzN+MGZOLVDwq1Wh6RAg8p9Zq4QDxZa4tdjrinYrkAI5rKzcvwFQ2kJLSNyFqu3s6oWny06KVbi5Wz1i9u+9/zM9t0HJB4sARemzXQ0ctwMQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(376002)(346002)(136003)(39850400004)(66946007)(5660300002)(66476007)(6486002)(1076003)(8936002)(316002)(44832011)(2906002)(2616005)(8676002)(83380400001)(86362001)(6512007)(6666004)(38100700002)(66556008)(186003)(52116002)(36756003)(6916009)(478600001)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zfg3hi3OrR+/9EldF7m3zPxwtMkqYMtsldo7ohqB+gpo+yrFVIT5m9gnn7om?=
 =?us-ascii?Q?7hRotn6+/xFkQdrT+tm3cJT7aCDATWw1Jzi1A3XvoSBvyuq7BKwdLEb6j4F3?=
 =?us-ascii?Q?yscdk+UMaxgoQXbveWnqeASgXQ4SLBr9MwAJaPI/Vff/OIQyzysf59w3UYzX?=
 =?us-ascii?Q?vU1NV3QeIHbd9p5qCYAC+VEDYZeCT+QyZ9gHudL5yd35YM/bHexw5G7XbY0/?=
 =?us-ascii?Q?e76JxDHTNrwNoq+YX/oGl2NgiDozCylNYxkiYKBUSLhr/dGHZBjv1njc047q?=
 =?us-ascii?Q?S55RBeKaA4zbw5IZzXID+WbnXepyrNJvYXX0gzIQwIN417gRKUFu85/Mx+Ww?=
 =?us-ascii?Q?VHNxdUCke3142E5EeiT8gG/mn9f2hdI6CSEfZBckR8h6iuJ0ECzl/4bwewZC?=
 =?us-ascii?Q?LqERqF2CPtjdPDlVLEw5rK78LrvZOBlgZkG86Xwil45zrROzElOq8Bb7oi28?=
 =?us-ascii?Q?r1MJ5YMboMndvB6tQjPueI7NyoVjOfO561BDpW3TuqQcNhrBSv9g3g9Fv0M2?=
 =?us-ascii?Q?2D5/QFgJPK54lXXwij8PkxNVzb8NhILPcCh75iPTLP8lb+oTFCoyWuHibjZG?=
 =?us-ascii?Q?IajBFdlOMg1elAdesjwyNIlWBeR0mCKXO15xLvSFBlm8jCIyYcChidUEdXE4?=
 =?us-ascii?Q?edWnEvGMnFbh4u1RADRMRgAeIo4PZOEbIV4d287nku4i38m54np+W49rGcqB?=
 =?us-ascii?Q?Mfo+gkYFMElt1AQckOd9efKrQf4LyIEFeodST8x80FjsxQKK1xQPJq2olNoi?=
 =?us-ascii?Q?GrpDg/dXW/NNeMAZ3kmqphz5c/mAn5XGukuRKtMsk4iVQUV81chIr7uXdPws?=
 =?us-ascii?Q?wEkFmI1OteXlEOwbQS1ZFGefxPDBE7SdzkO9wLcIsuWEzFqUlco3dlxujOns?=
 =?us-ascii?Q?S/cp77eosC3QvKfaub5RtmrpuGoNJmyUn4tDqm2LGpn9bQQCxgAruNwlMYBI?=
 =?us-ascii?Q?JZcHXh58KjD/HwfvdJh5awDNmjU4Ok6dMKxrlV9WLYqmYN5uDOTQqG3eEzB8?=
 =?us-ascii?Q?tbfR02Vbwi25d5p+fnbqLxSejr00IWQ19ReD1LQTpmJA2dIPI80DW/DxitwR?=
 =?us-ascii?Q?lK9Y0MKaKQUejS2aYibf+l7rynGSlZI6IRpGCAkGoCTYX28mu0pvO1IIOMBi?=
 =?us-ascii?Q?qdykHQQ1RopiK73Bw+4xUnrUQAOCuKoAW+qO9cOtSeDTfb5X7GXLqBnFgL6s?=
 =?us-ascii?Q?hF+Igp5cbSW+4JX7zCvgDIrQf8KwMx6r/oLenuqvM3ZuTfZeD+8GbP0ltuPX?=
 =?us-ascii?Q?tJl7UKPB/0aLEu6p17pwIcwompmLwa2EZBdsEEkE6M7btMkHm8yHJZh2m5nN?=
 =?us-ascii?Q?5RMJ8zPi/VnkDjp0iHxVzQDouIsp2WB9IM5J9x/R80AmezVcBm8HRKX3CUEH?=
 =?us-ascii?Q?A09flVCPKggCwVPYiTTvoAcUdjyr?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6652223f-a843-422a-332a-08d96e1b4401
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 14:09:24.2692
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J/MivSbq8KUlSHT7fk3KXcuywUFAkNkxJT7/qWH4UqxlkkuKxAVsO7RRzh3g1Z/VuEO81gujgnWu9fUTbM3LpInLDfkHvCqRBqjSzr5pkhg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4976
X-Proofpoint-ORIG-GUID: IcOqFBo7mDOgooR5KQOhp43HCC7wYVpz
X-Proofpoint-GUID: IcOqFBo7mDOgooR5KQOhp43HCC7wYVpz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-02_04,2021-09-02_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 mlxscore=0 spamscore=0 priorityscore=1501 mlxlogscore=518 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2108310000
 definitions=main-2109020088
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Newer versions of python3-cryptography will rely on the subtests fixture
for their ptests. Add this recipe so that cryptography can be given the
necessary RDEPENDS when it is upgraded.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 .../python/python3-pytest-subtests_0.5.0.bb      | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pytest-subtests_0.5.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-pytest-subtests_0.5.0.bb b/meta-python/recipes-devtools/python/python3-pytest-subtests_0.5.0.bb
new file mode 100644
index 000000000..2e03512bd
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pytest-subtests_0.5.0.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "unittest subTest() support and subtests fixture."
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=242b4e17fa287dcf7aef372f6bc3dcb1"
+
+SRC_URI[sha256sum] = "5bd1e4bf0eda4c89a6cd42b0ee28e1d2ca0848de3fd67ad8cdd6d559ed00f120"
+
+inherit pypi setuptools3
+
+DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
+
+RDEPENDS:${PN} += " \
+    ${PYTHON_PN}-pytest \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.31.1

