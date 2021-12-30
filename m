Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDFCAC433EF
	for <webhook@archiver.kernel.org>; Thu, 30 Dec 2021 02:10:27 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.59685.1640830226880921989
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Dec 2021 18:10:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Q5BKYlsB;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=8998eaba3b=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1BU2APVf029740
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Dec 2021 18:10:25 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=0CPz/MZCZKsTYKIIjy7DKOf57fWPoYqJFPNw3j4Oc3g=;
 b=Q5BKYlsBUtDM8CQZq/Ku1HbH4/wt9nC9VMGB7GDJnpnZeBDwyNbrKA1oAK1W/TbmJm8p
 v4wECLD3iWlYKpAHQA1RgVWYNOhfiuicUKo8ud6LuVqfe3QTF6N2WqNACwUVSL8ZNvIy
 QEGvHfEt9eh38f/7yaTjqYeR9LeSIz9r99aH506WcZW0xxg48gvkC8InAUmaReQAMkaq
 snsgRZuwTDY6204ZgrKaC38YBFSCrn2PCTSeuT+JqxsEq97R85cO3gTKkOGdpG6EDIb6
 iI4CE5cw1C8FVRgILXLoA4O5Cda9gFSz5VKT2O/z+zyAlPrH3CLYr5XHilCXfgNWctqU aA==
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam08lp2043.outbound.protection.outlook.com [104.47.73.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3d7kpw9c0r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Dec 2021 18:10:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L6UsahCOYzff2+pUwAhoxYcyvdNQ9Nm+cJQFIhRKerw26PD2B32aZwukMMZtOqaGnjUOgR2sxuTcZ3wnGqAoBlxssuYQLeEPQXVQI6buGJxi2N8/eUnEV0e/PG/n6hoK2L3cnEXyfmFpqbzQyVCnTuk1DmGW+sFBV+uOjzvduqCNVFP8p2/gmXBYw3Sl7C7qLlseuCnGmE2N4AUjeViahq577SiivbYEqE3W+1Wq6Dr00lq+bFiJdRYtUVnRvRevKg1f9d3uQYHANeUJ9zal0FNjyDZX1+uddHIMt/98vhozAduci2GExu/8ciu28igRM6np1NLl4ilBU5QS9NyM2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0CPz/MZCZKsTYKIIjy7DKOf57fWPoYqJFPNw3j4Oc3g=;
 b=JbK6RpcWs/S0TeSupl4qXi72+IqPaqZBTkFcdOI3n3Qkan0jO6cmuJIeCtiABO3e7sEnFfDWoADGOkY/fm4ASvsLbALII7tU2pkisNP+Xb/bM4nUhCLn82bCQm/ydqwLvawaKyjf/qdMLtNAtlhb/dMd0MyOLPYPZEXFDSK1rKU526r80BDrDSjBxWcc9BJB53w5sj6v3IMVh6ZL1/PKTZ2K9nIhGJFuiH+R8fxevHdXFQ0b4gxU28l3HEzRQpo5a49/Ft5q5rtrsWKrc5P7cdk2COw24LzZuxa3B6XRGXKDCYlj5VfrGda7pcQDgW9egOA/aYO7XDvXR47CMozZdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by CO1PR11MB4961.namprd11.prod.outlook.com (2603:10b6:303:93::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.13; Thu, 30 Dec
 2021 02:10:23 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::8962:26c6:20fe:eaa4]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::8962:26c6:20fe:eaa4%5]) with mapi id 15.20.4844.014; Thu, 30 Dec 2021
 02:10:23 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] dhcp-relay: regenerate configure for bundled
 bind
Date: Thu, 30 Dec 2021 10:10:12 +0800
Message-Id: <20211230021012.1046899-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0127.apcprd02.prod.outlook.com
 (2603:1096:202:16::11) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e1dbf3cd-ddaa-4fb2-c2a3-08d9cb3989aa
