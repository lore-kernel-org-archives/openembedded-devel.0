Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1EBEC43334
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 06:09:22 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.2415.1657174153187250950
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Jul 2022 23:09:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=AajU90wU;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=4187d97074=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 2675cDmS005702
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 6 Jul 2022 23:09:12 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=jXwV6HKuCig6MQ5tQEkSbdQC2VOSCnHDLXEOsOLl7SA=;
 b=AajU90wU/9VF8jW7V6wFA9TjA9/TnTJIlM3dbWumhegEcHF31mdNq8aNmNm7hB6XmkaB
 SJ+oeS05R/ds+waCZdm8/6omhqPQly+S5Bm6M1hutMkuDx3O1oRK1H67Rso4TIiONlea
 UeBrVuMoHuzAG/MpUpcoEKAJWpIe+jL/8Ho5dqK4R9fZAUzaOuT5C+7bno9ksmny7+Aa
 U83B9rHFQ6uAG51qpXO929CyUu+3aTgOSin0oAMFgeZS+tvpTPHAckdTWjhaevViggxi
 1Dq9x+OA3RUpnl84dqCPJ6nV9aNLBoXFMjDM725Tth2Ku+kTjVpr/0K6GHB6yfQxP8lH QQ==
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3h4uf3h65y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Jul 2022 23:09:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PFfmNnvmMAvjeLcA0FTUINyPv3/XE8IAdRTm5t/fpMbBgqR1KgIbM65whJJr/coUcPw5WgCR0Z+uQBtyqHE4eqEMAu2BH634g9M7ZzNoqM4hMQ0ccOZR0mj9wqBZnYRO4x6FQoEgCwDK7lJ2BKUyOQqy1SOdhMejKDeDj9iBEZzS5uAdrJ/BlH7jkntTXFRVD/LtoEE0YdKnpUuDNm8c0C4WNywUSNJ/rIsavP3jhr7VpG2RpIZtfT5SiBCLzhsiNiH4hoSvjNy8pXIr1oAEK9Zx/XOFwnSRbrC6aVM+TuzDpmqbXbVARNKN5+K5Or/pYCvOfAKEBl6jqII+pD98OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jXwV6HKuCig6MQ5tQEkSbdQC2VOSCnHDLXEOsOLl7SA=;
 b=PBb81gHbkz0o6BZIAf2Xl4nnw+e4d4hda1yykRlHtTJStQFBazS+W+BVBJqj9f+VDHoyET2Hi1BSCtDN7bO0Im872we38HmpukQfbDdU17RNpiW68uGc+iktmHGXdPM72qC/nJoBKStrO60NMvkN9+5xp9bjhKNdBf6vVvch+B8fqYla5z/5Zogq6IdLQzlusWqPIqwkF9N46JGQ3F+lhBJl9mnrvGc2It0eAJnv/6QA2dzsSTYBZwWldH33JmcUrR2+VnraCb2bY0P7PFmdB+cHOL8HSIPMjj9UIktI/MuSiBSjMOSee3i8vd8nX47Zt+uCG88OTKYG0ZmEbPWhrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by DM6PR11MB3132.namprd11.prod.outlook.com (2603:10b6:5:69::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.19; Thu, 7 Jul
 2022 06:09:10 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::9858:1451:5696:508b]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::9858:1451:5696:508b%4]) with mapi id 15.20.5417.016; Thu, 7 Jul 2022
 06:09:10 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 1/2] openvpn: add PACKAGECONFIG for systemd
Date: Thu,  7 Jul 2022 14:08:57 +0800
Message-Id: <20220707060858.2334059-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2PR03CA0008.apcprd03.prod.outlook.com
 (2603:1096:100:55::20) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f74bae91-84e8-4088-6ae2-08da5fdf3570
