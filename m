Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 422C4C25B47
	for <webhook@archiver.kernel.org>; Wed, 25 Oct 2023 08:57:17 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.53])
 by mx.groups.io with SMTP id smtpd.web10.169177.1698224230583794739
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Oct 2023 01:57:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=DBoSMIeu;
 spf=pass (domain: navimatix.de, ip: 40.107.249.53, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AjOIi1bt1y85uwH0onncQGZ229Ixue3pksvSRPaW1FG4jkt7NdYYPVJYTF5xmmH4cEbbrHSfYKyBEzw3+zRSR3j0FQeXXzQ15cs4cvl5A7G8uhgwbPW7DcWLhNlQvg1gCdI0nXw5E5p3JBBmSGKupDbuAVbdf2GSc2nqiIbDlkvljzy6/8UaY+KZWMiX5l6uUwsED0wn3t2Gej10GwooVPEwP3L5LwCJOTc2LlwQ2on/c17Z62NzE7YmyElZPbG297YzIoqFieUjp/bdgwhNH7BVVWRLk4PapueguP8NnEDsllT7ddFQfxL+rIz14z69S4/4gDmy6D1GynaimlyYyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xLvrH+OLGbAdGJtY8Or79ALT+OD6LOHmWlOyaWq73ZY=;
 b=PzjP1UQolGlk4P4c8l2PP2Hub7mj2ZPsET/Q3KHo/Mq7fWs1GIdmhV7OZIJ74aVVtfkhr0WSMlZxct3RJ+AmL9sq8uZ+pVuepiTFlill9xLl/QoGqxqNTaHV8BvkYmb/2D0tbMx5lYHR+zOFBc1gKUpE23ja8ffXQdwHxv8h/tNNznVp1MOEKMwptjCgum8uC9cV6aRR1LtqjpONQWwcOee0V8IEOiK1mwNEkteyXjWxwPiYcPMOE2WIy04dMiShgyzaZzjWmcTlXabf2UwYJ/j5yhg34uB5Gur9NgVsVLzzBFnnSRncC1zK5H9jLZ5l2m2uglctqkXoVubpy9itoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xLvrH+OLGbAdGJtY8Or79ALT+OD6LOHmWlOyaWq73ZY=;
 b=DBoSMIeuKhkrsUAs31qm+BdCgwu5z7HYqr0rojb/OOeK4vbdGoPNTOkvirWVXSzYTbe6yzSz3bpuc2qoCg14LqQjc8rLL66jqe6A/afTL9vQBZIO5tfb27jV6zmrLkiZBq50gbMdmyh5H4fHOiBAtx2NQme1t2+DeqFS4LwvBDs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:5::26) by PAXPR01MB9316.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:2c0::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.19; Wed, 25 Oct
 2023 08:57:06 +0000
Received: from VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 ([fe80::e2d5:b5c9:16e3:1417]) by
 VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 ([fe80::e2d5:b5c9:16e3:1417%3]) with mapi id 15.20.6907.032; Wed, 25 Oct 2023
 08:57:05 +0000
