Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7148CA0EFA
	for <webhook@archiver.kernel.org>; Mon, 25 Aug 2025 13:18:58 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web10.38638.1756127937372151816
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Aug 2025 06:18:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=VEVhW7wD;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-202508251318520fe710ea6e8659392f-anv_cf@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 202508251318520fe710ea6e8659392f
        for <openembedded-devel@lists.openembedded.org>;
        Mon, 25 Aug 2025 15:18:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=u9+bmchX39aNEDaKxY+NhXk0OFpsbP5rXROOPrzDnkc=;
 b=VEVhW7wDKy9yEY5XdMqEwcoVsy2k5M93vO8zAguWG+i4Fc8c9WHh/roJTsALuSDgX14SWr
 R+oMkM+Kd1NwkMNdS9iU2To/eD0e9zwIIWmowfSWYNcFg9l1oTj8BmUIjyA2PYJhEudOsgBV
 EFwAUQNtaYrkv85rQ861l04JBaeD8XV/7wIW0pf5+Jzd+rWDUIWcCvpFMiTaG8xCkuVo3lS2
 scCq49+l/GcGJA5oo77L7TVq13QlqdY+jodyXoZk0uebZgFxHEJ8i+0KnXw0XQFNR9JKOeZK
 HCT7uRmKx1I4dSzXa37VXT6r9musZSlo05pBQZCtrSGPO/J5ZZI31s8w==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-webserver][PATCH 1/3] nginx: upgrade stable 1.26.3 -> 1.28.0
Date: Mon, 25 Aug 2025 15:18:03 +0200
Message-Id: <20250825131805.230223-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Aug 2025 13:18:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119096

From: Peter Marko <peter.marko@siemens.com>

2025-04-23
nginx-1.28.0 stable version has been released, incorporating new
features and bug fixes from the 1.27.x mainline branch - including
memory usage and CPU usage optimizations in complex SSL configurations,
automatic re‑resolution of hostnames in upstream groups, performance
enhancements in QUIC, OCSP validation of client SSL certificates and
OCSP stapling support in the stream module, variables support in the
proxy_limit_rate, fastcgi_limit_rate, scgi_limit_rate, and
uwsgi_limit_rate directives, the proxy_pass_trailers directive, and
more.

License-Update: copyright years refreshed and removed C-style comments

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-webserver/recipes-httpd/nginx/nginx_1.26.3.bb | 6 ------
 meta-webserver/recipes-httpd/nginx/nginx_1.28.0.bb | 6 ++++++
 2 files changed, 6 insertions(+), 6 deletions(-)
 delete mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.26.3.bb
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.28.0.bb

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.26.3.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.26.3.bb
deleted file mode 100644
index 7eab7ecdf5..0000000000
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.26.3.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require nginx.inc
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=a6547d7e5628787ee2a9c5a3480eb628"
-
-SRC_URI[sha256sum] = "69ee2b237744036e61d24b836668aad3040dda461fe6f570f1787eab570c75aa"
-
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.28.0.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.28.0.bb
new file mode 100644
index 0000000000..dd585f3714
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.28.0.bb
@@ -0,0 +1,6 @@
+require nginx.inc
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3dc49537b08b14c8b66ad247bb4c4593"
+
+SRC_URI[sha256sum] = "c6b5c6b086c0df9d3ca3ff5e084c1d0ef909e6038279c71c1c3e985f576ff76a"
+

