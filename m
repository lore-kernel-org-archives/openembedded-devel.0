Return-Path: <prvs=78402dcf4=Alistair.Francis@wdc.com>
X-Greylist: delayed 384 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 10 Sep 2018 23:06:40 UTC
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	by mail.openembedded.org (Postfix) with ESMTP id 455E7797A1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Sep 2018 23:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1536620820; x=1568156820;
	h=from:to:cc:subject:date:message-id:mime-version;
	bh=CTlIsriMF7Z40M5768JqePxj9HEoqsDhNCsJcb11+FU=;
	b=FqDzPj6TkLdzH7U6y81KfHYLCoDgTjVvkHSdiqL40v/8Iw0pFAEPbjan
	T73P5IEgZU+TYqzLRS4WIljZVOiBh9cdWq0ynNhrrQavzkHuRV2MS63Uh
	JUk+rEY5/Adru7K40sIqS8NWfvEdvOHd0DcHZ97D9XtXPPiRS9lh8GmVB
	FFDUP/QVd6sLZ4loA5AiCs9bHyL31/6tkk8zB43Rpvi3NqES51cBJgm/S
	CQBwYZ1AgEjFauG27Xzkj1cDILrmrlxDes3LPzRQtDp2C6F1wCiTQPTqd
	qcQKK7guVYopdtBpK8pBRUl4U2S0j13DylRsQiibVK8DTAOg/uQ9kvsvm Q==;
X-IronPort-AV: E=Sophos;i="5.53,357,1531756800"; d="scan'208";a="186998874"
Received: from mail-cys01nam02lp0048.outbound.protection.outlook.com (HELO
	NAM02-CY1-obe.outbound.protection.outlook.com) ([207.46.163.48])
	by ob1.hgst.iphmx.com with ESMTP; 11 Sep 2018 07:00:28 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=XlanRVs3rWG3C15SPpr7+zzItqB/x/f8aloTv0qPaTk=;
	b=h64VMAPJjmj/oDoA0BFGTnrBMSuQVljxU7gGyuZWciU7VNfa8OaWJc/7KH5sGHO9iO7pQH8MEd2dK/QAi9JLRogjYSWyEDiO1EDQT+l04FxApEG3zk+iyisyt4o00QxerkE7wvZ/d+KZxgUEbZn4Xc4ylzSolnkHCUE9UMQm3Uw=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
Received: from risc6-mainframe.int.fusionio.com (199.255.44.171) by
	CY4PR04MB0392.namprd04.prod.outlook.com (2603:10b6:903:b1::17) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1122.15; Mon, 10 Sep 2018 23:00:14 +0000
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 10 Sep 2018 16:00:04 -0700
Message-Id: <20180910230004.12843-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [199.255.44.171]
X-ClientProxiedBy: BYAPR03CA0036.namprd03.prod.outlook.com
	(2603:10b6:a02:a8::49) To CY4PR04MB0392.namprd04.prod.outlook.com
	(2603:10b6:903:b1::17)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d9ab269a-05dd-44f7-ca3f-08d617712bad
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989137)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:CY4PR04MB0392; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR04MB0392;
	3:KbBBxQQ3J4Hzsy3d3X/SUqhXIRo6HLNsf/m0yGFJqQIf8/GxEFF2OhgaBCYJmKYyComd9uZLniOJl2jnXBwnSmdtJQxurxkYaakB7qPa9yO6YZ72yktx7b+VtQet5mdddAZE1YQ1jZTNrkp58oW8XCveqrNljiFyWblI/zWthIvdRw8Nj6QbPU1JN/yX522MtYEgehJGKeHMl9MtNaAEPin/qjwFEoOC7+XR3YgEqLBgrxJ3pzcieyTyFKIOmFl1;
	25:t341H3bAyM/9TfnmZ6ejoeBdO56kJ4Q0bngl90gNQ5Bfyo9yjbYgxV2vx8nsYJ8C+n4LPsjwbr7YS6jjyJ0SK60jVca2riTr4D7EDVQaxsIui0VuVV8eaCN4afYFXNPC01M4SwcxkR6pZJjHfa5Xc+qnm2oGNu7m8hJ61p2xmJvfdna8cod6d0EJYP6zgIXWslVQG4wSfPKQZQUwWKH7exbQY/E9d0Y5odVexfs6DgxHoBhOkDNqS+cQJtLgTE9AUH5bqyREdOssKZblTEx0fFx2UnzKtomSCaCGtCRKMNbUiGzl3OyHoyT71ZvjIGKHkKflkizlWI+DO39ILZNatg==;
	31:wWBwVl0zAKOtGAz4WPGN9V4i4jarqZKDeNnUJClRfeLPTgO8z9avXYz11QlGJg0gVZYUNxqO86xBXSD4jfDIWI+mXnM94qy9uJuRiEcnmXdrc/CTGW0flUTfYpQCEPoBp+83basQWMkX6fAup21nf+VifLEDoIiIJ2p4TGgiVdJ+Nz01ZzPZi/bBThtNJx50qcrBRZWqyQppGb93hnAnJb67Y7ps3t50GwLNwkDkeio=
