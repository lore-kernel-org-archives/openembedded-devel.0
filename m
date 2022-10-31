Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 345E4FA3741
	for <webhook@archiver.kernel.org>; Mon, 31 Oct 2022 15:05:42 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.10477.1667228734372886630
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Oct 2022 08:05:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=nS3sag3K;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8303e5831f=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 29VDmAV8022964
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Oct 2022 08:05:34 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=nh6ut4JLFqoG+4NsisN0alFgUkIbYn5FOJyAc9N4Smk=;
 b=nS3sag3KtDJ+a/Ava0WJ2ZMwTXoQDIPFsRdljOV7Bt5JKnqex1+AA6hFb11xXpdL3QN7
 CmVGTd1ZnyZMnKgZLVO5tt5SzygRKg+NrgyPGddE2LiVVHWl2z4E25Jf35PCG4oEfiIS
 jwZUoVr6e50zrGwUXjQip7YrYiiY6e8toGhYUKpSFGL8aavKTC6zjgA755mZkRdQ8u6C
 qlLyW4sDXYklD8+d+lWXi6MTnSNGBT3RCoQGWR7MofQZYxMHFUoy7DyeH0Fi+ISoKWjE
 805KtezgXa5nrnmXq/hR6YfgT0Ps1PSjqa1Fa4FqfcbgKz4VIbNU+xwiOyfEA73Tvwyn LQ== 
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kh3pkhbat-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Oct 2022 08:05:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oUCThBkVyvsiFGhKfM1AUjCuOzMiVigUK8LIoPgfh2Oa8jDKqHHpMeKkbWa9pcUAtDClZLlZSpGiyh0mYHykgbLhGBL3uyMvAbomhfhEPJCc4kiN0N4HZG4JGhdaaABsJ44YzScxic/1DchmoBJVv4nxxCGjF8lBap+yk48CzRZjgDGjVJ5069Zsl6yjTZWw4h8dqZZ0aZkl2LtMW8LLd6/e9DbVAj8QElb/xK7HRACqWvhpuAa+KlxUicRTzlSMpJMN/bMHtuyHNbg6HWFD66YT1bfFi0erMJWL3RQBNeYBS8eoLCUQqFhyxezcnSVtrHEZ8c2EcOnE5QnnYlHjYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nh6ut4JLFqoG+4NsisN0alFgUkIbYn5FOJyAc9N4Smk=;
 b=TPANamAiKzUYzWqrkbHQ5ODRcax8JC6matI+fh28oVQbPB+urk1VvyEQM+X/qMV+N0Ob/xtX7AlfKe1ThQX7jSODrEe/nL58pc7xiv2INO3jYxWQXQDyaINcPv4M+GohxA8ZE1+jatxwls0uh6NdAiXHQCe4bvZaGrPmKXmO7cjq9lsZrQOPYIzBXBx3bx2mGbpXpnVSyDADWDWM9e7O68VL+0pnziBKK/jMeZlldp6yDozIKFIEUF+Wy8T6C+dIvVvXNOS67xwPk8CKsCrsarG2RGRi5H9zeZFGFV6N1X0G61bS57ngEPs+g5T4xwsmMJVOa29LcraX3KLDPhfW7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 BL3PR11MB6459.namprd11.prod.outlook.com (2603:10b6:208:3be::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.19; Mon, 31 Oct
 2022 15:05:28 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::1f24:5efb:1519:ef4d]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::1f24:5efb:1519:ef4d%7]) with mapi id 15.20.5769.019; Mon, 31 Oct 2022
 15:05:28 +0000
