Return-Path: <prvs=781b605ec=Alistair.Francis@wdc.com>
X-Greylist: delayed 569 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 07 Sep 2018 00:40:37 UTC
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	by mail.openembedded.org (Postfix) with ESMTP id A497D79787
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Sep 2018 00:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1536280840; x=1567816840;
	h=from:to:cc:subject:date:message-id:mime-version;
	bh=cHh58bDV9fLFRKd1nPB8iUFZmxOJWY7ftR00jhOxGaQ=;
	b=HFl9edUfu79Lg0jytZyvTuCk60I8knYLKZ2yKTp6Lvj+c+EiM+Zo5ab1
	tL7o0JzD9VIO0VCfwLPEE2GRDfLwCwVTTDgvSDNDxQkWKCpBGVEwAdkfj
	VuGSC0v7GwDeNJCv5+nSaejnbtBGoI46i3uCTJMHb2PqwwYsm6VRYpUof
	Vf6YMhJ2wioRh1Zpgns8KXhvX6npERxQO6ati2RVBpEpdD8v/pbMggApF
	bxIzoP+PhzLPBp0zLI5w7xC+V42f175anjy0mMb5L0BzldTUjlRyeFamD
	SCj/yJHDE7BuW94yYug4nQuEBSgi8Zl2g89r/EaKO/5WHXahzyCjr0hkh g==;
X-IronPort-AV: E=Sophos;i="5.53,340,1531756800"; d="scan'208";a="93369627"
Received: from mail-by2nam01lp0181.outbound.protection.outlook.com (HELO
	NAM01-BY2-obe.outbound.protection.outlook.com) ([216.32.181.181])
	by ob1.hgst.iphmx.com with ESMTP; 07 Sep 2018 08:31:10 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=1wOUHGxCvu1S/dOQjOoSBIBdTdH/MxtOvnbcuQ0sYh8=;
	b=a2I+fYgpWPVH0XJiok69vdE/4w/ZA7Kx385ATyKC4Ao2wWml/VvyMTIbD3qFp7iYfK8rr9TGBJcu6nTCpfPiQfqC50+6BWrm1JNlZ6tCQWusJgs+ypETqzlpcgGuIO4iGExvHbjEL6kFIuVfkjRidnK+9Rs6gBBh0rga80i/0dw=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
Received: from risc6-mainframe.int.fusionio.com (199.255.44.171) by
	MWHPR04MB0400.namprd04.prod.outlook.com (2603:10b6:300:70::17) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1122.15; Fri, 7 Sep 2018 00:31:08 +0000
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  6 Sep 2018 17:30:59 -0700
Message-Id: <20180907003059.4041-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [199.255.44.171]
X-ClientProxiedBy: BYAPR02CA0028.namprd02.prod.outlook.com
	(2603:10b6:a02:ee::41) To MWHPR04MB0400.namprd04.prod.outlook.com
	(2603:10b6:300:70::17)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bcb832bf-bed9-434f-dc22-08d614593486
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989137)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0400; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR04MB0400;
	3:Gc6Zsno+29tSaNyq7hgPV0TDR1qBK9S4SEsGK6SXkiADdOCgV7mDJGH1bceWudroCC/eY4T0flZNPH/pgPg2iUrOfgeU1Ch8bNk9uxSqc98Jh2Ql+5ChiHwABVDH8LfRx5iCx9eb7UtZRmx7ABCo0HxHvIdC8VPdNGDkOy6OkBL6L319BuFva2rR95Uv16vpHhB2TJfJ4uZA9QKAxqoqYmzduIXFL1zfseLlvZjNR7SYdoHXbv15cQGc4qAFBdvM;
	25:6xyrt8jkLWt/54aKE+tZOda2d0OkpEA7jams/waSIDMwH6C6XIev01i/ZXxJdHrIm32dFBhzj4xkaswoLa28WmnM+8haB3phjRgcL50tt7Wc/Kf4iABerBmkQaAMPfRP7fbh+4HFtrTX4vDh4YkijeMo291QqAiwgGhUFl8BaNnm8W6QBJSiSf141pVJXvFamSzabP4kca9QJcZB4VAi0CEJDlVGJRQYta+hvM2OVlE2bL8QLt/onSl5yYTtW7IFiPUrEAH/Smmujwd0d0/hQRhZwivgLsz9fNko/WnCXzO75WvustMmDoVIHcjJLn5nbTGoxjSdfDexnRKCB43Tug==;
	31:cqdfh5CmOfOcXWjFgqW5mvE4+pVA7/q1MU9sUjJnG6C5PwR1gNi53M+Edb+vnan9rgrc6D4k2nVUVPydjaVeKJvBWrWnEvHly8zJaTWlDtqszve5utYui9m9omWYpBTYcy8Q4KalPWoUy/n0Dq4oQzzSv65bEZ9PXteXx+Fvr1K1fMysJT23X0YCiNKSqUECIw8twOoiV7I+Wua8Wl1n1ue9eA25r0QRKWi9gA70Ohs=
