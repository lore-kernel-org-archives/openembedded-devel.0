Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8040.1793701461145580525
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Nov 2026 02:24:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=XpEjFycj;
 spf=pass (domain: konsulko.com, ip: 209.85.128.51, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a5720b0a57so3108415e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 02:24:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793701459; x=1794306259; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9T8U9VnhzozeuYHfsMyQm3FjJe2IJ45VHGh7x809Yd8=;
        b=XpEjFycjL/smhZyafqOw11aH0vPz+uDYUvsvwilmAi1LKs7EdNEKxjq4tVio/YEWBk
         OJuNKbiQmhJC2DIsB5Y9ti6IwCaObKWwr0IhuMu9859gD+XDyi2Csc0EDNBlApGI4tXL
         tssgtxWGfpn+Xe+EJID4h8Y/U0K76wO5wfUoQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793701459; x=1794306259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9T8U9VnhzozeuYHfsMyQm3FjJe2IJ45VHGh7x809Yd8=;
        b=nFzRliDyvzvr82Z6r/mjpIETfRtH1vXOr87w9aC7Z864zbH1/6TFodR2Hh7a6RZlYD
         vMCIZSkD5n7Sd7ol0OeXqXu0WzZbjnh1h0h0e0D0clVAbv02k/vDEVdmA6wmRZp0H+fq
         kK/G/0bokQTrOgFmZpwFB1ZUt+MpwCIFmwwCs4ioNd2YeJKtZUXMJbJjjGgFgF65kUsA
         UzgGZF8tRP4LOwcU+zFu0IJnp+DXDgk3FrOxqFXiSo09nC178nuysLFq/TE8VFsAtEYz
         i8Ef5B7MRYMEI4jzbmE/WiS6SDBg1lE9uGjjsl3FD9olQiRwX6AzZVc6f8KEboILVAMz
         3qpg==
X-Gm-Message-State: APuU4Z8E+YAeHI4aMAH0ZiQNWvwVNZ12pu9TAWVr29XeZFkz9Q2fonGO
	qY9rquKjNK62EVXW1+7dnYB2eIPZXqpVJlf2h6DlS74XSf5oN3rXdxSptmhkrZJhmB3fkoSvWSK
	vqrkt
X-Gm-Gg: AYBFou2gdw98rYgqlndJOlu8Cs78O+KeAluELtb/dB+Pw32DAtBgrmLaDigK4tcD4W+
	jgH79Dwdw5AZ8/O1x+AoJZRKuYVh1lwyEbYXk5lAc9VX1tfxH8ma0QV1I7m4+9ONczTm8vU2EzJ
	wSTxo0Ev5v0UTE8+0bR9Elc+NzaYJFmq+PesxK32UdfQ8DF1la0qtmmbKm4QIDa81Rzh+0eCae2
	8y96ww77lXq3mdPfnLGCe3sXpOvZOfmjR85Ldy3juQzvLfLWzwyhJqCIK7ltaKdppOswMkJqL7D
	/p8G/IZltGno9zPrk/2ypydqSSlIek+AD2iKn8eRURUcBQRZRV5oIS10toeGuNDOQ8vsP0xwlfS
	7vDb2VkQORqUXV9eWnc53EKUwDJdTYhRe/AqbbzATXGC+wAT1PIp6bXWPuG0GSI8nG/VMWcMDHH
	fdf+ntcwZE5oRI8/fExLshZxg8XbLAOQzclsr1KR7yZ2sHVWdapkGBWl+x05TW8jaLiYDZRfYxk
	bDAi4K3gOAc1+vWLi4nB7L+v/dg2N8hvdpezrhIKG+hvTaVXMt2iywueahx6nO5vOswmhD/TBhV
	VGQfpcjm5Y1prhQRm9n1LW/cccd2bCLzzy57H2fc1x/QDSHUJ/HfQUq7Ro2pevzYrGfYE7cJ7rr
	it9xv9IZGqCD6T/ai32IvhmnQCLTsC0Sei79ZbcjCCuCPDQLaZ3K4hR0=
X-Received: by 2002:a05:600c:1387:b0:4a1:88df:8a2a with SMTP id 5b1f17b1804b1-4ac1793e81cmr304925725e9.13.1793701459155;
        Tue, 03 Nov 2026 02:24:19 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a9fafe08sm73017225e9.3.2026.11.03.02.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 02:24:17 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 13/22] python3-oauthlib: Upgrade 4.0.0 -> 4.0.1
Date: Tue,  3 Nov 2026 12:23:41 +0200
Message-ID: <20261103102350.1952237-13-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261103102350.1952237-1-leon.anavi@konsulko.com>
References: <20261103102350.1952237-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 10:24:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131776
Content-Type: text/plain; charset="utf-8"

Upgrade to release 4.0.1:

- CVE-2026-49272 / GHSA-3jp2-3mrg-2vxc: The device code flow token
  endpoint did not validate the device_code parameter. A request
  with a known client_id and a bogus device_code could obtain a
  bearer token. DeviceCodeGrant.validate_token_request now calls
  DeviceCodeGrant.validate_device_code(), which rejects missing or
  unknown device codes (invalid_request / invalid_grant) and
  delegates the code's authorization status to the new
  RequestValidator.validate_device_code() hook, per RFC 8628
  Section 3.5.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-oauthlib_4.0.0.bb => python3-oauthlib_4.0.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-oauthlib_4.0.0.bb => python3-oauthlib_4.0.1.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-oauthlib_4.0.0.bb b/meta-python/recipes-devtools/python/python3-oauthlib_4.0.1.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-oauthlib_4.0.0.bb
rename to meta-python/recipes-devtools/python/python3-oauthlib_4.0.1.bb
index 8c6252595b..b3a7281aa6 100644
--- a/meta-python/recipes-devtools/python/python3-oauthlib_4.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-oauthlib_4.0.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/idan/oauthlib"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2699a9fb0d71d5eafd75d8d7c302f7df"
 
-SRC_URI[sha256sum] = "efb274799819440f95b4ab3b818869f1ce9ae26c5beacba0201d1a1b76b54f86"
+SRC_URI[sha256sum] = "3d73febdb6faa00f277c81fb04be7b7586fb96fc3b7f0b9c772dada69a25ede7"
 
 CVE_PRODUCT = "oauthlib"
 
-- 
2.47.3

