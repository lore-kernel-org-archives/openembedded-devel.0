Return-Path: <andrej.kozemcak@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8699EEFCD7E
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 10:06:42 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10761.1773050801484787620
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Mar 2026 03:06:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=andrej.kozemcak@siemens.com header.s=fm1 header.b=PZDaztfY;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-1334352-20260309100639eddc28a96a00020709-juvtrm@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20260309100639eddc28a96a00020709
        for <openembedded-devel@lists.openembedded.org>;
        Mon, 09 Mar 2026 11:06:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=andrej.kozemcak@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=0Syymcb5B7xzb09cigUWjErUezwuYHgyD1s+bQfOtmM=;
 b=PZDaztfYrLv9PwHNpOr3mxtxAUvIF9oCcqiPB2acQ3UdYltvdjx03iG5+2zJjG9YS2GJQZ
 bS1Z0aW+MfupOyHZ7OboZFNfCGqlrNW6tmsUiWZtzylEfqjqeJNISFOCKS3cEccLGh6iEREe
 s2JGURhgioaju/+vQ/7L9qcSgL2OUkNoAPitn0vVwVSzVcqGopU+XPCWafvVZsGUtkVV0LOh
 Z6zBV4v0xYI14BPRyC7tYRO/baz/7i/Y9VievSRDDqXtfAVRlVb2kYm5Y5VUtOCMWFAjJqWs
 QGDFNkelXsDH0SNOVdu+3eqJe/5ccv+9F/W95/O+OE6xpMxpc6YNxoWw==;
From: Andrej Kozemcak <andrej.kozemcak@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Andrej Kozemcak <andrej.kozemcak@siemens.com>
Subject: [meta-oe][PATCH 13/14] syslog-ng: upgrade 4.10.2 -> 4.11.0
Date: Mon,  9 Mar 2026 11:06:29 +0100
Message-ID: <20260309100630.404637-13-andrej.kozemcak@siemens.com>
In-Reply-To: <20260309100630.404637-1-andrej.kozemcak@siemens.com>
References: <20260309100630.404637-1-andrej.kozemcak@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1334352:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 10:06:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124984

Changelog:
  https://github.com/syslog-ng/syslog-ng/releases/tag/syslog-ng-4.11.0

Highlights
- kafka-source(): The new kafka() source can directly fetch log messages from the Apache Kafka message bus using the librdkafka client.

Signed-off-by: Andrej Kozemcak <andrej.kozemcak@siemens.com>
---
 .../syslog-ng/{syslog-ng_4.10.2.bb => syslog-ng_4.11.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/syslog-ng/{syslog-ng_4.10.2.bb => syslog-ng_4.11.0.bb} (98%)

diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng_4.10.2.bb b/meta-oe/recipes-support/syslog-ng/syslog-ng_4.11.0.bb
similarity index 98%
rename from meta-oe/recipes-support/syslog-ng/syslog-ng_4.10.2.bb
rename to meta-oe/recipes-support/syslog-ng/syslog-ng_4.11.0.bb
index c3b201c4a7..1846758681 100644
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng_4.10.2.bb
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng_4.11.0.bb
@@ -26,7 +26,7 @@ SRC_URI = "https://github.com/balabit/syslog-ng/releases/download/${BP}/${BP}.ta
 "
 SRC_URI:append:powerpc64le = " file://0001-plugin.c-workaround-powerpc64le-segfaults-error.patch"
 
-SRC_URI[sha256sum] = "841503de6c2486e66fd08f0c62ac2568fc8ed1021297f855e8acd58ad7caff76"
+SRC_URI[sha256sum] = "37ea0d4588533316de122df4e1b249867b0a0575f646c7478d0cc4d747462943"
 
 UPSTREAM_CHECK_URI = "https://github.com/balabit/syslog-ng/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/syslog-ng-(?P<pver>\d+(\.\d+)+)"
-- 
2.47.3


