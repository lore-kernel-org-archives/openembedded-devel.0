Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F65FC433EF
	for <webhook@archiver.kernel.org>; Wed, 12 Jan 2022 04:28:07 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web08.18975.1641961686560298565
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jan 2022 20:28:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XVWOyjL+;
 spf=pass (domain: gmail.com, ip: 209.85.216.41,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id
 a1-20020a17090a688100b001b3fd52338eso1356902pjd.1
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jan 2022 20:28:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8B2uOhTj5/ikKTMooh08F541qkuPawtoqssCJ6UXnTg=;
        b=XVWOyjL+TyHOcA9i7R3SnPzRWYchHOMWi+tTm9PulTf1LeqZKV2mzYpI9Bfar8HrL7
         Ewrzq8Wv7dMuEQ2h5ngrBfnxrC17NMDSCsQNT01gUSAYbdm3oOMJyxw8mG6ORgiWjeyY
         Z48gS5wkAVdj2tSRaIv/DKRqv6hUXkl5iPkXghjLHSaJCm8ABj2/e5PKc0ZSG7Kgrb8n
         6/ARoPBKlfC+NNF6Vtyjn/EjgMCHNCtsA4rk8jJ2FmkH/MbygP19L9eVyEvzv048NtfB
         CIFpVa2DVPfxN6Za3NVDwZxVMp7iJm9kE1BaSuwmdFMjnlLyPi2S/ZOPG2CvsVm66yNo
         eB5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8B2uOhTj5/ikKTMooh08F541qkuPawtoqssCJ6UXnTg=;
        b=yOfs8Bpw/HuFBKw2Za3+Rj6W1gUZ+7GNFmsneUGjDr/pnEPX7iBK9p2F+ogIaIqHpC
         ElNvXlCVjmAzHzMmS+n+r3VFvfpJaiw5yPe7HbMQ0ErJTnry52/VbKaHLQIKx0C4cOAl
         lhnJinBEfQ+DkYbindPrMt5u9XEAFPP3NpVWzlY7SjW2RHnSIbJQ1qqFxHmzUoWLktqJ
         RTG4CuD0Z8z7YTR156GoVL+o8fRvjlK2FDojShNuXYbtE7P3uf9TZAMnwPpS53Htz8PB
         nJN/R3Xx1ALlxSFE091OZ1zDSAeEo4EpCEiIUGJq5jtKY1ASB0z/GZj1fkOInZPRjapf
         agiw==
X-Gm-Message-State: AOAM5320+vDvFdccBbKB2ULsvAbm9GJQSsYbfyXQkrvGUdo8XbUplSRV
	pwrN6w6Jn2TZUhw5I4pyciYJGmnuDLE=
X-Google-Smtp-Source: 
 ABdhPJyiXHe05a+q9IzTN+bWkHme//QVLW0B3Nve5e8x5Y5+Zllk0fVBCJzIg3iQjOBWy/d7LA2+BA==
X-Received: by 2002:a17:902:6908:b0:149:b26a:b9b5 with SMTP id
 j8-20020a170902690800b00149b26ab9b5mr7688018plk.169.1641961685039;
        Tue, 11 Jan 2022 20:28:05 -0800 (PST)
Received: from localhost.localdomain ([12.196.124.196])
        by smtp.gmail.com with ESMTPSA id
 s21sm310030pfk.55.2022.01.11.20.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 20:28:04 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: wangmy <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][honister][PATCH 1/2] apache2: upgrade 2.4.51 -> 2.4.52
Date: Tue, 11 Jan 2022 20:27:12 -0800
Message-Id: <20220112042713.10199-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jan 2022 04:28:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94767

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
index 4b36c50d55..0bf29a744e 100644
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


