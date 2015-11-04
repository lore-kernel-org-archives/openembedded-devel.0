Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 124EF77140
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Nov 2015 23:44:26 +0000 (UTC)
Received: by wmeg8 with SMTP id g8so54571039wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Nov 2015 15:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=V0DQfXH+ufaLtopDWU2OBPaEI+RubzmDddN81SUMbvY=;
	b=M3+bBekwxfI5NtlRC/+BkDBEyFgbUqBkTXK3r1FLGawf4ucejr2Pubqnd9on3SB01j
	hpcLlF59hqNIJuB7BUIwPbRJuOsG8Ko3yegvC6DZxYFtGyA2Wo92lbVV6sV2g3fO8INq
	5AFH+UJWTPBqtZh8fpWbvToWWjBwETOZszYcOyN1KlORI+Ic4ZqmUvvygrK8ao52Vrlj
	5qXMg6xGv7YTqPTSbTdhswzU8UqXU/WfqWoyMrjTbIopRGZlWPpK5cpzASq8CuL3vzhU
	gFS/oMt28ifuZDpQjT6RUZRaTg7GYUKtTAp+EuLVm91Uc1oAPH6EzmdiqEUkrnyTaoZW
	zsWg==
X-Received: by 10.28.143.1 with SMTP id r1mr30252927wmd.80.1446680666180;
	Wed, 04 Nov 2015 15:44:26 -0800 (PST)
Received: from localhost.localdomain (p5B0A127D.dip0.t-ipconnect.de.
	[91.10.18.125]) by smtp.googlemail.com with ESMTPSA id
	184sm5390014wmk.10.2015.11.04.15.44.25
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Nov 2015 15:44:25 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Nov 2015 00:43:51 +0100
Message-Id: <1446680640-31722-10-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1446680640-31722-1-git-send-email-schnitzeltony@googlemail.com>
References: <1446680640-31722-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH][v2 09/18] netcf: use autotools-bootstrap.bbclass
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 04 Nov 2015 23:44:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-networking/recipes-support/netcf/netcf_git.bb | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/meta-networking/recipes-support/netcf/netcf_git.bb b/meta-networking/recipes-support/netcf/netcf_git.bb
index 8a8963e..26c738b 100644
--- a/meta-networking/recipes-support/netcf/netcf_git.bb
+++ b/meta-networking/recipes-support/netcf/netcf_git.bb
@@ -16,19 +16,13 @@ DEPENDS += "augeas libnl libxslt libxml2 gnulib"
 
 S = "${WORKDIR}/git"
 
-inherit gettext autotools-brokensep pkgconfig systemd
+inherit gettext autotools-bootstrap pkgconfig systemd
 
 EXTRA_OECONF_append_class-target = " --with-driver=redhat"
 
 PACKAGECONFIG ??= "${@bb.utils.contains("DISTRO_FEATURES", "systemd", "systemd", "", d)}"
 PACKAGECONFIG[systemd] = "--with-sysinit=systemd,--with-sysinit=initscripts,"
 
-do_configure_prepend() {
-	cd ${S}
-	rm -f .gitmodules
-	./bootstrap --gnulib-srcdir=${STAGING_DATADIR}/gnulib
-}
-
 do_install_append() {
     if ${@base_contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
        install -d ${D}${systemd_unitdir}/system
-- 
2.1.0


