Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A9A6C433FE
	for <webhook@archiver.kernel.org>; Fri,  8 Oct 2021 02:54:12 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.4188.1633661651277938320
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Oct 2021 19:54:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=ksURm4lb;
 spf=pass (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=591536233b=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1982qTnw012421
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 7 Oct 2021 19:54:11 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=IaKCxDR3ldZlXbsjv4EX07wJDnr2yP2caZ+/tVM9cXQ=;
 b=ksURm4lbgI3vDK+ZemYPI1MlRcKHevEAeL3ya6Cx9KQHWCUxOLWtYtUHbqsWM/XAQ4EM
 G7iSKhxBNbI+JF4lTdmq7/e7M/l14PRv5yh7OQ2nrNLIcnf4CodwL8sEsJRN0RbBbR5S
 O0XR0LAMrXwZIt6RyohLo+ivEZjfHojLTdJpkxCwIgdT0Q3o7xBsx+kF6wlMp/f+IKM4
 4n5D6teSIxuB9VZ+rmAC5WJ9sQN1A72KlIBngEd9sWrHqyEJzKniMT+LbuN8qx7lFm1v
 U/YObrt8O0clmpIFPRYz20Fl7WlYOpFcPmW99SWlaCNO1H44GtkX8o1ywmQV/N+JBLoe zg==
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by mx0a-0064b401.pphosted.com with ESMTP id 3bj8urr5xt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Oct 2021 19:54:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MfFeD04zH4dp/1sfHxVfdMOk0J4oTcRmAhoz/5R46WQ/5x19ChVebfuzPTJbzLrBDYriqaVk5menh7OvfK5dHKNRP6A8j3VEF8ic1TzPWY/Jw1BgJKJQZQApKqxDWpYqpQXE4Kv2D7Nv9DPjmIfkw/hufJojvmLTGGxBy7DGA3DfopXE4WOOPwUxPDlSap5s5FpWalshDVpqW36quwMwYXXm98zjuTslzTj4BWey3mgNS0ld1WpkrUgIYMqtKzJ+XkjIBkoCKaEoOPV+NnQNpODxx16SYVbV4zjc+OdrlQgkALtmFMy5VIFbhrAjJ9q0XVwHytWjQnXZLghgBOeR9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IaKCxDR3ldZlXbsjv4EX07wJDnr2yP2caZ+/tVM9cXQ=;
 b=HXAeCM+h8f3+Dr2G2zy6rPGtct9uHClZYuufl9RC6FVwos7JBgU5ucio9dReOwFCMMFE0dC52xKDaybmAUvA5Z1y4g4qEnUqrDuhmP+DZMBbsc32PeybLqkCuBWR5C/efTVSsHTShBLLy8LVAdmaCazPAPBvDB3D4jT7W646rfuFI8g1vzTv7JPb+8EcNZ+aAJ8ipgH9pMBfDC6gbUUZD6Mg/UQVITCWwuU8i3S5K7wFLzMfmFBFVk6mwmWLLp60MaHuuFywgrh9ViWWW6hM4mFrYz6MJrOA+7HrvSh+ZQvcaNXpv5Sjlm+5baE6uXsyLQ21SLk6X+CxuBEMWDlUBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MWHPR1101MB2318.namprd11.prod.outlook.com (2603:10b6:301:4e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Fri, 8 Oct
 2021 02:54:07 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::455e:9cfb:d106:4480]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::455e:9cfb:d106:4480%9]) with mapi id 15.20.4587.020; Fri, 8 Oct 2021
 02:54:07 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] samba: upgrade 4.14.7 -> 4.14.8
Date: Fri,  8 Oct 2021 10:53:56 +0800
Message-Id: <20211008025356.342251-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0182.apcprd02.prod.outlook.com
 (2603:1096:201:21::18) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by
 HK2PR02CA0182.apcprd02.prod.outlook.com (2603:1096:201:21::18) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19 via Frontend
 Transport; Fri, 8 Oct 2021 02:54:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2a1db019-32af-49ed-dd4a-08d98a06e53b
