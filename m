Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.129])
 by mx.groups.io with SMTP id smtpd.web08.5654.1627028817147083819
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jul 2021 01:26:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@leica-geosystems.com header.s=selector1 header.b=V9uhV6+k;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.7.129, mailfrom: massimo.toscanelli@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V9n17dNuz4MmypXTolanqAy7l8UykQ8PwmXNLwBoetmtcWLuOfyPcozFgkQMcUo73eJcqlWPmUnxIWhy9A2PeCoa+T++h+aGO+SQov5DRiFsViUIWgqmzGX2oDD8fdWRNnT1RY4l7cBTtYhF+Qw1amWWOTJToFAjBcF/RORytj/lke1awzuW9RAq06onKI+Yh39jtiF0HaZDhyRVHRNsSEOVK+NobRpYrrOB00CgDhlIZMjhNm8dBKFz//8+0g4Dfx7el/1eQDyqwTkvlWRt5UFC6LnuVNoal99stAh9JKHigWhipwnDVn5cBdzh+8acy/rmSHlA+BE0scGxyxZxYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qAICJn9oUkKmMo86ouiyMqfv77fXnRmUGfGjKSw3amY=;
 b=F2VVrmgd1Dj6VuEnrcPHkHVPQCsNqL8Bt5qOk3wvFTxVpsUEPk/e0DCxlvKw6vtupz4lFZ4aRsKDG0PDu7lUuBIy+OwoBDlMI0kaULILROyqnt6FUklwNVOi2k7dLOanZ+p05wdhZZ1Q70SoTj5mS/M7y6VU+SkfGtHSgg6Mjbi4piA55rIr6298ne4E7YDzy91itIpVliCF2dzKoNp2skjytvNHGfN+eEn7fmCAnaC8gOutAKrhlQ1LHWLfkUzXu21NuDtpHBJTLphp7IPFAzqnWx8BSfKASYxeLXneBcV/MQrwm/TEcCHSMGUuO3iCj1DiSm92H/y+Ud1N9Rcknw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=leica-geosystems.com; dmarc=pass action=none
 header.from=leica-geosystems.com; dkim=pass header.d=leica-geosystems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qAICJn9oUkKmMo86ouiyMqfv77fXnRmUGfGjKSw3amY=;
 b=V9uhV6+k8midMWMHZUOo/vmMMDbG7yVGl4/LKV6RVHPDgguhUd0fdsGG5AJU6U3toJzymAh2QifbaK9sFDkhHfAWUoj44pfm0CCi0HtlhaNvOtgPLAibbAIUA5Wgjv/XyeG0EI/xMnlrnNjmcNVFC1egbkfKO79qMy47G0c30eg=
