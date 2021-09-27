Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DAFDC4332F
	for <webhook@archiver.kernel.org>; Mon, 27 Sep 2021 15:38:07 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.789.1632757086276681711
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Sep 2021 08:38:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XuCxN+xB;
 spf=pass (domain: gmail.com, ip: 209.85.210.182,
 mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id w19so16167975pfn.12
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Sep 2021 08:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JourdLC6Pi+Kci8d94xe0hcU68zzMUSN6D02DCgUcs8=;
        b=XuCxN+xB0CftrDoNAS2as6wZBRnthWD2Rpfc10CtsdteiG+qwx/V7qaTf9z0/On2IC
         5ussrTngpvJ4J/IyWg62C1H4+iUjjcz/btYjk76PS814hNB+laIG0+/wUD7P4HO9H57T
         LisoCUZxfK4hNHnXQKCSsiIDeJcVg2yjJYJ1ABmhcWcFdoVYe5/XtDTGY7g2Nfm6CAog
         Z3couiluUcIBN6wXcOVE9AtLeRRnmR0339b7GAPu17xJ+DP2oXb0LoP9Dz3iAMccMGPM
         PJokdA9WrqXStuVgcZL20IGO89uOewtal9LyWKW/tzvxwpBU++MnoGdQ2O0kPLOODrgf
         o0mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JourdLC6Pi+Kci8d94xe0hcU68zzMUSN6D02DCgUcs8=;
        b=14ODKzX5Ca4ElK0KX/BbdarL8hNAmD609eLOZ+1hbZOztKCEdOqmMwrE+POwjsCoh1
         LmLKppGyegY6eyTXPQcOYy+ANb6DXG6gx66tSnIo+Q1spzBvjcCmgwglDhoyxUwFc/d4
         iGA5nU+wZLdLYYb5WfqwrmsUR8p+YvAfTEyaUi29vRjL/olz67zthU3YI6qe7oIYq09R
         /kL2LZVmMxtjNaV3lBcyKVVuFC1slXnQZ6asxFvs88yDKQoGZzLWjigdN/NaLptaUjqq
         R6r8UYeNtTQGofq3aG+fIweftOo1PeurEhjmFNRJyrm7LOXkF6jKW56yjRh/7AHjtNmO
         Z7tg==
X-Gm-Message-State: AOAM531LmzpaFXBRMiej2k//Eop9fsEm192QxRw0k3/1LKf8oDTwV64G
	+zDYICRWGYm2lhKx/oaOxs7lgmZjJNE=
X-Google-Smtp-Source: 
 ABdhPJzYsMgALkRjuuKhoFW1u3MhwoxG7TVtPRDaXLf8g+bANLPzU7P67obqxhACEp/M7DN1BsuzgA==
X-Received: by 2002:a63:f817:: with SMTP id n23mr287921pgh.250.1632757085514;
        Mon, 27 Sep 2021 08:38:05 -0700 (PDT)
Received: from keaua.hsd1.ca.comcast.net
 ([2601:202:4180:a5c0:6ef1:b2cb:b226:747b])
        by smtp.gmail.com with ESMTPSA id
 2sm19805169pjt.23.2021.09.27.08.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Sep 2021 08:38:05 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: wangmy <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [hardknott][PATCH 4/4] apache2: upgrade 2.4.48 -> 2.4.49
Date: Mon, 27 Sep 2021 08:38:00 -0700
Message-Id: <20210927153800.1842931-4-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210927153800.1842931-1-akuster808@gmail.com>
References: <20210927153800.1842931-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Sep 2021 15:38:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93153

From: wangmy <wangmy@fujitsu.com>

Changes with Apache 2.4.49

  *) SECURITY: CVE-2021-40438 (cve.mitre.org)
     mod_proxy: Server Side Request Forgery (SSRF) vulnerabilty [Yann Ylavic]

  *) SECURITY: CVE-2021-39275 (cve.mitre.org)
     core: ap_escape_quotes buffer overflow

  *) SECURITY: CVE-2021-36160 (cve.mitre.org)
     mod_proxy_uwsgi: Out of bound read vulnerability [Yann Ylavic]

  *) SECURITY: CVE-2021-34798 (cve.mitre.org)
     core: null pointer dereference on malformed request

  *) SECURITY: CVE-2021-33193 (cve.mitre.org)
     mod_http2: Request splitting vulnerability with mod_proxy [Stefan Eissing]

  *) core/mod_proxy/mod_ssl:
     Adding `outgoing` flag to conn_rec, indicating a connection is
     initiated by the server to somewhere, in contrast to incoming
     connections from clients.
     Adding 'ap_ssl_bind_outgoing()` function that marks a connection
     as outgoing and is used by mod_proxy instead of the previous
     optional function `ssl_engine_set`. This enables other SSL
     module to secure proxy connections.
     The optional functions `ssl_engine_set`, `ssl_engine_disable` and
     `ssl_proxy_enable` are now provided by the core to have backward
     compatibility with non-httpd modules that might use them. mod_ssl
     itself no longer registers these functions, but keeps them in its
     header for backward compatibility.
     The core provided optional function wrap any registered function
     like it was done for `ssl_is_ssl`.
     [Stefan Eissing]

  *) mod_ssl: Support logging private key material for use with
     wireshark via log file given by SSLKEYLOGFILE environment
     variable.  Requires OpenSSL 1.1.1.  PR 63391.  [Joe Orton]

  *) mod_proxy: Do not canonicalize the proxied URL when both "nocanon" and
     "ProxyPassInterpolateEnv On" are configured.  PR 65549.
     [Joel Self <joelself gmail.com>]

  *) mpm_event: Fix children processes possibly not stopped on graceful
     restart.  PR 63169.  [Joel Self <joelself gmail.com>]

  *) mod_proxy: Fix a potential infinite loop when tunneling Upgrade(d)
     protocols from mod_proxy_http, and a timeout triggering falsely when
     using mod_proxy_wstunnel, mod_proxy_connect or mod_proxy_http with
     upgrade= setting.  PRs 65521 and 65519.  [Yann Ylavic]

  *) mod_unique_id: Reduce the time window where duplicates may be generated
     PR 65159
     [Christophe Jaillet]

  *) mpm_prefork: Block signals for child_init hooks to prevent potential
     threads created from there to catch MPM's signals.
     [Ruediger Pluem, Yann Ylavic]

  *) Revert "mod_unique_id: Fix potential duplicated ID generation under heavy load.
     PR 65159" added in 2.4.47.
     This causes issue on Windows.
     [Christophe Jaillet]

  *) mod_proxy_uwsgi: Fix PATH_INFO setting for generic worker.  [Yann Ylavic]

  *) mod_md: Certificate/keys pairs are verified as matching before a renewal is accepted
     as successful or a staged renewal is replacing the existing certificates.
     This avoid potential mess ups in the md store file system to render the active
     certificates non-working. [@mkauf]

  *) mod_proxy: Faster unix socket path parsing in the "proxy:" URL.
     [Yann Ylavic]

  *) mod_ssl: tighten the handling of ALPN for outgoing (proxy)
     connections. If ALPN protocols are provided and sent to the
     remote server, the received protocol selected is inspected
     and checked for a match. Without match, the peer handshake
     fails.
     An exception is the proposal of "http/1.1" where it is
     accepted if the remote server did not answer ALPN with
     a selected protocol. This accomodates for hosts that do
     not observe/support ALPN and speak http/1.x be default.

  *) mod_proxy: Fix possible reuse/merging of Proxy(Pass)Match worker instances
     with others when their URLs contain a '$' substitution.  PR 65419 + 65429.
     [Yann Ylavic]

  *) mod_dav: Add method_precondition hook. WebDAV extensions define
     conditions that must exist before a WebDAV method can be executed.
     This hook allows a WebDAV extension to verify these preconditions.
     [Graham Leggett]

  *) Add hooks deliver_report and gather_reports to mod_dav.h. Allows other
     modules apart from versioning implementations to handle the REPORT method.
     [Graham Leggett]

  *) Add dav_get_provider(), dav_open_lockdb(), dav_close_lockdb() and
     dav_get_resource() to mod_dav.h. [Graham Leggett]

  *) core: fix ap_escape_quotes substitution logic. [Eric Covener]

  *) Easy patches: synch 2.4.x and trunk
     - mod_auth_basic: Use ap_cstr_casecmp instead of strcasecmp.
     - mod_ldap: log and abort locking errors.
     - mod_ldap: style fix for r1831165
     - mod_ldap: build break fix for r1831165
     - mod_deflate: Avoid hard-coded "%ld" format strings in mod_deflate's logging statements
     - mod_deflate: Use apr_uint64_t instead of uint64_t (follow up to r1849590)
     - mod_forensic: Follow up to r1856490: missing one mod_log_forensic test_char_table case.
     - mod_rewrite: Save a few cycles.
     - mod_request: Fix a comment (missing '_' in 'keep_body') and some style issues
     - core: remove extra whitespace in HTTP_NOT_IMPLEMENTED
    [Christophe Jaillet]

  *) core/mpm: add hook 'child_stopping` that gets called when the MPM is
     stopping a child process. The additional `graceful` parameter allows
     registered hooks to free resources early during a graceful shutdown.
     [Yann Ylavic, Stefan Eissing]

  *) mod_proxy: Fix icomplete initialization of BalancerMember(s) from the
     balancer-manager, which can lead to a crash.  [Yann Ylavic]

  *) mpm_event: Fix graceful stop/restart of children processes if connections
     are in lingering close for too long.  [Yann Ylavic]

  *) mod_md: fixed a potential null pointer dereference if ACME/OCSP
     server returned 2xx responses without content type. Reported by chuangwen.
     [chuangwen, Stefan Eissing]

  *) mod_md:
     - Domain names in `<MDomain ...>` can now appear in quoted form.
     - Fixed a failure in ACME challenge selection that aborted further searches
       when the tls-alpn-01 method did not seem to be suitable.
     - Changed the tls-alpn-01 setup to only become unsuitable when none of the
       dns names showed support for a configured 'Protocols ... acme-tls/1'. This
       allows use of tls-alpn-01 for dns names that are not mapped to a VirtualHost.
     [Stefan Eissing]

  *) Add CPING to health check logic. [Jean-Frederic Clere]

  *) core: Split ap_create_request() from ap_read_request(). [Graham Leggett]

  *) core, h2: common ap_parse_request_line() and ap_check_request_header()
     code. [Yann Ylavic]

  *) core: Add StrictHostCheck to allow unconfigured hostnames to be
     rejected. [Eric Covener]

  *) htcacheclean: Improve help messages.  [Christophe Jaillet]

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 54a96fa4feb1a7712f9f3d1190c0d95d89eb6c7c)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../apache2/{apache2_2.4.48.bb => apache2_2.4.49.bb}           | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.48.bb => apache2_2.4.49.bb} (98%)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.48.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.49.bb
similarity index 98%
rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.48.bb
rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.49.bb
index 7af824dd16..7e52d1db47 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.48.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.49.bb
@@ -26,8 +26,7 @@ SRC_URI_append_class-target = " \
            "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bddeddfac80b2c9a882241d008bb41c3"
-SRC_URI[md5sum] = "a7088cec171b0d00bf43394ce64d3909"
-SRC_URI[sha256sum] = "1bc826e7b2e88108c7e4bf43c026636f77a41d849cfb667aa7b5c0b86dbf966c"
+SRC_URI[sha256sum] = "65b965d6890ea90d9706595e4b7b9365b5060bec8ea723449480b4769974133b"
 
 S = "${WORKDIR}/httpd-${PV}"
 
-- 
2.25.1


