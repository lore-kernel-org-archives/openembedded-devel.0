Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ADFAC369D5
	for <webhook@archiver.kernel.org>; Sun, 27 Apr 2025 21:30:02 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web11.34309.1745789376621160640
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Apr 2025 14:29:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=CEnPZppz;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-202504272129334384b9c345012ec12e-hryddw@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202504272129334384b9c345012ec12e
        for <openembedded-devel@lists.openembedded.org>;
        Sun, 27 Apr 2025 23:29:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=C3EKcwTqkNunfTSnnMiZrrA5b7ATxX3JhDh9uVv1DqE=;
 b=CEnPZppzKuNKcICa53YThN1kVd2Jal3yYS4Qhorao9XNeLsR0b+AWWYuUpMG9fNV2kEwD9
 nnVCN7fNMG0j+Ck/LJkvgZN5nYAvzLtfXiBdJP18TrEJJHrjabp99AGQk2N55MiPbtRRftiC
 OuZK8/mZrp4mZsQ7P2jjtP0b3xkVD3i0QqeQ2jrv+OUsngkIfRtHkj/97iYwhwUHz8KjjgXn
 l8e7K0yZU9hKdlluKPEw7T2EoPeyWfcHLL1qqGAjOzWI9+YNZTwYk64S3awhlLWEHytnA9Gx
 GoA8e0jQQJbTx6FV35K/Qo9bkCq8WHvYdWhitba6PKgSmF4IVs89gnmg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-networking][PATCH 1/3] corosync: fix upstream version check
Date: Sun, 27 Apr 2025 23:28:42 +0200
Message-Id: <20250427212844.1992660-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Apr 2025 21:30:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117178

From: Peter Marko <peter.marko@siemens.com>

github-releases is needed that it work at all:
ERROR: Automatic discovery of latest version/revision failed - you must provide a version using the --version/-V option, or for recipes that fetch from an SCM such as git, the --srcrev/-S option.

UPSTREAM_CHECK_GITTAGREGEX is needed to get correct version, otherwise:
$ devtool latest-version corosync
...
INFO: Current version: 3.1.6
INFO: Latest version: 414.336.75.75.75

Signed-off-by: Peter Marko <peter.marko@siemens.com>
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

