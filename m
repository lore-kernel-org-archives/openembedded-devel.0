Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3C0FC43217
	for <webhook@archiver.kernel.org>; Tue, 28 Dec 2021 07:38:29 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.36236.1640677109473588280
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 23:38:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=hyE2yrOt;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=7996075b3e=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1BS7cQVT001235
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 23:38:29 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=CvVZthcIPQBCr/dbXz7nSXhTO3JQudWBHP0czKOWYc4=;
 b=hyE2yrOtgeD9RIn1AO4iTeEYk+9qYWPoEQPrgjySKxZr6ZUzVAKj3y/XjPxeG9SN+4OL
 AKnQ90pOQRtJbdTNH8HVwmnRLxJE6L7+tAQygGqACapAdYCA2AvXCPn1naAUFLtmlXpV
 RZaIq0MzGIEKq6JkSFMEopWq7biOALRD2iQfeD2zMzpfyWXcQvn93OygisP9zA4I4V3J
 Taq2ORWzMe6mWuBm2NhvZ/dlFvEvmAD9GbEjQTe8eHqkGnv4qmL7JtkS1kakMHSnoGT5
 gF4nEeekEiMdX9uQMvNv5769OGmShZyVOpJG6DYJpMxpOpiLoOCSnsZzP6oGV4lssd7d 6Q==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3d7kpw88n7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 23:38:29 -0800
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 1BS7cSPC001267
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 23:38:28 -0800
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2109.outbound.protection.outlook.com [104.47.55.109])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3d7kpw88n5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Dec 2021 23:38:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nIzxDRLdbWlA+kcLFLdufTVOZT4oskqDAGAEVL1lEy6fv4Z+KYrJJP+4363YSBvh7SoJVDVm2gfLOt7Evt9+TidAll+HkH6UAl1hCgJwjALVFo318XMRehdLqVbbpbI3CiRe/w2Yqe5W4WT8W2wvdVwXae8ax/qyNjHEUzRzurt2DmFYeS3O+z2okuuAicQCbyC+20xkq3pY1GBPTmmJdsj7XZT2C45ZA3GrMap2rHlsit5ovybs4EmUjzteUXpF8iMm8eTivOkInDfh8HmWiwYYIYDpnfPrMWjUKF51+CxyNOnisLe5g1One2zAcPRSZ1/ZaSIQEL1pej9p1ksPFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CvVZthcIPQBCr/dbXz7nSXhTO3JQudWBHP0czKOWYc4=;
 b=clYAjWCfWmel+NKV9fIR0HIitE6oFAvVEK/kThc5aDp0yZfuKKNJwIC1t3RzCt6unGNnuRH4DBcV/uC7OfdAsWYl4C5q/gtgf4te+Fhr/x1Mx7mHRCbf38rTrryWroP/MTEvrnN/BiUvetvL6H/rld/IsEad4kP5Ww0rEXSo1spQI//v0A4B1HXt3bn00D4CVEZK2kZlryJ4owNoQBx5TU2IUCPbneW+/g+YDCdAOyVSB5ot7WD27fpQWZ9sloI/84dFANn6lY/9UnJI4bZ9t5jC5mSaHFo0Pmi4rFm/B8grDjqaJGBUkIOEXwvFPvV779tVIOZmwOWtSO1/sjYtmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MWHPR11MB1584.namprd11.prod.outlook.com (2603:10b6:301:e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Tue, 28 Dec
 2021 07:38:27 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::8962:26c6:20fe:eaa4]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::8962:26c6:20fe:eaa4%6]) with mapi id 15.20.4823.023; Tue, 28 Dec 2021
 07:38:27 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org, akuster808@gmail.com
Subject: [meta-networking][hardknott][PATCH 07/19] samba: Solve the dependency
 problem when installing Samba
Date: Tue, 28 Dec 2021 15:37:54 +0800
Message-Id: <20211228073806.868759-8-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211228073806.868759-1-yi.zhao@windriver.com>
References: <20211228073806.868759-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR04CA0057.apcprd04.prod.outlook.com
 (2603:1096:202:14::25) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1fb8e643-445b-4fba-3913-08d9c9d5099c
