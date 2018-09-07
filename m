Return-Path: <prvs=781b605ec=Alistair.Francis@wdc.com>
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	by mail.openembedded.org (Postfix) with ESMTP id 8C1D57982C
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Sep 2018 18:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1536344530; x=1567880530;
	h=from:to:cc:subject:date:message-id:mime-version;
	bh=pjgChvbYkLo3yE5RNoqZ5BRjQOk3wTeOpGekMeQu3go=;
	b=I5bcnvSY70qPtm9EulRQF9LcIUFktDGWUFFhGlahQjLM+VHIjel9v7QS
	D4A2yR6z9f9lLxsCvMym7gBjb1k+giNDrBzR5piVuZJlrk/HoFh1drvF7
	8g/0v865rbAOAzgYyj6cI8greiA69ONSb+/onfEDW7mf4OTbYnrGc8ty5
	F4nHWECLz70vWRdgQHJs7gOkSFswNcy65nzk4KTn/cz8S87XcntrHEXZm
	msyg3oCeNjMTutUiPFDwfzIu72mL9gPFUbNXzqUyDKym5xXxJjr9e6wjg
	N3ZP9tGmjsGcDB+zjCdY5C60fgE0TsAO960oPiAVoZGYt+0uoAL4ws5VZ w==;
X-IronPort-AV: E=Sophos;i="5.53,343,1531756800"; d="scan'208";a="90870164"
Received: from mail-cys01nam02lp0053.outbound.protection.outlook.com (HELO
	NAM02-CY1-obe.outbound.protection.outlook.com) ([207.46.163.53])
	by ob1.hgst.iphmx.com with ESMTP; 08 Sep 2018 02:22:08 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=9NwopLhK7IRnz2eOqRKT4DeMhOahUAOpk85W786l8lA=;
	b=cPzxIdEkVfllpgt3SydRjjOuCrV94Z/k4S7R4g7oPBNnchrRvQetdQq4epzl1zxYwFgnhxKeZHhPDzvnGDDaYVET6CJZ/yaUvxu1tZ5MAhAngOm2keKZY+zFARiCt+N6o7Nv3Tj7bAm0msmrFTaq6Qwf2TYKjRCtg3XXgYAL9J8=
Received: from risc6-mainframe.int.fusionio.com (199.255.44.250) by
	BN6PR04MB0386.namprd04.prod.outlook.com (2603:10b6:404:91::15) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1101.18; Fri, 7 Sep 2018 18:22:06 +0000
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  7 Sep 2018 11:21:56 -0700
Message-Id: <20180907182156.25995-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [199.255.44.250]
X-ClientProxiedBy: BYAPR04CA0029.namprd04.prod.outlook.com
	(2603:10b6:a03:40::42) To BN6PR04MB0386.namprd04.prod.outlook.com
	(2603:10b6:404:91::15)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 394388d2-fdc3-4a80-8e2b-08d614eed168
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989137)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:BN6PR04MB0386; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR04MB0386;
	3:Ke7hzlEaMJKiEJZpZO7GQGv8IU3gUmkkox2nTFno83LiHWUNO8wgUVnfMHOKR3DXNpSZP4GI3HWJ0QVvQi2AmcvA/0vBLk37njICDotKVVcA9daXHMU5GDcbbypi56TUA2tZ5WqQuDeAVVst/Z+r2DnIW/xomNyWygkHILyjyXKUvCf5Znn0qhbJVxp7OsNXsJrU6Yhb5zGLDpwrMI4Aq4wnlXRKqMUXNsNtup2YkO25iruwkIEahX+m0xAphpA2;
	25:IFDAFRbubwHMHJ87bxX1POrH0sKZVnsHoh8w8yvLVM8/OHBa/RJkBOyRDSEftpdBWeXzRCqenhoIr3AoU1S8a57mqyaS40ce/UD9Hlk/v1y8fY+Pi0z8nsLABJBH9osgXzuo0o1Tvq9DXpvdGRE0b+MqAjAjwCA6OVqTyFrInj5VXrsezRq/Nu/zjs/taf14vZLc9IolbxpAPlfoVlFXm1ZM+0QRD1u5kGd3tZl8GM/TodQespB7y3d3U9idL57DWukbwlqmHtt3GrZW1BY2TJNmN0LmdMkV4jdlTrfoVMp+cLJ6oVJ1ulWGMjs3spNukAGmW5cJRjO7lvLyALihGA==;
	31:LOjU/OU1y8+y3uTz2PJeymnYz7h6YQiOe1q9SIP94ZtSpkZuhu46oyqcq2edzw8BOVeY8DXxnV6mXM8uZIsXi14KGY+DTdF+/rP2JXahPciKjd0tMv1VEKnpUtXsrQbU6IaMQ3Vmzmbq5tvGlEuVv9UXCpd3rmYogWoVk62aHL+It9NraObTXGa5ImqT4E5C2oRUO0P0QapHFkomHQNoRcVTpzpfNolP49LqI/1HNiA=
