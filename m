Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC166D25026
	for <webhook@archiver.kernel.org>; Sat, 10 Jan 2026 21:34:56 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17174.1768080884927824596
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 10 Jan 2026 13:34:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=SSbYZ+zg;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-202601102134410ad6237773000207e2-5vuja1@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 202601102134410ad6237773000207e2
        for <openembedded-devel@lists.openembedded.org>;
        Sat, 10 Jan 2026 22:34:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=ef7IvItZgJakevDL+5J8ymwSQsGnkZF+VmLzGBEVmQs=;
 b=SSbYZ+zg2HNTpotga97FAJzHM9JPp/spkTdAzUHtwGjgRp2ijV1vrlEyRsHbcFRIObMkK8
 JhqS551rlP71wXfY7Q05pG8k00h/Q+xLj6+vj5NVXmdQp2QneMkmzVvMu/1Xux7VutvqZpt9
 vDNCD6qrWIXdRWTh/eVH4auHQiNY8mbRuEZhnSap3TaF3sJZeMxIpJX/FBFmApHBXOUTGf85
 AgfIM80gXKOJ9fPDxJZo5uxcRDvzTBpxbap8InNpdePxjHSqoIeMv7//hnzNRAeI/6Ylo6Du
 JPoZFSQQvNaS3N6N0MNMBgqywjXHQ6FKw1ex39c+BSNcePBKMl1qU26w==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-networking][scarthgap][PATCH] networkmanager: upgrade 1.46.0 -> 1.46.6
Date: Sat, 10 Jan 2026 22:34:25 +0100
Message-Id: <20260110213425.114224-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 10 Jan 2026 21:34:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123337

From: Peter Marko <peter.marko@siemens.com>

Solves CVE-2024-6501 (in 1.46.4).

Release notes:
https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/blob/1.46.6/NEWS?ref_type=tags

Switch SRC_URI for gnome Gitlab as gnome mirror no longer contains new
releases.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../{networkmanager_1.46.0.bb => networkmanager_1.46.6.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/networkmanager/{networkmanager_1.46.0.bb => networkmanager_1.46.6.bb} (98%)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.46.0.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.46.6.bb
similarity index 98%
rename from meta-networking/recipes-connectivity/networkmanager/networkmanager_1.46.0.bb
rename to meta-networking/recipes-connectivity/networkmanager/networkmanager_1.46.6.bb
index 1b4003df18..8bf0942a21 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.46.0.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.46.6.bb
@@ -35,14 +35,14 @@ DEPENDS:append:class-target = " bash-completion"
 inherit gnomebase gettext update-rc.d systemd gobject-introspection gtk-doc update-alternatives upstream-version-is-even
 
 SRC_URI = " \
-    ${GNOME_MIRROR}/NetworkManager/${@gnome_verdir("${PV}")}/NetworkManager-${PV}.tar.xz \
+    https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/releases/${PV}/downloads/NetworkManager-${PV}.tar.xz \
     file://${BPN}.initd \
     file://enable-dhcpcd.conf \
     file://enable-iwd.conf \
 "
 SRC_URI:append:libc-musl = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', ' file://0001-linker-scripts-Do-not-export-_IO_stdin_used.patch', '', d)}"
 
-SRC_URI[sha256sum] = "722649e25362693b334371473802a729b0ec9ee283375096905f868808e74068"
+SRC_URI[sha256sum] = "1076c5ee2d60fa09e4af21f2d1bfe638973647c28c9b228d6d44a7044b735eaf"
 
 S = "${WORKDIR}/NetworkManager-${PV}"
 

