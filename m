Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BCF3C369D5
	for <webhook@archiver.kernel.org>; Sun, 27 Apr 2025 21:30:12 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web11.34313.1745789401611435617
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Apr 2025 14:30:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=gOyqqVqa;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-202504272129592f24da79145585879c-tqw_6d@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202504272129592f24da79145585879c
        for <openembedded-devel@lists.openembedded.org>;
        Sun, 27 Apr 2025 23:29:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=oJS94UBtmAX0M5jXA/5fjPMiR5Cz1tslNKOjRyjBuOI=;
 b=gOyqqVqaw+mongnvkzgOrFLec32QQbb/M7yTH5hXbSR25z+0agthgddiXTQFZDDkAqdgga
 uzghjlqfIZyy/qz+jGm6slZX5hJU4PY9t8HhMVMjh2gVEmJHTZK+XaMVweTx5Fn1UsvLXpLt
 Qf/PI0F1gJ45eA3u1qgZDeq3n8g3W3g4OBkU3rGvLItOzqUQGeK5DP1MELzXpgLO7TuwOqVH
 P2tW1m+ei5CtzRjru7pCu36St5+cHLx1E5BWR79Vhui3KXfpmlwc8kxm4T4eHkW8e1TJBP/C
 C2JTwl674qmhWwSzO4vPprfN3VIwPWHZytus3CXdAEb/k6Ww7bevSjRw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-networking][PATCH 2/3] corosync: upgrade 3.1.6 -> 3.1.9
Date: Sun, 27 Apr 2025 23:28:43 +0200
Message-Id: <20250427212844.1992660-2-peter.marko@siemens.com>
In-Reply-To: <20250427212844.1992660-1-peter.marko@siemens.com>
References: <20250427212844.1992660-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Apr 2025 21:30:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117179

From: Peter Marko <peter.marko@siemens.com>

dbus dir was changed from sysconfdir to datadir

drop unused configure code

License-Update: copyright years refreshed

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../corosync/{corosync_3.1.6.bb => corosync_3.1.9.bb}  | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)
 rename meta-networking/recipes-extended/corosync/{corosync_3.1.6.bb => corosync_3.1.9.bb} (90%)

diff --git a/meta-networking/recipes-extended/corosync/corosync_3.1.6.bb b/meta-networking/recipes-extended/corosync/corosync_3.1.9.bb
similarity index 90%
rename from meta-networking/recipes-extended/corosync/corosync_3.1.6.bb
rename to meta-networking/recipes-extended/corosync/corosync_3.1.9.bb
index e8e4540a21..af023307bb 100644
--- a/meta-networking/recipes-extended/corosync/corosync_3.1.6.bb
+++ b/meta-networking/recipes-extended/corosync/corosync_3.1.9.bb
@@ -10,11 +10,11 @@ inherit autotools pkgconfig systemd github-releases
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz \
            file://corosync.conf \
           "
-SRC_URI[sha256sum] = "ca6ed32b4d7f33ed614afce8760fe58d0de92c68b575d4969ebacd892f3d1e27"
+SRC_URI[sha256sum] = "203354bbddee1a97b3c50a076eae89c635f406dd674ccaefc94bb9092acd9535"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=a85eb4ce24033adb6088dd1d6ffc5e5d"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d9c2cca5d3448c43e52a399ad611658a"
 
 DEPENDS = "groff-native nss libqb kronosnet"
 
@@ -34,11 +34,6 @@ PACKAGECONFIG[systemd] = "--enable-systemd --with-systemddir=${systemd_system_un
 EXTRA_OECONF = "ac_cv_path_BASHPATH=${base_bindir}/bash ap_cv_cc_pie=no"
 EXTRA_OEMAKE = "tmpfilesdir_DATA="
 
-#do_configure:prepend() {
-#    ( cd ${S}
-#    ${S}/autogen.sh )
-#}
-
 do_install:append() {
     install -D -m 0644 ${UNPACKDIR}/corosync.conf ${D}${sysconfdir}/corosync/corosync.conf.example
     install -d ${D}${sysconfdir}/sysconfig/
@@ -59,5 +54,6 @@ do_install:append() {
 
 RDEPENDS:${PN} += "bash ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'sysvinit-pidof', 'procps', d)}"
 
+FILES:${PN} += "${datadir}/dbus-1"
 FILES:${PN}-dbg += "${libexecdir}/lcrso/.debug"
 FILES:${PN}-doc += "${datadir}/snmp/mibs/COROSYNC-MIB.txt"

