Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C9C9E7718C
	for <webhook@archiver.kernel.org>; Fri, 20 Dec 2024 15:37:33 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web11.154107.1734709045262892714
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Dec 2024 07:37:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=lY1eBLEK;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20241220153722e24d0f4ca5a83cea00-k05qa_@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20241220153722e24d0f4ca5a83cea00
        for <openembedded-devel@lists.openembedded.org>;
        Fri, 20 Dec 2024 16:37:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=kd5JE7PrUHu9/Z0GAIovJcYr6Id10XvVquHCt+mTz0c=;
 b=lY1eBLEKxpkIyEHt4ciImbILiYD+Z3fLZKHdP/rAF+XKa6fa3TJjzt4MdVW5tW1JKTMU0X
 ue6FiB5RouzOTss7qoB9X4l8zl/BGYp1x7XM0PESH2OH4itOyOU401UnhhdbPETebHKBssgZ
 xtm7QawFrtA1Hs4qI8fabvIj5JKf8/FdpmTfSiSBWb+PQNt/0ffXlsCqo2wiqQbgHwTZ7SnP
 AugOIjbXotbtrKaYxUxMxooFL0Htr2n1nT2ufKY7fr/F6Rl8kyDhZ7DYEemq36HQM3UlfYzU
 JikEYoEgmB14qd4k6cqFzuYzwk9uak4klHLZ1DxxD52R95gCrGDhS3pQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 00/11] upgrade recipes to solve CVEs
Date: Fri, 20 Dec 2024 16:36:18 +0100
Message-Id: <20241220153629.2499631-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Dec 2024 15:37:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114436

This solves CVEs for meta-openembedded master which can be solved
by recipe version upgrades.

Peter Marko (11):
  opensc: upgrade 0.25.1 -> 0.26.0
  opensc: mark CVE-2024-8443 as fixed
  memcached: add UPSTREAM_CHECK_URI
  memcached: upgrade 1.6.17 -> 1.6.33
  php: upgrade 8.2.20 -> 8.2.26
  libmemcached: remove recipe for version 1.0.7
  libmemcached: merge inc into bb
  libmemcached: ignore CVE-2023-27478
  sassc: ignore CVE-2022-43357
  wireshark: upgrade 4.2.8 -> 4.2.9
  weechat: upgrade 4.0.4 -> 4.5.0

 ...01-use-pkg-config-for-gcrypt-instead.patch |  37 ------
 .../{weechat_4.0.4.bb => weechat_4.5.0.bb}    |   8 +-
 .../libmemcached/libmemcached.inc             |  17 ---
 .../libmemcached/libmemcached_1.0.18.bb       |  21 +++-
 .../libmemcached/libmemcached_1.0.7.bb        |   4 -
 .../0001-Fix-function-protypes.patch          | 110 ------------------
 .../memcached-add-hugetlbfs-check.patch       |  13 ++-
 ...emcached_1.6.17.bb => memcached_1.6.33.bb} |   5 +-
 ...{wireshark_4.2.7.bb => wireshark_4.2.9.bb} |   2 +-
 ...ext-opcache-config.m4-enable-opcache.patch |   4 +-
 ...d-php.m4-don-t-unset-cache-variables.patch |   2 +-
 ...-host-specific-info-from-header-file.patch |   2 +-
 ...har-Makefile.frag-Fix-phar-packaging.patch |   4 +-
 ...ext-imap-config.m4-fix-include-paths.patch |   4 +-
 ...p-don-t-use-broken-wrapper-for-mkdir.patch |   3 +-
 .../php/php/0010-iconv-fix-detection.patch    |   2 +-
 .../php/{php_8.2.20.bb => php_8.2.26.bb}      |   2 +-
 .../{opensc_0.25.1.bb => opensc_0.26.0.bb}    |   6 +-
 meta-oe/recipes-support/sass/sassc_git.bb     |   2 +
 19 files changed, 53 insertions(+), 195 deletions(-)
 delete mode 100644 meta-networking/recipes-irc/weechat/weechat/0001-use-pkg-config-for-gcrypt-instead.patch
 rename meta-networking/recipes-irc/weechat/{weechat_4.0.4.bb => weechat_4.5.0.bb} (79%)
 delete mode 100644 meta-networking/recipes-support/libmemcached/libmemcached.inc
 delete mode 100644 meta-networking/recipes-support/libmemcached/libmemcached_1.0.7.bb
 delete mode 100644 meta-networking/recipes-support/memcached/memcached/0001-Fix-function-protypes.patch
 rename meta-networking/recipes-support/memcached/{memcached_1.6.17.bb => memcached_1.6.33.bb} (93%)
 rename meta-networking/recipes-support/wireshark/{wireshark_4.2.7.bb => wireshark_4.2.9.bb} (97%)
 rename meta-oe/recipes-devtools/php/{php_8.2.20.bb => php_8.2.26.bb} (99%)
 rename meta-oe/recipes-support/opensc/{opensc_0.25.1.bb => opensc_0.26.0.bb} (87%)

-- 
2.30.2


