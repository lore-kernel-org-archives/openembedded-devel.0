Return-Path: <psaavedra@igalia.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8422CCA0EFC
	for <webhook@archiver.kernel.org>; Fri, 22 Aug 2025 11:58:43 +0000 (UTC)
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by mx.groups.io with SMTP id smtpd.web11.8318.1755863919603162998
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Aug 2025 04:58:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@igalia.com header.s=20170329 header.b=ovR/NZ5L;
 spf=pass (domain: igalia.com, ip: 213.97.179.56, mailfrom: psaavedra@igalia.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=txFeawrlA+S7r9aiWhF9VVD/5N6rymMgsvEHtPUfH60=; b=ovR/NZ5L8F/8yP4V5+DZPd6CWu
	WW04kAuN7CF8LJoinpCFB9NU0cpbR61wrkVvGvaVQo7UNe40R2q0V++eJBIfciFePJ1YEAetFuqo/
	vf2gmNFsi3bUX8YTQ79+j1/qPJiMb6fLfXchBm/feBcOiu8S9Tx5qb1wYcnnuW3O9T/Fi6M7IEXM2
	/yYICWcb82cUcK6/GYfZG46f8axLOtTw+tq0s2iNTBi281x1kPpCvmBic3aoTl/H4+WIZb5QQB2fP
	gHjCkEf3iXYbKtaHxrEfCbBAkbc47V5OIxKcVy44h0GPGmSoV769N5ZPh+qxolO8jCXSJMmHIXceW
	f9VDe0/Q==;
Received: from 89.141.239.195.dyn.user.ono.com ([89.141.239.195] helo=galo..)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1upQPk-0005I8-0d; Fri, 22 Aug 2025 13:58:36 +0200
From: Pablo Saavedra <psaavedra@igalia.com>
To: openembedded-devel@lists.openembedded.org
Cc: Pablo Saavedra <psaavedra@igalia.com>
Subject: [oe][meta-gnome][PATCH] sysprof: upgrade 47.2 -> 48.0
Date: Fri, 22 Aug 2025 13:57:32 +0200
Message-Id: <20250822115732.69642-1-psaavedra@igalia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Aug 2025 11:58:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119086

Changes:

* Ensure local dbus-monitor is reaped after capturing
* Modernization for various GTK deprecations
* Add new symbolizer for debuginfod which is enabled by default
* Many performance improvements for capture loading
* Support for unwinding without frame-pointers on distributions
  lacking -fno-omit-frame-pointer at the toolchain level. This
  uses a new "sysprof-live-unwinder" elevated helper process
  which takes data from perf and unwinds the stack as soon as
  it can without capturing the perf data to disk.
  Thank you to Red Hat and the tools team for enabling this
  work for RHEL.
* The greeter now persists your settings and restores them the
  next time you run Sysprof.
* Various graph drawing improvements.
* Fixes for time display in various formats.
* Translation updates.
* Fix drawing of Y-reversed data point markers
* Make greeter save environment variables to state file for reuse
* Use D-Bus power profiles bus name rather than legacy D-Bus bus name

Signed-off-by: Pablo Saavedra <psaavedra@igalia.com>
---
 .../recipes-gnome/sysprof/{sysprof_47.2.bb => sysprof_48.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/sysprof/{sysprof_47.2.bb => sysprof_48.0.bb} (95%)

diff --git a/meta-gnome/recipes-gnome/sysprof/sysprof_47.2.bb b/meta-gnome/recipes-gnome/sysprof/sysprof_48.0.bb
similarity index 95%
rename from meta-gnome/recipes-gnome/sysprof/sysprof_47.2.bb
rename to meta-gnome/recipes-gnome/sysprof/sysprof_48.0.bb
index b6f140404c..4aad735278 100644
--- a/meta-gnome/recipes-gnome/sysprof/sysprof_47.2.bb
+++ b/meta-gnome/recipes-gnome/sysprof/sysprof_48.0.bb
@@ -21,7 +21,7 @@ SRC_URI += "file://0001-meson-Check-for-libunwind-instead-of-libunwind-gener.pat
             file://0002-meson-Do-not-invoke-the-commands-to-update-the-icon-.patch \
             file://0003-libsysprof-Check-for-unw_set_caching_policy-before-u.patch \
            "
-SRC_URI[archive.sha256sum] = "e4b5ede9fd978ec3f0d5a0d44d0429a6d201c362bf6cb4527319031ae462c54f"
+SRC_URI[archive.sha256sum] = "1b0f0380f2f30708ba87829321a06fee1db36dfa87797bbf07f0a7acf4498d18"
 
 # reason: gtk4 requires opengl distro feature
 REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('PACKAGECONFIG', 'gtk', 'opengl', '', d)}"
-- 
2.34.1


