Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23237.1794814550792069474
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Nov 2026 23:35:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=WQ7HIzts;
 spf=pass (domain: konsulko.com, ip: 209.85.221.50, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-491aaed7565so1358017f8f.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 23:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794814549; x=1795419349; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hn9jFzazs/F4GPxFkUwq/AQI8XvuK54yqYYgZHXCcLY=;
        b=WQ7HIztsMvnS+yBIPIC7jKT933mTRlTDvNuodgMM+r4Fl3CbHpk22oqjjibKjJlKkH
         GM76YV8qa/VOuXrGraJUTtbF9gJKG0sXDK2s7h3mNcKRoJXWJvDWfyDF+qISZTut5X+9
         x8nc+nbLEtrwsamLd8ncR7CkTHip8Ux8bwiWY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794814549; x=1795419349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hn9jFzazs/F4GPxFkUwq/AQI8XvuK54yqYYgZHXCcLY=;
        b=Spt6jVVeCeTykib91M7CqGnl9Ic6Y2/YxkruvnCwM5aPQQ2J11Ffmr8T/77y0G3YEm
         58hYr5NOjDNoVWC+KCDdnYK45mrUa/H7alsnotipIbP3sTpm0lCtDpXol2+m8tfPPe6/
         jBNxnBGlIWFUz3qsQtMEU8U2ob7HG+EDbtG6WFDwIixJVRDlj/h9POPqVN6Z7tVKGsWl
         91hS9ogIZKoUsgZxDdoSPbnp5GDSbdGQNfLpfSy/7Xzmte/P1bnH0e44EHlcf63Rle6X
         Zx6jPWcaci0RstscqY7qC6G6IUWzvNNxRlDA2uPXH/S0jN5gVDEVQrMeaYDFYa3Hkhs+
         V7EQ==
X-Gm-Message-State: APuU4Z8WXyTd4XD2FkFI54TjxlfsGtgwQJ0yGkDIZhNyzS6UCJRHn0SX
	KkycWrGuNI9MhiUXtopi6P89g/6CbRaA8zx+gannvGSpX36cklwE2Xj0HiFcbqkYcLqvLfsZOuh
	ReN0H
X-Gm-Gg: AYBFou3A2r4TndJvDwwSGHK/hcD7650gRlDdeWAuYxZgDSbp7FuWqnBxtmUrGqk2O7d
	uLsV4/WNQAMpSqteW3tmQvIlseqgYNFSbif3RWtHwl8Q5InarEfETV3K2gv0TR/2iJdZ9z4Riu1
	MDAhPicqVt/GKRtEJ4Ek7bYTCstmC7nxo0mhuMBv1tEB83wwDlXwiWavSfnVXMS5aGaP2joYhZv
	rIJLucM20Yc8YzpcFF+SkoIDeoqQDq5porXpfnpCFb3PPFUB3YqJWwFPCaZmHhuNEL9nDFcy3uA
	gYRm2OOQAVIlkW/hd9l2ZRhCPpQjET8pmEZDNhgSUtNjbEkHyJP3EyViDXkd0nLekfGbC21ewFG
	z60tpCuf+rbC6Dn6SoL9UQ6s9Xp5EtVqi7bmIEZ8BgikqWc4gOi9zhFBv8wQEUeO/GTWGXijtsr
	lXRgikfP7bEgIrrO0wqqL8CcqnSYDbc+0JAzrNEADEkajMFE1hvGArWIK9NFo1sP+NABjzYC8uG
	pJR634W5i3E1w55rlwlJ/5XBVz4QBEVWfzixvcqGDS4rsWG5zlpFqWSFCr19cULXoe3mEgr+8NO
	p3VD3PbB5BVFXzZ9emfKX8tKV5zl7aCPgbpzmgul17JohyjP+8xc5fuvOgmNI90nskh7/x/ZIUL
	mLNiRfhw+MrkU4wsszq1sWQLL4ZCXfTykH3lL1kiBGx0rccC9lhQA0Vbl2+/ls5yIW4MGyAtdG2
	U=
X-Received: by 2002:a05:600c:a00c:b0:4bb:6473:cde9 with SMTP id 5b1f17b1804b1-4bb6473cee5mr116576075e9.6.1794814549102;
        Sun, 15 Nov 2026 23:35:49 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ae501bsm289781975e9.10.2026.11.15.23.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:35:48 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 17/24] python3-simplejson: Upgrade 4.2.0 -> 4.3.0
Date: Mon, 16 Nov 2026 09:35:24 +0200
Message-ID: <20261116073532.880420-17-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261116073532.880420-1-leon.anavi@konsulko.com>
References: <20261116073532.880420-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 07:35:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132445
Content-Type: text/plain; charset="utf-8"

Upgrade to release 4.3.0:

What's Changed:

- Preserve serialization errors when context notes fail
- Fix encoder crashes when user code mutates containers, and
  C/Python mismatches
- Detect circular references through fresh iterable iterators
- Preserve explicitly supplied false-valued numeric parser
  callbacks
- Honor explicit item sort callbacks independently of truth value
- Read UTF-8 files correctly in simplejson.tool
- Name the value in the C encoder's out-of-range float error
- Build and test Windows arm64 wheels in CI
- Prep for v4.3.0 - Update CHANGES, version, and CI actions

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-simplejson_4.2.0.bb => python3-simplejson_4.3.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-simplejson_4.2.0.bb => python3-simplejson_4.3.0.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-simplejson_4.2.0.bb b/meta-python/recipes-devtools/python/python3-simplejson_4.3.0.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-simplejson_4.2.0.bb
rename to meta-python/recipes-devtools/python/python3-simplejson_4.3.0.bb
index 1f9ba284cd..8f950fad8c 100644
--- a/meta-python/recipes-devtools/python/python3-simplejson_4.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-simplejson_4.3.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://cheeseshop.python.org/pypi/simplejson"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c6338d7abd321c0b50a2a547e441c52e"
 
-SRC_URI[sha256sum] = "55b121b70a560f4610bd3a355ab2015aca4f39978f6a82353f24d2013fe85861"
+SRC_URI[sha256sum] = "ffe34ab51a0d37e6d1c661a5672df00d2d5e18804e38eac07abffb83fa5ec3d7"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.47.3