X-MS-TrafficTypeDiagnostic: CY4PR04MB0392:
WDCIPOUTBOUND: EOP-TRUE
X-Microsoft-Exchange-Diagnostics: 1; CY4PR04MB0392;
	20:Hqdzf0TU9EIIIFciuSRs/zmAKWsFb7ph6h4z0xg9vX2fmw0KicXomuHr57S98jGBFMCAn4wqysB5QHTVUV9zD5/1/Wv//ETEgSFLJ8kK50QbTM0UTmnH9+rbzB56A8xZo/ebIr0wHrVwiVy0KrCP9k/Sq9MxXUs5LzScF0BoRobxbzpaeNuQgZHPgut78fyUKFhbZXYBdj3lH/vP+KUlv1CVcSgOBfHXegsoY4SJCEMlC7hGb2L2GYUVUaFyDDBW+xut94poQIFj6TYFBVpW/ofXJwZiluQEXVgphlQ57D5Oji5R9J4LR3GPcPPQIpTnCgoG+gxOJFK0aXkVJdCtmpX+jJmWjFKu8v3zgRbj3H2uEfucOZjk9K4HsLXojN6KAH7rQd+wg1wuSQvNxAXwpe8V/uT8WO8LYOhsRMvqYAgR+f2spNCRtEj79nsJkHolZ9VKOK6BJQ5JTVJ9YhAkTScmMAHZxg8a2g8x6MwtH0Z9C8FIJ/jm0qRkC0L30ng0;
	4:3guZNbt0Mnutin+jsUEpgHbdl051VruoT5wsiJ6zgQ42q/w6PLjkMSsqliLXopfcdE8SFVBAkmlJsDkSZnGv/8Fa0lZYxJlxNSyxB71FrQg42CFu662xsGDUGeE2lJaXrgZGVLVgN8IDAevvkgRV/PN+eSioHVC9thmzadxBHOuPun9Cq2AIc93yBfWsOJh/O5l52cg2qJQ4k4ho+jTLOFaupaR0RbdFlbCDXkQaHoOyZT0DewLro4tUnKB3taWmhOcyfPEcb8WfmNbLsOUpkmXe9qpgdVbs39ziM27EB1aLNoI29B1xoE0foiJ/owdV
X-Microsoft-Antispam-PRVS: <CY4PR04MB03922B403D9DCD41874BA38B90050@CY4PR04MB0392.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(166708455590820);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3002001)(10201501046)(3231311)(944501410)(52105095)(93006095)(93001095)(6055026)(149027)(150027)(6041310)(20161123564045)(20161123562045)(20161123558120)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699050);
	SRVR:CY4PR04MB0392; BCL:0; PCL:0; RULEID:; SRVR:CY4PR04MB0392; 
