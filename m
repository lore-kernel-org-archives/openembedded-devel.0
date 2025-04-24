Return-Path: <ariel.dalessandro@collabora.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67155C369AB
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 12:55:34 +0000 (UTC)
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
 by mx.groups.io with SMTP id smtpd.web10.14334.1745499331523943556
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Apr 2025 05:55:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=ariel.dalessandro@collabora.com header.s=zohomail header.b=CiDlTmhK;
 spf=pass (domain: collabora.com, ip: 136.143.188.112, mailfrom: ariel.dalessandro@collabora.com)
ARC-Seal: i=1; a=rsa-sha256; t=1745499326; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=QlogZXbb86OFK/UL/j2YAjkaxTY6e+DBZ/6QxaIYnnZY0B+yHd1Ezl10a4NvVhIyXi8SDAyUCuwmdNOvKP0EVsn7ieb/KKmoKDRtKFo/L/GZtlsSas185Kpu8Jsk4OgXcll5jOpd7o20EfQqCSTruEsb98bjM70PHF7qvmFszmA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745499326; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=cG8oNnpJ4F8Gjt6CrhHIbxt9ju1szdQf5skvbyOizXw=; 
	b=SXgzembnzdw0hDqz094WK7+T562BbD+lj4rTrVBLLkHB7Yu0fiF53jfHUNo3oJHYwDnlQtEw2HjEW7cfKEb0jmw1xxN6bPB4udIEbZRBvT/oVHRTNADUC9Pj15WAwLgsQWby+ETQeRFXkvKtRFccp52G7+iIZcxbZbGN3LNqTng=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
	dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745499326;
	s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=cG8oNnpJ4F8Gjt6CrhHIbxt9ju1szdQf5skvbyOizXw=;
	b=CiDlTmhKCCiG99mHzxggnwhLHlSWd/gJxaa0WKNbC/l4D+92a6rhO6wmS7/lhi2z
	xUq3w79e9EJCJCIQyF6U9eYeuaImHvImUKhAXXlqwPSrv71cF2oyRC6Mw7KMU9uwvFA
	dLW05nQhM+4Y9rL8OqnYhqjv+QN+jBtr2vRWA1KQ=
Received: by mx.zohomail.com with SMTPS id 174549932489215.640208303609597;
	Thu, 24 Apr 2025 05:55:24 -0700 (PDT)
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
To: openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com,
	schnitzeltony@gmail.com,
	akuster808@gmail.com,
	skandigraun@gmail.com,
	zoran.zhan@mediatek.com,
	alexandros.frantzis@collabora.com,
	Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Subject: [oe][meta-multimedia][scarthgap] pipewire: Install missing ALSA config files
Date: Thu, 24 Apr 2025 09:55:06 -0300
Message-ID: <20250424125506.10955-1-ariel.dalessandro@collabora.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Apr 2025 12:55:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117093

As detailed in Pipewire documentation [0], the ALSA plugin requires
config files to be symlinked as follow:

```
The plugin will be picked up by alsa when the following files are in /etc/alsa/conf.d/:

/etc/alsa/conf.d/50-pipewire.conf -> /usr/share/alsa/alsa.conf.d/50-pipewire.conf
/etc/alsa/conf.d/99-pipewire-default.conf
```

The above symlinks are missing, thus the pipewire device is not properly
detected.

Fix this by creating the required symlinks and installing them in the
pipewire-alsa package.

[0] https://github.com/PipeWire/pipewire/blob/master/INSTALL.md#alsa-plugin

Link: https://github.com/openembedded/meta-openembedded/issues/704
Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-multimedia/pipewire/pipewire_1.0.9.bb      | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.9.bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.9.bb
index 15cd6e9ab8..c166725258 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.9.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.9.bb
@@ -157,6 +157,14 @@ remove_unused_installed_files() {
     rm -f "${D}${datadir}/pipewire/minimal.conf"
 }
 
+do_install:append() {
+    # The pipewire-alsa plugin needs the following files in /etc/alsa/conf.d/ to
+    # be picked up by alsa.
+    install -d ${D}${sysconfdir}/alsa/conf.d
+    ln -sf ${datadir}/alsa/alsa.conf.d/50-pipewire.conf ${D}${sysconfdir}/alsa/conf.d/50-pipewire.conf
+    ln -sf ${datadir}/alsa/alsa.conf.d/99-pipewire-default.conf ${D}${sysconfdir}/alsa/conf.d/99-pipewire-default.conf
+}
+
 do_install[postfuncs] += "remove_unused_installed_files"
 
 python split_dynamic_packages () {
@@ -328,6 +336,8 @@ RDEPENDS:${PN}-pulse += " \
 FILES:${PN}-alsa = "\
     ${libdir}/alsa-lib/* \
     ${datadir}/alsa/alsa.conf.d/* \
+    ${sysconfdir}/alsa/conf.d/50-pipewire.conf \
+    ${sysconfdir}/alsa/conf.d/99-pipewire-default.conf \
 "
 
 # JACK drop-in libraries to redirect audio to pipewire.
-- 
2.49.0


