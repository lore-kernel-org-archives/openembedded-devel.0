Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2FB9C76188
	for <webhook@archiver.kernel.org>; Tue,  4 Apr 2023 23:51:04 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web10.118099.1680652255084745890
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Apr 2023 16:50:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=LF04oJuy;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1680652257;
  x=1712188257;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=44BLzLQs8KhA8gzX9+EEm+1u7WTHcjBbNDyROHJE9eA=;
  b=LF04oJuy+SpxCjozSWDwf4NJhaIXVYIbWjqNGfUfklwlJCzvdxbJwigF
   oMH9QoweX9t+1t0tCnZ4D4kPAP6a+CdwAN3aQB/qZSkD48Qwpo09L3Ky+
   P2pISys/y9OOBMkJYHDG3Izm+1ZflIpr1znDU4Mp/BGciVspY1GYldZA3
   ONcw4wcbxJbxDx5kYudtVrfnBayZirm6h+GMIISZKytQZepvsFg4ow/+m
   8iRZmc/DzPSGv47QOy1ZBRvIX2x06vOaWFsaoTX5ksiNN0/bXG4oeJEJP
   UbQcEE+vgtJFqUfFE54/U2duA9XsqXyKZPOEvKqzXV8G7BpoKCagE3y2B
   Q==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][PATCH 4/5] autossh: Correct the license information
Date: Wed, 5 Apr 2023 01:50:46 +0200
Message-ID: <20230404235047.601178-4-pkj@axis.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230404235047.601178-1-pkj@axis.com>
References: <20230404235047.601178-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Apr 2023 23:51:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101955

Correct "startline=" to "beginline=" in LIC_FILES_CHKSUM so that the
correct lines from autossh.c and daemon.h are used. Also remove
autossh.spec from LIC_FILES_CHKSUM as it doesn't really contain any
license information.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta-networking/recipes-connectivity/autossh/autossh_1.4g.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-networking/recipes-connectivity/autossh/autossh_1.4g.bb b/meta-networking/recipes-connectivity/autossh/autossh_1.4g.bb
index 3dc304b23..de7e2d3e0 100644
--- a/meta-networking/recipes-connectivity/autossh/autossh_1.4g.bb
+++ b/meta-networking/recipes-connectivity/autossh/autossh_1.4g.bb
@@ -2,9 +2,8 @@ DESCRIPTION = "autossh is a program to start a copy of ssh and monitor it, resta
 HOMEPAGE = "https://www.harding.motd.ca/autossh/"
 
 LICENSE = "BSD-1-Clause & BSD-4-Clause"
-LIC_FILES_CHKSUM = "file://autossh.spec;md5=80a6701134723fd3420e733b46a0eb97 \
-                    file://autossh.c;md5=76c37acd40ac45050a4ced145b1e2707;startline=7;endline=23 \
-                    file://daemon.h;md5=6bbeaac616b9bc8de7b40049004f4289;startline=7;endline=39"
+LIC_FILES_CHKSUM = "file://autossh.c;beginline=7;endline=22;md5=9ae0c9b04856148d77984ef58536732b \
+                    file://daemon.h;beginline=7;endline=36;md5=839bb7bf781ff48da4a3fec2a62a1a47"
 
 SRC_URI = "https://www.harding.motd.ca/autossh/${BP}.tgz"
 SRC_URI[md5sum] = "2b804bc1bf6d2f2afaa526d02df7c0a2"

