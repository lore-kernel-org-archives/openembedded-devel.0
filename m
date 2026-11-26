Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4362.1795720564533412116
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 11:16:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=udQc8Uza;
 spf=pass (domain: konsulko.com, ip: 209.85.128.53, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so95076255e9.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 11:16:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1795720563; x=1796325363; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aZ/ceRsnI4AwbhIJ3/UOnTGP6Yw90BCx1YOMay6NQRA=;
        b=udQc8UzaiUndww3qKuY/uoDEu979EQMGqdSyFA67Qq3OEatxp6gk87/1mh0i2JT4cG
         5z9JSlgZk01EEAnypQCvXesmiWQ3oE9kQ5+PUMFrBbXygA+CWsE4JiM0M8a3913ZRi/p
         /BQGUhr/eTEBq63pJ26X+zT0+C6mLuiE22+NU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795720563; x=1796325363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aZ/ceRsnI4AwbhIJ3/UOnTGP6Yw90BCx1YOMay6NQRA=;
        b=tzLq8gkaH6WyvJS/jTWVhNCCvuMGVNo6kCR5TnV5AOcghjIAiOOIzZ0Z2be0W2SpfA
         3zwjxHoJIRX22lyb+g383iRxWKSXcYUepB+8SLFzVmWWKGc10ErhNCdQlocyegdYnAg7
         mHNbJ+CZg/NzRCdapX2oXUo9fmeExn6+wgR5BDoxyBlwnM6yf5RdIA3Z5I3/MUmH5IYL
         E8yYMhVL2XmIXJnaDWoy0DxIS80fqXB1j8u6lo6320YA4lfYmQ/Iueg4qB6ru7TNVQiY
         R8SfPQN9L8j5EKHcn7QLGoC3MjrFvZgRmxCgAh/K43GaZ5XfeN2AlxxcZguBF/YrIY7X
         ZIUA==
X-Gm-Message-State: APuU4Z+PdHvAowNe2eCj2bw7FGeK8jU1RYzAL3Sb0iZ/Iul8l27OsZ4y
	ZRjwRROLZ4tqtlKX5PJtbLasZbVlRuPWASC5w8fZkgT8QsUAzUIKn2ffrVT8KxSLgXoqRyZp9rM
	e6xZ1
X-Gm-Gg: AZFdTZdOtegH+LEyddv5zQvT5v8z9CEZ/6QneMfId7DAkwIL5zpHVQTCul3c3C3PdIB
	RcAuWYLaJ9bDGSci5sHgyrrkEUXj5UKJg0Al0ydAEO1uwryVGAN4xwSDW33dp9Y+s1Dt98ZlyUf
	DAYDGj+U2RA89/KnpDkkajypkodJETd/jS0xkdLxpP6H4I8xMVpEo+CoDleuaNNNjX3DIBoK5Ve
	tVxmsJWK15oYPIu3vJjlUDD12i1QeL2cpSZ5x8obewXd6fEDnVYTDo62IR1NIu9raLwMESfS93K
	GlNgoHQzwMNj84kMu67OaUu7BPTwtQaLA0RvnMKnJuJagAc65IysQR9JU5MjH0HpsOH4x2+rylK
	9tudlvKTXZ8MhD1xv47EWdzYwFaOM1ngoqm27mzWlNP6XwTocx72lyEywlrPUZ3tMolP+LlAUPl
	NN9MJneZxx5tJg9uAuI4beBWZ3NNoIFSW2j6I8Df9LRJDp2Dz/AUwJ85bOzQtPQEOl1t/tHRVTF
	v1hoHHuJRDrRRO03rSXXRXNZu+e2T9hvdR2i+CYlE0JXeu8GSfl0Pq2QrorwtTY9xJb3NpGLNPL
	tAGdV24wViN0Ognt0w8PkyOrWG/15220d+aCbkefQAi9GSHwwAEx2yUFtUDiVvP7W1aBugTtR17
	GY3vKtxQNeSCF5SD4sQkfyGqVCiogFMqzOaafRjP+sZY7vJ9ivT/jeg==
X-Received: by 2002:a05:600c:c086:b0:4bb:ab2c:67f7 with SMTP id 5b1f17b1804b1-4bbab2c6d69mr44968205e9.8.1795720562479;
        Thu, 26 Nov 2026 11:16:02 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b3a7sm697871515e9.3.2026.11.26.11.16.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:16:02 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/2] python3-typer: Upgrade 0.29.2 -> 0.29.3
Date: Thu, 26 Nov 2026 21:15:55 +0200
Message-ID: <20261126191555.7597-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126191555.7597-1-leon.anavi@konsulko.com>
References: <20261126191555.7597-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 19:16:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133092
Content-Type: text/plain; charset="utf-8"

Upgrade to release 0.29.3:

- Ensure that allow_dash works with a Path annotation.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-typer_0.29.2.bb => python3-typer_0.29.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-typer_0.29.2.bb => python3-typer_0.29.3.bb} (94%)

diff --git a/meta-python/recipes-devtools/python/python3-typer_0.29.2.bb b/meta-python/recipes-devtools/python/python3-typer_0.29.3.bb
similarity index 94%
rename from meta-python/recipes-devtools/python/python3-typer_0.29.2.bb
rename to meta-python/recipes-devtools/python/python3-typer_0.29.3.bb
index 90807e9aed..243ae9a270 100644
--- a/meta-python/recipes-devtools/python/python3-typer_0.29.2.bb
+++ b/meta-python/recipes-devtools/python/python3-typer_0.29.3.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://github.com/fastapi/typer"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=173d405eb704b1499218013178722617"
 
-SRC_URI[sha256sum] = "b1998dc5f2c3dedafa1517a9521fa944cc4dc1fadcea085d81a3b10ebcaeb075"
+SRC_URI[sha256sum] = "8189a53bb9684dc551e0b61e71904b323214884f2eb14bfe71aa859ae980d10a"
 
 inherit pypi python_pdm ptest
 
-- 
2.47.3

