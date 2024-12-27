Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51108E7718B
	for <webhook@archiver.kernel.org>; Fri, 27 Dec 2024 10:57:20 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.web10.10945.1735297027843596914
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Dec 2024 02:57:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=LAfVmwsJ;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-20241227105704e15a371433303293f4-7ycnge@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 20241227105704e15a371433303293f4
        for <openembedded-devel@lists.openembedded.org>;
        Fri, 27 Dec 2024 11:57:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=SMSqfgfihJxPiJ1fzOfC/6UPWn8JYarLz8xF5E/lxgI=;
 b=LAfVmwsJ+XoBjsNar5C7McME/RQtMTZgyr2n7nCYBMKO1dOvxFzdXJhv+amrX9+/KOpPbG
 Imh+h7ah+PEczWBFQzCM7nLedIg6jJdLrvDIdu3c1BuRAjFdfp/k9DEDOK8zCCYrrhE/l9oJ
 ZuAvJCojVrd51zCpjUCI+7f6HqhuVhpp0+VJyH979Oc/jdDNY4eGTdE7t0WtK21Qv1AkbrYT
 rHOVDuFgpamounOouLwmF5uHa08sY+mwWyv9sRiM4jSc8R1nwGaPxTo6I9stKtrSUtJXtfKa
 MsW3urmwQsqzZyWJwdjxourBD9sMXo/cRl0IOHFYJxzGOMVMh09EVwbg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 00/15] 4th series for meta-openembedded master
Date: Fri, 27 Dec 2024 11:56:00 +0100
Message-Id: <20241227105615.3303193-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Dec 2024 10:57:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114558

Handle CVEs which I assessed originally to take
patches from other distributions.

Peter Marko (15):
  uw-imap: patch CVE-2018-19518
  spice: set CVE-2016-2150 status to fixed
  id3lib: mark CVE-2007-4460 as fixed
  procmail: patch CVE-2014-3618
  procmail: patch CVE-2017-16844.
  imagemagick: refactor so devtool upgrade works
  imagemagick: upgrade 7.1.1-26 -> 7.1.1-43
  imagemagick: mark CVE-2023-5341 as fixed
  libwmf; switched to unofficial fork
  limwmf: upgrade 0.2.8.4 -> 0.2.13
  audiofile: fix multiple CVEs
  audiofile: patch CVE-2017-6829
  audiofile: fix multiple CVEs
  audiofile: patch CVE-2017-6831
  audiofile: patch CVE-2017-6839

 .../recipes-support/spice/spice_git.bb        |   1 +
 .../uw-imap/uw-imap/CVE-2018-19518.patch      |  24 ++++
 .../recipes-devtools/uw-imap/uw-imap_2007f.bb |   1 +
 ...onfigure-use-pkg-config-for-freetype.patch |  67 ----------
 .../libwmf/libwmf-0.2.8.4-intoverflow.patch   |  33 -----
 .../libwmf/libwmf-0.2.8.4-useafterfree.patch  |  16 ---
 .../recipes-extended/libwmf/libwmf_0.2.13.bb  |  32 +++++
 .../recipes-extended/libwmf/libwmf_0.2.8.4.bb |  38 ------
 .../audiofile/audiofile_0.3.6.bb              |   5 +
 ...ays-check-the-number-of-coefficients.patch |  45 +++++++
 ...ues-to-fix-index-overflow-in-IMA.cpp.patch |  43 ++++++
 ...multiplication-overflow-in-sfconvert.patch |  79 +++++++++++
 ...ail-when-error-occurs-in-parseFormat.patch |  46 +++++++
 ...lication-overflow-in-MSADPCM-decodeS.patch | 126 ++++++++++++++++++
 .../recipes-multimedia/id3lib/id3lib_3.8.3.bb |   2 +
 ...agick_7.1.1.bb => imagemagick_7.1.1-43.bb} |   8 +-
 .../procmail/procmail/CVE-2014-3618.patch     |  29 ++++
 .../procmail/procmail/CVE-2017-16844.patch    |  20 +++
 .../recipes-support/procmail/procmail_3.22.bb |   5 +-
 19 files changed, 462 insertions(+), 158 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/uw-imap/uw-imap/CVE-2018-19518.patch
 delete mode 100644 meta-oe/recipes-extended/libwmf/libwmf/0001-configure-use-pkg-config-for-freetype.patch
 delete mode 100644 meta-oe/recipes-extended/libwmf/libwmf/libwmf-0.2.8.4-intoverflow.patch
 delete mode 100644 meta-oe/recipes-extended/libwmf/libwmf/libwmf-0.2.8.4-useafterfree.patch
 create mode 100644 meta-oe/recipes-extended/libwmf/libwmf_0.2.13.bb
 delete mode 100644 meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb
 create mode 100644 meta-oe/recipes-multimedia/audiofile/files/0004-Always-check-the-number-of-coefficients.patch
 create mode 100644 meta-oe/recipes-multimedia/audiofile/files/0005-clamp-index-values-to-fix-index-overflow-in-IMA.cpp.patch
 create mode 100644 meta-oe/recipes-multimedia/audiofile/files/0006-Check-for-multiplication-overflow-in-sfconvert.patch
 create mode 100644 meta-oe/recipes-multimedia/audiofile/files/0007-Actually-fail-when-error-occurs-in-parseFormat.patch
 create mode 100644 meta-oe/recipes-multimedia/audiofile/files/0008-Check-for-multiplication-overflow-in-MSADPCM-decodeS.patch
 rename meta-oe/recipes-support/imagemagick/{imagemagick_7.1.1.bb => imagemagick_7.1.1-43.bb} (98%)
 create mode 100644 meta-oe/recipes-support/procmail/procmail/CVE-2014-3618.patch
 create mode 100644 meta-oe/recipes-support/procmail/procmail/CVE-2017-16844.patch

-- 
2.30.2


