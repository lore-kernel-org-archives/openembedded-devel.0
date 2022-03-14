Return-Path: <trevor.gamblin@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23F6CC433F5
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 16:44:28 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.28792.1647276266835582442
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Mar 2022 09:44:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=M5IQ1EdS;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=00725df8ab=trevor.gamblin@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 22EDMVY0012648
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Mar 2022 09:44:25 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=CmyHdqf5PyqU/A3XlPksDVGBDLSypiJSBwF8mkPmLJA=;
 b=M5IQ1EdS4wVh81DvjXK9Te3AJ0bEO/ai3Zt9aToE+etnpfvr/UV3xSdRKRAoe8ZMdAfb
 sI4d84aIiZAzODZzPPom/2dA84NI9xjCIBb2dnRHsEplJjs9FqojL2ZAfq+a1qJSZfPi
 Rn4OzOS2QU/z9EWKOqF2U/Pehv3tsfCVNvNWc6LXOIt1/6koNiwNvSh7dOKAMyCyeEh6
 xkYcayD81d33d+w7hX611LxzfOOpr8/KL+gP8CtxODsW1CgUJnLo2bQagZrnNzUwBdpW
 d6iiKzF8LD5hZ8+DIgG/5dZtk6ezeVhHixZB5gUgsQDs0tZGKFVMbWVqq2GFAI/a4CLC +A==
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2102.outbound.protection.outlook.com [104.47.55.102])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3erqp99mr8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Mar 2022 09:44:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HEpxnXstrYA0ZGMVCDw8l9vZw5nLY0jr35UVby3rXmJPACfMBL1rYOLwyBgPBdnD4Px9Zh9okKqjCeZb+eWWAeCEIN/LU6gir/A4u7hcy40e0rKwfeHsxNI7nGcupDxZ5s/Ncs7AVMQnyj1GHJaQonSZqkdJEZpAxIIwVR6r+d+OiyqyrCKLXmZNMgEoMZtwSPcD+54WgvZ5dSiQPDDInS9AKi4rdMosDoKKYhkPa2IGsA8OTxPJASbTxnqdQYU1lifn7VOtN8HnN+tVAJ7PPMpShwvWuewKe4cP6hco0BxIR9kPV/eZ/XLO3S+LcQhur+lTXgtvdG0T0nJtCr1iEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CmyHdqf5PyqU/A3XlPksDVGBDLSypiJSBwF8mkPmLJA=;
 b=d57j6HXh9Sna+FjZqR+3/CAjxsCp5Ii/kXlrFwZ3FIKxXVHP5Ew+iySWcpR9b5ZkyfZTvezOBIGtQykuuHC+2j1yywHjIoyWiKh6CNjG3KlF04zoDQbHBfvRPCFemi8pbXKu2QdIGplruiv22DgTuOsFX13Hyz6XkJKi4TO3k4SzKVqlvtWvtMU2JA4vP8KiXiAij8eWEtAZGqmJ1EpHk6NdpW5YzlR03sgB6zcJL9ETtScQQAlmDYVLXy8ygTMNFFU0a7zP5bnCEIo8+MYCShZ785akAHMefYS6bxuv3Tly0piFUXXGtTM8J2pmaMtgkhwW0bzrUB5FsnE4U0epXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SA0PR11MB4671.namprd11.prod.outlook.com (2603:10b6:806:9f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.26; Mon, 14 Mar
 2022 16:44:23 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::75bf:a544:9ea7:a236]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::75bf:a544:9ea7:a236%3]) with mapi id 15.20.5061.028; Mon, 14 Mar 2022
 16:44:23 +0000
