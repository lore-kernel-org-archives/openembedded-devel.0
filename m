Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F92EC433F5
	for <webhook@archiver.kernel.org>; Mon, 27 Dec 2021 14:34:53 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.82])
 by mx.groups.io with SMTP id smtpd.web09.26778.1640615691997457262
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 06:34:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=tS4SE3pD;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.82,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1640615690; i=@fujitsu.com;
	bh=FjkA61AFgnBPlqY/IMBvS6iimBiffyd8b21R0jmqB7o=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=tS4SE3pD9ZvraYiFLQHsFnjVwApxESVtokS6Bj9qwL3hQmuTLqNrZkMw1wt4Rrtn9
	 SEIyZX+d/LL8R8WiOkAWIFCvTyygR5bbHUtlZQJb3ph+18S7+X08awLejOmt/xrSrR
	 Ll6DVF3QNbEAxp3zXl5rpW/Q9xycV9w6vv6fQvljiUDsZYAY7iumxxe8PEX7K5nZDD
	 rIjAd/OarJx2MxoefOFNRsnicZc4i+j6LJlQbQ6V9QBu7lTD5+a/jK4cNBCJ61RkC8
	 r5sSb7kR/eQtiYErsxUxd2xTGgMC7d7WkqVuSKwfKeT0h6X4/yqszXCUN0Tq8zar60
	 p3bWFdiA8tBGQ==
Received: from [100.115.4.164] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-west-1.aws.ess.symcld.net id 62/CA-30341-A0FC9C16;
 Mon, 27 Dec 2021 14:34:50 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrLIsWRWlGSWpSXmKPExsViZ8MxSZfz/Ml
  Egz3LDC0uHl7K7MDocW7jCsYAxijWzLyk/IoE1owlTzILNplWzD43i7WBcZtWFyMXh5DAE0aJ
  3lvbWSGcC0wSR/78YYJwTjBKrGw4ztjFyMnBJqAmMf3WDVYQW0RAX2Lp7D3MIDazgIrEi9897
  CC2sICHxO9Z14FsDg4WAVWJv7MFQcK8Ak4S7U/Wg7VKCChITHn4nhkiLihxcuYTFogxEhIHX7
  xghqhRlJh9uZkFwq6QmDWrjQnCVpO4em4T8wRG/llI2mchaV/AyLSK0SqpKDM9oyQ3MTNH19D
  AQNfQ0FTXVNfIyFQvsUo3US+1VLc8tbhE11AvsbxYL7W4WK+4Mjc5J0UvL7VkEyMwJFOKWR/u
  YFzc91PvEKMkB5OSKO/3CScThfiS8lMqMxKLM+KLSnNSiw8xynBwKEnwrj8LlBMsSk1PrUjLz
  AHGB0xagoNHSYT3Dkiat7ggMbc4Mx0idYpRl+N1y88dzEIsefl5qVLivAdBigRAijJK8+BGwG
  L1EqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVh3iaQKTyZeSVwm14BHcEEdMRMh+MgR5QkIqS
  kGphyFr1a9ac9ukF+TcqzUBn5z1NEdcMULr8IL93u9+Yuj0eMOufvrLD66tcNzrHfDuS4Si4z
  bhJUeHa0TGrpMjnO5rzvtpvYvn1cd/bU8TPvcyY/1YhhqkmOq/jiVRn2h9f9S1vLItWTP0/ds
  xZ/sibf8skcZvF5i40KWhn/inc+a+9vUvc5XvF4jqyTp9m+BtvItT1u81ZPCUzhmFV7sv+iae
  25OOdEgav/Nx9Y9OLis4+9Phck3jjP+v/kw+rmqPxlnCciz/pFNUv38Adyp912vXieh3+v9+z
  vPIsYItZO4Tvl/ddp6+YKZcUE7uXPFcTNKy2evToY7pRsd+Dek0NdssW1XyvyFK31ym8y3FZi
  Kc5INNRiLipOBABDx90pUAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-585.messagelabs.com!1640615689!308269!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26890 invoked from network); 27 Dec 2021 14:34:49 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-14.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Dec 2021 14:34:49 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 5B8D3100352
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 14:34:49 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 4F3E8100331
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 14:34:49 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 27 Dec 2021 14:34:30 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-webserver] [PATCH] apache2: upgrade 2.4.51 -> 2.4.52
Date: Mon, 27 Dec 2021 22:34:12 +0800
Message-ID: <1640615652-22965-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Dec 2021 14:34:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94513

