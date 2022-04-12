Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A8F8C4743F
	for <webhook@archiver.kernel.org>; Tue, 12 Apr 2022 16:46:41 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.8135.1649749376042294776
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Apr 2022 00:42:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=cVSFWVgS;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=1101489245=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 23C7TUTZ010324
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Apr 2022 00:42:55 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=T1C1UMS3qf+fm21IE+Tp7xtXUL2d9mGAZLBtWVT3ubQ=;
 b=cVSFWVgStX60F3wjOXuF3wVlOLRziibM0gevxW3VlEoJ8ALLBLDOq1VY5y7GZgwU54Jl
 sCkZNcuuOCNkew0HPeh0TAIKcNa5ITnFk5mXWQ+kYZ8nuAk0y8xDB6ENY0RbEza8Z3cl
 1TDZSP0PQpZaxwoxpl2sHMB+EkqwiIn2SB4Tob2KObTSRvUimo3mSEMmghA4+2e2SqP5
 ujF8sYwZpgsHpi1zSye31bBQnhlJg+bKEwYaRNcrWmhRYTRmev4sYa3t/8cSPiy1uwYp
 CGCv/Ot+OOrZrgQVUPPiZT0A9xdj4BKwyWxulUrPXn5Gh7h+CGLEw55D1U1Td10MxUuu 9w==
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3fb9nfswtj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Apr 2022 00:42:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jjTeBGQ2RSNoUr+IvV4UBM/RUb9Sr6ZFB31/3RNBndlgXVFeuDZvdIz3cIzKbaw/Wxnzvp04iQt7PlKN1XWblbCwGiO3g+yW/qp8T0fsy+A1LH232Mqa6tZohkURJbJkKJ7VjKzMYOmVNTBFrIIkdX/X+lEHWRatuvt/BboNSgtc08e9Zv1uSPBsgLw1SrzOWJ+L22s/ZJxM7+RanqOF3s4W4hYd2yC64myNLfmNnoyWob4jOyzqeMXfNkUGeAH2gi5v1pw0CNKyhS5qDPclfPzzXqBbQrNIsLMOvuHl2glJCih4pmkdas0aZT2iT46xU8RQcAE2iNn2dGYKOtxpog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T1C1UMS3qf+fm21IE+Tp7xtXUL2d9mGAZLBtWVT3ubQ=;
 b=J2tHDmh/JnWlrot3wwTZEG91gGIjvlBLjyrt0m0/vRPS/Ewjidk0sI1XolylFfth2By+M4aQq7X8sVkCYqubnsGeEAuFM476CK88fXZalzGhPSEh6KIq/Lm2zFutIX8wQjAjAY04fShQZnB6S+4hbSZRtwxh1RawA9C3lTXw0i3otA8JCbh5pOMADeDXVuvbSnGwVAJ8uFFZxpEp/k+jyuwSKfJ5q/g1Dns7NVRH6QcHND4T66sicghsVBiV40cMQL6UoCom49ckOI/H9BtxzvMM1qOr6laHFTtOCE/hTr47s6OF8xhOsNggg4mg59AAwxDXx1h2iYPhINjFu9vaZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by BYAPR11MB2822.namprd11.prod.outlook.com (2603:10b6:a02:c8::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Tue, 12 Apr
 2022 07:42:52 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::1962:6577:b409:494c]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::1962:6577:b409:494c%7]) with mapi id 15.20.5144.030; Tue, 12 Apr 2022
 07:42:52 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] frr: add recipe
Date: Tue, 12 Apr 2022 15:42:43 +0800
Message-Id: <20220412074243.460174-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR02CA0038.namprd02.prod.outlook.com
 (2603:10b6:a03:54::15) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 89c21e52-0f81-45b3-0066-08da1c580ce7
