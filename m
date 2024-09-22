Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C57FCF9C69
	for <webhook@archiver.kernel.org>; Sun, 22 Sep 2024 07:36:34 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.11080.1726990592705801808
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Sep 2024 00:36:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=999533e59a=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48M6pbGH016865
	for <openembedded-devel@lists.openembedded.org>; Sun, 22 Sep 2024 00:36:32 -0700
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2049.outbound.protection.outlook.com [104.47.70.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41swnnh2wt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 22 Sep 2024 00:36:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yr+EuxOcLFlu55eXmwd8FY4aFWrOO/x5+8ARb11Hi6UtGnFw1PMFViFpyj/LXTtpsKpmsHZPjK5prb/Ls1JzRv1usZmnydpXIpebHCKj7mW5Yen1p/dTk2hNuP0bqgZFq1nkzBeVRcnwPmK7Fc8lwF81KfrAz9NAzxIYWkozhTzP2/RIe+7C402BwTcLoQY5x1AKLlQpLJB8gziqRMrk3+66J1FaggzNgejLXwepvwCnUufOuDe6WUeEt6QvDxs9IiqEVAqiIWQOyRWxnj/O3edkbxdTx1G8p4KNsv5/RD4LePmYGywzBNjut1hQeqcpGOoHlX0Az+IIFURbypUAsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iJr/k6bNVnrU5kzKlXMazjn6XSB/A7XVBdtSwq0SdiY=;
 b=X4c3njjYUPwwc8oVfEgaf5saQQddEF/PUQN6TfxzK+SU6NEUHFtxSitGpzOdHFOqk+HL37LDZAI5HDIzxDtBMqPqfxhpvWPdB94K9ChZHLXfs5P2OmoJdqKO3xpm0lKp9Uvy/hudRZn45FbwhKhpL39wqv2xVgAjo55sMo16vU6/P1lB8yZLoyX++ojL7+AlGXH0w/+dwQnU2ztd3MKDyCug74VqAzI+DoroOZSiBpqWRSPh1vVP4ph2Hin3gTEETGJBtdHHUVMoX6IaVnc89qB7pFc8CHF8LFJJYMV+BU340graeRJSx1pYtXOFsAXJhYyIP6/jlMoHvu+PVbiOEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 IA1PR11MB6491.namprd11.prod.outlook.com (2603:10b6:208:3a5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.21; Sun, 22 Sep
 2024 07:36:28 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.7982.012; Sun, 22 Sep 2024
 07:36:27 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/2] protobuf: add abseil-cpp to RDEPENDS
Date: Sun, 22 Sep 2024 15:36:17 +0800
Message-Id: <20240922073618.1359707-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0101.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::14) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|IA1PR11MB6491:EE_
X-MS-Office365-Filtering-Correlation-Id: 44adeb06-09be-4211-0750-08dcdad944b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?SjqXxuqRL6K19m57Ykx4iaMuuW8S7hr70nllKVpgG3BJrTlgqFfRQORNBhTA?=
 =?us-ascii?Q?2qmzYrVpn3Ei/bO9CJkJxcQ3Y8R0XIb7TJoecAseVPRKEXB2HrhP/vKBbV7S?=
 =?us-ascii?Q?JTLdEYLUyZwyO/w/+UcdTKbG9MRjZqf2VaPWBGrRGX2+gSRKF5UGyIBE6K2n?=
 =?us-ascii?Q?Z4sPJgaCELnsmIJwEe50tEmo2JdhgGXjRmYWSOJcW9fLTRaWwgDpmBzW9ORO?=
 =?us-ascii?Q?WtI/opBeOWYrz2FUl+cqezr0A/CIociULJmwSDe9h4P6ym4t4m+ZbFNgeOeB?=
 =?us-ascii?Q?M+uV4AnHq+W8FJQQLFtRml+a2K0VQ+QNyTF8/oALWABZRiIfPvbUU7wAuzc+?=
 =?us-ascii?Q?V29scV3stT9sacrQo7SarV5tiP0EP/et8BekL8sGUeViQfGNP54ap2Dusyxt?=
 =?us-ascii?Q?kziVBTPDspWg2Z8R+PHm4x0cFevkBVcn7j2/VntL30tQb1d3I6w794vkmzud?=
 =?us-ascii?Q?Hq7a644xXan7X3DxSK/LinKuYG+LTtbOgZdS1rbnEuzKUHnIN6cD/KnvQYxx?=
 =?us-ascii?Q?4ZT3//aaljTTRA3oO+YpAVENSSGBvvtEDeorRetst7FvV9Dp3Bh0CJWZUFzm?=
 =?us-ascii?Q?Qm8qjdJsyLv2I9Jw1vHFo3ZwjJ6mi02JXAFBO76uB/GchQpU/reX4T7yUIip?=
 =?us-ascii?Q?TZTcTlgjVnzcoXj3L9Qxy1oGCskDejtT/cAi7uA+OYQwMciwoQA/Djq7aOE4?=
 =?us-ascii?Q?WGpuL0BkUi2LMF+pouhgDXsn7bh5Fsxz/BLNGLImmwJuR7Ck2Gy1hk8cOuQH?=
 =?us-ascii?Q?Ls6c7/Kxq86/XkAJjKXHm9WGli21WqaQoDEnf+O9KtzI0I9eI/1Wt0mATTn3?=
 =?us-ascii?Q?P59vCWMa5+NNawQgzA1b+ID82qqoW/w5586ZmNRD9vzie45hDFY2h2ECXNx/?=
 =?us-ascii?Q?bPioxP/5Ma419TaY4wspAFic7FuPgy2ZOrtQdNlX1sgzdvGsxlUtERQh+Xzr?=
 =?us-ascii?Q?5ZCUfG3ztcbLZardPKyOfaeai3pkt+6fJlldX471rlH2/Qnxx4lEPfpAn+5+?=
 =?us-ascii?Q?lXALIlN7NQEvLmntw8dKWShnHxTgMOI0BT4JQC80KxhDZ9Paso1mburpwIMy?=
 =?us-ascii?Q?gbvLUWZUPnIO49yCR7qTW7+Z9L04gqpg6drM0NomKJuI03z3ml65dc9b2GCq?=
 =?us-ascii?Q?czq3tnaGawOw7iflOBeab5aUL9tI+ptfXDHI6ysvbvwyfvsL4qQ/RljKbfYa?=
 =?us-ascii?Q?C8w9wgqHJ6VLkStrY6VgWJmOPsahJYF7K7jnoYHDEAYZ8ylaqZ3XI+wkA+J4?=
 =?us-ascii?Q?wefsd1yREXsvJlYbI4mzPxoSzFiYqdSrfZt65FJtzT77+M5r7Z9+q84GiVoV?=
 =?us-ascii?Q?2y/5bPGSAL2i+LZL/kXuQWrqzoqEQNWG9yO1p8FW6Pb7d1upyhk8/7S2Ib/z?=
 =?us-ascii?Q?CHWoYblICIBP8sWptPhWp2t1VxhE17dkrpcoYPYSFvgk2IvsAw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Q87zWhHG5LVl04QsulvdrIftxhPhdmGozchvDYjP7rCrYnn5OXANCiPFBGvC?=
 =?us-ascii?Q?WT+MmQ5FjnAXs4N9tKAIz/1ukvEcrOD4HmmBFi1XQrU6g/PUEfqjdYB4wItD?=
 =?us-ascii?Q?X7OjYseg4EjI1yP3YxYqszHXE/VihsfICFg8nbiXqisb1cS4EzMS7UoTyahf?=
 =?us-ascii?Q?OeJRJuMoCU3T0pE5WmLt++eAYFJEIxnkQiXJ/mEcgxFxPbbbzzaDYWmvf+f9?=
 =?us-ascii?Q?tePzHX24rRrAUdHa2ULH+4rcgeJX1t6V0QT14EwdIvf48hEYSPXEJ27xpyBo?=
 =?us-ascii?Q?JYULz/s/KgFZWdv3VGziv3N5T/NBS8aflxSzT+FlpQcMosXX41drJ0YV+KYE?=
 =?us-ascii?Q?yJQX+ex9g6/JxOZrRGvtLIcXipiMcYH5lycgaOwQHGDCK0nxIWCoQ3Oz9E1z?=
 =?us-ascii?Q?FCUTb1ix18NxVYIdx41+cdMQUSIkJ0aXx/s6OURyFa6Ur5aRHqQmhcGs+uME?=
 =?us-ascii?Q?SY6UFXePDMW8QFmSgUMwi4mqz1VWBchkvHbBKsaB9SpukEu7wSd5mJyCQna+?=
 =?us-ascii?Q?kaBfqIBXoLC0S4ohAY+yRUhoOL8fUfzwcAHt7A3XVfuf7BKfJCV4APNXXc6U?=
 =?us-ascii?Q?mptUKGhATovtlcNKIF+iV/ZsdBn1xHG5AfUGnBW5+W/tr3H2DrPYw3x9Dl+/?=
 =?us-ascii?Q?0KsAcdMwANVRRUm3cDm23yuWgaDYmiK4orGuaK8XNxkTEN4qpUxbziLwD4dA?=
 =?us-ascii?Q?SJE2+d/UQw8asx7/dWQ0fQvnQZ7rlwN5SFtmOpSZhIQmKlRJcFhgve4y+oV/?=
 =?us-ascii?Q?YzkrSGDmN6suUsASaw3lixPyI2yUxFfx9KL2UGhqvga5+1c+UnJQJVsBn6D0?=
 =?us-ascii?Q?1St4NGdDF8HY8BavOGlw5lm5ODXLqMOYP/2yCLsFPqZGwA4ndzpQ3+xahSQO?=
 =?us-ascii?Q?fqelvQQmLHyv9Rdbr/nNZ6xSW22Wyv4T+UqNDe9oCjSyLGk421gG6OZkdFwk?=
 =?us-ascii?Q?2cUCz3JSKKQY0Yiz4osI4TILWk+Acj3iYZlNFQaWsSUwUfQiu2n2A6WFlWZf?=
 =?us-ascii?Q?rZSuUvRbn5G6FJtEwToOm/N/q9rsi3JViVBWlBKsv3xGk9W/1ZAboelFgoqC?=
 =?us-ascii?Q?a2TUxHuP/wc1PqK5a0H+rIyEjDUQj3bUhcB8x5J1H4zK6se0dGCOOhCJDr4I?=
 =?us-ascii?Q?GAiUTjkncKldxYuDiRACXq3eSLd8ebBv8CCGY+FOeX5bWT6xj/wdS0fbf/Dx?=
 =?us-ascii?Q?S5HUJcaAGC/gi80SSdE4XcuT7W1FFhCrh9BH3w6Wy5KRtDY7VlrXCjRzDDQ5?=
 =?us-ascii?Q?DtVQa0h4YKohAS+NDKkKrm8X8AO81EJCRqZn0wdb5M0/6s0S0XffuuAjjZLO?=
 =?us-ascii?Q?w8y0lrMiyu+e7p0GknJ+NW62FDQ77ioelXLwrkkJ35zVAUJ0HzXpr+mGcCsF?=
 =?us-ascii?Q?XzlHi0ajVhy+LJWLzQxcfGvjc68zTUnRlkhXAtJ2uWV9BVzb8cGY1ZyIMbs6?=
 =?us-ascii?Q?oNizBtJhZAtDIguB6QL0+RRZnei6c6rMbmqilJEWX+meB9MPV2eDkNgj3HH5?=
 =?us-ascii?Q?rvVnUwXqixMBlHg+/FkfWQqLOBQ738s/yOvf9WTReAhsBSQpHVIJHzzZxW8W?=
 =?us-ascii?Q?osiZ1IKB9+4MEsDVbD8//FkjXLb6+lKX/bjaAVEw?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44adeb06-09be-4211-0750-08dcdad944b7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2024 07:36:27.7833
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M25ehdOZ0xfh2ojnFXpSLFPWnWbpYbuNSzgKdW1Pxpl05GWqz3mbw/cHUu/hvmwpO8ZFNkB86UGzRvpeY2mYAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6491
X-Proofpoint-ORIG-GUID: BO09bKckYUtAJ4QZ7l1ejWUX4LxrSBXe
X-Authority-Analysis: v=2.4 cv=f/QaB/yM c=1 sm=1 tr=0 ts=66efc900 cx=c_pps a=YkRwJB1Lcas13D3J5+BQ6w==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=EaEq8P2WXUwA:10 a=bRTqI5nwn0kA:10 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=ANhjw7PAOe8Hl4ywO24A:9
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: BO09bKckYUtAJ4QZ7l1ejWUX4LxrSBXe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-22_06,2024-09-19_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 adultscore=0 mlxlogscore=672 suspectscore=0 phishscore=0 malwarescore=0
 spamscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2408220000 definitions=main-2409220056
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 22 Sep 2024 07:36:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112448

