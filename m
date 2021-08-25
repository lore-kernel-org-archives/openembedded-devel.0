Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.15953.1629902037668754658
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Aug 2021 07:33:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=lApaHhR+;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3871ddd116=trevor.gamblin@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17PBwegi026242
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Aug 2021 14:33:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=VSEsdyaM00PlopQ1kA8yp5YNhdsAWMJR2fMAyeo3WTU=;
 b=lApaHhR+VV6x9MrIniOQRHJA4w9QUVZ6kWw59RAIX/5G6If1nydheP6bqbzaAWogjst9
 Xz2kB60E8oVdgHqA/WYzI4voMwUy4MMrD0m/OHqfIzGnJd8y7sz1QgPnZhjDk/sQEp9/
 a6UPiQrV44obqdigIkSX2SJvx9MKwURv9hkdXtAqcaCPJVLrp7yn6D1BcTfiMpHUgL0O
 P9L2bxzswA+ODt7p5Nr+g52KzH/CFZvrTav+J/nwAE43tD6nends+rKxyXis2ee8y+mF
 P6qt4jPwbn+N8q5CZxdRcHmvRajm7hVVuOn0PE+ZpF3mHTfptRbJj7+Eug9g2NaT+fRP zQ== 
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2170.outbound.protection.outlook.com [104.47.56.170])
	by mx0a-0064b401.pphosted.com with ESMTP id 3an90brhur-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Aug 2021 14:33:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LXZl87sWU6cWy74G/Li/kSB0XWxNiH4qSyuVD++puWv1lNQaBxNCUibg+vH18KMwn8Fz2uANb6PtCd/AMdgtNSn0vqEk+kecBAm+cKsZFmoRJeLXQ47MOktUS4XQy9+25z4ZlhPZVi7Lu02Cbrs8MWV1nA1ZJsA1AkytHtMPcaFzCht+DpS8GKIdC62Jq9XtfFzisRKsQeBeeSnD8ipfYQ7uaRpmC8uIR3ZSTCp9wOzYTlcAURpCxmT+OLm0EIYgQfhJEcrdILbODjno+5ckNC93B2DGRDhXa5RnJzxxuW0kAMzYOmD08qMTSybtO34j5TpLrmGWZOBiBB5CXbyM+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VSEsdyaM00PlopQ1kA8yp5YNhdsAWMJR2fMAyeo3WTU=;
 b=WWLVm/yfCdLlCpdP8xbs9fIMQLlP4FHX3U9ps09D43BE0Leqc8ADvniQZfkCiWIr7OAhg1rPTinCgdNS3jxOn+AxTbAxSu8i45dmF/FrhHZyD01T800PCNmHC9TVg1jkk8M/jRoJrLzVwoLXj9WAHmN/o8+3FE57GRxWPVm4YcnaUWTjU+ZQi/RAacw5WlbB54BXh1tgLt/PVIxVbIjIpqIbsmtc400XmDOLhWeeAKCvNYFPkUArulzpVZD1f2iwZdwJ9Pap3AdLArgL8utvC5+dG58+uUfMrlJEMGpd+4x1yLXfs4/NqqSSiamJaTd9O+A1LqCG7r5T9u+a8g8HWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB4814.namprd11.prod.outlook.com (2603:10b6:a03:2d8::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Wed, 25 Aug
 2021 14:33:54 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::5988:9cf6:c130:3530]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::5988:9cf6:c130:3530%6]) with mapi id 15.20.4436.024; Wed, 25 Aug 2021
 14:33:54 +0000
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
To: openembedded-devel@lists.openembedded.org
Cc: timothy.t.orling@intel.com
Subject: [meta-python][PATCH 1/2] python3-eventlet: add 0.30.2 to meta-python
Date: Wed, 25 Aug 2021 10:33:35 -0400
Message-Id: <20210825143336.491953-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.31.1
X-ClientProxiedBy: YT3PR01CA0077.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:84::25) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-tgamblin-lx3.corp.ad.wrs.com (2607:fea8:c29d:d7c0:fa88:8bc5:c0d2:27cc) by YT3PR01CA0077.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:84::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend Transport; Wed, 25 Aug 2021 14:33:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 496bac20-a3c7-4bed-d9c3-08d967d55cf8
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4814:
X-LD-Processed: 8ddb2873-a1ad-4a18-ae4e-4644631433be,ExtAddr
X-Microsoft-Antispam-PRVS: 
 <SJ0PR11MB48147F48CD8DE87AFD7C42DA9FC69@SJ0PR11MB4814.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
 ne4FREj1KLt9vkDR3o7L47KCyaZafkfOXeBB7njjX2CXsaAvZp4kK2uzZaNoAZOJKrnbE9Gw10Ez6j8RUi9fabjCtJVlqNM0q5TMCQK2AhDnpQwyt8Kc8SOD9kVRFgqTToJ4jvM7r0MaoyyOOJScsYQLdZgyhTRZQIjHOaNiMarkajhFQFOa7kwlYnVbSfeGhXR2ZilQXS+bITx0PSxU6EYZBHiwhmT6Th3HGTfGtVZw0/eFUL9BGQQ4JoocHI2DLrlBYGi1UCvmd7OxvkhkClUAdH2Y1vKFRRmI3VssmDNKW6jpKZXnjbghZqrYuyDPR7rw5Mq7wZSQvlbL3lVA8B+53E4sz93Z+omtcZw1iDDyPmWLFEofp1yDE9/LRHC/LaSj69HT2j6AhCtE7ro28lREkVrCICSYHwd2GGTyPxoXii6keGtjK1TtO02MI03fFlScK55NmPMM9JIZKLPzL5bMdIfVkrcYg2SZnJDq0A/YRzCytOgxys6XvRpCH+20dmzjdJpfv7NimnUqrB24+ig3VS8LS4qouHujjf9IZQRnQXBs3au11zxAAt8fbm8N6bgzBpmAv2m6f+cUemsPAv8BCZ7nVHm8Y+wziOwoZjVA46e1MW30tSPGUa9uriy7B84zoox1lQ5dht0yB+GPyPxZFfsC0E+r9vwEqMluMx073USHseTdxzBCNQqFt+Nfd1SZt2+jvfxCtOQPicJIh4toHsLoo4fdjTfWBIRLrqCHdTr2xNJ52q8BghI3Xdd/lNx8mqs4wDeHdsNkTIQX9w==
