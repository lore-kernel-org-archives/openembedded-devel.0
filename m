Return-Path: <prvs=7863c9c60=Alistair.Francis@wdc.com>
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	by mail.openembedded.org (Postfix) with ESMTP id C24DA796B6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Sep 2018 20:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1536784266; x=1568320266;
	h=from:to:cc:subject:date:message-id:mime-version;
	bh=UjUx9cS3S5nvOsZZ8eMVOYj/k02LRg/p3DnTJBigOHo=;
	b=JevaPQNwpjszUcabAbfBQyDky1vtNQTE9YQ+/RjUj65bYrYsU/9G4ZW4
	YigPBuKftcQ/EdDrJQeGvcdeNwSQWOF6wlW77Z+qupdhbtVdBUb0YHq9k
	WOyP7gYH9X+gg9RXJA4mdQ5zl2dH61Fn67wATUW5nJ+x15eeex/yE9oNk
	VXT/lqmXkU1yH3wD6ge4T203C9pJrssHkRQMWgsaWi4SA8q4rUdQ9zVke
	JMuLlDiKLTPf4j+gOh1xf029fbNr6UvmqoTtLdjUNormQ66wu6sLdqhbn
	6hXUACsHzjDyIt6OvJpIVjTNjkrgD+HXV3zpJXJ89QQqayUu6i5e976JH Q==;
X-IronPort-AV: E=Sophos;i="5.53,366,1531756800"; d="scan'208";a="94011696"
Received: from mail-dm3nam05lp0114.outbound.protection.outlook.com (HELO
	NAM05-DM3-obe.outbound.protection.outlook.com) ([216.32.181.114])
	by ob1.hgst.iphmx.com with ESMTP; 13 Sep 2018 04:31:05 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=kLwlqB4nFKTVacdVn/dpFIpzC/3CYWv54G3PP1dFhpk=;
	b=KkKpfHaWiBsoSTcTjAgG1KdZAlmDO82M7xR4FSJrW872gIds4IEkvr1em7+9qn0srkcwHdcpb40bRSlt88giWczEdKAbaWd8qHMygGAVEjHPUXtf2AZ/ozotubcRhxwyjlOc99GwFv6WHVd967+UOObjjvaZOBpM6mzF9CW92fM=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
Received: from risc6-mainframe.int.fusionio.com (199.255.44.171) by
	MWHPR04MB0401.namprd04.prod.outlook.com (2603:10b6:300:70::18) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1122.16; Wed, 12 Sep 2018 20:31:03 +0000
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Sep 2018 13:30:52 -0700
Message-Id: <20180912203052.16161-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [199.255.44.171]
X-ClientProxiedBy: CO2PR18CA0045.namprd18.prod.outlook.com
	(2603:10b6:104:2::13) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a4b1d15d-c458-4b47-ab9d-08d618eea8b9
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989137)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0401; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR04MB0401;
	3:BCT8FlJWTAUS4g5vK9FkEndTv2PxDcTe9KrvFVk7g9ExQBfbuLRNpYW/KuGeMLPE63qIfSkPt2TeNQPMPyY/TzakY/WxsvcupA79CxUMt4Ak4poGqpxHxpR7PkaC2ZuF/NDVvIRzhnKhiNzAmBXmb78SjqZp0ve5t8LTMIVH8eutpiSewWAChSXhLIDkDGxQZQkg6oK3wTE5trDFUIssjAoNLKQuS05V0SRQeeqLIg/ZmM1zYxW2A67GmfIAg150;
	25:Jc7eDviR/SNjt0R9+wP48dqgWALiO9EuY5sn1uCr0u2JUWU0A8APq74wKsCK03BMrsBpqgCxbLiXvad47mhQcg0r4gwPTfvWDdUVhghn99xBUL4NRuXwYwGFDM2aWCg/R+KIhQ839vq3ivIvYquzzNUoKeJm2mcBwg0eGgVrSfGCUiFZfy13YKy7aUwdKKlISrsGmw0uKyyrMydk+brEkLSgztL1GXYd7+YtZGNnv3YGelwUsDeIR6bQxA9M70BdHnkRWwMufjQJPMJIgVWGzJ5XqC2UviQHf2eEU9qtusrMRd9s+d2iIjDpY76KfCNbWpS67QY/iAQwzYi/LaCiSg==;
	31:HWlQFYGDt+qIfhdnqtHCLWSeDBvRcgU4QUlfHnQD2qwqffRmxtdxXOaqokoHWzUTgrQ8rh1SuDdAiloIgvxRc80+dIFd12rRs93ZqK6XJTlE5duTd8Gn0aAVE0KKmJZsMmfngfpKeCS4hwNii4CayuyJiqmFYto6pjqE1lDKnfn0vvlKKPSU4lmz7F50nnhg0VMR7CoOnMiRwjho4XiSt621wWVrd0fwUvlbVG6tWY8=
