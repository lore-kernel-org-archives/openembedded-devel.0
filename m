Return-Path: <zhixiong.chi@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D82B3C6FD19
	for <webhook@archiver.kernel.org>; Thu, 16 Mar 2023 03:34:14 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.4726.1678937646039261065
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Mar 2023 20:34:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=rEvcozm7;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2439a8b603=zhixiong.chi@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32G3Y5fi018555
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 20:34:05 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=xbfO4jRrulniMVSmiwwfJOZfpET5dc+g6vShaOmEi48=;
 b=rEvcozm7gLVrze3pu6Gb+PpM+lVmypdoJGoDTL/5tgXt4pZWRhDex9bXVIK3io4JjdKF
 0z+eN3iIo4Llza13u5PiYC+pulEF87ni7KHHhQhvx4XfTjFlyTouoR25i/WRd/UA6paK
 gnBR7v4MjRrRdeJUYxwcE1ZEdVanMbAdI8PPP2A2pxt5W1ECe/BV7lDqjqRr/1iz4n6d
 t1mWNajMfaMDjjZn4zeGaNvIExi22i1plP7Dndbfqev3XronPfR40nC/G6I2ulgRLHuM
 Oa0ijoncdoA9MDQxIiGrA+4B1uOU/ofRTdVlZr7fHZCoT9R+6F9081pocDuYjgx99AMQ cw== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2177.outbound.protection.outlook.com [104.47.59.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pbqksg50q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 20:34:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bMFLpuLaQwCWkhmtXPhdsWVr6ebVd9CkE2wUuAvu30o1cRzWIhVdgBkjp6jl1ZXuvYd+nif9F+lmqlS6k6+RbqDPwa7eZU18zWks8Ve8CtNwGfFOLGlN/+W07ZWGopCBRef7ISoVkrLKZSe2Dd6QcoCANkZEXSpYPblKXUHlPX6H8+88BB3s0UOwsPUlflox0p0a7pB1dj4cgs1wMcyO1byfAgBgtsirrcwP4n/kOFcf6MiOSY9zNH8vqiqjgf0t4WOcg/SM+UXOF8ZJ5teKfPLZ0bRGd1/FjrxMLPjAllG7wLDC1IN1FPT/GP+PZKOZna4tSyO8byqwhYk1KtFtfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xbfO4jRrulniMVSmiwwfJOZfpET5dc+g6vShaOmEi48=;
 b=Vf9J3nnnezAsUFJiMG7KM56ZWecmjtpmglmvl+HgC6bSDGsyMp51IBYYDEJeYjMftfRCm6EjaCdO/rKmUPfsCR/YGLFJ3JIWl99vkl1+bmoFqxIJImKyDhCnbFAQMLHyAvCR+dnZFb8W3eJ/NXRwq3WWailM8unuMRvNjHRvzBJBDOkF8OwAhQcQpc4yKK9qvbAUvme1/hKj/I/ZZz4twXSwzEf5o1fimJEXozFB4KVRGMeieIEI4UP8odHZF//WWrV1Q2QIOFq87JH4L1ojPSndeYuVOTwzndCa9kAtd7BUE2z6YNz9cZKzj6RtJrfXyrKaxR06a2C5E8aqzOfY5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW5PR11MB5857.namprd11.prod.outlook.com (2603:10b6:303:19d::17)
 by SA2PR11MB4891.namprd11.prod.outlook.com (2603:10b6:806:11e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Thu, 16 Mar
 2023 03:34:02 +0000
Received: from MW5PR11MB5857.namprd11.prod.outlook.com
 ([fe80::88c5:ff47:375c:c1dd]) by MW5PR11MB5857.namprd11.prod.outlook.com
 ([fe80::88c5:ff47:375c:c1dd%8]) with mapi id 15.20.6178.024; Thu, 16 Mar 2023
 03:34:02 +0000
From: Zhixiong Chi <zhixiong.chi@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-networking][PATCH] ntp: drop the deprecated ntpdate
Date: Wed, 15 Mar 2023 20:33:56 -0700
Message-Id: <20230316033356.2199649-1-zhixiong.chi@windriver.com>
X-Mailer: git-send-email 2.39.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0047.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::22) To MW5PR11MB5857.namprd11.prod.outlook.com
 (2603:10b6:303:19d::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW5PR11MB5857:EE_|SA2PR11MB4891:EE_
X-MS-Office365-Filtering-Correlation-Id: 76e0ee5a-3ed3-49f4-30c5-08db25cf4961
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	opJlukAXF7SLKNj7L+i8n7M9v4aj1mgopTZYDqJwCjiKncL1JmKIvZfEHw4seLHDTjow1WYGXA+ss/EhqHUOu34j2JfMC7d1pXE0GyMuC39n+fXS0WemnbGt5xfWpxByDsjnECo7eWEHq3G4diaUMmlIqIYemZ3gjhmP7Gvlyttl9UzpEZzk4TiB46AHfvFVmaQqdk/KvGPmYudKR7cNkc1eJLCUIuwxRx8Cko+SPAytEqC47VVEkMyeNAFq98J6OXZEPE3o0I1XRGgNPIq7sXD4743+l+c3pC55h5M4mEOfC6DApdnMjdcGg8qQmMhX7FjStKiSaYs8EQy0LIxFGnpHpTJKChFScLWo0CJwnuoX4BgK0eufm1yHaYgPPNirDPtsUn9EBAlMFz3qz4muYKtALOHcGtH418oZ84eO2XxQ0Tkh0peKZXerJf8t4vg7OKi3Z5m2JN60TXZdh9U7QU6GtnREH/j+oMgHMdh1nPna4+B3+X229KiLkZuLgq3AvukY8Iy97Md9I6LGgrCBw6pdneJ7wh+lWUDDRqEqXEu8tPwt8avWwD5k0OOLdVB/aZMsT3h8E12bzU53xB/OC7AxgbBWZiVgf2eSvL+Wqhpi2A2x1t+1frhjfmcDaSU5p8IK889vyGH5ummkJaKyscsJWPj0J9GibZorq4+P3SzmvrN4uUnFQkGUmNfJLhzd
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR11MB5857.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39850400004)(346002)(136003)(366004)(376002)(396003)(451199018)(8936002)(66476007)(6916009)(8676002)(66556008)(66946007)(316002)(41300700001)(5660300002)(478600001)(44832011)(26005)(186003)(36756003)(52116002)(2906002)(6486002)(6506007)(6666004)(1076003)(2616005)(6512007)(83380400001)(38350700002)(86362001)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9gSlXXDUBf7TCjFoaCnphnUlWM5sLxysn7rYwH3DWbbastkGRFHvdDzafkAr?=
 =?us-ascii?Q?nLg7yNhJQPspQfWFqgQ/s4cvTH9jy0VNJPQyX0lnR3HGccWQPgVCh0lGc4lH?=
 =?us-ascii?Q?HDWmQU9cfHOj6vUU7unRr1L0wHdPk3zyEgeRoTAUp7zm8AVcylZbtlV9opE0?=
 =?us-ascii?Q?lY9VC02jgAJMwP+/Tybswt96ryY9EAxko544KOShPJmcMb31iJYl3pY88AYr?=
 =?us-ascii?Q?K0+dLJDv9XuJG0TLtjUpKAhzUYXbXwlQKHct5qeAFxnh21FLKmVLpT4CrIgD?=
 =?us-ascii?Q?t9xDt78FmyPrwnql0KWN4tsX3H7U3QHh2q32ubjb9DZZSpdcNDPcVR8xF5yT?=
 =?us-ascii?Q?eubuIHqM2cwflwOgR4yLcYRo2oIKX03EwkJJvB427ar5V51qWZl6Ksnjk/hq?=
 =?us-ascii?Q?nNHxezY1rOh8R6SYY2i7dWBjrL3P4Q+zg4Oddwf271VMwIVkYG8ZrIgQbbaO?=
 =?us-ascii?Q?HeZSHq9QO406jBmwAGDkoRHM0TDH61LQc2OjCPbgZO8IB8IOgefqUv2sLqVd?=
 =?us-ascii?Q?/0lf3L+T7QsPIl85oRiw7eKlwteaEb+93zxZf83lvTCsIOcCAdREHSRf8fSL?=
 =?us-ascii?Q?bqUA5LY0MTaU8UuC8WXPDG3rbcw5RE17D9WTLFUhqEPQr+NnWeTW+aFEiOUD?=
 =?us-ascii?Q?iX44SxZ7HehqxhmjVMfppLSKgJqmFcpy5h4vxD+z+ri8KnZ5cQFBFCGSbHcH?=
 =?us-ascii?Q?GzntF+K0hgIa9042jBweC/rzPwX7bmFNrfTNNQzOIJWlKjKxXUjaPtvNr9Dt?=
 =?us-ascii?Q?BO4aMvd5VPqcKFl1xRHM/wogNP6TbsiMf/xAOokSjHaY0NXay8zuC0IEkRDA?=
 =?us-ascii?Q?WKh0SU+/tDH3sBLxfClffPOwaaEXSI4upH3y3ikMekir3bCyTxxrnCFY6R4y?=
 =?us-ascii?Q?ICYZvNLwrc3l3UgRLQm7xTuzzYMFRt6NZEmxKKcwVjuebb3Vjr4FPZn5gGb4?=
 =?us-ascii?Q?nd1Oxsk+NBzflEVkUVHiqDhvJ7p5dJrbMlK9cbJ3F1uaH3UrhsE4zLK3DwVN?=
 =?us-ascii?Q?bzYP+pDq2sKpGLFcMMxovgm1W1iwsqMMOHECPZ47o32R/Q57vIcdA50YVVr3?=
 =?us-ascii?Q?urqjlDoqOSXfQG0goB/lKHeOB6BNclRK81wwHyjbBZPImL86RXzHzrpA4DD7?=
 =?us-ascii?Q?12p0JFSdWKFvt0WjV+dz6xmRTp1qRIz7Up2giOL17K1i/HcSZSirbdNWn1+D?=
 =?us-ascii?Q?WpDEgi+rDbED5zygMxdSNJ4v4Rj+RgRbVDOfuX0mkFsFbqSMuyXFN7vJvpny?=
 =?us-ascii?Q?4nCHOMH2AgLtDL5mXUfHsOxc82iENojI+pu94Pd4NA1brjRx/tPTZCsDaqwN?=
 =?us-ascii?Q?Kzx59KnbMTJmiiWrqDe3H2ysAIXG8/N6W+5msILZYD9krS1SpF/JoB97F7rL?=
 =?us-ascii?Q?LKaeCq+cG92gZmhedQsWwjOgihRY+XfRtmIhMI/Oxc2UYmRuwjAmhkd9rnVF?=
 =?us-ascii?Q?BGzxsR2D3WA3/tL1jO7nMbaSRfTQRLzBbyIMBN24P+blC7opgOCwVvRyHbx7?=
 =?us-ascii?Q?mQrW7djaWTeRTRHu9Awf/R7lCds539mR9i+51pVIeTL8qiv/EPQPTQ9KE6Zh?=
 =?us-ascii?Q?/93arsFTwX0oJjExBI5StvxxujBTDqm8D+m2YdRMnORzP9cp5d9SBztLyBuN?=
 =?us-ascii?Q?yg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76e0ee5a-3ed3-49f4-30c5-08db25cf4961
