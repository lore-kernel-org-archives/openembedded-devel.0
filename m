Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11AD1C433EF
	for <webhook@archiver.kernel.org>; Tue, 28 Dec 2021 07:38:24 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.36034.1640677102032641172
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 23:38:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=AxStFGF8;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=7996075b3e=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1BS7X8fB006773
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 23:38:21 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=qy7WKZJtSj4qnghLPU2SWQKHVGn5j4iLfldxkmuAn8I=;
 b=AxStFGF8mOIqwn9XC3ashqSF79k80PY+A8CsaMLBebeNufp1HMZydGSOLJ09+lLsIEqM
 2jHb51h1vxXjtxEXKRr3GjCdC6kPrUSdnIrClzdOwNy3BYwislyPW8I70r603s0L127v
 WrXO070fW9A0cW6r1nhgG38onxK8vPNHmaETO2gf4V1QKn95FFSq2MQoqSBfEf003ZgM
 ad4ePCTi4CfJf+uIHSQzv07sOMiFmGBVjn7t4ljtuL1q8Kp1gHgenQ2inPGp/O8TPuIf
 u0l7Av+OSP9hZtkupIztjOJUZ0aVzfNzkuamsjzzKXUfWrhNDESkEPJlUb5AkN2i2Vo2 iQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3d7m0c08aj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 23:38:21 -0800
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 1BS7cLdq015284
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 23:38:21 -0800
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3d7m0c08ag-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Dec 2021 23:38:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SNXHDKXu9KvEpuYk7+RtIyJ+2irpX6xlUiVGMGZD2a81ckO8a6nUVz8sCHM6eG69XSPBvLYkm6Ru4lS5oClfaWfJE1O0U25vXJC3PSvp/p0L8M2hwZuH6ZcjpzXl0eqGJWpfeGE03SZmkf+dT67ok4SPAqZdFbtHZLBtbPzCUzP7ID3a4Vz8mbqVuih+UsWEBtYNDV8wOxN1WBC9W0L9dUEvyARONl/+ZVdX6R2l1JpaLS2tJIv0GfJ3hFq7iJhwVjBY6tnWEQA5UQDBd/IfEwOXMLwMmnVvpTh4VsxV2ASAEXo85PI1UfHrF+nlLgmwQachYv16uBQ4jwZD8kV3uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qy7WKZJtSj4qnghLPU2SWQKHVGn5j4iLfldxkmuAn8I=;
 b=LKsueiOtKcq7tF9AuDkX0p1Gymepiy44vC/qWpLkkkAhb27+ZsQ4co1eds08zSBCqGyEZOnHHjUfn6sYBZ3g/s7f3BN3U1Gc5g5650mrGOHNvMRkgo0P1qpZRNtgjt3VC/Rm0xn2wXPnemIZiBm1RJmKHbq+Gx4FaQJvGfZu9dwKmFrAcmlKItKHMm9QV/t7zjVZUnty6jXRN9fau+A2WE+t0nTHjSJOzIIkujQ1HiCLlQngBSNgYnK6EQ9MljLslt+p1wvBL9U23M5v/kunDMmLXtboczjb7kNFnSaDHDumDhK8K6UvNNLXz6tiOPn2MzaJIp9vy+ey4wBv9opisw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MW3PR11MB4539.namprd11.prod.outlook.com (2603:10b6:303:2f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19; Tue, 28 Dec
 2021 07:38:19 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::8962:26c6:20fe:eaa4]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::8962:26c6:20fe:eaa4%6]) with mapi id 15.20.4823.023; Tue, 28 Dec 2021
 07:38:19 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org, akuster808@gmail.com
Subject: [meta-networking][hardknott][PATCH 00/19] samba: upgrade 4.10.18 ->
 4.14.11
Date: Tue, 28 Dec 2021 15:37:47 +0800
Message-Id: <20211228073806.868759-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR04CA0057.apcprd04.prod.outlook.com
 (2603:1096:202:14::25) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 986c1b3a-148f-4ae5-1a65-08d9c9d5045d
