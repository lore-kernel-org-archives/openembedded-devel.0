Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 098F6CA0EE4
	for <webhook@archiver.kernel.org>; Thu, 14 Aug 2025 17:44:54 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.web10.28821.1755193480909763866
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Aug 2025 10:44:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=JbsJ9pTd;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-2025081417443730d838aa88658926ad-imga70@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 2025081417443730d838aa88658926ad
        for <openembedded-devel@lists.openembedded.org>;
        Thu, 14 Aug 2025 19:44:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
 bh=Wzb4CWUuSIMknbxPasA8z5NAILba3oKxOyyAbIuVfAg=;
 b=JbsJ9pTdLXpUuY3kz010yVbjLbp7Kwy9aNhfl2xoBPB7pn1FZrvEb0ho7f8Vb6fYE13hin
 kjINbJacovIjH8y0IWf0CPmNneOe/GrUPZgNfC1invIUwvBrYStn09bmfA4uiTUtCZZXRkQe
 +K+wu/3WMRevgz9+cskbTw83UBhwhI+yVO5hNTp/x4XMrS3/z1mOD9oR+Les/e5K/BFUw5mn
 1s6Q0NPUnW8UBudiCrq/RYo2Bjujc+vGxwdS7xIzCY9WCfpFC3FciqwVwZ4tRcgALiHTyIQg
 waZTiMhHW5qtZEdNlSjNWfX2iV39Zo2o9voFwbxSJFDncJDlBkH8bqTg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][walnascar][PATCH 1/5] corosync: fix upstream version check
Date: Thu, 14 Aug 2025 19:43:48 +0200
Message-Id: <20250814174352.10670-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Aug 2025 17:44:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118937

From: Peter Marko <peter.marko@siemens.com>

github-releases is needed that it work at all:
ERROR: Automatic discovery of latest version/revision failed - you must provide a version using the --version/-V option, or for recipes that fetch from an SCM such as git, the --srcrev/-S option.

UPSTREAM_CHECK_GITTAGREGEX is needed to get correct version, otherwise:
$ devtool latest-version corosync
...
INFO: Current version: 3.1.6
INFO: Latest version: 414.336.75.75.75

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-extended/corosync/corosync_3.1.6.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-networking/recipes-extended/corosync/corosync_3.1.6.bb b/meta-networking/recipes-extended/corosync/corosync_3.1.6.bb
index cbbbbc70cd..e8e4540a21 100644
--- a/meta-networking/recipes-extended/corosync/corosync_3.1.6.bb
+++ b/meta-networking/recipes-extended/corosync/corosync_3.1.6.bb
@@ -5,13 +5,13 @@ HOMEPAGE = "http://corosync.github.io/corosync/"
 
 SECTION = "base"
 
-inherit autotools pkgconfig systemd
+inherit autotools pkgconfig systemd github-releases
 
-SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BP}.tar.gz \
+SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz \
            file://corosync.conf \
           "
 SRC_URI[sha256sum] = "ca6ed32b4d7f33ed614afce8760fe58d0de92c68b575d4969ebacd892f3d1e27"
-UPSTREAM_CHECK_REGEX = "(?P<pver>\d+\.(?!99)\d+(\.\d+)+)"
+UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a85eb4ce24033adb6088dd1d6ffc5e5d"