X-MS-TrafficTypeDiagnostic: DM6PR11MB3132:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kaCO6pmreDmH55NpEFtbBt74Z2FoKKBK/bxH+AfEpDJKdBxFkF5LV3yL6iMXWJEV1aq9iyFZ3AoUKhxoM/++M6axqTqjIwAwW4TTdJS7i/sbkPgmUsvi1PxKJGN296Nv0CnDFAtxGCZ2q/QXuYmCbegdWy/1I6dp3/ccvGgfU+8LNyIUWhoZru9rmWLho5addMQmrhTVtfwytHhdl4AUMzsJ8qecArUiGd6gSvt2dboXpZA2LlIlB9UeuVsEiTR546rFjNxPjYMkWf1Cx0VXOJbLGe0WoMRx+4Kdui7qBELrB2hzXHvGuE76bQasOBwHixpAXMNxfRm7e4oSW6I7SKEafZN0JQRUAOH+mt+e/3L12GT6eRtCsOPI9D1cNV4wdPjBtFmKcGcerlicrE7bx7YYF3SJ0QMlkWmYKvGfX2b1Sj0rdxQ+BCUmna8Mc4C8Uy0JKbGnWcIoLHVIXXqg4b3yMdQqF4e2DXbI5/XTR+vqHURURmlxEx+SqwzLCT84bWsa72zG3QvVLIu+3Gs1H/HAqx4WmGdgkPuk40C+VBuy6IJfdFZlezw0aMu9+tJM9EOiXRGuVRIutw7cYxj7UifqjDq9tdPYzv8z9pqQMMi6pGFYP/Sogr5Es++J5tEspZ/jl3VYFj5SCIp4MC2HFvaatg/nbYUq0NE45/wGQC+tsjiqXXSj8zaiuHhmv0QVPWBpfJ5GHiR7b621FpU0vH+XSTLeimilQf/K+hAiGVzLHJwKfA+w71CnotEq9R1m4h9aEZPPX8X1FRXqaxqt0XFg7sVH1cQKeNFEZCMhl1CwlhVBKPMXHadVw939TP3mdV6kVATVS7sd/q/mUL94RA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(396003)(136003)(39850400004)(366004)(44832011)(8936002)(478600001)(52116002)(5660300002)(86362001)(6486002)(6506007)(6666004)(2906002)(41300700001)(6512007)(26005)(38350700002)(2616005)(186003)(66556008)(36756003)(316002)(83380400001)(66476007)(6916009)(66946007)(8676002)(1076003)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?IDdwLSEjR9Er2l3gT2zo7DoLdXNju81HHgY/i0Aq+/H7WrnE+9A6l0GeWD59?=
 =?us-ascii?Q?mjhR77raKhyaWhAx8Lal6trDR1msOZm38dN72JR8dyjqBA5MDryYEd/lrtyo?=
 =?us-ascii?Q?uyqyut25iu5J1dWOXNNrstlvF3avGMns0wTPAnVIjTFNXtoLcHIf1ng6tPCF?=
 =?us-ascii?Q?21RHkXQwF/GFy6G5XpP9PQTunjSH+Cr+MLSCu6D9TXHI6KlIv2Yy5apGidaU?=
 =?us-ascii?Q?bl+yo4Wf1jb7srF6VKuOy8US0aw1pTakXUS1MBgQyumGwoICMVHoT+QaNI1U?=
 =?us-ascii?Q?oJR36uMIz9KhEmrx2xffHMGAk/7uUYtPmJz9I6DTxFP2sN1P1iGBM9eK5suA?=
 =?us-ascii?Q?qdcM+zzmM0Hn4peyWuxzHtDeFTGBMWgvh0+qQ0XcTuEik3d8hNKOqQW4V8A1?=
 =?us-ascii?Q?px+bom9Aa8eAfR6tYyHQcoRhFuPiZXenBvyiynM4keiMuDmHexislGeCksKw?=
 =?us-ascii?Q?zUpn+OZ3iOarSjQkdV3mFaZpqVeCJVpc6uce5YShWyZXhbLhSzDpWj0kNoyT?=
 =?us-ascii?Q?43XHCKKT/cs9snKp1/NzSyv5gJE70RczyZw9yuicOX0CGaLgH9ApBPX5NfBu?=
 =?us-ascii?Q?L0M2nlBPT0qJC820FB1fhj9YGJOFwk94kJre1XZCoUzPGZdIQZd99lEwHJcW?=
 =?us-ascii?Q?9pMXg17JEXZ3Brqd6Kqd6oZLg/Td7nN7kVO+w0sUbnPwheZdki+IKAcOaMTr?=
 =?us-ascii?Q?E5Cr+gt17lfd/dz/mqKEnUyzebnDG7QllcOFmcCytwGAvMISLOG3hYxtjj+G?=
 =?us-ascii?Q?6BqXrJPn886j7uui9JX2XnQzV62shJVuArJv/s9+5KOVvqkrLGsrjosA8x91?=
 =?us-ascii?Q?/CK5Punaz60nuIMePJoHaWW+4VoZaEpt7609+Qgj/P8iZs+2CHeq4TH7mPPH?=
 =?us-ascii?Q?wNPTEEBPXkaLRl+FU0aJlI/VSkWISSvOQqVgwN2yfstwOxneyX5aimiHrlGn?=
 =?us-ascii?Q?SYYJezE0ANvj3DsewuqPGOWGxKii3m21S5aG1hoD4M7NKrvZJjvl9AWo9jpd?=
 =?us-ascii?Q?yYMXoiVk5R2TFtM3exMVL6IA2tj5cSe4tlJ3n0uiGwLXsPPAiClFxv8VPl1G?=
 =?us-ascii?Q?mksgxuKucprnJJxaJo3fuYBvSVYzZAL7Vp4QbitmDa+WojHj/DoOTnF9WP9q?=
 =?us-ascii?Q?1GBYiDLHu44IEUisfyR2hufPRwt+xie7FjCv8cEqi3CETXJkCV/9qSeAcCX0?=
 =?us-ascii?Q?BiJnMqWwyfO9WdHAJUkUZ/Wx9Arz8VrV3qkWLf/OesYv+8idYTlDMCUqHvbT?=
 =?us-ascii?Q?gveL9zcrYnPOuUlrcJpnG3lK3F2nqx0f4XSvVWZ4/4jd5ZU5ur5z98vL5z3V?=
 =?us-ascii?Q?rlvzLVKs0O/7jbh0otaaxJQ1yy6BdWIeTZAwpv1LLoSpb9V9jd9ah8XZZmvJ?=
 =?us-ascii?Q?VdUTaCDKWURdOiVEeaJktpTUiZnXGbIjzF1l5ieeRJ5OneuCMMS1PbCxsNkV?=
 =?us-ascii?Q?N34IehwROdY7tniuJX1J5qdlWiyWubClYOja1JnuNiZ6Fd8rMbjQMz/GYhVw?=
 =?us-ascii?Q?Bo9O1NvkGO4q87x/uAHWTMYyrUq0ZzvXUISRQTMBB+KgUo+wueFOpBVF/ZfI?=
 =?us-ascii?Q?PKmlEvjU3KDMKMuy1hWruIY4N0Sh4MVUaB8pjZMb?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f74bae91-84e8-4088-6ae2-08da5fdf3570
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2022 06:09:10.6658
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 0XgjeTiP+w5yg9pFAAvEie6V4HMZzocEoJfl1FPvG+njftKuMS8Tx9VBaPwLu8jDR8xHGoTYSaq6rm1xbGJn3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3132
X-Proofpoint-GUID: Ji4wQKP8_cMsQixWqajHpKFwNzLyfhgZ
X-Proofpoint-ORIG-GUID: Ji4wQKP8_cMsQixWqajHpKFwNzLyfhgZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-07_04,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 adultscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2206140000 definitions=main-2207070023
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Jul 2022 06:09:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97735

