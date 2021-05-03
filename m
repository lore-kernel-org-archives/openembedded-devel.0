Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.82])
 by mx.groups.io with SMTP id smtpd.web11.35858.1620056587412251972
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 May 2021 08:43:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=mbO1HxGY;
 spf=pass (domain: windriver.com, ip: 40.107.237.82, mailfrom: saul.wold@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lGV/KB/g9iaqV1laoAOieDSc/6VBMHvkZTXDAmhjB0nguHaZCfFKA9XMLDh3S1xcfyMWXRJc/g0F/ke8NwvttI3/hB7SJzUBIOnq3bJKohl0T3wP51e3y5t6W2jFnYaiRCyzfk/im7m8Z1FMVNOHZABs7+ix5lH2vvhzTSc/Q6ToHmHAcKc43eHpkSmpEB5h7l7xMHtXw1SBnJctGOldme+AGv+DVcHaG1TC5Xa70ZG/zkF1hlLlDw5WvlfuV3m1xZiZHVkyHPiVCMarNLfyI6kUhpbDchs3IcXr6l+yvgRcQDXHq2G/GTBrxxkCsHD2J1Om5gG3rjpTHeGOeCIVHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0vdEb35sZIRRQl9Vme6PwVL6/2n1C6b/q1OuuxF7rsA=;
 b=J9VmdfRPPbP4cwSm8e9dvE5njhjW+clmrDYkatsaL21Fq1PeKOzuWMgQgIiF/qqJSkpZIE4AZIDe6OhJu3qISdIn/FqkHD5rO4TLhrvrgTG/VErVfj/eT6ltJNvZAonMzY+OYwJ1H3yCw1muk5su5xc1mvamGNQgoNyLZbziJfljOVeGhcijO0FPiN3x3jRap1BUw/314ju5ovDi3EExFBf7h5rLY/agx3hUcOJxU7XkQjXionHAZLR2tWdOwqDAAwjXOqg8BhPFEVywxRkQXVyL4wiJ4DtuWqbP/dyoUYON/mcMtxrIJk9szR/+IWg//3AswoSdtFTlwNeBVDpYDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0vdEb35sZIRRQl9Vme6PwVL6/2n1C6b/q1OuuxF7rsA=;
 b=mbO1HxGYz7cM4lwARwtCb8936nTQMnefzs57NdbnyB1H2CYWq2nx94GKjrYFmDT1zJ5sWEK2fNXvi0bZTtWcCUvmTi2VUVrMFApCmvFnhFyJxay0Nb2UN7ZMOsz9Hiz6E9ov8Ipkfzsl7lb+VRZKcsMpuHJZQfBq/ulFkqgGwHg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by MWHPR11MB1853.namprd11.prod.outlook.com (2603:10b6:300:112::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.44; Mon, 3 May
 2021 15:43:02 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::351e:20b5:1ef6:48f7]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::351e:20b5:1ef6:48f7%6]) with mapi id 15.20.4065.039; Mon, 3 May 2021
 15:43:02 +0000
From: "Saul Wold" <Saul.Wold@windriver.com>
To: openembedded-devel@lists.openembedded.org
CC: Saul Wold <Saul.Wold@windriver.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][hardknott] tbb: Disable PPC as COMPATIBLE_MACHINE
Date: Mon,  3 May 2021 08:42:47 -0700
Message-ID: <20210503154248.2359344-1-saul.wold@windriver.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [71.238.119.71]
X-ClientProxiedBy: MW4PR04CA0251.namprd04.prod.outlook.com
 (2603:10b6:303:88::16) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
