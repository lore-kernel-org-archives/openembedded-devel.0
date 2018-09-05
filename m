Return-Path: <prvs=7790e8633=Alistair.Francis@wdc.com>
X-Greylist: delayed 566 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 05 Sep 2018 18:27:08 UTC
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	by mail.openembedded.org (Postfix) with ESMTP id 6AB32793B7
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Sep 2018 18:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1536172031; x=1567708031;
	h=from:to:cc:subject:date:message-id:mime-version;
	bh=soIi6HW1bkmI8SVDpzAQg6ysAB3iPsquAxP4gr/9Hpk=;
	b=oKaWQ3AMW1BU328CoyZFMcaDBZFd0ixSlqoncz2Oje0UR7QaDwRfyr9q
	/fI9w74usHgYHRcz+NxWmHcEqXb0SzrPGXY2KRZqOERYObjPFEVRvG7qC
	k4nfk2ikIlWeoSw0afrbpiIQVUGevaXqpph9uGoSYqDse2D+9nrBja+Sw
	8EKjOLaM9TM3AjIsjtsy3FXYb5kSPzPi9ExRz8j2e6d8Y8UOtqqFUeEMZ
	+hOf10PNCAlvQed8qs2VxYBX0m+npvlmXE5GSgLcKUveF6Uid8K4HnVO2
	/VoqQCmBjEKHAUNvoWXJGIlrxxkCZjYdUNaRKVz655yJc+o43h2k5T9By w==;
X-IronPort-AV: E=Sophos;i="5.53,334,1531756800"; d="scan'208";a="90678568"
Received: from mail-sn1nam04lp0084.outbound.protection.outlook.com (HELO
	NAM04-SN1-obe.outbound.protection.outlook.com) ([216.32.180.84])
	by ob1.hgst.iphmx.com with ESMTP; 06 Sep 2018 02:17:44 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=h6xVhm7tl2fFFlmymO191sedko+aKyOi7xj490PWaWM=;
	b=Q7nhnkJZnV0/r1tDTjAOXWftI8V/XMOPe5Q06xPMPdwOpjssVLjvCQDBZd1XKg/xkIzEfgSDRQD4MuEMpxutG+qlWxIVzWTiWq/VL+VwtwrlWfTk4KeZqMT8fPIG3uBwOffjaA3Gos3lmsDufKq2Gx7w1XbDLLkixLnwUc2FYXs=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
Received: from risc6-mainframe.int.fusionio.com (199.255.44.171) by
	CY4PR04MB0390.namprd04.prod.outlook.com (2603:10b6:903:b1::15) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1101.18; Wed, 5 Sep 2018 18:17:41 +0000
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Sep 2018 11:17:32 -0700
Message-Id: <20180905181732.19483-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [199.255.44.171]
X-ClientProxiedBy: BYAPR02CA0031.namprd02.prod.outlook.com
	(2603:10b6:a02:ee::44) To CY4PR04MB0390.namprd04.prod.outlook.com
	(2603:10b6:903:b1::15)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fad26fad-4782-4f26-2384-08d6135bde84
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989137)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:CY4PR04MB0390; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR04MB0390;
	3:dIjCsjCYzWWSxTO8DIAH5yMhFPTMKB5zz6Ceab8R30ioaJuHyn0GarqQ6g5U2REB4lV3EWDwwpdmoBZEMUwuKevERkHGqOl7m34aQvEpQyAMNphmnvGU9KLsRud6va2gjIc01eHIYPqG5Vw1pqIUa0l95+x3ASPjrULSdgieXedXFO0b/VuXLavKhIdWnaM8QjPqkXzK3NcrvQkU+cm86jPC3/Mt899QrUP1cglt2dbU46wycuwtFLoFxmdbWRUx;
	25:jwpbIG07AyAvRzOavH28Fs06k5PNMZZoh6kMpjpyFRAbkfp3pT4ZV8oMqgsTgjpoUVTE3sp0tE8OvIfSfdRdujf+6Opk9nVLlz8mW750wlqdCdc2vFKWyCvz3D5qGKBXUDwL692pjdYUSh44TVdl6dFIEJgnI2h7lOAvRuzvfKU6QYd8zWEs1+OyfsWZNAbGABf2h0HB9h8zLjBqLcYvEOHLJhznxZWHVlk3HDFnbnABT8rPe3fYLBadGyC0VGLPV/XJj1ETI5s2gQt0ELziYnr2ug4v7zWydBJktCbagqRXVWSyG/Hv68BXzdOepY4lyHWe6dHYZf1h2gwASlwgVg==;
	31:xfmr/+UidPUBLXLkXH7WyMIE/1y12ULFR/4Pypu3JYdWnyEZerILjFCs+RPPMjThL6zQAvJSHkc82oojvx4utvXUzPZukWGsnm1HYL/4ydB/vxsHDtDjAe7rmswMUwQdAYglcZKQ3000mtVDhLjhln3656EPl129cMoDtAfbOQim8Z6VVucUvB26dMALt+DR1jOLXIolZkiubQgFFAdRnLrrE8WSqgJkyOSJxxT9zrs=