Message-ID: <d9ff922b-383a-4cec-b206-84d86987f4f8@navimatix.de>
Date: Wed, 25 Oct 2023 10:57:04 +0200
User-Agent: Mozilla Thunderbird
To: openembedded-devel@lists.openembedded.org
Content-Language: en-US, de-DE
From: =?UTF-8?Q?J=C3=B6rg_Sommer?= <joerg.sommer@navimatix.de>
Subject: openssl-native.rm_work runs before kernel-module.install -> no
 signature
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0025.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:15::6) To VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:5::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR0102MB3136:EE_|PAXPR01MB9316:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ef01d95-5b15-426c-a205-08dbd5385cef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	TpITqthv/IXc7LnETsXbGrQ0fDzWcnJpj+lE96H/yMDH9xvhnfqepzU+Ha4GVjIiQJVNakzU6ezJrHqreCGJBZ88j9UxYAr4K/nRsQoGQ53ihaL2gqSTLrdtIL/8w7D93fRzmtnu1dOA1ljwGq4PTdGAsdWy7JwqBvT4tg4DBoaUmQh8oPvo99k/Elvsn3hcW+bqLTqKTXSKGxpV6BUzNkvBP/5R8CUR8eeK+BTDDxn2GxMMQ0lFPrApH2Fvh/x3UBl/Di5PtwQFNP3gwUv5UD8JmlKdmQX+JooGI+OG1O0Vs10+1xZF/pAhZ9UjoVUaFhyLgQMqZCtnP2j6Tqq/Fr/Li6ByDDCG5fK3+lJ/z0ASDykA+/G3uVGkrHjh6mmCeQ56PoVdJlwQ8nyA8Fykq1MTdn21j11p5zWHHPoz83wD6dt5nrqbiEtTJQnSQMYJdCYU/kFPyeEtMatAdryrtn3PZyz/pm2zwt4Qst3AgDiVNm92JcX/RHt6zJnHa+J8W7/9cWME/amoXp1x2u6zC7CtfI9Hw81IQqpZs2UzMGULL7eGzOLW9kDuILU5M5+s9SjGm3vjW2KuROV6Vxw+9OS9kzcWFkjASe/FPUm6jNU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0102MB3136.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(39840400004)(396003)(366004)(376002)(346002)(136003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(41300700001)(6506007)(478600001)(2616005)(6512007)(66556008)(66476007)(66946007)(36756003)(6916009)(316002)(31696002)(6486002)(966005)(86362001)(66574015)(26005)(83380400001)(38100700002)(8676002)(8936002)(5660300002)(31686004)(2906002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?00sd6207hmRlEQHSnoXGWXzYQ9jTGxEZ4Z14wmKK3m+IVDOGpbWxjK6QF9jd?=
 =?us-ascii?Q?lBBsNtzFXM/nrMJBvKONbp9FnL6Bz/qfzYUnpk86CwuhGWQx2WKIBtSf1b5c?=
 =?us-ascii?Q?6ZdIaBLrTja1S709goFgQMjB0XiIho7I5rd6yXdVAAeqMdET93j6AfsXrYSD?=
 =?us-ascii?Q?3cCy366dAPrdPMZMCE/i9owvHHPX7cgBaOHOluX0MIcHqfeGGjVi5smXHzju?=
 =?us-ascii?Q?gfRRr3ijMVSPHOsWwnbUb7ii1eQSm9afnGF6YcJ8qFcnEgmRa3ETBAkfsYqi?=
 =?us-ascii?Q?EauJUBEGcXzP/4ySQFVtnl739snE8TiCbWFf/hNVdoViTdQhgqVkwZKbDmen?=
 =?us-ascii?Q?uFYJK3fieRtiUmy54ROsQGzwSpGxilVBI+/6lAxX0/pSbnWUCGCFPqzhjfCH?=
 =?us-ascii?Q?U128tmRUThIuqBIJoFvgxDOYx7XQHeyXDpG1m/pLX5Ojy8UnbPuLFiKHCgE+?=
 =?us-ascii?Q?HLNkhIQ4PL3cH8IyJMG2TSMm10p6E6moMDFdYURkinUvhsoQ3hWQ/Ol3XYv6?=
 =?us-ascii?Q?iAnrIAlY0MibQODCpQZyfFKX/mlL9ajF3rIzSou4pPHPUkM4tFBGJNXjJCwR?=
 =?us-ascii?Q?jpZNNfpKHKeZW22Ez7740Q3yGyRzfvCBoyfomPhMgZDdUkyzncjK7hZ7cdHp?=
 =?us-ascii?Q?VtT1yQUocwhuzHqEwnN58C0nueFJLCQIfN3ICXEXzhpRZFqUUDb/+hA4f8dc?=
 =?us-ascii?Q?5801SUWdVZeKbJ7/a4uEzv8B9sKeIe8K4mk4dhOk6u7Q0h/XchDrqhccFEfE?=
 =?us-ascii?Q?NKhoBVEqwnuWVLFnHv0xd4YwOshJ9z4T0r5Up1LXL6/mK7/8mH2exgn6OXeF?=
 =?us-ascii?Q?SWT8y43FTJMFJ8Aq3rnfIPvw7Qlb4JhYxyw+pYG9Jj7S82JbPyUAUbZdlSHo?=
 =?us-ascii?Q?GWR7by+uePHF1P6RHTMqZRFprKEMALVk77SJCAtZRYrBGSP/DKjkWJKwSWWe?=
 =?us-ascii?Q?DhsaB2XgNhYs1ImKT3vEdy6Cuyp5Egn8rkadszsxQFGMXu51IttwmwHcaw+Y?=
 =?us-ascii?Q?FlHIYZM4YkLrmkCJGUsSahRl4K0vsegxdKvmzu9uj2Zk9SDOWQWt5bBUhMRO?=
 =?us-ascii?Q?+J+vSRO0qt0jD2kEaVHgUxbHtwgz4gfGBSTIQ+CiaZcnZISAbsKaKacx+RQ/?=
 =?us-ascii?Q?ZOJ1KOjjgTfnblRI0mkeau26iuxMqJn0hva6h+A+USgGkUa7oGo3oVv6f0e1?=
 =?us-ascii?Q?wK6E1Os/Yv+cQ01zhUZOsnGbOpSmjdlRtKb7zb/EW7BmOpYuImGRq7xE5xqB?=
 =?us-ascii?Q?jukoqaFDe6GpgMZLkGlSO9jR+0kTSmyCplE4V/bVNiQ5Ys/eLr3KXyYFEddz?=
 =?us-ascii?Q?d0aM0pL8V7ti3BdU1dHYUussS/WC0usn/f07JmD0YKDmdho8FftxqhEsu+Ae?=
 =?us-ascii?Q?JkUdOu6iihWARoVNXY/CpZTQLmtjSfQku0ZSGsIH7UQseqvwm/AT3xq4xbS6?=
 =?us-ascii?Q?WSWVINbIOeDv7y2dv5qARPg1oSWoj7oNPtCuRK6iM+wCyuhZBOOiCkO9raEv?=
 =?us-ascii?Q?Yr+cRVMLdjxqpAI5j4tZv8q56Q8ZKb75veXCKHgc3Tb0MTXuap6knq0UfWx8?=
 =?us-ascii?Q?CS+ohpkMEcQwh0no7msBhBqUoxHiwmGDWJKepeJ0wxxDn3f5R6tchysJ253d?=
 =?us-ascii?Q?0Q=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ef01d95-5b15-426c-a205-08dbd5385cef
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2023 08:57:05.9091
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DcgKK/Ig2LUklGGV4iqWErWRiz9vvQEN28VqkR9kNUf767KEHi5UQOZ0Xtr1tWGy4yG1DDTCZJzOcJKy/IMfBDfypDkoIv4nNHVJPQ/WR/o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR01MB9316
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Oct 2023 08:57:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105726

Hi,

I'm having an odd problem building the external kernel module
kernel-module-imx-gpu-viv [1]. I'm using kirkstone and have rm_work
enabled.

[1]  https://layers.openembedded.org/layerindex/recipe/40267/

The module builds fine, but the install step contains the module signing
which **silently** fails with *libcrypto.so.3* not found:

```
| make -C /build/tmp/work-shared/ziborium/kernel-source
M=3D/build/tmp/work/machine-pyxis-linux/kernel-module-imx-gpu-viv/6.4.3.p4.=
2-r0/git/src
modules_install
| make[1]: Entering directory '/build/tmp/work-shared/machine/kernel-source=
'
| make -C /build/tmp/work-shared/machine/kernel-build-artifacts -f
/build/tmp/work-shared/machine/kernel-source/Makefile modules_install
| make[2]: Entering directory
'/build/tmp/work-shared/machine/kernel-build-artifacts'
| test -e include/generated/autoconf.h -a -e include/config/auto.conf ||
(		\
| echo >&2;							\
| echo >&2 "  ERROR: Kernel configuration is invalid.";		\
| echo >&2 "         include/generated/autoconf.h or
include/config/auto.conf are missing.";\
| echo >&2 "         Run 'make oldconfig && make prepare' on kernel src
to fix it.";	\
| echo >&2 ;							\
| /bin/false)
| make -f
/build/tmp/work-shared/machine/kernel-source/scripts/Makefile.modinst
|   mkdir -p
/build/tmp/work/machine-dist-linux/kernel-module-imx-gpu-viv/6.4.3.p4.2-r0/=
image/usr/lib/modules/5.15.60-imx8mm+g343e81c0e39e/extra/;
cp
/build/tmp/work/machine-dist-linux/kernel-module-imx-gpu-viv/6.4.3.p4.2-r0/=
git/src/galcore.ko
/build/tmp/work/machine-dist-linux/kernel-module-imx-gpu-viv/6.4.3.p4.2-r0/=
image/usr/lib/modules/5.15.60-imx8mm+g343e81c0e39e/extra/galcore.ko
|   :
|   scripts/sign-file "sha1" "certs/signing_key.pem"
certs/signing_key.x509
/build/tmp/work/machine-dist-linux/kernel-module-imx-gpu-viv/6.4.3.p4.2-r0/=
image/usr/lib/modules/5.15.60-imx8mm+g343e81c0e39e/extra/galcore.ko
|| true
| scripts/sign-file: error while loading shared libraries:
libcrypto.so.3: cannot open shared object file: No such file or directory
|   sh /build/tmp/work-shared/machine/kernel-source/scripts/depmod.sh
echo 5.15.60-imx8mm+g343e81c0e39e
| Warning: modules_install: missing 'System.map' file. Skipping depmod.
| make[2]: Leaving directory
'/build/tmp/work-shared/machine/kernel-build-artifacts'
| make[1]: Leaving directory '/build/tmp/work-shared/machine/kernel-source'
```

I noticed that there are special dependency definitions in make-mod-scripts

```
do_configure[depends] +=3D "virtual/kernel:do_shared_workdir
openssl-native:do_populate_sysroot"
do_compile[depends] +=3D "virtual/kernel:do_compile_kernelmodules"
```

and module-base.bbclass (inherited by module.bbclass)

```
# We do the dependency this way because the output is not preserved
# in sstate, so we must force do_compile to run (once).
do_configure[depends] +=3D "make-mod-scripts:do_compile"
```

Is there an additional dependency needed to address rm_work?

Kind regards

J=C3=B6rg Sommer
--=20
Navimatix GmbH
Tatzendpromenade 2
D-07745 Jena
Gesch=C3=A4ftsf=C3=BChrer: Steffen Sp=C3=A4the, Jan Rommeley
Registergericht: Amtsgericht Jena, HRB 501480