X-MS-TrafficTypeDiagnostic: MWHPR11MB1584:EE_
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB15845C6CB963D1C6B915C7BBF9439@MWHPR11MB1584.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1169;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	j7r+kQrTauC0gafPii13xDuVIBAYOSNqrP64oer2GR0/HnGjhPAsTrFkc1atJN/lMHqCLLUqCB3QAZLGT6gaQ/AV8B5pc6Q7ubeXgtaDIQRliXAKjnSewSw3fZ4pX15u5PdIalaAeGW+M9EfF8RnZeDYvSkRCNxWqcWQa07ONjsx6ebGtVQ4fbqVFGPkvm3vL2KTFb9uWET5D/QKL9Sh3JeuVYYdZ4MYPWlKH9WbjPAmYo7LbHWoN9KUWTgUogTlOJ0/SQR0UIZ9IqaHXMmKQnfL9mvjEZ/v/yGmyILxKICD2i5vA1w0Z5WR9zGrFW1KtCSNp9PEzJi9yFLyx00Gg5hSC1HUz025wJIi/yuZV4ky5+EdOUDPFGOaOxFK9IIeE1TyBd3ZXnWvOqtYiAjGoltv64oB8NOioXoSbSRDnLo5ylmu50M6VEMeRTvbzwQym8QuJx47yYfa84UN+DZNfMsy6LGFLydRzazv4zQxbQPs/0ztju+lWwXSOkwzG+UehRF8MvUSsR6x/DGmrgkMaQGx1P0wdABuaWl1xwAL8/iPVX6rAJh7FejcKx4O31fGh7fqn+sKbDtCEyMzOBcPOwe5mHhtWIXfQoPKRUY8CV6isqZI2IT0kLimv0kLzcogPoPTsweDfmGbnyNW9WZ7fovPsoQNLdpqeoXnOVzWutnZi+Oh1DAasAyObximFewtGdH3tImCdikC/k8LD6gSyQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66946007)(66476007)(66556008)(8936002)(508600001)(83380400001)(2616005)(44832011)(36756003)(1076003)(6666004)(8676002)(5660300002)(52116002)(186003)(38350700002)(38100700002)(6506007)(6486002)(6512007)(2906002)(86362001)(316002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?38Pc0uWeKKdA3vIxyLA7CRXmc+wt2izfkAtDkTIRfD73afIw03tr3IWh5oiU?=
 =?us-ascii?Q?M8TzuocIEW2T5qhup9zl/TFFUogLBBjxSRqhJxkPwLf/7oughktB95T6Uvdd?=
 =?us-ascii?Q?hXHJHKLqVJ60j3l4hRtVuoQAlrGXo6YHnUc2q6FYm3lP3iSDQNmztAklpiqM?=
 =?us-ascii?Q?XQCOYn+Gx0hUt3pUMZ2QK6BuK+DTLyrxJIReBFw293K/yRdkYKSv28oHwwqJ?=
 =?us-ascii?Q?qYAiFzNVRiLfRN50TtczqeWRMVLmkuDPLlHtXdG0xzep0iHdBc7m9atQpqsm?=
 =?us-ascii?Q?oNEdpmz2XrSxPeJ1PjAAfUQa7XYObdkg3VONFJtDFn8+2X9UBkc8Te/ieBx9?=
 =?us-ascii?Q?crJK4++f3cVcj0nL6WaVlkhIbYxy0CB0Im+1ow8sUxYzbEeKMVB+raw7WMmY?=
 =?us-ascii?Q?hwy93CutzShFuO1seqbC26mQwRdNfncviYt0t34o4wWbUq8N0FnobbBoQlPh?=
 =?us-ascii?Q?QcsZeDXVEEEv3pfKnOgzaWwKWF26WNXFUVFhXQpaHm9r+rioZFn/Qnqvlgtz?=
 =?us-ascii?Q?VRIJN2SafWq65m2x9LqBuMxFPRT5+zsmI5l9DptewX/bjTdHiJLjoz4iQMkB?=
 =?us-ascii?Q?A8gObSRYfad3jUwHMU3fh2vIl9V7Ahk2PT0F0Azndmqf/uRmfRQMwFEVNYPs?=
 =?us-ascii?Q?nfyvVYsnaPYZWt+uD8i3KgiXsHpC8gOvD0RZ0MtX3x2BitsRM7Q5a9kK3Qo5?=
 =?us-ascii?Q?SoFRsKvCKSJ79d/1k2TXOd5t7wcL3lyb2I0RJ3opOlEY/SbgxwJT/EkXtG+8?=
 =?us-ascii?Q?Y22VksW31Zucn7biIzLMDzoFtcLUvEixpHBj7bFQVkMOwKoTp3GQqT0myyz1?=
 =?us-ascii?Q?roedmFEwy36hBPM+4SSlcK+oAZ3GQPIfv0f1tJfXLTMecuzGGXMRBlMMggpO?=
 =?us-ascii?Q?fMDjnqsRWivGMuu4ttd7yhhnYpR09odmrNPgHTZjfytdNRaJNOnDND7OJ0tl?=
 =?us-ascii?Q?p6zb4u1a0DyYFDTfnWVaKVqp8nZ5iqAFV9AaAv4jw8qtrDPkVp+23rabMYxY?=
 =?us-ascii?Q?0m4HcT/bvCKk75wI/KQ5yu9KRrxI/Al7P19oVARZIoX6gN67+TwKaVr8sjPd?=
 =?us-ascii?Q?2vgoRS0P5g3FzkIrXU/pQZUpbIkQ138uCT4TUnFEUpVkUq6NR5hBmIHiq45p?=
 =?us-ascii?Q?yjlD27pxxznTMMt+Jzgr9s8lLoJHrvjnXMFh6JGtnPgM2VFoH4IoVUnk205n?=
 =?us-ascii?Q?TLJUmODhQM7tIn3z0HAwgli47QWd/G++yCHYnU0t0dt04ZewZT54xFUiFniC?=
 =?us-ascii?Q?Nt3cNW3GN8ClJp4G8V3EhvRTn9GZA3ZbYpGBu0hWXcN0dey8ndWb+z7EYAJA?=
 =?us-ascii?Q?cRer6PoZBPCiBmLESuAG5y+2T+6jsHNIZuJ+LpKu9jvJnTz8R/nUDVnTmdxu?=
 =?us-ascii?Q?heYck8lnEvs8bKtJCyCVW2pE/uo3H2/KRPtyFu3AOSr52gW1OViPTe5Sieif?=
 =?us-ascii?Q?bqvWfJmE9NugHTAfcHL3kE9evq1dUL7MgpNQxE09+LDxbuuft0DlzdxoFf4Y?=
 =?us-ascii?Q?ZzryuIVGhAyH6ye0QM9RK1U4vtaTt9yeKDpmWYnmtDWX0XTh8uQOrC9i9Cby?=
 =?us-ascii?Q?6IIRE8UmVEUvrFCcAOw0gHDYe7T+EUYlY1fB8R82ENCmDYwXt5GrsWdk98Op?=
 =?us-ascii?Q?kls/QwAUBmpZqeohfg1vbmg=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1fb8e643-445b-4fba-3913-08d9c9d5099c
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2021 07:38:27.7539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Y9cy7bM5L8J3N4a1KUYzEI+Th9BMqsvBwQh1ss00MsfLN2ZcQpQxZPMvmLXqb5SLe/15LH8BY0afvIqxdnj0fA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1584
X-Proofpoint-ORIG-GUID: ccpTEoE-tnZWWyBEH7B1EqY0EAxiPBTU
X-Proofpoint-GUID: PmWj5vwRe6EF4lhZ3rr3fQQtTwW3NUOb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-28_04,2021-12-24_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0
 mlxlogscore=999 clxscore=1015 mlxscore=0 malwarescore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112280033
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Dec 2021 07:38:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94534

From: wangmy <wangmy@fujitsu.com>

Error Message:
 Problem: conflicting requests
  - nothing provides samba-pidl needed by samba-client-4.14.5-r0.aarch64

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../samba/samba_4.14.5.bb                     | 22 +++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.14.5.bb b/meta-networking/recipes-connectivity/samba/samba_4.14.5.bb
index efaf4f2a1..82108842f 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.14.5.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.14.5.bb
@@ -39,7 +39,7 @@ SRC_URI[sha256sum] = "bb6ef5d2f16b85288d823578abc453d9a80514c42e5a2ea2c4e3c60dc4
 
 UPSTREAM_CHECK_REGEX = "samba\-(?P<pver>4\.14(\.\d+)+).tar.gz"
 
-inherit systemd waf-samba cpan-base perlnative update-rc.d
+inherit systemd waf-samba cpan-base perlnative update-rc.d perl-version
 
 # CVE-2011-2411 is valnerble only on HP NonStop Servers.
 CVE_CHECK_WHITELIST += "CVE-2011-2411" 
@@ -130,6 +130,18 @@ EXTRA_OECONF += "--enable-fhs \
 
 LDFLAGS += "-Wl,-z,relro,-z,now ${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
 
+do_configure_append () {
+    cd ${S}/pidl/
+    perl Makefile.PL PREFIX=${prefix}
+    sed -e 's,VENDORPREFIX)/lib/perl,VENDORPREFIX)/${baselib}/perl,g' \
+        -e 's,PERLPREFIX)/lib/perl,PERLPREFIX)/${baselib}/perl,g' -i Makefile
+
+}
+
+do_compile_append () {
+    oe_runmake -C ${S}/pidl
+}
+
 do_install_append() {
     for section in 1 5 7; do
         install -d ${D}${mandir}/man$section
@@ -195,6 +207,10 @@ do_install_append() {
     if [ -f "${D}${bindir}/samba-tool" ]; then
         sed -i -e 's,${PYTHON},/usr/bin/env python3,g' ${D}${bindir}/samba-tool
     fi
+
+    oe_runmake -C ${S}/pidl DESTDIR=${D} install_vendor
+    rm -rf ${D}${libdir}/perl5/${PERLVERSION}/${BUILD_SYS}/perllocal.pod
+    rm -rf ${D}${libdir}/perl5/vendor_perl/${PERLVERSION}/${BUILD_SYS}/auto/Parse/Pidl/.packlist
     
 }
 
@@ -301,7 +317,9 @@ FILES_smbclient = "${bindir}/cifsdd \
                    ${libdir}/samba/smbspool_krb5_wrapper"
 
 RDEPENDS_${PN}-pidl_append = " perl"
-FILES_${PN}-pidl = "${bindir}/pidl ${datadir}/perl5/Parse"
+FILES_${PN}-pidl = "${bindir}/pidl \
+                    ${libdir}/perl5 \
+                   "
 
 RDEPENDS_${PN}-client = "\
     smbclient \
-- 
2.25.1