X-MS-TrafficTypeDiagnostic: BN6PR04MB0386:
WDCIPOUTBOUND: EOP-TRUE
X-Microsoft-Exchange-Diagnostics: 1; BN6PR04MB0386;
	20:EVxn67gYLrEDYm/BQoEWmayQ4cjbj5P6/6lXMNoSWAmAWq+MpM3U+PIFHz+R2ICZExfPWsPyPxRrBK45fHrM2vxCSLGGg38W7vRcaMUAQ0pFaPjM0HTBmJavvAA8rmd4mdu90N4hzGNpz57YDk7i/Ncts8dKW7mPE6ITJnlZvvv5zQbrhGacwWN9uxPWEg7Wqd6dFfGll0drOjXPjGWYuYvMfQq/FBx8rDfg5dGz1liEz9FpZE2GIQlRRQF2cH5yUV+DUoSJXoyr8zHTduJCJL2yi2+d6KKVhQcChy4kGj2CRBqR4ukOCQQcdQYa+G/4Sk4Zy2+hqTKpxRNgkYTZ3LYflVDNrZ+gLDdTYRwhh5YGnDkzDS3DVbzsTLOjbT/8Y/AWv0VHOzzH05Z5aasogaeUyYC5Cb05wS6ochzCCR8f682wwyZvA5B63at3GuIaqpOJnJfOD1XGt1EEYUIxRrgYuUMGf6pBk8S4imkwVPD8Ef205xYZQ0x3dHBwGNEQ;
	4:Y17Ld6qOsXbEKiQHLKOlGdwrZ69qHPmlEQ5/s+pcfmNaTqoHbM4D+BFhJp2E1ssmcaRORQUcBorkmrVBQZhKteX8WtdC3vMOiLK/stdK6qzBy43wKOycNwFC2nG/M/RL8NDj6rCnly2v4RtnMjPzUNGZRSbtOM3P01+VDaFo59pBQ9Lz+cicZO76Nf6ci6F8SKm1R9Tgfb+W516bxZk8YFd4AJDK+i0zgkQ61YtejEOhfTvtq/TAnbhQe6KS6/3LONZEmBoCSwml/ZeDXCJZ5VQLwddeTi3/9BXwatByDfdCTHjQll8FjN4x9pLoC0bx
X-Microsoft-Antispam-PRVS: <BN6PR04MB038670C10DA82B4CC10195FA90000@BN6PR04MB0386.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(166708455590820);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(823301075)(93006095)(93001095)(3231344)(944501410)(52105095)(10201501046)(3002001)(6055026)(149027)(150027)(6041310)(20161123560045)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123562045)(201708071742011)(7699050);
	SRVR:BN6PR04MB0386; BCL:0; PCL:0; RULEID:; SRVR:BN6PR04MB0386; 