X-MS-TrafficTypeDiagnostic: MWHPR1101MB2318:
X-Microsoft-Antispam-PRVS: 
	<MWHPR1101MB23183909608EF34CBAD88C9EF9B29@MWHPR1101MB2318.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:421;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	pCbFzhCjIerRCo4oLMjQ7GLRcuJAkG+V8id5opu+35z6APf8pyWGPDGQC3jkj7K6TO5IWt9zIesxdXz6ZikF6gEuTfhpLi6xJ+JWkhtZANU0fBiUDS9/rI+HEcjFZJYsn/hHdn0mbvSMx4+J+NQDQM6+PL8UJmEV8T1Uo5Xoq6fT7Paykm9dnX46q+pohqJrCtoGJ325HLz0aEuvD2VyXxgOpZ7/gKiNwZJvIpv3w+DLUIKekcelg22H70zpe96GFROAmsYV/jGubrIflMmzvrTyyfnYGjwgLsmyg/xRH85oUKJ1oka9k7ELQNMc8pvvDeh5P8JeItxuOlR2hDlW2V8WDyRzjAtgDH96mKItv4mmK105JCx+4iT0e5yUm+3aQbd8XJ4WFyEGrftkZ9vPKfyREuO4pRGAC7docC/Pr9liKXWlaewHxdmkjlZ0D64Vl3c/X0Be34q7B9/MeZ+Yfp+LdVb5bZ/xc/Gs3xfESfGkHuFRUD0eP9HagWuoyS+WYOxe5A9yTQE4ZxQo0SjrZcusf0oyJWg7cgjLSooQHszvIX5T2vTEpGl6opt8eR7k5IU4B87NLIxyyBYs1s+hIv2fMetor6soCGU5TOiaUudsjTLySbn5P3JlzNqZ8bqQS6V3dw5SEbLfvzEUBWM9+kOD/SZntG+fv7V0i5MxB/VTxA7n9ViQ/MqalFJm+bbaeY/8bWSccS/A1JbMSLhLQ6GLarsQDWXH4i0MgWbtYJRmVTvjTm4JA5ZTe6GAYFbAzf2oFmmvVxZKAjWhTg4PfBRTK/1GJTyqtqOtEHkMXvs=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(6486002)(186003)(8936002)(6916009)(2616005)(36756003)(956004)(6666004)(8676002)(5660300002)(2906002)(508600001)(86362001)(44832011)(6506007)(52116002)(1076003)(38350700002)(38100700002)(966005)(66476007)(6512007)(83380400001)(66556008)(66946007)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?wUMwlYZtiuaokrtx0VOsDCB6D8F050JHApXCJB5wa91E0vorL8WI0lCzGAQ9?=
 =?us-ascii?Q?kdbFN/+zh7BPRJwkTkI1lCkgafIIh6iu5YaMiQt4GAAWgcTnvXm0uE20XQGP?=
 =?us-ascii?Q?Vg9eliDhUbgNPr6UECU5TQBCV77RYypFwCas+F6ExMU3sZ3pcCKAAO/T03o4?=
 =?us-ascii?Q?qp3oWOX0YhWqzMKlJ+Solh0m30Vd6UYH+2kfPr4PxA41TDA5lbeMjgihCdG7?=
 =?us-ascii?Q?OuJuQdRrY1d33h73iwAgBO/tDZBmIXLXgWhWc84qf4dkfWI37HQHbJ3sqjXl?=
 =?us-ascii?Q?t+68vGABQkybsPGYtEyJGhC46X7+UZEB/7s5Dv+jWR6+rKF5a/bAoXBeHtuE?=
 =?us-ascii?Q?PLQbdAbEbBKWc8Yi6BJDSrihqAwL5eOaqKJYFTuEak5YHtOfAgzZiE6o5qge?=
 =?us-ascii?Q?tCmrsLF33dNgw95Mv6nqHq4xP+hbf9LmizSZC4wm5AILHznG4Emc0OmAL3gZ?=
 =?us-ascii?Q?CV7VlkyHL/q6WOnONhrwdISQiJvdg31hAV8mvdv9NTMVbmdsr4K5HUN0xC23?=
 =?us-ascii?Q?SSkMuefAHi6iLI8Laq9vh+LHHvWDJVHN1Bt8k3qPfdnJcrF2oUZXMXq9mRuE?=
 =?us-ascii?Q?anMzBnHBJ8bBvusNWlmunNSQ6vQ488QJ+0n06tEwKvzS8kcCu0jQsokF5UgX?=
 =?us-ascii?Q?cnu+O37++UC4or0/q5T+9D+eBJW8bL5GaP/leppcr+VjL+F8yWD1qxwejw+a?=
 =?us-ascii?Q?wq3JvzArE5IDKF07G0bQ33FSjpiDk8ol9ixtA612znIYPHmcBEVQbzdd5Jzd?=
 =?us-ascii?Q?0u5MLcL942/Jl2IZShAr4euKFQQrYbh+ZNQ2X/LHGHNneKQbsXQuemKHKpHU?=
 =?us-ascii?Q?kUbg3dL5K1ocdixVzsF+l76UouXBsxzOnQhyDOIUBcdi9gB0oSDDnuo7Vzs1?=
 =?us-ascii?Q?NWiJ0Pveg1AOKrvFJm5qaZdZq5ygaIvtIznnkjfVeRhuG8YlgBbM3r/qAaPa?=
 =?us-ascii?Q?/V+PKAt6qPHqPczfy33+jDj7v/1X9rWarKVgyPfOqmFpw6dOKvBca0hx66Jf?=
 =?us-ascii?Q?38invJjilS7coMrM8GtxBt7Cx+Hx7DgybxsyGNLZthywDtJP2kR17/sFbcVZ?=
 =?us-ascii?Q?ue4zbz5jWp6m5djifuufyEohpR/3M3MWiYd7GS/j3n/V7n15SHu3B4ma426p?=
 =?us-ascii?Q?/VJGFEP4KipTmXgZxqRlTW1E6s3wJW2WzsipCJqn8F2Wa6fyq4RG1aAYS8Mq?=
 =?us-ascii?Q?RrCtQXYgmYS4KKZ007uXmLGZboIbh3tfbTooXUAt1FctKbPwbeQisDJxs96W?=
 =?us-ascii?Q?mg9osAMoar5CYJX/s2M2oG5enEVlrHzvWyyeZRnwg7YjdVqHGkvCRP7tsUnk?=
 =?us-ascii?Q?9FjrkaG+0c+Y6jzFabM0/YR5?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2a1db019-32af-49ed-dd4a-08d98a06e53b
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2021 02:54:07.2855
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 N2G2+mM0VOv2oEXlK9PfW+2hnWz3/bslruQUlF+5JXekUNwbqQkgm0cQ70TM9GvMJrdeynVHfSpnWMdrce4znA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2318
X-Proofpoint-GUID: iTlUuZ8MBRchb6Z_Kk9JyYbg9cdDzWuE
X-Proofpoint-ORIG-GUID: iTlUuZ8MBRchb6Z_Kk9JyYbg9cdDzWuE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-07_05,2021-10-07_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 mlxlogscore=927 bulkscore=0 impostorscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110080015
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Oct 2021 02:54:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93205