The systemd support had been integrated to openvpn for a long time. Add
PACKAGECONFIG for it and use its own service files and volatile file.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-support/openvpn/openvpn/openvpn   |  0
 .../openvpn/openvpn/openvpn-volatile.conf     |  1 -
 .../openvpn/openvpn/openvpn@.service          | 12 -----
 .../recipes-support/openvpn/openvpn_2.5.7.bb  | 49 +++++++++----------
 4 files changed, 22 insertions(+), 40 deletions(-)
 mode change 100755 => 100644 meta-networking/recipes-support/openvpn/openvpn/openvpn
 delete mode 100644 meta-networking/recipes-support/openvpn/openvpn/openvpn-volatile.conf
 delete mode 100644 meta-networking/recipes-support/openvpn/openvpn/openvpn@.service

diff --git a/meta-networking/recipes-support/openvpn/openvpn/openvpn b/meta-networking/recipes-support/openvpn/openvpn/openvpn
old mode 100755
new mode 100644
diff --git a/meta-networking/recipes-support/openvpn/openvpn/openvpn-volatile.conf b/meta-networking/recipes-support/openvpn/openvpn/openvpn-volatile.conf
deleted file mode 100644
index 1205806d5..000000000
--- a/meta-networking/recipes-support/openvpn/openvpn/openvpn-volatile.conf
+++ /dev/null
@@ -1 +0,0 @@
-d @LOCALSTATEDIR@/run/openvpn 0755 root root -
diff --git a/meta-networking/recipes-support/openvpn/openvpn/openvpn@.service b/meta-networking/recipes-support/openvpn/openvpn/openvpn@.service
deleted file mode 100644
index 01dd2e8c2..000000000
--- a/meta-networking/recipes-support/openvpn/openvpn/openvpn@.service
+++ /dev/null
@@ -1,12 +0,0 @@
-[Unit]
-Description=OpenVPN Robust And Highly Flexible Tunneling Application On %I
-After=syslog.target network.target
-
-[Service]
-PrivateTmp=true
-Type=forking
-PIDFile=/var/run/openvpn/%i.pid
-ExecStart=/usr/sbin/openvpn --daemon --writepid /var/run/openvpn/%i.pid --cd /etc/openvpn/ --cipher AES-256-GCM --data-ciphers AES-256-GCM:AES-128-GCM:AES-256-CBC:AES-128-CBC:BF-CBC --config %i.conf
-
-[Install]
-WantedBy=multi-user.target
diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.5.7.bb b/meta-networking/recipes-support/openvpn/openvpn_2.5.7.bb
index f9998aaa8..7404e6e58 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.5.7.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.5.7.bb
@@ -5,13 +5,12 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b76abd82c14ee01cc34c4ff5e3627b89"
 DEPENDS = "lzo openssl iproute2 ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