X-Forefront-PRVS: 07880C4932
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(136003)(396003)(376002)(346002)(366004)(39860400002)(199004)(189003)(14444005)(53386004)(6506007)(386003)(36756003)(52116002)(51416003)(7736002)(5660300001)(16586007)(956004)(47776003)(72206003)(97736004)(476003)(316002)(68736007)(2616005)(6666003)(66066001)(6916009)(478600001)(2361001)(6486002)(50466002)(8676002)(105586002)(50226002)(44832011)(81156014)(81166006)(1076002)(106356001)(2351001)(26005)(86362001)(4326008)(186003)(48376002)(16526019)(305945005)(6116002)(2906002)(6306002)(3846002)(6512007)(6346003)(575784001)(25786009)(39060400002)(8936002)(53936002)(486006);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN6PR04MB0386;
	H:risc6-mainframe.int.fusionio.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; A:1; MX:1; 
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN6PR04MB0386;
	23:x1OCummjcymbsC2UbQtJ2BMFhNjcfqTCVXJBZt3a0?=
	=?us-ascii?Q?HJdzQEsR4HY0ABu57KgXhOeqyi/mcO8aV9wg/8GUeLhVbgh50DeAPGFpgpa3?=
	=?us-ascii?Q?eYgocsOJsxBok5OKctoyffhPkoWraNzQXZ4KjArIRxxO2sKTfVgdpn3ef7KB?=
	=?us-ascii?Q?vtXrU0bDFSMmxFaNjpf/E2zooVrsHMCnRS3H4DcJ9cTjQ/abbhvmwZ8gINP9?=
	=?us-ascii?Q?H52Dns+vNCRnurmWZFn1y7SuTcZcfM+vwlduK+1SdQS0UNn4OO5NPmLlvntn?=
	=?us-ascii?Q?YmaH6Q/eeN/1282JZai2LC8xWOf0OlcPMHQlUVHdFvxobQT22nVg17bEkv7M?=
	=?us-ascii?Q?fBx8O9XtDFm1Tivv/QtJdIcKrMfglKyV1J9VS4yIWIlTLVWo/3TjxhvIrui/?=
	=?us-ascii?Q?T5SGV6HDgBS7damI9ybZ6tETJkH7N9pZ0Ja/zQfYt09XtAo8dj+CsQbdUPzr?=
	=?us-ascii?Q?9p2Vdt15BBlIotNz0VkQ5HiEE1k+rPxcRaPxI+HLkMeFHvR2LC6xvJYSBxMg?=
	=?us-ascii?Q?FBEKSRJJZBOo2Btlgp5ib/oIN1oXO+hAzw1MlVPugT7Zw75xxOiD917p1OFF?=
	=?us-ascii?Q?ThcgvIk4HRKi1SlDtAZytMvIiIMl7qRxgkPOyOnA+oLtlV6nVJo9hr5mg0/o?=
	=?us-ascii?Q?d17ipdRrQ2Y3JGf94QhwfUNuWIL+IxEaoWGD+VPI2vsh08tjYjOqOnKxVTkF?=
	=?us-ascii?Q?+ZCex+YSqOKkD7dxxMcaxyRTi1LmQJzOBTbLYrEwRtXjQN3ZJDxHgdAGu6Fq?=
	=?us-ascii?Q?8HU4cxojHy4KJMEDJalkQiJ/34B5uWObHeviglKsCzcknQ49wqCiBMIGQxlW?=
	=?us-ascii?Q?qV31ResQcxyWYJ3ohVja2eYj/C7E9uAXwROr78wgdpWrvDEo2xMOv2C3t6U5?=
	=?us-ascii?Q?0xLHEPxPMImNHcZkBmU63qAxF1ezHzXzQpBZx4Sg+wGU3mw9XzonhxJUrF6R?=
	=?us-ascii?Q?EPoi2flT1iNNLuVf7YdRkWavHnWJph9yEPvF1zP01uT0Os2GIio3PlRppaX6?=
	=?us-ascii?Q?8JL23ETFejk9gFOLIXI/vKQsC9GzH6amEz8IU8MgV7sccHQ+SV4QEvIU0iE7?=
	=?us-ascii?Q?XWtkzjC7DGSwUCsDTLozzYbaRngZVEZHrECMoiMZe/uXG8jfdeycjdaZIEts?=
	=?us-ascii?Q?wEkEd33ADEpDO7rKjmDkVDVGI7wykEadOAi292xCjRqskXDCxGZQhzl+xqSx?=
	=?us-ascii?Q?8IpxVKMv9n4meH6UUIveZZ4YYlpNyyFF2n2D5eIYeThommQJ5UFao9a7C3cj?=
	=?us-ascii?Q?TSpkoYZE+lPW12XWZyq1fdx6rgfMH9LyFY6H/UI/+M5v2kJ5EQqJau5iHg98?=
	=?us-ascii?Q?TOlrD6U+xycVmZ4yXugCRihFQyS4LrJ8CMjV3DzTdp8?=
