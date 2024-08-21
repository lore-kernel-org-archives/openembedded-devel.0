Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC913C52D7C
	for <webhook@archiver.kernel.org>; Wed, 21 Aug 2024 17:44:48 +0000 (UTC)
Received: from smtp-bc0d.mail.infomaniak.ch (smtp-bc0d.mail.infomaniak.ch [45.157.188.13])
 by mx.groups.io with SMTP id smtpd.web11.168.1724258011454023487
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Aug 2024 09:33:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 45.157.188.13, mailfrom: foss+yocto@0leil.net)
Received: from smtp-4-0001.mail.infomaniak.ch (smtp-4-0001.mail.infomaniak.ch [10.7.10.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4WpsMs5g2tz7N6;
	Wed, 21 Aug 2024 18:33:29 +0200 (CEST)
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4WpsMs0H9JzcmR;
	Wed, 21 Aug 2024 18:33:28 +0200 (CEST)
From: "Quentin Schulz" <foss@0leil.net>
Date: Wed, 21 Aug 2024 18:33:09 +0200
Subject: [PATCH meta-networking] nftables: fix pep517-backend warning
MIME-Version: 1.0
Message-Id: <20240821-nftables-pep517-v1-1-cf0e2b15986a@cherry.de>
X-B4-Tracking: v=1; b=H4sIAMQWxmYC/x3MSwqAIBRG4a3EHSeo2HMr0cDqty6EiUYE0d6Th
 t/gnIcSIiNRXzwUcXHiw2eosqB5s36F4CWbtNRGtloJ70477UgiIFSqEZ1DV0vTOjuBchUiHN/
 /cRjf9wMFBYTCYQAAAA==
To: joe@deserted.net, raj.khem@gmail.com, 
 openembedded-devel@lists.openembedded.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.0
X-Infomaniak-Routing: alpha
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Aug 2024 17:44:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111895

From: Quentin Schulz <quentin.schulz@cherry.de>

nftables has a pyproject.toml file since v1.0.9, c.f.
https://git.netfilter.org/nftables/commit/?id=8e603e0f7eec7c0000344a004228a30fbf0ece5c

Styhead has started to complain when a recipe inherits setuptools3 and a
proper pyproject.toml is provided in sources.

This uses python_pep517 functions instead of the setuptools3 ones,
inherits the proper class (still using setuptools3 but through pep517
process).

Notably, the python PACKAGECONFIG has its build dependency on
python3-setuptools-native removed as it's brought in by
python_setuptools_build_meta inherit, which is performed whenever the
python PACKAGECONFIG is selected. This avoids a "duplicate" but no
change in behavior is expected.

This was only build tested.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
I assume this could also be backported to scarthgap since 1.0.9 is in
that branch. Though that shouldn't fix or improve anything, so not sure
it's a good candidate for backporting?
---
 meta-networking/recipes-filter/nftables/nftables_1.1.0.bb | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-networking/recipes-filter/nftables/nftables_1.1.0.bb b/meta-networking/recipes-filter/nftables/nftables_1.1.0.bb
index 1dfaad494..98e7a85a4 100644
--- a/meta-networking/recipes-filter/nftables/nftables_1.1.0.bb
+++ b/meta-networking/recipes-filter/nftables/nftables_1.1.0.bb
@@ -24,16 +24,16 @@ PACKAGECONFIG[json] = "--with-json, --without-json, jansson"
 PACKAGECONFIG[linenoise] = "--with-cli=linenoise, , linenoise, , , editline readline"
 PACKAGECONFIG[manpages] = "--enable-man-doc, --disable-man-doc, asciidoc-native"
 PACKAGECONFIG[mini-gmp] = "--with-mini-gmp, --without-mini-gmp"
-PACKAGECONFIG[python] = ",, python3-setuptools-native"
+PACKAGECONFIG[python] = ""
 PACKAGECONFIG[readline] = "--with-cli=readline, , readline, , , editline linenoise"
 PACKAGECONFIG[xtables] = "--with-xtables, --without-xtables, iptables"
 
 EXTRA_OECONF = " \
     ${@bb.utils.contains_any('PACKAGECONFIG', 'editline linenoise readline', '', '--without-cli', d)}"
 
-SETUPTOOLS_SETUP_PATH = "${S}/py"
+PEP517_SOURCE_PATH = "${S}/py"
 
-inherit_defer ${@bb.utils.contains('PACKAGECONFIG', 'python', 'setuptools3', '', d)}
+inherit_defer ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python_setuptools_build_meta', '', d)}
 
 PACKAGES =+ "${@bb.utils.contains('PACKAGECONFIG', 'python', '${PN}-python', '', d)}"
 FILES:${PN}-python = "${PYTHON_SITEPACKAGES_DIR}"
@@ -44,21 +44,21 @@ RDEPENDS:${PN}-python = "python3-core python3-json ${PN}"
 do_configure() {
     autotools_do_configure
     if ${@bb.utils.contains('PACKAGECONFIG', 'python', 'true', 'false', d)}; then
-        setuptools3_do_configure
+        python_pep517_do_configure
     fi
 }
 
 do_compile() {
     autotools_do_compile
     if ${@bb.utils.contains('PACKAGECONFIG', 'python', 'true', 'false', d)}; then
-        setuptools3_do_compile
+        python_pep517_do_compile
     fi
 }
 
 do_install() {
     autotools_do_install
     if ${@bb.utils.contains('PACKAGECONFIG', 'python', 'true', 'false', d)}; then
-        setuptools3_do_install
+        python_pep517_do_install
     fi
 }
 

---
base-commit: ec936d6893b95a6c191c324ff2448444ac56d6dc
change-id: 20240821-nftables-pep517-9fe96048fabe

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>