X-MS-Exchange-CrossTenant-AuthSource: MW5PR11MB5857.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 03:34:02.4280
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WDQpIDDEBwUrnWepxygC205eRGH2lBlth+TOTexFoL0oxPj+PfcyIzC3A7ierU2+GuQktSYj9c0M/h3PAEJ0ohIVYGEZWBQF8VRmy23bI1w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4891
X-Proofpoint-ORIG-GUID: k6QkDKrvpCRn5Ti64_6pgIw6p2x509UF
X-Proofpoint-GUID: k6QkDKrvpCRn5Ti64_6pgIw6p2x509UF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-16_02,2023-03-15_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1011 phishscore=0 adultscore=0 suspectscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 mlxlogscore=962 bulkscore=0
 impostorscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303160029
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Mar 2023 03:34:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101570

The combination of ntpd and sntp now implements the functions of
ntpdate, which has been deprecated.
Now we don't need ntpdate anymore, and we can use the following
command 'ntpd -q -g -x' instead.
So drop the related section of ntpdate now.

Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
---
 .../recipes-support/ntp/ntp/ntpdate           | 59 -------------------
 .../recipes-support/ntp/ntp/ntpdate.default   |  7 ---
 .../recipes-support/ntp/ntp/ntpdate.service   | 11 ----
 .../recipes-support/ntp/ntp_4.2.8p15.bb       | 47 +++------------
 4 files changed, 8 insertions(+), 116 deletions(-)
 delete mode 100755 meta-networking/recipes-support/ntp/ntp/ntpdate
 delete mode 100644 meta-networking/recipes-support/ntp/ntp/ntpdate.default
 delete mode 100644 meta-networking/recipes-support/ntp/ntp/ntpdate.service

