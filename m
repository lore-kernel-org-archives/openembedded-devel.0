Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3340CC021B2
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 15:34:43 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.10961.1740497673331210393
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Feb 2025 07:34:33 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=41510be863=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51PCplJZ031691
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 15:34:32 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2047.outbound.protection.outlook.com [104.47.55.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44y5j8bs0b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 15:34:32 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mE5iwcOEw8QMAxg56T9pSFNaTyRUfRs0znsFHsHJrm7YxXUo7kgdKCPUt/9TrDvCezVnQVc0NyH3uVwKm77kYO33vvkWfyHwswS41VDVmfEdvOcRCMZM4+teq4e3K5+QJS5uNv327DeWBuzWasxOsuOExVvEK6lWnoE9XgXVACUetfAMyTJXkSTCs6tOIJo2iEdk1saBgjlwnEqmtxWhk4A+/Be2NPAwZ7zlusbcN1UdCOIEcJqCWBUuYABL9IIdROaKy4pnEY7sWsD3QqKkFLzTtRE7fruq6WSdeIVWCB0e434w7pH86XtaqyOZh/mjj6q15v7pAhYHOf+buOe25g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yBYvzzeN3V3CXRa+C+sbYc3g5LfN3vMlX7SklylZJFY=;
 b=dQpM38K3fLiQL8M1bqYrjFkr6GogJhEG+2z6Rnb9T7D4v+OSynhBFKTa5p2KjRZ8qvjoJyJ22U5+caGG53vXA7gfus5nyvef2CD/jJF2Ul95UEeNrhOzeVWkbdjBRH+7l2jBbjvrXhhJtEIYWGXbvD5OmFNjLNgUI9m6wG+hkEpFw1czN9WNhEALxiNVWoVIt7JdJJrk4JbEx3e7sCnTeNKnODma9RjYhKpQQceojtObh9OGpunmFOcQiPjjSLuctWaa+fT1tdo4evqA8fhPkIdPkRcsiTZYavsxpYOpcENdK/Sv9jgIXwLNWssYl83kSQaJRIMU3Pug1Vbd91oXbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SJ0PR11MB5940.namprd11.prod.outlook.com (2603:10b6:a03:42f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Tue, 25 Feb
 2025 15:34:27 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 15:34:27 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-initramfs][PATCH] dracut: upgrade 103 -> 106
Date: Tue, 25 Feb 2025 23:34:13 +0800
Message-Id: <20250225153413.3805182-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0192.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::18) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SJ0PR11MB5940:EE_
X-MS-Office365-Filtering-Correlation-Id: 293edb1c-7d3b-4e12-f2cf-08dd55b1e373
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?isGeqitjErgf2ap9qXjyUXCzclO/7K4YYUhHTLqaW9imX07V0y6KmETYHEbp?=
 =?us-ascii?Q?8CVtYU9wtkShl7xgULD2gkMA0jC0iMvf0F2ImAYYMnpZqW3vFLc3RYQo5g3x?=
 =?us-ascii?Q?y3PZC0cIt2h9wriFAOo5Pdh0XG/e94E8Npc8Cp5FY52EenjJc6AancrDIgCV?=
 =?us-ascii?Q?P54wepVO2WRJewHrY53OUMWjVtu8q4epbzmL3MtJexaJL1CKFyr+IRgE9EnX?=
 =?us-ascii?Q?trVveHDbtAQkGdMD3QcRpEx7gjYpT7sjr5vQyn4a9GMo7UWBrtnuZd9Y6crn?=
 =?us-ascii?Q?F9pRxfc9jFgV/T7/Qo5r8fYbiZwp+UTp1nJVKDGUmkklt7VAPRX8Pyq9vgE/?=
 =?us-ascii?Q?x60egmhlGRQlQ2pk6y2MI8jKdrl0jKsc7q/omrWJcp+i3ZaQepJgZ/Wicfh1?=
 =?us-ascii?Q?fKcC5a1LymgbgFxpxFLi+GXcZvGTYv/byfTPH6S7RxhPZ/tuNCwpIz4oawoX?=
 =?us-ascii?Q?3Q93XUzImJVpUxGFRUGLEIj2v0MjMIqOWOAgdK1x/fE3AyadqdMQc5WmBAWK?=
 =?us-ascii?Q?UbSfIxqZyFC4iGI0tBl5G42sdHA/8YOjE2pdM3evmcSM+k1qvimGltE3afhR?=
 =?us-ascii?Q?FLB4bLEIsZA6NaM590NHe+jS4zQejLDY9S3By1rmayIb8iTMu7sQbZSbsWbY?=
 =?us-ascii?Q?rjD33zR6JhfZaZbXmlpLUUbAah4YKRmqjFP9DQ+E6Lz4qayrCzxdeQD/SorC?=
 =?us-ascii?Q?bzd1lcNGSeSmL3cjdcjLbhgNpckPg1Z+ag9WA7kw/DbQGwtZNQ6qCgmQA9Lt?=
 =?us-ascii?Q?8roK0BRVRq87H9aVwJQA+dbFhfO2j5sorfZA4xgxusFdpUtZjmbFhVFCGhWG?=
 =?us-ascii?Q?qdsMNN2g1COHe/8LaKk/fW2AA8lh6SKQP8d5SJHPTsoSTCdjeJIF20lQV2OM?=
 =?us-ascii?Q?Zj8PD1cQh1aT1DNqSu9Cay60E0UfMyCPDyOt7m6z3Yv63fcJnSjX7h6InBe8?=
 =?us-ascii?Q?sbgFu0ttewEk7qdeojNtIcgSbSmTh4UVdN9nhWLtpmJT4+i1/oKfPnNuMu5Y?=
 =?us-ascii?Q?9xuiU8oJNybiNN5RroTKcpcXokDayTtx3sWsa7LkY65gU194/ugn2Sfu905a?=
 =?us-ascii?Q?kdvLQ/6zqkGkhl5HTfKT9/TUcs6Ics+wUyvf9FPAcGVKxkd+4y95d+UUpLnK?=
 =?us-ascii?Q?9WGfRj7aSIomLkBOC8uvBN0wVcc5/GbJxqlQqKhnuHcNQ7gjECrJ50BQ0s0S?=
 =?us-ascii?Q?7D2C9T82wFrLbQG9AH7V01RYWAwi8wj75DljFUbyaiTugKmpyXdr8PF9cFhP?=
 =?us-ascii?Q?4XuolI1D1ch/Nwf+LIrOoN12yqKdAoNltKiiI9YamdC22HMkWIVol4zVV2Nl?=
 =?us-ascii?Q?+i6JYhVmwPgaF4YAvdhWfuUSpX6D/yMvLrrPqYUBMURlIId7uDHVGkhGIY7B?=
 =?us-ascii?Q?m6Q0VnvOmlcHaozMB44WYDAvPCtrKsANcmEavLoWmcmdnGMFk7xEkJWL6Bs0?=
 =?us-ascii?Q?7kkUbz6nuql9kdbI8vOJ+3cBtiUmtfO8?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?RpZeGxuQf2mdAmp/BL4tyZaxINHcVS5yPp2AwxmL/yVVRDazUGmf0l2bRwh1?=
 =?us-ascii?Q?D9raZgL2+L+wtNgdJrHXC1lqTz/FurhGC2O1U0PkZ2RdnXAd9YeJoABLpOND?=
 =?us-ascii?Q?2iwvxLHbqvVwBVKknBSua3klNJ8pENXdtRPrbgbEj/geWNBsinl7RRSi9t2x?=
 =?us-ascii?Q?+x/GKxJKfQqtPaUlOG0fjuld+Am5NR5assch00y0zaBv+mQi01dKeB8EWUFE?=
 =?us-ascii?Q?HvQKGMvlbvmq2EHQtO00NgR/e1EtgfLAJeSyc6im6nXaLEXU2YTOEU9Q5hp3?=
 =?us-ascii?Q?qDL6ImuyIxssWFuVUwQsdD9JmXRWMJzQaUBGBczJm+80V6RK1pv2Djf7ZC+O?=
 =?us-ascii?Q?n8FFq1NyfBJn81IJcvxr8BzbqtRVNwAI1zak8uMDQeA5W85yJ/EMoUi7iWwd?=
 =?us-ascii?Q?DFxYgr7fHexLiP/tzCZ89pr3QCA/FzK0nzMcIy9twvgKZXUJuqCWhnXmWjZo?=
 =?us-ascii?Q?CjbAI2tT72waMxzICfhRLYBGl7pOYuyEEiLU8If0qpPY5Ck0Ryp9on43+IJ/?=
 =?us-ascii?Q?Ehp8x6aTIP9l8JFrlnoWAHf6dImV+3MqyCnOzeQAzV5ybV/lKOsc1hpnhTbC?=
 =?us-ascii?Q?7DRoWCCcQl9aMx2WcnY8XIvG88+gs5EMJ8EajRoj/kMOI9gikG+bdMxJMcs3?=
 =?us-ascii?Q?EPG4+JncCRoQbCCz1tnCpuPfBG2b6m7y88RTw/+Inzcq9WAaKX1+0jtkC449?=
 =?us-ascii?Q?WzmMmYgZeDLVxV8BBdZhmFkxzz9HEi47wzkk5rrqH6Lnii1jriK1MScc0xsY?=
 =?us-ascii?Q?hDDABtypN9nCvUWX+cCEP/T4hEJci9k5Z7WN6kkVD8z6iG+XF3McFis2J9XC?=
 =?us-ascii?Q?c3RyBuNHXlQQayPLu+3Vbd1MRrbn9VIYzNwbKm08wN2kDo1xc8dbIzC3pXWS?=
 =?us-ascii?Q?Xc1hsvx8xhdXHKdq72XNUrHZq1TOsFs/8qaqonpxhr7qxyn/Z7eS2o7mnX0R?=
 =?us-ascii?Q?2NqWiW8e2mG2x4ZnSyOXu7eUanb9dU/hrhjtFqUu81xWL38i209hN0zhoFU4?=
 =?us-ascii?Q?Zv8lUjCy9LCUMGyTjTYSk92GHMU+/rU2YohcZVCQ7cFGqGfm0de8NDnkTC95?=
 =?us-ascii?Q?QhZKcLGz52g128PCZ2dP05cUBSYWzQFJeoxf/8zyIPikNgoXkbkehP9aCjph?=
 =?us-ascii?Q?7fpbPF8iFCiu5D/90CM0jrp4NUHZhTLlwESQctNtsTo4RHJ/hMnxm0OKU2Vc?=
 =?us-ascii?Q?QwvnMx7GEhLKDu9mXnpR5aG5cD79wPhkTHnW5ufzqcLmja5xYuwFB2qWNJ4c?=
 =?us-ascii?Q?XAvIp2W4UotmmIG+i6AXnMdy8klb3YB7ZLv6KwvRZMsH/PczyNBoPj2IjcVS?=
 =?us-ascii?Q?xPyE0auIWmr5kCtePLpZ6brkEPpHYOYWTGXF+pM8P1nA//cw4JjT55VuDb/J?=
 =?us-ascii?Q?Mk4JgyxysGjaoHmA7okL4/7DnnIoTSKF/Xr3p1/MWp4rgnA/lSKCNjYj7xQy?=
 =?us-ascii?Q?I6K4MU1DHorjHRia1z6sGbyD2dw5rYZjQc9qO/jIFGD69jjE6YfNeQMdTmY9?=
 =?us-ascii?Q?Od4sNt0XfAlchlCRIbXmU1lAVMw4WcsfGgllDAaeCUG0xlPGLBQHK5YDIc8J?=
 =?us-ascii?Q?KfWJM8TAD9Wu7RdhBZo1Up3Zkr/LllCb4yKn92i9?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 293edb1c-7d3b-4e12-f2cf-08dd55b1e373
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 15:34:27.2216
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j5HsUfZnkvE5v3pagyU3QigPWD9E4ArY6F0taF6tFO+k2xCGpF7fFgrgw5RJwK4GDgJxH7zDRk4MouD0GPfC/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5940
X-Proofpoint-ORIG-GUID: IiYE6PhydqFhFPNcDznPxvCD3CCOEfKS
X-Proofpoint-GUID: IiYE6PhydqFhFPNcDznPxvCD3CCOEfKS
X-Authority-Analysis: v=2.4 cv=U+ZoDfru c=1 sm=1 tr=0 ts=67bde308 cx=c_pps a=2/f09Pi2ycfuKzF0xiDRrg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=T2h4t0Lz3GQA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=ADrOcJPYajz3w5gV1MgA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_04,2025-02-25_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 mlxscore=0
 spamscore=0 impostorscore=0 mlxlogscore=999 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2502250102
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 15:34:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115582

