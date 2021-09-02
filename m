Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.883.1630597172047296744
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Sep 2021 08:39:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Sb8iMrYV;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4879085da6=trevor.gamblin@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 182DvIxt007255
	for <openembedded-devel@lists.openembedded.org>; Thu, 2 Sep 2021 08:39:31 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=iJn1Vrh/kU43NyAb7nPNJZWdXFkrK0CWf+JuBxVnpTg=;
 b=Sb8iMrYV6TI3LkycJoaTAioWze+vsFtNdNjI2nasrDsg3fC7sGEfxP2Xgfg+raMXXc1f
 eU4Fcl1BTit8lEGRnMrR3QV054h3/Kiw+q6vrJ3WQx/lg7e3Jwzrk5N8Ab2OmB9jUPsb
 l2VQrGPyD1tg6FL0T8LVLKI+UF1Vhua6X+l73W56JLBy6olafLTL+0XyPkVMECkZ87M7
 R12wWDjpGehJxkexjAoUMhO4rr6molwUZfeiLqV6SXhBU94NqxWeJhOOejERrjfDTBUX
 S40Bb0JQ4dLIBRD1ig87n149FpV74tAH1xqrZtJwnNkbhZDfzt8USpotfTdyyYf39PGy LQ== 
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2174.outbound.protection.outlook.com [104.47.56.174])
	by mx0a-0064b401.pphosted.com with ESMTP id 3atdx6rsnn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 02 Sep 2021 08:39:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bMfTt6AEWllJr6xUgi0xc31NWlmZJN3ZSKV6uRhJrTxXw4rnZxbwp3PhDK34sUzkbbyLHWGzNhIls1JsFnEi1tb+rUw16+P4SBA1/D+vqDCPESMbJqVWNc9zQKdUMfG6DS0UKCs0Uz1Fkom94S7DXU61U8hYBqWHSA0FnQgnassvUQpMz0Y7hfcsK9hvzr+DbxKroc5IGluHqXV197iW4MqsLZKcDZSWjx6ryz23OHv2p/otQfms9lWN6yWSHYAxyLIUIh24FcfFS1WIKQ3FNkBbwk7znijs47RWekgfk3ZdZm8VFcC/tX0sj2gV2cAmGqj/Svd1IdfFFKC+mGMbCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=iJn1Vrh/kU43NyAb7nPNJZWdXFkrK0CWf+JuBxVnpTg=;
 b=VgFUdvhNv4X+cys9eTFbJd4pqPQpouNxsygLJyth1rSrkSbjPgZn8bCQgx/2Pg49HygqL/Vyo2jbrXNZMkfassT0FBIBQOqR8zYOQv97c2ymuxj4t8WMcJH9tHZQWnMQ9TW3KsddgJ+UFrg+svQDfBGyllIPLlOV4AeUX/klhfTiSuXgzxhG6ZAW7Yd4o5sxOnq+KmquKNpPKRGCH5BYa1d4ZaH3dwtMH8CAmINLm1UqeqWgsihvAi80zCT7PjzqU38cSfTFEaQQHieRRHrAiizLzKMLWkTRhiomQVyce7kfoENc7TWQBzK/VtKSBHZyeLxzSZyRiS/HOQ09pvikyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB4862.namprd11.prod.outlook.com (2603:10b6:a03:2de::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.22; Thu, 2 Sep
 2021 15:39:28 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::fdd3:dc0f:a385:34d1]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::fdd3:dc0f:a385:34d1%4]) with mapi id 15.20.4457.024; Thu, 2 Sep 2021
 15:39:28 +0000
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH v3] python3-pytest-subtests: add recipe
Date: Thu,  2 Sep 2021 11:39:10 -0400
Message-Id: <20210902153910.820023-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.31.1
X-ClientProxiedBy: BL1PR13CA0436.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::21) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-tgamblin-lx3.corp.ad.wrs.com (2607:fea8:c29d:d7c0:fa88:8bc5:c0d2:27cc) by BL1PR13CA0436.namprd13.prod.outlook.com (2603:10b6:208:2c3::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.7 via Frontend Transport; Thu, 2 Sep 2021 15:39:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b784d435-46b7-4808-a0bb-08d96e27d9c6
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4862:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB4862F4B4B11E1C87DDE68A5B9FCE9@SJ0PR11MB4862.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	quB0nOCC5uL8mGl2NuQJUhgeGzUnmy0Lj2xIR9HTnsPYWhx7orbM2sm05UiptQygbWVMnX6BHOQcktv/Z7qW2gvEG54xPsA+GAs5ZMAplxHyYZdaUzNUmoLyU0/ebGeTg0/igXUAARjkSaARQRJbYcD4972rf0rY6vIaiI6m9RbxT8jdA41tn8XZcprK2cXdbJ21ULKBFA8ZpnwdKabv/j2SaODnVqN4UYmKaM4beDb7E82WCTMBFMGcU/jpjtRLOZYxequPVC6Yqvcv5ISQ1QnsQm1eHlW3wk7dtyVePkmT7SOc6hA0ZVyw2KR6lCsNfEQp35ok7R6j9r728XscJPglh6/ahSMoqB2DQkxPWK8fxOATJFyC5p33gl15rCQ2YL711bwCAAc7KtrG3jX0rwcgCkePj0AVshYtf7ctLmbkSdMgA7XaA1AGnMn5gTgBqNvnIrtuvM3Ue0YRcT5QaAJCgxCUccDhHzPRj5oUJSBJo6eI//2O060oa7+ajPMifR2ztfGYNeVBgKWNsowCkEy1RTE+CnboFpmhDHhbCLO0KBUnZKDV+8RQN3BjP83xjqQ1KOcEJHq1p10GuN7pvj5ojNrLR63XXyPLAuDH3uy+lUKCePWsl+Sk9I68cttmobp77Vy8ILve6z28k/KUVA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(366004)(396003)(346002)(376002)(136003)(66476007)(6916009)(186003)(66556008)(44832011)(316002)(66946007)(38100700002)(52116002)(478600001)(6486002)(6506007)(5660300002)(6666004)(6512007)(8936002)(8676002)(1076003)(86362001)(36756003)(2906002)(83380400001)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?CRN9FScE/QYDVEP4UBstEVq+hN8BsP/NxQjZuRxffQm0e8qyXjOV1tzt62DU?=
 =?us-ascii?Q?Ndloza2Igq0nQUJdzVjQI7/2urVxE7KeRHHRbZk6sbNYPLqShD4w7kEHcAs9?=
 =?us-ascii?Q?46ZX+rHerqud+fjK+DN5SeapC1jwyOna5IycKkhULKb1iiXwE0YQTMxM93O3?=
 =?us-ascii?Q?OMKHjssQOjlH856yp8bXj+NKrH/vE3djctgXTontbDLzzLl09JsSMJXlXQBS?=
 =?us-ascii?Q?tdQV5WJCaeUvYJgEHlQJ833qj0BnsJGihUmWtOs0o/Qet9tDwe0MGSh9vaZe?=
 =?us-ascii?Q?EZ9ntq2q4Lt7t5RWsjuvvlMUWlGfVo6RRIjhp6M9un7ltMpO9GmuoVFwUYyb?=
 =?us-ascii?Q?BfqKQveIu6RJ/ophwTILWL/yFazqISN707qvl7/NrLQ8YCYeqInc0ZNcykR8?=
 =?us-ascii?Q?LK2UpatqBu0drRyUOdhlK/hjR5AJ2Bq9SVlzdvCwdCtBEzVxquXzY8cAnaBT?=
 =?us-ascii?Q?jHoUvcJAi0QoT5/2RQBrcJFykqO1IXR9OoqA8rXT48zh8wrajVEKmbAawaWY?=
 =?us-ascii?Q?R1yPb3kij/J0GTFfy23N9HiAc0ZufUqQSm5081wJlPhGwdhq8vpuihFgr4cJ?=
 =?us-ascii?Q?wJfMVNcMqEC2LkfKyqrneeOeefwhfeS81CihGIuF5+eUtwL24R+Fgm7yPWrD?=
 =?us-ascii?Q?1dB2fIh5mVziF7rSfZMlHxyLeg79pVIBJnMI1ax87Nb5M8OK8WZXO0zM0HDV?=
 =?us-ascii?Q?3N3XMOHqkwVKN40AhaDsh6wqiJtGaUXt13Kbl4mO7Vvvxy6U72AXY9KMImsT?=
 =?us-ascii?Q?2tB5mXhiftPb91XNlrlITdpn0YUxIiqjx2lKFcgCt9mtXfQUDYfSXV10njlP?=
 =?us-ascii?Q?lADjMUmxiTAJqmExuQKRlRNFKhieG2tuCiy/PV2cDM9Qy8zrc+BR4Uk8CkOl?=
 =?us-ascii?Q?vlEeM+LX+u+rLgWNWnYjDbURsyl5po2f1jjv3p0lq3RPw89bHFOKLokWdZTN?=
 =?us-ascii?Q?YoT7/TSjjqXzNnem8oKJ7VqLx/D/sTkxrkQNExXzsLTjYPB613xs3WutcBsX?=
 =?us-ascii?Q?lPnORtuau9puNO7psqfjr0bMHTBYixtBlFLHgNaNyO7D2x4JkGk324MxXOjM?=
 =?us-ascii?Q?aUbFk7KzJQxaDZUSEYqwqk70PzSY2mGL8NSLPiGfJkasSAsgDkD53gzmeDqs?=
 =?us-ascii?Q?pCYF6qEyra1Y6HecsKpGwzi23yOyj+nDsvldL9Jrml+FK5jN/Lm01kJwdFjc?=
 =?us-ascii?Q?ylvgEM9Sm3jmhccLo1PUI1Q+OeNifP/Ls26flia8nVKHSz5VmqrK+LgwRuc0?=
 =?us-ascii?Q?vmgtzjEIGKqBCWAGFrG0O/WwEB4t+m2c3dTaXbzWh+DPW1uNo8xU8atf2FxV?=
 =?us-ascii?Q?EySDgjkk4XSkbamLZq6JldHXxYs0y/RmeLK1+6Yeq/hmlunGFK8sowudHq3/?=
 =?us-ascii?Q?j4qa3AkQ6zeDPoNphgLGy5qQapSl?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b784d435-46b7-4808-a0bb-08d96e27d9c6
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 15:39:28.8177
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9/5x5jMuIyP8spByeLWDYI3BAnBm9zFlDZVALJmm8A+c4E5FALKzbJS1ZTCNFGTgI1uNzGWTa3aEijstdDfKnighpYeOB319FYjR51TTrr0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4862
X-Proofpoint-ORIG-GUID: ljbOLwnQEpRp-wPHnQmZ67t6mtExij7o
X-Proofpoint-GUID: ljbOLwnQEpRp-wPHnQmZ67t6mtExij7o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-02_04,2021-09-02_03,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 mlxscore=0 spamscore=0 priorityscore=1501 mlxlogscore=658 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2108310000
 definitions=main-2109020093
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Newer versions of python3-cryptography will rely on the subtests fixture
for their ptests. Add this recipe so that cryptography can be given the
necessary RDEPENDS when it is upgraded.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 .../packagegroups/packagegroup-meta-python.bb    |  1 +
 .../python/python3-pytest-subtests_0.5.0.bb      | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pytest-subtests_0.5.0.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index ea5683ce6..b5a2f5d7d 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -348,6 +348,7 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-pytest-html \
     python3-pytest-metadata \
     python3-pytest-runner \
+    python3-pytest-subtests \
     python3-pytest-tempdir \
     python3-pytest-timeout \
     python3-pythonping \
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