X-MS-TrafficTypeDiagnostic: CO1PR11MB4961:EE_
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB49616F59B9914A5204B2ED26F9459@CO1PR11MB4961.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	mzue8dBdyCFg6gRE0bZpqRR82TWMJTYv0D9x7GB52U2U5S/PjLfySBQ/eenWMpUu+rRt+Lg3J2ELmWdXBbTy7avJiL3erGA3nRb9ijPS8GMsNljvhTiv6D4dgxI/+cUdeYAwXEg67ffOybpYcPIVU5Z9pkwGnOHzr0QIp9XdkERPFYlbYycV6L2n5i26DV19I4kME9aeGiTplJBRXhEysJ39dc//LwULoVHLlhuEOOX3qkbaHdOk8EsrqLFC9p84XCfBbERTY1Ud20X4y0I0pVnGsgfRwrk6jseNLBbJSWH3czANhLT6NN0GyaAfFc4T/ChlgFV6kgkubGIlIAXUhRAUHavA3dsSqXSZ8bpo4wI2NyZKzCzMDpGVIkiFRjVSn4CpDUTdsGDo0Z9l6DiUFnX/4ifLKM5sLVQVmNfsrxxesjZkSwb+5nwZkMA5UdskSxQ68EuVc9GFrdslXNbF52VwFiTXvJReAbMbEpQAH0AktYnJJ3fu+Mi0Ff222krGYNIc4TRhoVesutLV1VHv8wVqspWHrYYsjO6sahEJ/dAW4dSzPAakS+Yur1O8+tcwWq4vshqkYupXYSfp0doxUscCmPivw7S8SLZu4y4QDqZ0VXf9M1LBNPTea0LIALTZq2bcBgT/uIG+IFNxZJuBWd0yx8ZpXpo87CrKjnu3Fcpv6EjrCHjxfmqah3Ysw7BDvk34Q/GI/oraosxrqIeWxq1Em650B6xhLL+LyGA8DxXF4JoiX22UulvCUhLjPOxEp8AKNfq2gLbKfsDZO+BCzLmz3VvBtiG0yQWRLgZaNho=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6486002)(6666004)(508600001)(2906002)(36756003)(1076003)(86362001)(38100700002)(5660300002)(38350700002)(44832011)(6512007)(316002)(6916009)(83380400001)(2616005)(52116002)(6506007)(8676002)(8936002)(26005)(66476007)(66556008)(66946007)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?o6F7QG1wLwvHmJdYCYOzbBEKZ2Yc5+D6Yb8iP80qJYVtedlqGiBmA1CSvY+o?=
 =?us-ascii?Q?GoW7xrcX5ZSHRt8cbCCRB4ck5qKhGPlp87LutMxrNyHGZdK0DVsZaNDQ2UAI?=
 =?us-ascii?Q?OCf6y6vh4IntRXGUuSh9KHk8WUdRUusLwDel1x7UGO1kRDwqVHhISQ4bGeLX?=
 =?us-ascii?Q?TkMqVulN/FF0iI1Rsi18Qrkxn1QKSWWGZNG4n7iI9+/PNPxOzD/cSkhgo7FV?=
 =?us-ascii?Q?B+WBygdBYG7vejFTX5/fmtb2NAHxDpzXJYahnpZQa94tOdhaGtz6gE0q1a/G?=
 =?us-ascii?Q?/IgqE1K/6+JlCcreJpubsT+hpk5CH6HF/kNlgRhHKSsr5H+CFr8x9GsRp3ob?=
 =?us-ascii?Q?iDJJ5dQgWUpcTZLydo8xaEQf0B5+pFiiiVEQ1VA+0APHz0bKK1HmfLlIxr+H?=
 =?us-ascii?Q?p+XoIZE2+9lxtSE8UBrw/HMr4YjRSLV7V86LiRn/4tSqxOmZy98AH4o4z84e?=
 =?us-ascii?Q?4LgsiS2PV3tlmw7xxPuioFaBn+senCF/Iplj/J2C9sgToAkwKH8H9W+Aa7wp?=
 =?us-ascii?Q?csPp5JOilPwbgaSjtL3WlpS2oQbyzPJOJFaa5ShSAL4ByN4uFxO9iY6yVmxE?=
 =?us-ascii?Q?DVJMWwtauQqQaR+V9/KLm9jCJbfqI/Ad8R8xsxCthLcCwGX95zi0jFRMpXM+?=
 =?us-ascii?Q?js3obAZGwwM2eBM2XXdjpIdnmJQOMuBt74WXMDU79etvCSFnspgs+XORCihe?=
 =?us-ascii?Q?FYOiIGmDfk11H3HjcGBY7we2fiXGl77HuE+CSgTziAUz3A00vb6qBrsZ6UD+?=
 =?us-ascii?Q?QmWTznqbZTjYCv8LSJ5jpy4JjYfud/0QHCEJ4V3DffJFGU9yU1+s1Aui1zgl?=
 =?us-ascii?Q?JBVP474UZxdBNQRDAqzghxQ3wV7ywAd4QC0l1I39yU0PYU+8vWL1BlRDJkai?=
 =?us-ascii?Q?yra/RkVZ6NRY32W95xdtp32i1Q0KvrgJmwY0/3da88blM9hswWL9jmMNEoJF?=
 =?us-ascii?Q?cP4a8xRYSJpV2gupcPaUDG+RzqVGi/NzoGxiqdpxVt0NYPY+4ClwxafVj1fb?=
 =?us-ascii?Q?UPTjBITuH7WRq9+DZA1IYv1m7Us+EfdHH95EcnhxErN2sKQpy1R/b77D+MBd?=
 =?us-ascii?Q?ZU6KgXvte2hgCDnTs9nes9JzRirrw6nKDDhMYmqQGQ4x0YDzFsY+TixoRPWu?=
 =?us-ascii?Q?ZM3F/2JpzURHSgiI15shEUIkrD70bR/75APqQqwSqDSBr3IwrejJRSX8fZY1?=
 =?us-ascii?Q?Gq4nmR0/QfTdAGXbKS9cjvN5tvs74oVZfb7zLzC6dynQ/p1sCCU/eByOafsa?=
 =?us-ascii?Q?95ehkwb0Mqb24SpN2bZLE/sFnaq8pcyCg2VdB0QDiaM2e2Dg3IagQbF1WYX7?=
 =?us-ascii?Q?b8Cn9axkaJEZOq4A8jNdSc4Oy3JVgCHETcN22suGL/CeC47zczJ31v3efJof?=
 =?us-ascii?Q?Ju1Pk0vdRo0UGhMuejI0C1kJXmqilvnfytYhdWakOlaZ6i1SHrmFhdPrYsSq?=
 =?us-ascii?Q?Hr+8cszws2ntUwzbg6nqMkgOv1/bPb/ZqIutbsgI/Zp7JIDUGwBYQlhMPd/6?=
 =?us-ascii?Q?AnDvrc7vtLlukoxJ/RqUGb7mxJ/7G/yHnkdstfVm1aLYc7OIRv5F6H8H0EyV?=
 =?us-ascii?Q?IHMfraEHAFeo7MPIzpSZbFji1BGG+fXd5MmtrS+lZjZEFTQOi9ffWhUL/GYk?=
 =?us-ascii?Q?x5v/VLXCSfQKgROUqu3MeVE=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e1dbf3cd-ddaa-4fb2-c2a3-08d9cb3989aa
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2021 02:10:23.4582
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 wX04FhiP8PuwkscqOoDX1JYO4uGTcknScHh+QS0v5g1IuCns1neQzWbwA2w9YkfyB8WoXsDBBaYUuo4sb8VvRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4961
X-Proofpoint-ORIG-GUID: 5_MINFs3ayBjW5bIyj2sw0_KevMJV2zw
X-Proofpoint-GUID: 5_MINFs3ayBjW5bIyj2sw0_KevMJV2zw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-29_07,2021-12-29_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0
 mlxlogscore=999 clxscore=1015 mlxscore=0 malwarescore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112300007
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Dec 2021 02:10:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94564

