Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8899.1792580524759797707
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 04:02:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=EhjTfvfu;
 spf=pass (domain: konsulko.com, ip: 209.85.221.44, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48c45111bebso386788f8f.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 04:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792580523; x=1793185323; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HIJEdrvORFVacUDzFIb2EqbRomgSoJNVzzL6yttO7Ww=;
        b=EhjTfvfuDBXFfXlX/AS2QiGmFtqISakrabtGhKRN/JFa/nQ7NqfyRsehCQjLDkITNG
         chfiY/cn1kw+qSfFBViMkAGSyZUN2Y5GmIeih9FwLu77Fcj2lbXYGOYDWu7lHcYy16S/
         NpdtBHr7Dy8AYuV1WzfvGOV9Mz7LQc1ZUzKqI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792580523; x=1793185323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HIJEdrvORFVacUDzFIb2EqbRomgSoJNVzzL6yttO7Ww=;
        b=PvkIMeqJTc3bAnTwQbLCw0Tf1kpOwl9bRLrnrMhVmCBrFDaa6l9F/Bux7Gn5OoSELy
         sRji79yXGsi8XF1Xi6e/xctBPQT29TquIIzJCezraL+xs68GbpIsbzAEAbb6RYAQLbKR
         HW6Mh5h1dUCNBKTd1j4/FuZh73RlIDGWMWGtoneCYenQF9OUGkZgzL5iizhutHYfgLc3
         1WGJslzobu7v5aV7MoJHFHKMpicoUEUsgtgEpAZyaKfzAOLg30kRu0wvFHzbtu12fN1k
         fGTwF1JGHMaY/xwcGi1ncLTPYAeo+8HgbCVX2B/YeEfSHkL7bJAPOYTacvB4kXlh9P44
         YfcQ==
X-Gm-Message-State: AFq9FYII5INBa9ggmlIAXeas+6SQkzin8sH/60HZM7XBxocIDkJMJBcZ
	W/4XXa1Pf1WAqHs+oSbAUJDTa+ehKHWP75OQig5QMPtU8nICbni9Yj8twL2zvjIoorLmWZ0/jy7
	/X02G
X-Gm-Gg: AYBFou3u6KbFDKceyNUdCRj5mixote5jqAnh2rKvAGy0mpQKbtpwBzBWpYvKDHawneP
	u1MEUTWnm4BYoyjJGWt3Moj+Vh2hlHr0x9q+Be04IAo1DTY55FgpMNMWZFCH4e4stFiKBpgHqQe
	g+PVSi2gONtNAHYz2kJnmGY21SVdJHkoxMeKNQZCqcCTJgoEktMMPpfpNsSECBVqt2RFdiQyMM7
	YfA3gDKBha2r06CHdwAbMpOCiwwg2D7GbPkT4hXQBt1TIvrgKhrZZLCC6D0GBr//9lH0JEujhlZ
	QesNvfZWw2osZjXaEIrIQICAd7RX1OLfuC4JGF2dVGF0Xs1RyxuD1Oaqz7f55wRi8NpnlWFdjR5
	MxL/mNpxm3Y3AVVcW6DQrFAr4gyClTUSujns0XyU0eLiASiwiQx4zNBD2ONjVOVtfzjNyornEM9
	J1Ox1NfL5ZpiAUN+EWMnyMcX4XoBREP/XJMJx1xap0LhUDna0v+Dkm+XyGDnnyyTTUVRMBedfqE
	WCjseDzaj71odSLPYKB9O2+G0NXSPKi7sgbn0rCj2bHYQiplsrsrSxp8QBap5UlrYC+3y1781Ni
	c9QVBv8I5BHCk+Xl1XtUcIlpnP6eGS9gAWAyCz5yCGHi/sUiuG9KAzc1asiZPrdyzOtkXPGzG4z
	CEgHq
X-Received: by 2002:a05:6000:604:b0:48e:412:3829 with SMTP id ffacd0b85a97d-48e264a2de6mr3490297f8f.15.1792580521429;
        Wed, 21 Oct 2026 04:02:01 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2583e25asm4972423f8f.46.2026.10.21.04.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 04:02:00 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 33/36] python3-paramiko: Upgrade 5.0.0 -> 5.1.0
Date: Wed, 21 Oct 2026 14:00:57 +0300
Message-ID: <20261021110103.1943456-33-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261021110103.1943456-1-leon.anavi@konsulko.com>
References: <20261021110103.1943456-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 11:02:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131293
Content-Type: text/plain; charset="utf-8"

Upgrade to release 5.1.0:

- [Feature]: Added support for the mlkem768x25519-sha256 post-quantum
  hybrid key exchange method described in draft-ietf-sshm-mlkem-hybrid-kex.
  It pairs ML-KEM-768 (FIPS 203) with X25519 and is interoperable with
  OpenSSH 10.0+. The new method is enabled automatically when the
  installed cryptography library exposes ML-KEM (which requires
  OpenSSL 3.5+, AWS-LC, or BoringSSL); it is preferred over the
  existing classical methods when available.
  See paramiko.kex_mlkem.KexMLKEM768X25519.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-paramiko_5.0.0.bb => python3-paramiko_5.1.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-paramiko_5.0.0.bb => python3-paramiko_5.1.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-paramiko_5.0.0.bb b/meta-python/recipes-devtools/python/python3-paramiko_5.1.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-paramiko_5.0.0.bb
rename to meta-python/recipes-devtools/python/python3-paramiko_5.1.0.bb
index 7936d8e9a6..96cbb70210 100644
--- a/meta-python/recipes-devtools/python/python3-paramiko_5.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-paramiko_5.1.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/paramiko/paramiko/"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fd0120fc2e9f841c73ac707a30389af5"
 
-SRC_URI[sha256sum] = "36763b5b95c2a0dcfdf1abc48e48156ee425b21efe2f0e787c2dd5a95c0e5e79"
+SRC_URI[sha256sum] = "239b5f9b2a53006cd54f83cf8495ee742083708ead947882c8dd2786de79f39b"
 
 
 inherit pypi python_setuptools_build_meta
-- 
2.47.3

