Return-Path: <zboszor@pr.hu>
Received: from mail9.pr.hu (mail9.pr.hu [87.242.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 3088C7CC87
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Feb 2019 09:55:26 +0000 (UTC)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1gyZSR-0000aA-17; Tue, 26 Feb 2019 10:55:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=XpR+7mq28/eHt4RqBHRmz5UZDoQbc5l/cMcHbpg7xWE=;
	b=QSk8FtwAqeUwWXFsflCQgZEskV
	XLDlQxgg9lp7nXb9chHki+ZLgeVZfWPYjLWeybH5SLFhHGYGwkA2sy2s+v2q8wq1WpaA9qFzyhC06
	POm8PQDmLrXIVQ/86ABhg/BBbzRrTDF9DyF5bxcJlr5B5YukXm3UV0u0OatuG3JQWzR/CrKQ0MJs5
	7tnln0qvDDb5wWfoSW0fHHJJo6/fFtP6E7vbqsLAd1M6UtbNr5ayGvHltYkFxlT6KKosLkCVtHsZm
	ov00Sm0qKIS/FwgtU549dNYOI9l2qdi58qzwGVQ1Wdc9OWX6QPWuOIeSqsf4HW0mlEyhHvsa+Nwlo
	oAgWTGKw==;
Received: from host-87-242-20-26.prtelecom.hu ([87.242.20.26]
	helo=localhost.localdomain.com) by mail.pr.hu with esmtpa (Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1gyZSJ-0005Cn-OL; Tue, 26 Feb 2019 10:55:24 +0100
From: =?UTF-8?q?B=C3=B6sz=C3=B6rm=C3=A9nyi=20Zolt=C3=A1n?= <zboszor@pr.hu>
To: openembedded-devel@lists.openembedded.org,
	Khem Raj <raj.khem@gmail.com>
Date: Tue, 26 Feb 2019 10:55:01 +0100
Message-Id: <20190226095502.5499-7-zboszor@pr.hu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190226095502.5499-1-zboszor@pr.hu>
References: <20190220043740.27952-1-zboszor@pr.hu>
	<20190226095502.5499-1-zboszor@pr.hu>
MIME-Version: 1.0
X-Spam-Score: -1.9 (-)
X-Scan-Signature: dda648b1d3e643e91fd1a0320e0a0c7d
X-Spam-Tracer: backend.mail.pr.hu -1.9 20190226095524Z
Subject: [meta-oe][PATCH 6/7] plymouth: Use plymouth_initrd DISTRO_FEATURE
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Feb 2019 09:55:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

dracut conditionally depends plymouth-initrd using the same
DISTRO_FEATURE knob.

Signed-off-by: Böszörményi Zoltán <zboszor@pr.hu>
---
 meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb b/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb
index a5b16c979..b7be9f04b 100644
--- a/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb
+++ b/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb
@@ -36,7 +36,6 @@ PACKAGECONFIG_append_x86-64 = " drm"
 PACKAGECONFIG[drm] = "--enable-drm,--disable-drm,libdrm"
 PACKAGECONFIG[pango] = "--enable-pango,--disable-pango,pango"
 PACKAGECONFIG[gtk] = "--enable-gtk,--disable-gtk,gtk+3"
-PACKAGECONFIG[initrd] = ",,,"
 
 LOGO ??= "${datadir}/plymouth/bizcom.png"
 
@@ -46,12 +45,12 @@ do_install_append() {
     # Remove /var/run from package as plymouth will populate it on startup
     rm -fr "${D}${localstatedir}/run"
 
-    if ! ${@bb.utils.contains('PACKAGECONFIG', 'initrd', 'true', 'false', d)}; then
+    if ! ${@bb.utils.contains('DISTRO_FEATURES', 'plymouth_initrd', 'true', 'false', d)}; then
         rm -rf "${D}${libexecdir}"
     fi
 }
 
-PACKAGES =. "${@bb.utils.contains('PACKAGECONFIG', 'initrd', '${PN}-initrd ', '', d)}"
+PACKAGES =. "${@bb.utils.contains('DISTRO_FEATURES', 'plymouth_initrd', '${PN}-initrd ', '', d)}"
 PACKAGES =+ "${PN}-set-default-theme"
 
 FILES_${PN}-initrd = "${libexecdir}/plymouth/*"
-- 
2.20.1


