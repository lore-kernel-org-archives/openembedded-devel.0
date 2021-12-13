Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49CEBC4332F
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 11:05:20 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.9737.1639393519205505946
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Dec 2021 03:05:20 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 665F0D6E
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Dec 2021 03:05:19 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 119B23F793
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Dec 2021 03:05:18 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 05/12] dhcp-relay: remove obsolete support for renamed libtool
Date: Mon, 13 Dec 2021 11:05:04 +0000
Message-Id: <20211213110511.3274555-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211213110511.3274555-1-ross.burton@arm.com>
References: <20211213110511.3274555-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Dec 2021 11:05:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94319

libtool is now longer renamed to ${host}-libtool, so remove the changes
to support this.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-connectivity/dhcp/dhcp-relay_4.4.2p1.bb            | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.2p1=
.bb b/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.2p1.bb
index 93364758e3..8e41609f00 100644
--- a/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.2p1.bb
+++ b/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.2p1.bb
@@ -43,7 +43,6 @@ EXTRA_OECONF =3D "--enable-paranoia \
                 --enable-libtool \
                 --with-randomdev=3D/dev/random \
                "
-EXTRA_OEMAKE +=3D "LIBTOOL=3D'${S}/${HOST_SYS}-libtool'"
=20
 # Enable shared libs per dhcp README
 do_configure:prepend () {
@@ -59,7 +58,7 @@ do_compile:prepend() {
     install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}=
/bind/bind-9.11.32/
     cp -fpR ${S}/m4/*.m4 ${S}/bind/bind-9.11.32/libtool.m4/
     rm -rf ${S}/bind/bind-9.11.32/libtool
-    install -m 0755 ${S}/${HOST_SYS}-libtool ${S}/bind/bind-9.11.32/
+    install -m 0755 ${S}/libtool ${S}/bind/bind-9.11.32/
 }
=20
 do_install:append () {
--=20
2.25.1


