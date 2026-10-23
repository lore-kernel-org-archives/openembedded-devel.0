Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12741.1792777448878985254
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Oct 2026 10:44:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=qjVJ2luD;
 spf=pass (domain: konsulko.com, ip: 209.85.221.50, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48b042c0759so792794f8f.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Oct 2026 10:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792777447; x=1793382247; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/en32p0NvHzWNa+QakB1A8wDVfDrNy9ehOlzAkudUZw=;
        b=qjVJ2luDLARHiDoZNNc213tvyOgXa5p8+++0m0AnYQL7fcoRpyefEarLrPIykowtMw
         zAiMzBZh+4H1Au9jIrVHLSMWzMAsImxE9dZcK19/5dSsHXZ0UKovL8xtrdLuqnBBf8hz
         dbaEE0ixBhxY6grYnH8+fdC5ixogcGrKJN+40=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792777447; x=1793382247;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/en32p0NvHzWNa+QakB1A8wDVfDrNy9ehOlzAkudUZw=;
        b=m3+7DEkBi4NaOh0Vb+UEj2KCUFkiJGwXDPFn8TNQyF6fcSfKohj0pyrZxWdTsM+qH6
         ieG1oZ9V9jxz8Z90GvHQ8Cl/64wex4KcwLfEuWt9b+nq9XuSj5isewsoKdOeKQy5Tgjq
         qHUExe62wGIUObDtNEY6Io1vxLi7c7j5RAIL+JiMnZQytgLUFhEP02oUEkr9PaJYwmQm
         zZqVhPIHlaNYDsynukXT5KUb/8vS/uH13QuhWhp07TEs9qbsJQrpsnPFwUFPwVe35nbG
         Ok05SnSqaHUjsBcE/xSDTa5s0gtV8mu70vzA2wdR+n9zCgPvlOUHYl6SrF5IElrZcU7e
         rRrA==
X-Gm-Message-State: AFq9FYL0xDMR+H+nMBfmZsDitNimfj/HvsvNPeF4CMPVmY6BCbQWPQLQ
	tyXkyBSjmolXG/4A9xcnlxgaVtXDZ2dyDcVPT5xrSIec+vR82MKEEHqNdYAyJoB07aAcCpIgX5o
	std2U
X-Gm-Gg: AYBFou0qj7LG/2DLfP0X8goOtLVzGiyuW/Jb/u6clGgnwYTRpobKM7jRnUORaRhYJZ/
	qbSd/7FIiRPhH8H0VYN1JDW3VebcFKPaiHTevgqOJl7dDfT9rRi1cJS9NVtagNiRBVs2DYhiu5h
	EzoDMPpkYzlKdZAfCGKYsuT5vY5bAH/AazLVaqGJxGGHwQF3wEIq5SPZhLZeL9TLt09SaumDIJK
	Y7CbojG0kA7F3G96E6zmXSajAwZGOLIcSKTFD8vsEfc+uVQHeHLMO65yeu6r8NhhsK5fr24wPwv
	s0ClbYISCEFC/e+POve2JMDBsFa1Nyi9JyUW15nVTqh6UF3TAXU2qIeJDUmp4h5K3naHsICkofT
	X1daqbIoRwGnDggWSAYxL98fApcDnEZSSPXzC4D17n4/zKYZIwWQGWBM/PmdsgqDysOPMYJjUpv
	rzSbYdqlYEvdsPjLoxTPBC+Oox1ws8xZ0u1qac8NJlsVRoU1RfoCrYuAQ9fyGfF6gYzHH04E/wW
	TSilXnsGo9ENqGQs+/3/eUULmBR4j2OCe9UNSZxDrozaCqwjM0KYB9sA4NkS/dZeENnyfcc13zf
	UqhXMP1hg5+HePz7S6quBHJMSOUMkRKtjpluV1CdlnLjhLTcrViIKjxsglEpApa3k+8bwosjOnl
	JTyOu
X-Received: by 2002:a5d:5d0e:0:b0:48e:2f55:8c4a with SMTP id ffacd0b85a97d-48e3854cfb8mr4687075f8f.4.1792777446345;
        Fri, 23 Oct 2026 10:44:06 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d3ee6d8sm1147864f8f.14.2026.10.23.10.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:44:05 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/9] python3-autobahn: Upgrade 26.10.1 -> 26.10.2
Date: Fri, 23 Oct 2026 20:43:54 +0300
Message-ID: <20261023174401.3617912-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261023174401.3617912-1-leon.anavi@konsulko.com>
References: <20261023174401.3617912-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 23 Oct 2026 17:44:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131382
Content-Type: text/plain; charset="utf-8"

Upgrade to release 26.10.2:

- Fix reading the TLS peer certificate
  (TransportDetails.peer_cert) with pyOpenSSL 26.2.0 and later:
  autobahn.twisted.util.extract_peer_certificate() raised
  AttributeError: 'X509' object has no attribute 'get_extension'
  for every certificate with extensions, as pyOpenSSL removed its
  X.509 extension API (and deprecates the rest of its X509 API).
  The certificate is now read with cryptography, in the new
  backend-neutral autobahn.util.peer_certificate_details(), which
  also never raises on certificate content it cannot parse (it is
  peer data, read before authentication): extensions, or a subject
  or issuer, that cannot be read are left empty. The peer_cert dict
  keeps its keys and formats, except: ⚠ extensions[].value was
  OpenSSL's text; a subject or issuer alternative name is still
  given as OpenSSL prints it (DNS:localhost, IP Address:127.0.0.1),
  other extensions now as cryptography prints them; and
  signature_algorithm is ed25519 instead of ED25519 for Ed25519
  certificates

- Fix the TLS peer certificate never being available on Twisted
  WebSocket and RawSocket connections: it was read when the TCP
  connection was made, before the TLS handshake, and so was always
  None. It is now read when the TLS handshake is complete, together
  with the TLS channel ID. With this, TLS client certificate
  authentication (Crossbar.io authmethod tls, and dynamic
  authenticators reading transport.peer_cert) works again

- Fix asyncio: fill TransportDetails.peer_cert (it was always
  None), and treat a TLS server connection without a client
  certificate as secure, with a TLS channel ID: is_secure was
  derived from the peer certificate, so WAMP-cryptosign with
  channel binding failed on asyncio servers

- Behaviour change - the TLS channel ID tls-unique on Twisted now
  follows RFC 5929 (the first TLS Finished message of the
  handshake, in a full handshake the client's), as Python's ssl
  module, and so autobahn on asyncio, already did. Twisted used the
  server's Finished message, so WAMP-cryptosign with channel
  binding failed between Twisted and asyncio peers over WebSocket,
  and between Twisted RawSocket peers (whose protocols did not set
  is_server, so the client side used the wrong message). Twisted
  peers on autobahn 26.10.1 or older and on 26.10.2 no longer agree
  on the channel ID over WebSocket: upgrade both sides of
  connections that use channel binding (#2014) Work around a PyPy
  bug: PyPy's ssl module (up to at least PyPy 7.3.23) returns the
  server's TLS Finished message from
  get_channel_binding("tls-unique") instead of the first (the
  client's), so autobahn on asyncio on PyPy disagreed with all
  other peers on the channel ID. The new autobahn.util.tls_unique()
  uses PyPy's own tls_unique_cb() on PyPy, which returns the right
  message

- TransportDetails.is_server is now set on Twisted RawSocket and
  asyncio WebSocket connections (it was None)

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...0001-Skip-march-guessing-for-external-cross-toolchains.patch | 2 +-
 ...{python3-autobahn_26.10.1.bb => python3-autobahn_26.10.2.bb} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-autobahn_26.10.1.bb => python3-autobahn_26.10.2.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-autobahn/0001-Skip-march-guessing-for-external-cross-toolchains.patch b/meta-python/recipes-devtools/python/python3-autobahn/0001-Skip-march-guessing-for-external-cross-toolchains.patch
index 0161b09eb5..7573b1f5a6 100644
--- a/meta-python/recipes-devtools/python/python3-autobahn/0001-Skip-march-guessing-for-external-cross-toolchains.patch
+++ b/meta-python/recipes-devtools/python/python3-autobahn/0001-Skip-march-guessing-for-external-cross-toolchains.patch
@@ -1,4 +1,4 @@
-From 2afdc29c60812d16708041c3c48ebf8674a5d16f Mon Sep 17 00:00:00 2001
+From bfcf66157dab06a8f4f718cc0016e799f6b9e284 Mon Sep 17 00:00:00 2001
 From: Leon Anavi <leon.anavi@konsulko.com>
 Date: Mon, 20 Jul 2026 15:52:32 +0300
 Subject: [PATCH] Skip -march guessing for external cross toolchains
diff --git a/meta-python/recipes-devtools/python/python3-autobahn_26.10.1.bb b/meta-python/recipes-devtools/python/python3-autobahn_26.10.2.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-autobahn_26.10.1.bb
rename to meta-python/recipes-devtools/python/python3-autobahn_26.10.2.bb
index 9150e92981..03ea85111f 100644
--- a/meta-python/recipes-devtools/python/python3-autobahn_26.10.1.bb
+++ b/meta-python/recipes-devtools/python/python3-autobahn_26.10.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=49165a577911c4178e915dc26e2802a3"
 
 SRC_URI += "file://0001-Skip-march-guessing-for-external-cross-toolchains.patch"
 
-SRC_URI[sha256sum] = "0acc00895d4d3b06b55e4c945592d426033062c989ca2910749777a855faa27a"
+SRC_URI[sha256sum] = "6c69fca89106567060941c5568e67a5369738813d883db4e3d62b76f0a2c497e"
 
 CVE_PRODUCT = "autobahn"
 
-- 
2.47.3