Release notes:
https://www.samba.org/samba/history/samba-4.14.8.html

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../samba/{samba_4.14.7.bb => samba_4.14.8.bb}                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/samba/{samba_4.14.7.bb => samba_4.14.8.bb} (99%)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.14.7.bb b/meta-networking/recipes-connectivity/samba/samba_4.14.8.bb
similarity index 99%
rename from meta-networking/recipes-connectivity/samba/samba_4.14.7.bb
rename to meta-networking/recipes-connectivity/samba/samba_4.14.8.bb
index 47fcd3a00..0dd563c5b 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.14.7.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.14.8.bb
@@ -34,8 +34,8 @@ SRC_URI:append:libc-musl = " \
            file://samba-fix-musl-lib-without-innetgr.patch \
            "
 
-SRC_URI[md5sum] = "f0db8302944bb861b31f4163fd302f66"
-SRC_URI[sha256sum] = "6f50353f9602aa20245eb18ceb00e7e5ec793df0974aebd5254c38f16d8f1906"
+SRC_URI[md5sum] = "5c6636b34a322de0eb917ee0403be322"
+SRC_URI[sha256sum] = "c936b782c2aced8cd7299c13bec67c495fd4affdb217a6ed6150f4fd6d770fde"
 
 UPSTREAM_CHECK_REGEX = "samba\-(?P<pver>4\.14(\.\d+)+).tar.gz"
 
-- 
2.25.1


