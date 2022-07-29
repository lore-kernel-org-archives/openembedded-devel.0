Return-Path: <mike.petersen@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D5CBC00144
	for <webhook@archiver.kernel.org>; Fri, 29 Jul 2022 17:09:20 +0000 (UTC)
Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com
 [148.163.158.57])
 by mx.groups.io with SMTP id smtpd.web09.533.1659114552809601521
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Jul 2022 10:09:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ni.com header.s=pps11062020 header.b=tgPkhg6y;
 spf=pass (domain: ni.com, ip: 148.163.158.57,
 mailfrom: prvs=5209489cf0=mike.petersen@ni.com)
Received: from pps.filterd (m0098779.ppops.net [127.0.0.1])
	by mx0b-00010702.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 26TDC1iO001484
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Jul 2022 12:09:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : content-type : mime-version; s=PPS11062020;
 bh=RmzFpzU6MtI/aukKf5ch/K7YhQOKTgUUY2FQpDTeYEk=;
 b=tgPkhg6yYrBdDH/KMB63lQ5/lRtBcXFhDFnr6xckNoCn4Gag0+PCJsU4HQoV1PS46iIe
 6K3myHAGNKHCsrtYWr5vPgAR+dAE8E8gjdwILBidNgGn7sQ9byZq0l9cI3StbpOs8s9q
 dOf+VgEURSqJoFzx0+8fbudR9ihttvF94oHK+KHcI6F33R2muwcux+OxXyJNbG8fBV6M
 1Ft/lXTFmvlG9Ymz3GEtb4JLuRvVqbUtBjr/D0EVX1Z57i5cAczqfC/5N++rvfxU6jZ7
 Ot0mEC/GyvkJuiFkYlPi09W0RG1tsqLA0qWZ3r6VzMaod3r1ncfF5y7noSl4OheQGgdq nA==
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2043.outbound.protection.outlook.com [104.47.51.43])
	by mx0b-00010702.pphosted.com (PPS) with ESMTPS id 3hget6k8vv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Jul 2022 12:09:11 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kkXXcC/KYGtITQ1IK18DFzywRZ4CA043RURSgGu6rKAPzTNZRzsf3ITlPPje53nIryIqeA1fCkep5adC55n3yUYGOz0JU3MYwXAlL/62AhFoQ5Wy0YwIRoq7RfPXJYdaAnrSmMV4/94Pq+ag7Nppvn2ZbTewxmhVoFNkl3WtYvG6wM6tPKNmz0ZR32ElOT+UdzcpI81qctlOmiYC3UKigNwwBa+awUkTwKx1Jh00vpLYf9IlGhJO2cq8NU+tFhzH1Y9g4fAee58xg7Az7oXIdw2+SzpUN1NbsgeNf0CjxwC67KdgOhu4AgrKkWdwtd1V8zbOpIsz/NUTMwKUN3Wc6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RmzFpzU6MtI/aukKf5ch/K7YhQOKTgUUY2FQpDTeYEk=;
 b=ktREVhhlvlPmyJNoUdVTPhi8v8akyLInCYNqZ6FYsv9syJ6rfzcsWkeMtgncgLLagOcTowm0/l3uGMyLnTlWz8HXPnFj9eEeVN15PchSkXClMVpKG91kgCqLSjfv/hHnb+YnqHOAid1v6K5xoInR6WJR2Aq+J7B0PJj/MJGsvd4LG0sn8DmKoAlk2OmNyTsfh+nPEZ48xK5tOeofJuzhu4J6yXqrPtGE/HISVmIKWzmQMNkZlHyoU9pA7CkhQcOmmmFbLDbP/owSUyUT2iYm03yXSRQeMnP4cBnlhMYGigQkHnbyudTd/sQFqOVPiDcsgXm/P7RE7R04/uzqAtWPpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nio365.onmicrosoft.com; s=selector2-nio365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RmzFpzU6MtI/aukKf5ch/K7YhQOKTgUUY2FQpDTeYEk=;
 b=tPqTnd/d6GvwJ1ME+OAMQtZFs/1438IF8KSWC9yaBooSRWhV9NSMD4rCl8uLQFsghXwtdvQbcA4CSDTzRzxdtAnK/HEAUxULJCD1iuvvgtr/h6CUsIQj6t2qX9XZH3haqM7cStnWIG9sMgPPEMZqf/4UtQH4NAilPVMZInWii2A=
