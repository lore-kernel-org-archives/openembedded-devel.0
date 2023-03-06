Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7896C6FD1E
	for <webhook@archiver.kernel.org>; Mon,  6 Mar 2023 11:03:23 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.30601.1678100600802964958
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Mar 2023 03:03:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=N9Suogxp;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2429e4d58b=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3269mAbS018975
	for <openembedded-devel@lists.openembedded.org>; Mon, 6 Mar 2023 03:03:20 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=aM/aeWimJ/YjWJ+ttb2gco9e/gzj9MylYtlBmQga6o0=;
 b=N9SuogxpPxuf7Uf06+0wzsQkPHpVkVtLybPEqulGshD5bZZZ+P23kSciYnRP/9KJO4AY
 5h+NF7ZTdGVfCmS6CMY9iUx/MaD6pR0M1v05yBlgh9JFwBGvJKuB44DLTdjxcdoI24t+
 0DryxR0K5uVnhkMuDWMJ2jar9UCHVkmAIRsMZM+C0K3y8OaYNJk2/TlUJZGL8gQxOqmV
 zVmBw7YGObYG5MhKUpoPVMPKZcnRQNCD48VG6uiDi783FqXCQGF61PFfe/IA+h0V+Wel
 AeTEwlKApkvgx07omPhm2Iwo6yZpQJ5MckOgvj7wgqFCzerrEwXs+N9oyZBUv71jk9+K +g== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3p4258sp5d-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 06 Mar 2023 03:03:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ALyGs63SssuMHiJpwtQnceSTf/uLkdjFzshgkRaX0YAi79pLslTYww4GRk2yzlPqF8FhPNsLPPn7CD8PwHily945tQRmLVOayPpqSBt5P+pHRw1jeLuST/7q1VuWtTiOzgzzTwZ5+ah9IDGu55NdjkJvl0CS6MBfqOF4U7kg8PrzowBrpCG8aEPHlKeNbDh9E5kegpf1O95eoZxRnK7Iw9wCsOLlWUVJFci1WWrOwIO/xnJImtONsUJaLABgVxRFy5UQVYVSIBE1Na78C6IaEKHqjaK91KOta8toqfwX57GwlU/JBZkR11UKkXg/lYRWdLGH2oIGovEbMW33kSIPaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aM/aeWimJ/YjWJ+ttb2gco9e/gzj9MylYtlBmQga6o0=;
 b=VrkSPIuUrixZvnuED0GyhAP6KrkombAOAWK2ijyyb/cEhkRv/zKgHxsmu0BvoP9xTITv4TXv4gigT1/gZchiFXn4I1ueIk/BPJaoCqxrFL4T+YqAk5lNOerKvX0dUmT29qfFVuyiOBvFcxiHy7JSfQysUUzC38E6Gptyi1UplG7Zk0mo55Hm178Ce5HUdTg6HkzF6Qp0TiwOMu2+vv2jTngdIv8zy0VWIbLMw5Mec1NO5d55lRxlppLnpa1Q+C8B6GsIKzCxg4yFzVNqBdE+Bvk7AkoNKXcHnZImR5CQXy/z5xwauitTnpBgG3yWw+vyU3U8aMfEEwvKDZWp1E8SYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by PH8PR11MB8257.namprd11.prod.outlook.com (2603:10b6:510:1c0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Mon, 6 Mar
 2023 11:03:19 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::3cb7:edf3:7304:982e]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::3cb7:edf3:7304:982e%2]) with mapi id 15.20.6156.028; Mon, 6 Mar 2023
 11:03:19 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 6/6] freeradius: add UPSTREAM_CHECK_GITTAGREGEX
