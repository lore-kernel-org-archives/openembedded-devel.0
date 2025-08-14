Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E38ACA0EDC
	for <webhook@archiver.kernel.org>; Thu, 14 Aug 2025 17:44:44 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web10.28823.1755193481387606545
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Aug 2025 10:44:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=TpRHj1k0;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20250814174437e3377d28926df7f2eb-evkv6a@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20250814174437e3377d28926df7f2eb
        for <openembedded-devel@lists.openembedded.org>;
        Thu, 14 Aug 2025 19:44:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:References:In-Reply-To;
 bh=RXPUpgEWi/TXPtvZuX+Mri8R2hAR4mspnapwbAB8JIc=;
 b=TpRHj1k0hZd2LnfTK9sTBnP5fBvx9N2KZ1reWm6y/3IS3StkT2feNmNdDgOwWTGti3hxHV
 cJd/HR5pWHIljvqKufPybUcJIVOzU63Yj5T9dUT5LGjWnf5FDQe7IVNj1WKm3gtJrSjLSB0/
 aPOHz79kBgjruF6RKm2h1SECbNfELcYkqu+okjuHdVqmPDZEzxRnn6aeLmV5W5VSJtIQ4mbB
 ckuzqR8PQ48dzPxYxllYY0aq0G6fLbUF7HyyLN9D4esHpiOEE52xKYQedkNLYUsCr3OZ5EIw
 sp5wVcolR0bURC4sHxIwRz7wWqnrKp+zKVjw3qpjU0KIdPNWG0WSxoaA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][walnascar][PATCH 2/5] corosync: upgrade 3.1.6 -> 3.1.9
Date: Thu, 14 Aug 2025 19:43:49 +0200
Message-Id: <20250814174352.10670-2-peter.marko@siemens.com>
In-Reply-To: <20250814174352.10670-1-peter.marko@siemens.com>
References: <20250814174352.10670-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Aug 2025 17:44:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118938

From: Peter Marko <peter.marko@siemens.com>

dbus dir was changed from sysconfdir to datadir

drop unused configure code

License-Update: copyright years refreshed

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
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

