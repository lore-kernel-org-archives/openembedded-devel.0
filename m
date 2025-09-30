Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A062CCA470
	for <webhook@archiver.kernel.org>; Tue, 30 Sep 2025 17:21:06 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web11.1215.1759252863802267543
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Sep 2025 10:21:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=W3Tnc5dX;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-71d60501806so68858167b3.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Sep 2025 10:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759252863; x=1759857663; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=98Ya9SnbKlqgTd7W1xC13L8jXgzT+iO/1h2/nYqNJOI=;
        b=W3Tnc5dXU1JL40NnOVRG0UxgfBTnrJ01OMt3rky3CstgZptOlJAL7ZAHB3nmY4a94a
         lPF3OPjYfD5tWt0MpI0OoOhPzg66PtYbdXbYb4MAiqut+adPGWl8vU7rekwBNG5bq5bY
         ImNA+atdx6cChWULFU7jQI27fNl3PINS05meMCypgZrQzq1Hj/PLX/VMPsYpf1+TVqOn
         6/G14SDu/8M14xcOS4qCNUmZo3g/UOzqpw7d5OdX+i38hY0rp2kguEzWZ2aB5JneZWrI
         ytturU7AbtCsR23ILlo4Ugrj3UX/yp9jEIBzYAMnj2m2E9uYAww2G7uZydaAnSBRYqZr
         mC1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759252863; x=1759857663;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=98Ya9SnbKlqgTd7W1xC13L8jXgzT+iO/1h2/nYqNJOI=;
        b=BhUdfGeuueXqGkKbHn3UAM0VHJZCrOWoCwF9Av225MsUFOu8/h+PafZDeMWSUdco6W
         ZhN/5crsSStPS+NdWhNLZAzg0iayDtSWdWC8yHWCUG+5Rw0apPmvSzxF8ZAIla4+g46X
         5w9LSnXiCrdXDosjiFZKbn6OXhoiR5L6f0Tt/nwnVHbFkieWQ0fV7SK3/Pe2IW4oY7AB
         fmucsGT6YmkczgI8mUUavUmy2ZbzBfvKyLs+nx/UIpqSn0oV2W+hq1V/x/c36QAzeOex
         aVy10dM9cuXQ8foGpxAXoAJV3eh8mQPRbmHVGSZSTd0L3wfVZ38r5Ef5sNDenf6IlZIk
         Dsrg==
X-Gm-Message-State: AOJu0Yz/6lFO81qgjTLsVCeREJm3EoZhJBRNepope4Kh6m+o7TgjkeWJ
	7wr8yI2sSyrbIF23TB09ZmcFBe088yniYtSbjEpbNYYif3FeymfKCU/4wZReOXgq
X-Gm-Gg: ASbGncuinMsJMy4v9qmmzwqeKpBvLujQDzc7Gw9RlRr5u/iOGG7SMkq18yIzWqJEOjT
	1m/nKVdz+Ik+76sA+IOyOQ9NiUtKix0kCNr6SCVPBLuF4nOMSZoGaAbeqFL+wJj+e2XzG8jjZND
	muBzg/5Rcf2bdGKAAe4qi5c7DCY1hT9My6kIAoUC9N5SvLiYXw9VlCTXVh6uZX3tv5l/KR+1pt4
	hjT1QvFNL70a/nHYxeenWG/gJeh1ihU9Vwf6ndYQ4sU2NZLYJrk84MORwC+g4mAau5BQs63KbLI
	iOfFl4aAgstLuhbFsgu4tWB/SiZGP95PnySHyPwJWdSqJiNbcnqLVY+6SUJuNfZxTMdf6IPLDcu
	bzX9/M8+IIMdf7MBUA0z04CB1vKbE9Ixh59swHu8iz8h9dLbYLLac
X-Google-Smtp-Source: AGHT+IGl2mIA0lpuDtY1+d8ETSOFCVf6sgOEp0f/lQ85EKLYDUZu2ujdVnQIM4Na9G/boxHvNG4XNA==
X-Received: by 2002:a05:690c:700b:b0:76a:557b:2666 with SMTP id 00721157ae682-77f6f391664mr5141197b3.49.1759252861897;
        Tue, 30 Sep 2025 10:21:01 -0700 (PDT)
