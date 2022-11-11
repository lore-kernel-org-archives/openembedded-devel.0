Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3843EC433FE
	for <webhook@archiver.kernel.org>; Fri, 11 Nov 2022 08:22:42 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.3275.1668154954102053900
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Nov 2022 00:22:34 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8314de451f=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AB6LZhL023583
	for <openembedded-devel@lists.openembedded.org>; Fri, 11 Nov 2022 00:22:33 -0800
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3knk43ddx9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 11 Nov 2022 00:22:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UjOIvN1kImmI2ckhYuosf8oMh9PJ2KOLpR97OsktbhekTJybBsOu09r8I/OMaUXOvKSCguW4EpIxTXEmSyDKQcnNIA5DHIXoJMyAPuogWDt+gS61YF+QLJq0gtpts69yfjBHjVfCal/ks6qNL449I09jt5AqdNJFR+cSJ2kGsCGSteFN3PtQ1QPKNNOOIP/e8YilS+zAz6K0DYRhq0cxGTf88niR1bo+ohYQaenYnKKhR6oRC61xWKUvcTeUe4gGlI93ae7L3nGRmMVk2LNXGy7U7ve14qi4ZHu6Q2pmPHSfm9ypWkFtZL1IawJTj4k0H29LL93odSYTJD4QvbLuPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UBEWbwgdnXqqlwzfg4vWos5xRp2GLmrjCGGq3CTwnis=;
 b=DfRu89nF3hXTRRAVoY5pOj/pB1UmLWVMf0uQL1ucSPrM77SVR1eyfSADqXpupTSd+AoRyO7VMvgZFT6l233qcuZT5Prc5qOj4y9vTeLrI5k83Ljq+7jlyE2xbWEyTWuW090Qk9U4inoJ0i2TPgw6oI75YEpiuWSgN2zcDmhWsdqLPhMjY9IJF9DuLl7JHltBM5PI4xUrhabmXlfDPqieiu0NI9lxQrZbRQrhtRKI1YzIXejpYF2dArD37dA3FIeuqBGhX/KxO745VEo3XU13JyKJ9vg1m26BMbGAV1ailCZes3pvpSsVz3Xh1mgTTYj2xDTzNa5vtw39HSiRfSSe/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by SA1PR11MB6565.namprd11.prod.outlook.com (2603:10b6:806:250::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Fri, 11 Nov
 2022 08:22:30 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::d252:a0d:467e:ad16]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::d252:a0d:467e:ad16%3]) with mapi id 15.20.5813.013; Fri, 11 Nov 2022
 08:22:30 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-networking][PATCH] lldpd: add ptest for lldpd package