diff --git a/meta-networking/recipes-support/ntp/ntp/ntpdate b/meta-networking/recipes-support/ntp/ntp/ntpdate
deleted file mode 100755
index be3bacfcd..000000000
--- a/meta-networking/recipes-support/ntp/ntp/ntpdate
+++ /dev/null
@@ -1,59 +0,0 @@
-#!/bin/sh
-
-PATH=/sbin:/bin:/usr/bin:/usr/sbin
-
-test -x /usr/sbin/ntpdate || exit 0
-
-if test -f /etc/default/ntpdate ; then
-. /etc/default/ntpdate
-fi
-
-if [ "$NTPSERVERS" = "" ] ; then
-	if [ "$METHOD" = "" -a "$1" != "silent" ] ; then
-		echo "Please set NTPSERVERS in /etc/default/ntpdate"
-		exit 1
-	else
-		exit 0
-	fi
-fi
-
-# This is a heuristic:  The idea is that if a static interface is brought
-# up, that is a major event, and we can put in some extra effort to fix
-# the system time.  Feel free to change this, especially if you regularly
-# bring up new network interfaces.
-if [ "$METHOD" = static ]; then
-	OPTS="-b"
-fi
-
-if [ "$METHOD" = loopback ]; then
-	exit 0
-fi
-
-(
-
-LOCKFILE=/var/lock/ntpdate
-
-# Avoid running more than one at a time
-if [ -x /usr/bin/lockfile-create ]; then
-	lockfile-create $LOCKFILE
-	lockfile-touch $LOCKFILE &
-	LOCKTOUCHPID="$!"
-fi
-
-if /usr/sbin/ntpdate -s $OPTS $NTPSERVERS 2>/dev/null; then
-	if [ "$UPDATE_HWCLOCK" = "yes" ]; then
-		hwclock --systohc || :
-	fi
-fi
-
-if [ -x /usr/bin/lockfile-create ] ; then
-	kill $LOCKTOUCHPID
-	lockfile-remove $LOCKFILE
-fi
-
-) &
-
-# wait for all subprocesses to finish
-# this is required when using systemd service as ntpd will start before ntpdate finishes
-# and results in a bind error (port 123)
-wait
diff --git a/meta-networking/recipes-support/ntp/ntp/ntpdate.default b/meta-networking/recipes-support/ntp/ntp/ntpdate.default
deleted file mode 100644
index 486b6e07d..000000000
--- a/meta-networking/recipes-support/ntp/ntp/ntpdate.default
+++ /dev/null
@@ -1,7 +0,0 @@
-# Configuration script used by ntpdate-sync script
-
-NTPSERVERS=""
-
-# Set to "yes" to write time to hardware clock on success
-UPDATE_HWCLOCK="no"
-
diff --git a/meta-networking/recipes-support/ntp/ntp/ntpdate.service b/meta-networking/recipes-support/ntp/ntp/ntpdate.service
deleted file mode 100644
index 10cbd70f9..000000000
--- a/meta-networking/recipes-support/ntp/ntp/ntpdate.service
+++ /dev/null
@@ -1,11 +0,0 @@
-[Unit]
-Description=Network Time Service (one-shot ntpdate mode)
-Before=ntpd.service
-
-[Service]
-Type=oneshot
-ExecStart=/usr/bin/ntpdate-sync silent
-RemainAfterExit=yes
-
-[Install]
-WantedBy=multi-user.target
diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.8p15.bb b/meta-networking/recipes-support/ntp/ntp_4.2.8p15.bb
index 2ae53dc64..3ce2d77df 100644
--- a/meta-networking/recipes-support/ntp/ntp_4.2.8p15.bb
+++ b/meta-networking/recipes-support/ntp/ntp_4.2.8p15.bb
@@ -18,9 +18,6 @@ SRC_URI = "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-${PV}.tar.g
            file://0001-sntp-Fix-types-in-check-for-pthread_detach.patch \
            file://ntpd \
            file://ntp.conf \
