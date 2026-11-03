Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7975.1793701468568306407
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Nov 2026 02:24:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=d01oRS06;
 spf=pass (domain: konsulko.com, ip: 209.85.128.44, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a2d6cf958bso18308875e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 02:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793701467; x=1794306267; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6rzjUFeiKbo061LLdzF9sj/up0lf2Relwk3sOjsFeGo=;
        b=d01oRS06cR/P/GvREF+8+mQGWtrJWM/EwuRVlz6f6oXtZ+pkbPF9BM2aOQ7OpW7ErW
         fWpmRYKXzIBR4TodWpbS096NqNOkzKrwY14DmaLgVyTMgaaosbrKpjU3wvjp7XuhEId/
         e1HTZcSTXDylMr/7I8+sWhsLaYc4wYm5NDIto=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793701467; x=1794306267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6rzjUFeiKbo061LLdzF9sj/up0lf2Relwk3sOjsFeGo=;
        b=OXqHkUuCgALbO/9v1wCKDba51zOTSD36tWuZs2rvBYI/LyAi3cimnO6rXe4U+dFDeK
         XEf/8HxKPiRbZvXqi2QzCkamy/MEJIqPYxG7vTO3PKNWCITLS1LU1x8R4RaXA4b773ow
         nMdXRWUJs+Rfckz8Hl93KU4yxQRIoY8rvBUAncwV6HyxBF1c/nB1zXInfogFPwGOCC7o
         ylAm7qkO/pO9YLamtQNm4lUJZQUqNFxFHTXTvR70wpx3lA2YVYvYpFklxqykN2aePdFB
         N2+Tacgd2CdE1FmcBjdOx4IeNmT1wu3xxRL//7TGnp6L3Pm9/zOkeNU/fqsjPl2vc6LX
         YZ8g==
X-Gm-Message-State: APuU4Z/mf1GV9eBonnmQN0tkuMNROsj2M/rOidb1suJHfQabbeIRy/So
	Uj0DsRI53Fmdwd8aKhq8H614TEQ2lnpJnVvaNPrT41cBqYu5aqQrjZuJP4BKbpY2iWuq/Qbw0Ho
	2v/4B
X-Gm-Gg: AYBFou10lhv744y4hTvyRlA8aabd4CPf9wE1a4lt+xuDWQmxKgo0ea94t8V0kA+QKb1
	DpMV/B+PswY2jXZCGV7ozQTx1IOlxl/MlhXXk5KeYgX8uGk1WWZ5NkjNxyMBhwje6sqSA3gPaG0
	ZG50ILFc8qd/ZH3Kw19v+aTXiOR5pJo8B32nVGyy3Ry1+AIwdYbzUPFw2MoxMtWf+vCLdGJuePv
	lOqCYLiirCBaiqKNK+lIjnIADpFLAwKwgwd+UMPkzqP/I99X5hlZ9ZCdHrIyyOdB4zaczgqcMvL
	ndsu6DPLXiYWY/Zm7+R6A4FmvbCA3viqaaJt5wJ9IpNLqVaFcWZnckAFq0Sp+3MqA16+NpGL2Bt
	7fvfbCXPgXNReIIuUbmVkIljdn2/oUINObvzQUny5unW179tpFWjnu7cw4rs6sXKzCqbQaN6AW5
	rrAoEvSftuoQYliEnI0Iz5v0ia5B9EBoteZkeWDQcNPMYdZLIKG1MmlIxrTW1uxq45kzzoJBs3p
	Ikn17j5kYIsN4d7K5S/b22qAZL+DvJ7ZQvgVkMl2BDpVtqC3TgSgu7U3nTVbucK0IjJMbqIW4n0
	daP+G0s94MJcAdJnpA57Ah++ohZpDQhDW1yGaHuizvh/dDS/S0BfF8QGpdQdUJ06Q8wmTHG/JSk
	gVVJojZaj8sFkUjI800C6UgV6UdOZVh01sIYKk3UHnPp6CrKjel/WNU8=
X-Received: by 2002:a05:600c:3f0a:b0:4a3:7344:13b4 with SMTP id 5b1f17b1804b1-4ac1709a2d0mr278558455e9.14.1793701466900;
        Tue, 03 Nov 2026 02:24:26 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a9fafe08sm73017225e9.3.2026.11.03.02.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 02:24:26 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 18/22] python3-trio: Upgrade 0.34.0 -> 0.35.0
Date: Tue,  3 Nov 2026 12:23:46 +0200
Message-ID: <20261103102350.1952237-18-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261103102350.1952237-1-leon.anavi@konsulko.com>
References: <20261103102350.1952237-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 10:24:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131781
Content-Type: text/plain; charset="utf-8"

Upgrade to release 0.35.0:

- Mark that Trio supports 3.15.
- Ensure that Trio consistently encodes all hostnames using IDNA
  2008.
- Avoid erroring when running in a CPython built for an Android API
  version less than 24.
- Ensure trio.lowlevel.notify_closing works even on events that
  have been deleted, e.g. because they were registered as one shot
  events.
- trio.Process no longer emits an EncodingWarning on Linux when
  Python runs with -X warn_default_encoding
  (or PYTHONWARNDEFAULTENCODING=1).
- The typing for async-file-objects is now consistent about what it
  exposes based on what is exposed by the underlying object.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-trio_0.34.0.bb => python3-trio_0.35.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-trio_0.34.0.bb => python3-trio_0.35.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-trio_0.34.0.bb b/meta-python/recipes-devtools/python/python3-trio_0.35.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-trio_0.34.0.bb
rename to meta-python/recipes-devtools/python/python3-trio_0.35.0.bb
index 79c9e379a2..b7c7a769e1 100644
--- a/meta-python/recipes-devtools/python/python3-trio_0.34.0.bb
+++ b/meta-python/recipes-devtools/python/python3-trio_0.35.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=447ea202d14d2aee40d8a2c26c865da9 \
                     file://LICENSE.APACHE2;md5=3b83ef96387f14655fc854ddc3c6bd57 \
                     file://LICENSE.MIT;md5=5f229c828e5a6f0a2ce90c7d3c054721"
 
-SRC_URI[sha256sum] = "63b9485408bdfdde544fced107045a8c0086cdc4bd0ef2f797b9e0dd111b964b"
+SRC_URI[sha256sum] = "7efb295c78a0ecd1235c5759e620b5da564ca80d2efcb0055423588547248b96"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.47.3

