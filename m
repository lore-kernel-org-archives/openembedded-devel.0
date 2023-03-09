Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CD9AC64EC4
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 05:08:08 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.6510.1678338481382501310
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Mar 2023 21:08:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Ybc5tw9L;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2432b735dc=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3294U8mE032209
	for <openembedded-devel@lists.openembedded.org>; Thu, 9 Mar 2023 05:08:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=CX9dEamToNKp8rMahvtF5fxOufVbuqORYOf/1HBiEWw=;
 b=Ybc5tw9LuR1vlhmROnn2OLAgqdE1GwX/pN22JPZrwCRbyGCRavQvQLEBCAQaMYJqiNeQ
 lQSgqVY2yTG7KzJip5wNk2hkP7cB2pSbMHpsk8XVG2p8TluhYqk61oLh/G9uReMWAs/e
 FXz3WKc3Tv7ZPsLlcUDxNkozgjRQ3QwOCezqng03GV47wName8SChv2SIQwHrBCR//a4
 +zMe/uXTKF732NL/FITWvzV86f1gif8WFlKJJrzgEen9cMzZrZrlnTyBsy5AJoiXoJXM
 4ab9ZOqJnO1WWEDcwvv/iYfk7BMsR2aivmjcMSnOgLNXfJhrIjgpYYiOYiiHLvwyKUjb kw== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2173.outbound.protection.outlook.com [104.47.55.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3p6fg6h961-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 09 Mar 2023 05:08:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lgxFwhnnfhYVVPxCVLk53R+sc9bQIvBzCvsqNVSUv/5KsNpDgvD3OKr3u2V1pLeu+oSKINpzvkst81o3dYoyT3IQiSPqwN4XclWHTtySGZCzD/24sX/ZfZ3mURQV5kQz7SYisDiVPf53Y6h50PCnhVwLYpAjr+nP8WSit7DXNBuoJNaP9Sk2sISXa5H9PI9jho6461bt3KIYWCZ18CjId3Y02wBU9gCMqazzmIE+/qmmFGsckmtnIJqQkQM+s6f85Gf2QhzqnIu3RTG/7ictdUbZdj9QAd0HVJooeBN3eUYth05WfS2oDTXp9B4dNv4+BJZ/er0TOpFI5MCcv/Fddg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CX9dEamToNKp8rMahvtF5fxOufVbuqORYOf/1HBiEWw=;
 b=MnOMY/V4sTZgzQCt81k8yJQpmQrYrAz5UdVHHUuOpbp5rUySrStcbLF3KHHq82vKgC+Rjqge/Min1BUzEsawhs3RFJ/Pz4lyRbBNaJQo6FPW7Tkpvgdav2B8LVHE0iK4BlB6JvwLGrBYPcfGeKWFpW4LSF2cROTHjKexag+gbfoYuSe2hZPDOSZk3hW0QfONdoH6Xe/TjVNlfuiMLg65dT6CG92Nuw3c8CwMejWt1MqV1017u4Wj3k8zu6/8L56WZdrnbY9LyzaLmERzBlysKu7leaN9rVc3NreSQnKaGx8KjBqiqWqJAy/SDXDQ593nQf4cz2HypKY2NB7fB1jTbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by PH8PR11MB8061.namprd11.prod.outlook.com (2603:10b6:510:250::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Thu, 9 Mar
 2023 05:07:57 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::42a3:f515:f89b:4eb3]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::42a3:f515:f89b:4eb3%5]) with mapi id 15.20.6178.019; Thu, 9 Mar 2023
 05:07:56 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH V2] python3-rich: add recipe