-inherit autotools systemd update-rc.d
+inherit autotools systemd update-rc.d pkgconfig
 
 SRC_URI = "http://swupdate.openvpn.org/community/releases/${BP}.tar.gz \
            file://0001-configure.ac-eliminate-build-path-from-openvpn-versi.patch \
            file://openvpn \
-           file://openvpn@.service \
-           file://openvpn-volatile.conf"
+          "
 
 UPSTREAM_CHECK_URI = "https://openvpn.net/community-downloads"
 
@@ -20,9 +19,6 @@ SRC_URI[sha256sum] = "08340a389905c84196b6cd750add1bc0fa2d46a1afebfd589c24120946
 # CVE-2020-7224 and CVE-2020-27569 are for Aviatrix OpenVPN client, not for openvpn.
 CVE_CHECK_IGNORE += "CVE-2020-7224 CVE-2020-27569"
 
-SYSTEMD_SERVICE:${PN} += "openvpn@loopback-server.service openvpn@loopback-client.service"
-SYSTEMD_AUTO_ENABLE = "disable"
-
 INITSCRIPT_PACKAGES = "${PN}"
 INITSCRIPT_NAME:${PN} = "openvpn"
 INITSCRIPT_PARAMS:${PN} = "start 10 2 3 4 5 . stop 70 0 1 6 ."
