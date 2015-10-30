Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 94FAC76F58
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Oct 2015 12:14:24 +0000 (UTC)
Received: by wmff134 with SMTP id f134so10430849wmf.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Oct 2015 05:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=qxi6q3M5YZGgYYiJFp/U4W3nGMmFbmipqL/kujYw3G0=;
	b=Zr22vtwqOL0fsXHITvd5svCpnMM6InDtnc4xnLfZvBM3zhKCDtqRk45ErXRaSaxLqB
	4a40SfBkZgriQuPbeRyagnivuD9SuI86MIlMU892K1eO8gfH2GNPQGzeMcLNV8LoTrtu
	pW3Wi0zYDdKmQrEmkIljobkZ6YmKpb2ySn8QcWO+8ntfFAA62Wllykl6yxKgKjKezHMB
	xOF3ZbiDNGt9ksQNFr2fb3UAav0WWRuhqqrb8wfvORH0QbmdqKndvBFm4MNa/5pmqmyN
	6y6XeQgVpzgwD4DSUZmEeqzdtwuJETKOLogge2MjK9luWMYQt8MMhoIyYjSVK4tZnHcS
	TkZw==
X-Received: by 10.28.13.78 with SMTP id 75mr3254475wmn.24.1446207264093;
	Fri, 30 Oct 2015 05:14:24 -0700 (PDT)
Received: from localhost.localdomain
	(ip-95-222-156-185.hsi15.unitymediagroup.de. [95.222.156.185])
	by smtp.googlemail.com with ESMTPSA id
	184sm2636122wmk.10.2015.10.30.05.14.23
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 30 Oct 2015 05:14:23 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Oct 2015 13:13:41 +0100
Message-Id: <1446207225-15386-10-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1446207225-15386-1-git-send-email-schnitzeltony@googlemail.com>
References: <1446207225-15386-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 09/13] netcf: use bootstrap.bbclass
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
X-List-Received-Date: Fri, 30 Oct 2015 12:14:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-networking/recipes-support/netcf/netcf_git.bb | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/meta-networking/recipes-support/netcf/netcf_git.bb b/meta-networking/recipes-support/netcf/netcf_git.bb
index 8a8963e..9ac84ab 100644
--- a/meta-networking/recipes-support/netcf/netcf_git.bb
+++ b/meta-networking/recipes-support/netcf/netcf_git.bb
@@ -16,19 +16,13 @@ DEPENDS += "augeas libnl libxslt libxml2 gnulib"
 
 S = "${WORKDIR}/git"
 
-inherit gettext autotools-brokensep pkgconfig systemd
+inherit gettext bootstrap pkgconfig systemd
 
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