Date: Thu,  9 Mar 2023 13:07:44 +0800
Message-Id: <20230309050744.1797338-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0140.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::20) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|PH8PR11MB8061:EE_
X-MS-Office365-Filtering-Correlation-Id: 4145fd85-26e6-4987-260f-08db205c3ece
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Na+YqZnXk81/ipG6v0Ea2q7X4fZUtM/by4ezL2atYGJVrR+0G3F6Xpr6YahzbNmXs5wj86+tpbMyC/JTUz9PKwcUlKYCGQVxPvO2uC60jvOFJFNQfBPEmo5BckjoOrxueP01rnQYr+1cIIig7hu71CNO/vulnKyVCUM6IP06W17Nlz6Uw17TJ6h6QYHfYOshV6zsHWz4VOX93/fKfRU1Zv4BcDReERF8al30ZV3iE1Xjp4hzyaSlbN+wrgTHT2fRSmmm/3OB2lqIRdcHDqWBjO/eVz8grLE1JjZ7y9UugQ5aIHQK2nCMdsTemlkGXCgMzzjnCjixjcKujk1vsWwImuq0w3AhCwBSi7S+7I1IFU8BR5rVHCR7uK4Hzc0o+ZwtjGUUiCBLaaJl5qnZ3u/RSccU2ip7pcOd5tIxVa//DMlPdfZ4lAGpQsUyP0RNrmsNvd0B5GJIBkxZ83ot6Q5SgEZ57nfbcO2U7SY1jGHCKxYoRseJmCoGTOx10x4L2IqZwFcDalfDcHJe4CBdBs/0R+6zCYOmg9sOP3z4BaH1InwQYKkESJdHbDkxyIQ8oV1M/mT+8nEENXp6b3RUx7axNFrEZQq6hXkbiefDqyOFQDQOxF2n57txO310sksldVXfhj93Bc6sRIp/B4lCcxs0y+A5JO/nsGp1NuVMAha2qS9f6qG8zEc49c/f12yaTwWx
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(136003)(366004)(39850400004)(346002)(376002)(451199018)(44832011)(5660300002)(478600001)(6512007)(2616005)(26005)(6666004)(1076003)(186003)(86362001)(2906002)(6506007)(6486002)(36756003)(316002)(52116002)(66476007)(66556008)(6916009)(38100700002)(8676002)(41300700001)(38350700002)(8936002)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?VWvIzFjYcE37m0r3hw04xguorJt2Xm/C/+pA3MlaLiYTUHm8sKrAadDXF2FQ?=
 =?us-ascii?Q?lDqDTzx1movi+qfl920ogVV/rEFpVmoJV56Cq44LUre8v1RuTLLXhMahFeUo?=
 =?us-ascii?Q?NpTYrybHDCJa1xAlLcfvxGVuLSz/wCWH5L/hinYbqAuUuUXFpAqOxQ7fv+V0?=
 =?us-ascii?Q?8ifxIXmDMjmwRR3boBscijV22yIcpwCr0RT03c8HbyqnCO2Qd28jYbnove/H?=
 =?us-ascii?Q?eklClbLmnYFmEo8yya9ImMnDOJ2TYPOPOJD1pclWEyq76iHfQAkri7QwWiur?=
 =?us-ascii?Q?1zigwgBnGhv3ClAj2SjlloVm6pCp3SDZcqsA6X7VTdko9XrhD6NMQN0fdPdu?=
 =?us-ascii?Q?0xoT9irc8vPrdNEi68WV9jnH3j0lUk85YWiOyiKL1c23xoIpD+N8/g5C9lZX?=
 =?us-ascii?Q?4hSGKwqVvhDdYxUYNOyZ3zlLV7KwSuEVBe6J2s+dtwpidhqEcePPYOfLU6TH?=
 =?us-ascii?Q?X9L2jaUsUZfiOnMgkrw2ESu0eF/+chKSNI10NETRbxBwcUyKxIXzJD1Kn9Si?=
 =?us-ascii?Q?vz0iwwa5TC0Mdb/9apuAxmd5ZLwL3FHvOCXvKmZGJBmJtZ0aN28JzvJwRG3D?=
 =?us-ascii?Q?5pLgdLT03gXYSQyyIxrJ6VIZlTO3vpaF8Ks2GWFUwLir7L68Zvf0+MJcXbSc?=
 =?us-ascii?Q?0/40pzyusSHbCNy0i2GgyXjl9Beq9g+SIInqKisNtzrts5z87r2RGjet/15q?=
 =?us-ascii?Q?Y5FBjimefyszRT+kVpixICDFeHtauarX42jVBJJtpuf5ygQKylWWlua/Oget?=
 =?us-ascii?Q?y9rzBvyNNbFP7ZJ2n/9EJLMO0o8UtGLqwrqJY95BQpt4VtQXVFo3wpdqG55E?=
 =?us-ascii?Q?g5k1i5oTZzearK1xbtMpqUkurTVKPB6ebYt/PP4CAURAp4G6qzeKB09OkJy1?=
 =?us-ascii?Q?PwagvTryb6bPsrlPWGwTJPHR7oAaA2UXe7/ak28GX76f/65Br71GTJz8jio0?=
 =?us-ascii?Q?N+9vHFwtGQUs80d7UscJAeQi8Vt7/XibekdxueJE7NbtbeWKPqawMV9hQvx6?=
 =?us-ascii?Q?65xZ6zRs503sMKHYSnR7GwbMYqt15Tb9/kv0Sb4omIxO7hH70tFmbsnHdUDQ?=
 =?us-ascii?Q?OF2usNwIfiMO0kNUb5b0jju02t4Nx01I9XgEFHwHtVlA3n+sa8hgiJvPUufy?=
 =?us-ascii?Q?v7V5Rtb6pKkuB2y/eem2JNaoj0im0wP23p11v+hOhJWONRpmkDR+wZOxyQXl?=
 =?us-ascii?Q?u0di8iVeVmZvWrDriBtiqZAMR+XBLcA6gw/3YJwAm1gcE8KyT+pEcGT9UCgK?=
 =?us-ascii?Q?fBOCsr4v2Szii4tke7rZeKWxnmLOS7b6S96FXZK11Z1mnEgDH/ZltCTdP+hW?=
 =?us-ascii?Q?nIFufCt4XPjSWF9EUeZwS6ReEpw7JZ4+4vgfzH7CYXZj0Zi20BTTRUyyT3CU?=
 =?us-ascii?Q?uQQc0guHSQDWOptHA6j7+mPR9MJBgHInD6QtQfnIpEJtQYjCmMAUjo/QrisZ?=
 =?us-ascii?Q?1i3V5B0EtYU5+7XXSS297sbAStE0MO5uCU1oqWX8hH4GtxvRDAWVYxsEIKFZ?=
 =?us-ascii?Q?OvPqPE6rs/jGbtPg/loOQyVETWYVpwboVYEKh2quPwgIqxBYnYuk/NZ1y/hm?=
 =?us-ascii?Q?gl3uX3/JN3X1aSMefdJ0T1duEe7zstWYP13tHjQxJSWXMNmTJ7FknIxXGW/D?=
 =?us-ascii?Q?WA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4145fd85-26e6-4987-260f-08db205c3ece
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2023 05:07:56.8959
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ixIJ0YqhG7zuSTdXgs4r58HXydk8D5wgPqfKopU2HS9QsuiJwUm8sWAyKidnPmJyByBCJm6zgH0CqcdQxhDtlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8061
X-Proofpoint-ORIG-GUID: f2s3YMd2SPGUj_5Up4n8sfk930ZSEk4b
X-Proofpoint-GUID: f2s3YMd2SPGUj_5Up4n8sfk930ZSEk4b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-09_02,2023-03-08_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 mlxlogscore=861 clxscore=1015 lowpriorityscore=0 adultscore=0
 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303090039
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Mar 2023 05:08:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101429