Received: from DM6PR04MB5420.namprd04.prod.outlook.com (2603:10b6:5:105::30)
 by MW4PR04MB7362.namprd04.prod.outlook.com (2603:10b6:303:7d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.6; Fri, 29 Jul
 2022 17:09:10 +0000
Received: from DM6PR04MB5420.namprd04.prod.outlook.com
 ([fe80::fda0:b935:cbdd:4d93]) by DM6PR04MB5420.namprd04.prod.outlook.com
 ([fe80::fda0:b935:cbdd:4d93%3]) with mapi id 15.20.5458.024; Fri, 29 Jul 2022
 17:09:10 +0000
From: Mike Petersen <mike.petersen@ni.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>,
        Mike Petersen <mike.petersen@ni.com>
Subject: [meta-networking][PATCH v2] sshpass: add recipe
Date: Fri, 29 Jul 2022 12:08:45 -0500
Message-Id: <20220729170844.68097-2-mike.petersen@ni.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220729170844.68097-1-mike.petersen@ni.com>
References: <20220729170844.68097-1-mike.petersen@ni.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA9PR13CA0033.namprd13.prod.outlook.com
 (2603:10b6:806:22::8) To DM6PR04MB5420.namprd04.prod.outlook.com
 (2603:10b6:5:105::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ff3ecf95-b3e2-40f9-4b2f-08da71850dcb
X-MS-TrafficTypeDiagnostic: MW4PR04MB7362:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	K4z3CVVj4Id8gCVShnFyRfJl2/DUQz5ghzw1EK1xP5IwrT25QsHM1KD5USEbcbrJuFa2H8qzfXZqMGAXnptzQJX9bo9KB7PQtwHnwXJf9PT3F1fhTd5do4MtccA2xslMbwenP9l5fclZSkZ1n6m9rU9hRHGpP+81m8AXn4FsuHVsZBeJX7s0XjUADBsqgaoTGqte1TixuRBl7UZNBsYUtiSgIQd/YgXq95leSPg8tWWVjXFVPI3Hi9W2lzJwfhBwj6bVUqtHxz9VLTJNGRhQVcUEe4Wah58SXZzC1biIStqnwGa8COcYX6W7n5eV4V/lfuYelGbpbhIJmpFhH9GbIypbG7/fL0LlYvGvutwFeyhFcqjRAokVc6lDugvZD8SGV3YEgRvpqRMd/GG8qonJg7tCm15rEtxngW1edxRbiw4+5jC1SkJgZd1fEcoN7/K3ejMfrgBoGh6+5J9U4JEc3jvNMicM4prJXc561R+ZlOyjvhPdiJrE7esnA8SOVhB5mNWtvpBRb/PSOgIWrmhsatcBv1hpotSlElN0GXRRowdyd2/rbWN8q/YJHDxpBJoWBbs5VpRk1YhKgJDJOoQzZq1yppTmPq/kzNzV/Or3MAELuUgutzQP6FEQ/JuVJi8FLiwlT1jG0IJV8WZshW00/L0NU9ZatsH+1oz9k71Zc9WW0PEImrQzUCroMgFr+k8Ff92QoSMydwvi0o4B3G9SNqqkQLh6k5/eKb4FlI0uGATuHbVe/cBEDFR3CNjMoAL2BeX3WWpbXLZwj9mN5AnADA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR04MB5420.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(376002)(39860400002)(346002)(396003)(366004)(2906002)(6666004)(5660300002)(6506007)(44832011)(478600001)(2616005)(41300700001)(6486002)(86362001)(26005)(8936002)(38100700002)(4326008)(186003)(316002)(1076003)(8676002)(66946007)(6512007)(54906003)(66556008)(66476007)(36756003)(83380400001)(6916009);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8GHJjGdqSRvyjuZFihK0O7Ph5u7RVBWE1t1CzZBpkFmorr3L9m+eXzT957nC?=
 =?us-ascii?Q?CRjY8X6QlnfmzAIDzTJ7cmxVFAzY86E8OX7lnpdSmRkYydVrYCM4NfSYO/Ak?=
 =?us-ascii?Q?GYSDnhldFbxy1CvSFfPQurPOVZUJxyX3PUK6n6RIGyIoBLA7UXkN0A4iZfkX?=
 =?us-ascii?Q?smqOO8xNU7QqbnT9HjC/nuPlJXmtb8dO2dv7Kj+6P6I+/SqPiTAB7iwKhloY?=
 =?us-ascii?Q?/6LFeL9xrSim3qLbrppLMYDxefbB9RY2CUq1/gf9PVrADWVt9maQZ3RVkReV?=
 =?us-ascii?Q?7WGBo/6d9j6q5wn2ZgoDcUbS8in1Nii2mqcummKYi9g1SEBIfX1QADKvtAJ5?=
 =?us-ascii?Q?DcKY+zroa2C3ot24J5xDczFQIZzlBEEIp3G9jmguR+uVb28UQVRMiCA5K8U/?=
 =?us-ascii?Q?MJSetWI675B26zClxproRlnN8uU6Ip3XwkNNpm3cOTn4SuYfU+Q/oI8S0nRx?=
 =?us-ascii?Q?OU1wIU+XwnbA2JsDVu1PdytxI3T16svBUexWdIlQAC1Okm3aAZE5+lBLSemW?=
 =?us-ascii?Q?ioMLmgG8xEG1VG1YLdZgsQ5v3AGTOAayaHFu7GlvtoXUfpEcSyY6LMUAUmWA?=
 =?us-ascii?Q?aBYuJNm+Pexe8Uvs92tQef30jXYby4i9GL6B4q60Y3cI4VLhpywW5E9AsSrO?=
 =?us-ascii?Q?mTLKVdKlqRgBME3GeTT98BD1WrTQLVSjSRyfDn8TYjXv6RPFk6FfHjTa2g3j?=
 =?us-ascii?Q?348Kwx7Ohy14eHhTaVqqvky35/a81j4C7TbQWV2N9HJkpsMaDfg/Ziifpz3k?=
 =?us-ascii?Q?hS7kJsIWSC3aXoEuC+bj3+VtJVO0Rfp9p5Ss6QTlOxcczX9x6xFbE/cCkhgm?=
 =?us-ascii?Q?fWwBT+OlXRqIM3lHTk1chmAb4PaBK6CragGWQ52c7uLQV3A7vR58PsPYMi2b?=
 =?us-ascii?Q?OSiCFkNKKkLLPT1KQJ8d9BDbem5cpc4BKMXV6QsazhGsotMall9PwqH+1TlL?=
 =?us-ascii?Q?XBPLBwQcFpjGhGlSGOw4EVHxobzJ8a2joQ1PwxlSQmP0DNZEyhXd/v1Y2fDS?=
 =?us-ascii?Q?59qzvS9/t0AGBOlhJX+zYz4slfPwOq0zR8BkWcx2wdudjPyZYRlWQh8yRO3W?=
 =?us-ascii?Q?0qnjho8kcaUdiYfBRLGnulFSuQPYlOinR1rO3tTXO1b6H2npP/UHiL9mms8C?=
 =?us-ascii?Q?8t+rE7lwUjw/UNqPtHhQZFDEnSIpJEGqHbjxgSdp1ylvmu7XdtQXAzXYSLBy?=
 =?us-ascii?Q?oLArSVIgYdzBPlqC4F0/VkSdO37YBgf5TcXcP43zzMvGkKmoJ5Ay9RqbrCuQ?=
 =?us-ascii?Q?HYOw2fXBylKS93zKudj8iobEvulXsHKDKgXUmq3Ze7A9utTIvv1B73umBAry?=
 =?us-ascii?Q?HiVNYDkWhRwKq4To0zzJ2z6OivVj2s7xXYvsdovsxlRrHIKSwcAp5S46Oto6?=
 =?us-ascii?Q?X35MJgHBbxuy6rns28FHMeGbvodMX2MPgwyS6vO/Xz8wVCqnHM7LnbmqbYSL?=
 =?us-ascii?Q?G0p/XMT/Yi5r4MayD1YMmK6NqjpmVQkrAF/lV7UIcn+6f3A5DeePbfLJt4Gy?=
 =?us-ascii?Q?0xZfn2IuFgGk7Rcj3Q0wDRRqQCr6gNFPziwgVnnfmppJj5VKXFqCN9y9AeBQ?=
 =?us-ascii?Q?YZqLu/Rcxcy46hdNRa/1WEFVS4UYlZpSDPCYf0Fx?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ff3ecf95-b3e2-40f9-4b2f-08da71850dcb
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB5420.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2022 17:09:10.3768
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 1SNIiiwHH9wR4OAiACrlu3/Y+sGYqnMtqU5x1MPN2A8EIYPtXOVZe5tN/7efOg7JX/68nF2Y3dcIWq96oe2HGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR04MB7362
X-Proofpoint-GUID: 538ly3daxRRER8-3g8STCJa5pmKj5IIW
X-Proofpoint-ORIG-GUID: 538ly3daxRRER8-3g8STCJa5pmKj5IIW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-29_17,2022-07-28_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy
 score=30
 mlxlogscore=724 mlxscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 phishscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0
 adultscore=0 malwarescore=0 classifier=spam adjust=30 reason=mlx
 scancount=1 engine=8.12.0-2206140000 definitions=main-2207290074
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Jul 2022 17:09:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98050

Needed for automating ssh logins, used in auto-tests.

Co-authored-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
Signed-off-by: Mike Petersen <mike.petersen@ni.com>
---
 .../recipes-connectivity/sshpass/sshpass_1.09.bb     | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/sshpass/sshpass_1.09.bb

diff --git a/meta-networking/recipes-connectivity/sshpass/sshpass_1.09.bb b/meta-networking/recipes-connectivity/sshpass/sshpass_1.09.bb
new file mode 100644
index 000000000..0f3c14b9c
--- /dev/null
+++ b/meta-networking/recipes-connectivity/sshpass/sshpass_1.09.bb
@@ -0,0 +1,12 @@
+DESCRIPTION = "Non-interactive ssh password auth"
+HOMEPAGE = "http://sshpass.sourceforge.net/"
+SECTION = "console/network"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/sshpass/sshpass-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "191a9128a74d81ae36744d5deb50d164"
+SRC_URI[sha256sum] = "71746e5e057ffe9b00b44ac40453bf47091930cba96bbea8dc48717dedc49fb7"
+
+inherit autotools
-- 
2.37.1