X-MS-TrafficTypeDiagnostic: MW3PR11MB4539:EE_
X-Microsoft-Antispam-PRVS: 
	<MW3PR11MB453931CFF8F0FD3448874D68F9439@MW3PR11MB4539.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	sKcSlAUwl7g5MPot0RfOvDMVgYz9yDyhXFLGgdbQtJRdm8joyaFqNeha4BamiYos80kb7orbSwNbkxYPYjJj0g/AfTTK7QfCtuAzUPgLJ9sgBZxEzGl+JFtew3skvY1RcpDZi55tLj5TG+W87n62a+gsdX1xGyKgh1CdRCqqJze6eSqGIOXbAuECIAtMn42JhBQhN+kc6A2b6mwq09zzbTCmCjFdUnpWde97zdpwZoBK6SjUvn4RjEkTS9kKk8F2sm0Ql6jquE2vhuxoMRbdrJxEHjrW3Ec7Gzt7xawcYA1PkY8LY/kKnqrurQwPVQ2zrKyH/O6XpxY2tvezRcgLipZT6/KYSSk0Wi2u887iwx8p5mptYxI5sMLxsO6VBhD8hWzKTWG7xTQb2/3l4B+8SMgc5leVMfOKJoYKeY5c2r1llwrYkPtOaniMzbvVTG5zYWLnFwTfmpWrWSICtPDbLabYjgTCjEtzgRVYl/Wjnm58O9gYLjG8KTrWJkWg7lI1Vl2dW+F4w9Bj8TzQVzmYbx15OzWyE6nFZUomSm/QvsiUcqHPMgSxkabh5Vg1ToLUHEvWc1gD6Mm4hFdi9ynW35QQ68aSCql28ANuWMNqkjBXAUK6F4qU7nTc0zi5JtzIkbZydtA1/HW9NeqC7cTA5LB6c4/f21w7roo2Iir9E2S63YSO5ZzRos5AR3GlxylBSvOwsm6nRpm+LudHQ6lHOCYRDmovRrMZ6Pus0DDvGUgVbWCz1+TkO69jKYfR8hVt6jGm7ISd8+Pd/1Bst+hp0vK+KihfRswx/yWwIzg72Zc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2906002)(8936002)(966005)(86362001)(36756003)(6666004)(316002)(2616005)(508600001)(5660300002)(8676002)(6486002)(44832011)(6506007)(52116002)(66946007)(186003)(38100700002)(1076003)(26005)(38350700002)(6512007)(66476007)(66556008)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?WtEdzne20IBJfMVgujF93rt+fFoZvROtXFq8kYF4lTC9JnCGX8bxawKiW/CR?=
 =?us-ascii?Q?q1OwnUi6+ESSELy4YIBdV6Hq8VDOq3G9HLH5c1qut0Nx5cRIJ6Kw70M1/dab?=
 =?us-ascii?Q?ouRH0VO5RzJzWzuVNCKCatdf5WwoCRZWu0gRqkZCuHIHW0fwYlTOZTqwEbMA?=
 =?us-ascii?Q?9JiFwKFtM7QmSADHltQzB2GkXaMhJRnT6xkL2K6cfP8M6yO0MthinXpvN77x?=
 =?us-ascii?Q?tjuiONllS+w+ApV7AwcBXMjnLuPkoy7QTPDTCPxeLD41yI0OsVEcDTD3fjGE?=
 =?us-ascii?Q?aLTEAIofCN9DDIXTN2qYcbldtEHZqnKgeHE9eGeAyxuulXs+y12v7QzMNN4Q?=
 =?us-ascii?Q?eYgWz+QZ9kDXEZ5HGQjVljupIhLgHCcaPtNFCyD6s7choKUKMuxA5QLFvHlE?=
 =?us-ascii?Q?nMdJpIxTJIjJl+QdB3HM/1eIGpZA89XVT78UvBe/5VbjR7WoN6PGJ48DwB7S?=
 =?us-ascii?Q?3KOLa1KX8n5DFnwCsOPrlZLyo3lCMKwzryuklrBfFOR0uLxVnMnhpm6kBoAd?=
 =?us-ascii?Q?aRUJpNXMuwgyAD2OqHgrnQiUd3O0/hMBZiaxXvWB9JjlEI+KoOlAIlHU63hd?=
 =?us-ascii?Q?Mvj1EaMOKp5Udc9rceVJYvQkk18fCCT9wh4p9H1dCdnvmGDxR5JMjLZJAKJp?=
 =?us-ascii?Q?HPPInrO8XgzxmPH1CGySzLjS5uoyIXvAYyc6eDlF9X1aGMl5Bj8DgngMRVXS?=
 =?us-ascii?Q?GJGVnotJgaUjLYNB0k/aGBOrd7YaXz2supFA2G9CygLttCWMnMGrPCtrd8g/?=
 =?us-ascii?Q?yxX2EKqKfDXqVni8YdCC8UrfqjiqkrsJnop2zUFVsDlwIPEyOYDUnSIhFIgk?=
 =?us-ascii?Q?DsYkvF0v5BL8BA92wYe/8iQueLpxJCJN/ujK7xqw+iaRfQguKDHtL+AtZm3m?=
 =?us-ascii?Q?AXNq199B1+vtsOIsFCyyjtZj/94Jm5AZ21lVKEcdbej95owFai+RfP5z+y5y?=
 =?us-ascii?Q?6/0vPWN7NDgbWX0op54fJ06t7/G5RYTxaVc3/107E5+3b6rBknLi+OZ/L5Xq?=
 =?us-ascii?Q?bDFnizL8oRsAkrv7s+c9GJ47es1GTCFPPbc038mnGLIfUAThIlJhjW7mVcfz?=
 =?us-ascii?Q?aJCSw1Y+8b1A4joIcJFK83IO72LCFRSEyWSTNnCp6QV2iqS+dm/ZCcbTYwNS?=
 =?us-ascii?Q?m87AgzuEPiRhiJ2xJTmaYtz0uF1a8aJ0Y6MCE66xJhSIKFoYX+mTZpYJRibD?=
 =?us-ascii?Q?8Le7o5rFDLDSuxc3Xz1/qQW9LWy03lJwlXVWZE7/NZYI73tDndlfCsTMhMBR?=
 =?us-ascii?Q?OjZlawPXOWBFWvvv+G5IYjKF5gN2p3QJdGgW/4V3QnLxeZvjPB3NtosKCmcw?=
 =?us-ascii?Q?Qipva7oXmhvp54Nm/zZSQYyedUH0GYH/XdAc4caLdq4D700J506mnh/OhxGr?=
 =?us-ascii?Q?7KFSRY1NA6tdRAdNpGNkmz+fR3WwUQV7CN+UC9vOLDCmfvy0tb/LRZOr86Nh?=
 =?us-ascii?Q?pR9NeEX2i2hvqATDwvBrTeBvk0OS789PiZkz5HrbeInqoWGAwEyDb/NnqHzU?=
 =?us-ascii?Q?OyHLQ/WSiPhwC68OpudxTOXWfuIP6w0kZFUb8U4QjhPaioAfmbzOoHHZS19E?=
 =?us-ascii?Q?kToB7GrV+ukmuE4KrRWELAacWPO3ctz6bmHZspxcmcEhVrfTammtU3YQNVoP?=
 =?us-ascii?Q?4T45JfRqV7DWEVye+b9SIJg=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 986c1b3a-148f-4ae5-1a65-08d9c9d5045d
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2021 07:38:19.0930
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 xGJ4GjYMCTFOpCHC7U1bQnhrwCX+yRDBuNudzmp9WVXeMZ9daMARs0GUzWyZze5m1Axzd7zlV0iq8saL0SsjVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4539
X-Proofpoint-GUID: vLzhfIXQcYt9u6mOI_Zppipgb9Q3OOZY
X-Proofpoint-ORIG-GUID: BHELAcNEfHrxnl5Om28y9OhOL5R8vKVx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-28_04,2021-12-24_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 adultscore=0 phishscore=0 clxscore=1011 priorityscore=1501 spamscore=0
 malwarescore=0 mlxscore=0 impostorscore=0 suspectscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112280033
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Dec 2021 07:38:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94527

