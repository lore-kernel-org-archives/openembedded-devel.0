Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web10.3511.1604102837085200203
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Oct 2020 17:07:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foundries.io header.s=google header.b=OLy2QUCk;
 spf=pass (domain: foundries.io, ip: 209.85.222.171, mailfrom: ricardo@foundries.io)
Received: by mail-qk1-f171.google.com with SMTP id k9so6576650qki.6
        for <openembedded-devel@lists.openembedded.org>; Fri, 30 Oct 2020 17:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Trx0cmhP+49CfLUCJJyt13pnBD9lYAupwtzwBvWnnDc=;
        b=OLy2QUCk/oEOE7DlY5Y4hDqix3ldeAuq58+uviO4Kfpi9zDDRF0FEVFf+qIHIbyWSf
         SFtRoE6OFwuurgFeu+2NxlFSxNiQ0/sRZVP2wGXojQC/mqHc24W5YaxDyIgIDThytSTJ
         vVFQDvBahIV26nD60LtklE0ExG2MaYy8Ebr6eKnjw7yhWTk3+6V22LMn1AZ0L7cY8ua8
         z5veCG/o38Xcn9Ih6aIczlQCa5+fDUiuLt/x7KYDR2/0tBaku3KWlTPFCE5i8Ab4qWFc
         bsTDXZtxASCgLfwszoBi9QtXygvAvMtvHw/rLF4bUYjC8xEij1197Md6SaSZF6o7O4au
         xz2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Trx0cmhP+49CfLUCJJyt13pnBD9lYAupwtzwBvWnnDc=;
        b=UZnF1xpzYRtwV81iPxCfcKvN9BcPKeFYmsaPu6ZiOSYB9+5+8tBanV8fqgftW8lZdl
         3iMnDLAKkZrHT34EgKGQ5JmDcXQ1R0xOS+Wa8Fx7fm59wS+vS2C2PYqZAsyXwmcMk/Ih
         KPg93YCK7oin1iefiK6XchRxYIByDHQPVZZYDtLI0jxJX0AV1LtB58Ljf3jRANR4EGJt
         80tqcm8uwOMT4clgb8EGR8H39okTouCLk8KZ07HKPhZDyTgc23CsqXMSJceo03mGIHxh
         cUeG5EcAxeugSwFz3FCLP2Me5cP7cxtd2m4HxxoAS/qc4t6qt1E6fJWGvZcrsm+CxSGn
         eKPg==
X-Gm-Message-State: AOAM531x9j2saEXuCHkJaJetE5mqOlBO4WyIRlJBV6YqUWyXVBRG6xZU
	76KGySd9RcktFSC1+In4j06MqIPKdxAU
X-Google-Smtp-Source: ABdhPJwW4d/nrOBXUlVJ4b0Qkn6C6cJ/ZpN6UmaLGb1U9gyj1o/6egS+pObw53cOzcIC418qWNugNg==
X-Received: by 2002:a05:620a:621:: with SMTP id 1mr4913732qkv.471.1604102835964;
        Fri, 30 Oct 2020 17:07:15 -0700 (PDT)
Return-Path: <ricardo@foundries.io>
Received: from localhost.localdomain ([2804:7f5:f480:bcdd:ddb5:2334:2f12:9430])
        by smtp.gmail.com with ESMTPSA id p77sm3680531qke.39.2020.10.30.17.07.14
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2020 17:07:15 -0700 (PDT)
From: "Ricardo Salveti" <ricardo@foundries.io>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/2] wireguard-tools: upgrade 1.0.20200513 -> 1.0.20200827
Date: Fri, 30 Oct 2020 21:07:11 -0300
Message-Id: <20201031000711.6805-2-ricardo@foundries.io>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201031000711.6805-1-ricardo@foundries.io>
References: <20201031000711.6805-1-ricardo@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changelog:
- 7a321ce version: bump
- 91fbeb4 Revert "wg-quick: wait on process substitutions"
- 9a0d65e wg-quick: android: use iproute2 to bring up interface instead of ndc
- fbca033 version: bump
- 26683f6 wg-quick: wait on process substitutions
- 13fac76 ctype: use non-locale-specific ctype.h
- cf2bf09 pubkey: isblank is a subset of isspace
- b4a8a18 man: wg-quick: use syncconf instead of addconf for strip example
- a66219f systemd: add reload target to systemd unit
- eb4665e wincompat: fold random into genkey
- 197995d ipc: split into separate files per-platform

Signed-off-by: Ricardo Salveti <ricardo@foundries.io>
---
 ...rd-tools_1.0.20200513.bb => wireguard-tools_1.0.20200827.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-kernel/wireguard/{wireguard-tools_1.0.20200513.bb => wireguard-tools_1.0.20200827.bb} (92%)

diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20200513.bb b/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20200827.bb
similarity index 92%
rename from meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20200513.bb
rename to meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20200827.bb
index 3403fd943..c4214dee6 100644
--- a/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20200513.bb
+++ b/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20200827.bb
@@ -1,6 +1,6 @@
 require wireguard.inc
 
-SRCREV = "c45d422a93d57f6fdec429640ff7f96b396beed4"
+SRCREV = "7a321ce808ef9cec1f45cce92befcc9e170d3aa9"
 SRC_URI = "git://git.zx2c4.com/wireguard-tools"
 
 inherit bash-completion systemd pkgconfig
-- 
2.28.0

