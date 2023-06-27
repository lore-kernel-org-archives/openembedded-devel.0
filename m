Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B578EB64DD
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 05:58:04 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.6780.1687845483440886514
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Jun 2023 22:58:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=AeJmhN6E;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=55421881fb=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35R5oupi016654
	for <openembedded-devel@lists.openembedded.org>; Mon, 26 Jun 2023 22:58:02 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=/paiqwFlRb0k/vYcLh
	Igy3ufe0c84IQREa3yiZs0wms=; b=AeJmhN6El75LwRDZnMsFSxZOdEpl2nIBbU
	/0bHcTyXKGKoizcnraqghqs2yQHcOSL0JF7eOJ/S4ZswGdFYUVglmwPzEcGFFbEs
	6iIBEzEjPb3Yy+h2TpVZEsM5Cowj28jXLV0Cb+KAeRFiFb3w4+Qdw/aTjvH4dgUw
	0B2MmqPrtR96FrNeOtg7ASVFZjyjBmDPdSafpQkicJw8+0fa3iSjiPfyb1jSg715
	ohQFOzFcyyuNJpsO2G2OXb6kuDST6XjYUmF60LKpyhSrI0thKDyluWiT2kkyjdW/
	zoO2qStJ4dgbSOsDdt9KJxZhFbqwma38xb/MOK2WLDeZPTe664nA==
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2049.outbound.protection.outlook.com [104.47.51.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3rdurxtbcb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 26 Jun 2023 22:58:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i+ABbYmjyxLltlZtas1j2eaqNfpr3A0rz3G5eeNWg429Gurb9bjfFHf9F9Nc3kCS/+Tyf3n91lREkBI0WUzhosDSZRHOf5mJwY6HZdRGST6F51tfmhFWAoi/hyx5PXsoH+3WIlyAhxDexbD3Ce6KxFB+U/mwTUG0qxqOuoxkstwbHMcI+xQWpZVcMQZNwur1qYk6S4IaEXdcPlo2DH4SJPuBpdZIhBlZtxlrZ5G7DwmlNDvpDLQsAGjzJD1iV9AumMhGH6usI2EUwJA9g5hJzGw6fuR5Wo1sJc+x2mVhVnOZpBwxtJqWr+qUBQmmh6S9pFRQhL/9wVpFE6iwAqqnfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/paiqwFlRb0k/vYcLhIgy3ufe0c84IQREa3yiZs0wms=;
 b=NnVK1EKtQFPFUNLUPFLXfmusAN7Nfy7EdtrsEDDbn6tgxOIHWLfALYNCwqI+XzcU95xKcWYo6c/WcyTzUeSMXtfKaWdX+5rHbCHf1fWHOzv0ccLQ6SI8Fw0NLLiLBxY7A2tij5P2scjRvSB9eX0baF5CF19BlwNt2dgYn9jXigZdTInt5psM57p+eR+94EiTpa3A11Uxin9NGG21i2NfP7fGcMnA3ryBqvw1WHU+OMF0m2/VnujE/tvGzELHWj/5Zt9RWbFbDjpZjtTneyrq1/Lpj9bJf31ynM6nJAH3t0aQ+1VEvOaXNg4Sw4laTdGAWCrFKRbrCa8EpM82TUuBFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by DM4PR11MB5328.namprd11.prod.outlook.com (2603:10b6:5:393::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Tue, 27 Jun
 2023 05:58:00 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::60cd:a296:6dfd:e0c9]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::60cd:a296:6dfd:e0c9%7]) with mapi id 15.20.6521.024; Tue, 27 Jun 2023
 05:58:00 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 1/2] conntrack-tools: add systemd unit file
Date: Tue, 27 Jun 2023 13:57:47 +0800
Message-Id: <20230627055748.1327207-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY2PR04CA0003.apcprd04.prod.outlook.com
 (2603:1096:404:f6::15) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|DM4PR11MB5328:EE_