From: Sakib Sajal <sakib.sajal@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH V4] minio: add recipe for minio client
Date: Mon, 31 Oct 2022 11:05:11 -0400
Message-Id: <20221031150511.1947-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBPR0101CA0294.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6d::18) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2538:EE_|BL3PR11MB6459:EE_
X-MS-Office365-Filtering-Correlation-Id: 56775951-6c49-4965-ccf7-08dabb515886
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	18Uhs2r88kCy6JInByohl/EFw8OihrxLF7pGzNsGSUPocUIGRhXCQv17UWeGVjs9TiCOlw+OxuZnUEuhqg91gZ3kSzKyPr/bd9gLs8L6MU/wEJFGfaMQxeM2lXoY1qzfiJOK30DeClrMaz9zFQvLcp3wFV6flCbB4hem/LSk83+7G+0qe4P5xiTN6UgGkr82WfuzQ/UYcH+mN1N3J0FZBf6crbNJ8gEQ5rZ9fW+6w5TCL1HUF1zpdfcIA2zfuaPIxuHA+5ydkUxhTNJZEmnMsVLWinzDEO6iFv/bCrwhzHOdvTcdjd0k/rflCT3JYzmIXrTzAJL8xBWaSISsY1z8A9syIHkDEHE7gQGekYS8IObi1zqhHOIWmNhjQI/cX3hgutKXlmE5g3oazEj8pkLM/3JSZ029189XKhUTNPfeAawWJA3ng0XzXZ8u3fCHnxVOZ7b5wX9zD6uhh0lCtZOFyElplZdAqiDzVVHDyV4gSGVgPjT0FYkoaC+iieokUMZkJ5aXNZ8FLeuL8KH/NYCWMOMvcDvhgUS++E49WmUUe1ASIRABjM5d65i2DKfMPUgEvwfd/AaGiCj8jLoIMjbL0IGMBrtfgI3dk5WNdwPH8JJheH0h7kTJiTT/3QNj0JYjeQ/cR1D8yxaA5xhjaCWM4ESTlZj0nEggezkmImsrZWeb6sPBDmTRkTlmmCda2P+nej2WkBrV+j9WuLHz7KGUar8lt4QzrBhdErvmtvE4lllQ4xJosipqn+IdPxnbJc9dA2hmfrmE837kEMlaMpbrjy7lXocXBttP/VqIsSFNSZ55nbSRWmrYS9Fa6735IoAD
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(366004)(39850400004)(136003)(396003)(451199015)(478600001)(1076003)(26005)(186003)(6666004)(52116002)(6512007)(2616005)(6506007)(83380400001)(44832011)(2906002)(966005)(316002)(6916009)(30864003)(6486002)(66946007)(8936002)(5660300002)(8676002)(66476007)(66556008)(41300700001)(86362001)(38350700002)(38100700002)(36756003)(84970400001)(579004)(559001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?qRSYZ9vsI86gRs233Nk+cKVTefeGEW/sbFpoDKTCEvnoH4CNva7ysWy37Esf?=
 =?us-ascii?Q?8MXQm8ZsCxjZ5eAfGcr5jSycfKTL2U2x9xG/4/G6IO8ZhbBiKmZ/nnb0+jEm?=
 =?us-ascii?Q?NRWsxPkKtjdFHIfi6TeFOQOCH7UT8iy8vg2dgCAMl7m7sdSu8dzYWoXHk99t?=
 =?us-ascii?Q?hyiCMQk4PR7KWTzsR58eLudjCqnqTZpPJF8z8y7Zat2u3QPf5B4fRcZU7/TN?=
 =?us-ascii?Q?0g4U446ptQAszu3eKGmHl/t8cPSFyoAzc4mwo+P7DRkI66CyKt3GIwILPlW4?=
 =?us-ascii?Q?WpF7H/UBRO/cf6UOwih47o9fNJMWvJ6rxBHuQ5AoORxq79if3WjrGb3ecf7Z?=
 =?us-ascii?Q?AgTwmRNDcOhzIyqhKXZeszCb0xa0leYMb3Fn1Ebd+D2pVDBieFCq7/DzxUVW?=
 =?us-ascii?Q?1Q6qzfFo2iljSyZQqNFqOEZYFMpkBeXxtmXM3ob/1wAQvO65Gphyd9LatGV3?=
 =?us-ascii?Q?DMFXhDU7MTwOUUgSRBrhlmU/CEzU8gHxZ1um4mtkbCLVLfXrQc/0tjl5UjUF?=
 =?us-ascii?Q?ujNZQ1b8rLqgRXra6UufybOC/E62kEHZrbiPlavWDZuJUhOGXSy3vGN0DDCp?=
 =?us-ascii?Q?bZzEfzRl+ovxgQ7H/8Eohv4WFCsuL/YNnmnBQ4/zDEm6MTLOdbbdfvDsRsCE?=
 =?us-ascii?Q?Y3oALvcH9ezmb9WMlEwpE2OnsTe/PSsgT1PDXV+3lDyDDPOsbZxirfA/Dff5?=
 =?us-ascii?Q?3UzLT/vlyW/5XpuPNT9Ka2ftY+3vI3eFljsXp9BODWWuAE/+pmI+/hEG3BgX?=
 =?us-ascii?Q?dgASIwxmks3WWQ4+6k7ZViDPh4ech245oKXzhAaOd2Rn00+UmGrdPJ5yr+5i?=
 =?us-ascii?Q?d3VcdYOoXYfqgg55TvGHW9VbQfmnC7IDbNfBk7vHWunLjFoYdq86jDj6q9ep?=
 =?us-ascii?Q?gLIJnoog9NkEHSfb38ZCCOQNP+ZSWZr1+PLv31LhZH1PKyYbsVyzxuA13RCt?=
 =?us-ascii?Q?xt6VrujiHMTzEuiKUg5QQNRxqrvHyubzpsy662d/a/OZO/APuW1O00rTj7Zu?=
 =?us-ascii?Q?79BrdaqJ6YzlwU6wvPF+DsH7gXUrgMEcmBpokCcGm9MnEZhXCa+jtBsh5YJ1?=
 =?us-ascii?Q?Dj8HS2FcO8l3SEydkPP1OUH2BlHh6cRCNzzxHbQc0OaAyKTISYVVavkqZnBg?=
 =?us-ascii?Q?xGa0XvEtUKRRd9CdALLwRmclP/cKVdS7PFn5iGbqnbBjQyif9Os2tER+Qde3?=
 =?us-ascii?Q?jdUkHhi4O4ByDilK+rwATBIRFLiFHCk9DZFYFRSpBJshgpOSkaYOOsx6iu89?=
 =?us-ascii?Q?pL6sKBw2hqYTG1weP4r/Dnkn/Nmly+es0s4bH4ON5Lf7Y/sPqNgdrRmRXd1S?=
 =?us-ascii?Q?jn+i4EME5mbghZaf3w4DhX6oJSZv5GIePqeh+3sgH4AWtJt3qvMEcSC8hdXk?=
 =?us-ascii?Q?iLMLCzCmqt2JCNLbco6qYeudq1FkLWdsT2Mlj4PYRvRK/JQtGtlBqnbx+0Iu?=
 =?us-ascii?Q?73yPhwdkHtt8C6//KZFOYUbQWV9pXFFCSgRcIqCsEQladmT3N53i/qw/Qoyf?=
 =?us-ascii?Q?EcmKaSzaCDSs9tKTo6t5K4L75nOF0eFTBS5nyS4KfMLjfjOScAbnSErzYy0w?=
 =?us-ascii?Q?d8HBQk8yVXN8FoWCkH2p8GG40ztjjXcJ9bbacnycH/w4W5kYRwiLOID6WojH?=
 =?us-ascii?Q?XQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56775951-6c49-4965-ccf7-08dabb515886
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2022 15:05:28.0664
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wHjGseqGfiSIC2JLxXag5ZnREQplDmBySplDXDP3Ygl6kg49tmCWyUs19pu+fsawyx1LTuHwvcWf26AWt9kzhcM/GEBCvHuV/G4NRt841gc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6459
X-Proofpoint-ORIG-GUID: BDpvrqEkWp0MraAW1SUnqK3Z9kkFmYwv
X-Proofpoint-GUID: BDpvrqEkWp0MraAW1SUnqK3Z9kkFmYwv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-31_17,2022-10-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 mlxscore=0 clxscore=1015
 suspectscore=0 priorityscore=1501 spamscore=0 malwarescore=0 adultscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2210310094
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Oct 2022 15:05:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99378

MinIO Client (mc) provides a modern alternative to UNIX commands like
ls, cat, cp, mirror, diff, find etc. It supports filesystems and Amazon
S3 compatible cloud storage service (AWS Signature v2 and v4).

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 .../recipes-extended/minio/minio/modules.txt  | 208 +++++++
 meta-oe/recipes-extended/minio/minio_git.bb   | 158 ++++++
 meta-oe/recipes-extended/minio/src_uri.inc    | 509 ++++++++++++++++++
 3 files changed, 875 insertions(+)
 create mode 100644 meta-oe/recipes-extended/minio/minio/modules.txt
 create mode 100644 meta-oe/recipes-extended/minio/minio_git.bb
 create mode 100644 meta-oe/recipes-extended/minio/src_uri.inc

diff --git a/meta-oe/recipes-extended/minio/minio/modules.txt b/meta-oe/recipes-extended/minio/minio/modules.txt
new file mode 100644
index 000000000..fbd01e51a
--- /dev/null
+++ b/meta-oe/recipes-extended/minio/minio/modules.txt
@@ -0,0 +1,208 @@
+# github.com/charmbracelet/bubbletea v0.19.3
+## explicit
+# github.com/cheggaaa/pb v1.0.29
+## explicit
+# github.com/dustin/go-humanize v1.0.0
+## explicit
+# github.com/fatih/color v1.13.0
+## explicit
+# github.com/go-ole/go-ole v1.2.6
+## explicit
+# github.com/goccy/go-json v0.8.1
+## explicit
+# github.com/google/shlex v0.0.0-20191202100458-e7afc7fbc510
+## explicit
+# github.com/google/uuid v1.3.0
+## explicit
+# github.com/inconshreveable/mousetrap v1.0.0
+## explicit
+# github.com/json-iterator/go v1.1.12
+## explicit
+# github.com/klauspost/compress v1.13.6
+## explicit
+# github.com/mattn/go-ieproxy v0.0.1
+## explicit
+# github.com/mattn/go-isatty v0.0.14
+## explicit
+# github.com/minio/cli v1.22.0
+## explicit
+# github.com/minio/colorjson v1.0.2
+## explicit
+# github.com/minio/filepath v1.0.0
+## explicit
+# github.com/minio/madmin-go v1.4.3
+## explicit
+# github.com/minio/md5-simd v1.1.2
+## explicit
+# github.com/minio/minio-go/v7 v7.0.30
+## explicit
+# github.com/minio/pkg v1.1.22
+## explicit
+# github.com/minio/selfupdate v0.4.0
+## explicit
+# github.com/minio/sha256-simd v1.0.0
+## explicit
+# github.com/mitchellh/go-homedir v1.1.0
+## explicit
+# github.com/pkg/xattr v0.4.4
+## explicit
+# github.com/posener/complete v1.2.3
+## explicit
+# github.com/prometheus/client_golang v1.12.1
+## explicit
+# github.com/prometheus/prom2json v1.3.1
+## explicit
+# github.com/rjeczalik/notify v0.9.2
+## explicit
+# github.com/rs/xid v1.3.0
+## explicit
+# github.com/secure-io/sio-go v0.3.1
+## explicit
+# github.com/shirou/gopsutil/v3 v3.21.12
+## explicit
+# github.com/tidwall/gjson v1.12.1
+## explicit
+# golang.org/x/crypto v0.0.0-20220525230936-793ad666bf5e
+## explicit
+# golang.org/x/net v0.0.0-20220225172249-27dd8689420f
+## explicit
+# golang.org/x/text v0.3.7
+## explicit
+# gopkg.in/check.v1 v1.0.0-20200902074654-038fdea0a05b
+## explicit
+# gopkg.in/h2non/filetype.v1 v1.0.5
+## explicit
+# gopkg.in/yaml.v2 v2.4.0
+## explicit
+# github.com/charmbracelet/bubbles v0.10.0
+## explicit
+# github.com/charmbracelet/lipgloss v0.4.1-0.20220204041308-bf2912e703f6
+## explicit
+# github.com/gdamore/tcell/v2 v2.4.1-0.20210905002822-f057f0a857a1
+## explicit
+# github.com/golang-jwt/jwt/v4 v4.4.1
+## explicit
+# github.com/navidys/tvxwidgets v0.1.0
+## explicit
+# github.com/olekukonko/tablewriter v0.0.5
+## explicit
+# github.com/prometheus/client_model v0.2.0
+## explicit
+# github.com/rivo/tview v0.0.0-20211202162923-2a6de950f73b
+## explicit
+# github.com/tinylib/msgp v1.1.6
+## explicit
+# golang.org/x/term v0.0.0-20210927222741-03fcf44c2211
+## explicit
+# github.com/beorn7/perks v1.0.1
+## explicit
+# github.com/cespare/xxhash/v2 v2.1.2
+## explicit
+# github.com/containerd/console v1.0.2
+## explicit
+# github.com/coreos/go-semver v0.3.0
+## explicit
+# github.com/coreos/go-systemd/v22 v22.3.2
+## explicit
+# github.com/decred/dcrd/dcrec/secp256k1/v4 v4.0.1
+## explicit
+# github.com/fatih/structs v1.1.0
+## explicit
+# github.com/gdamore/encoding v1.0.0
+## explicit
+# github.com/gogo/protobuf v1.3.2
+## explicit
+# github.com/golang/protobuf v1.5.2
+## explicit
+# github.com/hashicorp/errwrap v1.1.0
+## explicit
+# github.com/hashicorp/go-multierror v1.1.1
+## explicit
+# github.com/klauspost/cpuid/v2 v2.0.9
+## explicit
+# github.com/kr/text v0.2.0
+## explicit
+# github.com/lestrrat-go/backoff/v2 v2.0.8
+## explicit
+# github.com/lestrrat-go/blackmagic v1.0.0
+## explicit
+# github.com/lestrrat-go/httpcc v1.0.0
+## explicit
+# github.com/lestrrat-go/iter v1.0.1
+## explicit
+# github.com/lestrrat-go/jwx v1.2.14
+## explicit
+# github.com/lestrrat-go/option v1.0.0
+## explicit
+# github.com/lucasb-eyer/go-colorful v1.2.0
+## explicit
+# github.com/lufia/plan9stats v0.0.0-20211012122336-39d0f177ccd0
+## explicit
+# github.com/mattn/go-colorable v0.1.12
+## explicit
+# github.com/mattn/go-runewidth v0.0.13
+## explicit
+# github.com/matttproud/golang_protobuf_extensions v1.0.1
+## explicit
+# github.com/modern-go/concurrent v0.0.0-20180306012644-bacd9c7ef1dd
+## explicit
+# github.com/modern-go/reflect2 v1.0.2
+## explicit
+# github.com/muesli/ansi v0.0.0-20211018074035-2e021307bc4b
+## explicit
+# github.com/muesli/reflow v0.3.0
+## explicit
+# github.com/muesli/termenv v0.11.1-0.20220204035834-5ac8409525e0
+## explicit
+# github.com/niemeyer/pretty v0.0.0-20200227124842-a10e7caefd8e
+## explicit
+# github.com/philhofer/fwd v1.1.1
+## explicit
+# github.com/pkg/errors v0.9.1
+## explicit
+# github.com/power-devops/perfstat v0.0.0-20210106213030-5aafc221ea8c
+## explicit
+# github.com/prometheus/common v0.33.0
+## explicit
+# github.com/prometheus/procfs v0.7.3
+## explicit
+# github.com/rivo/uniseg v0.2.0
+## explicit
+# github.com/sirupsen/logrus v1.8.1
+## explicit
+# github.com/tidwall/match v1.1.1
+## explicit
+# github.com/tidwall/pretty v1.2.0
+## explicit
+# github.com/tklauser/go-sysconf v0.3.9
+## explicit
+# github.com/tklauser/numcpus v0.3.0
+## explicit
+# github.com/yusufpapurcu/wmi v1.2.2
+## explicit
+# go.etcd.io/etcd/api/v3 v3.5.2
+## explicit
+# go.etcd.io/etcd/client/pkg/v3 v3.5.2
+## explicit
+# go.etcd.io/etcd/client/v3 v3.5.2
+## explicit
+# go.uber.org/atomic v1.9.0
+## explicit
+# go.uber.org/multierr v1.7.0
+## explicit
+# go.uber.org/zap v1.19.1
+## explicit
+# golang.org/x/sync v0.0.0-20210220032951-036812b2e83c
+## explicit
+# golang.org/x/sys v0.0.0-20220412211240-33da011f77ad
+## explicit
+# google.golang.org/genproto v0.0.0-20211223182754-3ac035c7e7cb
+## explicit
+# google.golang.org/grpc v1.43.0
+## explicit
+# google.golang.org/protobuf v1.27.1
+## explicit
+# gopkg.in/ini.v1 v1.66.3
+## explicit
+# gopkg.in/yaml.v3 v3.0.1
+## explicit
diff --git a/meta-oe/recipes-extended/minio/minio_git.bb b/meta-oe/recipes-extended/minio/minio_git.bb
new file mode 100644
index 000000000..d8f4c2c21
--- /dev/null
+++ b/meta-oe/recipes-extended/minio/minio_git.bb
@@ -0,0 +1,158 @@
+HOMEPAGE = "https://github.com/minio/mc"
+SUMMARY = "MinIO Client is a replacement for ls, cp, mkdir, diff and rsync commands for filesystems and object storage."
+DESCRIPTION = "MinIO Client (mc) provides a modern alternative to \
+               UNIX commands like ls, cat, cp, mirror, diff, find \
+               etc. It supports filesystems and Amazon S3 compatible \
+               cloud storage service (AWS Signature v2 and v4). \
+"
+
+SRC_URI = "git://github.com/minio/mc;nobranch=1;name=mc;protocol=https \
+           file://modules.txt \
+          "
+
+include src_uri.inc
+
+SRCREV_mc = "01b87ecc02ffad47dfe13c2154ac31db3e3115df"
+
+GO_IMPORT = "import"
+
+LICENSE = "GPL-3.0-only"
+LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=eb1e647870add0502f8f010b19de32af"
+
+PV = "${SRCREV_mc}"
+
+inherit go
+inherit goarch
+
+DEPENDS += "rsync-native"
+
+do_compile() {
+ 
+    cd ${S}/src/${GO_IMPORT}
+
+    export GOFLAGS="-mod=vendor"
+    export GOPATH="$GOPATH:${S}/src/import/.gopath:${S}/src/import/vendor"
+    sites="github.com/charmbracelet/bubbletea:github.com/charmbracelet/bubbletea \
+           github.com/cheggaaa/pb:github.com/cheggaaa/pb \
+           github.com/dustin/go-humanize:github.com/dustin/go-humanize \
+           github.com/fatih/color:github.com/fatih/color \
+           github.com/go-ole/go-ole:github.com/go-ole/go-ole \
+           github.com/goccy/go-json:github.com/goccy/go-json \
+           github.com/google/shlex:github.com/google/shlex \
+           github.com/google/uuid:github.com/google/uuid \
+           github.com/inconshreveable/mousetrap:github.com/inconshreveable/mousetrap \
+           github.com/json-iterator/go:github.com/json-iterator/go \
+           github.com/klauspost/compress:github.com/klauspost/compress \
+           github.com/mattn/go-ieproxy:github.com/mattn/go-ieproxy \
+           github.com/mattn/go-isatty:github.com/mattn/go-isatty \
+           github.com/minio/cli:github.com/minio/cli \
+           github.com/minio/colorjson:github.com/minio/colorjson \
+           github.com/minio/filepath:github.com/minio/filepath \
+           github.com/minio/madmin-go:github.com/minio/madmin-go \
+           github.com/minio/md5-simd:github.com/minio/md5-simd \
+           github.com/minio/minio-go/v7:github.com/minio/minio-go/v7 \
+           github.com/minio/pkg:github.com/minio/pkg \
+           github.com/minio/selfupdate:github.com/minio/selfupdate \
+           github.com/minio/sha256-simd:github.com/minio/sha256-simd \
+           github.com/mitchellh/go-homedir:github.com/mitchellh/go-homedir \
+           github.com/pkg/xattr:github.com/pkg/xattr \
+           github.com/posener/complete:github.com/posener/complete \
+           github.com/prometheus/client_golang:github.com/prometheus/client_golang \
+           github.com/prometheus/prom2json:github.com/prometheus/prom2json \
+           github.com/rjeczalik/notify:github.com/rjeczalik/notify \
+           github.com/rs/xid:github.com/rs/xid \
+           github.com/secure-io/sio-go:github.com/secure-io/sio-go \
+           github.com/shirou/gopsutil/v3:github.com/shirou/gopsutil/v3 \
+           github.com/tidwall/gjson:github.com/tidwall/gjson \
+           golang.org/x/crypto:go.googlesource.com/crypto \
+           golang.org/x/net:go.googlesource.com/net \
+           golang.org/x/text:go.googlesource.com/text \
+           gopkg.in/check.v1:gopkg.in/check.v1 \
+           gopkg.in/h2non/filetype.v1:gopkg.in/h2non/filetype.v1 \
+           gopkg.in/yaml.v2:gopkg.in/yaml.v2 \
+           github.com/charmbracelet/bubbles:github.com/charmbracelet/bubbles \
+           github.com/charmbracelet/lipgloss:github.com/charmbracelet/lipgloss \
+           github.com/gdamore/tcell/v2:github.com/gdamore/tcell/v2 \
+           github.com/golang-jwt/jwt/v4:github.com/golang-jwt/jwt/v4 \
+           github.com/navidys/tvxwidgets:github.com/navidys/tvxwidgets \
+           github.com/olekukonko/tablewriter:github.com/olekukonko/tablewriter \
+           github.com/prometheus/client_model:github.com/prometheus/client_model \
+           github.com/rivo/tview:github.com/rivo/tview \
+           github.com/tinylib/msgp:github.com/tinylib/msgp \
+           golang.org/x/term:go.googlesource.com/term \
+           github.com/beorn7/perks:github.com/beorn7/perks \
+           github.com/cespare/xxhash/v2:github.com/cespare/xxhash/v2 \
+           github.com/containerd/console:github.com/containerd/console \
+           github.com/coreos/go-semver:github.com/coreos/go-semver \
+           github.com/coreos/go-systemd/v22:github.com/coreos/go-systemd/v22 \
+           github.com/decred/dcrd/dcrec/secp256k1/v4:github.com/decred/dcrd/dcrec/secp256k1/v4//dcrec/secp256k1 \
+           github.com/fatih/structs:github.com/fatih/structs \
+           github.com/gdamore/encoding:github.com/gdamore/encoding \
+           github.com/gogo/protobuf:github.com/gogo/protobuf \
+           github.com/golang/protobuf:github.com/golang/protobuf \
+           github.com/hashicorp/errwrap:github.com/hashicorp/errwrap \
+           github.com/hashicorp/go-multierror:github.com/hashicorp/go-multierror \
+           github.com/klauspost/cpuid/v2:github.com/klauspost/cpuid/v2 \
+           github.com/kr/text:github.com/kr/text \
+           github.com/lestrrat-go/backoff/v2:github.com/lestrrat-go/backoff/v2 \
+           github.com/lestrrat-go/blackmagic:github.com/lestrrat-go/blackmagic \
+           github.com/lestrrat-go/httpcc:github.com/lestrrat-go/httpcc \
+           github.com/lestrrat-go/iter:github.com/lestrrat-go/iter \
+           github.com/lestrrat-go/jwx:github.com/lestrrat-go/jwx \
+           github.com/lestrrat-go/option:github.com/lestrrat-go/option \
+           github.com/lucasb-eyer/go-colorful:github.com/lucasb-eyer/go-colorful \
+           github.com/lufia/plan9stats:github.com/lufia/plan9stats \
+           github.com/mattn/go-colorable:github.com/mattn/go-colorable \
+           github.com/mattn/go-runewidth:github.com/mattn/go-runewidth \
+           github.com/matttproud/golang_protobuf_extensions:github.com/matttproud/golang_protobuf_extensions \
+           github.com/modern-go/concurrent:github.com/modern-go/concurrent \
+           github.com/modern-go/reflect2:github.com/modern-go/reflect2 \
+           github.com/muesli/ansi:github.com/muesli/ansi \
+           github.com/muesli/reflow:github.com/muesli/reflow \
+           github.com/muesli/termenv:github.com/muesli/termenv \
+           github.com/niemeyer/pretty:github.com/niemeyer/pretty \
+           github.com/philhofer/fwd:github.com/philhofer/fwd \
+           github.com/pkg/errors:github.com/pkg/errors \
+           github.com/power-devops/perfstat:github.com/power-devops/perfstat \
+           github.com/prometheus/common:github.com/prometheus/common \
+           github.com/prometheus/procfs:github.com/prometheus/procfs \
+           github.com/rivo/uniseg:github.com/rivo/uniseg \
+           github.com/sirupsen/logrus:github.com/sirupsen/logrus \
+           github.com/tidwall/match:github.com/tidwall/match \
+           github.com/tidwall/pretty:github.com/tidwall/pretty \
+           github.com/tklauser/go-sysconf:github.com/tklauser/go-sysconf \
+           github.com/tklauser/numcpus:github.com/tklauser/numcpus \
+           github.com/yusufpapurcu/wmi:github.com/yusufpapurcu/wmi \
+           go.etcd.io/etcd/api/v3:github.com/etcd-io/etcd/api/v3//api \
+           go.etcd.io/etcd/client/pkg/v3:github.com/etcd-io/etcd/api/v3//client/pkg \
+           go.etcd.io/etcd/client/v3:github.com/etcd-io/etcd/api/v3//client/v3 \
+           go.uber.org/atomic:go.uber.org/atomic \
+           go.uber.org/multierr:go.uber.org/multierr \
+           go.uber.org/zap:go.uber.org/zap \
+           golang.org/x/sync:go.googlesource.com/sync \
+           golang.org/x/sys:go.googlesource.com/sys \
+           google.golang.org/genproto:google.golang.org/genproto \
+           google.golang.org/grpc:google.golang.org/grpc \
+           google.golang.org/protobuf:google.golang.org/protobuf \
+           gopkg.in/ini.v1:gopkg.in/ini.v1 \
+           gopkg.in/yaml.v3:gopkg.in/yaml.v3"
+    for s in $sites; do
+        site_dest=$(echo $s | cut -d: -f1)
+        site_source=$(echo $s | cut -d: -f2)
+        mkdir -p vendor.copy/$site_dest
+        [ -n "$(ls -A vendor.copy/$site_dest/*.go 2> /dev/null)" ] && { echo "[INFO] vendor.fetch/$site_source -> $site_dest: go copy skipped (files present)" ; true ; } || { echo "[INFO] $site_dest: copying .go files" ; rsync -a --exclude='vendor/' --exclude='.git/' vendor.fetch/$site_source/ vendor.copy/$site_dest ; }
+    done
+
+    ln -sf vendor.copy vendor
+    # these are bad symlinks, go validates them and breaks the build if they are present
+    rm -f vendor/go.etcd.io/etcd/client/v3/example_*
+
+    cp ${WORKDIR}/modules.txt vendor/
+
+    ${GO} build -trimpath
+}
+
+do_install() {
+    install -d ${D}/${sbindir}
+    install ${S}/src/${GO_IMPORT}/mc ${D}/${sbindir}/mc
+}
diff --git a/meta-oe/recipes-extended/minio/src_uri.inc b/meta-oe/recipes-extended/minio/src_uri.inc
new file mode 100644
index 000000000..5cdc69dfc
--- /dev/null
+++ b/meta-oe/recipes-extended/minio/src_uri.inc
@@ -0,0 +1,509 @@
+# 	github.com/charmbracelet/bubbletea v0.19.3
+# [1] git ls-remote https://github.com/charmbracelet/bubbletea 3dc51789d11229a1fb00f137d02b50b04cac372b 
+SRCREV_bubbletea="3dc51789d11229a1fb00f137d02b50b04cac372b"
+SRC_URI += "git://github.com/charmbracelet/bubbletea;name=bubbletea;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/charmbracelet/bubbletea"
+
+# 	github.com/cheggaaa/pb v1.0.29
+# [1] git ls-remote https://github.com/cheggaaa/pb e2a33cc368a206516cc95f7bdd9176db0b83f098 
+SRCREV_pb="e2a33cc368a206516cc95f7bdd9176db0b83f098"
+SRC_URI += "git://github.com/cheggaaa/pb;name=pb;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/cheggaaa/pb"
+
+# 	github.com/dustin/go-humanize v1.0.0
+# [1] git ls-remote https://github.com/dustin/go-humanize e673fa1ffc91213297a60d18a6f513aa74bced52 
+SRCREV_go-humanize="e673fa1ffc91213297a60d18a6f513aa74bced52"
+SRC_URI += "git://github.com/dustin/go-humanize;name=go-humanize;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/dustin/go-humanize"
+
+# 	github.com/fatih/color v1.13.0
+# [1] git ls-remote https://github.com/fatih/color a05da93ebe62ca9fc6791d3376ec4dad01196448 
+SRCREV_color="a05da93ebe62ca9fc6791d3376ec4dad01196448"
+SRC_URI += "git://github.com/fatih/color;name=color;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/fatih/color"
+
+# 	github.com/go-ole/go-ole v1.2.6
+# [1] git ls-remote https://github.com/go-ole/go-ole 8b1f7f90f6b1728609c9694f2cff140d34fd91f8 
+SRCREV_go-ole="8b1f7f90f6b1728609c9694f2cff140d34fd91f8"
+SRC_URI += "git://github.com/go-ole/go-ole;name=go-ole;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/go-ole/go-ole"
+
+# 	github.com/goccy/go-json v0.8.1
+# [1] git ls-remote https://github.com/goccy/go-json de89bd3db67f2219c6183ec6febe2b5f7a6b06fb 
+SRCREV_go-json="de89bd3db67f2219c6183ec6febe2b5f7a6b06fb"
+SRC_URI += "git://github.com/goccy/go-json;name=go-json;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/goccy/go-json"
+
+# 	github.com/google/shlex v0.0.0-20191202100458-e7afc7fbc510
+# [1] git ls-remote https://github.com/google/shlex e7afc7fbc51079733e9468cdfd1efcd7d196cd1d 
+SRCREV_shlex="e7afc7fbc51079733e9468cdfd1efcd7d196cd1d"
+SRC_URI += "git://github.com/google/shlex;name=shlex;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/google/shlex"
+
+# 	github.com/google/uuid v1.3.0
+# [1] git ls-remote https://github.com/google/uuid 44b5fee7c49cf3bcdf723f106b36d56ef13ccc88 
+SRCREV_uuid="44b5fee7c49cf3bcdf723f106b36d56ef13ccc88"
+SRC_URI += "git://github.com/google/uuid;name=uuid;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/google/uuid"
+
+# 	github.com/inconshreveable/mousetrap v1.0.0
+# [1] git ls-remote https://github.com/inconshreveable/mousetrap 76626ae9c91c4f2a10f34cad8ce83ea42c93bb75 
+SRCREV_mousetrap="76626ae9c91c4f2a10f34cad8ce83ea42c93bb75"
+SRC_URI += "git://github.com/inconshreveable/mousetrap;name=mousetrap;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/inconshreveable/mousetrap"
+
+# 	github.com/json-iterator/go v1.1.12
+# [1] git ls-remote https://github.com/json-iterator/go 024077e996b048517130b21ea6bf12aa23055d3d 
+SRCREV_go="024077e996b048517130b21ea6bf12aa23055d3d"
+SRC_URI += "git://github.com/json-iterator/go;name=go;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/json-iterator/go"
+
+# 	github.com/klauspost/compress v1.13.6
+# [1] git ls-remote https://github.com/klauspost/compress 38d4ba985ac157cb858763e016645e14e74c13c4 
+SRCREV_compress="38d4ba985ac157cb858763e016645e14e74c13c4"
+SRC_URI += "git://github.com/klauspost/compress;name=compress;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/klauspost/compress"
+
+# 	github.com/mattn/go-ieproxy v0.0.1
+# [1] git ls-remote https://github.com/mattn/go-ieproxy 439dd0581a2a03b415673a2462ad5c21eaabc588 
+SRCREV_go-ieproxy="439dd0581a2a03b415673a2462ad5c21eaabc588"
+SRC_URI += "git://github.com/mattn/go-ieproxy;name=go-ieproxy;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/mattn/go-ieproxy"
+
+# 	github.com/mattn/go-isatty v0.0.14
+# [1] git ls-remote https://github.com/mattn/go-isatty 504425e14f742f1f517c4586048b49b37f829c8e 
+SRCREV_go-isatty="504425e14f742f1f517c4586048b49b37f829c8e"
+SRC_URI += "git://github.com/mattn/go-isatty;name=go-isatty;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/mattn/go-isatty"
+
+# 	github.com/minio/cli v1.22.0
+# [1] git ls-remote https://github.com/minio/cli 735b30120ed7535d13933b0246f8a75cf80b0f74 
+SRCREV_cli="735b30120ed7535d13933b0246f8a75cf80b0f74"
+SRC_URI += "git://github.com/minio/cli;name=cli;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/minio/cli"
+
+# 	github.com/minio/colorjson v1.0.2
+# [1] git ls-remote https://github.com/minio/colorjson f964b335cdb6cd51dff32a726d3d6ab9e1db0633 
+SRCREV_colorjson="f964b335cdb6cd51dff32a726d3d6ab9e1db0633"
+SRC_URI += "git://github.com/minio/colorjson;name=colorjson;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/minio/colorjson"
+
+# 	github.com/minio/filepath v1.0.0
+# [1] git ls-remote https://github.com/minio/filepath a116cb5d2b6396deea35d06389e3e9809c887fcf 
+SRCREV_filepath="a116cb5d2b6396deea35d06389e3e9809c887fcf"
+SRC_URI += "git://github.com/minio/filepath;name=filepath;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/minio/filepath"
+
+# 	github.com/minio/madmin-go v1.4.3
+# [1] git ls-remote https://github.com/minio/madmin-go 4f71c826739af4ebf73308e7f9a849a781859f78 
+SRCREV_madmin-go="4f71c826739af4ebf73308e7f9a849a781859f78"
+SRC_URI += "git://github.com/minio/madmin-go;name=madmin-go;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/minio/madmin-go"
+
+# 	github.com/minio/md5-simd v1.1.2
+# [1] git ls-remote https://github.com/minio/md5-simd 776275e0c9a74ceebbd50fe5c1d61b0c80c608df 
+SRCREV_md5-simd="776275e0c9a74ceebbd50fe5c1d61b0c80c608df"
+SRC_URI += "git://github.com/minio/md5-simd;name=md5-simd;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/minio/md5-simd"
+
+# 	github.com/minio/minio-go/v7 v7.0.30
+# [1] git ls-remote https://github.com/minio/minio-go 81c303325bb4426c89776854b2ea4f7936deb11c 
+SRCREV_v7="81c303325bb4426c89776854b2ea4f7936deb11c"
+SRC_URI += "git://github.com/minio/minio-go;name=v7;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/minio/minio-go/v7"
+
+# 	github.com/minio/pkg v1.1.22
+# [1] git ls-remote https://github.com/minio/pkg 3b76bdaec27995a31d0b0a7959bbef55bfe0d364 
+SRCREV_pkg="3b76bdaec27995a31d0b0a7959bbef55bfe0d364"
+SRC_URI += "git://github.com/minio/pkg;name=pkg;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/minio/pkg"
+
+# 	github.com/minio/selfupdate v0.4.0
+# [1] git ls-remote https://github.com/minio/selfupdate 9e32fb8d38277355add4fa3983edb0b376d12bb5 
+SRCREV_selfupdate="9e32fb8d38277355add4fa3983edb0b376d12bb5"
+SRC_URI += "git://github.com/minio/selfupdate;name=selfupdate;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/minio/selfupdate"
+
+# 	github.com/minio/sha256-simd v1.0.0
+# [1] git ls-remote https://github.com/minio/sha256-simd 6a57409d8e0fa3ae883aee331b71aaa40d5a7dd9 
+SRCREV_sha256-simd="6a57409d8e0fa3ae883aee331b71aaa40d5a7dd9"
+SRC_URI += "git://github.com/minio/sha256-simd;name=sha256-simd;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/minio/sha256-simd"
+
+# 	github.com/mitchellh/go-homedir v1.1.0
+# [1] git ls-remote https://github.com/mitchellh/go-homedir af06845cf3004701891bf4fdb884bfe4920b3727 
+SRCREV_go-homedir="af06845cf3004701891bf4fdb884bfe4920b3727"
+SRC_URI += "git://github.com/mitchellh/go-homedir;name=go-homedir;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/mitchellh/go-homedir"
+
+# 	github.com/pkg/xattr v0.4.4
+# [1] git ls-remote https://github.com/pkg/xattr 8725d4ccc0fcef59c8d9f0eaf606b3c6f962467a 
+SRCREV_xattr="8725d4ccc0fcef59c8d9f0eaf606b3c6f962467a"
+SRC_URI += "git://github.com/pkg/xattr;name=xattr;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/pkg/xattr"
+
+# 	github.com/posener/complete v1.2.3
+# [1] git ls-remote https://github.com/posener/complete 05b68ffc813dd10c420993cb1cf927b346c057b8 
+SRCREV_complete="05b68ffc813dd10c420993cb1cf927b346c057b8"
+SRC_URI += "git://github.com/posener/complete;name=complete;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/posener/complete"
+
+# 	github.com/prometheus/client_golang v1.12.1
+# [1] git ls-remote https://github.com/prometheus/client_golang 2e1c4818ccfdcf953ce399cadad615ff2bed968c 
+SRCREV_client_golang="2e1c4818ccfdcf953ce399cadad615ff2bed968c"
+SRC_URI += "git://github.com/prometheus/client_golang;name=client_golang;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/prometheus/client_golang"
+
+# 	github.com/prometheus/prom2json v1.3.1
+# [1] git ls-remote https://github.com/prometheus/prom2json ac13972e54feb2f8eafc9a613112cb310f5463dc 
+SRCREV_prom2json="ac13972e54feb2f8eafc9a613112cb310f5463dc"
+SRC_URI += "git://github.com/prometheus/prom2json;name=prom2json;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/prometheus/prom2json"
+
+# 	github.com/rjeczalik/notify v0.9.2
+# [1] git ls-remote https://github.com/rjeczalik/notify 69d839f37b13a8cb7a78366f7633a4071cb43be7 
+SRCREV_notify="69d839f37b13a8cb7a78366f7633a4071cb43be7"
+SRC_URI += "git://github.com/rjeczalik/notify;name=notify;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/rjeczalik/notify"
+
+# 	github.com/rs/xid v1.3.0
+# [1] git ls-remote https://github.com/rs/xid efa678f304ab65d6d57eedcb086798381ae22206 
+SRCREV_xid="efa678f304ab65d6d57eedcb086798381ae22206"
+SRC_URI += "git://github.com/rs/xid;name=xid;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/rs/xid"
+
+# 	github.com/secure-io/sio-go v0.3.1
+# [1] git ls-remote https://github.com/secure-io/sio-go a455d2cd8fcacdfe18557d117db15c0629fb7e2c 
+SRCREV_sio-go="a455d2cd8fcacdfe18557d117db15c0629fb7e2c"
+SRC_URI += "git://github.com/secure-io/sio-go;name=sio-go;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/secure-io/sio-go"
+
+# 	github.com/shirou/gopsutil/v3 v3.21.12
+# [1] git ls-remote https://github.com/shirou/gopsutil 2f8da0a39487ceddf44cebe53a1b563b0b7173cc 
+SRCREV_v3="2f8da0a39487ceddf44cebe53a1b563b0b7173cc"
+SRC_URI += "git://github.com/shirou/gopsutil;name=v3;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/shirou/gopsutil/v3"
+
+# 	github.com/tidwall/gjson v1.12.1
+# [1] git ls-remote https://github.com/tidwall/gjson db0033701cccc8e2e43b77d03e4f509a48b6b2f2 
+SRCREV_gjson="db0033701cccc8e2e43b77d03e4f509a48b6b2f2"
+SRC_URI += "git://github.com/tidwall/gjson;name=gjson;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/tidwall/gjson"
+
+# 	golang.org/x/crypto v0.0.0-20220525230936-793ad666bf5e
+# [1] git ls-remote https://go.googlesource.com/crypto 793ad666bf5ec61392092b27061be9618e4e219b 
+SRCREV_crypto="793ad666bf5ec61392092b27061be9618e4e219b"
+SRC_URI += "git://go.googlesource.com/crypto;name=crypto;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/go.googlesource.com/crypto"
+
+# 	golang.org/x/net v0.0.0-20220225172249-27dd8689420f
+# [1] git ls-remote https://go.googlesource.com/net 27dd8689420fcde088514397d015e4fea5174e0e 
+SRCREV_net="27dd8689420fcde088514397d015e4fea5174e0e"
+SRC_URI += "git://go.googlesource.com/net;name=net;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/go.googlesource.com/net"
+
+# 	golang.org/x/text v0.3.7
+# [1] git ls-remote https://go.googlesource.com/text 3cd4007149f3f883d229d707172ed356727aae99 
+SRCREV_text="3cd4007149f3f883d229d707172ed356727aae99"
+SRC_URI += "git://go.googlesource.com/text;name=text;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/go.googlesource.com/text"
+
+# 	gopkg.in/check.v1 v1.0.0-20200902074654-038fdea0a05b
+# [1] git ls-remote https://gopkg.in/check.v1 038fdea0a05bc030b0bfda479dc2e08d2220ec74 
+SRCREV_check.v1="038fdea0a05bc030b0bfda479dc2e08d2220ec74"
+SRC_URI += "git://gopkg.in/check.v1;name=check.v1;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/gopkg.in/check.v1"
+
+# 	gopkg.in/h2non/filetype.v1 v1.0.5
+# [1] git ls-remote https://gopkg.in/h2non/filetype.v1 8f3142c797f0413f00dadaf1bf97dd0b7b1f8d8b 
+SRCREV_filetype.v1="8f3142c797f0413f00dadaf1bf97dd0b7b1f8d8b"
+SRC_URI += "git://gopkg.in/h2non/filetype.v1;name=filetype.v1;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/gopkg.in/h2non/filetype.v1"
+
+# 	gopkg.in/yaml.v2 v2.4.0
+# [1] git ls-remote https://gopkg.in/yaml.v2 7649d4548cb53a614db133b2a8ac1f31859dda8c 
+SRCREV_yaml.v2="7649d4548cb53a614db133b2a8ac1f31859dda8c"
+SRC_URI += "git://gopkg.in/yaml.v2;name=yaml.v2;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/gopkg.in/yaml.v2"
+
+# 	github.com/charmbracelet/bubbles v0.10.0
+# [1] git ls-remote https://github.com/charmbracelet/bubbles 7714089ad7c81898564ebeb7b6876b5844e26ccd 
+SRCREV_bubbles="7714089ad7c81898564ebeb7b6876b5844e26ccd"
+SRC_URI += "git://github.com/charmbracelet/bubbles;name=bubbles;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/charmbracelet/bubbles"
+
+# 	github.com/charmbracelet/lipgloss v0.4.1-0.20220204041308-bf2912e703f6
+# [1] git ls-remote https://github.com/charmbracelet/lipgloss bf2912e703f6ecf88a1b843472afd47ce5002caf 
+SRCREV_lipgloss="bf2912e703f6ecf88a1b843472afd47ce5002caf"
+SRC_URI += "git://github.com/charmbracelet/lipgloss;name=lipgloss;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/charmbracelet/lipgloss"
+
+# 	github.com/gdamore/tcell/v2 v2.4.1-0.20210905002822-f057f0a857a1
+# [1] git ls-remote https://github.com/gdamore/tcell f057f0a857a1b3ac3e4fff8c6cfe8126f8387cd1 
+SRCREV_v2="f057f0a857a1b3ac3e4fff8c6cfe8126f8387cd1"
+SRC_URI += "git://github.com/gdamore/tcell;name=v2;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/gdamore/tcell/v2"
+
+# 	github.com/golang-jwt/jwt/v4 v4.4.1
+# [1] git ls-remote https://github.com/golang-jwt/jwt 0972257eba279bb357882afc11db8218644ad565 
+SRCREV_v4="0972257eba279bb357882afc11db8218644ad565"
+SRC_URI += "git://github.com/golang-jwt/jwt;name=v4;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/golang-jwt/jwt/v4"
+
+# 	github.com/navidys/tvxwidgets v0.1.0
+# [1] git ls-remote https://github.com/navidys/tvxwidgets f017cfd5ce6d4bd7fb22529305d7a438c3f1369d 
+SRCREV_tvxwidgets="f017cfd5ce6d4bd7fb22529305d7a438c3f1369d"
+SRC_URI += "git://github.com/navidys/tvxwidgets;name=tvxwidgets;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/navidys/tvxwidgets"
+
+# 	github.com/olekukonko/tablewriter v0.0.5
+# [1] git ls-remote https://github.com/olekukonko/tablewriter c7d2a8a09b076b70918308a3cd95464b2ae3b5d8 
+SRCREV_tablewriter="c7d2a8a09b076b70918308a3cd95464b2ae3b5d8"
+SRC_URI += "git://github.com/olekukonko/tablewriter;name=tablewriter;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/olekukonko/tablewriter"
+
+# 	github.com/prometheus/client_model v0.2.0
+# [1] git ls-remote https://github.com/prometheus/client_model f44e7adcba5ee54c8a94709e6fc300d83245f171 
+SRCREV_client_model="f44e7adcba5ee54c8a94709e6fc300d83245f171"
+SRC_URI += "git://github.com/prometheus/client_model;name=client_model;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/prometheus/client_model"
+
+# 	github.com/rivo/tview v0.0.0-20211202162923-2a6de950f73b
+# [1] git ls-remote https://github.com/rivo/tview 2a6de950f73bdc70658f7e754d4b5593f15c8408 
+SRCREV_tview="2a6de950f73bdc70658f7e754d4b5593f15c8408"
+SRC_URI += "git://github.com/rivo/tview;name=tview;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/rivo/tview"
+
+# 	github.com/tinylib/msgp v1.1.6
+# [1] git ls-remote https://github.com/tinylib/msgp 205265da651409c54677b486e350b4d105da6d8b 
+SRCREV_msgp="205265da651409c54677b486e350b4d105da6d8b"
+SRC_URI += "git://github.com/tinylib/msgp;name=msgp;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/tinylib/msgp"
+
+# 	golang.org/x/term v0.0.0-20210927222741-03fcf44c2211
+# [1] git ls-remote https://go.googlesource.com/term 03fcf44c2211dcd5eb77510b5f7c1fb02d6ded50 
+SRCREV_term="03fcf44c2211dcd5eb77510b5f7c1fb02d6ded50"
+SRC_URI += "git://go.googlesource.com/term;name=term;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/go.googlesource.com/term"
+
+# 	github.com/beorn7/perks v1.0.1
+# [1] git ls-remote https://github.com/beorn7/perks c49ff274687222a7373c4cd83578f1065cf3e143 
+SRCREV_perks="c49ff274687222a7373c4cd83578f1065cf3e143"
+SRC_URI += "git://github.com/beorn7/perks;name=perks;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/beorn7/perks"
+
+# 	github.com/cespare/xxhash/v2 v2.1.2
+# [1] git ls-remote https://github.com/cespare/xxhash 7ae26c41ed6fb1f8a6c21e05eeff4d91b5e401c4 
+SRCREV_v21="7ae26c41ed6fb1f8a6c21e05eeff4d91b5e401c4"
+SRC_URI += "git://github.com/cespare/xxhash;name=v21;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/cespare/xxhash/v2"
+
+# 	github.com/containerd/console v1.0.2
+# [1] git ls-remote https://github.com/containerd/console d5efa7d56fd239f7f3dad2ab6685db09359a3618 
+SRCREV_console="d5efa7d56fd239f7f3dad2ab6685db09359a3618"
+SRC_URI += "git://github.com/containerd/console;name=console;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/containerd/console"
+
+# 	github.com/coreos/go-semver v0.3.0
+# [1] git ls-remote https://github.com/coreos/go-semver 6e25b691b0ebe9657dd0ee60d73a9f8716f0c6f5 
+SRCREV_go-semver="6e25b691b0ebe9657dd0ee60d73a9f8716f0c6f5"
+SRC_URI += "git://github.com/coreos/go-semver;name=go-semver;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/coreos/go-semver"
+
+# 	github.com/coreos/go-systemd/v22 v22.3.2
+# [1] git ls-remote https://github.com/coreos/go-systemd 0b40357fd65760243a3eceb80a299772c23c8470 
+SRCREV_v22="0b40357fd65760243a3eceb80a299772c23c8470"
+SRC_URI += "git://github.com/coreos/go-systemd;name=v22;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/coreos/go-systemd/v22"
+
+# 	github.com/decred/dcrd/dcrec/secp256k1/v4 v4.0.1
+# [1] git ls-remote https://github.com/decred/dcrd 75f1b4dac2e43133f3281ac63a9ef9eb699200e5 
+SRCREV_v41="75f1b4dac2e43133f3281ac63a9ef9eb699200e5"
+SRC_URI += "git://github.com/decred/dcrd;name=v41;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/decred/dcrd/dcrec/secp256k1/v4"
+
+# 	github.com/fatih/structs v1.1.0
+# [1] git ls-remote https://github.com/fatih/structs 4966fc68f5b7593aafa6cbbba2d65ec6e1416047 
+SRCREV_structs="4966fc68f5b7593aafa6cbbba2d65ec6e1416047"
+SRC_URI += "git://github.com/fatih/structs;name=structs;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/fatih/structs"
+
+# 	github.com/gdamore/encoding v1.0.0
+# [1] git ls-remote https://github.com/gdamore/encoding 79c592247a6248468805a0e297f43a7cac979903 
+SRCREV_encoding="79c592247a6248468805a0e297f43a7cac979903"
+SRC_URI += "git://github.com/gdamore/encoding;name=encoding;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/gdamore/encoding"
+
+# 	github.com/gogo/protobuf v1.3.2
+# [1] git ls-remote https://github.com/gogo/protobuf b03c65ea87cdc3521ede29f62fe3ce239267c1bc 
+SRCREV_protobuf="b03c65ea87cdc3521ede29f62fe3ce239267c1bc"
+SRC_URI += "git://github.com/gogo/protobuf;name=protobuf;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/gogo/protobuf"
+
+# 	github.com/golang/protobuf v1.5.2
+# [1] git ls-remote https://github.com/golang/protobuf ae97035608a719c7a1c1c41bed0ae0744bdb0c6f 
+SRCREV_protobuf1="ae97035608a719c7a1c1c41bed0ae0744bdb0c6f"
+SRC_URI += "git://github.com/golang/protobuf;name=protobuf1;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/golang/protobuf"
+
+# 	github.com/hashicorp/errwrap v1.1.0
+# [1] git ls-remote https://github.com/hashicorp/errwrap 7b00e5db719c64d14dd0caaacbd13e76254d02c0 
+SRCREV_errwrap="7b00e5db719c64d14dd0caaacbd13e76254d02c0"
+SRC_URI += "git://github.com/hashicorp/errwrap;name=errwrap;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/hashicorp/errwrap"
+
+# 	github.com/hashicorp/go-multierror v1.1.1
+# [1] git ls-remote https://github.com/hashicorp/go-multierror 9974e9ec57696378079ecc3accd3d6f29401b3a0 
+SRCREV_go-multierror="9974e9ec57696378079ecc3accd3d6f29401b3a0"
+SRC_URI += "git://github.com/hashicorp/go-multierror;name=go-multierror;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/hashicorp/go-multierror"
+
+# 	github.com/klauspost/cpuid/v2 v2.0.9
+# [1] git ls-remote https://github.com/klauspost/cpuid 6903d4066801a7d800d4537ee9eebe81ea97000e 
+SRCREV_v212="6903d4066801a7d800d4537ee9eebe81ea97000e"
+SRC_URI += "git://github.com/klauspost/cpuid;name=v212;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/klauspost/cpuid/v2"
+
+# 	github.com/kr/text v0.2.0
+# [1] git ls-remote https://github.com/kr/text 0e5f52c28dd72ab84daeb81b5a51f20fdc35f9c5 
+SRCREV_text1="0e5f52c28dd72ab84daeb81b5a51f20fdc35f9c5"
+SRC_URI += "git://github.com/kr/text;name=text1;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/kr/text"
+
+# 	github.com/lestrrat-go/backoff/v2 v2.0.8
+# [1] git ls-remote https://github.com/lestrrat-go/backoff c3af762cb9d2bc8339e1d5099a4550366a675f60 
+SRCREV_v2123="c3af762cb9d2bc8339e1d5099a4550366a675f60"
+SRC_URI += "git://github.com/lestrrat-go/backoff;name=v2123;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/lestrrat-go/backoff/v2"
+
+# 	github.com/lestrrat-go/blackmagic v1.0.0
+# [1] git ls-remote https://github.com/lestrrat-go/blackmagic 370527f88bbfd5be3192a38af3148dbd64f0976f 
+SRCREV_blackmagic="370527f88bbfd5be3192a38af3148dbd64f0976f"
+SRC_URI += "git://github.com/lestrrat-go/blackmagic;name=blackmagic;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/lestrrat-go/blackmagic"
+
+# 	github.com/lestrrat-go/httpcc v1.0.0
+# [1] git ls-remote https://github.com/lestrrat-go/httpcc e7e8fea419e32f7549252ad15ecf17f3a3c1a268 
+SRCREV_httpcc="e7e8fea419e32f7549252ad15ecf17f3a3c1a268"
+SRC_URI += "git://github.com/lestrrat-go/httpcc;name=httpcc;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/lestrrat-go/httpcc"
+
+# 	github.com/lestrrat-go/iter v1.0.1
+# [1] git ls-remote https://github.com/lestrrat-go/iter 628869e97ee3dcc09033086e547a5cab96b0d708 
+SRCREV_iter="628869e97ee3dcc09033086e547a5cab96b0d708"
+SRC_URI += "git://github.com/lestrrat-go/iter;name=iter;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/lestrrat-go/iter"
+
+# 	github.com/lestrrat-go/jwx v1.2.14
+# [1] git ls-remote https://github.com/lestrrat-go/jwx de7d9bca43812abc4f630320f8632108ccfe34bf 
+SRCREV_jwx="de7d9bca43812abc4f630320f8632108ccfe34bf"
+SRC_URI += "git://github.com/lestrrat-go/jwx;name=jwx;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/lestrrat-go/jwx"
+
+# 	github.com/lestrrat-go/option v1.0.0
+# [1] git ls-remote https://github.com/lestrrat-go/option 7e3467dce320ff45667b138ae503367c92deaa0b 
+SRCREV_option="7e3467dce320ff45667b138ae503367c92deaa0b"
+SRC_URI += "git://github.com/lestrrat-go/option;name=option;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/lestrrat-go/option"
+
+# 	github.com/lucasb-eyer/go-colorful v1.2.0
+# [1] git ls-remote https://github.com/lucasb-eyer/go-colorful d2b05a0d83cca9d610425691c3253d5f36d0ad06 
+SRCREV_go-colorful="d2b05a0d83cca9d610425691c3253d5f36d0ad06"
+SRC_URI += "git://github.com/lucasb-eyer/go-colorful;name=go-colorful;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/lucasb-eyer/go-colorful"
+
+# 	github.com/lufia/plan9stats v0.0.0-20211012122336-39d0f177ccd0
+# [1] git ls-remote https://github.com/lufia/plan9stats 39d0f177ccd07bdf5eb6f051ab9b09651f05d6f2 
+SRCREV_plan9stats="39d0f177ccd07bdf5eb6f051ab9b09651f05d6f2"
+SRC_URI += "git://github.com/lufia/plan9stats;name=plan9stats;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/lufia/plan9stats"
+
+# 	github.com/mattn/go-colorable v0.1.12
+# [1] git ls-remote https://github.com/mattn/go-colorable e1bb79c8d53c38a60962ad4b8f658226cc983710 
+SRCREV_go-colorable="e1bb79c8d53c38a60962ad4b8f658226cc983710"
+SRC_URI += "git://github.com/mattn/go-colorable;name=go-colorable;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/mattn/go-colorable"
+
+# 	github.com/mattn/go-runewidth v0.0.13
+# [1] git ls-remote https://github.com/mattn/go-runewidth df1ff59654317c1b5a3f860ffc47402931932104 
+SRCREV_go-runewidth="df1ff59654317c1b5a3f860ffc47402931932104"
+SRC_URI += "git://github.com/mattn/go-runewidth;name=go-runewidth;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/mattn/go-runewidth"
+
+# 	github.com/matttproud/golang_protobuf_extensions v1.0.1
+# [1] git ls-remote https://github.com/matttproud/golang_protobuf_extensions c12348ce28de40eed0136aa2b644d0ee0650e56c 
+SRCREV_golang_protobuf_extensions="c12348ce28de40eed0136aa2b644d0ee0650e56c"
+SRC_URI += "git://github.com/matttproud/golang_protobuf_extensions;name=golang_protobuf_extensions;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/matttproud/golang_protobuf_extensions"
+
+# 	github.com/modern-go/concurrent v0.0.0-20180306012644-bacd9c7ef1dd
+# [1] git ls-remote https://github.com/modern-go/concurrent bacd9c7ef1dd9b15be4a9909b8ac7a4e313eec94 
+SRCREV_concurrent="bacd9c7ef1dd9b15be4a9909b8ac7a4e313eec94"
+SRC_URI += "git://github.com/modern-go/concurrent;name=concurrent;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/modern-go/concurrent"
+
+# 	github.com/modern-go/reflect2 v1.0.2
+# [1] git ls-remote https://github.com/modern-go/reflect2 2b33151c9bbc5231aea69b8861c540102b087070 
+SRCREV_reflect2="2b33151c9bbc5231aea69b8861c540102b087070"
+SRC_URI += "git://github.com/modern-go/reflect2;name=reflect2;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/modern-go/reflect2"
+
+# 	github.com/muesli/ansi v0.0.0-20211018074035-2e021307bc4b
+# [1] git ls-remote https://github.com/muesli/ansi 2e021307bc4b4f4766c3fb4faf6030b13dc9ec51 
+SRCREV_ansi="2e021307bc4b4f4766c3fb4faf6030b13dc9ec51"
+SRC_URI += "git://github.com/muesli/ansi;name=ansi;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/muesli/ansi"
+
+# 	github.com/muesli/reflow v0.3.0
+# [1] git ls-remote https://github.com/muesli/reflow 602e329532049c9e33fa8c74e352a46fb9486947 
+SRCREV_reflow="602e329532049c9e33fa8c74e352a46fb9486947"
+SRC_URI += "git://github.com/muesli/reflow;name=reflow;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/muesli/reflow"
+
+# 	github.com/muesli/termenv v0.11.1-0.20220204035834-5ac8409525e0
+# [1] git ls-remote https://github.com/muesli/termenv 5ac8409525e03ee6cd96daeae32d47902b88f32a 
+SRCREV_termenv="5ac8409525e03ee6cd96daeae32d47902b88f32a"
+SRC_URI += "git://github.com/muesli/termenv;name=termenv;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/muesli/termenv"
+
+# 	github.com/niemeyer/pretty v0.0.0-20200227124842-a10e7caefd8e
+# [1] git ls-remote https://github.com/niemeyer/pretty a10e7caefd8e0d600cea437f5c3613aeb1553d56 
+SRCREV_pretty="a10e7caefd8e0d600cea437f5c3613aeb1553d56"
+SRC_URI += "git://github.com/niemeyer/pretty;name=pretty;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/niemeyer/pretty"
+
+# 	github.com/philhofer/fwd v1.1.1
+# [1] git ls-remote https://github.com/philhofer/fwd 9bcb9cab1b0394d8516a132ec243ba944efdb644 
+SRCREV_fwd="9bcb9cab1b0394d8516a132ec243ba944efdb644"
+SRC_URI += "git://github.com/philhofer/fwd;name=fwd;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/philhofer/fwd"
+
+# 	github.com/pkg/errors v0.9.1
+# [1] git ls-remote https://github.com/pkg/errors 614d223910a179a466c1767a985424175c39b465 
+SRCREV_errors="614d223910a179a466c1767a985424175c39b465"
+SRC_URI += "git://github.com/pkg/errors;name=errors;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/pkg/errors"
+
+# 	github.com/power-devops/perfstat v0.0.0-20210106213030-5aafc221ea8c
+# [1] git ls-remote https://github.com/power-devops/perfstat 5aafc221ea8c1ff54b0835cbd5f2386a8410be11 
+SRCREV_perfstat="5aafc221ea8c1ff54b0835cbd5f2386a8410be11"
+SRC_URI += "git://github.com/power-devops/perfstat;name=perfstat;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/power-devops/perfstat"
+
+# 	github.com/prometheus/common v0.33.0
+# [1] git ls-remote https://github.com/prometheus/common 63e75f51cd2368130efbd51b95a4e457e64b444e 
+SRCREV_common="63e75f51cd2368130efbd51b95a4e457e64b444e"
+SRC_URI += "git://github.com/prometheus/common;name=common;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/prometheus/common"
+
+# 	github.com/prometheus/procfs v0.7.3
+# [1] git ls-remote https://github.com/prometheus/procfs f436cbb89ece38bf080d446b3ca27053b305eaac 
+SRCREV_procfs="f436cbb89ece38bf080d446b3ca27053b305eaac"
+SRC_URI += "git://github.com/prometheus/procfs;name=procfs;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/prometheus/procfs"
+
+# 	github.com/rivo/uniseg v0.2.0
+# [1] git ls-remote https://github.com/rivo/uniseg 75711fccf6a3e85bc74c241e2dddd06a9bc9e53d 
+SRCREV_uniseg="75711fccf6a3e85bc74c241e2dddd06a9bc9e53d"
+SRC_URI += "git://github.com/rivo/uniseg;name=uniseg;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/rivo/uniseg"
+
+# 	github.com/sirupsen/logrus v1.8.1
+# [1] git ls-remote https://github.com/sirupsen/logrus bdc0db8ead3853c56b7cd1ac2ba4e11b47d7da6b 
+SRCREV_logrus="bdc0db8ead3853c56b7cd1ac2ba4e11b47d7da6b"
+SRC_URI += "git://github.com/sirupsen/logrus;name=logrus;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/sirupsen/logrus"
+
+# 	github.com/tidwall/match v1.1.1
+# [1] git ls-remote https://github.com/tidwall/match 4c9fc61b493b7aa0a3d347e9190aa78c5bec09cf 
+SRCREV_match="4c9fc61b493b7aa0a3d347e9190aa78c5bec09cf"
+SRC_URI += "git://github.com/tidwall/match;name=match;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/tidwall/match"
+
+# 	github.com/tidwall/pretty v1.2.0
+# [1] git ls-remote https://github.com/tidwall/pretty aaa765e7476acb0028a854b85675801362cbdaa2 
+SRCREV_pretty1="aaa765e7476acb0028a854b85675801362cbdaa2"
+SRC_URI += "git://github.com/tidwall/pretty;name=pretty1;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/tidwall/pretty"
+
+# 	github.com/tklauser/go-sysconf v0.3.9
+# [1] git ls-remote https://github.com/tklauser/go-sysconf 746b19d14e19d242c2daa08e0d645c19832c1939 
+SRCREV_go-sysconf="746b19d14e19d242c2daa08e0d645c19832c1939"
+SRC_URI += "git://github.com/tklauser/go-sysconf;name=go-sysconf;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/tklauser/go-sysconf"
+
+# 	github.com/tklauser/numcpus v0.3.0
+# [1] git ls-remote https://github.com/tklauser/numcpus cc3fdd5f3955d53d50d94380963bddd24bd373e2 
+SRCREV_numcpus="cc3fdd5f3955d53d50d94380963bddd24bd373e2"
+SRC_URI += "git://github.com/tklauser/numcpus;name=numcpus;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/tklauser/numcpus"
+
+# 	github.com/yusufpapurcu/wmi v1.2.2
+# [1] git ls-remote https://github.com/yusufpapurcu/wmi 253c5f0cb35e666c4c0fc42083824e7c89f0cc8d 
+SRCREV_wmi="253c5f0cb35e666c4c0fc42083824e7c89f0cc8d"
+SRC_URI += "git://github.com/yusufpapurcu/wmi;name=wmi;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/yusufpapurcu/wmi"
+
+# 	go.etcd.io/etcd/api/v3 v3.5.2
+# [1] git ls-remote https://github.com/etcd-io/etcd 4591a096d4d3c08e577d7269851938db0c1da3d4 
+SRCREV_v31="4591a096d4d3c08e577d7269851938db0c1da3d4"
+SRC_URI += "git://github.com/etcd-io/etcd;name=v31;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/etcd-io/etcd/api/v3"
+
+# 	go.uber.org/atomic v1.9.0
+# [1] git ls-remote https://github.com/uber-go/atomic 135466e2d0c8f8adf4d37dc757e3df0ebdd0dfe8 
+SRCREV_atomic="135466e2d0c8f8adf4d37dc757e3df0ebdd0dfe8"
+SRC_URI += "git://github.com/uber-go/atomic;name=atomic;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/go.uber.org/atomic"
+
+# 	go.uber.org/multierr v1.7.0
+# [1] git ls-remote https://github.com/uber-go/multierr 19d9fff1d3b66750a134671435786579bc994737 
+SRCREV_multierr="19d9fff1d3b66750a134671435786579bc994737"
+SRC_URI += "git://github.com/uber-go/multierr;name=multierr;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/go.uber.org/multierr"
+
+# 	go.uber.org/zap v1.19.1
+# [1] git ls-remote https://github.com/uber-go/zap 2f61e97148e69cd2dd1902b03e89ce07cd1218a1 
+SRCREV_zap="2f61e97148e69cd2dd1902b03e89ce07cd1218a1"
+SRC_URI += "git://github.com/uber-go/zap;name=zap;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/go.uber.org/zap"
+
+# 	golang.org/x/sync v0.0.0-20210220032951-036812b2e83c
+# [1] git ls-remote https://go.googlesource.com/sync 036812b2e83c0ddf193dd5a34e034151da389d09 
+SRCREV_sync="036812b2e83c0ddf193dd5a34e034151da389d09"
+SRC_URI += "git://go.googlesource.com/sync;name=sync;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/go.googlesource.com/sync"
+
+# 	golang.org/x/sys v0.0.0-20220412211240-33da011f77ad
+# [1] git ls-remote https://go.googlesource.com/sys 33da011f77ade50ff5b6a6fb4a9a1e6d6b285809 
+SRCREV_sys="33da011f77ade50ff5b6a6fb4a9a1e6d6b285809"
+SRC_URI += "git://go.googlesource.com/sys;name=sys;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/go.googlesource.com/sys"
+
+# 	google.golang.org/genproto v0.0.0-20211223182754-3ac035c7e7cb
+# [1] git ls-remote https://github.com/googleapis/go-genproto 3ac035c7e7cbd86eb6d8b95be888cf83d73dedd3 
+SRCREV_genproto="3ac035c7e7cbd86eb6d8b95be888cf83d73dedd3"
+SRC_URI += "git://github.com/googleapis/go-genproto;name=genproto;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/google.golang.org/genproto"
+
+# 	google.golang.org/grpc v1.43.0
+# [1] git ls-remote https://github.com/grpc/grpc-go 14c11384b76b67f7b1b32a5d18f865762634c0ae 
+SRCREV_grpc="14c11384b76b67f7b1b32a5d18f865762634c0ae"
+SRC_URI += "git://github.com/grpc/grpc-go;name=grpc;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/google.golang.org/grpc"
+
+# 	google.golang.org/protobuf v1.27.1
+# [1] git ls-remote https://github.com/protocolbuffers/protobuf-go b92717ecb630d4a4824b372bf98c729d87311a4d 
+SRCREV_protobuf12="b92717ecb630d4a4824b372bf98c729d87311a4d"
+SRC_URI += "git://github.com/protocolbuffers/protobuf-go;name=protobuf12;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/google.golang.org/protobuf"
+
+# 	gopkg.in/ini.v1 v1.66.3
+# [1] git ls-remote https://gopkg.in/ini.v1 fcd6cc399e588727c1231f4ea187d1b963536bcc 
+SRCREV_ini.v1="fcd6cc399e588727c1231f4ea187d1b963536bcc"
+SRC_URI += "git://gopkg.in/ini.v1;name=ini.v1;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/gopkg.in/ini.v1"
+
+# 	gopkg.in/yaml.v3 v3.0.1
+# [1] git ls-remote https://gopkg.in/yaml.v3 f6f7691b1fdeb513f56608cd2c32c51f8194bf51 
+SRCREV_yaml.v3="f6f7691b1fdeb513f56608cd2c32c51f8194bf51"
+SRC_URI += "git://gopkg.in/yaml.v3;name=yaml.v3;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/gopkg.in/yaml.v3"
-- 
2.33.0