X-MS-TrafficTypeDiagnostic: MWHPR04MB0400:
WDCIPOUTBOUND: EOP-TRUE
X-Microsoft-Exchange-Diagnostics: 1; MWHPR04MB0400;
	20:bqzYnSKVv7IEiUV8O4v6ler5CXzRaW9TvmrdZVYD1MBdxZkYBOVX39xFUdsWAOmqJCSp9D3v/ydXzts8MhymVqKzQ1g+OHqe9OYrKXqFWQIauqMXCE2JUZKDZbaYSRHjKXmHRkvbYUUVH5ljr8g0gIBvWQg/wfHquXQfVK9RTwPwdMoqrJd7vhCG2vJpbZk+bXxlLnsTOzZBJuqDaiDyVhVjSDoKs3znBhVcjjhhhQ3ncLayd02dTpg2RUVyYoMcFELRiLOWfudKG01SDhPcxZ2WYAWlZNn8ITTcJHtLno3rQjVNtq3wrfFv/iijoFZJNztB4CyV5Qy5gKmI5/1OmUK17EQIgoitq8FIUm1bCszZLxmUsxAi9z0C4De6ePaqqZwIxiJ4nCVWrkvxmREQxotxDiV/NsPEBPtLxe7Ol22bkdJgFjrnz+KnfJe71uIri3flpgDUMm7Zr7+mwXm+4mU2LGVk2fb27AkCpoNF94AvlEIkPMk/xtCQjtSo3mdj;
	4:JOD/LTEA+GByheBJwywk2ouR3z8M4hihS+VUG9W+KB3g+lIiSHqxttZSSLZaGuTd7JHWAia8pf3QCBT9asQ690G1Jh1kOoTBJi+hp1GCYISO5rjZT9zKZH9Rv8upZGj/BMLYj+JN8/HqHncL8XfrWR7Gbvizx5tnNgoHNJkk0elwW4GzMq+IBQ/mKDajFNgGSVuypqm/NElfdkhyb0dyPaMRCfZlpDfkjxJOUvIAbZmYuznbQnl2jcgOz8ZdXANt9NEbW04byWp/QeUJ5mR6KvhfXYB2uMOE/9O2DaSj6tBXhH9rVkMHqYPmHdhalhx1
X-Microsoft-Antispam-PRVS: <MWHPR04MB04002D36D96D3B7F261AF48A90000@MWHPR04MB0400.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(166708455590820);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(93006095)(93001095)(3002001)(3231311)(944501410)(52105095)(10201501046)(6055026)(149027)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123560045)(20161123564045)(20161123558120)(201708071742011)(7699016);
	SRVR:MWHPR04MB0400; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB0400; 
