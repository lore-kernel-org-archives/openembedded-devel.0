Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E442DCD6E57
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 15:38:54 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1312.1780414727591473563
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Jun 2026 08:38:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=auYua2RR;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490a7678b2dso23917385e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 02 Jun 2026 08:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780414726; x=1781019526; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2J33gGBESbW3UJy3ZDpZJ1WySqX5BvkqmeYRTV1PIgo=;
        b=auYua2RRlUpVWgNE3IAt3mEjmhJWbmVTaAmSL94pIUq92LqMlQJ8rQuaKF2JUoypj1
         AuXp8/d6WTuWw2CW7Y2xYarqNV1SGu9Eg5TpqjevEGnc3DIlyvPvn16sPY6ue0iUZLUx
         E/D43IkaBrwJGAxXnxDSmN2ZJE9hiZT7zms9Qh13je/XsGNkJNrAJBbVGtov0wQruXyx
         Wd+b4PFRiQQkfOHmgdpxP3rtbyxQOYRaU8LymgdTEorCwinuVC244cLiELI/c90is0tm
         HrFv7WpIYlRudR62JYf0i1KN55U8nu5OIU6Tq2fAqWDJvyKcOHJqT4sziZQ5wAef8FYi
         TH9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780414726; x=1781019526;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2J33gGBESbW3UJy3ZDpZJ1WySqX5BvkqmeYRTV1PIgo=;
        b=fQ7FZuQ7AopGtcb6+uQ6sVLi92UUdxh7+fzhHzjrbuRMGbWCDo0fMKKK/iMzCw9LRu
         jMNh0aIFCrZGu/ijgtb+TFqbi2NDb6zYMC6KgI3Qsq8jnSwsXRoz8KFWxoo0ilhh2qsB
         E0dCcgcsCrlVjIzZGswtm2g3JLc/wmV5VwneGzs/CjD+1Kv7qD40LRIJQQMimnW/wGrV
         qJumhPPqemrJwBgsTVO/BJrtcRIzAn332Uq/Ho4s+tpMb7/C3hTjV/CB/bq5W+Uq9/kM
         yr0fGRtLvBqbA7Hyjou/OR/kFKtU2hqmnkoFTg8mvY/R+YDk+g98zcF56VaJ4HUiTRU/
         3VBA==
X-Gm-Message-State: AOJu0YyUZ4qjOWar/zS8T5yLy6/zdjU0rSe9xqcTimNCRXcm7u52Leqk
	xQsoKJc0oCrhTeulX0nUcvf8L/77cVz6epJieUcTkcH0tglt3VZiv0vquwcCiw==
X-Gm-Gg: Acq92OE+l3uDKjMiDQfZuJO7HjpTZV1sipXnSdXgpB6Zv2GxBeTdL3N7QJEXG/NmQXy
	UmAwV/50ZV/CN89IxH6ksG0sJtrzttFABpbErDvOGetW5QQ4mbvJXoV7IHtiQTq2y+hw8C1LRPJ
	WFe2nSBEiDYq/gOJUWUJU13GlwCfkbp3rotr5GdzkEvQgo/BACaVE9cA2PX3tztExASDFz74WWj
	EwkVoNqSp2uLj4X5hiWg00+qt7eBBZBGo8h599IsoCpJ2CRatFiM5OXcz4+RvT9rKYkGARwXAB7
	oFrm9BZyHYPgwYwO9K46vwkkrwjJND94em3bW2q7CIAe8DNwinlzDq/XvHr9ZnWSFsWx7Nxerym
	fRsp68ZJQkHrekYYiATAw0xMjvVF7S44J6gWivJ9o5XJaZEcAvn5aL4NLFN4BB0HERF5PWHfs+L
	MJBqSqrfPiMOHhuleDGMud2wWc6IHWMnjVpBOZvA9o/+cWSH0YsYOhysB7WZVbVALM2UV6XmIr4
	t0tKb6OXJBcspjhBkDlnw==
X-Received: by 2002:a05:600c:8b01:b0:48f:f7cc:f6f5 with SMTP id 5b1f17b1804b1-490b50c4af1mr3754165e9.31.1780414725873;
        Tue, 02 Jun 2026 08:38:45 -0700 (PDT)
Received: from localhost.localdomain (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e3431bsm70154115e9.12.2026.06.02.08.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 08:38:45 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-networking][PATCH 1/3] mdns: Add PACKAGECONFIGs for idlesleepcontrol, spc and unicast
Date: Tue,  2 Jun 2026 16:35:48 +0100
Message-ID: <20260602153548.97549-3-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Jun 2026 15:38:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127366

These three knobs are exposed to reduce the code size for embedded (see
mDNSCore/mDNSEmbeddedAPI.h). If you need them, you'll know you need
them, everyone else almost certainly doesn't.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 .../recipes-protocols/mdns/mdns_2881.100.56.0.1.bb   | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-protocols/mdns/mdns_2881.100.56.0.1.bb b/meta-networking/recipes-protocols/mdns/mdns_2881.100.56.0.1.bb
index 48e7a8d52d3e..3950ee666fc4 100644
--- a/meta-networking/recipes-protocols/mdns/mdns_2881.100.56.0.1.bb
+++ b/meta-networking/recipes-protocols/mdns/mdns_2881.100.56.0.1.bb
@@ -27,7 +27,10 @@ PACKAGECONFIG ?= "tls \
 PACKAGECONFIG[debug] = "DEBUG=1,DEBUG=0"
 PACKAGECONFIG[ipv6] = "HAVE_IPV6=1,HAVE_IPV6=0"
 PACKAGECONFIG[manpages] = ""
+PACKAGECONFIG[idlesleepcontrol] = ""
+PACKAGECONFIG[spc] = ""
 PACKAGECONFIG[tls] = ",tls=no,mbedtls"
+PACKAGECONFIG[unicast] = ""
 
 CVE_PRODUCT = "apple:mdnsresponder"
 
@@ -48,8 +51,15 @@ EXTRA_OEMAKE = "os=linux 'CC=${CCLD}' 'LD=${CCLD}' 'LINKOPTS=${LDFLAGS}' STRIP=:
 
 # MDNS_VERSIONSTR_NODTS disables __DATE__ and __TIME__ in the version string,
 # which are fixed anyway for build reproducibility.
+#
+# IDLESLEEPCONTROL_DISABLED - disables sleep control for Bonjour Sleep Proxy clients
+# UNICAST_DISABLED - disables unicast DNS functionality, including Wide Area Bonjour
+# SPC_DISABLED - disables Bonjour Sleep Proxy client
 TARGET_CPPFLAGS += "-DmDNSResponderVersion=${PV} \
-                    -DMDNS_VERSIONSTR_NODTS"
+                    -DMDNS_VERSIONSTR_NODTS \
+                    ${@bb.utils.contains('PACKAGECONFIG','idlesleepcontrol','','-DIDLESLEEPCONTROL_DISABLED', d)} \
+                    ${@bb.utils.contains('PACKAGECONFIG','unicast','','-DUNICAST_DISABLED', d)} \
+                    ${@bb.utils.contains('PACKAGECONFIG','spc','','-DSPC_DISABLED', d)}"
 
 TARGET_CC_ARCH += "${LDFLAGS}"
 