X-MS-TrafficTypeDiagnostic: CY4PR04MB0390:
WDCIPOUTBOUND: EOP-TRUE
X-Microsoft-Exchange-Diagnostics: 1; CY4PR04MB0390;
	20:G917oStt3u3n94amvJod1/7b4EJ1pRXuG3VB3e3i19LnFy+FsVz+ld4/CYs6vYkRegnPn8LX6k9mo5Kxz3QDQ6tikJiYrUIcakBaQy+KTnQGuWE4Cknq821Jh3z0m7X8ZdR/ioFfHBkYvVKkI1J1P2QFfBzAJeJ6MsIBPY7V7usECUNBwIXRtvp9SZ6gr2oL6uY5Arrzu4oAC2RJBaVXnrnJiKidCdihAuGDAJAuhZvNBMIszxQxcgmhiJSelj5Zqgprh0/2wCYWNGmJtlWSxxN4FINQUmK57L/7/KWukuVDFVemcsv9j6PW7uq2zjiowUkhTSh2yZf6Fhq2XtkNj2b222zipGlmkOvFCY/qLEdVxsWzatrJkGsX6i/cyBMFykEsgFIv6DBtXOaHAYVj+o7qIgLJ9zBAdT2x81vf8JWU5fgXR919EPenPBeQTo2OzWGAk/OheZ6U3vQ42bIXuZiri0OCniGCMkBE3hV1wI8D6uJzTCS6Gp1HqSXjK7bZ;
	4:ohtUmoOnikq6T2lF6vEVD+vhAJzh0e18OB4sykGlqCkfACLF9pk7Mirfepy4OK4i3se5n3vL3V8lxVvusjZfCYf6vkU6BcUgrEbK0jotJWUqzfWQOHXItTSpiNP6tA9mRY0Ka4HvbOu1f3w4YUWy60p9GWhptJ91TMPoZvFayXpBiVfv6tCaUMmZsQ4+icEQCal+V2+UWHZufEk9Mfn6BL6YxSykCLLjdDVczfJu48HE1MdRh2gdoLk/6cZAPJk7A6w9s5eGxpah/2aZ70gGq753dg2XvoPE2fhT7PzQh7Dipc1eYB34svKcqLRFcHvn
X-Microsoft-Antispam-PRVS: <CY4PR04MB03905D161CBE5CBF71C9542290020@CY4PR04MB0390.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(166708455590820);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(10201501046)(3002001)(3231311)(944501410)(52105095)(93006095)(93001095)(6055026)(149027)(150027)(6041310)(20161123558120)(20161123562045)(20161123564045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699016);
	SRVR:CY4PR04MB0390; BCL:0; PCL:0; RULEID:; SRVR:CY4PR04MB0390; 
