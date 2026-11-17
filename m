Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.708.1794955430055318010
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Nov 2026 14:43:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=MyioYb4E;
 spf=pass (domain: konsulko.com, ip: 209.85.128.49, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so3929955e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Nov 2026 14:43:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794955428; x=1795560228; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bMHN7i3/16ANPJuENE2rmDZ35XYY5No5YgZxhBDTdRY=;
        b=MyioYb4E+Xv9mjBoiwIvkYQNSmzni6cpL6q8kqzL3k2vuakPRe0hTiJRp/OTE7dveh
         34o+xJt1nCi9+/P3zMIAllUXBwud9nPG9JUnkfBp4boPwYLk5aAz9/slH6AqcQcm1Byk
         J230ab1S4TSwQKhMlIlngBKTpsrd3musALN4M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794955428; x=1795560228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bMHN7i3/16ANPJuENE2rmDZ35XYY5No5YgZxhBDTdRY=;
        b=qexr9XDqOfy+Zpduog9u5BvsgqNTnbXwcTXN0Fg066O5urM9rSmJxngzqjE3lg3oq8
         GTAA3UVNjtaWvdTgxKGam+Op4O6SQDVs2j3CVrpcMAruY4R8dlfIAJ/Quzr9NlJ1YXWR
         uMY3U/FMLoK+ufCeQMWbcx5/A/keKypBJvcWPdHIjORyWP2eEfQX8ldEXASTsQlhrNqk
         qWLwDIp/IYZQLgaRmRcvefY5RQD8Q/lfBwB/avtpMjmgDCBg64y73L+QXIrb/YZcyqMX
         fF6jBQ6q3OVZkHMCVxtUI1zULqy/VsF8W/AeHG2P7ZqLOEVfLFyPzL43dJIGnH9uLhum
         ALZw==
X-Gm-Message-State: APuU4Z+x7Z7Xy0sqGf7REviqbxlja5iXPnMoOuqQIAB+Wyto67dVI7Kn
	mqEGLjdJWIo4btaSGy01k9Z46a0zvDg9SpVXVtO8u/PkiEHMf63XtLjL7/CouvkZ+kzpdPfcDA6
	5aeFa
X-Gm-Gg: AYBFou255vavNaIx4RHORuqVmJq1GF8dyPaxsKAmzRSHm145WmyYXIBuZe51TzaUzp5
	6zYPrNQosdwV2utbaI2/s8/jk2mi88kLpmrrx+QPWZx4OokWy4d5XrWr9LPyD03H0k8OHs+SHRV
	x5KNYxAIOabWZbELDbGcjrKKqS6Jn+ziaA3OkTuC8URVNDt3ILaDO+HBaiiPVTMme+P//3dExRh
	sFSB+1M89YIQ7pdROQLI5vWZ4wvkWAt0qbAK5canyEHV/KdDdlgvXbdKCBv9TPtOYMUPT3Mzh2n
	c+k+qzfZZRVDL5u0AXkHNYhTLfyZVRiBbV0nhOgaregxTU63tOgHphqkVuDKGSqFtFTFPXMEa5n
	sfFyAoev1y/w6Vr85HrlwcK4Bdmas8WLJuPA6okQUW2jWn/Hz3epYeuwcB4PG+Dn4QGF/t+vyYF
	oQvkZkz687b8updejHvduWy4XDa1mTUB3A/lyapqZ94s5Gd7FMHKMgNrk50WGVHonlv4xAWySeO
	0G/S4cmISeVDntuokAGcihUIdnUSQt7X2ZIV7gzPuSQn2u+YXUmc4GK06skX305JOtnnUy2lws8
	/gu06L5Q/QYXnKrBWGZ54rGWtSKjBoBLep3RZuNA/RFc+OxCOdlGlpAmQBwJ+PGnaM66k+iojFx
	NROjTvCNwX8q43e1FrPXvS31yQKIL2ge6DP6hFcbALCMdj5RL5C78zQ==
X-Received: by 2002:a05:600c:190e:b0:4bb:6ac0:6dc1 with SMTP id 5b1f17b1804b1-4bb7d5d4387mr13719925e9.2.1794955428360;
        Tue, 17 Nov 2026 14:43:48 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d2c3c93sm25012915e9.13.2026.11.17.14.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 14:43:47 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCH 10/11] xmag: Upgrade 1.0.8 -> 1.0.9
Date: Wed, 18 Nov 2026 00:43:36 +0200
Message-ID: <20261117224337.4181772-10-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261117224337.4181772-1-leon.anavi@konsulko.com>
References: <20261117224337.4181772-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 17 Nov 2026 22:43:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132600
Content-Type: text/plain; charset="utf-8"

Upgrade to release 1.0.9:

- Improve man page formatting
- man page: fix warnings from mandoc -T lint and
  groff -rCHECKSTYLE=10
- Strip trailing whitespace from source files
- meson: Add option to build with meson

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../recipes-graphics/xorg-app/{xmag_1.0.8.bb => xmag_1.0.9.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/xorg-app/{xmag_1.0.8.bb => xmag_1.0.9.bb} (78%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xmag_1.0.8.bb b/meta-oe/recipes-graphics/xorg-app/xmag_1.0.9.bb
similarity index 78%
rename from meta-oe/recipes-graphics/xorg-app/xmag_1.0.8.bb
rename to meta-oe/recipes-graphics/xorg-app/xmag_1.0.9.bb
index 1589f9ae6e..4c73635e68 100644
--- a/meta-oe/recipes-graphics/xorg-app/xmag_1.0.8.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xmag_1.0.9.bb
@@ -8,4 +8,4 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3413fe6832380b44b69b172d2d1b2387"
 DEPENDS += " libxaw libxt"
 
 SRC_URI_EXT = "xz"
-SRC_URI[sha256sum] = "326d3c583d795bb53ac609d144e7f7fb1499baba7eaec14b8e6cd232ea069532"
+SRC_URI[sha256sum] = "87d82c0c08c04ef1a9988705a3506295650777b26deae97ada96a1720982c024"
-- 
2.47.3

