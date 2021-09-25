Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4C0BC433F5
	for <webhook@archiver.kernel.org>; Sat, 25 Sep 2021 11:33:14 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web08.6012.1632569592280417980
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Sep 2021 04:33:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=B3lQFOK3;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1632569594;
  x=1664105594;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=IXGnZbbG5srNecCkYe1HZzhemYXuypjYO2lqfEIBeyA=;
  b=B3lQFOK3Noy0kj8/boCoSCP/FPi7Vjj5WLDN+kPTnEfw+6rqsw3h/lSI
   UvyE5S4S9nzCrChwvpxzvg+mDpx7SrynPpPcBRUuaUQFnnqv4H5U1jRAS
   k7Pccz0T1+YEkI8tHIM9rIN/l+6J4ZbPvAkz+L6j0zSoa/Scnqp3zdJXF
   xWJgE9WTT2kdplqPcvtjr2izRtt9x/XGebPFekdUwsrQF5isSrkrJ1Juq
   S6/voEilVSooI9ebtFo1s2DVSqEGiXThwl46mFfS2x2v5sDoGQFwzhge2
   tbGUP/cj+E4HAL2iTLyp3Q11YA3m0Tfh9GvuOux3SZsz9Imxrp4rZlxVs
   Q==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-webserver][PATCH] netdata: Move the version to the file name
 and correct the SRC_URI
Date: Sat, 25 Sep 2021 13:33:05 +0200
Message-ID: <20210925113305.4675-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Sep 2021 11:33:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93129

The HOMEPAGE was updated in commit 371adeaa (netdata: Fixed the recipe),
but not the SRC_URI.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 .../netdata/{netdata_git.bb => netdata_1.22.1.bb}          | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta-webserver/recipes-webadmin/netdata/{netdata_git.bb => netdata_1.22.1.bb} (93%)

diff --git a/meta-webserver/recipes-webadmin/netdata/netdata_git.bb b/meta-webserver/recipes-webadmin/netdata/netdata_1.22.1.bb
similarity index 93%
rename from meta-webserver/recipes-webadmin/netdata/netdata_git.bb
rename to meta-webserver/recipes-webadmin/netdata/netdata_1.22.1.bb
index 7ec989815..fb4d27294 100644
--- a/meta-webserver/recipes-webadmin/netdata/netdata_git.bb
+++ b/meta-webserver/recipes-webadmin/netdata/netdata_1.22.1.bb
@@ -5,15 +5,14 @@ DESCRIPTION = "Netdata is high-fidelity infrastructure monitoring and troublesho
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fc9b848046ef54b5eaee6071947abd24"
 
-SRC_URI:append = " git://github.com/firehol/netdata.git;protocol=https"
+SRC_URI = "git://github.com/netdata/netdata.git;protocol=https"
 SRCREV = "1be9200ba8e11dc81a2101d85a2725137d43f766"
-PV = "1.22.1"
 
 # default netdata.conf for netdata configuration
-SRC_URI += " file://netdata.conf"
+SRC_URI += "file://netdata.conf"
 
 # file for providing systemd service support
-SRC_URI += " file://netdata.service"
+SRC_URI += "file://netdata.service"
 
 S = "${WORKDIR}/git"
 