X-Forefront-PRVS: 078693968A
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(39860400002)(346002)(136003)(366004)(396003)(376002)(199004)(189003)(6306002)(6512007)(1857600001)(476003)(956004)(106356001)(2616005)(186003)(68736007)(36756003)(53936002)(47776003)(16526019)(105586002)(6486002)(50226002)(8676002)(478600001)(8936002)(26005)(2906002)(316002)(72206003)(6506007)(66066001)(97736004)(16586007)(52116002)(7736002)(305945005)(81166006)(81156014)(6916009)(3846002)(6666003)(386003)(51416003)(53386004)(86362001)(575784001)(2351001)(6116002)(5660300001)(4326008)(48376002)(1076002)(50466002)(486006)(39060400002)(2361001)(44832011)(14444005)(25786009);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR04MB0390;
	H:risc6-mainframe.int.fusionio.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; A:1; MX:1; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR04MB0390;
	23:6FEJZgCr6s1K25jWqnqRO06eRGz605mPhdbRNqSZF?=
	=?us-ascii?Q?UPUW94US4J9l3H7wq8eozz8h/PT2yxN+v/6374xCFkSK6lcYbt5TKZXZQbXt?=
	=?us-ascii?Q?MMt7uGDK2sPrl59WOKrZe3/m8Dk0bRUK7IYiUe3sfRFwUDJucPC/4dvX8yJQ?=
	=?us-ascii?Q?mBwsFXPKM6nNsAGkND+SkDuegSFeLN+Ym6sgk6v8xS1VDtue9YfVMqY7aiXd?=
	=?us-ascii?Q?E920xznS2aCk/vXEcqkO9NTNeWtkALjXNCt8n0OnC17iqNCLobhs2Whbqe17?=
	=?us-ascii?Q?pzoSgArtl2Udbosomkfiw9LRuhe3sxVxrt5dDH5ycCBLOlGq6RvqBCoTdmyz?=
	=?us-ascii?Q?NyLJ5fLBwbB6w60pO3OIblBrLqvfTLb/4y27d3Bfh0ReNjgfjMQLhdAYReND?=
	=?us-ascii?Q?IZkhVBVtLaNFwO0OlmKeDh+OUzwTT0vK+v/I3VEe19Dxdl3DaO09aYI1uD8s?=
	=?us-ascii?Q?xLeSN/2Wt/+VrEDgcs8iY0v3dy6ULiqUSI2f4yZqr30KjCvhkC7p1jkNNBqJ?=
	=?us-ascii?Q?0BpnTHzLgDFtggW4zc1D47Cb3zp+8mbgG3CUzGL7fhK0E7Usei2Eu+6eUsDy?=
	=?us-ascii?Q?//35ZvcoZjtUCVPFcUlphy1XWp9KtvAeNaw7edFGFSRNVpL/X96izAFBib81?=
	=?us-ascii?Q?N6+NUm7NF10yftVxRP573o9hku23oaZyUEqFWDYGjvWxDgYJjnc0hcl9wql4?=
	=?us-ascii?Q?RRR69uTQ/Yg8Llp+7uXf2YGjWuYGHeNOEuzePo/YSwZraA5WaBF2cLMuTVts?=
	=?us-ascii?Q?n7wY5h7osHvHiNX0M+jULuMFizbw9dMajUhz99mfymPn1Yffc+Lnjbpy1Ls0?=
	=?us-ascii?Q?hNwQdupgGvqS+96bMJ3vZ2L6h/UeGEyZO2Dn6EUZ7BZoAPvKtTJD/bsnYWyH?=
	=?us-ascii?Q?IRUMYMVgQ+neFu064ABUbph8p4a7s722ICrhKVeXuOovgs6YSCZwH6q4oPPJ?=
	=?us-ascii?Q?jUqcpkSsER/vH+ph+rUKHnWSXA80Xy29TyweqBIq2IcUMhQFhV1Lmt16Es0i?=
	=?us-ascii?Q?9iF7vYg0bwuBA7B84Hy9WIUYYOCI9zF2o2KTPZGa3wL9s2qKTO1cG3v9kVnG?=
	=?us-ascii?Q?AH00jwsuJX9kbeN7R6QAlq4VF9HMS0+eWBMkmK379eMHpa7BepFmMBG71QM5?=
	=?us-ascii?Q?y8025jnTRt43hvdVP103TRpxPIto8vF6bYF8B58VryQFQ8W0PyfPKRhRup2q?=
	=?us-ascii?Q?ZgBzDbV7iwpNdCqZ3CgYEQnNYD75S+5SGxKldbP3lfoL9D/FEufciCbztwV3?=
	=?us-ascii?Q?hLVB0dNyjg8UsAWeUYtmTbSyzStqI3fYjbXu0YeTAwQzey5kqpiCOukkQ6Dj?=
	=?us-ascii?Q?sx6nnjis/OVlv4dN8q87lA2UAHGrBY0JtyS7dzlw1GJ?=
