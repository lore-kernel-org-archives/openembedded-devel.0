Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13BF1C433FE
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 09:23:04 +0000 (UTC)
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web08.4144.1667380975137019936
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Nov 2022 02:22:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: lakka.kapsi.fi, ip: 91.232.154.25, mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([2001:67c:1be8::11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1oq9xS-00FkF7-S9; Wed, 02 Nov 2022 11:22:51 +0200
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1oq9xS-00HOfA-HI; Wed, 02 Nov 2022 11:22:50 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-devel@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [meta-oe][kirkstone][PATCH v2] fwupd: fix ${datadir}/polkit-1/rules.d permissions
Date: Wed,  2 Nov 2022 11:22:43 +0200
Message-Id: <20221102092243.4145040-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspam-Score: -0.2 (/)
X-Rspam-Report: Action: no action
 Symbol: RCVD_TLS_LAST(0.00)
 Symbol: ARC_NA(0.00)
 Symbol: DMARC_POLICY_SOFTFAIL(0.10)
 Symbol: FROM_HAS_DN(0.00)
 Symbol: TO_DN_SOME(0.00)
 Symbol: R_MISSING_CHARSET(0.50)
 Symbol: TO_MATCH_ENVRCPT_ALL(0.00)
 Symbol: MIME_GOOD(-0.10)
 Symbol: SUBJECT_HAS_CURRENCY(1.00)
 Symbol: RCPT_COUNT_TWO(0.00)
 Symbol: MID_CONTAINS_FROM(1.00)
 Symbol: NEURAL_HAM(-0.00)
 Symbol: R_SPF_NA(0.00)
 Symbol: FORGED_SENDER(0.30)
 Symbol: R_DKIM_NA(0.00)
 Symbol: MIME_TRACE(0.00)
 Symbol: ASN(0.00)
 Symbol: FROM_NEQ_ENVFROM(0.00)
 Symbol: BAYES_HAM(-3.00)
 Symbol: RCVD_COUNT_TWO(0.00)
 Message-ID: 20221102092243.4145040-1-mikko.rapeli@linaro.org
X-SA-Exim-Connect-IP: 2001:67c:1be8::11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Nov 2022 09:23:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99416

They need to be the same as systemd which creates the
directory or rpm/dnf will fail rootfs build with error:

Error: Transaction test error:
  file /usr/share/polkit-1/rules.d conflicts between attempted installs of fwupd-1.7.6-r0.qemuarm64 and systemd-1:250.5-r0.armv8a

"bitbake -c install systemd && bitbake -c devshell systemd"
shows that the permissons should be:

  2581167      1 drwx------   2 polkitd  root            3 Oct 28 11:22 ../image/usr/share/polkit-1/rules.d

but "bitbake -c install fwupd && bitbake -c devshell fwupd" shows
the permissions as:

  2554626      1 drwxr-xr-x   2 root     root            3 Oct 28 11:17 ../image/usr/share/polkit-1/rules.d

Now they are fixed to be the same and installing both systemd and fwupd
to rootfs works with rpm and dnf.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta-oe/recipes-bsp/fwupd/fwupd_1.7.6.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)

v2: removed check for polkit in PACKAGECONFIG, using these permissions
for polkit-1/rules.d in all configurations

v1: https://lists.openembedded.org/g/openembedded-devel/message/99334

diff --git a/meta-oe/recipes-bsp/fwupd/fwupd_1.7.6.bb b/meta-oe/recipes-bsp/fwupd/fwupd_1.7.6.bb
index 53f1720b0..ccce4b1df 100644
--- a/meta-oe/recipes-bsp/fwupd/fwupd_1.7.6.bb
+++ b/meta-oe/recipes-bsp/fwupd/fwupd_1.7.6.bb
@@ -125,3 +125,14 @@ FILES:${PN} += "${libdir}/fwupd-plugins-* \
 FILES:${PN}-ptest += "${libexecdir}/installed-tests/ \
                       ${datadir}/installed-tests/"
 RDEPENDS:${PN}-ptest += "gnome-desktop-testing"
+
+do_install:append() {
+        # do the same as systemd to avoid rpm/dnf errors when installing both
+        # If polkit is setup fixup permissions and ownership
+        if ${@bb.utils.contains('PACKAGECONFIG', 'polkit', 'true', 'false', d)}; then
+                if [ -d ${D}${datadir}/polkit-1/rules.d ]; then
+                        chmod 700 ${D}${datadir}/polkit-1/rules.d
+                        chown polkitd:root ${D}${datadir}/polkit-1/rules.d
+                fi
+        fi
+}
-- 
2.17.1