Upgrade from 4.10.x to 4.14.x to fix CVEs.

The samba 4.10.x is EOL so it can not get the latest CVEs fixes. Previously, we backport patches from upstream to fix the CVEs.
Unfortunately, for some recent CVEs, it is difficult to backport because there are more than one hundred patches:
https://git.samba.org/?p=samba.git&a=search&h=refs%2Fheads%2Fv4-14-stable&st=commit&s=CVE

Upgrading to 4.14.x seems to be a better way.


Khem Raj (2):
  libldb: Inherit pkgconfig
  samba: Inherit pkgconfig

Persian Prince (1):
  samba: Don't guess dirs for perllocal.pod removing

Yi Zhao (14):
  libldb: upgrade 1.5.8 -> 2.3.0
  libparse-yapp-perl: add recipe
  samba: upgrade 4.10.18 -> 4.14.4
  samba: update smb.conf
  samba: disable check fcntl RW_HINTS when configure
  samba: upgrade 4.14.4 -> 4.14.5
  samba: fix shebang for pidl
  samba: add missing runtime dependency for pidl
  samba: upgrade 4.14.5 -> 4.14.7
  samba: upgrade 4.14.7 -> 4.14.8
  libldb: upgrade 2.3.0 -> 2.3.2
  samba: upgrade 4.14.8 -> 4.14.10
  samba: add pyldb to rdepends for samba-python3
  samba: update cross-answers files

