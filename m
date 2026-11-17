Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13223.1794901987027567337
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 23:53:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=iur5myUV;
 spf=pass (domain: konsulko.com, ip: 209.85.128.45, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49d05d51553so24845185e9.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 23:53:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794901985; x=1795506785; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9ojCWk8b1nDxa6B3BO+cKAsGK2+/HXSqJQE4YZgF6PI=;
        b=iur5myUVZ64rW/msHOEZzMlTiZlgJjoTLgGUNMpSLa4Y3LWfjnQUzjA5NV2n261zFg
         L0cQeZu8+Rt0TSAh6HjybU2qYGu1dcK/8LgJwEBYC84jghMFY7nxdDgykQw5EIOSD+Sl
         EN9DQFx47huSEJTfgrBxNV14C1dxJCI6jm46Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794901985; x=1795506785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9ojCWk8b1nDxa6B3BO+cKAsGK2+/HXSqJQE4YZgF6PI=;
        b=AfZrFyL6Z1448VvdNDqHn4WBg9DBcbjaaTcGjHkWnq2L2hiVuDemvcwqlq679L5KcD
         iJCPOPVxh3O08XpCGR0Cd4T1FaIT4ZwpLDzaKwy82MZ3xMldUkiKof5bEi1xmeXcSM9G
         wYuefpY9Yhc2kMti9ucYxJwpvysPmek3z69R1vu69d/yhNmD50HRN4gnjTi+ZfPqS1G9
         2Iw3erD/Bn/TtgagJ0y/ODXCADW0BcddrZH9i2dZUAFze6nAYJqcdJAC5cCp46552mY6
         N+gkFixfl3fi+OgdHMFvqH5TZNgoPg4Z6EOpyoKRT2QbxjJilmn2fFzx3+1ykHpn+a2M
         XZXA==
X-Gm-Message-State: APuU4Z90DbwX2/b2ELu9vix/pE4fpHPQYT4Fo6IM8FpNzl63kwbaSP4E
	FymPZLYmZ52CsfxDTCWCdVHROD5UpbGSdQJH8HL6MMt/f9f2Q5cqKuIf5zuVpTICpMC2IeWJySc
	bG9xn
X-Gm-Gg: AYBFou1A6m6bUEaCfRUOZvEcgEYBTu6iMcD1A2cqHmvUkPPyPdgYuhm9trH91PfO9es
	IbV4H9rmYV1G8zzy+xHqbMZb3WmUj8Z+SSwW/xnnO0Kv7S2b+6qJsQBedw5ofjwqwTYenW9txGu
	dh/B15EXvT4lvc/GYOutLsd5vF92SFIcKmQji6ueoq5TWnqH1NMGvBNb+Zoy2gLVkn0Ks0qrEHO
	EJ9WRFzLdVIt+MD2FVE1gqzSl5r+qkfI0L/cgFXRim7188dXzXoMCGEM+Asb437HkLfji5nSfIK
	mVGQsYGxGG61ZQUxQXvJSP640AAZ324ILzx1T5yJ0Z16VCdM0FVyYi1L0L3ui80u/35UrpYAS2v
	vnwexXHSjoaAvX91+JBgtYeRFMxjuMIK+bdTOBIhAtk+Dyw4zSPd2N+9YfvaA2VU5FFc5ZUx53L
	lGWnO/QpeW05hIJAhcZLn7Hf0qpe2kp2tS1XJWG6Mlz7iA8FjBuLgSju6qcGQPHVdaH2D2T+92B
	zSCrOhpFYsmDKM1jXvgfDOFf2DCUWOED08pGqdOybEL7I+J0Y5mHBzHpEZegHVSWzXROh/48KWd
	NMCDtF3N2+LeDlInoLYDWWZs5FaVGLfBjJD20AgzBcyIVw4LIYYhg/o0GwTXU48KI8E4uV8H2Jc
	/hP6W7wM3Ne+8hKZJ/CE8JYNS0u0u+5SNfA3APihY3e0HjOrOih0zGEftRjmOOJU2UiueJMlWvZ
	A=
X-Received: by 2002:a05:600c:890d:b0:4bb:5c97:f4b1 with SMTP id 5b1f17b1804b1-4bb5c97f545mr186161505e9.24.1794901985342;
        Mon, 16 Nov 2026 23:53:05 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783c2650sm54072995e9.14.2026.11.16.23.53.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 23:53:04 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-python-multipart: Upgrade 0.0.33 -> 0.0.34
Date: Tue, 17 Nov 2026 09:52:58 +0200
Message-ID: <20261117075259.3922364-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261117075259.3922364-1-leon.anavi@konsulko.com>
References: <20261117075259.3922364-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 17 Nov 2026 07:53:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132574
Content-Type: text/plain; charset="utf-8"

Upgrade to release 0.0.34:

Faster form parsing:

This release reduces parser overhead for forms with many fields and
corrects multipart boundary and header handling. Parsers created
without callbacks also no longer share callback registrations.

- Faster query-string parsing. The parser reuses separator
  positions and starts the next field directly when its data is
  already available.
- Less overhead for multipart forms. Complete CRLF sequences are
  consumed without stepping through each intermediate parser state,
  and mark-helper functions are no longer created on each write.

More predictable multipart handling:

- Padded boundaries no longer merge adjacent parts. Spaces
  and tabs after delimiters between parts are recognized as
  transport padding. Malformed padding now raises
  MultipartParseError instead of being returned as part data.
  Padded opening boundaries remain unsupported.
- Non-ASCII parameter bytes are preserved.
  parse_options_header trims only spaces and tabs, rather than all
  Unicode whitespace. This avoids changing parameter values such as
  names ending in the UTF-8 bytes for a with a grave accent.
- Whitespace around part header values is ignored by FormParser
 . For example, Content-Transfer-Encoding: base64  is
  recognized and decoded despite the trailing space. Low-level
  MultipartParser callbacks still receive the raw header value
  bytes.

Isolated callbacks and clearer security scope:

- Callback registrations stay with their parser. Parsers
  constructed without callbacks now get separate dictionaries, so
  calling set_callback() on one no longer changes another parser's
  handlers.
- A documented threat model. The threat model defines trust
  boundaries, application responsibilities, and vulnerability
  scope. Bugs in deprecated Content-Transfer-Encoding decoding are
  handled as public bug reports rather than security reports.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...n-multipart_0.0.33.bb => python3-python-multipart_0.0.34.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-python-multipart_0.0.33.bb => python3-python-multipart_0.0.34.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-python-multipart_0.0.33.bb b/meta-python/recipes-devtools/python/python3-python-multipart_0.0.34.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-python-multipart_0.0.33.bb
rename to meta-python/recipes-devtools/python/python3-python-multipart_0.0.34.bb
index b196f40183..785f8105b9 100644
--- a/meta-python/recipes-devtools/python/python3-python-multipart_0.0.33.bb
+++ b/meta-python/recipes-devtools/python/python3-python-multipart_0.0.34.bb
@@ -2,7 +2,7 @@ SUMMARY = "A streaming multipart parser for Python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "b8112424a6abd162ec08d390565dd113ad699f2fe6fef3c987b8bbcbfe9e390d"
+SRC_URI[sha256sum] = "b998ae90ca6e1e363261ce2e0e230281b8af53867b757970abd69ee9edcd843a"
 
 inherit pypi python_hatchling ptest-python-pytest
 
-- 
2.47.3