X-Microsoft-Antispam-Message-Info: X7+qsV+bzQkdv8mHr0Mhu8JUd6NM3R0lOJ0jHY/fTDIwlaYWnzrtd/eAW+0C4vSdDAR7Tdzs43wRmTsvD5f5EO6n8E2HgHnvVDnWyomol1/kq5sl/FWgAQ7kGl1NaDJUpx2rc0RNaVKDNT0MdRPu6F+DXvsksq4GSZ04XCWVo5Y0myi1PLv/EzLtyM+F6z9en8lpVzL44k7HiyzVRkmnQGPnwoeg0zxg1CUZsiggQsSr2zw+Z4wvqBh6Db5LgKgwsihWmSpExH0AmbYByNqdJIOKQW7D+phsI6MyWLc8AuzE9naFif2MPIN9guDFVu+5UD7nvbHv76O+IArFj4mSgH9pyD/Uij7kEsVf4t4oe9s=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR04MB0390;
	6:fAbM7DRxfXDsJfEGp6OCen1fJ9RWtOBVyjFepme8J91OgYtR6CwwK77Do13vcdyRVGBuH4sd4XDhzNOi0piEmdhn4Z6PY8jachHjaRlrz/k97Qntn1IrKRpeXfnYjgy6LwPxCQfsIbQXhZgQ3OUBSvPBvthhA6U55BKjW/D3bGHbiRNdwLU8e8E7RW/diC5XSbNZadlhiCGCqGg8HBWP9V96M5joVsATjxQvBrCg+f4E+HtjjB1oV8Mbb4MRQSr91KP1cXfT0EKix8cclLv+9HQf2O7kDfQKksMc6NlWXiM15HsZeU0NSfHL6m5zD7vrIiNNDoW0OgLDEwKs/U4wvGBbljZ5rE7x384oA9dl2+Y+bb64CrpRu7t2Ld7YhjxavcitvgWa85LIu/fivltJHe93vt2wyUBlIUcP6CBPV7P7PeLYK6lSHuJUOStcS83lp6EdXLYqOMpcrzNtrCLd3Q==;
	5:0JKJbDKgL/GjtshE1qVTO9G8+FiHh5OMB7FDu4xRhTCRMWrKcbhwtYJzOmua3e2NmH9hWUeTZAKCMXDXCNpjNrkuJdVtzy7cGD++xWMV72u7GXY5TwSzM9ZE5yKK4EK/ZPxbvwMWsN8EZjQjykMZAOaREZ7iRifQD5jd2Ohwjc0=;
	7:DtJAyd9AGlmsPKcmGYEe+IA/NF9YkqObYfWqrm/NChDqJ60xY412M1lUv4pNEuxHYoeDs93zI+X1z5cU0fD7bjFKLbguHAKKEeYwbGT1D6SV/PAjWP2Z/cRXybJ/JexKH5OPk7Su8si8WqjSRxLtdoq1IA5rgaD4d57+LbMW2cj2MnXXudS77DUNf0XztxdJYoKMMK39CqxjRbydWfewpmTLIxRGMtX3qWbO9u+DuTggnDJfJm+WV1OJihZqZJpl
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2018 18:17:41.3938 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fad26fad-4782-4f26-2384-08d6135bde84
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB0390
Subject: [PATCH] pmdk: Initial commit of the PMDK SDK
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
X-List-Received-Date: Wed, 05 Sep 2018 18:27:08 -0000
Content-Type: text/plain

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 ...c.cfg-Specify-the-host-when-building.patch | 29 +++++++++++
 ...0002-Makefile-Don-t-install-the-docs.patch | 26 ++++++++++
 meta-oe/recipes-extended/pmdk/pmdk_1.4.1.bb   | 49 +++++++++++++++++++
 3 files changed, 104 insertions(+)
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
index 000000000..90d51e3f8
--- /dev/null
+++ b/meta-oe/recipes-extended/pmdk/pmdk_1.4.1.bb
@@ -0,0 +1,49 @@
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
+EXTRA_OEMAKE = "HOST_SYS='${HOST_SYS}'"
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


