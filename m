Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAD6AD3C93C
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 17:49:03 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2043.1765388936075181766
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Dec 2025 09:48:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Crfqkvlk;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7e1651ae0d5so45734b3a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 09:48:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765388935; x=1765993735; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WuKWAsirCmETzn7NJA7fCeO6I79QGdn2yWHtzZcDyoo=;
        b=CrfqkvlkkHUgq6JaS7f5Q13JQfoe84DG2nIdWFeoS+z591dnVUdQRN6bFpArsvy5Tk
         LPa5VrG0zULNxH7mbr8sWyBaYNxLRqKuR9Yy0TErY7AHr/2tNuYTx0jFRzhpQzFEfU2v
         tslFjY6dDJe2YnB6GGp/uVQZ7scmKjV08bJw7g37pnAKDueoasp3wn/qVZ3a3E8LFUrQ
         NziQMQwd451chTTaOiv2kHOJLBCYl9TKrl5kTnOjhUh/GZhvtutaOzFxEldZAwcn+85k
         m484vEMhAs8+NsVxo2nqyHsQGD8WGdre70R5T+VC1Kp/eBOMQQi4Dtpr40Vs0Ct1Qy1+
         I51w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765388935; x=1765993735;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WuKWAsirCmETzn7NJA7fCeO6I79QGdn2yWHtzZcDyoo=;
        b=aN5dPD3amBvAtP//IVwaDNJ0y6r/vmfLbSS2LeGrjedFtC3puM8SQ8f6oiGoYv7N9F
         M4NjFa35l2G/RyEfzzbC3rBq6wjcZ1v6/n+gZMzRbgk3SSXu1zl/bqr4FAUEzVbDowd+
         WUkeZwBJ1ARXLNJolwYxzgr/xhCWFMKT2FYrwXrox0xGWPVvYQDEhjt1OdJv/+Cr1UbL
         1Yaprn3+1182h+HAEhi9x4KpGKjKuBDI9D6T3uv/9X8NnSuIMX8PGzIQi+ctG8tSl+CT
         ZV+XwHte1cFrnjOOmvq36UMklAaFfrOZgSPNSXoj8ARuNRJKnyCaPMsp7JvyxrIeSwEw
         kDuw==
X-Gm-Message-State: AOJu0Ywp8DVzRNErt2IDLWwMTJnl3vsIcDEG5wiMqoZ6+SH/PScpxzsz
	sTnkMeXy4kByfXFkiybEQbY7KbF8Q3SbbGK825ve7Gy5G4uiOcNnX4/N3lFITHLL
X-Gm-Gg: ASbGncuMn+FLf/68uZyadYx5lIJhMHK0L6UMOBK3gd9zwe0Bijqp7i0Rkz08nqued6f
	h9GMmESa9ZeV21/ahv4ig58rUmOuCKCqo4jZo4nB25ALaMWO6jkMBxBSf9YnDUno7G8C+Mohm0C
	AX9pMSVNaDXaeD0y9cNiqvKHDSQTZAQoEYxsjfVEUECtHc1uuluZ7DCms0i55xP5KEygDH19jNQ
	uSMaIfzOjto6hm0V2z+YzhHcPnCwxzYx+W27d+GiyG5xDy9G2rBDff+63BupyGAts9mmqw+v296
	xURME4I7RIcVfmSx3Xto83HnFUDtLMLhqLUjITJtR1NXtClPaKQfG9238FrQxWCmzP0XZgnSa3V
	qkfFXOv6VfcwwhSiM4kpihvhwTyku8bEi99AusBLrDzPoV3GCfVC5fv062NKrUebPWqwG9mWB8u
	+PEUzMKUg1xrSkwVNBnluG2Uw=
X-Google-Smtp-Source: AGHT+IEd+biuDx8RFIEwAU9tR/HXRxDeKcYCkivDNwiFGXi63197NWTRND5vwKf86wrleM4QL+jooA==
X-Received: by 2002:a05:6a20:918e:b0:35f:46d3:f27a with SMTP id adf61e73a8af0-366e0ae7ec5mr3257838637.5.1765388935147;
        Wed, 10 Dec 2025 09:48:55 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([122.161.48.114])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c0c264211cbsm124658a12.11.2025.12.10.09.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 09:48:54 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][whinlatter][PATCH 01/10] openvpn: upgrade 2.6.15 -> 2.6.16
Date: Wed, 10 Dec 2025 23:18:38 +0530
Message-ID: <20251210174847.2828731-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 17:49:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122567

From: Wang Mingyu <wangmy@fujitsu.com>

Code maintenance / Compat changes
---------------------------------
- adapt to new "encrypt-then-mac" cipher suites in OpenSSL 3.6.0 - these
  need special handling which we don't do, so the t_lpback self-test
  failed on them.  Exclude from list of allowed ciphers, as there is no
  strong reason today to make OpenVPN use these.
- fix various compile-time warnings

Documentation updates
---------------------
- fix outdated and non-HTTPS URLs throughout the tree (doxygen, warnings,
  manpage, ...)

Bugfixes
--------
- Fix memcmp check for the hmac verification in the 3way handshake.
  This bug renders the HMAC based protection against state exhaustion on
  receiving spoofed TLS handshake packets in the OpenVPN server inefficient.
  CVE: 2025-13086
- fix invalid pointer creation in tls_pre_decrypt() - technically this is
  a memory over-read issue, in practice, the compilers optimize it away
  so no negative effects could be observed.
- Windows: in the interactive service, fix the "undo DNS config" handling.
- Windows: in the interactive service, disallow using of "stdin" for the
  config file, unless the caller is authorized OpenVPN Administrator
- Windows: in the interactive service, change all netsh calls to use
  interface index and not interface name - sidesteps all possible attack
  avenues with special characters in interface names.
- Windows: in the interactive service, improve error handling in
  some "unlikely to happen" paths.
- auth plugin/script handling: properly check for errors in creation on
  $auth_failed_reason_file (arf).
- for incoming TCP connections, close-on-exec option was applied to
  the wrong socket fd, leaking socket FDs to child processes.
- sitnl: set close-on-exec flag on netlink socket
- ssl_mbedtls: fix missing perf_pop() call (optional performance profiling)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 351ac662131944f4c40ea8410a0077cc715053a2)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../openvpn/{openvpn_2.6.15.bb => openvpn_2.6.16.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/openvpn/{openvpn_2.6.15.bb => openvpn_2.6.16.bb} (98%)

diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.6.15.bb b/meta-networking/recipes-support/openvpn/openvpn_2.6.16.bb
similarity index 98%
rename from meta-networking/recipes-support/openvpn/openvpn_2.6.15.bb
rename to meta-networking/recipes-support/openvpn/openvpn_2.6.16.bb
index 8a88282cd5..88f564313f 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.6.15.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.6.16.bb
@@ -15,7 +15,7 @@ SRC_URI = "http://swupdate.openvpn.org/community/releases/${BP}.tar.gz \
 
 UPSTREAM_CHECK_URI = "https://openvpn.net/community-downloads"
 
-SRC_URI[sha256sum] = "e35513ee15995e3c71adfd8891b9f33522896c70b3baa2ed9a23c7a42c4d7bde"
+SRC_URI[sha256sum] = "05cb5fdf1ea33fcba719580b31a97feaa019c4a3050563e88bc3b34675e6fed4"
 
 CVE_STATUS[CVE-2020-27569] = "not-applicable-config: Applies only Aviatrix OpenVPN client, not openvpn"
 