Run autogen.sh to regenerate configure for bundled bind. Then we can
avoid copying config.*, *.m4 and libtool from external. This can also
eliminate the relink warnings in do_install:

  libtool: warning: relinking 'libdns.la'
  libtool: warning: relinking 'libisccfg.la'

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../dhcp/dhcp-relay_4.4.2p1.bb                | 14 ++-------
 ...ind-Makefile.in-regenerate-configure.patch | 30 +++++++++++++++++++
 2 files changed, 32 insertions(+), 12 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/dhcp/files/0004-bind-Makefile.in-regenerate-configure.patch

diff --git a/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.2p1.bb b/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.2p1.bb
index c86926813..f374d75b3 100644
--- a/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.2p1.bb
+++ b/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.2p1.bb
@@ -18,6 +18,7 @@ SRC_URI = "https://ftp.isc.org/isc/dhcp/4.4.2-P1/dhcp-4.4.2-P1.tar.gz \
            file://0001-Makefile.am-only-build-dhcrelay.patch \
            file://0002-bind-version-update-to-latest-version.patch \
            file://0003-bind-Makefile.in-disable-backtrace.patch \
+           file://0004-bind-Makefile.in-regenerate-configure.patch \
            "
 
 SRC_URI[md5sum] = "3089a1ebd20a802ec0870ae337d43907"