-           file://ntpdate \
-           file://ntpdate.default \
-           file://ntpdate.service \
            file://ntpd.service \
            file://sntp.service \
            file://sntp \
@@ -95,18 +92,15 @@ do_install:append() {
     install -d ${D}${sysconfdir}/init.d
     install -m 644 ${WORKDIR}/ntp.conf ${D}${sysconfdir}
     install -m 755 ${WORKDIR}/ntpd ${D}${sysconfdir}/init.d
-    install -d ${D}${bindir}
-    install -m 755 ${WORKDIR}/ntpdate ${D}${bindir}/ntpdate-sync
 
     install -m 755 -d ${D}${NTP_USER_HOME}
     chown ntp:ntp ${D}${NTP_USER_HOME}
 
     # Fix hardcoded paths in scripts
-    sed -i 's!/usr/sbin/!${sbindir}/!g' ${D}${sysconfdir}/init.d/ntpd ${D}${bindir}/ntpdate-sync
-    sed -i 's!/usr/bin/!${bindir}/!g' ${D}${sysconfdir}/init.d/ntpd ${D}${bindir}/ntpdate-sync
-    sed -i 's!/etc/!${sysconfdir}/!g' ${D}${sysconfdir}/init.d/ntpd ${D}${bindir}/ntpdate-sync
-    sed -i 's!/var/!${localstatedir}/!g' ${D}${sysconfdir}/init.d/ntpd ${D}${bindir}/ntpdate-sync
-    sed -i 's!^PATH=.*!PATH=${base_sbindir}:${base_bindir}:${sbindir}:${bindir}!' ${D}${bindir}/ntpdate-sync
+    sed -i 's!/usr/sbin/!${sbindir}/!g' ${D}${sysconfdir}/init.d/ntpd
+    sed -i 's!/usr/bin/!${bindir}/!g' ${D}${sysconfdir}/init.d/ntpd
+    sed -i 's!/etc/!${sysconfdir}/!g' ${D}${sysconfdir}/init.d/ntpd
+    sed -i 's!/var/!${localstatedir}/!g' ${D}${sysconfdir}/init.d/ntpd
     sed -i '1s,#!.*perl -w,#! ${bindir}/env perl,' ${D}${sbindir}/ntptrace
     sed -i '/use/i use warnings;' ${D}${sbindir}/ntptrace
     sed -i '1s,#!.*perl,#! ${bindir}/env perl,' ${D}${sbindir}/ntp-wait
@@ -115,26 +109,21 @@ do_install:append() {
     sed -i '/use/i use warnings;' ${D}${sbindir}/calc_tickadj
 
     install -d ${D}/${sysconfdir}/default
-    install -m 644 ${WORKDIR}/ntpdate.default ${D}${sysconfdir}/default/ntpdate
     install -m 0644 ${WORKDIR}/sntp ${D}${sysconfdir}/default/
 
-    install -d ${D}/${sysconfdir}/network/if-up.d
-    ln -s ${bindir}/ntpdate-sync ${D}/${sysconfdir}/network/if-up.d
-
     install -d ${D}${systemd_unitdir}/system
-    install -m 0644 ${WORKDIR}/ntpdate.service ${D}${systemd_unitdir}/system/
     install -m 0644 ${WORKDIR}/ntpd.service ${D}${systemd_unitdir}/system/
     install -m 0644 ${WORKDIR}/sntp.service ${D}${systemd_unitdir}/system/
 
     install -d ${D}${systemd_unitdir}/ntp-units.d
     install -m 0644 ${WORKDIR}/ntpd.list ${D}${systemd_unitdir}/ntp-units.d/60-ntpd.list
 
-    # Remove an empty libexecdir.
+    # Remove the empty libexecdir and bindir.
     rmdir --ignore-fail-on-non-empty ${D}${libexecdir}
+    rmdir --ignore-fail-on-non-empty ${D}${bindir}
 }
 
-PACKAGES += "ntpdate sntp ntpdc ntpq ${PN}-tickadj ${PN}-utils"
-# NOTE: you don't need ntpdate, use "ntpd -q -g -x"
+PACKAGES += "sntp ntpdc ntpq ${PN}-tickadj ${PN}-utils"
 
 # ntp originally includes tickadj. It's split off for inclusion in small firmware images on platforms
 # with wonky clocks (e.g. OpenSlug)
@@ -149,9 +138,8 @@ RCONFLICTS:${PN}-utils = "${PN}-bin"
 # ntpdc and ntpq were split out of ntp-utils
 RDEPENDS:${PN}-utils = "ntpdc ntpq"
 
-SYSTEMD_PACKAGES = "${PN} ntpdate sntp"
+SYSTEMD_PACKAGES = "${PN} sntp"
 SYSTEMD_SERVICE:${PN} = "ntpd.service"
-SYSTEMD_SERVICE:ntpdate = "ntpdate.service"
 SYSTEMD_SERVICE:sntp = "sntp.service"
 SYSTEMD_AUTO_ENABLE:sntp = "disable"
 
@@ -159,10 +147,6 @@ RPROVIDES:${PN} += "${PN}-systemd"
 RREPLACES:${PN} += "${PN}-systemd"
 RCONFLICTS:${PN} += "${PN}-systemd"
 
-RPROVIDES:ntpdate += "ntpdate-systemd"
-RREPLACES:ntpdate += "ntpdate-systemd"
-RCONFLICTS:ntpdate += "ntpdate-systemd"
-
 RSUGGESTS:${PN} = "iana-etc"
 
 FILES:${PN} = "${sbindir}/ntpd.ntp ${sysconfdir}/ntp.conf ${sysconfdir}/init.d/ntpd \
@@ -172,12 +156,6 @@ FILES:${PN} = "${sbindir}/ntpd.ntp ${sysconfdir}/ntp.conf ${sysconfdir}/init.d/n
 FILES:${PN}-tickadj = "${sbindir}/tickadj"
 FILES:${PN}-utils = "${sbindir} ${datadir}/ntp/lib"
 RDEPENDS:${PN}-utils += "perl"
-FILES:ntpdate = "${sbindir}/ntpdate \
-    ${sysconfdir}/network/if-up.d/ntpdate-sync \
-    ${bindir}/ntpdate-sync \
-    ${sysconfdir}/default/ntpdate \
-    ${systemd_unitdir}/system/ntpdate.service \
-"
 FILES:sntp = "${sbindir}/sntp \
               ${sysconfdir}/default/sntp \
               ${systemd_unitdir}/system/sntp.service \
@@ -186,20 +164,11 @@ FILES:ntpdc = "${sbindir}/ntpdc"
 FILES:ntpq = "${sbindir}/ntpq"
 
 CONFFILES:${PN} = "${sysconfdir}/ntp.conf"
-CONFFILES:ntpdate = "${sysconfdir}/default/ntpdate"
 
 INITSCRIPT_NAME = "ntpd"
 # No dependencies, so just go in at the standard level (20)
 INITSCRIPT_PARAMS = "defaults"
 
-pkg_postinst:ntpdate() {
-    if ! grep -q -s ntpdate $D/var/spool/cron/root; then
-        echo "adding crontab"
-        test -d $D/var/spool/cron || mkdir -p $D/var/spool/cron
-        echo "30 * * * *    ${bindir}/ntpdate-sync silent" >> $D/var/spool/cron/root
-    fi
-}
-
 inherit update-alternatives
 
 ALTERNATIVE_PRIORITY = "100"
-- 
2.39.0


