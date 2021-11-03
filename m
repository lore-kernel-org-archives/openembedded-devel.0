Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2B98C433F5
	for <webhook@archiver.kernel.org>; Wed,  3 Nov 2021 09:14:06 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web12.5060.1635930845483529580
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Nov 2021 02:14:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com
 header.s=axis-central1 header.b=I4UJ4/kd;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1635930845;
  x=1667466845;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=E35oODVGcHDuftM2usMMR4GMqlbpKbF8lKV3heDw8aA=;
  b=I4UJ4/kd4bcJp0GbyNrm5QrhZu6cYsqMy3/7DKeeHER+NP0XdSd6pgxU
   n16u2CC9Vnqurp3KA3ZSMbB8RfVMj20KihlnYZQ4yyKKRYYB8F8kVdHvj
   K3e6+/6SGCeOhbZj2cCzm1NWa3IWpgyQJK7eUARKGE2AYXv24y74SF1Ck
   j/tTKYILPKLesowx5mjGY81+KIZsK7dAwLK2OyweMNfv3rke2AbWZZNtQ
   pZxGfslUUq27hQs6SxizXeQ70iIloegvPa1Eyz3VyN0KgWTP5tDHJ7308
   F/TP3yTh0trpbkrTW+caoAe2sbS/334Ms1O9aNuJKJm7AldsqZ53vFyrp
   A==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][PATCH] opensaf: Make sure a file needed by
 opensafd.service is not removed
Date: Wed, 3 Nov 2021 10:14:00 +0100
Message-ID: <20211103091400.29239-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Nov 2021 09:14:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93800

Rename /etc/init.d/opensafd to /usr/lib/opensaf/opensafd-init as it is
needed by opensafd.service, but /etc/init.d is removed by
systemd.bbclass if sysvinit is not in DISTRO_FEATURES.

Note that this will not actually make the initscript and service file
work since they depend on /lib/lsb/init-functions, which does not exist
since the lsb recipe was removed from OE-Core.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

This should apply on master-next.

 .../recipes-daemons/opensaf/opensaf_5.21.09.bb       | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta-networking/recipes-daemons/opensaf/opensaf_5.21.09.bb b/meta-networking/recipes-daemons/opensaf/opensaf_5.21.09.bb
index 1aacae9a6..c24fccf04 100644
--- a/meta-networking/recipes-daemons/opensaf/opensaf_5.21.09.bb
+++ b/meta-networking/recipes-daemons/opensaf/opensaf_5.21.09.bb
@@ -60,10 +60,14 @@ do_install:append() {
     rmdir "${D}${localstatedir}/log"
     rmdir --ignore-fail-on-non-empty "${D}${localstatedir}"
     rmdir --ignore-fail-on-non-empty "${D}${datadir}/java"
-    if [ ! -d "${D}${sysconfdir}/init.d" ]; then
-        install -d ${D}${sysconfdir}/init.d
-        install -m 0755 ${B}/osaf/services/infrastructure/nid/scripts/opensafd ${D}${sysconfdir}/init.d/
-    fi
+
+    # Rename /etc/init.d/opensafd to /usr/lib/opensaf/opensafd-init as it is
+    # needed by opensafd.service, but /etc/init.d is removed by systemd.bbclass
+    # if sysvinit is not in DISTRO_FEATURES.
+    mv ${D}${sysconfdir}/init.d/opensafd ${D}${libdir}/${BPN}/opensafd-init
+    ln -srf ${D}${libdir}/${BPN}/opensafd-init ${D}${sysconfdir}/init.d/opensafd
+    [ ! -f ${D}${systemd_system_unitdir}/opensafd.service ] ||
+        sed -ri -e "s|/etc/init.d/opensafd|${libdir}/${BPN}/opensafd-init|" ${D}${systemd_system_unitdir}/opensafd.service
 
     # Create /var/log/opensaf/saflog in runtime.
     if [ "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}" ]; then