X-MS-Office365-Filtering-Correlation-Id: 193a6b87-07d5-4982-921f-08db76d37658
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	6fVTAgI3ySsPwPXDpj1b09HAPPpWWhRXyQihxxK7IZHH2CKHFhScirKMs9ck4UEwos1IUuuPix+OAHAHIg4+5FMITscxS51KQoNEH44c7NQVhbEpAcm+qBzUmu4mkbN8XhuWKJijkXdzG3PkOW2prK6qsuzD3JdqLjbMC38JWu+z24mgOgPzaHGCx78dv/ZWGzSmYI8Z36Tigkn2IA5mK2r0w11xuHpbpJd/gU7lseVHxlxkRdiPU+2QaXZ0YVv5ZJNinMLx1D2Y4k+sRyvkHd9QlR6ETygR+HvbTMcpC+pG9oGptM3z0+z2FfzB0Xz762szyLHWn7Hre3d1lmKZ5TKPaCwpWAcWGU+qjTW2mgGO8PjbQkvBDnZHNwnRv4vtfPpnoP0UXVnat+i7u9uDrvblFOF+g554k8JJCvwaD44AqRhYPS1WCefQzQ932Z1ThpqkMgNfc76KvU2/RzNS6NatvZMZYU+fdzxlO64mqNKPXOOxd2p0qxgnswWYz309nFf5UlNPvMGXG7sPSXOy2xgoVbgCHRBI/LYKKxLuv7fsqw7vXFWL5fDsk+tPI9derNSP7tb4uTIO9QoV/kL+lDS00UH12fSd5DY8dl6XyevP16rjcgpfpZcCu49zTpSwPvyDRSBxUsBjz5O88BWfEw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(39850400004)(396003)(376002)(366004)(136003)(451199021)(36756003)(6506007)(66476007)(5660300002)(44832011)(316002)(86362001)(6916009)(41300700001)(8936002)(8676002)(66556008)(38350700002)(66946007)(38100700002)(6486002)(966005)(1076003)(26005)(6512007)(2906002)(186003)(52116002)(478600001)(83380400001)(2616005)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?tcbSu92TJrt+1iGmiSZ7veLh6DpzhxXT83+mciBjlTB3Op94HLM7EG/9SRSg?=
 =?us-ascii?Q?ssaDBlE4tLyn7kgbZAxmiNpDtCnQELHcDx4kdAfg+jn6piJ+TTRfj2SZnR0A?=
 =?us-ascii?Q?WkU4D3U/QmB5OvhIBnrU29GPIbV1ghelxzONx/k+hs1ki1i3dMNespjGOEtx?=
 =?us-ascii?Q?XjoVWhWjjSa4wMyYj5JKv8pwjkjM+MvehQEepe+CgeWnbx716HhUse3l+HE0?=
 =?us-ascii?Q?LG65Z6HwHymh+Feg3nc4ApdSWOxNj1GLoRpMekmIRlM9vCffb5Q6zTh37Ggx?=
 =?us-ascii?Q?sZc3wpi8QaiiqgzCvzFEF1pVoo8nePwMApuKe/sdE0Zmtsi8KvptjVlCf2qI?=
 =?us-ascii?Q?8zV4V9b6wHarRWxw2EPI8F4urU7avD6L0PI8thGquRuoQJr9hnAjI9NPV4gK?=
 =?us-ascii?Q?GIdZR0FBpJh/BoYc6pLqV5RZUpkeoMO1TMHzKqqwOdNnyPVbLGC0I4eLNTj5?=
 =?us-ascii?Q?z8qKWhqnJH6tWV8q2Pfz2lQs2RqGTIOy84us3tXfLyYF8sDMN1yTfr0v/4RA?=
 =?us-ascii?Q?LZBp6unK3nZ/ut6b/Sf9SpoQTsWlPfocDkWxzlWzkNDIZ7J61Jr3Ex/LpDUL?=
 =?us-ascii?Q?fr/82Gce8SdPtW9Zq/NYtwu2YogQuo55rnlF6roZf0BzNU/VeH6iuS502GYj?=
 =?us-ascii?Q?Pz7cIFgxxUI3FCTt8/mbQVBnAaQ11MkXBadi+/+wxi6pg9I/l6zhZfMJJdnh?=
 =?us-ascii?Q?Nkg7cIrVhy97rNGenERT4wKzyKV1ycrQPR9vQxeLV3uMfyFio1sShMIu26B/?=
 =?us-ascii?Q?mg+JpHFn3bTN+i6SGjUy0mzzLGn8lTsu8CJ43MZqpwty9l7JER/A3SdI9wl5?=
 =?us-ascii?Q?DZTMh4zai5CfXq6YGdX+kOEf6ZPoTMuCEWwenG0ifOq30trce2rxg4C3ZKGb?=
 =?us-ascii?Q?Rmmzgv8e73j+wSyIOvEl4brIqbukbgAzx+wp/1I+jgdxm0vVlsrBmxRbHCLk?=
 =?us-ascii?Q?rLOyksJshLUwx9POJFY4bqOFv3mmlC39BeNa2ESpFvGrr0jkPTWo3TyrHwRE?=
 =?us-ascii?Q?xfF6i7xJKD6SSZXVKny++QUoqkWsq5v16zaLQiUY6vpZCyEyRwvYTcmwmGdN?=
 =?us-ascii?Q?wyHDlpwkDVGidUjyFBECzHQdVhS9LRL1nzyDFKCe7ChNUfnTnjdfzUx0KkEB?=
 =?us-ascii?Q?KcpuyCteWsvLUEvGTPK8jiL88P1UblxEZlA3e4cqCvCf0uYixbNEcHk2T0Z5?=
 =?us-ascii?Q?BXureekkeZl1arl6xf8hwbsSNJARqEX3FwU2EaPgP9fhudA7KVcr5zsoQzGI?=
 =?us-ascii?Q?puSoo7y3Prso4k3W0ZfYVfV+hYZFUMTC85lZCByW7fQqGHCNgcT34CxZ0bTw?=
 =?us-ascii?Q?QMuecU8MT7z4K16kLFhJjOCy4VNmSxbFlUYVwdb4J0m5yKEEPfbb7Jjdx+yW?=
 =?us-ascii?Q?7DjAjwGUsYyCQzaft3Q4b+hN8J9XjcpYYvZnxpUkNlN8Er+CbcnOu04eqbF/?=
 =?us-ascii?Q?3vlXKbb9sY/FqG9TfCsm4mntP3B2840Z5qCnz0Ix3Yu2fJOoh9qRAoYIH/zz?=
 =?us-ascii?Q?9fbdmOk/OL1v1S32x4AOTqpcnM/qQBLwiLvGzuN6OIAlyhqWzVjqWJaRPZ1y?=
 =?us-ascii?Q?mv1iz/HvKxiLmQP1pukHTSvrL7E1PxUu9D//WtGQ?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 193a6b87-07d5-4982-921f-08db76d37658
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2023 05:58:00.0311
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oIb1Qi4zohkBZp8+3t7KMmQZcyUWH9Fb4NNfD28KAJMgqTBoWHq6zQOVlGlkhlEg3et+oWjWzsQ1vZm7cHNEyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5328
X-Proofpoint-ORIG-GUID: -9RN5ZdG44JZos2Oi1dU51AytaZkDEwW
X-Proofpoint-GUID: -9RN5ZdG44JZos2Oi1dU51AytaZkDEwW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-27_02,2023-06-26_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1011 malwarescore=0
 phishscore=0 impostorscore=0 mlxlogscore=999 lowpriorityscore=0
 spamscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2305260000 definitions=main-2306270056
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Jun 2023 05:58:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103591

