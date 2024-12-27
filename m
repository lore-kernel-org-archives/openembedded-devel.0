Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D93AE7718B
	for <webhook@archiver.kernel.org>; Fri, 27 Dec 2024 10:57:30 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web10.10946.1735297046194027288
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Dec 2024 02:57:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=I5VHO3Av;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-2024122710572443e8d080bc7258ab51-irvohd@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 2024122710572443e8d080bc7258ab51
        for <openembedded-devel@lists.openembedded.org>;
        Fri, 27 Dec 2024 11:57:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=i1lx3b/Xduvv7GUf5YcoDPVjLLGtVerXPCMJFXPvh9I=;
 b=I5VHO3AvjsCwlgw11/DSaTHLrdtLTM1tsVa35jmqFaS1KChoBQef5ncgv/WTGwn1qSH6Tm
 qlm4cCiLG9hKlF6d8IzitjWrmMhyrPXUbE79lYGszHkT/Ey2LKGL6/ijy0nY/HghhMArbH1S
 dS9fborl12NwUQG27yK2GzwC3WylL20Aoglja3n9mBuC76bdJxX3xlFWQyWu6iqTIasBB2e6
 92off3wAWWjWTqxhbFMLcAmW/ZhhtyfX0AkcXurqDJ4u1Q/giuUEMIPTu6r8RDqeAF4/EXAk
 aH8bPBLgRUNDWiKu6/eNqjuhOZE7tL8dAtAcTKDAyoP8wN6wN6FNAOJA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-networking][PATCH 02/15] spice: set CVE-2016-2150 status to fixed
Date: Fri, 27 Dec 2024 11:56:02 +0100
Message-Id: <20241227105615.3303193-3-peter.marko@siemens.com>
In-Reply-To: <20241227105615.3303193-1-peter.marko@siemens.com>
References: <20241227105615.3303193-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Dec 2024 10:57:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114560

From: Peter Marko <peter.marko@siemens.com>

Debian has fixed this CVE with [1].
That patch is taken from [2].

.../tmp/work/core2-64-poky-linux/spice/0.15.2/git$ git describe 69628ea13
v0.13.1-190-g69628ea1
.../tmp/work/core2-64-poky-linux/spice/0.15.2/git$ git tag --contains 69628ea13
v0.13.2

[1] https://sources.debian.org/patches/spice/0.12.5-1%2Bdeb8u5/CVE-2016-2150/0002-improve-primary-surface-parameter-checks.patch/
[2] https://gitlab.freedesktop.org/spice/spice/-/commit/69628ea1375282cb7ca5b4dc4410e7aa67e0fc02

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-networking/recipes-support/spice/spice_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-support/spice/spice_git.bb b/meta-networking/recipes-support/spice/spice_git.bb
index 5e6d8584e3..7900a7dea5 100644
--- a/meta-networking/recipes-support/spice/spice_git.bb
+++ b/meta-networking/recipes-support/spice/spice_git.bb
@@ -22,6 +22,7 @@ SRC_URI = "gitsm://gitlab.freedesktop.org/spice/spice;branch=master;protocol=htt
 S = "${WORKDIR}/git"
 
 CVE_STATUS[CVE-2016-0749] = "fixed-version: patched since 0.13.2"
+CVE_STATUS[CVE-2016-2150] = "fixed-version: patched since 0.13.2"
 CVE_STATUS[CVE-2018-10893] = "fixed-version: patched already, caused by inaccurate CPE in the NVD database."
 
 inherit meson gettext python3native python3-dir pkgconfig
-- 
2.30.2