X-Forefront-Antispam-Report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39850400004)(376002)(396003)(346002)(366004)(6666004)(66556008)(66476007)(1076003)(8936002)(52116002)(6486002)(6506007)(66946007)(186003)(5660300002)(316002)(2906002)(6916009)(36756003)(44832011)(8676002)(4326008)(478600001)(83380400001)(38100700002)(6512007)(19273905006)(2616005)(86362001)(563064011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?us-ascii?Q?olOAZHkc2JHfasik8bYoHICEh+EcTFI4ho2JxPJdmgH0Ja8jBjXCIJSD9Cii?=
 =?us-ascii?Q?9v+qv2RPWrAMnsKliArGWbN6W7yBPeo7RMFxHiwmlgC7wQi7RHTaoEWFQLwa?=
 =?us-ascii?Q?FL9pA+3TF8qX30vCcY0D14v4/eAoQk+tH1wJb7bROpyw+475K6LnSTWzrQtC?=
 =?us-ascii?Q?K2zTUxyMWGKxBKTEaTE3y/4odkqvi/WhihhOTIb7sRsPbiq4+E9Ntdx3SsvR?=
 =?us-ascii?Q?D3X0dusMlM3s7c2ciax+VZXlT8w/nHSN28yQazJ9kVFmtg4p6H/okgUjQbgB?=
 =?us-ascii?Q?ZRXu2+ouZ0gUbTfzSxLUno785KkNST7kxAM40fEAn5mHFBEn1nP0jCe273Rz?=
 =?us-ascii?Q?OpQGLYBx6QgYdZ+wemFct07kafBpoupKJq5CFi9yR3BGNLjjsNVa0v5JFdEx?=
 =?us-ascii?Q?uP6SCfqmbm5rEAdDpSp+KnwR4NR6khC/h8wimu5fclMY2uwsvNw0hmb21FEq?=
 =?us-ascii?Q?Ews0pET/Ap0HZ7ObM1KVdQ6L8igRTpVgr5L5W/Adulr16Dof8NTBQ/Z26dLr?=
 =?us-ascii?Q?bj5bWO447g//pvJRJ98OxTH4N2QPy8ptjCFcHV2QoKEShV5QnJymnL+NaOSv?=
 =?us-ascii?Q?5Zq05IboT7yQza9bGNe9kOyawJzBOWEeiiIi2S7l+FH2smf09YjwbVIBJy5v?=
 =?us-ascii?Q?bSn5I0mRIbmEXdRn5RxzAVBMRkqFld2COCPzlvw5lxW/R2VK/ZY1Ev2r4i2h?=
 =?us-ascii?Q?UpGFqMGx+SnbTSHqES9pYUBe7tjc07L+2+0VVLPziH/P3y34uy80Llb2OTbd?=
 =?us-ascii?Q?Jv9tkZ21YsFozuXhqczN00buD22eNoWrshKjLfuOX5fS+Y2MI5uEIPvWzNOn?=
 =?us-ascii?Q?RELm7zEwh0lPo33asGzKmgM3GRhKJcO6gC5H9WQmPRu2a/ALxOCJkUcuSZq7?=
 =?us-ascii?Q?YHzUh3ldEB3oqELuQRZa4KB1apNCJvaUzdFNb6LBRLZ0ynWPDmFN9yDrzXql?=
 =?us-ascii?Q?WCi1Qd0fWtptX2zT4y2qx+yG67XsuFK/IVqPZmXk80cZ9jS3n1j1im0bI1cO?=
 =?us-ascii?Q?NQ+PTQ+/AWoSEf5cNfBo6aIvNdkQLowszS2NOFB9F/Xh6dKUjESFwfVUIcsE?=
 =?us-ascii?Q?3uBpYEgBcUZBMZ5xw8oeGqSW+HU20XoW2kwHCbIQ5hnSrlcOdF8Wofwdd02J?=
 =?us-ascii?Q?2H/ZIx41acJy1iD4PAGTAFXTlEYBF5RxRVlE60xr2nAc62/SEOXd1HKIPtGd?=
 =?us-ascii?Q?FzyEYiY0qb03cZKc7FwgUQnMrVYcB87mf/M7WUVk7mtLa8l3Pp0Ch8O/KopY?=
 =?us-ascii?Q?Prcfbepg5dM+5U5kGQmjTBgtEfQF6dAx26vdZtHLQ8hAT0Oq1lMPSk4MFSMH?=
 =?us-ascii?Q?flduyUOCj/Pr9rbbeIWqk2OgkUHVaDIgEeGPSgWlWYfzGoo4XfLrJ5y/a4IO?=
 =?us-ascii?Q?Ktq1RI4sSjQr9EyOUEbfKJvEqRrI?=
X-MS-Exchange-Transport-Forked: True
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 496bac20-a3c7-4bed-d9c3-08d967d55cf8
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 14:33:53.8051
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FMbQc5oIdjrMm0KbOJ2OgnrhLWz4bKBRPosK1u4bIfLk18VVGH8kQekGQki8RaoQk1gfCaPul8t06rBa8aQhdwmdFBrlLmlP2cWhUsrPsOA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4814
X-Proofpoint-ORIG-GUID: 4Rt2t1wRZu6J-mA7hQfayzWWheHmTWeP
X-Proofpoint-GUID: 4Rt2t1wRZu6J-mA7hQfayzWWheHmTWeP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-25_06,2021-08-25_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 bulkscore=0
 malwarescore=0 phishscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 mlxscore=0 adultscore=8
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108250087
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

python3-gunicorn in meta-python relies on python3-eventlet for its
ptests, so add a version of the eventlet recipe to the layer and update
to the latest version. This recipe file is based on the one from the
meta-openstack layer, but the .inc and .bb files have been combined.
Also add python3-dnspython to RDEPENDS so that "import eventlet" works.

Note that there is a newer version of eventlet, but anything 0.30.3 and
newer is incompatible with the current version of gunicorn. eventlet
will get another update as soon as there is a new release of gunicorn
handling the API change.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 .../python/python3-eventlet_0.30.2.bb                | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-eventlet_0.30.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-eventlet_0.30.2.bb b/meta-python/recipes-devtools/python/python3-eventlet_0.30.2.bb
new file mode 100644
index 000000000..80869a259
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-eventlet_0.30.2.bb
@@ -0,0 +1,12 @@
+DESCRIPTION = "Highly concurrent networking library"
+HOMEPAGE = "http://pypi.python.org/pypi/eventlet"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=56472ad6de4caf50e05332a34b66e778"
+
+SRC_URI[md5sum] = "ebf5794e3f7a9f1778fb4f2a58eb7614"
+SRC_URI[sha256sum] = "1811b122d9a45eb5bafba092d36911bca825f835cb648a862bbf984030acff9d"
+
+inherit pypi setuptools3
+
+RDEPENDS:${PN} += "${PYTHON_PN}-dnspython"
-- 
2.31.1