@@ -36,31 +32,30 @@ EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', '', '--disable-p
 # Explicitly specify IPROUTE to bypass the configure-time check for /sbin/ip on the host.
 EXTRA_OECONF += "IPROUTE=${base_sbindir}/ip"
 
+EXTRA_OECONF += "SYSTEMD_UNIT_DIR=${systemd_system_unitdir} \
+                 TMPFILES_DIR=${nonarch_libdir}/tmpfiles.d \
+                "
+
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
+                  "
+
+PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,systemd"
+
 do_install:append() {
     install -d ${D}/${sysconfdir}/init.d
     install -m 755 ${WORKDIR}/openvpn ${D}/${sysconfdir}/init.d
 
     install -d ${D}/${sysconfdir}/openvpn
+    install -d ${D}/${sysconfdir}/openvpn/server
+    install -d ${D}/${sysconfdir}/openvpn/client
+
     install -d ${D}/${sysconfdir}/openvpn/sample
-    install -m 755 ${S}/sample/sample-config-files/loopback-server  ${D}${sysconfdir}/openvpn/sample/loopback-server.conf
-    install -m 755 ${S}/sample/sample-config-files/loopback-client  ${D}${sysconfdir}/openvpn/sample/loopback-client.conf
+    install -m 644 ${S}/sample/sample-config-files/loopback-server  ${D}${sysconfdir}/openvpn/sample/loopback-server.conf
+    install -m 644 ${S}/sample/sample-config-files/loopback-client  ${D}${sysconfdir}/openvpn/sample/loopback-client.conf
     install -dm 755 ${D}${sysconfdir}/openvpn/sample/sample-keys
     install -m 644 ${S}/sample/sample-keys/* ${D}${sysconfdir}/openvpn/sample/sample-keys
 
-    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
-        install -d ${D}/${systemd_unitdir}/system
-        install -m 644 ${WORKDIR}/openvpn@.service ${D}/${systemd_unitdir}/system
-        install -m 644 ${WORKDIR}/openvpn@.service ${D}/${systemd_unitdir}/system/openvpn@loopback-server.service
-        install -m 644 ${WORKDIR}/openvpn@.service ${D}/${systemd_unitdir}/system/openvpn@loopback-client.service
-
-        install -d ${D}/${localstatedir}
-        install -d ${D}/${localstatedir}/lib
-        install -d -m 710 ${D}/${localstatedir}/lib/openvpn
-
-        install -d ${D}${sysconfdir}/tmpfiles.d
-        install -m 0644 ${WORKDIR}/openvpn-volatile.conf ${D}${sysconfdir}/tmpfiles.d/openvpn.conf
-        sed -i -e 's#@LOCALSTATEDIR@#${localstatedir}#g' ${D}${sysconfdir}/tmpfiles.d/openvpn.conf
-    fi
+    install -d -m 710 ${D}/${localstatedir}/lib/openvpn
 }
 
 PACKAGES =+ " ${PN}-sample "
@@ -68,9 +63,9 @@ PACKAGES =+ " ${PN}-sample "
 RRECOMMENDS:${PN} = "kernel-module-tun"
 
 FILES:${PN}-dbg += "${libdir}/openvpn/plugins/.debug"
-FILES:${PN} += "${systemd_unitdir}/system/openvpn@.service \
-                ${sysconfdir}/tmpfiles.d \
+FILES:${PN} += "${systemd_system_unitdir}/openvpn-server@.service \
+                ${systemd_system_unitdir}/openvpn-client@.service \
+                ${nonarch_libdir}/tmpfiles.d \
                "
-FILES:${PN}-sample += "${systemd_unitdir}/system/openvpn@loopback-server.service \
-                       ${systemd_unitdir}/system/openvpn@loopback-client.service \
-                       ${sysconfdir}/openvpn/sample/"
+FILES:${PN}-sample = "${sysconfdir}/openvpn/sample/ \
+                     "
-- 
2.25.1


