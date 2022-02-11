Return-Path: <peter@berginkonsult.se>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE7F7C433EF
	for <webhook@archiver.kernel.org>; Fri, 11 Feb 2022 15:36:47 +0000 (UTC)
Received: from mailrelay1-2.pub.mailoutpod1-cph3.one.com
 (mailrelay1-2.pub.mailoutpod1-cph3.one.com [46.30.212.0])
 by mx.groups.io with SMTP id smtpd.web12.8704.1644593806170106511
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Feb 2022 07:36:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@berginkonsult.se header.s=rsa2 header.b=qovFMGu2;
 spf=none, err=permanent DNS error (domain: berginkonsult.se, ip: 46.30.212.0,
 mailfrom: peter@berginkonsult.se)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=rsa2;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=MNXvr/gVWx4XqI2hIRhCMvRLLAFg2LKo2qsW4OwgTIA=;
	b=qovFMGu2HWA6MX0YaUzcMpBT+ni2fncSBswpJJQRlqOC4VXciou6mm1Lu8VAh0GeeJhuGhnIPEa/1
	 09PABoGqOoRTsZ1Blx4N1b02zv266j7Dlk2Cia9FLCyYo1QTgrco6MJMRocgTvsaPTQhjnoh7THZ4i
	 Zyll245u6gRnbc+j4OCwjADqaEQvUfb1F6C9yGn/P4WduQ8u5nShLF4Y6qzfsfYZzJ4GCW5u248OQv
	 E67dOJ0D1+Q/DRDjwGves/hC/PpdhucLIB27LbTXi2YVel8NxJNjFomvbzNIWYIPkPMkcMCtdm9Kbb
	 SbD7Q2Ydq/UXNtaRkGzGVx4K3+tHLnw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=ed2;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=MNXvr/gVWx4XqI2hIRhCMvRLLAFg2LKo2qsW4OwgTIA=;
	b=sNfTz6WMjNNqJL1P0EtfiB2OusaRrhR0/Bmh45cxl3t4w9dNyOHDSWL6762uDtmZU9T7JZodnXzQ7
	 eO8S/u0CQ==
X-HalOne-Cookie: 57c4d7891cd5bc57ed9ba108773e6c86948a95ed
X-HalOne-ID: 67412b50-8b50-11ec-881f-d0431ea8a283
Received: from pbergin-7420.. (h-79-136-99-68.na.cust.bahnhof.se
 [79.136.99.68])
	by mailrelay1.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
	id 67412b50-8b50-11ec-881f-d0431ea8a283;
	Fri, 11 Feb 2022 15:36:43 +0000 (UTC)
From: Peter Bergin <peter@berginkonsult.se>
To: openembedded-devel@lists.openembedded.org
Cc: crg7475@mailbox.org,
	Peter Bergin <peter@berginkonsult.se>
Subject: [meta-multimedia][PATCH] pipewire: fix build error when pipewire-jack
 is used
Date: Fri, 11 Feb 2022 16:36:26 +0100
Message-Id: <20220211153626.1930814-1-peter@berginkonsult.se>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Feb 2022 15:36:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95298

If PACKAGECONFIG contains pipewire-jack the following error was seen:

    ERROR: pipewire-0.3.45-r0 do_package: QA Issue: pipewire: Files/directories were installed but not shipped in any package:
      /usr/bin/pw-jack
      /usr/share/pipewire/minimal.conf
    Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
    pipewire: 2 installed and not shipped files. [installed-vs-shipped]

File /usr/bin/pw-jack is added to pipewire-jack package.

The removal of minimal.conf was conditional to not configuring 'pipewire-jack'.
Can not see any reason to make it conditional on that specific option and make
it always removed to avoid packaging error.

Errors introduced in 687483235b5542401245711cb610ec327b33c403

Signed-off-by: Peter Bergin <peter@berginkonsult.se>
---
 .../recipes-multimedia/pipewire/pipewire_0.3.45.bb        | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.45.bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.45.bb
index 31798e47c..6ba312484 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.45.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.45.bb
@@ -114,12 +114,13 @@ remove_unused_installed_files() {
     # jack.conf is used by pipewire-jack (not the JACK SPA plugin).
     # Remove it if pipewire-jack is not built to avoid creating the
     # pipewire-jack package.
-    # minimal.conf is an example of how to minimally configure the
-    # daemon and is not meant to be used for production.
     if ${@bb.utils.contains('PACKAGECONFIG', 'pipewire-jack', 'false', 'true', d)}; then
         rm -f "${D}${datadir}/pipewire/jack.conf"
-        rm -f "${D}${datadir}/pipewire/minimal.conf"
     fi
+
+    # minimal.conf is an example of how to minimally configure the
+    # daemon and is not meant to be used for production.
+    rm -f "${D}${datadir}/pipewire/minimal.conf"
 }
 
 do_install[postfuncs] += "remove_unused_installed_files"
@@ -284,6 +285,7 @@ FILES:${PN}-alsa = "\
 # JACK drop-in libraries to redirect audio to pipewire.
 CONFFILES:${PN}-jack = "${datadir}/pipewire/jack.conf"
 FILES:${PN}-jack = "\
+    ${bindir}/pw-jack \
     ${datadir}/pipewire/jack.conf \
     ${libdir}/${PW_MODULE_SUBDIR}/jack/libjack*.so.* \
 "
-- 
2.30.2