X-MS-TrafficTypeDiagnostic: MWHPR04MB0401:
WDCIPOUTBOUND: EOP-TRUE
X-Microsoft-Exchange-Diagnostics: 1; MWHPR04MB0401;
	20:5f5BlItz7Lk0nyPM1vdlkIXOK2NbSbz2JZjMrDj3wHKH4NNYnf7jln4LqVm9aoKGZy940Q0396qHnVrdWXHaqBNflYeJ7ARD761h/E43yz8l4EmG5pfkGwNu+0VSqP3kwtljv904E84tsSSVan/RkSjSaNqMY5aIcmtkMRNUTI2K8bryhGMFUzVS7JWf6qBNMJhaq/uMAejYbRmNdAUUmqcwWMyge9uGiZnw8kHVxdkYQ37gupr7LpjcBt/8As9FpvPj5gkW61gk847VvsP68ckCke6GuCa/cNA492Cykl+4JKdw290CTmeBXoDfD2ByQzrVADpjcsHhqkg6GjSdWErCTjj71DW1P41mvM57ZC5cvAsR13BwC6f6F3Xyg0Ldyg10gHCsLexPev8H8r0qT48HKmMRXXwDvwxD8x81Vsf911a+Cts6PWUnuUpC1yrtAuCPzou1zKZtsGoLc5T8QtNv5HgndgFS/KiDsj5odI0dzes62hBUmvFia3ZPcxcm;
	4:Te1auazylMxK3WoB3DrPbat6RiohTLgcbUXD4WoZ8npN6FvgaP3Ek+897nMypz/p/txJDrAu5wVN4j3LFCxqQmhB1cg3KAKSDGta+MoWcRU/qlFTaRtMi5K2cGE9JDCxedX/7vJindDiORxbXeW7O6WPCRxJtOXHtR3HOaoaqdwrfA3DCa1wqNoE8EHxplp4ksajfba2TZ6RhmyAiujKd28gK5YSqbPAMn5/vPbJckZVS1M91aQrxwLltM5YjkVBbCoAWqIQdLbF0s4q4vAn3+a+6VacZfcwYj2CtVU43Zj+yCb2jfvPl7Z5JTXMd98N
X-Microsoft-Antispam-PRVS: <MWHPR04MB04016449C98CFD0B55916B61901B0@MWHPR04MB0401.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(166708455590820);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(93006095)(93001095)(3231311)(944501410)(52105095)(3002001)(10201501046)(6055026)(149027)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123564045)(20161123562045)(20161123558120)(201708071742011)(7699050);
	SRVR:MWHPR04MB0401; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB0401; 