ChangeLog:
https://github.com/dracut-ng/dracut-ng/releases/tag/106

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../dracut/{dracut_103.bb => dracut_106.bb}   | 24 +++++++++++--------
 1 file changed, 14 insertions(+), 10 deletions(-)
 rename meta-initramfs/recipes-devtools/dracut/{dracut_103.bb => dracut_106.bb} (76%)

diff --git a/meta-initramfs/recipes-devtools/dracut/dracut_103.bb b/meta-initramfs/recipes-devtools/dracut/dracut_106.bb
similarity index 76%
rename from meta-initramfs/recipes-devtools/dracut/dracut_103.bb
rename to meta-initramfs/recipes-devtools/dracut/dracut_106.bb
index 3ee348dbfd..b474514713 100644
--- a/meta-initramfs/recipes-devtools/dracut/dracut_103.bb
+++ b/meta-initramfs/recipes-devtools/dracut/dracut_106.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 PE = "1"
 
-SRCREV = "3fce598fb45aa5618cdf885eb48cf327104ffcb8"
+SRCREV = "956c08774074ddc45b2f975e13d5c13d1fc36eff"
 SRC_URI = "git://github.com/dracut-ng/dracut-ng.git;protocol=http;branch=main \
            file://0001-feat-dracut-install-split-ldd-command-arguments-for-.patch \
            "