Return-Path: saul.wold@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yocto-hs.bigsur.com.bigsur.com (71.238.119.71) by MW4PR04CA0251.namprd04.prod.outlook.com (2603:10b6:303:88::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.28 via Frontend Transport; Mon, 3 May 2021 15:43:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8c1c8c49-387f-45b7-f818-08d90e4a22c7
X-MS-TrafficTypeDiagnostic: MWHPR11MB1853:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB1853E23E509B7F4141ADD4EBEE5B9@MWHPR11MB1853.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zAGzFGh0c1xXkxTBi8b8BJsXLzFhs5P2JLO9sSD1uplTsmZ8Hm147Tc4Pb0jDPZVRnl6nOXXoBJpzWKdB/+mQxcYwrXHP6yrpyFhy66cPGzx2q212gZgsDivbWAwtNxYLxmo/OCwx7VqrROQQgMx3XoLqHQRz99+5GIO/0PCHLkJG/+r048vGDZnoQoQmElzffm60xZQcUSl7g6hIfsHTD763ZK2CfF6Spps2Me6ghlUkGy0k0sZnwDyEzalucqvx7kVUIFjoC3+kM4RIfHIZKVQu1AF9LnaLlC0NUPWuabvhPIQ5mSCa9Q+HZxzMo8Pfawq79DIYPiIKJUwu3s+m6VntZgWI0duLD0Kn97iVXsp3KLMYL7/ZSJIBqJmT+dJh8YfwywVzCN+nr4uvRISG9nG0pr/b0iPIt6dSYnS0Xbb9I3uOH0hrQ/YgYhlU6nLQWaYhLfiJFC7XRbVUlu6JSLNIiicOW5hX/cQdMR3bujL4tsVi66c85gKPGbvck6RVa4cpdjLDvq0uXRVEk33LCBHlcI3aspGllrbO6epGAAIbeaPVhMMYWiR1ZLfoHL43X5i+3ieE8W08kzdbMVTvlBgJolGtzZ+dcab94NR/vvsM4gjLEu7cfrPlEAsO+mWKCv6wmPUCfG4L3FFbS7708Tsi3JA95cb8PXruNKaa7A=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(39850400004)(376002)(366004)(136003)(26005)(478600001)(956004)(6916009)(44832011)(4326008)(6666004)(2906002)(54906003)(316002)(186003)(16526019)(8676002)(6486002)(1076003)(66476007)(66946007)(8936002)(52116002)(66556008)(38100700002)(5660300002)(86362001)(38350700002)(2616005)(6512007)(36756003)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?pBK5u+lCnc8SyKlNU+zYPrxN2uJJjfB8Qp+18x1x2mI32qjuannhnG2c0k6m?=
 =?us-ascii?Q?aKWf+R2+FV4a43T1uoru/WRSc2SyuDu36L62kVCugdI2IRtPd+xeMee09ai+?=
 =?us-ascii?Q?EPldi/WYeU1qkV7Egl4l8+IDGI7egu33xSfU0dqap/RlwcJ7a/uN/g8nEuQc?=
 =?us-ascii?Q?YN4f1LPWy2Bx2i74G+EdkCD0D/GPhLdyFsZh1OLq5EuTVQVvqTpkQ2jHa1xz?=
 =?us-ascii?Q?eWWhRNGa0tDHa+TFw+ZHDu4T53MDI0JRZewONyBvhFuNknJlEyg9Qi2vmhUu?=
 =?us-ascii?Q?jzjbwY3LaR2EKtoCtt0//09OvOMMdXMBDeEVbplxuFqjWVLpOQPSRmMwfQG3?=
 =?us-ascii?Q?elwBrhjygho2o1QJ/gGZ5FUitQmt4Z4s8T2lH99LpUVduIFKt/5ngpeM1RR+?=
 =?us-ascii?Q?Y4e1V75L5atC/Z2zn7Jj67NtTGG6FltGD2pmMRecT8vzL1fUzO0ng96lRTJQ?=
 =?us-ascii?Q?uIvUc+RWYf7KQXVLEHHyDbUV8WpTpKuu8bP85SX5IVLGT7gXEV7ORwDfEL9c?=
 =?us-ascii?Q?WSM74VTcJfSn4Q/uO8w7LiXQx0emwH/KumgCXYZ91fxyGlC0p/BFcdrHKqQs?=
 =?us-ascii?Q?Etvd24Ifh4KgZR5uKuWlCpC6Tz3Xsl0yj+Ywv2EC+kbaKyw3daaMBojb428P?=
 =?us-ascii?Q?bT50YMKsllBcWszp1Bt0E2A6IbxSYF6FEI9tPogIRarAYPydR9ehUp7zQz/5?=
 =?us-ascii?Q?ounUpjrYZ3l23/kV6H7Gk+zl3on+2MMnmWdP4BS3OpkS7kG7Ju3ZQ06/uEsX?=
 =?us-ascii?Q?qeyNvaafGr5KVEkg+ADQU5pvcCzKJx8baikOLtMfmZvmykJaA8ofUSJLjfYu?=
 =?us-ascii?Q?i3cTHOGBBMvWT5zxFTIQhSB5WGkF5kL8Z2onRSWJzCq8Cdro6fb/W2r/fnDJ?=
 =?us-ascii?Q?NvyDP3ClvRbI1VgDhPQVwm5bW3ZtnN/Fw8IcjZNa0zLfprusE8Yd1kE8v3Yf?=
 =?us-ascii?Q?VzzvyPXEeQPJOx1jNTqLolnldwq913/YBeQBpHvFlRXoEBb0a1oRz2fNmkLV?=
 =?us-ascii?Q?SjbeV/N78sJXgny2nBIby/v7G/sgu+Vcmih7e6uK/Li9aDO2e033i8He4OeP?=
 =?us-ascii?Q?pGq6iJwzGWaRl8V5cbgb4nv1yzvKErfjGaDBrxfQ2tl8nBn3R7xnfLGZsrCO?=
 =?us-ascii?Q?CQj7GRnCHzm/JZ7IBeOrZWMfg6eG8Ms2Z+Fo3yOEBXWeWp0crk52T053Dxwk?=
 =?us-ascii?Q?64Fdiqe4+Fi4EjzJuPDng/y4ULARJphLCPLJT33PWH9yTI8Ahya0OGn5UK3h?=
 =?us-ascii?Q?ekE5/hI8uRq7clkU4GXrcUD6CQuW+rsfBnInl4XPJbwqVUWGNpYoKgInb3dJ?=
 =?us-ascii?Q?wN7hDjsD237w9nk4i2de7CHD?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c1c8c49-387f-45b7-f818-08d90e4a22c7
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2021 15:43:02.4560
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CNVgf3KADV3sO6h63sDlgepMxtEp8ZUrD2I9RkBYg2be1IqoQtDbjOpTxRdzn7S2BU4N5qpohIB28KXGjWZJ3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1853
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

From: Saul Wold <Saul.Wold@windriver.com>

The latest version does not support PPC architecture, so disable
the it. Otherwise the following error occurs:

/srv/nvme/yocto/hardknott/builds/tbb/tmp/work/ppc7400-poky-linux/tbb/2021.2=
.0-r0/git/src/tbb/tools_api/ittnotify_config.h:338:12: error: '__TBB_machin=
e_fetchadd4' was not declared in this scope
  338 |     return __TBB_machine_fetchadd4(ptr, 1) + 1L;
      |            ^~~~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Saul Wold <saul.wold@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/tbb/tbb_2021.2.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-support/tbb/tbb_2021.2.0.bb b/meta-oe/recipes-=
support/tbb/tbb_2021.2.0.bb
index b05a59dc7..d8a18866c 100644
--- a/meta-oe/recipes-support/tbb/tbb_2021.2.0.bb
+++ b/meta-oe/recipes-support/tbb/tbb_2021.2.0.bb
@@ -43,3 +43,6 @@ LDFLAGS_append_mips =3D " -latomic"
 LDFLAGS_append_mipsel =3D " -latomic"
=20
 LDFLAGS_append_libc-musl =3D " -lucontext"
+
+# The latest version of oneTBB does not support PPC
+COMPATIBLE_MACHINE_powerpc =3D "(!.*ppc).*"
--=20
2.25.1