Changelog:
==========
 *) SECURITY: CVE-2021-44790: Possible buffer overflow when parsing
     multipart content in mod_lua of Apache HTTP Server 2.4.51 and
     earlier (cve.mitre.org)
     A carefully crafted request body can cause a buffer overflow in
     the mod_lua multipart parser (r:parsebody() called from Lua
     scripts).
     The Apache httpd team is not aware of an exploit for the
     vulnerabilty though it might be possible to craft one.
     This issue affects Apache HTTP Server 2.4.51 and earlier.

  *) SECURITY: CVE-2021-44224: Possible NULL dereference or SSRF in
     forward proxy configurations in Apache HTTP Server 2.4.51 and
     earlier (cve.mitre.org)
     A crafted URI sent to httpd configured as a forward proxy
     (ProxyRequests on) can cause a crash (NULL pointer dereference)
     or, for configurations mixing forward and reverse proxy
     declarations, can allow for requests to be directed to a
     declared Unix Domain Socket endpoint (Server Side Request
     Forgery).
     This issue affects Apache HTTP Server 2.4.7 up to 2.4.51
     (included).

  *) http: Enforce that fully qualified uri-paths not to be forward-proxied
     have an http(s) scheme, and that the ones to be forward proxied have a
     hostname, per HTTP specifications.

  *) OpenSSL autoconf detection improvement: pick up openssl.pc in the
     specified openssl path.

  *) mod_proxy_connect, mod_proxy: Do not change the status code after we
     already sent it to the client.

  *) mod_http: Correctly sent a 100 Continue status code when sending an interim
     response as result of an Expect: 100-Continue in the request and not the
     current status code of the request. PR 65725

  *) mod_dav: Some DAV extensions, like CalDAV, specify both document
     elements and property elements that need to be taken into account
     when generating a property. The document element and property element
     are made available in the dav_liveprop_elem structure by calling
     dav_get_liveprop_element().

  *) mod_dav: Add utility functions dav_validate_root_ns(),
     dav_find_child_ns(), dav_find_next_ns(), dav_find_attr_ns() and
     dav_find_attr() so that other modules get to play too.

  *) mpm_event: Restart stopping of idle children after a load peak. PR 65626.

  *) mod_http2: fixes 2 regressions in server limit handling.
     1. When reaching server limits, such as MaxRequestsPerChild, the
        HTTP/2 connection send a GOAWAY frame much too early on new
        connections, leading to invalid protocol state and a client
        failing the request. See PR65731.
        The module now initializes the HTTP/2 protocol correctly and
        allows the client to submit one request before the shutdown
        via a GOAWAY frame is being announced.
     2. A regression in v1.15.24 was fixed that could lead to httpd
        child processes not being terminated on a graceful reload or
        when reaching MaxConnectionsPerChild. When unprocessed h2
        requests were queued at the time, these could stall.
        See <https://github.com/icing/mod_h2/issues/212>.

  *) mod_ssl: Add build support for OpenSSL v3.

  *) mod_proxy_connect: Honor the smallest of the backend or client timeout
     while tunneling.

  *) mod_proxy: SetEnv proxy-nohalfclose (or alike) allows to disable TCP
     half-close forwarding when tunneling protocols.

  *) core: Be safe with ap_lingering_close() called with a socket NULL-ed by
     a third-party module.  PR 65627.

  *) mod_md: Fix memory leak in case of failures to load the private key.
     PR 65620

  *) mod_md: adding v2.4.8 with the following changes
    - Added support for ACME External Account Binding (EAB).
      Use the new directive `MDExternalAccountBinding` to provide the
      server with the value for key identifier and hmac as provided by
      your CA.
      While working on some servers, EAB handling is not uniform
      across CAs. First tests with a Sectigo Certificate Manager in
      demo mode are successful. But ZeroSSL, for example, seems to
      regard EAB values as a one-time-use-only thing, which makes them
      fail if you create a seconde account or retry the creation of the
      first account with the same EAB.
    - The directive 'MDCertificateAuthority' now checks if its parameter
      is a http/https url or one of a set of known names. Those are
      'LetsEncrypt', 'LetsEncrypt-Test', 'Buypass' and 'Buypass-Test'
      for now and they are not case-sensitive.
      The default of LetsEncrypt is unchanged.
    - `MDContactEmail` can now be specified inside a `<MDomain dnsname>`
      section.
    - Treating 401 HTTP status codes for orders like 403, since some ACME
      servers seem to prefer that for accessing oders from other accounts.
    - When retrieving certificate chains, try to read the repsonse even
      if the HTTP Content-Type is unrecognized.
    - Fixed a bug that reset the error counter of a certificate renewal
      and prevented the increasing delays in further attempts.
    - Fixed the renewal process giving up every time on an already existing
      order with some invalid domains. Now, if such are seen in a previous
      order, a new order is created for a clean start over again.
      See <https://github.com/icing/mod_md/issues/268>
    - Fixed a mixup in md-status handler when static certificate files
      and renewal was configured at the same time.

  *) mod_md: values for External Account Binding (EAB) can
     now also be configured to be read from a separate JSON
     file. This allows to keep server configuration permissions
     world readable without exposing secrets.

  *) mod_proxy_uwsgi: Remove duplicate slashes at the beginning of PATH_INFO.
     PR 65616.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../apache2/{apache2_2.4.51.bb => apache2_2.4.52.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.51.bb => apache2_2.4.52.bb} (99%)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.51.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.52.bb
similarity index 99%
rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.51.bb
rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.52.bb
index 29deedf3a..39407b8a1 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.51.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.52.bb
@@ -26,7 +26,7 @@ SRC_URI:append:class-target = " \
            "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bddeddfac80b2c9a882241d008bb41c3"
-SRC_URI[sha256sum] = "20e01d81fecf077690a4439e3969a9b22a09a8d43c525356e863407741b838f4"
+SRC_URI[sha256sum] = "0127f7dc497e9983e9c51474bed75e45607f2f870a7675a86dc90af6d572f5c9"
 
 S = "${WORKDIR}/httpd-${PV}"
 
-- 
2.25.1


