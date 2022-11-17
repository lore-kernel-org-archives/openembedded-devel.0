Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F182EC4332F
	for <webhook@archiver.kernel.org>; Thu, 17 Nov 2022 13:54:13 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.15953.1668693246026258804
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Nov 2022 05:54:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=RXOUTtlk;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8320786481=kai.kang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AHC0nj2010211
	for <openembedded-devel@lists.openembedded.org>; Thu, 17 Nov 2022 13:54:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : mime-version : content-type; s=PPS06212021;
 bh=JVBJj5vrSOPy5tip5pdDIhxgsD+kIXEph8iEM6o5Q7o=;
 b=RXOUTtlkAl/cYkDJjI1RKXHeP3QL+VzQS1fthpM3q1GRJiQKLbN666P3nMWGvQy94V7s
 jIBZUB5B9esxj357K075Cd9/mp3TXjVMtypv0IRHlANdVC5Xf1sz0pEa0K8H33m43yS7
 15hMihU4N/P8ouOXyIpxE6mEN+3E9LHup8NpAxJDzafy++P14dLNZVaQr/AzPA0YuUQT
 e2SwmOyE6DTsDouD6a2dvEhOU4X1rTnlTxUi2CEFTMUtfsHfp8WDKAor+eN3tMnbWUZq
 4js/bgL21gv0zIispUItbWsX9jbiZIcu9/h08Xu4SgYPMGBL5Med7wPm2PwGSwqwwFKH cA== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kwbu1gdee-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 17 Nov 2022 13:54:05 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 17 Nov 2022 05:54:03 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Thu, 17 Nov 2022 05:54:03 -0800
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][PATCH] freeradius: fix multilib systemd service start failure
Date: Thu, 17 Nov 2022 21:54:00 +0800
Message-ID: <20221117135400.38333-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: 3UUr1Y9mns8kM1lPp6hKz6ilWAwPJ0tI
X-Proofpoint-ORIG-GUID: 3UUr1Y9mns8kM1lPp6hKz6ilWAwPJ0tI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-17_06,2022-11-17_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999 phishscore=0
 adultscore=0 priorityscore=1501 clxscore=1011 bulkscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211170105
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Nov 2022 13:54:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99605

From: Kai Kang <kai.kang@windriver.com>

It fails to start radiusd.service from lib32-freeradius that the
configure directory is /etc/lib32-raddb rather than /etc/raddb. So add
an environment file to export a variable MLPREFIX for the service file
to make it start successfully.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../freeradius/files/radiusd.service          |  3 +-
 .../freeradius/freeradius_3.0.21.bb           | 30 +++++++++++++++++++
 2 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/freeradius/files/radiusd.service b/meta-networking/recipes-connectivity/freeradius/files/radiusd.service
index 37a2eb3d7..7969bfb69 100644
--- a/meta-networking/recipes-connectivity/freeradius/files/radiusd.service
+++ b/meta-networking/recipes-connectivity/freeradius/files/radiusd.service
@@ -4,10 +4,11 @@ After=syslog.target network.target
 
 [Service]
 Type=forking
+EnvironmentFile=-/etc/sysconfig/radiusd
 PIDFile=/run/radiusd/radiusd.pid
 ExecStartPre=-@BASE_BINDIR@/chown -R radiusd:radiusd /run/radiusd
 ExecStartPre=@SBINDIR@/radiusd -C
-ExecStart=@SBINDIR@/radiusd -d @SYSCONFDIR@/raddb
+ExecStart=@SBINDIR@/radiusd -d @SYSCONFDIR@/${MLPREFIX}raddb
 ExecReload=@SBINDIR@/radiusd -C
 ExecReload=@BASE_BINDIR@/kill -HUP $MAINPID
 
diff --git a/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.21.bb b/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.21.bb
index 1407b798b..b459412e0 100644
--- a/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.21.bb
+++ b/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.21.bb
@@ -199,7 +199,37 @@ pkg_postinst:${PN} () {
         # Fix ownership for /etc/raddb/*, /var/lib/radiusd
         chown -R radiusd:radiusd ${raddbdir}
         chown -R radiusd:radiusd ${localstatedir}/lib/radiusd
+
+        # for radiusd.service with multilib
+        if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+            install -d ${sysconfdir}/sysconfig
+            echo "MLPREFIX=${MLPREFIX}" > ${sysconfdir}/sysconfig/radiusd
+        fi
+    else
+        if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+            install -d $D${sysconfdir}/sysconfig
+            echo "MLPREFIX=${MLPREFIX}" > $D${sysconfdir}/sysconfig/radiusd
+        fi
+    fi
+}
+
+pkg_postrm:${PN} () {
+    # only try to remove ${sysconfdir}/sysconfig/radiusd for systemd
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'false', 'true', d)}; then
+        exit 0
+    fi
+
+    if [ -d ${sysconfdir}/raddb ]; then
+        exit 0
     fi
+    for variant in ${MULTILIB_GLOBAL_VARIANTS}; do
+        if [ -d ${sysconfdir}/${variant}-raddb ]; then
+            exit 0
+        fi
+    done
+
+    rm -f ${sysconfdir}/sysconfig/radiusd
+    rmdir --ignore-fail-on-non-empty ${sysconfdir}/sysconfig
 }
 
 # We really need the symlink :(
-- 
2.17.1