From: Trevor Gamblin <trevor.gamblin@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 1/2] python3-django: upgrade 3.2.11 -> 3.2.12
Date: Mon, 14 Mar 2022 12:44:09 -0400
Message-Id: <20220314164410.32738-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBPR0101CA0169.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:f::12) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: afb0b4c1-ad4c-4806-1595-08da05d9e50e
X-MS-TrafficTypeDiagnostic: SA0PR11MB4671:EE_
X-Microsoft-Antispam-PRVS: 
	<SA0PR11MB4671B9BFEA184F1E3C55BBC49F0F9@SA0PR11MB4671.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	IbpdMXcBUO4EyKvndfOvIcZ/S8e21Z2TTVDd+V8nyIGVNdAdDeBK/cS0lBNYKjOGyVa2/xy0H/0gDxmMZGZ59QXyo5DziSXH2ejum9CtAaK1Jlwtdg3syWQ3+qiWpNcADgA5zHROJkT8Sr7kebGVGaT3kCx8KhMHfaFAFTeDB+UVsdzMQapkX+etjxFio+00Sxtibb9DlhEsuJEgotXMXY5c30X5/ZDxa9waw+ehQsmpsQi+ZLHiApbOIdSX6GiGRnDM8eaB2AO9E0pBV92gVlrxTe6dCA/ogfRpsCaHDWfV5x1RhCH4hbPeiLdS31SuEg3jQC4nA9U0yrnDmbFn6jaAbbSZm20Q5auWoojzZHZyaPQDQdtOncTghbDYurhnHM2M+jN2xresXp8+jtmPZLXJFNyUMIRBbakW/eLDCVTj9h+F1IJjSPlXDVvnxSQTj9qgBdy9en5FwV2y628S9kFq50+bclIJViIFQPRfSPUEvA6kzPTLdFcFFLeks+jdVfIH0Dcm+BRa4yyZcpIN9zXiWwJPu1Tb4XNoHuYE5sMNDLeGhUR9/MjADIxR/xQQbTfjoF1iBf8tC65Jj4ar8vLCgWAAeYn/1pxSnWCjvFwejCKELv2gcapo70t3SkTprVm1hEigiaAtxVqQsYmO7n4BD8gFCFZAzJF9cWibX2pfh3Xpl8/ubeMkEeoKiARAbhz2LfXA7CDODfX9hUmaCZ6dfJvSk1f2v7z3uXJlpmAvlaAdP5IJSwuCv9gz4XnsGpis+CXlldMY1cWUVNKEh54Xi0GE/MSsIDU+sJtzi6o=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(44832011)(36756003)(66556008)(66476007)(66946007)(8676002)(5660300002)(6916009)(83380400001)(316002)(8936002)(966005)(2616005)(6512007)(86362001)(6666004)(26005)(186003)(508600001)(38350700002)(6486002)(52116002)(6506007)(2906002)(38100700002)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?b6xDDjSaEEJ8xeR6wbZE5tWMUoHrWaFuDmrvZPA/LpHiDilsk/ifYCrGRkeY?=
 =?us-ascii?Q?pyBgtMqC0S55ve2tRFzKEyaPINZtANFq7MbTbEXRIyH12uJw74OdI8yylQCW?=
 =?us-ascii?Q?Q3HSlLG8qrVVQ7PF+ZycKzVE869d+UPBdnmwBtu0vAath416mfFt/Sn+85Ov?=
 =?us-ascii?Q?MJ9+gRQM7ahzjrb1ZJgvwFXWc7qcJAmX4cSl7l1qN9eUA+cdBlZEs4Dl7Wn8?=
 =?us-ascii?Q?RlC8hkfxwNuo6AxXy2IgM4OtHwXJA+FFpDS1dzg0zEP1CEtu1KnVm967ROh1?=
 =?us-ascii?Q?+qcBk85zJR9/5zjA86xeiTvfQkD9b7st47ROWQ4YbV4f/L3US9EZC8sPzN88?=
 =?us-ascii?Q?R8Gg3L/8KZPg0ejPqcloC3uzBecxRRD+mH7QRTif+IT8jih+FIz7TcPOdLRW?=
 =?us-ascii?Q?VbjsvFRMLRTQNWLDTfC55VPJfrOGmEFlC5GOI9i3Hb0igd3Iz4A0Mj5FgzPW?=
 =?us-ascii?Q?I74axEVr9gK3K3j0X6wkMYbcGzEMp0RRRmrWzIkpK8+YUPp9IwTMWOddcjlj?=
 =?us-ascii?Q?3QL7yjpPMWFJKeNPqzvvAtuTqNLzcrIdouMqRYzs5eO38vbI10XU/OW84J8z?=
 =?us-ascii?Q?AEsysI1YN3sQZm4ba8/+9PSJh1b5dkUXISflkAhfdEmMpwDbKcKhP6vWjCpx?=
 =?us-ascii?Q?7ZXtoD+Jj/R5Ckk/Ztq931wanm1REP64J1wL0qCX+yLgqTmAmu4BvEFeFF+Y?=
 =?us-ascii?Q?n7ejIkdBdhpKo2GOzFdXRfJL9PBtIoBWD1jwKRdDIsqy5qHzxdJR3pC3TJ5b?=
 =?us-ascii?Q?jcZbnRdF0O4x72KQyHy8S/ipQhX0P3DCYIW6WW/nstUj8bgBqr5WIn4OFYAL?=
 =?us-ascii?Q?6Lj4OQrlaE/PiJeGj6cxYdt3j4jBhu0TD+WHgFdJuTOMOG3XGd/fLWsA5Ho1?=
 =?us-ascii?Q?gZwnBGSyGBiCmROMXjGpowqR3DxV+goYpA52R4BNs238Gfcnr9OucU9MmoTd?=
 =?us-ascii?Q?ubcpshyK4Qi7mDd9xG1Yx2TJGxYWeyXZc797crhSJ4lL4G0q/1rVQVTNIz6G?=
 =?us-ascii?Q?ez2FBMabZZs3vSPLeAnqRZvUHgLTtVucPXLcp0yUhAJpocqR3sD1QkL44rPi?=
 =?us-ascii?Q?n4bp0mceOBmHC8wx3RcwFDVdJ+YgCP4Itw3YrS2UPgoiyWTy8bzFwI7ck+9d?=
 =?us-ascii?Q?eGRqARGBV1ccWrnNLZcQ/CKqZMvPgF4Zdl3UHI/luKT8A68xyhrqNULXVqTm?=
 =?us-ascii?Q?25E3G70aHAElszUoV+JBP1WUEumrkVocB357aHIulUHlKxfNaKKgrod7Kwdr?=
 =?us-ascii?Q?496igzOD45v4lxQ3vBoLngrqcTcdTSX/kkHa+5Jdg4pQ8kjJ2dChMHp7qpHR?=
 =?us-ascii?Q?Z3x4yKs9Nvm2b7Tb37pARrEtA8aeIfNe1ht7KCLkPplwbfMKM7QEsI8lCKY9?=
 =?us-ascii?Q?DJ7awhO1lSDUh0k0SKg/rmDOyxV+gcRb23uhJS5npQCLtWzao0SISecZXGYR?=
 =?us-ascii?Q?0JeSVGG3KCi/SGtRaS4Uc+aUW2grNXhVM+d/+ui+Nw1E37hkWXEb5g=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 afb0b4c1-ad4c-4806-1595-08da05d9e50e
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2022 16:44:23.7793
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 LEImdQlcobzYJSCW1YG9vDczqcWijOoRVrCJHhTc7crDngWQCSZGnxBd2I2rC55LBWT6NKY7XkCvtSmsVDtLkTG5ie5sfUub0bHpd8n2+l0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4671
X-Proofpoint-GUID: 0ksb8bgbOMSU5gQl_601tqH0zfdC5siZ
X-Proofpoint-ORIG-GUID: 0ksb8bgbOMSU5gQl_601tqH0zfdC5siZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-14_12,2022-03-14_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 phishscore=0
 clxscore=1011 priorityscore=1501 mlxlogscore=969 mlxscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203140103
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Mar 2022 16:44:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95986

3.2.12 fixes CVE-2022-22818 and CVE-2022-23833. See:
https://docs.djangoproject.com/en/dev/releases/3.2.12/

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 .../{python3-django_3.2.11.bb => python3-django_3.2.12.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_3.2.11.bb => python3-django_3.2.12.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-django_3.2.11.bb b/meta-python/recipes-devtools/python/python3-django_3.2.12.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-django_3.2.11.bb
rename to meta-python/recipes-devtools/python/python3-django_3.2.12.bb
index 6b97ef49c..adbc498bd 100644
--- a/meta-python/recipes-devtools/python/python3-django_3.2.11.bb
+++ b/meta-python/recipes-devtools/python/python3-django_3.2.12.bb
@@ -1,7 +1,7 @@
 require python-django.inc
 inherit setuptools3
 
-SRC_URI[sha256sum] = "69c94abe5d6b1b088bf475e09b7b74403f943e34da107e798465d2045da27e75"
+SRC_URI[sha256sum] = "9772e6935703e59e993960832d66a614cf0233a1c5123bc6224ecc6ad69e41e2"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-sqlparse \
-- 
2.33.0


