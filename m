Return-Path: <andrej.kozemcak@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ADFBCDB47C
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 10:57:55 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4272.1782298670521835002
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Jun 2026 03:57:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=andrej.kozemcak@siemens.com header.s=fm2 header.b=aheuL/iP;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-1334352-20260624105747934fdd6dfb000207ed-nplxo8@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20260624105747934fdd6dfb000207ed
        for <openembedded-devel@lists.openembedded.org>;
        Wed, 24 Jun 2026 12:57:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=andrej.kozemcak@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=8yMCbhbWFauiR+EZLf2bDTJnMeSvwIxxcwjIi3+iDAc=;
 b=aheuL/iP13vfEUOAMR8LODMLlUwSiMxWk1txZ0Z/DVxIPG7ag2NL+o4w3tEriv/5SSQ9Na
 o6Hgx2WMS5vk/dkz9rpP38GHbkCHl9AwzGJEf/Kn6Qd3V4WaH2emwdO9PVvl4c89WLjZL7xS
 AmE8as4JqdbmfERWs2Sf63RDNvRCSNWiSwHAm9MDpFJGBZhn4o+DOfhjR7i07VlM3eG6Fhsk
 P4QFzEx0FAtGHdxYx/TuioADJXz2inKNtLXRfjLWkm9KZZNlSnJObvmh5qCu9yp5r46jHFQ0
 xwLQiirq5EgYrSF4/70xKvRLzfI5UgDUuZK+blBp++bx3o++KnkKQsMA==;
From: Andrej Kozemcak <andrej.kozemcak@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Andrej Kozemcak <andrej.kozemcak@siemens.com>
Subject: [meta-webserver][PATCH] nginx: upgrade 1.30.2 -> 1.30.3
Date: Wed, 24 Jun 2026 12:57:39 +0200
Message-ID: <20260624105739.3477896-1-andrej.kozemcak@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1334352:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Jun 2026 10:57:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127713

Changes with nginx 1.30.3

*) Security: a heap memory buffer overflow might occur in a worker
   process when using a configuration with "ignore_invalid_headers off;"
   and "large_client_header_buffers" with large configured values when
   proxying a specially crafted request to HTTP/2 or gRPC backend,
   allowing an attacker to cause worker process memory corruption or
   segmentation fault in a worker process (CVE-2026-42055).

*) Security: a heap memory buffer overread might occur in a worker
   process while handling a specially sent response with decoding from
   UTF-8 via the "charset_map" directive, allowing an attacker to cause
   a limited disclosure of worker proccess memory or segmentation fault
   in a worker process (CVE-2026-48142).

Signed-off-by: Andrej Kozemcak <andrej.kozemcak@siemens.com>
---
 .../recipes-httpd/nginx/{nginx_1.30.2.bb => nginx_1.30.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-httpd/nginx/{nginx_1.30.2.bb => nginx_1.30.3.bb} (51%)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.30.2.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.30.3.bb
similarity index 51%
rename from meta-webserver/recipes-httpd/nginx/nginx_1.30.2.bb
rename to meta-webserver/recipes-httpd/nginx/nginx_1.30.3.bb
index 2ccc7226a4..981b3f6477 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.30.2.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.30.3.bb
@@ -2,5 +2,5 @@ require nginx.inc
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=79da1c70d587d3a199af9255ad393f99"
 
-SRC_URI[sha256sum] = "7df3090907fca3cc0e456d6dc00ceb230da74ea88026ceff0affc29dbbd9ac4c"
+SRC_URI[sha256sum] = "e5823dc6f45610993def93ebf6cfce68264af4958c77e874b7d20f3709001b8f"
 