Since commit[1], the libraries of abseil-cpp have been splitted into
separate packages. When protobuf is installed into the image, only 48
abseil libraries are installed as runtime dependencies. But the output
of 'pkg-config --libs protobuf' lists 66 abseil-cpp libraries are
required. Add abseil-cpp to RDEPENDS to ensure that all required
abseil-cpp libraries are installed.

[1] https://git.openembedded.org/meta-openembedded/commit/?id=dd6421e65eb75c35a904f4b487ba022075035ecc

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-devtools/protobuf/protobuf_4.25.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_4.25.4.bb b/meta-oe/recipes-devtools/protobuf/protobuf_4.25.4.bb
index cc5204de4..354b3213a 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_4.25.4.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_4.25.4.bb
@@ -106,6 +106,8 @@ FILES:${PN}-lite = "${libdir}/libprotobuf-lite${SOLIBS}"
 # CMake requires protoc binary to exist in sysroot, even if it has wrong architecture.
 SYSROOT_DIRS += "${bindir}"
 
+RDEPENDS:${PN} = "abseil-cpp"
+RDEPENDS:${PN}-lite = "abseil-cpp"
 RDEPENDS:${PN}-compiler = "${PN}"
 RDEPENDS:${PN}-dev += "${PN}-compiler"
 RDEPENDS:${PN}-ptest = "bash ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python3-protobuf', '', d)}"
-- 
2.25.1