X-MS-TrafficTypeDiagnostic: BYAPR11MB2822:EE_
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB282283517F72FB22A3E3625BF9ED9@BYAPR11MB2822.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hlIxCRMZy98Ta3clBj9Yv0wZih3qUIXY6nQiiQ/m7yU8DTghpkt0UVdDyVXwSrNnqIsa0pa+iHCVXf8hiqKBQK02DMXa0PFGUmIaumicuWxqB67Jh3fjygmcdzDTizPYtI8E3pk2FeIP1iGMPSbqx9BaPyW3Nhc3UcHGAwyvQ9qGkkzxwWKzmqEiguatNRRCL8TuTY7dh6q7+Z8TLSjAYMU3u8oas0bBOr2xUCZG8dgVf1OE1CkuJ7wezTw1qANK2XHU7AfXVR+zys8oc2V+sRRV3rMtBuv8t6RvzbMNlrZ5iuUDDPFkkMbzfetxuLFgrvyJk84G02og8MMwyC8bFMEjEs6TqcoGBgqSgYaxy3meXStG+9eCVD0ycF8h87MnfYUrK8MqoZtzfeeTN3eCETZI5UaKIuTZNFU0WJUo48QUy69tH3kXOs0EtDMhg+VKS3x/5tDc/WeplKjDuQCmcMTU3gjA4VtnKPM9usrinIwcPNiQpe/sTtzpetFzDtydh5inFqrkd8CaN5CQx0s7PWRomgi6w7VGsMCUwRroD4PfivOH0QqvCh91ojHgh+gLbUEme411mcshbbd0frsa866OsB4n4SLP+2NkiPYzUDS9pNL01PeediUWLg0S6B3epKSZeGYFYepmxgi3DAykN8fbs82T+FPiHj4NiFvS5FVLtw7XyR7QuU9ftBtk1KZUAWOuoNPo2gs5pseej0yMyjMVtSFdNgv0kwchwezCbsBhuNPH7UxH5GRjXNACr7T5AyzLgkqLgoqKvmNEarq1Z9NDvdp8N+l5mxWSV0XxXzc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2616005)(1076003)(66946007)(186003)(66476007)(8676002)(83380400001)(6512007)(8936002)(26005)(66556008)(2906002)(44832011)(5660300002)(66574015)(52116002)(508600001)(6506007)(966005)(6666004)(6486002)(316002)(6916009)(38100700002)(38350700002)(36756003)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?CPZKnAvN4Z9/ybWrsmG4MUjbAe6INe/lLnXj/6RinC020yrhrrFMQlqpW5FG?=
 =?us-ascii?Q?g1HetDcdiN9bxMKSsKMEHSBZE3RpXOghmHujtre4KLpvNVHk+aLvybc0QGrn?=
 =?us-ascii?Q?JJDUS3SX1u2uWc2Fi8O1GNULlL2V07MB001RBlzzd6zb29rogQDqRe8q0rZy?=
 =?us-ascii?Q?0Rr6YCv0PCqHhw0bmw4TsRf0iZAVAAMQhJ+w6vgjlvo8UDlEAss/94AMi1kR?=
 =?us-ascii?Q?rjtqpoRZi1/yj8sfG+rgtrw7ED2LHlnwYHmz4ypkVoWlgzeCIZ3NdACuREat?=
 =?us-ascii?Q?ta/JHPkwjF8/94xfLBWt7CjetQw7yN+AlF5jVIRX65EwGe6tIP7xZUwGtmps?=
 =?us-ascii?Q?XAv27Jx9MmEXCP0eTcTJjgrpXgR1Fu7L3bdPe8Z96f/+8LV3cv1Mk+rQ1God?=
 =?us-ascii?Q?CXx0P6TidUSBUsLInUat7qATiwAFQoOuFDBmYArra5x8TXx5J7h9LmyFDGR0?=
 =?us-ascii?Q?KZIC/m2FVNFYWz0MIb7FEv9xWhv0hsP6QRNfaSjOinmKCD9CqmXBqSNgRvBE?=
 =?us-ascii?Q?QEvOVvK+Etor9Bra8CpyiYm6HCbb17KjrDDcyAJG9EiMStEbA3yDAkqLqT4f?=
 =?us-ascii?Q?AQJrSBsmqREY07pwwFsF2EtFRDW6Z6P2jOdq/O+uZOPSNAX6Y9flZxPPJJJj?=
 =?us-ascii?Q?ncxTiStpHvqtrra+IPqT1Wl5jJs08NDl226gSqhZXCHoD3yg5oBQUISNTteH?=
 =?us-ascii?Q?+intE33zv0XA01IRqazZgePDIzFDXWxn5TE6Z2sJpEGxP0SZf5p4J8HZl47A?=
 =?us-ascii?Q?VJLg1dW+IDGn2KIA9cQ9feuUA2aG902Jh2ZNxec0pkK06HKirSLSsq4NLmU5?=
 =?us-ascii?Q?upVZAQh/8kvQssgTBWN3cGj8NyRT6ChFMPVfEf5759YHMFOFGXGRRG1VVc9z?=
 =?us-ascii?Q?0nqG1I2VBK6Xz4XCHaRjK3ZXvqQuLr7MiwVrCLvkelIJcNcSnbrbIv1kMKbE?=
 =?us-ascii?Q?rKc+eAMVofA46DI738/Pf0P3v5zCcBiMtUTPT8sTei19E+X+TIB2kO5V3AKM?=
 =?us-ascii?Q?MHah1LfjBOWEHj10WxO4svL53/d4F0/HHAFAKJeu1FCMNXAT9mNO4dSv3A6A?=
 =?us-ascii?Q?ZVMbdVorj7nev7JS9eg6y66ltQAPUsCmTKVO8vZdXUB5sdtS7H/bat6qTxaV?=
 =?us-ascii?Q?A4m/IJy2n+BdSmw8kBAzeFl3b/0Iprdh/RoqsQUREC2QE956mjPQfowfrxdj?=
 =?us-ascii?Q?KWvFfdorjDSKJXl3NedYiacS2CJ88LP/0eLe4DMVUgGXchlaC9uZH3FndYQn?=
 =?us-ascii?Q?wV5L+L4yIWMgtBRjrQyMdoTtvXg3c0AncIuyzuNx55vdElYHg/lpw0S0ZOmU?=
 =?us-ascii?Q?UHxggd3fWBgYAnO0mRYSAxjXORMqZLzM0JMMxXjzNppJC0qtF0Rmjf2pZMDy?=
 =?us-ascii?Q?PE+YfTY06AOHm8uPZh3EhA4qHHMPDOttioFjZ2Q8CRZyHCzwi8/+pIIs8SH6?=
 =?us-ascii?Q?wl5i/AlRqpsa3k4V5VdfB2b+Bs7K6CtcDpJwDN4sS73n2T2KI2NMCg13D9yc?=
 =?us-ascii?Q?yn5xdyjtKPGghY1xPjEheBhB8gxAtZo5/Jqc65ASid49NM6evlE7i3wjfD/8?=
 =?us-ascii?Q?VBUORneuZR7GbEyYP0jNV+FPA/sQ4Ixzph9vfFPPnBS6+TEpctCpVn65jMAQ?=
 =?us-ascii?Q?u6oLl1KOtyx8JNArXgQhHWocoeLratAaImnjm2H/uhM2AsIAqswh3/Ei9I4A?=
 =?us-ascii?Q?sEN/0RSp1YqK4r28WS1RD9HZWFnnVmUN8zAsvgpZuAm1txFRCu2vxtw88ibM?=
 =?us-ascii?Q?Pz7+pgB6mSHJOFdgNPhh2oWMHupoMf0=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 89c21e52-0f81-45b3-0066-08da1c580ce7
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2022 07:42:52.8479
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 NLa6E3DR6aEJkvNFQxxuPi5vVHHMF8auoLpaqCHlc8SEcq8SbUCINnkuDkBCrhh7b9kvpW6aEZj2EGDUky6G7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2822
X-Proofpoint-ORIG-GUID: YrVIrmCZ7wCAqJqjLeIcsBcuTI50jklD
X-Proofpoint-GUID: YrVIrmCZ7wCAqJqjLeIcsBcuTI50jklD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-12_02,2022-04-11_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0
 mlxlogscore=999 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204120035
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 Apr 2022 16:46:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96583

