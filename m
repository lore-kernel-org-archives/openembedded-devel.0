Return-Path: <peter@berginkonsult.se>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23CCDC77B7E
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 08:14:19 +0000 (UTC)
Received: from mailrelay5-2.pub.mailoutpod2-cph3.one.com (mailrelay5-2.pub.mailoutpod2-cph3.one.com [46.30.211.186])
 by mx.groups.io with SMTP id smtpd.web10.123673.1683015255687656466
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 May 2023 01:14:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@berginkonsult.se header.s=rsa2 header.b=PoyPNskR;
 spf=none, err=permanent DNS error (domain: berginkonsult.se, ip: 46.30.211.186, mailfrom: peter@berginkonsult.se)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=rsa2;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=eJdKwsVwpfXYBjAe64/vpaqw2L4u4aHT/q5JH4TMtvs=;
	b=PoyPNskRpi4FM+0QS48Xo58tzxGQCet6gkwHGRleuE6wgl681/yPyA6BrDmAgN3EgjOZJ05GgArNN
	 rlRanWaAob0cNb7MDP3oUSRD6lX2XcHG89eWXlBqlQFMG8DGgGQfS6bsqmD+cBs7o/Gk4u60YoJp8r
	 +vvutGWaMou/m/AyZY7NP4oLmE++kA5ioNcii2PeroZL82Ybe5+5rDcOoA68B21zY9mCLKuxhnas+C
	 IP+pD0Riqp96rEhlV1MytGNv7dFXl/7NcSuL7ei2ZbRVsXRggoOrPOKmOe+Ial0VzMm+FsXrKn7Tqo
	 z8p7RMpukpACCkdzxww3a/p5WjchO2A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=ed2;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=eJdKwsVwpfXYBjAe64/vpaqw2L4u4aHT/q5JH4TMtvs=;
	b=BPNnT/roZeWPqmC9poaQfBGSVG8lctmMZLlwG9xY4v5+iZ4ZvBzc0miwz4tbW3EVft9aYwKq8Y83w
	 R1Pus+nCQ==
X-HalOne-ID: 503432d0-e8c1-11ed-b456-231b2edd0ed2
Received: from arn-pbergin-l1.. (c-799071d5.44006-0-69747578.bbcust.telenor.se [213.113.144.121])
	by mailrelay5 (Halon) with ESMTPSA
	id 503432d0-e8c1-11ed-b456-231b2edd0ed2;
	Tue, 02 May 2023 08:14:13 +0000 (UTC)
From: peter@berginkonsult.se
To: openembedded-devel@lists.openembedded.org
Cc: "Bergin, Peter" <peter.bergin@windriver.com>,
	Peter Bergin <peter@berginkonsult.se>
Subject: [meta-networking][PATCH] freediameter: fix typo and old overide syntax
Date: Tue,  2 May 2023 10:13:53 +0200
Message-Id: <20230502081353.291184-1-peter@berginkonsult.se>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 May 2023 08:14:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102258

From: "Bergin, Peter" <peter.bergin@windriver.com>

A typo that probably caused a left over from override syntax conversion.

    INITSCRIPT_PARAMS$_${PN} --> INITSCRIPT_PARAMS:${PN}

Signed-off-by: Peter Bergin <peter.bergin@windriver.com>
Signed-off-by: Peter Bergin <peter@berginkonsult.se>
---
 .../recipes-protocols/freediameter/freediameter_1.4.0.bb        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-protocols/freediameter/freediameter_1.4.0.bb b/meta-networking/recipes-protocols/freediameter/freediameter_1.4.0.bb
index 93a607d3ce..44fc46e3a8 100644
--- a/meta-networking/recipes-protocols/freediameter/freediameter_1.4.0.bb
+++ b/meta-networking/recipes-protocols/freediameter/freediameter_1.4.0.bb
@@ -132,7 +132,7 @@ RDEPENDS:${PN}-ptest = "cmake"
 
 INITSCRIPT_PACKAGES = "${PN}"
 INITSCRIPT_NAME:${PN} = "${BPN}"
-INITSCRIPT_PARAMS$_${PN} = "start 30 . stop 70 0 1 2 3 4 5 6 ."
+INITSCRIPT_PARAMS:${PN} = "start 30 . stop 70 0 1 2 3 4 5 6 ."
 
 SYSTEMD_SERVICE:${PN} = "freediameter.service"
 SYSTEMD_AUTO_ENABLE = "disable"
-- 
2.34.1