Rich is a Python library for rich text and beautiful formatting in the
terminal.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
V2 Changes: * Use python_poetry_core instead of setuptools3
            * Add RDEPENDS
 .../python-rich/python3-rich_13.3.2.bb            | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-python/recipes-extended/python-rich/python3-rich_13.3.2.bb

diff --git a/meta-python/recipes-extended/python-rich/python3-rich_13.3.2.bb b/meta-python/recipes-extended/python-rich/python3-rich_13.3.2.bb
new file mode 100644
index 000000000..1cb90c568
--- /dev/null
+++ b/meta-python/recipes-extended/python-rich/python3-rich_13.3.2.bb
@@ -0,0 +1,15 @@
+SUMMARY = "Rich is a Python library for rich text and beautiful formatting in the terminal"
+DESCRIPTION = "The Rich API makes it easy to add color and style to terminal output. \
+Rich can also render pretty tables, progress bars, markdown, syntax highlighted source code, \
+tracebacks, and more."
+HOMEPAGE="https://github.com/Textualize/rich"
+SECTION = "devel/python"
+LICENSE = "MIT"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b5f0b94fbc94f5ad9ae4efcf8a778303"
+
+SRC_URI[sha256sum] = "91954fe80cfb7985727a467ca98a7618e5dd15178cc2da10f553b36a93859001"
+
+inherit pypi python_poetry_core
+
+RDEPENDS:${PN} = "${PYTHON_PN}-pygments"
-- 
2.25.1


