Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8238.1795739789926916602
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:36:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=hYGL8A+G;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2f0464dd6b6so46225375ad.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:36:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739789; x=1796344589; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uct2QJ3WFp3HTR0ZGydS4jb2RHCN2Aw55fuwgcdX9x0=;
        b=hYGL8A+GFZ+qVYFlIyiM6ubxhIp1fmS8kYNOagCh6z8WMKuItjPraS9cGoAFjZd88w
         qpuFEg5RFQu3KtOVMqtmgJb+zLYl8stYLxYb92UExXLSvUKGVP9wQWmVPj9w1T8EjGu3
         EzPgTHBxJCWtmpFObNok8sWQIaLyawT4e+0Zn+X7sBZDzKtrqP3o79iLCeRCbWmzg7i1
         eqin6QoAEsWLezn6kjbNp1uLTp0xLPIW+gcYMjqQgwwU4wKv8tAE6QgIqga1CQy2ULma
         iRY47Z2XGJ1ECSAClqIw8H3+J8cNMAHqGZe7/bkD1VlYHWJ/WFnxvpjWXCCUAI/IPVBV
         rVng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739789; x=1796344589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uct2QJ3WFp3HTR0ZGydS4jb2RHCN2Aw55fuwgcdX9x0=;
        b=nyUwJ3C9k06M3gIfEPH8Rz/Yoo+mph9G0EViOZc/FD9OZ6diWYC3cQJtgZJDAZw9PY
         /jit8t58ua9ZOa/fM2SjnmY9WKgQcEkf5PfxgG5F3gMM57+Ri1XRtks4E2HTz/ojtfwb
         aNUIyo2nNATtRh/6YWeY3VQv+NgNequuWbeJZLRsOVYhn2GAmDJfrT476LVlprHfsOdZ
         ewEKqXuUxC2Nqj5V0mFGGJm7xvHPlSA60XArta8p+K+QMLQb8+JtHnV6tMmYcGtC0OpJ
         LC0uBlMWvGRNC3VmbrxxMYt4vPHovexaaC9pBCSYw3GWqyyrEb8L1Pkg1Ol2ndTUYizZ
         CHFQ==
X-Gm-Message-State: APuU4Z/Ap0yOp2YzLE23kYXtUYzHidNiBf6rwwHOnmqUXbkvl2roGkii
	AgDd324hM5IFYTjDpLXCuGtVRoeqyt590REyvT5ShC9D7A6kBJhCPG1SF6SM43Zt
X-Gm-Gg: AZFdTZcFoOSxakBo0czSNVpZmhvUvtZpBk5E/uv0dPEiuBI8B7hcyl9+WX62s/OJqAj
	79hUK2/JMGpY5Jq5BJXozSSgQnIQGHxXGhMk88Ime2CztdOPFFmYTzNRYXsBeQqKXvTSdcNFnmU
	TKJ/qjjyksPYFgM2IEx80o3oHeT+xlw33uNmJt0tpFbNjDfBg+G6cvv28xdnB8Srv3ddQxWVhlG
	EowdFIYaqfddNGfdMV1ILHuPMzsDnfS3+/90WsUNjvG+XcMbh4xpdqPtjVGdx2NaOqI6g5E6680
	fdzo0h65/OtjfoSa1lnj8C5kogwehiLBT/m3sSn8ls1xt/HM4BDI2auuKCSsICMpGwolkq6HYWu
	6QolgTCsr7yILntARF1Esmp2Y9JZw5pC4QWpaQxyTpL3voxezcWesXM6awDLU61XHt8n6RsNZys
	QoDhP/dal+EcRBunilgKrZgvMBQYZU3EUymuQ46Sv96d/Qz1DKDkFaaqO9KyTsrfBcijn9ZLlV4
	zYZM7gIhLIwD/OXFGO2vhXXxawToc3UMATFuYJcBmRI0iiKKbeEKkac3l7oj/9iwasv6abSAms0
	cWxSeedChbtHYKRigLLEBB0AKyRst9m2WMcvOQYPrYIMC3x4Mp23QykU5+mCjfZrwYJOg0bihn7
	HD5Oz67GFawt8GXJGXzLRUYP3gP9r4ZMAnneKavj99ccTUdNg62ARepsupyGZckcZ1H7cu+Hloq
	jr/OMRbhv8YrWcRCvXOqap1RDzPtmkkagGIl61J0ZEwtyPapJJZ7Rm1LEtqtUaR3iQzu/rAyBOV
	vzjPnEKRRhrxczaZBWnz9fXrFjvkKxByXbhSzcTf62Wgp7yhG09hJwLMVd62pdKwCSHz8mZFoUO
	43besi+Ph7Gju2BpaM0deVnXDg==