X-Forefront-PRVS: 07935ACF08
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(346002)(376002)(366004)(396003)(136003)(39860400002)(189003)(199004)(66066001)(47776003)(6512007)(4326008)(575784001)(5660300001)(86362001)(316002)(6486002)(2351001)(6306002)(16586007)(25786009)(478600001)(8676002)(6116002)(3846002)(39060400002)(6666003)(72206003)(7736002)(36756003)(305945005)(106356001)(1076002)(2361001)(6916009)(53386004)(105586002)(476003)(2616005)(50466002)(956004)(48376002)(45954006)(53936002)(52116002)(51416003)(44832011)(486006)(2906002)(26005)(68736007)(386003)(97736004)(14444005)(186003)(16526019)(81156014)(8936002)(6506007)(81166006)(50226002)(19627235002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0401;
	H:risc6-mainframe.int.fusionio.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; MX:1; A:1; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; MWHPR04MB0401;
	23:L5LqESFJvk97PEtqb9rmNmNTArcCzVPHVW4+Q1HNh?=
	=?us-ascii?Q?iM8hq0KPdD7vafspoqnmXDvbyKRBXqLqccPkagVtl3O1b0uCckEx8Vxr9vtQ?=
	=?us-ascii?Q?SluuRN00XqXYfqNymzVlid6E7LDVrFZY9RbhDV9ey3KBAreVDV/+1AQh6D2v?=
	=?us-ascii?Q?7MLP9ySOLdiyYiZvVWwQixxb8jh02lGxwgKFGE5eXlAHfw6+v3Lipb6V1A7N?=
	=?us-ascii?Q?A4EglMU/3sm2mw01tC6ZM1MxeWx2XdQzLMOTLu40dIMRxflE4CggS8sJh2kA?=
	=?us-ascii?Q?zTmxBIB61PDlciIoMglelRM5LyVnY6KDFLwv8twaH6gjoMafW6B1gZHY27ff?=
	=?us-ascii?Q?0IPqdbCVx8zlxSC3FBwuVTVaRc9wQ9ctIqSrqeRP3l3vzKVFYFU4X09YQaMv?=
	=?us-ascii?Q?srX9wRBV3S4wrMtoSe7+DAl8Js/43xYgUFZXVSDjgzmBbJ2Bl2GMER0T4qjP?=
	=?us-ascii?Q?l2/dy9PsdaOoDhmgxrAKBgpRsXNRpELWxUaCdFORojcFTkclNAE6K54kqJSO?=
	=?us-ascii?Q?wbe14UumKvx07RSbGianELx1RRWXkfujr544/WdZKLwUmqSDzw0lypkeIrPK?=
	=?us-ascii?Q?nl+1lmmae42odMJ36Je48PBrP+ZJn7DVIMFLd/jXllK9rysF2mTLvOVSDzLX?=
	=?us-ascii?Q?CK/psOJGbnF/ErTUJUvlhHPOSz4Q1JUtFBzpdCmaLxYoSY4ArUPSIvJkZmvQ?=
	=?us-ascii?Q?hgn4O4zbG0vBkZBFfKHIXD8AmKVYY6FPlDRzC3W+k+pMteU90gFWiTCz0L5X?=
	=?us-ascii?Q?JgeNVkqPWVvueBJV8HLU0sesdYkBUZQmgYU7hodbnFpiCcCIPbN876CPis//?=
	=?us-ascii?Q?pmAB7gOCmXdkYiqnLLdSAZktdrk/bCoLcIXYFBY8aUU8JjvwaGtoeKrv2prF?=
	=?us-ascii?Q?DQi7PFYPEi8e2Tk/jh5lDhskgaRAgPJgJqQT4LsE32HIgT9HNPynv6I5vIMM?=
	=?us-ascii?Q?9ZCe9JPf+OGclU+MdPCY55pjdHELAh8lSAEy4GqUOt5GyPhWM2reakwPkZAt?=
	=?us-ascii?Q?8xcUnKsSSqTLLMLTJFVsdWMUYBBQtUXoPxpjI3tuvO8ce23MrohixYMuOPqT?=
	=?us-ascii?Q?QPXFHhwgrDPHVWBLZRNR9UO2aqlf810Z2p/uWq7ToKQhQNkYKDK2KB5dF01D?=
	=?us-ascii?Q?B7eX6pqZ9pOvoNdwvq0QJku9yexAsIAiHQCXy4TLd2uwRnxiHpAxRN33YgA5?=
	=?us-ascii?Q?9z//vQA+EAutkep+Wwapmif+s2OSONwxHSKFUM7rpogt6JVaFV7wGaTIrYuM?=
	=?us-ascii?Q?IezgYg4TZ3Uu7IMxoV57BQrWboXx9Z6pSQf59tLYtm3z+Nro0/Pci31V6MRq?=
	=?us-ascii?Q?+vk9A2IvMS+iwOeQebFeUw0Sd0edGYg5ncxa7a0ajj7ZoHDvBjDI033qKQPf?=
	=?us-ascii?Q?/YxslOoidaTu6CZgvuU3Z/mKRU=3D?=
X-Microsoft-Antispam-Message-Info: /UFTLGTUCJPSc1MB9nEOQ/GMWOw31Ai2y97AGlCPTDOBX57RWLHwPX9qhflG3WUChYGpNhio15KEllwAapyB/LCCKpv6OYGteHfVSsS+QWBnbAlPJs0qB7lDWlumm585A/bFSnvZaLdRfZjZQ080I5s5T9ejws335qiBysazhRtyaud3NQdryrrpcigbf9Ryu/3cXAn3g0a+5WIa4n28IBiwezEv+VqROfdzv+PMNrDYkfXNS9q3iK4jU0O4RvWbb9jmGmJFxZde5cv3RVMZJ/cZek3mHSlOoN+S9mpngJZb7QSLSLJsy9OkFvLfLpYsWiWCWxu0pfMgUWoSOZmRVMzPuGTEL/FdCk4zA7eF6x0=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR04MB0401;
	6:yjEtyHm0CZPf34ufYYyIjuPudI3CvTSEqhxaYcRdQhZ7L+PTnApp14ZaeDhZuh1J5dA/395J0sNBfhK3pPFd48RTrMEGAmh21X9GBt7VZQOBJXJJJKMm4Ag1MF3rR5RicZgS6KlSp6wKXRQdUezei8D9ycq829owyfyTDw9gSMLlFCRzkaHBOvdxQWj3Ooie9ncX0UyAlisl8ACWi5/2vuClvuv7FDFy0aGHboP2A3vc5038VF0zMnOiSdxFIcer1CUD7g5cod2+Hm5WOQ3ofrrZ+Gtl1vhSEesfL84lq+3SNfNibry0u5DjfDFnPSK8phuSOPBMBr3WCJccScmGYjcU/bQX6jn6rWeaz7EIYR8avw5b81CD8+AbEQtVx3iHban1gUpaQF/BisjNtcXobdJvvEhmfklO5gSn4za4r4NEMhh2Cxd1njEYQep7ax345m6Tk58y1661WVY9v3tJ9A==;
	5:JvT7OIlSircoH2WFKL87ej76kgZzFvLmP5ygyIHODnNywEaUlGnzD2PSNe1pVMMP2ynFeLvAuvC7zk3dLRMvh1ioZkICfdPmIjA97hbsOBhXS5RXJZ1UGaLamtu95n9RmzzkKxCPXdrSWZ3vBAJMRVXQZ0qxLD/3yzwS3EZSxrE=;
	7:U3AMUS432su8ONLt9Ir0GpBWoCvJjRdSuxE/OsNTclLDg3dBoPAgToc26VEGkVk7AnHJx+bZ0/t17PLkGJwXkECUMYR/TH1tmNAqP5ZQId1YkTJss5APcFUxioHf+L17RKROIP90mgkXYj0SkhPKK4fMN+2UgHJ+y5UZgX/8xUwAUOTTVaJuOvyZT7AISi9T22U9u0EmmHveT/0rMDlmcUGH8WZadBYOppTTg155uX8RA/5ii4uFjkBmJ4LipBZd
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2018 20:31:03.0226 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a4b1d15d-c458-4b47-ab9d-08d618eea8b9
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0401
Subject: [PATCH v6] pmdk: Initial commit of the PMDK SDK
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
X-List-Received-Date: Wed, 12 Sep 2018 20:31:03 -0000
Content-Type: text/plain

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
v6:
 - Mark as only x86-64 compatible
v5:
 - Fix non musl build
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
 ...03-Makefile-Don-t-build-the-examples.patch | 34 ++++++++++
 ...y-implement-secure_getenv-if-require.patch | 30 +++++++++
 ...ol-Remove-unused-__USE_UNIX98-define.patch | 30 +++++++++
 ...inc-Allow-extra-libs-to-be-specified.patch | 29 +++++++++
 meta-oe/recipes-extended/pmdk/pmdk_1.4.2.bb   | 64 +++++++++++++++++++
 7 files changed, 242 insertions(+)
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
index 000000000..3da22a970
--- /dev/null
+++ b/meta-oe/recipes-extended/pmdk/pmdk_1.4.2.bb
@@ -0,0 +1,64 @@
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
+           file://0005-pmempool-Remove-unused-__USE_UNIX98-define.patch \
+           file://0006-Makefile.inc-Allow-extra-libs-to-be-specified.patch \
+          "
+
+SRC_URI_append_libc-musl = " file://0004-os_posix-Manually-implement-secure_getenv-if-require.patch"
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
+
+COMPATIBLE_HOST='(x86_64).*'
-- 
2.17.1