Refer to
https://salsa.debian.org/pkg-netfilter-team/pkg-conntrack-tools/-/blob/master/debian/conntrackd.service,
add systemd unit file conntrackd.service.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../conntrack-tools/conntrack-tools_1.4.7.bb          | 10 ++++++++++
 .../conntrack-tools/files/conntrackd.service          | 11 +++++++++++
 2 files changed, 21 insertions(+)
 create mode 100644 meta-networking/recipes-filter/conntrack-tools/files/conntrackd.service

diff --git a/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.7.bb b/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.7.bb
index 8b47ceb1c..0d1100ddd 100644
--- a/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.7.bb
+++ b/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.7.bb
@@ -11,6 +11,7 @@ EXTRA_OECONF += "LIBS=-ltirpc CPPFLAGS=-I${STAGING_INCDIR}/tirpc"
 SRC_URI = "http://www.netfilter.org/projects/conntrack-tools/files/conntrack-tools-${PV}.tar.bz2 \
     file://conntrack-failover \
     file://init \
+    file://conntrackd.service \
 "
 SRC_URI[sha256sum] = "099debcf57e81690ced57f516b493588a73518f48c14d656f823b29b4fc24b5d"
 
@@ -25,6 +26,10 @@ PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,systemd"
 
 INITSCRIPT_NAME = "conntrackd"
 
+SYSTEMD_PACKAGES = "${PN}"
+SYSTEMD_SERVICE:${PN} = "conntrackd.service"
+SYSTEMD_AUTO_ENABLE = "disable"
+
 do_install:append() {
 	install -d ${D}/${sysconfdir}/conntrackd
 	install -d ${D}/${sysconfdir}/init.d
@@ -37,6 +42,11 @@ do_install:append() {
 	sed -i 's!/etc/!${sysconfdir}/!g' ${D}/${sysconfdir}/init.d/conntrack-failover ${D}/${sysconfdir}/init.d/conntrackd
 	sed -i 's!/var/!${localstatedir}/!g' ${D}/${sysconfdir}/init.d/conntrack-failover ${D}/${sysconfdir}/init.d/conntrackd ${D}/${sysconfdir}/conntrackd/conntrackd.conf.sample
 	sed -i 's!^export PATH=.*!export PATH=${base_sbindir}:${base_bindir}:${sbindir}:${bindir}!' ${D}/${sysconfdir}/init.d/conntrackd
+
+	if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+		install -d ${D}/${systemd_system_unitdir}
+		install -m 644 ${WORKDIR}/conntrackd.service ${D}/${systemd_system_unitdir}
+	fi
 }
 
 # fix error message: Do not forget that you need *root* or CAP_NET_ADMIN capabilities ;-)
diff --git a/meta-networking/recipes-filter/conntrack-tools/files/conntrackd.service b/meta-networking/recipes-filter/conntrack-tools/files/conntrackd.service
new file mode 100644
index 000000000..b3b0f1d21
--- /dev/null
+++ b/meta-networking/recipes-filter/conntrack-tools/files/conntrackd.service
@@ -0,0 +1,11 @@
+[Unit]
+Description=Conntrack Daemon
+Documentation=man:conntrackd(8) man:conntrackd.conf(5)
+
+[Service]
+Type=notify
+ExecStartPre=-/bin/rm -f /var/lock/conntrackd.lock
+ExecStart=/usr/sbin/conntrackd -C /etc/conntrackd/conntrackd.conf
+
+[Install]
+WantedBy=multi-user.target
-- 
2.25.1


