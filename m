Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17899.1795793635112448184
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Nov 2026 07:33:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=CVV7twbj;
 spf=pass (domain: konsulko.com, ip: 209.85.221.48, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48e3b22e971so4354460f8f.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 07:33:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1795793633; x=1796398433; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rnb2lr+4YnLZwVBlmGqIfmTSbjYFu8Njfiod1rFfqeo=;
        b=CVV7twbj/QfWmA52to7mLHh/tO2Yj2gz9mCom+6+n7FpFAbrzY+2aIJVpfqufKXa60
         75BWnVq69ogljc7W3dKVSy1R4pwC/Fc+S8HiVFjSu1TbWD0ofE1s5jne76m9HZsB31Gm
         IGPXBZPzI+SYwujSRq5EF0nU9zDf647CMyV3Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795793633; x=1796398433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rnb2lr+4YnLZwVBlmGqIfmTSbjYFu8Njfiod1rFfqeo=;
        b=Qyn2rgmqyjvqagz5sO5Dc+sauJKzh4QRghCHjuNu3jNoQ7Fu4+kUp28Demswso5djM
         ipQq4ZM8P6Q0Mciwtzenf0QCj+sHodagWG5OMYaWz29Tq7g2C4Vlx0ZfayfolYUiTaqt
         uaeErHcjnmj+HkbF69yYSSptbV6dWSv3yVNZLQJ5kkRLRxZXfh+VFmEA5U5jjHy6hjjc
         xQYk/VjuzvQ3k1qlRKFoQmAyVLZF7zIE9KWWdSmxYasTFbQ0iKt3o0L3AfRMKIdw3et1
         RVeWfGvPcyOJtE9EoVbOnQ6i2opNTeyMv5FC3WWCEnB8INEAe2gLVNSC7TucORNDXEFg
         Fpyg==
X-Gm-Message-State: APuU4Z+YBe7xfP86u+RyoxIIuWnauaMRBvuja8FirwnNJofyfh36ukNv
	VQnWmjXzD6XlVP/Dc68wQccD5Uc4WXwJs7ud9WmBTxfMsmOXz0QlNYLiiVTyNX2hI2TzJ8s1Ilv
	XMrEP
X-Gm-Gg: AZFdTZcvZ0yj4MC496eyYdfUe4WQpaoxxv2rW4rl6u63Uv0v/vpz1zoiY322VLZAjbC
	QZZmWJYLlPNCU97uWReN6QPPkYMzsN8tA00cwDMLYkvZE7YEbdKr6iWy4g6vS1Xpzl2wtHWpO52
	0chMMwgD1g1JP6Gh2hWsPTtFY/Z8D3J10anhsf3hhURn+2VhGuWbjhrmFcqqFiKjJq9z9asdtG4
	kpTrzBCkHcT0cMRheYSLe+2ZvOK1vN2xwVAW5p5kG15k+vxEBi6Vdz4r8SujabQSb4FArVdiQlg
	/KigaSBl7aRrU6ffrFMuDiU4I08xknNBU3TYgPXK0//BPXgOTwEx55p++BzLdC3dZ7cMQPdddF4
	vtMGHMniOqgQSU9ztK+exjKUhpOJ8oX7h97/ooUIa1z3ej1LziTDrXHAjMFmmsCpCb7yzeb78Nj
	mgvgn4IKKQBr3d1cGrx5x2gB9PbxVf6vSS0CtffAu6e3yIRAflrl1JVyFLh89YGKWRh2c3Rdv0n
	gEPPCOEZfD4HWPPsMBzneTEefb9XwOlsXm6uoQ6+WAVvhsa4C95KQWc3BgU24NEF039uEOWf9gf
	1jtSy2iJ/VppvkaaDZio8N6yBW6W0bj17TylEIkE/B1OomQiiOnUJqqXMlhV8KSoEZVf8Bk23KF
	f/kQi0JkCDLCs4yAMG5OiOPK4Ri85sUkMJxJuCLASy9URiTjGJYH83g==
X-Received: by 2002:a05:6000:4b1e:b0:495:5c83:51b9 with SMTP id ffacd0b85a97d-4abb4b84368mr47403760f8f.50.1795793633176;
        Fri, 27 Nov 2026 07:33:53 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b3415763f7sm24174207f8f.9.2026.11.27.07.33.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 07:33:52 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/6] python3-pypdf: Upgrade 7.1.1 -> 7.2.0
Date: Fri, 27 Nov 2026 17:33:45 +0200
Message-ID: <20261127153348.2880928-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127153348.2880928-1-leon.anavi@konsulko.com>
References: <20261127153348.2880928-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 15:33:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133378
Content-Type: text/plain; charset="utf-8"

Upgrade to release 7.2.0:

Security (SEC):

- Limit memory for embedded files dictionary API
- Limit size of indexed color space lookup tables
- Avoid cmap data splitting before size validation

Deprecations (DEP):

- Deprecate encryption_key of ContentStream.write_to_stream
- Deprecate parse_filename_page_ranges

Performance Improvements (PI):

- Check inline image names against a set when listing page images
- Count duplicate form field names and radio states without
  rescanning
- Avoid copying the visited set for each nested outline item
- Fix cache evaluation for XMP data retrieval
- Stop copying the page text for every text fragment
- Look up PageObject.page_number in constant time
- Use a set for the AcroForm field check in merge()

Bug Fixes (BUG):

- Preserve merged content streams during encryption
- Escape the font name in generated text field appearances
- Keep the generation number of objects in incremental updates
- Keep the writer's state when used as a context manager
- Remove every part of a combined ObjectDeletionFlag
- Remove objects which only unreferenced objects use

Robustness (ROB):

- Fall back for unsupported RC4 key lengths

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-pypdf_7.1.1.bb => python3-pypdf_7.2.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pypdf_7.1.1.bb => python3-pypdf_7.2.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-pypdf_7.1.1.bb b/meta-python/recipes-devtools/python/python3-pypdf_7.2.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-pypdf_7.1.1.bb
rename to meta-python/recipes-devtools/python/python3-pypdf_7.2.0.bb
index 95be8b6eeb..9033491db7 100644
--- a/meta-python/recipes-devtools/python/python3-pypdf_7.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pypdf_7.2.0.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/py-pdf/pypdf"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=15692a75ec5daafc92ff9e5505a17cc5"
 
-SRC_URI[sha256sum] = "2eff4e2fc5fb22a6d6711e6f1166cdc9ab5765d90cd0d77dfea3f4aa91a27b1d"
+SRC_URI[sha256sum] = "b2c637b6f0be3def1f762fd8be20118736bafdffc75badab80db003d7a9ed110"
 
 inherit pypi python_flit_core
 
-- 
2.47.3

