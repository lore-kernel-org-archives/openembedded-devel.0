Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7970.1793701456672320249
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Nov 2026 02:24:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=b2HTX7/W;
 spf=pass (domain: konsulko.com, ip: 209.85.128.46, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so24877295e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 02:24:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793701455; x=1794306255; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FOoaP1YYWJXVPlNBp91BMBIOPm97aE/xVEDgq7hApnM=;
        b=b2HTX7/Wb9Rhp6FedM2DAr8XTU7EDmrEXUtVFn2AmV9hFBg1G81Lhw2JaPsy+i9vCM
         RNwAtjxzxNHb3ym9fvxLNaJeVmmX0U3gclfSwIEf8woAPsvAZ512N/dwnKNtm2CdiCFj
         U10nyn6hDMC+liS9sO9OiTthsJThEU9uW2+Y8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793701455; x=1794306255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FOoaP1YYWJXVPlNBp91BMBIOPm97aE/xVEDgq7hApnM=;
        b=T19C9MTRKcf5hSA32aSz/Vq2UKLy/zUEXmcS/ycO5mM7oxQfuWqvgPwIdsZwteMfwh
         jlFS8orGIK1p48YZ1D9AMX6rjaNs9vTarExtDI9RS0lqG9CtG+KUVHDNshd3ctigvDQr
         HhdyQvhFqfpvfJFbOyunkuejRHfpgrjml28U7hf0PPV0Z0nb1AHWXvrFr4tTq8Q6tmIe
         BfTdQurbaszCt9yaNL1iqhzcS6z6S9L9xFJ/cOccX4rDNoc+Fz9gf1Q3mHPNyKaAKDK1
         uDygURdPcJ/f/b+ybadUluT86c31QVZhck5iIlEGoCw06RW+Ob4QJ8gqIwI2FpiofLp/
         KIfg==
X-Gm-Message-State: APuU4Z9HB/BtIMe/ClokgIlOSu9tVlzJjmQKEo2DF3FZAm98MashY/w1
	dE+ZACTIxmwAijUUBa1n2LtbkfnKyr+ywjVnBp6+YzlYjBwlEgDWtCGecuPsG2eOg7YfQzs8jpH
	o/Vx8
X-Gm-Gg: AYBFou2amSDH2oskouaRWzGHm07mcNEjlgjH/6KogiheXeJxKoW8eSnmxfW/dzu3OOo
	YWcnvB8aas/6kQY8wXn5o3XtvMWQW043wIW6O9IIGYrpgLn6jChqEApgROxIcX+8BXPUkiPSaRN
	L5eNbo+Tg52xuH8GWsKBlUBxrcKv85WrERFHZ+2RFJuyWkwKQEeIiY+afW+9FCb0QVGYuT1ToDy
	8dkIC5lNKNfdM21EXFrWn2me94a54kezvPrvoqZrMhp8fSbJvMHCNuOLvBy8PuJ17Shut7msQ0a
	j6tlGaLtu6Vc/hxLBLTLqMasn915iWVQDvf1gRCiRxx3bG8TYJDA7Jd/gqmU7gAirJznR/CT4oq
	DBwTaC1hX9lAoCKjlgPsIrXppWkLhGahJcVHE69r8767PyTzBz1zluKFwopJ/Xhf8tBZJriPNYi
	bVa77/V2aQuDxNsYHjDRGzKI2d+/WCg/DUjOjlOh5qYi5SDcnAWLxxpr7uN1S/M8SGoj+0a4GZ1
	WALuwLljiX2al5gqfbR1OgZthW26jEtLIdGvFhZotZ5sUAeqfN0zHxRrmZ5j/QSFFtsLNIFFSu3
	hq2fCHbRF5NsYITp4RYKUN+o87cIzSihErnDuDo5L4fFXP3HpaPWwvSryXA6InR/4CvuZIOt1GA
	KnJ7O2n2kVLHNqenNItk9MDgTOgoc9a6KhEhvI0hSRYtebDF46xg7pw==
X-Received: by 2002:a05:600c:a00d:b0:4a5:e6fd:65e5 with SMTP id 5b1f17b1804b1-4ac19705d57mr279416965e9.31.1793701455028;
        Tue, 03 Nov 2026 02:24:15 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a9fafe08sm73017225e9.3.2026.11.03.02.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 02:24:14 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 10/22] python3-ipython: Upgrade 9.17.1 -> 9.18.1
Date: Tue,  3 Nov 2026 12:23:38 +0200
Message-ID: <20261103102350.1952237-10-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261103102350.1952237-1-leon.anavi@konsulko.com>
References: <20261103102350.1952237-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 10:24:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131773
Content-Type: text/plain; charset="utf-8"

Upgrade to release 9.18.1:

- The main change in this release is that themes are now JSON data:
  you can install a theme by putting a file in your IPython
  directory, or from a package, without writing any code.
- The release also fixes a number of completion regressions, fixes
  WebP handling in ~IPython.display.Image, stops get_tail from
  wiping the history database when ipykernel asks for n=None, and
  adds ~IPython.core.formatters.DisplayFormatter.register_formatter.
- theme_table can no longer be mutated, and the individual theme
  objects are no longer importable from IPython.utils.PyColorize.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-ipython_9.17.1.bb => python3-ipython_9.18.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ipython_9.17.1.bb => python3-ipython_9.18.1.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-ipython_9.17.1.bb b/meta-python/recipes-devtools/python/python3-ipython_9.18.1.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-ipython_9.17.1.bb
rename to meta-python/recipes-devtools/python/python3-ipython_9.18.1.bb
index 37dbc1a33a..51f00db142 100644
--- a/meta-python/recipes-devtools/python/python3-ipython_9.17.1.bb
+++ b/meta-python/recipes-devtools/python/python3-ipython_9.18.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://ipython.org"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING.rst;md5=954609b5a3603364bc25989a92e38d67"
 
-SRC_URI[sha256sum] = "8919be8c27f20a6f4423145028063f6637b42a03ce57665bb12015ee1f073529"
+SRC_URI[sha256sum] = "6319c0f5372c196397899479e6db1783dd7937abae06815d1317e8d5d51aaaaf"
 
 RDEPENDS:${PN} = "\
     python3-setuptools \
-- 
2.47.3