X-Microsoft-Antispam-Message-Info: 3rN5FYM1b3iUYmHh/T+3C/hIqo+cetk4CReidKqChfCD32OC1JevgPK5POGkF9qTP4oqZOKvuz16pO626i0uZsnQTIukDHmYcuUlKPpk4fAxXpff78EPL5ipr33+g697VTxPnItyktK8fQxbA7y3hcnsiBX5MVEirlcXmKO8GIg8PeyWxwK8OzNN7e/AWxQvFwmfUABBeckKzdUENNtGZkR70TbCub5eABIm/e8kMwjBWQYyJpK46yaPlxEz92YqY63zZS9NbwGsu1Rqq4PIVrUAmig4VyLSH+7h2QYxb9/bdgqGPrj5Cc/o2IEVHB88yOHVYLjGAQoxkVT4EuyfTHSstFIyK3isS1K2zcAWU4E=
X-Microsoft-Exchange-Diagnostics: 1; BN6PR04MB0386;
	6:64IRY6H+CSAw8rtGYVEiWPMRCMGJ1FjZcXUBmNk0hDcTWKm0yspdE/44ITovwZs2e7PA1uMvkaWw+M4ptTO84h1dS3PrvkkgkBynwMXH4VM2K0Gb8P8i0v9vrhxFkgtIYwpVgLofQVGlLqNJTdDdFycYaRQmFWG/y74pAEwFaJU1l5CYPdRi7AlSARGDzfNLS7XE1vNhN2HczjTjq16lxGPoXaFr7gYA4n4RT16OGhynKtJeSZH4G07FlgNVvOj0BqJTf7Jp4DSRX/hzWBA0Ky+VQUK2rkUrYdrJHeRLBFoYT+xyyBpXMVZyMs7uMeaPg8daxeyU86xe3A1jTD7W+3F2OMO16joA4l6uO+wi/XIHqyU8jLblEVVO4RUSZBS6MHIPsmXnG35BhVqtuPB+a+FPT1JZ4fkoiHeySDFAiWxcjZAt/1SSRBuoErl5TL+EjMU2jA9fRGoKXeJbKSxwkw==;
	5:1ZJt9PRQHawas5tpOEPRAHx7gOhDigQlX5cLbC9goR4XLHRbVsUXqNFa6knx7hVryZg+zj2LYDs2F1uefS5ol/zWzOXNqHBBe3S70cWlGOGcb5QXsfOoh0zKdTVWRn2acoMax2d1jUVa1JWc1zbrtmWze/5k5EMNTlApzIz8ans=;
	7:rwggkrhYZlkUy/BJzmkAp8JR1b3+EWaLN0NURMQtPLYXXDS9/auTBnQtF7Zw7OXTPy/L7CXGWbKs8caegQCp528AjTLCDSt6FuyAJn6A9idbfSmAX+30upMojgkHcyq/WhGeaaGX1KMoQJMzxlccNQ9Z0FaOARvO/7lKRLoLY4LoPlofiAyHBNmxom78x6gL8JKUeb69sSgyKmbn1A5o1txmr0oX929+evwWG9mr23NJ0ASLDnO4R9Wqmbrxa/YC
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2018 18:22:06.4441 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 394388d2-fdc3-4a80-8e2b-08d614eed168
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR04MB0386
Subject: [PATCH v3] pmdk: Initial commit of the PMDK SDK
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
X-List-Received-Date: Fri, 07 Sep 2018 18:22:07 -0000
Content-Type: text/plain

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
v3:
 - Add missing patch file
 - Use SELECTED_OPTIMIZATION
v2:
 - Fix fortify source compile error

 ...c.cfg-Specify-the-host-when-building.patch | 29 +++++++++++
 ...0002-Makefile-Don-t-install-the-docs.patch | 26 ++++++++++
 ...03-Makefile-Don-t-build-the-examples.patch | 34 ++++++++++++
 meta-oe/recipes-extended/pmdk/pmdk_1.4.1.bb   | 52 +++++++++++++++++++
 4 files changed, 141 insertions(+)
 create mode 100644 meta-oe/recipes-extended/pmdk/files/0001-jemalloc-jemalloc.cfg-Specify-the-host-when-building.patch
 create mode 100644 meta-oe/recipes-extended/pmdk/files/0002-Makefile-Don-t-install-the-docs.patch
 create mode 100644 meta-oe/recipes-extended/pmdk/files/0003-Makefile-Don-t-build-the-examples.patch
 create mode 100644 meta-oe/recipes-extended/pmdk/pmdk_1.4.1.bb

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
index 000000000..01f620057
--- /dev/null
+++ b/meta-oe/recipes-extended/pmdk/files/0003-Makefile-Don-t-build-the-examples.patch
@@ -0,0 +1,34 @@
+From a7f07dca2468ea226d2f07fc0105166e75cadaf8 Mon Sep 17 00:00:00 2001
+From: Alistair Francis <alistair.francis@wdc.com>
+Date: Thu, 6 Sep 2018 16:18:50 -0700
+Subject: [PATCH] Makefile: Don't build the examples
+
+Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
+Upstream-Status: Inappropriate [configuration]
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
diff --git a/meta-oe/recipes-extended/pmdk/pmdk_1.4.1.bb b/meta-oe/recipes-extended/pmdk/pmdk_1.4.1.bb
new file mode 100644
index 000000000..f3edbf10a
--- /dev/null
+++ b/meta-oe/recipes-extended/pmdk/pmdk_1.4.1.bb
@@ -0,0 +1,52 @@
+SUMMARY = "Persistent Memory Development Kit"
+DESCRIPTION = "Persistent Memory Development Kit"
+HOMEPAGE = "http://pmem.io"
+SECTION = "libs"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=7db1106255a1baa80391fd2e21eebab7"
+DEPENDS = "ndctl"
+
+SRC_URI = "https://github.com/pmem/${BPN}/archive/${PV}.tar.gz \
+           file://0001-jemalloc-jemalloc.cfg-Specify-the-host-when-building.patch \
+           file://0002-Makefile-Don-t-install-the-docs.patch \
+           file://0003-Makefile-Don-t-build-the-examples.patch \
+          "
+
+SRC_URI[md5sum] = "d9a7b3f1059ffd54b4c92e38329fe69e"
+SRC_URI[sha256sum] = "e11cfbbdf0773fb5965211e18044531f442ad1e6d6726f1bac8a6dcc0e092622"
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