Received: from AM6PR06MB5158.eurprd06.prod.outlook.com (2603:10a6:20b:68::13)
 by AM6PR06MB5159.eurprd06.prod.outlook.com (2603:10a6:20b:3c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.24; Fri, 23 Jul
 2021 08:26:54 +0000
Received: from AM6PR06MB5158.eurprd06.prod.outlook.com
 ([fe80::fc04:ecba:779d:8f9]) by AM6PR06MB5158.eurprd06.prod.outlook.com
 ([fe80::fc04:ecba:779d:8f9%3]) with mapi id 15.20.4352.025; Fri, 23 Jul 2021
 08:26:54 +0000
From: "massimo toscanelli" <massimo.toscanelli@leica-geosystems.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
CC: Khem Raj <raj.khem@gmail.com>
Subject: Re: [meta-oe,dunfell][PATCH] sysbench: fix memory test
Thread-Topic: [meta-oe,dunfell][PATCH] sysbench: fix memory test
Thread-Index: AQHXeM0cfg/5a6/ozEGyPLIEi29vN6tQRxSw
Date: Fri, 23 Jul 2021 08:26:54 +0000
Message-ID: 
 <AM6PR06MB5158DD115D8B575AD6260C34A0E59@AM6PR06MB5158.eurprd06.prod.outlook.com>
References: <20210714162656.20938-1-massimo.toscanelli@leica-geosystems.com>
In-Reply-To: <20210714162656.20938-1-massimo.toscanelli@leica-geosystems.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=leica-geosystems.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 04f10cd5-be83-45e6-bb7e-08d94db3a0ea
x-ms-traffictypediagnostic: AM6PR06MB5159:
x-microsoft-antispam-prvs: 
 <AM6PR06MB5159FB6ACB0F84FA24525CB2A0E59@AM6PR06MB5159.eurprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:326;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 cquV3ErOzKpRn4S49EkybIns6PhEl2zSsPorcPDOgtsWPcCWysZAHxAvXf4km1tUCAS1uuoDJArmBajBpa4ZWKsSndSZn7/nEUOzJvXYxUMRnYpIOk35pHMo4cZ3dHPKJpGTQjHdgIRSjRTIFTS/1mahDTlxQhSdD8+Io1ZHx7lhBYvYhfAoR+7Rdc0eB+KqDVPvnL7DZRW6jDZog/ZIGalG9orJhFX8TOOO134i4mwtduOEfnkaa9sIUWQm622tgubuCa1x63+h8yOF39l4ye0zx9uzIj2XFfDa2ujAF3ATgCXUtxld7O8gd4iOHpPLNL9czB8Eex5ZoBk2cCSISa/gWPs+TKerr/NgDeRUJSWPwp9q24hkzvpYyvy2TqELbaEzbHK32G326uDECKRNfEmZmBCkSPR8fcJ17oOnayKM+z7HXPs0XuTMkSvtJBjJULCtt/RBNydWyRT/eNOoaw9aRDsf/cIB5F95Ybo5DKKPhiFixHx7svHeZuTmjPhlC29rhUbh8g6KioITpeE8sZHO0y2fZiiPhH2b1z8YAafl5A8ETyxPZlgjFgpU94YL5fy6cN7UIRr0neAdrLtpFhrxxYz+TT5Ky8QiEqfEu+IE2e8Xzg6Ismul54J/vXXMuBvdZDXwBl4IPC6lvQ3OzO6OUEGq2Yh6NLzizoBn1Tk+yMEvRBq3hHRoflmMvpfWGt50K8X/QNK/bZ8s5ls8jxtjwMumqH8cadCMFyaZfoqd7oz/TUkB6RG19KjSXCkqjgIsQwxRGkM+GFWAgmdjEFPO4PTH/jxuxXDpvgoxMrZihYGPTyTo90low9rCrGyjMINMcvZbcUxDpYMCzpAWDA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR06MB5158.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(136003)(396003)(346002)(376002)(366004)(55016002)(2906002)(66446008)(7696005)(9686003)(478600001)(64756008)(66476007)(66946007)(71200400001)(66556008)(52536014)(5660300002)(186003)(76116006)(33656002)(83380400001)(38100700002)(6916009)(6506007)(8936002)(8676002)(26005)(45080400002)(122000001)(4326008)(86362001)(316002)(53546011)(38070700004);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?plDCpW35ikTmWQpYq5DNtupHj6SFwyYJDVsDs9lzFLYaJPd7b5h50fabf3jG?=
 =?us-ascii?Q?B93Zwp6fR78C9zShltgDyhwB51Y1bhFzDkHgqPsPp5knhIfQ0ZbgQyx236Wl?=
 =?us-ascii?Q?38YY/T6feDk4dKUw88J6rS3KJ8aEZf/q673qBP7clZchUphcr0++nM/dE3RV?=
 =?us-ascii?Q?J5EyRp2dtg4IA54DPvyStplfa4eKg6EME0sZt7t0SCiEnFbnTyEFORcCp6Hx?=
 =?us-ascii?Q?st1pZIoiJw3PDVabNU2xU0qLAeAI90oOZJG9uev4qyR1n6MdrNo2cXBASEc0?=
 =?us-ascii?Q?FtlKzcMmxxPD8jeCWhZ3up2MnWPZ1JJ3sce96RF0dog2PA5lybeEeEvtik8W?=
 =?us-ascii?Q?9qd9JKPE1kCVIiktzUlJ9+jsWvH2zc9xr3Wqp7n9RajuLG8TnkdOctgqUSGS?=
 =?us-ascii?Q?q1T95jUnLe8Gj93a54THSKs/J2PsUSPKnuf6HUStx4fYXLyRYp8VJm+x4QCS?=
 =?us-ascii?Q?QH6mcy+O3dGN2GGZFCxOt9RsFrLbHcBoFb8w7WWye0ZyJDlInOWBJTkRdcWS?=
 =?us-ascii?Q?HKu2M2s+B8Cba/DhS7mUKtjGgmtyS8r/M/EuevZ8UHcymjlso1fgAjK5l6aF?=
 =?us-ascii?Q?wPA8STkyaC0oyvGtt5TvIUqspk8hOgXFgAQlSf4zL5CnY8ha0LuxHYn4sGfC?=
 =?us-ascii?Q?tMABkfjrVdGj6VXkch8iYd5KtLkDImAZ5WD1cQZ7GzZYT4ofEnIuYF57I95j?=
 =?us-ascii?Q?Ysynoj43BLGX5/tia3lMgmgXHNgOPDTTKzvC/0Ru1vSe3t+8CT7jS4ATT+Yi?=
 =?us-ascii?Q?+2eAuXwnd+Pj2aejEMf/COdoS1yL0CaiQ/BOA8eiD+RDVvHfadzoYfS+mH8y?=
 =?us-ascii?Q?A6Pfcuyp5sD17rrH3ql7lPgGtfMH6dC3ueNFMN0m3iv+Ai15w61nZ7kdQu8h?=
 =?us-ascii?Q?HfDJ+VzslM12U1aAljVmH7Q5ea8FuQ7qMAILdyOXbaKwSugfN0mow7Bxqwaw?=
 =?us-ascii?Q?yihEdo9RpsxyKhWDZe3hVWa4IPA3GMxetg6hRVpqydiX0tITg9vPdpnWRx+Y?=
 =?us-ascii?Q?76iAQwnsv+iWG2fstniiBoZ89uI7fphbj3r1a04IWPspLuSfsjKocCy1QVos?=
 =?us-ascii?Q?ZxOmYRt2lgjmm7qUNJNToalTeFxElkuPtRF0gFLzKEDrBIOW8h3ODTt3+sQ7?=
 =?us-ascii?Q?f00Ea5xwDVCbFkhgaKopi6hjcvKFFiAe6Iehb16OEYdVWiJzVH6OXlcI2ckA?=
 =?us-ascii?Q?meLW8Rcu6Od9/X39U8WIGI8DkYmH5h71L6Xwg2LxTbSjf3oOqzyVjrOihy7N?=
 =?us-ascii?Q?iuiDohSFEwvUFcKvw2NQfEIo6RJ0so8XajK7993d8Epw76VmKKzxsMV5fTEl?=
 =?us-ascii?Q?AeY=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR06MB5158.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04f10cd5-be83-45e6-bb7e-08d94db3a0ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2021 08:26:54.3248
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ex8kMg6E6KxQctwkDEFuLSr9j4HP86udfMw2CQdsgmC01Ot0jut8kNW++aLOYOHKe7WPYqUvvaqYnCf1J7wvvZpEgFGMSfZxyAgYgUUO+ncZ+WqxvyrFU1Pfch8BwYyw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR06MB5159
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

any update?

-----Original Message-----
From: massimo toscanelli <massimo.toscanelli@leica-geosystems.com>=20
Sent: 14 July 2021 18:27
To: openembedded-devel@lists.openembedded.org
Cc: TOSCANELLI Massimo <massimo.toscanelli@leica-geosystems.com>; Khem Raj =
<raj.khem@gmail.com>
Subject: [meta-oe,dunfell][PATCH] sysbench: fix memory test

In sysbench version 0.4, the tmp variable used by the memory test to execut=
e requests is optimized by the compiler. Caching mechanism reduces the dire=
ct accesses to the memory increasing the transfer speed. This leads to fals=
e timing estimations that considerably affect read and also random write op=
erations.

In sysbench version 1, this issue is fixed adding the volatile modifier to =
the tmp variable. This prevents compiler optimizations forcing a direct acc=
ess to the memory.

The final result is a realistic transfer speed measurement.

Signed-off-by: massimo toscanelli <massimo.toscanelli@leica-geosystems.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>

(cherry picked from commit 59cce5ad1603c2975684ae15b639e0e3cd688c40)
Signed-off-by: massimo toscanelli <massimo.toscanelli@leica-geosystems.com>
---
 ...modifier-to-tmp-variable-in-memory-t.patch | 40 +++++++++++++++++++
 .../sysbench/sysbench_0.4.12.bb               |  4 +-
 2 files changed, 43 insertions(+), 1 deletion(-)  create mode 100644 meta-=
oe/recipes-benchmark/sysbench/sysbench/0001-Adding-volatile-modifier-to-tmp=
-variable-in-memory-t.patch

diff --git a/meta-oe/recipes-benchmark/sysbench/sysbench/0001-Adding-volati=
le-modifier-to-tmp-variable-in-memory-t.patch b/meta-oe/recipes-benchmark/s=
ysbench/sysbench/0001-Adding-volatile-modifier-to-tmp-variable-in-memory-t.=
patch
new file mode 100644
index 000000000..d628e81b5
--- /dev/null
+++ b/meta-oe/recipes-benchmark/sysbench/sysbench/0001-Adding-volatile-m
+++ odifier-to-tmp-variable-in-memory-t.patch
@@ -0,0 +1,40 @@
+From c1ebf893e32a0a77e820484d48a903523fef7c1b Mon Sep 17 00:00:00 2001
+From: Vasily Tarasov <tarasov@vasily.name>
+Date: Fri, 10 Jun 2016 14:33:48 -0400
+Subject: [PATCH] Adding volatile modifier to tmp variable in memory=20
+test
+
+Issue explanation:
+
+./sysbench/sysbench --test=3Dmemory --num-threads=3D16 \
+		    --memory-block-size=3D268435456 \
+		    --memory-total-size=3D137438953472 \
+		    --memory-oper=3Dread \
+		    --memory-access-mode=3Dseq \
+		    --memory-scope=3Dlocal run
+
+Without this commit the time to run the above command is 0.0004 seconds.
+With this commit the time is greater than 3 seconds.  Essentially,=20
+without the volatile modifier, the compiler optimizes read access so=20
+that no real access happens.
+
+Upstream-Status: Backport [part of v1.0.0=20
+https://eur02.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithu
+b.com%2Fakopytov%2Fsysbench%2Fcommit%2F8753cb93be4c0b81a20b704ced91e7a4
+22da52b1&amp;data=3D04%7C01%7C%7C313329a480e84fd7b72c08d946e43eb0%7C1b16a
+b3eb8f64fe39f3e2db7fe549f6a%7C0%7C0%7C637618768380002742%7CUnknown%7CTW
+FpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6M
+n0%3D%7C1000&amp;sdata=3D%2FIgZtBTkbsCsRueM5s0oa%2BpTob7X%2FShLXlm9gtGTj%
+2BM%3D&amp;reserved=3D0]
+
+(cherry picked from commit 8753cb93be4c0b81a20b704ced91e7a422da52b1)
+Signed-off-by: massimo toscanelli=20
+<massimo.toscanelli@leica-geosystems.com>
+---
+ sysbench/tests/memory/sb_memory.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/sysbench/tests/memory/sb_memory.c=20
+b/sysbench/tests/memory/sb_memory.c
+index 2e8998f..7d22bb9 100644
+--- a/sysbench/tests/memory/sb_memory.c
++++ b/sysbench/tests/memory/sb_memory.c
+@@ -244,7 +244,7 @@ sb_request_t memory_get_request(int tid)  int=20
+memory_execute_request(sb_request_t *sb_req, int thread_id)  {
+   sb_mem_request_t    *mem_req =3D &sb_req->u.mem_request;
+-  int                 tmp =3D 0;
++  volatile int        tmp =3D 0;
+   int                 idx;=20
+   int                 *buf, *end;
+   log_msg_t           msg;
diff --git a/meta-oe/recipes-benchmark/sysbench/sysbench_0.4.12.bb b/meta-o=
e/recipes-benchmark/sysbench/sysbench_0.4.12.bb
index 708c71f4f..d1725dddd 100644
--- a/meta-oe/recipes-benchmark/sysbench/sysbench_0.4.12.bb
+++ b/meta-oe/recipes-benchmark/sysbench/sysbench_0.4.12.bb
@@ -8,7 +8,9 @@ inherit autotools
=20
 # The project has moved from Sourceforge to Launchpad, to Github. Use the =
source tarball from  # Launchpad until the next release is available from G=
ithub.
-SRC_URI =3D "https://eur02.safelinks.protection.outlook.com/?url=3Dhttps%3=
A%2F%2Flaunchpad.net%2Fubuntu%2F%2Barchive%2Fprimary%2F%2Bfiles%2F%24&amp;d=
ata=3D04%7C01%7C%7C313329a480e84fd7b72c08d946e43eb0%7C1b16ab3eb8f64fe39f3e2=
db7fe549f6a%7C0%7C0%7C637618768380002742%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC=
4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=
=3DC2opVas%2BXGw7WRR1b5VrKye%2FO5UNvAJj4hmgqGXZWvU%3D&amp;reserved=3D0{BPN}=
_${PV}.orig.tar.gz"
+SRC_URI =3D "https://eur02.safelinks.protection.outlook.com/?url=3Dhttps%3=
A%2F%2Flaunchpad.net%2Fubuntu%2F%2Barchive%2Fprimary%2F%2Bfiles%2F%24&amp;d=
ata=3D04%7C01%7C%7C313329a480e84fd7b72c08d946e43eb0%7C1b16ab3eb8f64fe39f3e2=
db7fe549f6a%7C0%7C0%7C637618768380002742%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC=
4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=
=3DC2opVas%2BXGw7WRR1b5VrKye%2FO5UNvAJj4hmgqGXZWvU%3D&amp;reserved=3D0{BPN}=
_${PV}.orig.tar.gz \
+           file://0001-Adding-volatile-modifier-to-tmp-variable-in-memory-=
t.patch \
+           "
=20
 SRC_URI[md5sum] =3D "3a6d54fdd3fe002328e4458206392b9d"
 SRC_URI[sha256sum] =3D "83fa7464193e012c91254e595a89894d8e35b4a38324b52a59=
74777e3823ea9e"
--
2.17.1