Received: from localhost.localdomain ([67.233.61.26])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-765bd407b9asm39066247b3.24.2025.09.30.10.21.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 10:21:01 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH] neon: upgrade 0.33.0 -> 0.34.2
Date: Tue, 30 Sep 2025 13:20:49 -0400
Message-ID: <20250930172050.520798-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Sep 2025 17:21:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120081

Changes in release 0.34.2 (neon-0.34.2.tar.gz), 15th April 2025

    Fix regression in NTLM auth in 0.34.0 (issue #190).
    Add docs for ne_ssl_proto_name, ne_ssl_protovers, ne_get_request_target.

Changes in release 0.34.1 (neon-0.34.1.tar.gz), 14th April 2025

    Fix regression in 207 parsing of elements which omit a reason-phrase (issue #188).
    Fix ne_move() to submit lock tokens for the parent collection of a source resource locked with depth: 0.

Changes in release 0.34.0 (neon-0.34.0.tar.gz), 23rd November 2024

    Interface changes:
        API and ABI backwards-compatible with 0.27.x and later
        NE_SESSFLAG_SSLv2 is now ignored

    New interfaces and features:
        ne_request.h: add ne_get_response_location(), add ne_get_request_target()
        ne_redirect.h: adds relative URI resolution per RFC 9110
        ne_socket.h: add ne_iaddr_set_scope(), ne_iaddr_get_scope(), ne_sock_getproto()
        ne_session.h: add NE_SESSFLAG_STRICT session flag
        ne_session.h: ne_session_create() now accepts scoped IPv6 link-local literal addresses following the RFC 6874 syntax;
        ne_session.h: add ne_ssl_set_protovers() to configure TLS protocol version ranges
        ne_utils.h: add NE_FEATURE_GSSAPI, NE_FEATURE_LIBPXY feature flags
        ne_ssl.h: add ne_ssl_proto_name()
        HTTP strictness/compliance updated for RFC 9110/9112; notably stricter in parsing header field line, chunked transfer-coding, status-line.

    Bug fixes:
        auth: the ‘realm’ string passed to credentials callback is now cleaned of non-printable characters.
    Documentation & header updates for RFC 9110/9112.
    New NE_MINIMUM_VERSION() autoconf macro for better version handling.

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../recipes-support/neon/{neon_0.33.0.bb => neon_0.34.2.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/neon/{neon_0.33.0.bb => neon_0.34.2.bb} (93%)

diff --git a/meta-oe/recipes-support/neon/neon_0.33.0.bb b/meta-oe/recipes-support/neon/neon_0.34.2.bb
similarity index 93%
rename from meta-oe/recipes-support/neon/neon_0.33.0.bb
rename to meta-oe/recipes-support/neon/neon_0.34.2.bb
index 0ab6d25f53..738b029a29 100644
--- a/meta-oe/recipes-support/neon/neon_0.33.0.bb
+++ b/meta-oe/recipes-support/neon/neon_0.34.2.bb
@@ -1,5 +1,5 @@
 SUMMARY = "An HTTP and WebDAV client library with a C interface"
-HOMEPAGE = "http://www.webdav.org/neon/"
+HOMEPAGE = "https://notroj.github.io/neon/"
 SECTION = "libs"
 LICENSE = "LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://src/COPYING.LIB;md5=f30a9716ef3762e3467a2f62bf790f0a \
@@ -11,7 +11,7 @@ SRC_URI = "https://notroj.github.io/neon/neon-${PV}.tar.gz \
            file://run-ptest \
            "
 
-SRC_URI[sha256sum] = "659a5cc9cea05e6e7864094f1e13a77abbbdbab452f04d751a8c16a9447cf4b8"
+SRC_URI[sha256sum] = "f98ce3c74300be05eddf05dccbdca498b14d40c289f773195dd1a559cffa5856"
 
 inherit autotools-brokensep binconfig-disabled lib_package pkgconfig ptest gettext
 
-- 
2.43.0


