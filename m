Return-Path: <jamin_lin@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 282CAFA372A
	for <webhook@archiver.kernel.org>; Fri, 13 Sep 2024 08:02:19 +0000 (UTC)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (APC01-SG2-obe.outbound.protection.outlook.com [40.107.215.114])
 by mx.groups.io with SMTP id smtpd.web11.68564.1726214535935781538
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Sep 2024 01:02:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@aspeedtech.com header.s=selector2 header.b=GT5Cp8vW;
 spf=pass (domain: aspeedtech.com, ip: 40.107.215.114, mailfrom: jamin_lin@aspeedtech.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OBwXojjBQYQ+P1cOwYGsARDngJ7VoU7xV13Xi9IVHUI4dGdmktzFNWxHHoA+imVWbuAUHVlQH1OS+Naw8e1/JvreNcU+BqyTQXEBf25UBVtC/bb2GoIcDkJCTJK2PiaLVQK/GqtW2SarUObUTW7MufFNKs8yaNJhFCyjwJCI4JxhqPVkEWoFcetXs/guVjx9xKAxAJVRy/CZJq4UOulHN+HczoCWnHjRPWqs5771JJbaYJLCf8ixnYrFYvsgWQv+ZvLH+LzqCxMobUGjb6dUpdKtv0/2YeAgsNDwJwnztQB16UyEtOXh3ljkAaQ0R+y0SgaAoFmcehbDQ4PrdrSKmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dbnCndIoAMKRumdIIaEme7nTX4S2jXhySeb7tyDD/RU=;
 b=TOD8qDGHzmuqK4vh40RSq8wuOPTh+4muXxVLAQ7iJao/C1wPuBuDAgzKgCwSiFmdbxmPaAduhX1LHOOc9clvEqfg9S7rXMUcKaNTWGsrcnCAts6gP9TfwjPr2eQFmxM5c+jPzhWf0Xy02rqZVnj+2x2y1zslr8t/5zMJSWoQAqWGSnGbJkSR9ew+XMA/UtwzMpAy64U33W31QkSyeEaQK+8I/yiB5TKqoeaDgD2HZzANeaDevFLikNLqpJwo0/7FKcD+o9b/PJIJAw/wa4yJBxSstQTY9ZDcATOxRaqgDmQ2+qM/eL6c7CmFZgLDTcbWnBdpVf0brTwk/9iRi/nmDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dbnCndIoAMKRumdIIaEme7nTX4S2jXhySeb7tyDD/RU=;
 b=GT5Cp8vWyrQdMcgmLeqXfnVWIsFlPnUWxIsJ6m3tmRore0aFq10GPzP38RI8isbGQy7GWGwpcL4SMEJi5e2i2T9KxfD4OHvM3DwFs/mKeKFQ0PcrJbPg4siWrqJcAwVBzf8E+dKY40UoN2zc7V0qQNgWskIg0Xrm0IsIoZeZAVOC1pWnQYFpncTD6gJHkWTyeJRqu2aIOa98mn8oD4Kvetrvc4W+Gr24n/jolp7jPA5ClPm0jbcC3ufG/KzLwueNnV2B1OfSwWfwA/Lrdl2/INngZPHGuKLunsm0zIqbHeX3Yy7cjoBk5TBRCQ3ptIWGUDGcg0H0HewQr/Co0AR9ag==
Received: from SI2PR06MB5041.apcprd06.prod.outlook.com (2603:1096:4:1a4::6) by
 SEYPR06MB6107.apcprd06.prod.outlook.com (2603:1096:101:c4::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7962.17; Fri, 13 Sep 2024 08:02:06 +0000
Received: from SI2PR06MB5041.apcprd06.prod.outlook.com
 ([fe80::705a:352a:7564:8e56]) by SI2PR06MB5041.apcprd06.prod.outlook.com
 ([fe80::705a:352a:7564:8e56%6]) with mapi id 15.20.7939.022; Fri, 13 Sep 2024
 08:02:06 +0000
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, "raj.khem@gmail.com"
	<raj.khem@gmail.com>, "richard.purdie@linuxfoundation.org"
	<richard.purdie@linuxfoundation.org>
CC: Troy Lee <troy_lee@aspeedtech.com>, Vince Chang
	<vince_chang@aspeedtech.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
	"jaminlin1207@gmail.com" <jaminlin1207@gmail.com>
Subject: [OE-Core] devtool: externalsrc exception after bitbake recipe which
 used multiple source repositories
Thread-Topic: [OE-Core] devtool: externalsrc exception after bitbake recipe
 which used multiple source repositories
Thread-Index: AdsFsi8qzXJzAuukT+Ol9RyHtp9s3w==
Date: Fri, 13 Sep 2024 08:02:06 +0000
Message-ID: 
 <SI2PR06MB50414087D6DE653B861B4530FC652@SI2PR06MB5041.apcprd06.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR06MB5041:EE_|SEYPR06MB6107:EE_
x-ms-office365-filtering-correlation-id: 79ca0586-28d3-48bc-f557-08dcd3ca5c52
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?sNQH72eKTdA+zPm3mqzp4kdcI3UA5CpJCLbYU9OKjckhKHVrZroJufBSrCjn?=
 =?us-ascii?Q?lShEoJl9JwCIwq4EkPiJiXDrWPE1vofCoBhmg1ryFJwwETFSJKAfwFhyN1bz?=
 =?us-ascii?Q?K7X6tIt+VjGHWxenqd7i3hjGgxnAh3g18vVDJEtnxFNNceamPBJ/Vej2C9Vn?=
 =?us-ascii?Q?VG8+9FSNn5b7EbxgV0NQdFw5PQWAuZ/FJe43ogC9nEdqb2xk6pRUY/1h9x9r?=
 =?us-ascii?Q?7BhibSWKFP2Co6pQyJZRCyqnYkOCvkHaIunZ/HEJJaIkGKkc6e+kPxluMx6P?=
 =?us-ascii?Q?xeeTSJPXG7ln1MDORffi4mhP/2NaR4fQjSGnTJZPyIVNekNFBv9zaY0Pn41+?=
 =?us-ascii?Q?FG0WkNNUgS7FSCZZjH0+nhWNbnsqMBuJPg7jgkimQzvQIE82XYvg2mXjezsl?=
 =?us-ascii?Q?7ARJJp0TDYeVaz78fWGkm2fFswpc89rq4SDrKTDv1DFUoE/UYO4uqRqYXGmg?=
 =?us-ascii?Q?G0r80vyAvQ2vWTYfXkAnwzJmoovQrPiCZgyxf4M6474873By+G6lstMBPBDc?=
 =?us-ascii?Q?pRTDHhD25sOfclCjl4dkcPdBT8bgpDNsREsFAlEMs3U4LtUQWI3ZaVGg4FWQ?=
 =?us-ascii?Q?EdN6NMHfkdRwtNH2BxNlhSOOMOEBK3f+6lkU2ua5jYmMcioSEKr36qC/vLbP?=
 =?us-ascii?Q?PMc6nQeWBxGi2ayTm0+CcIDP1TivC1ul/OoCuxK3qUrWfwk/N1m0afpkqz2v?=
 =?us-ascii?Q?f4JraJvIGbXo6J4Z9A1mwceuyqWXZIzDRoSw+jxAcivEouG6FlVm2PBmrOyZ?=
 =?us-ascii?Q?AbmKCRL1X5sXKYer9a/8IGMkq2h7rpVZStaEElP3rvekQDvrJ5j/+K3hfOWm?=
 =?us-ascii?Q?VYaAYxnGDpMfuIVpLbyieraQFIY+77LdmWBowa5tZcDAOHawh9m4011wKu8g?=
 =?us-ascii?Q?wP2lbg/33lq94YCi84E4VVZlebh2erXy+J524awvsaQbEAMtUcCJMQrjPwTX?=
 =?us-ascii?Q?ao5shnDpbsLNe4gcIasZUJktCkD9obZBEerZZVrFNUtirbikwnZrDFLeq9Aj?=
 =?us-ascii?Q?9jmEPaU4Y4XAllnY3aOKEK4Hqhf8kCaRc89yw0YB/YP9JsiyVVbDjOne4f/g?=
 =?us-ascii?Q?lYLQvYAj4jYC63KgzXkNkpk2PFUm2BY9ENlB3bwFzJVZjqhC87UK3Xz2a93Z?=
 =?us-ascii?Q?Sc1fNi/fWKyVwN26pOByEvyjT9cwpBMDelJ4iZaGOGbNsuWkUnLSs3p2rJHF?=
 =?us-ascii?Q?AC5SdHQ2xBPFtl95OFiNj94qctnst6obdi0cUBh9a+9Mak8dMiR9R0q1O46J?=
 =?us-ascii?Q?xgA4iwvS7JYWpD4543veScqe3c4RpoEODPXxNP916+7TPtshMIJuF7hHyCC3?=
 =?us-ascii?Q?UW9e8d5RI7umS6AVxANV6oyv1mjZKcF3AhakVsfVCoC1JA=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5041.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?Ai+w4fFzHcU9v5YAt+cG0WJmkgY9XQijZuKKJ3E22yEF8WkZB//r60/9Z7so?=
 =?us-ascii?Q?iRGZdz8qkAg+2zxeGKJ9wdD8g3MFz4rsJYhLRcVj8Kwpo7o5j5BRR1XhMqVe?=
 =?us-ascii?Q?0aNJY93e+boVSQqoF6k2SE2CqajAxUe0nJrNXugNVGSEdh1p+NVLXM1L2ERj?=
 =?us-ascii?Q?i4eGpyLZYGEmKNHCS95qeHVfB4k2hL/K9CCgL8zNvb+nxuUtzWBp+fUrJJUZ?=
 =?us-ascii?Q?s1zWICliXaTaYa7+EyDzoMwOzldUKiTYiOxMJl2O1ZqSu1PdQ1w7NI39APsi?=
 =?us-ascii?Q?kRjkyJbKCifK66LcfZ2fddAiaRthJhPU0zH+ImkY0JrqpurnN+uht6NTjQ+i?=
 =?us-ascii?Q?NHdcPMs7mfri958VmaZl22B1A3BrGAaIZly3gXSgcwc2jP9jwx3WiztTWuc3?=
 =?us-ascii?Q?uCVEUzV4AMyrusaiIB49303C9eoEFLJnCxzXzo+vlPZi/qC6kadSAVwj7Fab?=
 =?us-ascii?Q?p0/vG0i0T0Az9Y1ZlrXH4hFrRoFEkEeLOPQ7PzOzIsHZedXXFH0s0yrRMu16?=
 =?us-ascii?Q?FCKaGL9OVoymOmb+lfKgBHsi24aPmXYTT+XjIn1JMlqD4p+nIJNFvhpEARAD?=
 =?us-ascii?Q?iB6afIIKhYONkfaLw+qLXbopP5TFsjgcfU5OjtDUQFmvixTM7ucLpkUSFnqc?=
 =?us-ascii?Q?9Txv5Ga4DzRnZLmq3z/tarcgbcaPcglNDduq2/shwRIjJnUlxfMw+H8hHS5q?=
 =?us-ascii?Q?p71oHgs+HhNdW5ISCpudlv6S9yWJSOfHAjD9kKNt+GgT8gbq3NWy75ZE41ch?=
 =?us-ascii?Q?FEXuR9s8FDi4plynmnWEE0+K4Pwl7E/b5LZK8E1vWYYL7kJvq2BwsGtuNxiW?=
 =?us-ascii?Q?FCTiQ9xX+0RvuQyjQuv6en/WEvHSde0dPRBZ2jlQyGfoBbv7l26KnYo4n576?=
 =?us-ascii?Q?BTgOHboZRruZdoDjwPhRRLmYIzZgy98cYLaNa4S6/BFRfxmdLl0/I1HiIcHL?=
 =?us-ascii?Q?LVDYfooPDfDDEjhi8nVoExOtCpEeDnq7wTZBhfedcjiwcKKbUpbNY/gnv/S/?=
 =?us-ascii?Q?+GRibdiML1KztEr7b/wagS5qRezYu4mKxc/3c9vBTvTsa1lI8EkaQxHYnZ/2?=
 =?us-ascii?Q?+W5gKDdZ7P5skdfFoy8oEy4V18pg3Z0w3oteFj3zuIfDiggT+nA+e/ykalsU?=
 =?us-ascii?Q?/NteHTfcIrasBmNk6eQYHvgfbKNCWdn7WSaD7EMuuBdJpIFxk1RCSMZfJnhF?=
 =?us-ascii?Q?ds6Zohw6VxvdR+7xpr1c9/Q1vfKvtlxkKRGSli3USCKfz2Ul4rrpQzfQKa5t?=
 =?us-ascii?Q?N7n1sq+DbzVTEFD7KTPgb2PWUDB+GWdiBUINw8j/P9XSdghx0luOE3VmR42R?=
 =?us-ascii?Q?xaFQiINLIds0wJpcjrngfNyPgmccuAn034Q4m892tfby4JPavOiIVygS3KcB?=
 =?us-ascii?Q?EtTN7KXZC/NshlacqQ76VMqLWh5PkR2jy+7CTztM7m+sr6n/wf+AnGk6MUjC?=
 =?us-ascii?Q?w1c2gfS929zq/jDu3o2oUXR8PyTBGfKl5qUkmb0zhsEBlbPATB6eQbctRXLd?=
 =?us-ascii?Q?7kxw6mGdrhgLeHpPLPROCFJa2YH/8orOPSM3ao+Dig0+VKeRBDJN/xfKsZwI?=
 =?us-ascii?Q?oQj9Zr0vgPk8QcycT3hTq091qTQyySVvjJX6LwtO?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5041.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79ca0586-28d3-48bc-f557-08dcd3ca5c52
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2024 08:02:06.5382
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MbXvlPAgUV//OudPzvfr4KgxJD84hpr4Cm6jLOpJ3B5nePPQn48d75oeJ2+wA39fkbUBoPHnWFGr4eycgKTNvnt0/iI1qZIgfFjG0bFXjgw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6107
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Sep 2024 08:02:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112270

Hi community, richard and raj

I noticed devtool did not work if recipe used multiple source repositories =
and my description as following.
Do you have any suggestion about multiple source repositories with devtool =
support ?
Related bug here:=20
https://lists.yoctoproject.org/g/yocto/topic/rfc_devtool_support/102509834
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15294
It seems does not completely fix this issue.

Thanks-Jamin

How to reproduce it:

1.	git clone git://git.yoctoproject.org/poky
2.	git clone git://git.yoctoproject.org/meta-arm
3.	source poky/oe-init-build-env build
4.	edit build/conf/bblayers.conf: add "meta-arm/meta-arm-bsp", "meta-arm/me=
ta-arm-toolchain" and "meta-arm/meta-arm"
5.	edit build/conf/local.conf: set machine qemuarm
6.	devtool modify edk2-firmware  (The source files will be downloaded into =
build/workspace/sources/edk2-firmware directory)
7.	cd build/workspace/sources/edk2-firmware and issue "git add -A ." This c=
ommand is worked.

However, after I "bitbake -c cleanall edk2-firmware". Then, issued "git add=
 -A ."
I got the following errors:

```
error: object directory downloads/git2/github.com.tianocore.edk2-platforms.=
git/objects does not exist; check .git/objects/info/alternates
fatal: bad object HEAD
fatal: 'git status --porcelain=3D2' failed in submodule edk2-platfor
```

Then, I tried to issue "bitbake edk2-firmware" and got the exception in ext=
ernalsrc.bbclass in line 231

```
Traceback (most recent call last):
  File "Var <do_compile[file-checksums]>", line 1, in <module>
  File "/home/jamin_lin/debug-devtool/poky/meta/classes/externalsrc.bbclass=
", line 231, in srctree_hash_files(d=3D<bb.data_smart.DataSmart object at 0=
x7fe1314f37f0>, srcdir=3DNone):
                 env['GIT_INDEX_FILE'] =3D tmp_index.name
    >            subprocess.check_output(['git', 'add', '-A', '.'], cwd=3Ds=
_dir, env=3Denv)
                 git_sha1 =3D subprocess.check_output(['git', 'write-tree']=
, cwd=3Ds_dir, env=3Denv).decode("utf-8")
  File "/usr/lib/python3.8/subprocess.py", line 415, in check_output(timeou=
t=3DNone, *popenargs=3D(['git', 'add', '-A', '.'],), **kwargs=3D{'cwd': '/h=
ome/jamin_lin/debug-devtool/build/workspace/sources/edk2-firmware', 'env': =
{'SHELL': '/bin/bash', 'BB_ENV_PASSTHROUGH_ADDITIONS': 'ALL_PROXY BBPATH_EX=
TRA BB_LOGCONFIG BB_NO_NETWORK BB_NUMBER_THREADS BB_SETSCENE_ENFORCE BB_SRC=
REV_POLICY DISTRO FTPS_PROXY FTP_PROXY GIT_PROXY_COMMAND HTTPS_PROXY HTTP_P=
ROXY MACHINE NO_PROXY PARALLEL_MAKE SCREENDIR SDKMACHINE SOCKS5_PASSWD SOCK=
S5_USER SSH_AGENT_PID SSH_AUTH_SOCK STAMPS_DIR TCLIBC TCMODE all_proxy ftp_=
proxy ftps_proxy http_proxy https_proxy no_proxy ', 'PWD': '/home/jamin_lin=
/debug-devtool/build', 'LOGNAME': 'jamin_lin', 'HOME': '/home/jamin_lin', '=
BBPATH': '/home/jamin_lin/debug-devtool/build', 'USER': 'jamin_lin', 'PATH'=
: '/home/jamin_lin/debug-devtool/poky/scripts:/home/jamin_lin/debug-devtool=
/poky/bitbake/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/=
bin:/usr/games:/usr/local/games:/snap/bin', 'LC_ALL': 'en_US.UTF-8', 'GIT_I=
NDEX_FILE': '/tmp/oe-devtool-index4ahqvxre'}}):

    >    return run(*popenargs, stdout=3DPIPE, timeout=3Dtimeout, check=3DT=
rue,
                    **kwargs).stdout
  File "/usr/lib/python3.8/subprocess.py", line 516, in run(input=3DNone, c=
apture_output=3DFalse, timeout=3DNone, check=3DTrue, *popenargs=3D(['git', =
'add', '-A', '.'],), **kwargs=3D{'stdout': -1, 'cwd': '/home/jamin_lin/debu=
g-devtool/build/workspace/sources/edk2-firmware', 'env': {'SHELL': '/bin/ba=
sh', 'BB_ENV_PASSTHROUGH_ADDITIONS': 'ALL_PROXY BBPATH_EXTRA BB_LOGCONFIG B=
B_NO_NETWORK BB_NUMBER_THREADS BB_SETSCENE_ENFORCE BB_SRCREV_POLICY DISTRO =
FTPS_PROXY FTP_PROXY GIT_PROXY_COMMAND HTTPS_PROXY HTTP_PROXY MACHINE NO_PR=
OXY PARALLEL_MAKE SCREENDIR SDKMACHINE SOCKS5_PASSWD SOCKS5_USER SSH_AGENT_=
PID SSH_AUTH_SOCK STAMPS_DIR TCLIBC TCMODE all_proxy ftp_proxy ftps_proxy h=
ttp_proxy https_proxy no_proxy ', 'PWD': '/home/jamin_lin/debug-devtool/bui=
ld', 'LOGNAME': 'jamin_lin', 'HOME': '/home/jamin_lin', 'BBPATH': '/home/ja=
min_lin/debug-devtool/build', 'USER': 'jamin_lin', 'PATH': '/home/jamin_lin=
/debug-devtool/poky/scripts:/home/jamin_lin/debug-devtool/poky/bitbake/bin:=
/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/us=
r/local/games:/snap/bin', 'LC_ALL': 'en_US.UTF-8', 'GIT_INDEX_FILE': '/tmp/=
oe-devtool-index4ahqvxre'}}):
             if check and retcode:
    >            raise CalledProcessError(retcode, process.args,
                                          output=3Dstdout, stderr=3Dstderr)
bb.data_smart.ExpansionError: Failure expanding variable do_compile[file-ch=
ecksums], expression was ${@srctree_hash_files(d)} which triggered exceptio=
n CalledProcessError: Command '['git', 'add', '-A', '.']' returned non-zero=
 exit status 128.
The variable dependency chain for the failure is: do_compile[file-checksums=
]
```

I tried to add the following line to fix this exception but It is a workaro=
und because it cannot get the hash value and always do the fetch task.

try:
  subprocess.check_output(['git', 'add', '-A', '.'], cwd=3Ds_dir, env=3Denv=
)
except subprocess.CalledProcessError:
  pass