@@ -20,21 +20,21 @@ inherit bash-completion pkgconfig
 S = "${WORKDIR}/git"
 
 EXTRA_OECONF = "--prefix=${prefix} \
-                --libdir=${prefix}/lib \
+                --libdir=${nonarch_libdir} \
                 --datadir=${datadir} \
                 --sysconfdir=${sysconfdir} \
                 --sbindir=${sbindir} \
-                --disable-documentation \
                 --bindir=${bindir} \
                 --includedir=${includedir} \
                 --localstatedir=${localstatedir} \
+                --disable-documentation \
                "
 
 # RDEPEND on systemd optionally
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=${systemd_unitdir}/system/,,,systemd"
 
-EXTRA_OEMAKE += 'libdir=${prefix}/lib LDLIBS="${LDLIBS}"'
+EXTRA_OEMAKE += 'libdir=${nonarch_libdir} LDLIBS="${LDLIBS}" enable_test=no'
 
 CFLAGS:append = " -fPIC"
 LDLIBS:append:libc-musl = " -lfts"
@@ -47,22 +47,26 @@ do_install() {
     oe_runmake install DESTDIR=${D}
     # Its Makefile uses cp -arx to install modules.d, so fix the owner
     # to root:root
-    chown -R root:root ${D}/${prefix}/lib/dracut/modules.d
+    chown -R root:root ${D}/${nonarch_libdir}/dracut/modules.d \
+        ${D}/${nonarch_libdir}/dracut/dracut.conf.d
+
+    if ! ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+        rm -rf ${D}${nonarch_libdir}/systemd
+    fi
 }
 
-FILES:${PN} += "${prefix}/lib/kernel \
-                ${prefix}/lib/dracut \
+FILES:${PN} += "${nonarch_libdir}/kernel \
+                ${nonarch_libdir}/dracut \
                 ${systemd_unitdir} \
                "
-FILES:${PN}-dbg += "${prefix}/lib/dracut/.debug"
+FILES:${PN}-dbg += "${nonarch_libdir}/dracut/.debug"
 
 CONFFILES:${PN} += "${sysconfdir}/dracut.conf"
 
 RDEPENDS:${PN} = "findutils cpio util-linux-blkid util-linux-getopt util-linux bash ldd"
 
 # This could be optimized a bit, but let's avoid non-booting systems :)
-RRECOMMENDS:${PN} = " \
-                     kernel-modules \
+RRECOMMENDS:${PN} = "kernel-modules \
                      coreutils \
                     "
 
-- 
2.25.1


