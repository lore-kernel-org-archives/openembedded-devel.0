Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62CA2C433EF
	for <webhook@archiver.kernel.org>; Sat, 15 Jan 2022 14:28:08 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.7758.1642256887994255725
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 Jan 2022 06:28:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TDEkUNmU;
 spf=pass (domain: gmail.com, ip: 209.85.214.175,
 mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id n8so2430403plc.3
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 Jan 2022 06:28:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=kZGoEd5ism09BdMlYuF0dwRKExKzlorFfb9Op0ztsw0=;
        b=TDEkUNmUjOypSE9sXHsvRzIXp+UQZ2zrgttxpN8AePd4NUKzj8WMPisEggthV/dElc
         wC99JYL+Xh84PAcGPI553BN7qkOL9NG+9prPF1L73bRYX+o8JXwaVvUGt4s28zLUMLSd
         dndTiIbBv6VOm0jiCLZzsl2j+wE9ohX/ebquh3zVIkIlp2oKLjjMagYTLuUiNfYDgSIW
         4jyF52kOqhZNwTHWYlHcbB+ujTT+Bq7iQSxDkbuwObPWjP7IGNzl9uQlZaGkcKWVRtOR
         a63bLKASMmY5FnpOKIYpZgqMUy9Pk142NUjWJjcYrTOpfoIDz9F7ULN2Uq497j4AYadu
         Ps/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kZGoEd5ism09BdMlYuF0dwRKExKzlorFfb9Op0ztsw0=;
        b=5wlmjR+TKA+oD3XTUEUWz+bNGvmW7wahD9e82vZZ+wSgyGRoYMnJsdM1PdY8dz4o1O
         CYrduB2eeFMCtWj1Ee4g6p9CpAf9PlDGkMI/pP9uM0yh1RyGVGsBl35j6z/1iDBVwL4u
         4vseZSMokSAj9/Ch1rx47XuCPA+OgUK/bCAIVJ34RPFIbmL8Q8swwuk0d0iJ/jZ7zC2j
         CRUdELyELeDMZHjTbqAsYd4QAzA4IUB9BtzZTAKbaair1VCYqyAv+fYcDdKF5NGYIb8h
         EBU/uUvSR5qt+6eCXAoS7IVDSXzQB0Umj/BVrUNOrvsIiIHJdBHvIiJn0UcO3gdyVf9L
         9foQ==
X-Gm-Message-State: AOAM5338zTMzdpWz3ctEAIsbS7DMgvB8FoMA7pu/8JYW2Cf8iWFFBYmx
	Q8IxeMQTQTzxVrxtwB0rBg3983lsf7Js2A==
X-Google-Smtp-Source: 
 ABdhPJwuNP9llNBOBduvKcvdhuKuOtE/gUQcL/jr4wulu3vK3CSTw4S6+tPuB/lFWlJOTVjCt668cQ==
X-Received: by 2002:a17:902:7e82:b0:149:9714:699e with SMTP id
 z2-20020a1709027e8200b001499714699emr14134669pla.66.1642256887264;
        Sat, 15 Jan 2022 06:28:07 -0800 (PST)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:7ab9:6507:6566:58c8])
        by smtp.gmail.com with ESMTPSA id
 k20sm8606779pfk.111.2022.01.15.06.28.06
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jan 2022 06:28:06 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 09/11] apache2: upgrade 2.4.51 -> 2.4.52
Date: Sat, 15 Jan 2022 06:27:52 -0800
Message-Id: 
 <e8cb9338dfdb80be1e2022a91fa8bacf327172ae.1642256649.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1642256648.git.akuster808@gmail.com>
References: <cover.1642256648.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 15 Jan 2022 14:28:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94868

From: wangmy <wangmy@fujitsu.com>

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
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit ea76fc643713915a1618597be8bdbe0e4a3d993e)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../apache2/{apache2_2.4.51.bb => apache2_2.4.52.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.51.bb => apache2_2.4.52.bb} (99%)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.51.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.52.bb
similarity index 99%
rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.51.bb
rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.52.bb
index d6e736d31d..10123aa2bb 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.51.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.52.bb
@@ -26,7 +26,7 @@ SRC_URI_append_class-target = " \
            "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bddeddfac80b2c9a882241d008bb41c3"
-SRC_URI[sha256sum] = "20e01d81fecf077690a4439e3969a9b22a09a8d43c525356e863407741b838f4"
+SRC_URI[sha256sum] = "0127f7dc497e9983e9c51474bed75e45607f2f870a7675a86dc90af6d572f5c9"
 
 S = "${WORKDIR}/httpd-${PV}"
 
-- 
2.25.1


