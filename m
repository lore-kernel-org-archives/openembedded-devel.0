Return-Path: <jefdriesen@telenet.be>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC7F2C0218F
	for <webhook@archiver.kernel.org>; Fri, 31 Jan 2025 15:01:41 +0000 (UTC)
Received: from albert.telenet-ops.be (albert.telenet-ops.be [195.130.137.90])
 by mx.groups.io with SMTP id smtpd.web10.21095.1738335693670760470
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Jan 2025 07:01:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@telenet.be header.s=u25 header.b=aEs3QhQP;
 spf=pass (domain: telenet.be, ip: 195.130.137.90, mailfrom: jefdriesen@telenet.be)
Received: from barracuda.home.lan ([81.165.83.55])
	by albert.telenet-ops.be with cmsmtp
	id 7r1X2E00X1BdMJ906r1Xsn; Fri, 31 Jan 2025 16:01:32 +0100
Received: from sepia.home.lan (sepia.home.lan [192.168.1.209])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by barracuda.home.lan (Postfix) with ESMTPSA id DCD059F765;
	Fri, 31 Jan 2025 16:01:30 +0100 (CET)
From: Jef Driesen <jefdriesen@telenet.be>
To: openembedded-devel@lists.openembedded.org
Cc: Jef Driesen <jefdriesen@telenet.be>
Subject: [meta-oe,scarthgap][PATCH] nginx: fix the tarball and license checksums
Date: Fri, 31 Jan 2025 16:01:22 +0100
Message-ID: <20250131150122.32126-1-jefdriesen@telenet.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=telenet.be; s=u25;
	t=1738335692; bh=WntjF6P6Hy9N4qnoj324Cj92Bk5Ehfw2rYWzUmqrzKY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:From;
	b=aEs3QhQP9yly8RXyTo98P3pPKFShyHWsBfkuAgRYnMHSfhDFhm1rZxXn6H4GB3btN
	 QU2/bvR8KbDWlnMvbz3JPCwuBwbhn0M8woam0E8ZzrG41djBqYt0SwmMVVft1eKyPw
	 eb3qLPQHb9xERsY2JgqLDgOrmG4onV5j9B62MK1aBB1be8WPcHHUYE/c9S9q5pzGps
	 ppUqqU0wv5woQcfi5Yfy4HvCvtreTe8m7+WvQrNk4xKrLSDWks8sP20ojUj661a9ON
	 vtjAT7LZDFNL3+ELmnE8IMwqOCqZSTxhwU22M/l8vhsMvqE0bM4juVpGp23by8UCi9
	 btLooN4C8hUYA==
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 Jan 2025 15:01:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115199

The nginx upgrade in commit 6eef5e3efb0a871622d2ea5eeb016b61d46f722c
added an incorrect tarball checksum and didn't update the license
checksum, resulting in build failures.

Signed-off-by: Jef Driesen <jefdriesen@telenet.be>
---
 meta-webserver/recipes-httpd/nginx/nginx_1.25.4.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.25.4.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.25.4.bb
index 1cd036bb45..5ea2f5726e 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.25.4.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.25.4.bb
@@ -4,7 +4,7 @@ require nginx.inc
 # 1.25.x is the current mainline branches containing all new features
 DEFAULT_PREFERENCE = "-1"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=79ad2eb837299421c4435dedc8897b3d"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a6547d7e5628787ee2a9c5a3480eb628"
 
-SRC_URI[sha256sum] = "c8b288cd8a25628a167a874261069302f3cd7548"
+SRC_URI[sha256sum] = "760729901acbaa517996e681ee6ea259032985e37c2768beef80df3a877deed9"
 
-- 
2.43.0