X-Forefront-PRVS: 07880C4932
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(376002)(346002)(366004)(396003)(39860400002)(136003)(189003)(199004)(476003)(14444005)(47776003)(66066001)(3846002)(6116002)(1076002)(2906002)(6666003)(5660300001)(575784001)(86362001)(81166006)(81156014)(72206003)(478600001)(8936002)(68736007)(50226002)(6916009)(7736002)(8676002)(305945005)(105586002)(51416003)(2361001)(316002)(44832011)(2351001)(4326008)(48376002)(486006)(36756003)(50466002)(16586007)(25786009)(53386004)(97736004)(39060400002)(52116002)(106356001)(6486002)(386003)(6506007)(2616005)(956004)(16526019)(186003)(53936002)(6512007)(6306002)(26005);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0400;
	H:risc6-mainframe.int.fusionio.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; MX:1; A:1; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; MWHPR04MB0400;
	23:rekYpvj4l22mtoX6Su/qSwy1KOoBhKzsw7S+PCLg6?=
	=?us-ascii?Q?XrvXtLqGCafAuq3iAZSyY50vlqqt99mQvX875henyE+MmPXJpVm4VM98UvAE?=
	=?us-ascii?Q?/tgLU+aVf53/iZhtOy0JT4ouInsDK5Axiprdf+AbNmch+hWnA7ltH3n12dey?=
	=?us-ascii?Q?EBxfowkau/C9myKwnGK++fezqLQSLAYarVRwi/KbB9USbUXux7P/1A8M8eni?=
	=?us-ascii?Q?M+vom/mnFVCrgffxKYxTcppSlKxh7fVozzqYz2K8YSPq1uJqjoYXhcaJQmeA?=
	=?us-ascii?Q?8zcgM9vA80AMVWuTmOLitJsmuo941G/s9K8twlwNwHbj4BQa4R0I4o+TFVv6?=
	=?us-ascii?Q?+I8vUM3q7bhiO7DPnxHAJRl+NW5THuooghBYKtkaRycF5583x+/NwpWB+UzR?=
	=?us-ascii?Q?yQYgrDoGn0uo6aEexhwoMFQFb0B1Yo5d8LRWH80ZrDex7lKAnX/va3U1lv8l?=
	=?us-ascii?Q?I+SL0jM/7dJqLrK1qyJX7ubsLBZvWXIcUeej/c+IPorwZVbQ6nZHapQqES25?=
	=?us-ascii?Q?kKU3MO+46B2OQPbVl32R3jeCmY3tLMGAt+tpI6qDWS/D/CJbkwZ4d1XRS4Pc?=
	=?us-ascii?Q?UAJV0hT+INb+5UPk8TdUFTXN4j8Rr3jJCUzGt0G0OgXtTm3Hg72cq7sDb4v8?=
	=?us-ascii?Q?fXFXDKC9T5g3Li5FYmjxPDGFDvSR8YbR9e2OXXhoYLARlm8uBqOweZ2wN8s4?=
	=?us-ascii?Q?g+/cWWPQl7k9dQ1Qh+XoW425U1Ioa6mKQ0NOtoceYuOzE7gAz1JRDTeZW6EM?=
	=?us-ascii?Q?V/QmolXijnX/hGc18NiDqjJ4HNfQuIgUC4Ui4RuRySyyYAznd/e4cNjeWYhh?=
	=?us-ascii?Q?ukMCtMBltZKQqGXUcsMBsnMKEUPsJAoI+Hq1HPTvrva5ZgYpzwnSrNmGDDUN?=
	=?us-ascii?Q?9pK2+f5A8er+Fmvt08i2fKNIf8eKhbO0zaTNfF2AG+9dYeFWivwnJHQ6GCT8?=
	=?us-ascii?Q?u+aQL58QGDC8ZivZe31dTPqzGwtvodQfBon218iPYWBr2J5RrVt6MmF1Jqa5?=
	=?us-ascii?Q?MwaCnjiQ30XbdTf8ZF1PHJ2S9asxCYa+alIz3aVVbGqsuqDVU4rrvjI8MCXZ?=
	=?us-ascii?Q?1sw9VKANuC13A0BiLQ9lJ1qfO9jyPW2SvyFGG2A9aHSvpqbjUQWVqT/KeiYF?=
	=?us-ascii?Q?3U1f2k7kxtBOCryFjMZ7iV5dHscNmsGwwD96SEQoLkWHImYeoq9vtEbElFWd?=
	=?us-ascii?Q?EoYyf3cV9f16qW0xwZ8b9/inBpmO5vYYIefbCjgnwj/r4MvCeR7TESe2x3/1?=
	=?us-ascii?Q?d6XPlFgDxY+LKjLsjFMlqyFfPjvvWbD/DhbG5V7JpOVBTSGTGPq6KFV69/Yd?=
	=?us-ascii?Q?FKkxWblUWPj4AZWX9SiM/g=3D?=