Date: Mon,  6 Mar 2023 19:03:01 +0800
Message-Id: <20230306110301.75991-7-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230306110301.75991-1-yi.zhao@windriver.com>
References: <20230306110301.75991-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH7PR13CA0007.namprd13.prod.outlook.com
 (2603:10b6:510:174::17) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|PH8PR11MB8257:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e1836f9-546e-43d6-7566-08db1e3264ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	EIzkkh7+b+BxLstHjLfRb9fzVHrk5L8wYWQgliHDK9b5FLVvSInnQodab0dlhd58clTr30scuE0EVhAh4j0xur/SRiNB0Nnr2POWKwtTsC1SPwAOyvJ1SzlvV8gnzbJT7JvnVcYelJdghIjUpkoLNRixY4TBaGQoMFGQZX6mpBzMCfLTXKtw7jk5Exg5UQcv/q2zrtLe/W7+6EOWmIxaCFj9Idj8FsAv06EpWzn1uP/PWQNP9zHGoEdx5xMtIy6FOaa2FSGsO636UHH45Z2fYfo8q8JhQOJFhZxHOJSyVDBWO10Mcn81ZNxTj/zJ7jxUEqk0SaCyR7X5ynBDRa/mfdmBi+1ZRb6xjJaDKJbHqlDa1N++vOYeEq8Bq5vOeJAxRUSGdWUqbzbFPfoEc3daYEET2hJRHGQFZVfxm7eADDdtK+8lQ7b4swUvjPjMufjCnsjeAXNQfVU0qiiSX4YBILbNU78ZCLvG/xEbWElusJfYb771wVR+ZSROU3mttO5nyCygk0n/mQ6xXDHAHaVDPqfnEEnZSFYQp2POUW21529j+Ym8CfQ4c9CnxCGkBaa0fa4CY5nq3zgvh4q6dy0DxWpHibmIZrD8Nq9txL8t6qnrVpK+eNFRCqhvKBFLyGOMK46+LtSZQ5lJMy/fFARGiW3f2my5VZVe7Osd6j1EToU6yOPRNQbHtxLXzhO40Wht
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(346002)(136003)(366004)(396003)(39850400004)(451199018)(36756003)(478600001)(316002)(38350700002)(38100700002)(2616005)(966005)(6486002)(6506007)(6512007)(6666004)(1076003)(52116002)(186003)(26005)(41300700001)(5660300002)(44832011)(66476007)(66556008)(66946007)(8936002)(8676002)(6916009)(86362001)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?bGyaUyUGyBnAv0l0HXCjrisiKfzOsd1GP0T0kSqNFUVQDVOXZXJn/csrXFXO?=
 =?us-ascii?Q?lULhv6FbzuIym30oKcGSEXxxn+9dLtUs+xHzRUYmmg6+1lfsTBmcD4zr+pGB?=
 =?us-ascii?Q?yvj/cdecWLzZPs7rX7UjKbsAKircOdS4309iZC3ewZjp8nF1Rko+Q6Mp5AyE?=
 =?us-ascii?Q?bYvtEkKxoKle2Bkqj1jJ4/V7ioRYE9tJTYufdWiXgRWvIeg6OUXg2Ed5YscA?=
 =?us-ascii?Q?a7IEn4nDmNE79u7w05zCAvIjgZIoAYTwbRTnw8DGR5dc7wJsTrK10DQZ5TpC?=
 =?us-ascii?Q?VCGwiP33tt+fZ85rjfWHoLMca7IESHj0N6Hhi5qH0HanvM4gFoKvZSjwP0FL?=
 =?us-ascii?Q?EvKCapcBow06nX3jxEaZMF3iGazCXDPCB0orBtrrTyeIthCP7TjG7Kxhs7pb?=
 =?us-ascii?Q?eYi3Zksc/Hp/JGoQ2eAxucGyygFHO+kvyW0P5zxv9Fd4blTe1pozWehnU7qU?=
 =?us-ascii?Q?Mg0UjXIz0Uh1i/oGZAIpD295fLX978twxtxEVwtzZhst3d+qdsnrSQGFeasc?=
 =?us-ascii?Q?NLbnir7sL8oiXcukwOjfMQOKd1lXptMe59W/V74rZPwo4Er7Ojy4R0l4VBr7?=
 =?us-ascii?Q?4I09l8pQQ8eAOHfTH8C4cetofsT09zZqzMMEwjBZufDzA2Zhq6jGJfOzHA3A?=
 =?us-ascii?Q?K+0acIG7GVe+79+FOQa/mBzz+h2t1YLglOdHCtA9hqDfhDBWLZ7VpivfsvVX?=
 =?us-ascii?Q?KxzpZ6zS4Fk9/+ZHcS8bydTclp+uGm+dDIJc7lb9hUC5lwEtc2HC7D/YV5MW?=
 =?us-ascii?Q?LvNROTHHIkUT/Z3q9Coy4ZYBvvJGZYeX9//kr06MtYb3GKe7q5gD2iF/Zl3P?=
 =?us-ascii?Q?LrkPNbpA/uSBqBvbXwJ8/xjO0EYb6rBFYttR8NN1KJ7MuKDiudDstQ7nGA6i?=
 =?us-ascii?Q?oWN+E14dzC6ye1jLvbIqZlnG2bJNRdbtG4WFtjiHw/T8tJpjM4N0qH/UQSEW?=
 =?us-ascii?Q?/DhGu+zBLjHFUdk8tqP9oA+5vg8TNQhHq2pVWfy2srtcmRihkI9H+ARFE3f7?=
 =?us-ascii?Q?pKW2i1/eqH7Y1enTZ9MdvKe6Vcqf9Vg8AG7nnPB/gsbIZNL1VVsBG2oKdF/S?=
 =?us-ascii?Q?Y3INkkoOTlyr9NKYVu7D5mK8is91lhstFJod1NV8/SD6gW2Vj4+cvEVfpyq+?=
 =?us-ascii?Q?LXt5mWL82CHKVAaSwSvIZ5u9wx8HmoXqTxEe/wPhpckb52ZZCcVKBfaJjbbV?=
 =?us-ascii?Q?XnNIJJBUuVWkDVZs0qJUuyvBOqtiFMWRMqc+YVBAD3G1rLWyaQCCyqslrWhw?=
 =?us-ascii?Q?gRD+qqNmmWuJt0q5JIEbhQwP40/umHcwzISm/xPI6XK0ucVf0zbiBm5GlGJD?=
 =?us-ascii?Q?he4epPuLQbpN8vRLY1XZe5fyKTLf7Dp8Th+EaRMWfTwvE0TxkacX5d16oMiN?=
 =?us-ascii?Q?N4gKMhwZQ4F6F3YDyDvAUOWQpiHyhCumd+S81Z4AUl4/I7A9+8W+Gm2/7F7A?=
 =?us-ascii?Q?5rovx2FoB9ffUUi2auNAHo+8Gvk1xPA1uY11v8LMk1ghCFdyTysMWtgCjU3W?=
 =?us-ascii?Q?dohB6XO18dqOs1Ja39cOWbIDpJL4BT6kTyLWNv0X0UA87ydudba4LdQPT4lh?=
 =?us-ascii?Q?+MmYNGy7kTsHlMaew6+gBym0Y//hgpzzk7arZGrPRYt/7PHSFMJI/1zVQeE8?=
 =?us-ascii?Q?6g=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e1836f9-546e-43d6-7566-08db1e3264ae
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2023 11:03:19.2222
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eoa2fSy+kPhgNaP6d9hse1kfQEIkcnx48Qn5g4W6pQFidBDpuXNj0FSVLBbfq6TB4UwmI637fW9sISZoxdVScw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8257
X-Proofpoint-GUID: DSgi-a9DN7Lwc2x-b7IgvYorGQt3-vYt
X-Proofpoint-ORIG-GUID: DSgi-a9DN7Lwc2x-b7IgvYorGQt3-vYt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-06_03,2023-03-06_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 mlxscore=0 mlxlogscore=789 spamscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 clxscore=1015
 suspectscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2303060095
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Mar 2023 11:03:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101399

