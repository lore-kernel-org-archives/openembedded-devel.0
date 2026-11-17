Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12983.1794901988098917763
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 23:53:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=CxgrUjLr;
 spf=pass (domain: konsulko.com, ip: 209.85.128.43, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so18300485e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 23:53:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794901986; x=1795506786; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yUZVZtVDpBtxGYL7lyuh5/JXB3ncVp+ae5UWqrB3sY0=;
        b=CxgrUjLr9e2WQtH0tY4qCjf1touGJy6zgm7AVZGdPFtRQ1ip8aVgJn48fyO3+2SmDh
         JTlcCHIaspX2z7D8JqxEKbMQ+yI5+acXhexkvtKjRsdfKyC1qjl03N9cDWg0jIME7geF
         mSGO+pGnz/j0HwWy0ZFsjfNPMDULQpTRTRuOg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794901986; x=1795506786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yUZVZtVDpBtxGYL7lyuh5/JXB3ncVp+ae5UWqrB3sY0=;
        b=W5OyklsPkbBq5EbnZrWuwEmmgHQ+QQ4Mwo1iaBtKc8gq/fD2Y43eebZ2Jj10fA8e/n
         HZK6zgZFcFqYp4FR1CbLZeveNaoYEKn8HMVPRRNs3M7JG8IxpB9G7e8VvQLqmiSyUh8O
         ASku6015qXlGuGs90AUrfdcuDD4xb3tjOWeOBrYmauwyJE/xfdki+dLICte5zxOVy1kY
         DbBMbqu/hOcSI9Ti7H9tEUZLWQ1P/OTYa2KoDUgYhk/RKZQjmEv8InyeeW3v9QY+MhUt
         wg6AM8uAqYCYG9lX7pfanrstNMjmvppNiIgYXssBUI3kcRYigtI7NZl1DemdORDxZZSL
         ie2A==
X-Gm-Message-State: APuU4Z9cFIa+yeSYM7UlotrgVcpY81onSLVJi3hTLFWUoN3208OkW+5o
	zyo7MySaK/J9kQcSBEWk2BAR34Lk1w36dJJM6cT64x5nuP4DQfyN6glpJw98OFuhuLKS8baHixM
	+FCqg
X-Gm-Gg: AYBFou3Bcp4onFVM8myRijdtUFRi5yFxuVo5tVGkBXuD5QA3iojOEdqyl/9jIO9iypM
	rTGcjw5NHX1fvN62tffwM42/JemV9I7CSUdt23YMLm9GBdmf6TdGdtpw88cmmy6GFS2Z9T6K1cf
	H619KtSLoQLvlSdpxbnZ6Bfi9mvPOk6sXKhqPVp/5b2EZ7p/rIwiEvrVeSJssnVlHhYEg0Mu5CH
	4n3kuLXyO00OSY2fS1UE5DTw3WSSaGvUMuZw4xrjhJwGm3KhYkSmLYxVCMGyWpH90uRBRPonIdk
	NwkSP8z9NoobUaMJkM/2/PnIrwosyhJrpiHod0c5ABiEUXYNv0IwNbwiYh5V22f05dkmghu2K1p
	jtPWD1CYqbtkKCYRE0Ta+r4Ojx6BZqCuzmscjRugHGpOgKK1GVbPJd6e5uFBYVVD7SboPihVN/T
	/7UpNIvf5ZmeHRHf2ogXQeTxhHiaHJyslR5gGZYe20mmgaZKflqR4ziKQxg939tyf2mI+g58Fxv
	PCrXHcWMElaBm3J25nhRWQ9mUhZtGnaggdpIeZjy2vXqSXljeogs21jLbL9U9ToQVfRS6rG9YDY
	9Q/tcjAGGNj2++piz9GG/k8e546fqdw15QGqd3Wywq1MrGSLVtsT0EoCc1y/f2ySyY3k6dtX11j
	tvBP6fbRYGQuv9gHte+IRzr+rA8xeujg1vEB0DsvjQ4Fwj1XfYm5oQw==
X-Received: by 2002:a05:600c:3496:b0:4bb:6de4:2f7c with SMTP id 5b1f17b1804b1-4bb6de43047mr130489935e9.20.1794901986485;
        Mon, 16 Nov 2026 23:53:06 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783c2650sm54072995e9.14.2026.11.16.23.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 23:53:05 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-regex: Upgrade 2026.11.9 -> 2026.11.15
Date: Tue, 17 Nov 2026 09:52:59 +0200
Message-ID: <20261117075259.3922364-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261117075259.3922364-1-leon.anavi@konsulko.com>
References: <20261117075259.3922364-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 17 Nov 2026 07:53:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132575
Content-Type: text/plain; charset="utf-8"

Upgrade to release 2026.11.15:

- Fix out-of-bounds read in the partial-match string search
- \X splits Indic conjuncts since 2026.11.7 (GB9c never applies)

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-regex_2026.11.9.bb => python3-regex_2026.11.15.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-regex_2026.11.9.bb => python3-regex_2026.11.15.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-regex_2026.11.9.bb b/meta-python/recipes-devtools/python/python3-regex_2026.11.15.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-regex_2026.11.9.bb
rename to meta-python/recipes-devtools/python/python3-regex_2026.11.15.bb
index e6a2e97ce1..7543845702 100644
--- a/meta-python/recipes-devtools/python/python3-regex_2026.11.9.bb
+++ b/meta-python/recipes-devtools/python/python3-regex_2026.11.15.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7b5751ddd6b643203c31ff873051d069"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "316a70fbd70e999c9664681cb0eb5b4982b2cc0f623c7c86a8a112e1bd4c6277"
+SRC_URI[sha256sum] = "d6ec7e29e62ebf93ab2a593d1137022b6025497d8610e5cb666d52f9ee5bb0ce"
 
 RDEPENDS:${PN} += " \
 	python3-stringold \
-- 
2.47.3