X-Forefront-PRVS: 07915F544A
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(136003)(39860400002)(346002)(396003)(376002)(366004)(189003)(199004)(50226002)(47776003)(16526019)(68736007)(6916009)(1076002)(53386004)(6306002)(6512007)(86362001)(97736004)(575784001)(16586007)(3846002)(8936002)(66066001)(19627235002)(44832011)(14444005)(8676002)(6666003)(25786009)(6486002)(316002)(6116002)(4326008)(476003)(39060400002)(2906002)(486006)(5660300001)(956004)(186003)(36756003)(2616005)(53936002)(2351001)(7736002)(105586002)(305945005)(26005)(2361001)(51416003)(45954006)(386003)(81156014)(106356001)(72206003)(81166006)(6506007)(52116002)(50466002)(478600001)(48376002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR04MB0392;
	H:risc6-mainframe.int.fusionio.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; MX:1; A:1; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR04MB0392;
	23:p54k9ycDSFcumyr59CIY/MgIQpilRKoObI1F0k6+q?=
	=?us-ascii?Q?1CV7IZOzMdc/patBQeHmXGC/gz2pZ5mbwKNcax6ROH+ulvCZH41BdpqEMjo9?=
	=?us-ascii?Q?BRPuKjnMnCg7ABC2ypBzErGEEfwm93vATD2EKno/iw17jA14f+0mewLQLGis?=
	=?us-ascii?Q?YE3CQbRDWUGx21V1CIku77Ym2jj/bacXihBPHhlvT3bb99XBCNmAyeuyLzSi?=
	=?us-ascii?Q?olwA3es6s98UctbCkH+qBnlblIOPtseYF1HExzkS3oh/XpOcQQj/fj0GptAJ?=
	=?us-ascii?Q?jLCwblWQJh6T6tof1f0cnaGm2BLNkH1iMCFpltYnvJUGONmKw8eVW/crgjUJ?=
	=?us-ascii?Q?4k579YfPWhlQCtpZhINV4PSXTGCDvgkAkXWB4xKJcJsLTAFU0apjY+BxeOzm?=
	=?us-ascii?Q?b+ETl1YSU9hV+5Ed/wdxMziyWXm7wJQVWgLeryKEX6B6Ft9ltbgPcOzYfMar?=
	=?us-ascii?Q?pVHK2ZRHNz0dI8Uh1CoD5PQ3JuI0iX2tjZAEZ+Znrwqx0MCdh6H3Gan8FUam?=
	=?us-ascii?Q?cRcmGsBOr/MYVNvrem9FqN0Jm2JICxcSSzgzbufgh4rPkmCs4AUN19sX18ok?=
	=?us-ascii?Q?Ll22VoN0rzE/dv+7LNZMGrEnfEU5ynePict256w0TazVQdczwRDOdvmeZJp/?=
	=?us-ascii?Q?CtZOWDNx/YXS7vrgJPtJDyTHFSsNBYCWS3IpO8QojIJ1H33Ug68n5RTMPfuT?=
	=?us-ascii?Q?BO755ZE7o6EBVMiqU2p9UZE5hom/fgOdV57ANBAXjhXDcgNjxEn+63lAIUM2?=
	=?us-ascii?Q?XLDENcE9Nry+P2e5dxfWo7W/4sWF5olR27YH99HwdAJJbZUVC9xqx2G/L5NI?=
	=?us-ascii?Q?x6gMRf74KaNxTe27VBXbsjgz5fXfhnpg9M+XlfhFtv3HnNYrCDDWZ7Od/xry?=
	=?us-ascii?Q?YdDU/XnCVcxsY4n3XDCdSxopZUVTjo6oKtFfm/yliHdEm7OJiSOsInf90UoC?=
	=?us-ascii?Q?fn889R4vsYWAeP0u9mUpy5ZNAp6f5Wu9AfkHZ3bPktfKH9wU87TJJWI33yzZ?=
	=?us-ascii?Q?7etbNrMCYR2tH8IlNqch061LNWoSBQkKK+2sZPA59l7mNzQBziZQtX5ez2om?=
	=?us-ascii?Q?tuU6FEKUf3jz14QUHd+3Rw/raxJCr4U8EEKaUjCn8PRBJW+ZmllEirJbiNrP?=
	=?us-ascii?Q?Fypqfb+ClUluGFNfmIv5I9SQO92tvqVDYDpIXF6iXO9IrsKnuL4zItDsvcZE?=
	=?us-ascii?Q?0C6P3l3Vof3toc/LCbe9Yv8kvW9J7r9lB7b5pVAqdEkQnF3U2Y7SBOIWvcH4?=
	=?us-ascii?Q?LoktI6UGO7cNvof+/Z44JoDN1M+gMc7T6G7RADjqRhOqbQMK1nnprG5jRI5d?=
	=?us-ascii?Q?u0hYR7cL6n0HibD2vexWf5W1+2dqlMta0fyVJ0/59rjLD1lLhiEB52oZPyWU?=
	=?us-ascii?Q?etGTrwS84d/NaCXqdk/508yuH4=3D?=
X-Microsoft-Antispam-Message-Info: WqSEqCp6XS3++q1KV2fDmgWSv3b9IdaLs/QXtjVEfPWJrcAegBvcveE11C46Ixb2PiZ8k3ruMOmURY07qqL0SPGNNLO5SWic6dX13GBuXowwojKSfoUeaVcQzsnmQp38fPXfKhZPZQ4CK+8+z3aE5qFgvNyoFWNYqlbhgMYEU8ZJ6i1A8FWpK9I/wrhalU8Cw/ejtkl+k6bK+PgVdXOlabd0VSGM4b3MjYuz+T6fHYwgtcVTJepYTAhRNDwyQSVH3dBlmjsG/D+If51BV0lQ/p9puRmzraIOsYtNOdTiABGYGfYDaCWCSUf05Ny2HcU4mGkXsf/4ctzDlGKN7N8yuGEinAnD8E5jRX+fmCl9xkQ=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR04MB0392;
	6:mPowWAlE/Rb+tKMQ8w67+/AnO2pcofkosXjvxnFhIbEI0BV7CiI8TkCWm3h1m8Kqv2Q5IeCAfqXvNnhBbKFl2H1k3xGh1CUF/UXXbYVtZp/KNl6Rqozfj35P6QO0D9W4wrSGkYI3b+vmtW4jrak7iXZnvDOMC0/HuTohTeyZV/iRYmLb7sLZ3pTzDHfcPrzjH1/nCd7Jh7Bi6pHCtb/CAxiMYC9aXe2XGOEQTRK9omFvaId8II/n8bUxctA1rWBPiiN2GZbI5yYwIjK95k/2VehxOBhyRhS5qItyYHfAiiFxfN2nUVmPNs7kGQqHUdbdZF10JUl2AS8lBtStvfBYHE9CtZHe30u2AhZCw/k2VqLy6GZGVA+7uM5hiz+2CzkCaCEkPNWlnjDpAnZ2tb3Rf9fjK+NrJ/PTddz2Q8BtwmXszvmcvep3mOrLbTpUmPg+pU1zqjEFIcUvOBp4uNQFWQ==;
	5:o7vhpOmBeW8y3o8bxYh1nvtK0loUU1oCNIopMmfqnjqsRigDltnyuwKgpAei3hIClkOrt0khzG25s5bG6YSB7sI4Xl9S7c3zmlAJDSNJZQtLUUGElVqRzFVgaWC0UqGGyhcoQNt6J3oDnb2eiXAHuETTO9f88k4RftGP3lqqr4c=;
	7:tn+mD2Llft7bz2vnNllaFuzyG1jBpbdplIEjNqELm3UJHfyDIvcDilKQGp7O5DC5D9i8rmKpVP4gfmJOwpr9Ow+Rz/sk6vQNco3jsEsIqI6GHB2iGSFwkzabq60YByrSqDyeH6NmSdpHpXcj6n7zTu8n9tK3mf1q4b9c94Tzbjp2ZCY9pZ1HTK7K2t5VI7XMK/IWVlxerElbvU4FG8D7tYuIgDll6Z3JwnrT+NSywPy7t2uhPpwFSd7Qwne+O6WB
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2018 23:00:14.7714 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9ab269a-05dd-44f7-ca3f-08d617712bad
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB0392
Subject: [PATCH v4] pmdk: Initial commit of the PMDK SDK
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 10 Sep 2018 23:06:40 -0000
Content-Type: text/plain

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
v4:
 - Update to 1.4.2
 - Fix musl build failure
v3:
 - Add missing patch file
 - Use SELECTED_OPTIMIZATION
v2:
 - Fix fortify source compile error

 ...c.cfg-Specify-the-host-when-building.patch | 29 +++++++++
 ...0002-Makefile-Don-t-install-the-docs.patch | 26 ++++++++
 ...03-Makefile-Don-t-build-the-examples.patch | 34 +++++++++++
 ...y-implement-secure_getenv-if-require.patch | 30 +++++++++
 ...ol-Remove-unused-__USE_UNIX98-define.patch | 30 +++++++++
 ...inc-Allow-extra-libs-to-be-specified.patch | 29 +++++++++
 meta-oe/recipes-extended/pmdk/pmdk_1.4.2.bb   | 61 +++++++++++++++++++
 7 files changed, 239 insertions(+)
 create mode 100644 meta-oe/recipes-extended/pmdk/files/0001-jemalloc-jemalloc.cfg-Specify-the-host-when-building.patch
 create mode 100644 meta-oe/recipes-extended/pmdk/files/0002-Makefile-Don-t-install-the-docs.patch
 create mode 100644 meta-oe/recipes-extended/pmdk/files/0003-Makefile-Don-t-build-the-examples.patch
 create mode 100644 meta-oe/recipes-extended/pmdk/files/0004-os_posix-Manually-implement-secure_getenv-if-require.patch
 create mode 100644 meta-oe/recipes-extended/pmdk/files/0005-pmempool-Remove-unused-__USE_UNIX98-define.patch
 create mode 100644 meta-oe/recipes-extended/pmdk/files/0006-Makefile.inc-Allow-extra-libs-to-be-specified.patch
 create mode 100644 meta-oe/recipes-extended/pmdk/pmdk_1.4.2.bb

diff --git a/meta-oe/recipes-extended/pmdk/files/0001-jemalloc-jemalloc.cfg-Specify-the-host-when-building.patch b/meta-oe/recipes-extended/pmdk/files/0001-jemalloc-jemalloc.cfg-Specify-the-host-when-building.patch
new file mode 100644
index 000000000..747538b0c
--- /dev/null
+++ b/meta-oe/recipes-extended/pmdk/files/0001-jemalloc-jemalloc.cfg-Specify-the-host-when-building.patch
@@ -0,0 +1,29 @@
+From 2a22dc96c3bbb5c9bbcc008f58d4f5c64e3d19e6 Mon Sep 17 00:00:00 2001
+From: Alistair Francis <alistair.francis@wdc.com>
+Date: Mon, 23 Jul 2018 11:23:39 -0700
+Subject: [PATCH] jemalloc/jemalloc.cfg: Specify the host when building
+ jemalloc
+
+To avoid this error:
+    configure: error: cannot run C compiled programs.
+    If you meant to cross compile, use `--host'.
+when cross compiling specify the host when configuring jemalloc.
+
+Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
+Upstream-Status: Inappropriate [configuration]
+---
+ src/jemalloc/jemalloc.cfg | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/jemalloc/jemalloc.cfg b/src/jemalloc/jemalloc.cfg
+index 196129de6..79ebbab1c 100644
+--- a/src/jemalloc/jemalloc.cfg
++++ b/src/jemalloc/jemalloc.cfg
+@@ -3,3 +3,4 @@
+ --with-private-namespace=je_vmem_
+ --disable-xmalloc
+ --disable-munmap
++--host=${HOST_SYS}
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-extended/pmdk/files/0002-Makefile-Don-t-install-the-docs.patch b/meta-oe/recipes-extended/pmdk/files/0002-Makefile-Don-t-install-the-docs.patch
new file mode 100644
index 000000000..bd1b97c24
--- /dev/null
+++ b/meta-oe/recipes-extended/pmdk/files/0002-Makefile-Don-t-install-the-docs.patch
@@ -0,0 +1,26 @@
+From 460a96e390cb80278784cfe36629e280fe7ffef7 Mon Sep 17 00:00:00 2001
+From: Alistair Francis <alistair.francis@wdc.com>
+Date: Mon, 23 Jul 2018 11:31:17 -0700
+Subject: [PATCH 2/2] Makefile: Don't install the docs
+
+Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
+Upstream-Status: Inappropriate [disable feature]
+---
+ Makefile | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 224a315f6..ce7f84afb 100644
+--- a/Makefile
++++ b/Makefile
+@@ -144,7 +144,6 @@ rpm dpkg: pkg-clean source
+ 
+ install uninstall:
+ 	$(MAKE) -C src $@
+-	$(MAKE) -C doc $@
+ 
+ .PHONY: all clean clobber test check cstyle check-license install uninstall\
+ 	source rpm dpkg pkg-clean pcheck check-remote format doc $(SUBDIRS)
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-extended/pmdk/files/0003-Makefile-Don-t-build-the-examples.patch b/meta-oe/recipes-extended/pmdk/files/0003-Makefile-Don-t-build-the-examples.patch
new file mode 100644
index 000000000..f75d94197
--- /dev/null
+++ b/meta-oe/recipes-extended/pmdk/files/0003-Makefile-Don-t-build-the-examples.patch
@@ -0,0 +1,34 @@
+From a7f07dca2468ea226d2f07fc0105166e75cadaf8 Mon Sep 17 00:00:00 2001
+From: Alistair Francis <alistair.francis@wdc.com>
+Date: Thu, 6 Sep 2018 16:18:50 -0700
+Subject: [PATCH] Makefile: Don't build the examples
+
+Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
+Upstream-Status: Inappropriate [disable feature]
+---
+ src/Makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/Makefile b/src/Makefile
+index 4b50dd8b5..e00501e31 100644
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -38,13 +38,13 @@ include $(TOP)/src/version.inc
+ 
+ TARGETS = libpmem libvmem libpmemblk libpmemlog libpmemobj libpmempool\
+ 		  libpmemcto libvmmalloc tools
+-ALL_TARGETS = $(TARGETS) common librpmem examples benchmarks
++ALL_TARGETS = $(TARGETS) common librpmem benchmarks
+ 
+ SCOPE_DIRS = $(TARGETS) common librpmem rpmem_common
+ 
+ DEBUG_RELEASE_TARGETS = common libpmem libvmem libpmemblk libpmemlog libpmemobj\
+ 	libpmempool libvmmalloc librpmem libpmemcto
+-RELEASE_TARGETS = tools examples benchmarks
++RELEASE_TARGETS = tools benchmarks
+ 
+ CLEAN_NO_JE_TARGETS = $(ALL_TARGETS) rpmem_common test
+ CLEAN_TARGETS = $(CLEAN_NO_JE_TARGETS) jemalloc
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-extended/pmdk/files/0004-os_posix-Manually-implement-secure_getenv-if-require.patch b/meta-oe/recipes-extended/pmdk/files/0004-os_posix-Manually-implement-secure_getenv-if-require.patch
new file mode 100644
index 000000000..624f17bd4
--- /dev/null
+++ b/meta-oe/recipes-extended/pmdk/files/0004-os_posix-Manually-implement-secure_getenv-if-require.patch
@@ -0,0 +1,30 @@
+From 33affa9ee97691efb73f439fcdba4adb8625a26a Mon Sep 17 00:00:00 2001
+From: Alistair Francis <alistair.francis@wdc.com>
+Date: Mon, 10 Sep 2018 12:59:48 -0700
+Subject: [PATCH] os_posix: Manually implement secure_getenv() if required
+
+Manually implement the secure_getenv() if we need to, this is required
+if using musl.
+
+Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
+Upstream-Status: Pending
+---
+ src/common/os_posix.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/common/os_posix.c b/src/common/os_posix.c
+index 2d70a0a29..fb09b6ce0 100644
+--- a/src/common/os_posix.c
++++ b/src/common/os_posix.c
+@@ -261,7 +261,7 @@ os_setenv(const char *name, const char *value, int overwrite)
+ /*
+  * secure_getenv -- provide GNU secure_getenv for FreeBSD
+  */
+-#ifdef __FreeBSD__
++#if defined(__FreeBSD__) || !HAVE___SECURE_GETENV
+ static char *
+ secure_getenv(const char *name)
+ {
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-extended/pmdk/files/0005-pmempool-Remove-unused-__USE_UNIX98-define.patch b/meta-oe/recipes-extended/pmdk/files/0005-pmempool-Remove-unused-__USE_UNIX98-define.patch
new file mode 100644
index 000000000..75c35f865
--- /dev/null
+++ b/meta-oe/recipes-extended/pmdk/files/0005-pmempool-Remove-unused-__USE_UNIX98-define.patch
@@ -0,0 +1,30 @@
+From 92e63699ea83074298971b0251f002562be4dbd3 Mon Sep 17 00:00:00 2001
+From: Alistair Francis <alistair.francis@wdc.com>
+Date: Mon, 10 Sep 2018 13:23:37 -0700
+Subject: [PATCH 2/3] pmempool: Remove unused __USE_UNIX98 define
+
+Remove the unused __USE_UNIX98 to fix musl build failures.
+
+Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
+Upstream-Status: Pending
+---
+ src/tools/pmempool/info.c | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/src/tools/pmempool/info.c b/src/tools/pmempool/info.c
+index b4010bf35..7b890a123 100644
+--- a/src/tools/pmempool/info.c
++++ b/src/tools/pmempool/info.c
+@@ -45,9 +45,6 @@
+ #include <inttypes.h>
+ #include <assert.h>
+ #include <sys/param.h>
+-#ifndef __FreeBSD__
+-#define __USE_UNIX98
+-#endif
+ #include <unistd.h>
+ #include <sys/mman.h>
+ 
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-extended/pmdk/files/0006-Makefile.inc-Allow-extra-libs-to-be-specified.patch b/meta-oe/recipes-extended/pmdk/files/0006-Makefile.inc-Allow-extra-libs-to-be-specified.patch
new file mode 100644
index 000000000..2042fdb25
--- /dev/null
+++ b/meta-oe/recipes-extended/pmdk/files/0006-Makefile.inc-Allow-extra-libs-to-be-specified.patch
@@ -0,0 +1,29 @@
+From a88e806f9ce8cc071e81abad688643d53f393176 Mon Sep 17 00:00:00 2001
+From: Alistair Francis <alistair.francis@wdc.com>
+Date: Mon, 10 Sep 2018 14:18:38 -0700
+Subject: [PATCH 3/3] Makefile.inc: Allow extra libs to be specified
+
+Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
+Upstream-Status: Pending
+---
+ src/Makefile.inc       | 2 ++
+ src/common.inc         | 2 ++
+ src/tools/Makefile.inc | 1 +
+ 3 files changed, 5 insertions(+)
+
+diff --git a/src/common.inc b/src/common.inc
+index 032cb83ea..2d5c4bedf 100644
+--- a/src/common.inc
++++ b/src/common.inc
+@@ -74,6 +74,8 @@ GCOV_CFLAGS=-fprofile-arcs -ftest-coverage --coverage
+ GCOV_LDFLAGS=-fprofile-arcs -ftest-coverage
+ GCOV_LIBS=-lgcov
+ 
++LIBS += $(EXTRA_LIBS)
++
+ osdep = $(1)_$(shell uname -s | tr "[:upper:]" "[:lower:]")$(2)
+ get_arch = $(shell $(CC) -dumpmachine | awk -F'[/-]' '{print $$1}')
+ 
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-extended/pmdk/pmdk_1.4.2.bb b/meta-oe/recipes-extended/pmdk/pmdk_1.4.2.bb
new file mode 100644
index 000000000..6a0028123
--- /dev/null
+++ b/meta-oe/recipes-extended/pmdk/pmdk_1.4.2.bb
@@ -0,0 +1,61 @@
+SUMMARY = "Persistent Memory Development Kit"
+DESCRIPTION = "Persistent Memory Development Kit"
+HOMEPAGE = "http://pmem.io"
+SECTION = "libs"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=7db1106255a1baa80391fd2e21eebab7"
+DEPENDS = "ndctl"
+
+# Required to have the fts.h header for musl
+DEPENDS_append_libc-musl = " fts"
+
+SRC_URI = "https://github.com/pmem/${BPN}/archive/${PV}.tar.gz \
+           file://0001-jemalloc-jemalloc.cfg-Specify-the-host-when-building.patch \
+           file://0002-Makefile-Don-t-install-the-docs.patch \
+           file://0003-Makefile-Don-t-build-the-examples.patch \
+           file://0004-os_posix-Manually-implement-secure_getenv-if-require.patch \
+           file://0005-pmempool-Remove-unused-__USE_UNIX98-define.patch \
+           file://0006-Makefile.inc-Allow-extra-libs-to-be-specified.patch \
+          "
+
+SRC_URI[md5sum] = "bde73bca9ef5b90911deb0fdcfb15ccf"
+SRC_URI[sha256sum] = "df7e658e75d28cd80f6d2ff7b9fc9ae2885d52f8923fdbacecfd46215115fb4c"
+
+inherit autotools-brokensep pkgconfig
+
+# Fix jemalloc error:
+# | configure: error: cannot run C compiled programs.
+# | If you meant to cross compile, use `--host'.
+#
+# Also fix #warning _FORTIFY_SOURCE requires compiling with optimization (-O) [-Werror=cpp]
+EXTRA_OEMAKE = "HOST_SYS='${HOST_SYS}' EXTRA_CFLAGS='${SELECTED_OPTIMIZATION}'"
+
+# Fix the missing fts libs when using musl
+EXTRA_OEMAKE_append_libc-musl = " EXTRA_LIBS='-lfts'"
+
+do_install() {
+	oe_runmake PREFIX=${prefix} DESTDIR=${D} install
+
+	# Copy these into the standard directories
+	install -d ${D}${bindir}/
+	mv ${D}/usr/local/bin/pmempool ${D}${bindir}/
+	mv ${D}/usr/local/bin/daxio ${D}${bindir}/
+
+	install -d ${D}${libdir}
+	mv ${D}/usr/local/lib/*so* ${D}${libdir}/
+
+	install -d ${D}${libdir}/pkgconfig
+	mv ${D}/usr/local/lib/pkgconfig/*.pc ${D}${libdir}/pkgconfig/
+
+	install -d ${D}${includedir}
+	mv ${D}/usr/local/include/* ${D}${includedir}/
+
+	# Remove uneeded files
+	rm -rf ${D}/usr/local/
+}
+
+# Include these by default otherwise the SDK is not very useful
+FILES_${PN} += "${bindir}/pmempool ${bindir}/daxio"
+FILES_${PN} += "${libdir}/*so*"
+FILES_${PN} += "${libdir}/pkgconfig/*.pc"
+FILES_${PN} += "${includedir}/libpmemobj++/* ${includedir}/libpmemobj/*"
-- 
2.17.1


