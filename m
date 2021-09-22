Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.114])
 by mx.groups.io with SMTP id smtpd.web08.6940.1632316523389086567
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Sep 2021 06:15:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=UBXOwKwp;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.114, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1632316521; i=@fujitsu.com;
	bh=aC271PsFAYmlo3zkB7qYHAw/ItFCd6jzYqctVNluTzI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=UBXOwKwponE7r6cqh+verlhvYtzCxLEu0MptMwZ12ZCW61vls46/IuF3eKdBRMq89
	 hzDPzrt2BcwD/Hv60HDGS6xHu9zSynSLsWSSzqbMZnp9+koHWb2nucPYD+rvDAc0VB
	 jXAq8dCHR7gbOEZ1nxmun7rT9Wtx6D1E4tgELlELsWs/yKJ1gMq7UDVhD9hr3MPjD3
	 vPKzLZ908AN2BUw4dgV58rbVX36Y0YL5SiwvPpuUMs0ePpNndOQmGOWH/kBZUPZuWp
	 KWaR8MaA3IaGThOql4wP23IiUcmANv0WUtTDuJt4EYhCmsyRHCsjXcqs1VrishHTyz
	 dFgJVQwDsv3xw==
Received: from [100.113.6.157] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-b.eu-central-1.aws.symcld.net id DE/F6-23198-96C2B416; Wed, 22 Sep 2021 13:15:21 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrDIsWRWlGSWpSXmKPExsViZ8MxVTdDxzv
  R4NU6ZYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePF2n8sBZPtKv6c38TcwLjaqIuRi0NIYDaT
  xLJH95khnBOMEjO+rWHtYuTkYBNQk5h+6waYLSKgL7F09h5mEJtZQEXixe8edhBbWMBDYsWMa
  4wgNouAqkTL8cdsIDavgJPEoSndYDUSAgoSUx6+B+vlFHCWuLt+H9hMIaCa28d3MELUC0qcnP
  mEBWK+hMTBFy+YIXoVJWZfbmaBsCskZs1qY5rAyD8LScssJC0LGJlWMVokFWWmZ5TkJmbm6Bo
  aGOgaGhrrmgFZeolVukl6qaW6yal5JUWJQEm9xPJiveLK3OScFL281JJNjMCATClk49rB+PT1
  B71DjJIcTEqivEJXvBKF+JLyUyozEosz4otKc1KLDzHKcHAoSfB6aHsnCgkWpaanVqRl5gCjA
  yYtwcGjJMIrCJLmLS5IzC3OTIdInWLU5di+et4iZiGWvPy8VClx3giQIgGQoozSPLgRsEi9xC
  grJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmYVwpkCk9mXgncpldARzABHcG/0gPkiJJEhJRUA1P
  0J4MVdakVk5Ou+826tfHKmVUMU/ZuX3Q/4rxTbo1/4LPm98JxYSYdr9wz/mq6Pfn8wH3V5K1x
  PuINP/4cUblT/ihXaoaSa+S2BR7t/O8i7xQrzC2QNHjwZsEFuZ+vL54Su7m65UCMkvgG8+NJU
  0vce6YwPmP5tiXtghHHv08v6pmu7tKRfXQ7Q9+2QaHxkJFg5sUYyZ2xmQ/37kxae8Py9c/tPz
  qX5vb2KK3bG9Sp/qqMRVQs/uPyWlvPjPluZy6FtDdv9Ve8eimweGL4rBOpSf1zTJU+lV75ZLT
  wrPnWg28nzXm9Yak3e6fm6spzO9kyLkZ+lHLu97cJSk391D3x79mEf9+m9gZLzu2+ZBKrxFKc
  kWioxVxUnAgAtgyFAk8DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-238.messagelabs.com!1632316520!44570!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29615 invoked from network); 22 Sep 2021 13:15:20 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-3.tower-238.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 22 Sep 2021 13:15:20 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 18MDFKA9011189
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Sep 2021 14:15:20 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Wed, 22 Sep 2021 14:15:18 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-webserver] [PATCH] apache2: upgrade 2.4.48 -> 2.4.49
Date: Wed, 22 Sep 2021 21:15:00 +0800
Message-ID: <1632316500-58276-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1632316500-58276-1-git-send-email-wangmy@fujitsu.com>
References: <1632316500-58276-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

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
---
 .../apache2/{apache2_2.4.48.bb => apache2_2.4.49.bb}           | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.48.bb => apache2_2.4.49.bb} (98%)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.48.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.49.bb
similarity index 98%
rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.48.bb
rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.49.bb
index 1ac4fcbf26..e5d1879578 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.48.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.49.bb
@@ -26,8 +26,7 @@ SRC_URI:append:class-target = " \
            "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bddeddfac80b2c9a882241d008bb41c3"
-SRC_URI[md5sum] = "a7088cec171b0d00bf43394ce64d3909"
-SRC_URI[sha256sum] = "1bc826e7b2e88108c7e4bf43c026636f77a41d849cfb667aa7b5c0b86dbf966c"
+SRC_URI[sha256sum] = "65b965d6890ea90d9706595e4b7b9365b5060bec8ea723449480b4769974133b"
 
 S = "${WORKDIR}/httpd-${PV}"
 
-- 
2.25.1