FRRouting (FRR) is a free and open source Internet routing protocol
suite for Linux and Unix platforms. It implements BGP, OSPF, RIP, IS-IS,
PIM, LDP, BFD, Babel, PBR, OpenFabric and VRRP, with alpha support for
EIGRP and NHRP.

FRRouting is a fork of Quagga. The main git lives on
https://github.com/frrouting/frr.git

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-protocols/frr/frr/frr.pam         |  13 ++
 .../recipes-protocols/frr/frr_8.2.2.bb        | 121 ++++++++++++++++++
 2 files changed, 134 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/frr/frr/frr.pam
 create mode 100644 meta-networking/recipes-protocols/frr/frr_8.2.2.bb

diff --git a/meta-networking/recipes-protocols/frr/frr/frr.pam b/meta-networking/recipes-protocols/frr/frr/frr.pam
new file mode 100644
index 000000000..3541a975a
--- /dev/null
+++ b/meta-networking/recipes-protocols/frr/frr/frr.pam
@@ -0,0 +1,13 @@
+#
+# The PAM configuration file for the quagga `vtysh' service
+#
+
+# This allows root to change user infomation without being
+# prompted for a password
+auth		sufficient	pam_rootok.so
+
+# The standard Unix authentication modules, used with
+# NIS (man nsswitch) as well as normal /etc/passwd and
+# /etc/shadow entries.
+auth       include      common-auth
+
diff --git a/meta-networking/recipes-protocols/frr/frr_8.2.2.bb b/meta-networking/recipes-protocols/frr/frr_8.2.2.bb
new file mode 100644
index 000000000..b1e2e55b5
--- /dev/null
+++ b/meta-networking/recipes-protocols/frr/frr_8.2.2.bb
@@ -0,0 +1,121 @@
+SUMMARY = "BGP/OSPF/RIP routing daemon"
+DESCRIPTION = "FRRouting is a free and open source Internet routing protocol suite for Linux \
+and Unix platforms. It implements BGP, OSPF, RIP, IS-IS, PIM, LDP, BFD, Babel, PBR, OpenFabric \
+and VRRP, with alpha support for EIGRP and NHRP."
+HOMEPAGE = "https://frrouting.org/"
+SECTION = "net"
+
+LICENSE = "GPL-2.0-only & LGPL-2.1-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://COPYING-LGPLv2.1;md5=4fbd65380cdd255951079008b364516c"
+
+SRC_URI = "git://github.com/FRRouting/frr.git;protocol=https;branch=stable/8.2 \
+           file://frr.pam \
+	      "
+
+SRCREV = "79188bf710e92acf42fb5b9b0a2e9593a5ee9b05"
+
+S = "${WORKDIR}/git"
+
+# Due to libyang not supported on these arches:
+COMPATIBLE_HOST:riscv32 = "null"
+COMPATIBLE_HOST:riscv64 = "null"
+COMPATIBLE_HOST:armv5 = "null"
+
+# Fail to build on mips64 with error:
+# Error: PC-relative reference to a different section
+COMPATIBLE_HOST:mips64 = "null"
+
+inherit autotools python3native pkgconfig useradd systemd
+
+DEPENDS:class-native = "bison-native elfutils-native"
+DEPENDS:class-target = "bison-native json-c readline c-ares libyang frr-native"
+
+RDEPENDS:${PN}:class-target = "iproute2 python3-core bash"
+
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}"
+PACKAGECONFIG:class-native = ""
+
+PACKAGECONFIG[pam] = "--with-libpam,--without-libpam,libpam"
+PACKAGECONFIG[grpc] = "--enable-grpc,--disable-grpc,grpc-native grpc"
+PACKAGECONFIG[snmp] = "--enable-snmp,--disable-snmp,net-snmp"
+PACKAGECONFIG[zeromq] = "--enable-zeromq,--disable-zeromq,zeromq"
+PACKAGECONFIG[protobuf] = "--enable-protobuf,--disable-protobuf,protobuf-c-native protobuf-c"
+PACKAGECONFIG[capabilities] = "--enable-capabilities,--disable-capabilities,libcap"
+PACKAGECONFIG[cumulus] = "--enable-cumulus,--disable-cumulus"
+PACKAGECONFIG[datacenter] = "--enable-datacenter,--disable-datacenter"
+PACKAGECONFIG[ospfclient] = "--enable-ospfapi --enable-ospfclient,--disable-ospfapi --disable-ospfclient"
+
+EXTRA_OECONF:class-native = "--enable-clippy-only"
+
+EXTRA_OECONF:class-target = "--sbindir=${libdir}/frr \
+                             --sysconfdir=${sysconfdir}/frr \
+                             --localstatedir=${localstatedir}/run/frr \
+                             --enable-vtysh \
+                             --enable-fpm \
+                             --enable-multipath=64 \
+                             --enable-user=frr \
+                             --enable-group=frr \
+                             --enable-vty-group=frrvty \
+                             --enable-configfile-mask=0640 \
+                             --enable-logfile-mask=0640 \
+                             --disable-doc \
+                             --with-clippy=${RECIPE_SYSROOT_NATIVE}/usr/lib/clippy \
+                            "
+
+LDFLAGS:append:mips = " -latomic"
+LDFLAGS:append:mipsel = " -latomic"
+LDFLAGS:append:powerpc = " -latomic"
+
+SYSTEMD_PACKAGES = "${PN}"
+SYSTEMD_SERVICE:${PN} = "frr.service"
+SYSTEMD_AUTO_ENABLE = "disable"
+
+do_compile:class-native () {
+    oe_runmake clippy-only
+}
+
+do_install:class-native () {
+    install -d ${D}${libdir}
+    install -m 755 ${WORKDIR}/build/lib/clippy ${D}${libdir}/clippy
+}
+
+do_install:append:class-target () {
+    install -m 0755 -d ${D}${sysconfdir}/frr
+    install -m 0640 ${S}/tools/etc/frr/* ${D}${sysconfdir}/frr/
+    chown frr:frrvty ${D}${sysconfdir}/frr
+    chown frr:frr ${D}${sysconfdir}/frr/*
+    chown frr:frrvty ${D}${sysconfdir}/frr/vtysh.conf
+    chmod 640 ${D}${sysconfdir}/frr/*
+
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'true', 'false', d)}; then
+        install -d ${D}/${sysconfdir}/pam.d
+        install -m 644 ${WORKDIR}/frr.pam ${D}/${sysconfdir}/pam.d/frr
+    fi
+
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
+        install -d ${D}${sysconfdir}/init.d
+        install -m 0755 ${B}/tools/frr ${D}${sysconfdir}/init.d
+
+        install -d ${D}${sysconfdir}/default/volatiles
+        echo "d frr frr 0755 ${localstatedir}/run/frr none" \
+            > ${D}${sysconfdir}/default/volatiles/99_frr
+    fi
+
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+        install -d ${D}${systemd_system_unitdir}
+        install -m 0644 ${B}/tools/frr*.service ${D}${systemd_system_unitdir}
+
+        install -d ${D}${sysconfdir}/tmpfiles.d
+        echo "d /run/frr 0755 frr frr -" \
+            > ${D}${sysconfdir}/tmpfiles.d/${BPN}.conf
+    fi
+}
+
+USERADD_PACKAGES = "${PN}"
+GROUPADD_PARAM:${PN} = "--system frr ; --system frrvty"
+USERADD_PARAM:${PN} = "--system --home ${localstatedir}/run/frr/ -M -g frr -G frrvty --shell /bin/false frr"
+
+FILES:${PN} += "${datadir}/yang"
+
+BBCLASSEXTEND = "native"
-- 
2.25.1