wangmy (1):
  samba: Solve the dependency problem when installing Samba

zhengruoqin (1):
  samba: upgrade 4.14.10 -> 4.14.11

 .../cross-answers-aarch64.txt                 |   5 +
 .../cross-answers-aarch64_be.txt              |   5 +
 .../waf-cross-answers/cross-answers-arm.txt   |   5 +
 .../waf-cross-answers/cross-answers-armeb.txt |   5 +
 .../waf-cross-answers/cross-answers-i586.txt  |   5 +
 .../waf-cross-answers/cross-answers-i686.txt  |   5 +
 .../waf-cross-answers/cross-answers-mips.txt  |   5 +
 .../cross-answers-mips64.txt                  |   5 +
 .../cross-answers-mips64el.txt                |   5 +
 .../cross-answers-mipsel.txt                  |   5 +
 .../cross-answers-powerpc.txt                 |   5 +
 .../cross-answers-powerpc64.txt               |   5 +
 .../cross-answers-powerpc64le.txt             |   5 +
 .../cross-answers-riscv32.txt                 |   5 +
 .../cross-answers-riscv64.txt                 |   5 +
 .../cross-answers-x86_64.txt                  |   5 +
 ... 0001-Don-t-check-xsltproc-manpages.patch} |  24 +--
 ...ipt-Avoid-generating-nested-main-fun.patch |  30 ----
 ....c-Avoid-nss-function-conflicts-with.patch |  96 ------------
 ...001-waf-add-support-of-cross_compile.patch |  62 --------
 ...t-target-module-while-cross-compile.patch} |   8 +-
 ...ve-__thread-variable-to-global-scope.patch |  58 -------
 ...-Add-config-option-without-valgrind.patch} |  12 +-
 ...ions-to-configure-the-use-of-libbsd.patch} |  45 +++---
 ...5-samba-build-dnsserver_common-code.patch} |  13 +-
 .../samba/samba/CVE-2020-14318.patch          | 142 ------------------
 .../samba/samba/CVE-2020-14383.patch          | 112 --------------
 .../samba/samba/glibc_only.patch              |  28 ----
 .../samba/samba/iconv-4.7.0.patch             |  25 ---
 ... samba-fix-musl-lib-without-innetgr.patch} |   0
 .../recipes-connectivity/samba/samba/smb.conf |  40 ++---
 .../samba/samba/smb_conf-4.7.0.patch          |  28 ----
 .../{samba_4.10.18.bb => samba_4.14.11.bb}    |  89 ++++++-----
 ...t-target-module-while-cross-compile.patch} |  12 +-
 ...001-waf-add-support-of-cross_compile.patch |  62 --------
 ...-Add-configure-options-for-packages.patch} |  38 ++---
 ...> 0003-avoid-openldap-unless-wanted.patch} |  13 +-
 ...bldb-fix-musl-libc-unkown-type-error.patch |  31 ----
 .../{libldb_1.5.8.bb => libldb_2.3.2.bb}      |  14 +-
 .../perl/libparse-yapp-perl_1.21.bb           |  21 +++
 40 files changed, 254 insertions(+), 829 deletions(-)
 rename meta-networking/recipes-connectivity/samba/samba/{16-do-not-check-xsltproc-manpages.patch => 0001-Don-t-check-xsltproc-manpages.patch} (77%)
 delete mode 100644 meta-networking/recipes-connectivity/samba/samba/0001-lib-replace-wscript-Avoid-generating-nested-main-fun.patch
 delete mode 100644 meta-networking/recipes-connectivity/samba/samba/0001-nsswitch-nsstest.c-Avoid-nss-function-conflicts-with.patch
 delete mode 100644 meta-networking/recipes-connectivity/samba/samba/0001-waf-add-support-of-cross_compile.patch
 rename meta-networking/{recipes-support/libldb/libldb/do-not-import-target-module-while-cross-compile.patch => recipes-connectivity/samba/samba/0002-do-not-import-target-module-while-cross-compile.patch} (94%)
 delete mode 100644 meta-networking/recipes-connectivity/samba/samba/0002-util_sec.c-Move-__thread-variable-to-global-scope.patch
 rename meta-networking/recipes-connectivity/samba/samba/{21-add-config-option-without-valgrind.patch => 0003-Add-config-option-without-valgrind.patch} (88%)
 rename meta-networking/recipes-connectivity/samba/samba/{0001-Add-options-to-configure-the-use-of-libbsd.patch => 0004-Add-options-to-configure-the-use-of-libbsd.patch} (76%)
 rename meta-networking/recipes-connectivity/samba/samba/{dnsserver-4.7.0.patch => 0005-samba-build-dnsserver_common-code.patch} (55%)
 delete mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-2020-14318.patch
 delete mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-2020-14383.patch
 delete mode 100644 meta-networking/recipes-connectivity/samba/samba/glibc_only.patch
 delete mode 100644 meta-networking/recipes-connectivity/samba/samba/iconv-4.7.0.patch
 rename meta-networking/recipes-connectivity/samba/samba/{0001-samba-fix-musl-lib-without-innetgr.patch => samba-fix-musl-lib-without-innetgr.patch} (100%)
 delete mode 100644 meta-networking/recipes-connectivity/samba/samba/smb_conf-4.7.0.patch
 rename meta-networking/recipes-connectivity/samba/{samba_4.10.18.bb => samba_4.14.11.bb} (83%)
 rename meta-networking/{recipes-connectivity/samba/samba/20-do-not-import-target-module-while-cross-compile.patch => recipes-support/libldb/libldb/0001-do-not-import-target-module-while-cross-compile.patch} (90%)
 delete mode 100644 meta-networking/recipes-support/libldb/libldb/0001-waf-add-support-of-cross_compile.patch
 rename meta-networking/recipes-support/libldb/libldb/{options-1.5.4.patch => 0002-ldb-Add-configure-options-for-packages.patch} (90%)
 rename meta-networking/recipes-support/libldb/libldb/{avoid-openldap-unless-wanted.patch => 0003-avoid-openldap-unless-wanted.patch} (68%)
 delete mode 100644 meta-networking/recipes-support/libldb/libldb/libldb-fix-musl-libc-unkown-type-error.patch
 rename meta-networking/recipes-support/libldb/{libldb_1.5.8.bb => libldb_2.3.2.bb} (84%)
 create mode 100644 meta-oe/recipes-devtools/perl/libparse-yapp-perl_1.21.bb

-- 
2.25.1