X-Received: by 2002:a17:903:37c4:b0:2f0:422a:222d with SMTP id d9443c01a7336-2f0422a30dbmr227292605ad.22.1795739789223;
        Thu, 26 Nov 2026 16:36:29 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0fe9e36f9sm10410875ad.55.2026.11.26.16.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:36:28 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 20/39] libtorrent-rasterbar: upgrade 2.1.2 -> 2.1.3
Date: Thu, 26 Nov 2026 16:35:24 -0800
Message-ID: <20261127003543.2167775-21-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127003543.2167775-1-khem.raj@oss.qualcomm.com>
References: <20261127003543.2167775-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:36:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133190
Content-Type: text/plain; charset="utf-8"

Bug-fix and hardening release:
- Apply the IP filter to WebRTC peers; ignore i2p peers with invalid
  destinations; limit the allowed-fast set received from a peer.
- Validate the listen port in a peer's extension handshake and fix the
  web seed SSRF mitigation for IPv6 addresses.
- Fix several use-after-free, out of bounds write, signed overflow and
  memory leak issues (pread disk I/O, UPnP response, merkle layers,
  SSL peer certificates, C binding).
- Mitigate DHT peer storage flooding from a single IPv6 prefix.
- Fix file order when creating hybrid torrents and web seed redirects.

The try_signal submodule is unchanged. Add UPSTREAM_CHECK_GITTAGREGEX so
that release candidate tags are ignored.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...orrent-rasterbar_2.1.2.bb => libtorrent-rasterbar_2.1.3.bb} | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/libtorrent-rasterbar/{libtorrent-rasterbar_2.1.2.bb => libtorrent-rasterbar_2.1.3.bb} (91%)

diff --git a/meta-oe/recipes-connectivity/libtorrent-rasterbar/libtorrent-rasterbar_2.1.2.bb b/meta-oe/recipes-connectivity/libtorrent-rasterbar/libtorrent-rasterbar_2.1.3.bb
similarity index 91%
rename from meta-oe/recipes-connectivity/libtorrent-rasterbar/libtorrent-rasterbar_2.1.2.bb
rename to meta-oe/recipes-connectivity/libtorrent-rasterbar/libtorrent-rasterbar_2.1.3.bb
index dac8c6cfc6..c40e173c1f 100644
--- a/meta-oe/recipes-connectivity/libtorrent-rasterbar/libtorrent-rasterbar_2.1.2.bb
+++ b/meta-oe/recipes-connectivity/libtorrent-rasterbar/libtorrent-rasterbar_2.1.3.bb
@@ -10,10 +10,11 @@ SRC_URI = "git://github.com/arvidn/libtorrent.git;branch=master;protocol=https;t
 	git://github.com/arvidn/try_signal.git;branch=master;protocol=https;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/deps/try_signal;name=try_signal \
            "
 
-SRCREV = "6da363d2994f17c0b3c0450d124cf73a31a73847"
+SRCREV = "87b77c039e98200e0e7625ddc5bdc55b44c7f2c1"
 SRCREV_try_signal = "105cce59972f925a33aa6b1c3109e4cd3caf583d"
 SRCREV_FORMAT .= "_try_signal"
 
+UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>\d+(\.\d+)+)$"
 
 inherit cmake pkgconfig python3targetconfig
 
