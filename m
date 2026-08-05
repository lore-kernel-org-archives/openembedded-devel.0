Return-Path: <ghidoliemanuele@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FDB8C55174
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 09:09:44 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36467.1785920983520655095
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Aug 2026 02:09:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=WLoHqavm;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: ghidoliemanuele@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47fdd674e17so423462f8f.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 05 Aug 2026 02:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785920982; x=1786525782; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BAJByyLhEMCZPNd3AQEKjGVgA6c3nLqK7oQG7nHlTsw=;
        b=WLoHqavmNTtOJsBlKSZSXmmKORBh2jEiruxNhrLsjf/1DXPM3bmm6f9TeE8Gutj9gI
         Qo9UhglAGwtxYP16sZcLKKWjRjeVSkCjBPM+GOjqC+u9YzD+kKPloo9z7qLMY9yoZGeG
         q6PXNvh5b0ZPuDHFNorF4UroLBFu5VgeUqKmN8jQbzni8/tNEh9JoNHwc0jpFFNA1Ire
         rsSzHQDK/7HhWyB5FejXFMWbiy0O+apHyItn+ePtWidfhEoHmtEqBZZOwwDOXvlqd9qt
         HX551wDrUsYNjQRvbOtdavXf+3djHmg6UlMBHXReGHkwdYq9WXGJZcfuBc41pyfME5CN
         VHng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785920982; x=1786525782;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BAJByyLhEMCZPNd3AQEKjGVgA6c3nLqK7oQG7nHlTsw=;
        b=S+Pe1NHEeGWQlQD5q9pSgB2GpUDnRVxxIYGygoGj/7J20jwIGjbjNUsVm/CbES6eJ8
         7FdhXdBwvStsm+LKSaGwYozOb4PChEs+XFcy1GEp2WZ23tkOUjgY6+9ze1mccPtzW+4j
         K+DebR+9FjOmV2ThPNXVr/T4J/fKz82fkZZoYeFth85uirUQYpbWnpsHZpkzoLwSbuqR
         /OnEBC2KJgoYWaox1DLfwHK4nIAx+9L/CPMhMS/gAGDd94H5twlkfAaGsN+DvqPfLTnF
         xWA0PibnQf+tUZS5y2+Y4cX3Q35EcB5iX8M+WLoUixsUF14eJQw67AzrquNDZj5MrOxe
         wrYg==
X-Gm-Message-State: AOJu0YzxQjtruVAoOhqQgyYCRfe4KnI1dU9vKCqmPkVofRfxAP28rP6a
	w0sdscuxyNCMtRcHv1NzI6RBnmSGW/hu1G7SWfCaamyE2x9grPhRmO2W6x+2FA==
X-Gm-Gg: AR+sD12BM4hQZYVJRt4TEtMZpxFprJSkkEuAK/ggo/IppZERS7iC3mJQMLGINz8Sk1L
	djf/RAr1XnlP1u1/GBqA0iuD+f1UOzCLniJtdJenQJ70dLEguW9GPqgDs7krnf28hJnEWjmgKZw
	49sV/VILOfX+e3FT/kzHwVbDtogE+4F6cPgmZ3zeqieXsOKzBXaMz4BrrjwasgVbbmwSPA7AX7V
	tfJnf3Ylb5JTCKMQWaRoBEJ1aidvZBULFdm5QsLpTS/ij/3MhvC+gLYE6lQkS5DDZmxDHhak2mE
	PZ4pAJlS2axuhP7JIsWsg6pfHTRmh5nv+GjA9n9AKYbJQfqc8sQZHJCyanaFCDP6muQHHQdaQDg
	rJHlrx/EWwkN5tlOPgu0wZqntMtT6s+qweBgLJ4BuZhkuav23/LxTtttpfJfwLoN/XhRJQP5gUc
	zIyI18uNHPOJn6jh1pVvw0E4dx4fE4U7PJDi5tonQQxtvr/gKE5kKZ5GNMOCQa7AwmpjOYFWsEg
	l8wP772QuBgP8Rn/EjE8vw51uA59C9IOtDmYXguAb4O
X-Received: by 2002:a05:600c:4709:b0:493:f318:3bc6 with SMTP id 5b1f17b1804b1-4994e7c55b1mr47792825e9.13.1785920981371;
        Wed, 05 Aug 2026 02:09:41 -0700 (PDT)
Received: from emanueleg-nb.. (host-87-5-153-198.retail.telecomitalia.it. [87.5.153.198])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47febfd9f74sm7430880f8f.4.2026.08.05.02.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 02:09:41 -0700 (PDT)
From: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	Darsh Kelaiya <dkelaiya@cisco.com>,
	Anuj Mittal <anuj.mittal@oss.qualcomm.com>,
	xe-linux-external@cisco.com
Subject: [meta-OE][scarthgap][PATCH v2] jq: fix build broken by the CVE-2026-43895 backport
Date: Wed,  5 Aug 2026 11:09:11 +0200
Message-ID: <20260805090913.3056864-1-ghidoliemanuele@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Aug 2026 09:09:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128806

From: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>

Since da15df26e62b ("jq: Fix CVE-2026-43895") "bitbake jq" fails with:

  cc1: fatal error: src/parser.c: No such file or directory

That patch is the only jq patch touching both src/parser.c and
src/parser.y. git orders the diff alphabetically, so patch(1) writes
parser.y after parser.c and the shipped pre-generated parser looks
outdated. Maintainer mode is disabled, so make runs the no-op '.y.c'
rule; having "rebuilt" the target it stops resolving it through VPATH and
looks for it in ${B}, where it does not exist.

Touch the generated bison/flex sources before configure so they are never
considered stale. This also covers any future patch touching src/parser.y
or src/lexer.l.

With maintainer mode enabled bison will no longer regenerate parser.c,
which is fine: the CVE patches update the .y and the generated .c
consistently.

Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
---
 meta-oe/recipes-devtools/jq/jq_1.7.1.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta-oe/recipes-devtools/jq/jq_1.7.1.bb b/meta-oe/recipes-devtools/jq/jq_1.7.1.bb
index 4327a25311a2..66883ef4a0ee 100644
--- a/meta-oe/recipes-devtools/jq/jq_1.7.1.bb
+++ b/meta-oe/recipes-devtools/jq/jq_1.7.1.bb
@@ -47,6 +47,16 @@ PACKAGECONFIG[valgrind] = "--enable-valgrind,--disable-valgrind,valgrind"
 # Gets going with gcc-15 but See if it can be removed with next upgrade
 CFLAGS:append = " -std=gnu17"
 
+# The release tarball ships the bison/flex generated sources and maintainer
+# mode is disabled by default, so make(1) must never consider them outdated.
+# Patches touching src/parser.y (or src/lexer.l) make the shipped src/parser.c
+# look stale, which fires the "NOT building parser.c!" no-op rule. From then on
+# make looks for the file in ${B} instead of resolving it via VPATH and the
+# build fails with "cc1: fatal error: src/parser.c: No such file or directory".
+do_configure:prepend() {
+	touch ${S}/src/parser.c ${S}/src/parser.h ${S}/src/lexer.c ${S}/src/lexer.h
+}
+
 do_configure:append() {
 	sed -i -e "/^ac_cs_config=/ s:${WORKDIR}::g" ${B}/config.status
 }
-- 
2.43.0