Date: Fri, 11 Nov 2022 16:22:00 +0800
Message-Id: <20221111082200.215065-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0098.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:3::13) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|SA1PR11MB6565:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ea1d174-ca3c-4887-f93c-08dac3bddf3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3Xoenb7fRjEBd5DR9G8metewkrs2ywh1tza6RvgeTHQfgGzl3g3PThtgOUNiQ3KiKO23Q0TVkYfD+b12r7CqJOEMkhTjY5n5A/jl/jszLw5JALWA3oRsaFgYjD3iRKuCUNSEVbKReJaL9pOexRd42iM/7r0547L5mv4WSWwxgU2B7mY0Bo9tRv2/yIDz+CboBMt22dWvbFn03bmPepoeJWAGhAK60GZqde6KuGlx0h8+FT2gZgP7nxfk6Xb2MjV0nboevibBkXg8qOZzhyqwsl8MmU6jmk0aKrxlaNZ8PlM/T4j3YKKH/yMz3wrB2zTFx0ticzqPHA9JMDHouUEv26TWQIvZFPMSrMdfnqNgYCTuVnv+aJbLXiBJyaqpRWEUSWztmQ5fAjAFr9Ps3wDqCAt45IGs6m32BaPaQ6XgJdrDEOUc82Ksmb5IG2carxwzFSYkGfy1BXhTESSMBXwdzOSuN6szsD4kGWKPUeIDqDf4pvYVTZXmMcLDys1HUhVlu/x28EKApxCaJaz+q/jM0Vv3DLE7HAbtcfxRzzAB7sNVORAw0gVD4Vqv9BNB7KSLijnegCim5MmgH2zi+nI/QM4RhxosGvEWacQ+bwpQqaqq8f/Gf3GHJp/+HggjVaV7YtbeUA8JhyPffY2OhciaTriD9Rw7pn5JNwB64qaSGacbDJl2pK6jiqf1kB/sJlwZXTqlDN0X6Ifk6TRy6jYE9q0jrOXWiLgZKmLwSTyVIXnQJBpzbIMft2SoTqoI/OFOTlRX8u+UgIaHKLLY6jrYyZqcGACuh0f8TsY0JVP2wig=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(366004)(376002)(136003)(39850400004)(396003)(451199015)(83170400001)(6506007)(2906002)(6666004)(44832011)(38100700002)(38350700002)(41300700001)(6916009)(5660300002)(1076003)(8936002)(186003)(478600001)(83380400001)(2616005)(66476007)(66946007)(966005)(52116002)(26005)(6512007)(66556008)(6486002)(316002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?E047mkbr3DgM2TCn62BZVTSoAl6hYjyqEXULxnvjW7N+7vdEbIsf15MOuYYG?=
 =?us-ascii?Q?U27DoUPuKEWFmtZHO7J0DrXjLAqlij5QefuvFNlmeHdgfeu2VG3SORAlbGUX?=
 =?us-ascii?Q?XwomR1V0PEYWdYmm5O0S33eFMipDYP5RAtxiQhEDKFULulk/WkyaZKRrkXNf?=
 =?us-ascii?Q?t1oxa/qLM7/h849myZ9J7ahnvKtGJdnP0xlng80FDq4JoD8nRG5SA8i0onFq?=
 =?us-ascii?Q?QWQXevzJDv33UbiNmP7aAJtj/0GXkafbB5WbYHI6cnZZCLtu5wDqsdPpbwRB?=
 =?us-ascii?Q?zBd6u0W+ec/f/cG6KZ9Th8jzd4qeFpbHWKckoRCMllrOst+WU9n7KWxWe44h?=
 =?us-ascii?Q?V3MbUjKi8MFpYYEVFPtsbEf13ZOT+md9xRa+J4bkszdmbpt+Ncte36nMdqLU?=
 =?us-ascii?Q?rfOAtyd4hRFTcOJcHRc9ZlBR1DQ87q7uuekKyNW6laFtlHu+SvNC0m0yPJvn?=
 =?us-ascii?Q?ERN9JlR8tsvzq5KkQt9LSzQWW4YkW12px5Tcdm3UlOQA4ZnHgEmS7dc53sQN?=
 =?us-ascii?Q?TncGpLM3t8xOnt6BOtIHhx99ofyXIUcAX4RhKNiP22LNIGgUSx9b/KbmHii1?=
 =?us-ascii?Q?LPpGZx5aTWCPylqb1pr98sG5Ar9dT2mtk9YOpEH8Km1uZuV1z0I1VxefOf+6?=
 =?us-ascii?Q?3PM7luuFMWqI6bD1DMdvHVfZScqphaA8gCB1jQyG/IDAFpD2XDAlO15xgiYP?=
 =?us-ascii?Q?LzOO84qmYor2+OevVLiR5B6jo3PFmY/dQADoCJwmE6Gl6+SACIlaT3rpbcPV?=
 =?us-ascii?Q?+v8X/arnG+X/S2BlIdfIOh3mKCfoWUoErlwTCDB+OsINiy/rPikDTleLj4kJ?=
 =?us-ascii?Q?kpoU3MbX5ditMbe7+Gze+CKS5xGxMyTBKseGlHHtIZyADL2nH5EtxJ0bAjrF?=
 =?us-ascii?Q?Ig+UlOzVZyLhBebUnc6qOakZp25OiYJbSUAYH64hx5V3RkUh3zY7uuDf9nSw?=
 =?us-ascii?Q?nB1E0edqIi8XSM2b3kzq4xSDxWezX/uUlF+3VDZz5kQztlcR4kETrn/HhpET?=
 =?us-ascii?Q?mYIvewjkGLUSxxyh5Mf+MTR3kAHYVGzpNWjtVMvif5zapebV+sPIgu+6ApNY?=
 =?us-ascii?Q?Sh189U9k1lrdO4lD4a4XPEX/nUK3AhfAaa6tGwvo4YPAH9AcJrZFSGE8vq60?=
 =?us-ascii?Q?llvJenBaeb5hpTwmtKjzpWy4XeoTM/rpUJE2BTnvpmDdkzrU2N38musy32np?=
 =?us-ascii?Q?Oo0CvcTZ6psy2u6/yjuFYU76ei1IjIPMzAkjrHuvl2xa0bUIWPOJJD5LqsuU?=
 =?us-ascii?Q?sQZAMQXfqcErOEf0jZGvuprUnX/24Mp0e6Z1fZJ/yJGueUtZZaxBhj5lBpnc?=
 =?us-ascii?Q?P+FK2bCa+NWqf1G0lLaorKJky8oX98h/6e2sbvPqp7r65s6xD29pMy5KNkBh?=
 =?us-ascii?Q?ygyin/dD7u8FoiMQeuJ3MeD5TZHmfOv1QpkWG84os+iwp8t/GjDzXxSNqQ4N?=
 =?us-ascii?Q?ST9bAAPC0ElQneWJ1PX4uqXC2CYf9WY2vRdnUaNKhhGoEezXsQfJCDMOgJJ4?=
 =?us-ascii?Q?zIjGfSMSls7n4ITEBHNPLVmzq8VrlS6j1RCdTFQzTAaP1QMqxTuNv/+gP12S?=
 =?us-ascii?Q?fFjGGmETMZKBUKfEtnYUkGokhu/sCpU3fuF+2tj+TGWaG7DjoVyXEOl8CJ3/?=
 =?us-ascii?Q?fA=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ea1d174-ca3c-4887-f93c-08dac3bddf3a
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2022 08:22:30.2138
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QaFYafvC604fX/tf+NIZa8lNJBKFIbOU3bdWImu4Wbt5kPDxNvEKGCf/+vYvLeEyb+crbzgN724FdrZuwHp5xmI/NsIm7RclkfF/aM4l1Bo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6565
X-Proofpoint-ORIG-GUID: trxKM4KUsQALY9CSPf16uiAT0FdNyZEW
X-Proofpoint-GUID: trxKM4KUsQALY9CSPf16uiAT0FdNyZEW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-11_04,2022-11-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1011
 mlxlogscore=851 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 phishscore=0 mlxscore=0 adultscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211110055
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Nov 2022 08:22:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99553

Signed-off-by: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
---
 .../recipes-daemons/lldpd/files/run-ptest     | 16 +++++++++++++++
 .../recipes-daemons/lldpd/lldpd_1.0.15.bb     | 20 ++++++++++++++++++-
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100755 meta-networking/recipes-daemons/lldpd/files/run-ptest

diff --git a/meta-networking/recipes-daemons/lldpd/files/run-ptest b/meta-networking/recipes-daemons/lldpd/files/run-ptest
new file mode 100755
index 000000000..da686eb46
--- /dev/null
+++ b/meta-networking/recipes-daemons/lldpd/files/run-ptest
@@ -0,0 +1,16 @@
+#!/bin/sh
+
+num_fail=0
+
+for test in tests/check*
+do
+    ./"$test" \
+         && echo "PASS: $test" \
+         || {
+            echo "FAIL: $test"
+            num_fail=$(( ${num_fail} + 1))
+         }
+
+done
+
+exit $num_fail
diff --git a/meta-networking/recipes-daemons/lldpd/lldpd_1.0.15.bb b/meta-networking/recipes-daemons/lldpd/lldpd_1.0.15.bb
index 6a3687cf7..c7237d74b 100644
--- a/meta-networking/recipes-daemons/lldpd/lldpd_1.0.15.bb
+++ b/meta-networking/recipes-daemons/lldpd/lldpd_1.0.15.bb
@@ -9,11 +9,12 @@ SRC_URI = "\
     http://media.luffy.cx/files/${BPN}/${BPN}-${PV}.tar.gz \
     file://lldpd.init.d \
     file://lldpd.default \
+    file://run-ptest \
     "
 
 SRC_URI[sha256sum] = "f7fe3a130be98a19c491479ef60f36b8ee41a9e6bc4d7f2c41033f63956a3126"
 
-inherit autotools update-rc.d useradd systemd pkgconfig bash-completion github-releases
+inherit autotools update-rc.d useradd systemd pkgconfig bash-completion github-releases ptest
 
 USERADD_PACKAGES = "${PN}"
 USERADD_PARAM:${PN} = "--system -g lldpd --shell /bin/false lldpd"
@@ -61,3 +62,20 @@ RDEPENDS:${PN} += "os-release"
 FILES:${PN}-zsh-completion += "${datadir}/zsh/"
 # FIXME: zsh is broken in meta-oe so this cannot be enabled for now
 #RDEPENDS:${PN}-zsh-completion += "zsh"
+
+RDEPENDS:${PN}-ptest = "libcheck"
+DEPENDS += "${@bb.utils.contains('PTEST_ENABLED', '1', 'libcheck', '', d)}"
+
+TESTDIR = "tests"
+do_compile_ptest () {
+    # hack to remove the call to `make check-TESTS`
+    sed -i 's/$(MAKE) $(AM_MAKEFLAGS) check-TESTS//g' ${TESTDIR}/Makefile
+    oe_runmake check
+}
+
+do_install_ptest () {
+    # install the tests
+    cp -rf ${B}/${TESTDIR} ${D}${PTEST_PATH}
+    # remove the object files
+    rm ${D}${PTEST_PATH}/${TESTDIR}/*.o
+}
-- 
2.34.1


