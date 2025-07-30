Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BB76C87FCB
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 23:29:45 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.49380.1753918176394027557
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Jul 2025 16:29:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=CQQy6DRG;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1753918178; x=1785454178;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2aTa23tU2rEay0ovp/whntwnY4ZAQ7RDauigyHNdW24=;
  b=CQQy6DRGLkav5cj7nqoUQfwWrWM74MOa+DK2QcPt1JVLivmrULJXHg6y
   nroL1giGIYQLj3bn0kQHsAENX15LJzStIGXgRPXVacUMhwMkT4wwbwT+E
   wn3YAZOKRStMzZGMQyQPil8/osmto4l0rwk+SivhLDCVYASpMKaiVR09k
   UKDtGIR4JsRNq9zVP5H8wNUJ0zEeOytijhtOKJCiwbnV4dq8qAhp1Reza
   GdQDD8Jzf/XX6cD/Vx/FjWtpIvEIQsNI3dc4X79a8xQBuH6k0cEiUU8QP
   eXDIa/sDopn2MY9wDXTxmek7B2ia2VOpR30Or9ztlrEKQFgc3o4R+Se+D
   A==;
X-CSE-ConnectionGUID: z6kA+NLfTvOm0uRqoNAKmg==
X-CSE-MsgGUID: h8Q+ZkSaRnqKfwuAfewlVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="207893556"
X-IronPort-AV: E=Sophos;i="6.16,353,1744038000"; 
   d="scan'208";a="207893556"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([20.61.8.234])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2025 08:29:35 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 14C021C00085
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 23:29:35 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 6F4CF10003BA
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 23:29:34 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 952901A009B;
	Thu, 31 Jul 2025 07:29:29 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 36/40] rsnapshot: upgrade 1.4.5 -> 1.5.1
Date: Thu, 31 Jul 2025 07:29:19 +0800
Message-ID: <20250730232923.522-10-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250730232923.522-1-wangmy@fujitsu.com>
References: <20250730232923.522-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 23:29:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118813

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- Fix make tar.
- Rotate only if there will be a new <interval>.0 folder (#331)
- Add publish GitHub workflow. (#367)
- Use POSIX::lchown (#360)
- Add test GitHub workflow. (#366)
- Add new backup script for sqlite3 databases (#364)
- wait between rsync tries (#352)
- Update AUTHORS
- Update rsnapshot-HOWTO.en.md
- Point at the new Markdown HOWTO from the repo's README
- Docs: add description for 'rsync_numtries' to man page (#342)
- Docs: fix spelling issues
- Docs: mention the behavior of "sync" cron job in case of "warnings"
- Remove Benedikt Heine from maintainer list (#337)
- Docs: Use L<...> for other man pages
- Docs: Use F<...> for filenames
- Docs: Fix some styling issues
- Docs: Fix literal hyphens being turned into en-dash
- Docs: Fix grammatical error
- Fix rsync_numtries example in default config
- Fix validation of rsync_numtries = 0 (#323)
- update readme with info on cross interval rotation
- replace deprecated 'interval' with 'retain' in readme example
- Minor bugfix: Check retval for termination by signal (#315)
- Fix typo in docs: rm trailing slash in backup_exec example (#314).

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../rsnapshot/{rsnapshot_git.bb => rsnapshot_1.5.1.bb}       | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/rsnapshot/{rsnapshot_git.bb => rsnapshot_1.5.1.bb} (95%)

diff --git a/meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb b/meta-oe/recipes-support/rsnapshot/rsnapshot_1.5.1.bb
similarity index 95%
rename from meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb
rename to meta-oe/recipes-support/rsnapshot/rsnapshot_1.5.1.bb
index 8c4183bae3..29b8be9b3c 100644
--- a/meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb
+++ b/meta-oe/recipes-support/rsnapshot/rsnapshot_1.5.1.bb
@@ -22,10 +22,9 @@ RDEPENDS:${PN} = "rsync \
                   perl-module-ipc-open3 \
                  "
 
-SRCREV = "1b943dbc7695d62fac5c0f9549ec696a538be19c"
-PV = "1.4.5"
+SRCREV = "367a49cda9d428c27a50641d99734c7b790f2cc1"
 
-SRC_URI = "git://github.com/DrHyde/${BPN};branch=master;protocol=https \
+SRC_URI = "git://github.com/DrHyde/${BPN};branch=master;protocol=https;tag=${PV} \
            file://configure-fix-cmd_rsync.patch \
           "
 
-- 
2.43.0