@@ -30,7 +31,7 @@ UPSTREAM_CHECK_REGEX = "(?P<pver>\d+\.\d+\.(\d+?))/"
 
 S = "${WORKDIR}/dhcp-4.4.2-P1"
 
-inherit autotools-brokensep systemd
+inherit autotools-brokensep systemd pkgconfig
 
 SYSTEMD_SERVICE:${PN} = "dhcrelay.service"
 SYSTEMD_AUTO_ENABLE:${PN} = "disable"
@@ -50,17 +51,6 @@ do_configure:prepend () {
     cp ${WORKDIR}/bind-9.11.32.tar.gz ${S}/bind/bind.tar.gz
 }
 
-do_compile:prepend() {
-    # Need to unpack this now instead of earlier as do_configure will delete the configure script
-    rm -rf ${S}/bind/bind-9.11.32/
-    tar xf ${S}/bind/bind.tar.gz -C ${S}/bind
-    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${S}/bind/bind-9.11.32/
-    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}/bind/bind-9.11.32/
-    cp -fpR ${S}/m4/*.m4 ${S}/bind/bind-9.11.32/libtool.m4/
-    rm -rf ${S}/bind/bind-9.11.32/libtool
-    install -m 0755 ${S}/libtool ${S}/bind/bind-9.11.32/
-}
-
 do_install:append () {
     install -d ${D}${sysconfdir}/default
     install -m 0644 ${WORKDIR}/default-relay ${D}${sysconfdir}/default/dhcp-relay
diff --git a/meta-networking/recipes-connectivity/dhcp/files/0004-bind-Makefile.in-regenerate-configure.patch b/meta-networking/recipes-connectivity/dhcp/files/0004-bind-Makefile.in-regenerate-configure.patch
new file mode 100644
index 000000000..d97b2f7c4
--- /dev/null
+++ b/meta-networking/recipes-connectivity/dhcp/files/0004-bind-Makefile.in-regenerate-configure.patch
@@ -0,0 +1,30 @@
+From db4bfa34ff6e083936bc7d62908790b4d9f0ed8c Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Thu, 27 May 2021 11:38:36 +0800
+Subject: [PATCH] bind/Makefile.in: regenerate configure
+
+Run autogen.sh to regenerate configure.
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ bind/Makefile.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/bind/Makefile.in b/bind/Makefile.in
+index 1058160..f9c9f86 100644
+--- a/bind/Makefile.in
++++ b/bind/Makefile.in
+@@ -55,7 +55,7 @@ bind1:
+ 	else                                                            \
+ 		echo Configuring BIND libraries for DHCP. ;             \
+ 		rm -rf ${cleandirs} ${cleanfiles} ;                     \
+-		(cd ${bindsrcdir} &&                                    \
++		(cd ${bindsrcdir} && ./autogen.sh &&                    \
+                  ./configure ${bindconfig} > ${binddir}/configure.log); \
+ 	fi
+ 
+-- 
+2.17.1
+
-- 
2.25.1


