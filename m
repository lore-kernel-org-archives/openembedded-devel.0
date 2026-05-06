Return-Path: <piotr.wejman@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CE33CD343B
	for <webhook@archiver.kernel.org>; Wed,  6 May 2026 17:24:44 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24248.1778088281325125999
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 May 2026 10:24:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=W2jtslsP;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: piotr.wejman@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3F9CB1A00;
	Wed,  6 May 2026 10:24:35 -0700 (PDT)
Received: from e134100.nice.arm.com (e134100.arm.com [10.34.101.65])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7821F3F7B4;
	Wed,  6 May 2026 10:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778088280; bh=gFZHopw78GS8k0JQpcF8O38CB6AcWAuC37DT+31I+iI=;
	h=From:To:Cc:Subject:Date:From;
	b=W2jtslsPFFyn9eeHOIvL2qIM+yjuvI6Y1AJOz6pPFQ0IMzkFFBpX0JkRoXi1qxa9O
	 7EcZK1iP4pVkvopfNtqLQh9OPD1uGmgaJh3xUhF/eDOPOrrU4oUc2A9Spa/T0A7Jra
	 yb2Q8UuUX824kETQAgY1AprzuZF7lKee0/VFzRvg=
From: Piotr Wejman <piotr.wejman@arm.com>
To: openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com,
	joe@deserted.net,
	ross.burton@arm.com,
	vincent.mailhol@arm.com,
	Piotr Wejman <piotr.wejman@arm.com>
Subject: [meta-networking][PATCH] nftables: add systemd PACKAGECONFIG
Date: Wed,  6 May 2026 19:22:56 +0200
Message-ID: <20260506172256.1259293-1-piotr.wejman@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 May 2026 17:24:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126807

Add a systemd PACKAGECONFIG option to install nftables systemd unit files=
.
When "systemd" is present in DISTRO_FEATURES, the option is enabled and
the service is installed but disabled by default.

Signed-off-by: Piotr Wejman <piotr.wejman@arm.com>
---
 meta-networking/recipes-filter/nftables/nftables_1.1.6.bb | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-filter/nftables/nftables_1.1.6.bb b/=
meta-networking/recipes-filter/nftables/nftables_1.1.6.bb
index d27e60a18d..dbe0e8f9f5 100644
--- a/meta-networking/recipes-filter/nftables/nftables_1.1.6.bb
+++ b/meta-networking/recipes-filter/nftables/nftables_1.1.6.bb
@@ -16,9 +16,9 @@ SRC_URI =3D "http://www.netfilter.org/projects/nftables=
/files/${BP}.tar.xz \
           "
 SRC_URI[sha256sum] =3D "372931bda8556b310636a2f9020adc710f9bab66f47efe0c=
e90bff800ac2530c"
=20
-inherit autotools manpages pkgconfig ptest python3native
+inherit autotools manpages pkgconfig ptest python3native systemd
=20
-PACKAGECONFIG ?=3D "python readline json"
+PACKAGECONFIG ?=3D "python readline json ${@bb.utils.filter('DISTRO_FEAT=
URES', 'systemd', d)}"
 PACKAGECONFIG[editline] =3D "--with-cli=3Deditline, , libedit, , , linen=
oise readline"
 PACKAGECONFIG[json] =3D "--with-json, --without-json, jansson"
 PACKAGECONFIG[linenoise] =3D "--with-cli=3Dlinenoise, , linenoise, , , e=
ditline readline"
@@ -27,10 +27,14 @@ PACKAGECONFIG[mini-gmp] =3D "--with-mini-gmp, --witho=
ut-mini-gmp"
 PACKAGECONFIG[python] =3D ""
 PACKAGECONFIG[readline] =3D "--with-cli=3Dreadline, , readline, , , edit=
line linenoise"
 PACKAGECONFIG[xtables] =3D "--with-xtables, --without-xtables, iptables"
+PACKAGECONFIG[systemd] =3D "--with-unitdir=3D${systemd_system_unitdir}, =
--without-unitdir"
=20
 EXTRA_OECONF =3D " \
     ${@bb.utils.contains_any('PACKAGECONFIG', 'editline linenoise readli=
ne', '', '--without-cli', d)}"
=20
+SYSTEMD_SERVICE:${PN} =3D "nftables.service"
+SYSTEMD_AUTO_ENABLE:${PN} =3D "disable"
+
 PEP517_SOURCE_PATH =3D "${S}/py"
=20
 # xtables will need it on musl see iptables