X-Microsoft-Antispam-Message-Info: FaJouTR8km8r5YxCOqWu2jy0h9YkGa83qidVfeTVNLA2UJcC9Yn8WJViQOw2pkjnL50dl1bNXMz3Okrnxh7soBaSTzPBgdSXwf6lOHOBwshmrWZB40SedZIRmfeV1Sm5tZVFdwtp3LeT/VsVvkU6sIYdlqOMBdm21T3ONXwKl4jmB6giTQU6YvR0jpyqGjdNKfbBqXNU+YtFLbDA+/0TcSauQm5HDOgGF1fdqMppT/XBNryhjm5d1fQSwBfiwEE44+0KAf1BYxOrj8ZG8Ce5q1X+XgFG9XJZBqWq6dCjfRMAs6IOfXLVqLUuhGbFTPnTev4CO5QraqNK/c2rMIi3epxMDA/XuBRZFdPnYA8+PUA=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR04MB0400;
	6:czegXxHXq20sP3TMy9FOiGeoRSiqOyJFhaAtjIK9pTlijFGsDimz5cuwKqO0zs4TDyloyvET7T6oiqBM9r2C0X8s6GnVELPcgJh5swXLwZOYY8TtSUOp/lmA8P7OHaac6ICEpD3CjJFBLK/AC+tdV7GkZFZAmNLbkSG37ru/CoPzIjSzRvdpZrA+rs/lUNepH6IxOW5UHmeyAS+zB9iUkn0WSg0Xo7C388guUGidi6aPVJNbv835OAFs9qH7dOqBWuJW4MV+oEOwszkrjPrQx7GQtxdsOjRk6Pfl3L7BDM5mbs91ZBAaBiILYp4OKufYA/CZmYKPwaMUbgr+na9KirYnS7TuWoAQQnMbprQp59XtfE0Kh8CQjuR0sf2E+99ARsC/sIBEdYYFuajuTSQHHF58Wzaocf9tVEhgEjhAubvzzdipr1eKtCKwX+t4d1EfiyfNT+BIwz7AFDthlbsAYg==;
	5:vMsBQTWtzjM4/zvRAXyPbyWCQGtuxIrVCoTwgmre7JPb58i5oRjrmcWtrMnRnyIMkGY2GW/VaS2C/092Q+QBong4DK9LJo9luKnC+wUEV4N8wKMq9H2RCqwuLQ8F9sfrhLT1JYCuNjBkAUMN1oQn22AUVWCpPq0E6Ia5t6At9sE=;
	7:m2kJjhsR5UryRBObV7+CdjupVK44BFTf5gg05YZMNFiLHGvy+qk2FdZD/uAU5T9LzE3hIgjEAVLdVbLQa/ysnv4lN/1EWdmQnOJSrkXzlyXdghkueFip6lGPWQfpGR3+Y2ykB4ieTYvBGVOAm91IPBbeOaDGE2+oB9u9NGD7mcOYXhhlXoNsVHp023PqON9K+b5c+uDxNsPeQ8hV3mPBqDbxOTaAmAwO0sNahQiNv0BZKsJSAQR87MUOX6afCxF8
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2018 00:31:08.3990 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bcb832bf-bed9-434f-dc22-08d614593486
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0400
Subject: [PATCH v2] pmdk: Initial commit of the PMDK SDK
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
X-List-Received-Date: Fri, 07 Sep 2018 00:40:37 -0000
Content-Type: text/plain

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
v2:
 - Fix fortify source compile error

 ...c.cfg-Specify-the-host-when-building.patch | 29 +++++++++++
 ...0002-Makefile-Don-t-install-the-docs.patch | 26 ++++++++++
 meta-oe/recipes-extended/pmdk/pmdk_1.4.1.bb   | 52 +++++++++++++++++++
 3 files changed, 107 insertions(+)
 create mode 100644 meta-oe/recipes-extended/pmdk/files/0001-jemalloc-jemalloc.cfg-Specify-the-host-when-building.patch
 create mode 100644 meta-oe/recipes-extended/pmdk/files/0002-Makefile-Don-t-install-the-docs.patch
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
diff --git a/meta-oe/recipes-extended/pmdk/pmdk_1.4.1.bb b/meta-oe/recipes-extended/pmdk/pmdk_1.4.1.bb
new file mode 100644
index 000000000..e4d4fcb4f
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
+EXTRA_OEMAKE = "HOST_SYS='${HOST_SYS}' EXTRA_CFLAGS='-O'"
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