Add UPSTREAM_CHECK_GITTAGREGEX to check the correct latest stable
verison.

Before the patch:
$ devtool latest-version freeradius
INFO: Current version: 3.0.26
INFO: Latest version: 4.0.0
INFO: Latest version's commit: 8b5bff2d8a2cd2be1da58a417787d907c7a5d8f1

4.0.0 is not a stable version tag[1].

After the patch:
$ devtool latest-version freeradius
INFO: Current version: 3.0.26
INFO: Latest version: 3.2.2
INFO: Latest version's commit: b9ed73ef2d2628fa6e2a6d15a7782f8217966be0

[1] https://github.com/FreeRADIUS/freeradius-server/tags

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-connectivity/freeradius/freeradius_3.0.26.bb        | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.26.bb b/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.26.bb
index 4a23c9d90..9a2bbab39 100644
--- a/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.26.bb
+++ b/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.26.bb
@@ -41,6 +41,8 @@ raddbdir = "${sysconfdir}/${MLPREFIX}raddb"
 
 SRCREV = "d956f683d37ea40e7977cc5907361f3e6988a439"
 
+UPSTREAM_CHECK_GITTAGREGEX = "release_(?P<pver>\d+(\_\d+)+)"
+
 CVE_CHECK_IGNORE = "\
     CVE-2002-0318 \
     CVE-2011-4966 \
-- 
2.25.1


