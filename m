Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15553CD5BA8
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 09:16:07 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19704.1763025362624240306
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Nov 2025 01:16:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Wi87m236;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4711810948aso3674295e9.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 01:16:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763025361; x=1763630161; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=/gJK6icGyyL/6kWU/ZHGn7Qvj/bMoq5SZE6Dx/Izc18=;
        b=Wi87m236gBMpVt8KembKLEBupWiToG1cvh8Pw4y1LJzJDQeu1O5KPsRlFquh4ZP7V7
         Ij5Py4j70yIsTOz9AFBAil9pNYy9aCije78Alsv9qM5/j/9FKhNlsxeMOHPKEdi69mB3
         3MHzpJyH9LKf3k0Q+lW0bgjmYwE4IoFTLNLWFYFNeeP6XUYkrXeg1nUePGmDD0ofYlHD
         C9RCGGS3iREicj3X6HvoVAG+JZOQkglZuVyVJ7PqAGOOqACkp5MZOjq4N5bblBR3hFTX
         2Z6eaRGzQlMXhGnGngaAksJclrSNh9eWeInUUBbpPqBOktrrSpZ+NhT8C5A7DrFuqrwz
         6vNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763025361; x=1763630161;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/gJK6icGyyL/6kWU/ZHGn7Qvj/bMoq5SZE6Dx/Izc18=;
        b=EEuC4/4HWpE44dqONi172R8gGdd/R+7wXzQxtc1+NdS1FG48yXcMH4SME65neWEE2/
         2vnK7oilKs3cB8juN5zLEAe9Y2Ol5G8vAfmJa5khIjLCOj1w/KOvJIFimzcGFEkKRiRB
         aEcCS6EnTcrNe6HrMTJP92e0WpGNC8zuxzeWUJ1r8Q3NMTlmQKr4SObXfP1+hMs7LH+g
         NqvgM24tNJDG5gcdHi4vlBc3x8DIVjzHT0YSA/pO54hu57xzevPA5KQmlR61LT2aASyo
         eWlS2SjIUgEDqSRb8EBYA5dh69gzkayDdqnKQCNmFqrs0nxO/xw+dTSR1AfeBGdrj6tx
         HiVQ==
X-Gm-Message-State: AOJu0YziIzrBURJT80xuyeQFBDUT85HIlgSNBMqKI522ui6MjOxvQ/lr
	bANXWB2sTUZ1NUpKf4F8WN5yWmQqc/Vo9fUBXjF2NPsGapkUFHzcF22y/IHTr402
X-Gm-Gg: ASbGnctX1jHkluoHafsEeufFrVqVqprwCrLjK2YeNm2xOSDt83OJx0001IEmkwxADIZ
	zbclymCwSxEu+eZtYew3LuQPhtSkJXZYodcYZ3RSD9rAMw++UJFHMMH5E8CkP/rgfqOWoP4/WOs
	V66bzJYik+TaKIhFi53Fk4kYEJrIMFG9IFtNeGG5igC8Y3VJnSSHwXj62FZ4muqIhUhYecr5smg
	uU6OmfyDX+5ix2akKCeWafehRzqZTsMrnM3q6uTl5QzA8s7cMcXpnA3ZKMo/+YrWSs2tT3eLpWu
	uSTSUlt7qNC6DXS7cU8Z4IQUx5V+uSFdsgrVIiJMHsIf77FiH47adlEGfJ1BvDzWzRSDilfw2Dd
	ceU36kJr3lFEoIy25+OkVnlXaoCIydfMriU3/1A9ISc6on9SXcbQqPQvsmwfE0eqFe31ji6oXh1
	VuslG6LdD9
X-Google-Smtp-Source: AGHT+IFb28mHxpW+uQdIHbVcV9XZTo4RbqkIwelHvUbPC32yyhl8Hdww57rojQcdu5ay77e5hqrkVQ==
X-Received: by 2002:a05:600c:350d:b0:471:989:9d85 with SMTP id 5b1f17b1804b1-47787095d77mr56376815e9.19.1763025360769;
        Thu, 13 Nov 2025 01:16:00 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4778c8a992bsm23758715e9.16.2025.11.13.01.16.00
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 01:16:00 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH] redis: update test error message in CVE patch
Date: Thu, 13 Nov 2025 10:15:59 +0100
Message-ID: <20251113091559.1188351-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 09:16:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121642

The expected error message has changed between versions - update the test
in the patch accordingly.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-extended/redis/redis-7.0.13/CVE-2024-51741.patch  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2024-51741.patch b/meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2024-51741.patch
index e3a43fe896..b8e5bf4444 100644
--- a/meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2024-51741.patch
+++ b/meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2024-51741.patch
@@ -71,7 +71,7 @@ index d836f9c..0b83b89 100644
 +        $r2 auth key-permission-RW password
 +        catch {$r2 SET x 5} err
 +        set err
-+    } {NOPERM No permissions to access a key}
++    } {NOPERM this user has no permissions to access one of the keys used as arguments}
 +
 +    test {Validate read and write permissions format - no pattern} {
 +        # No pattern results with R/W access to no key (currently we accept this syntax error)
@@ -79,7 +79,7 @@ index d836f9c..0b83b89 100644
 +        $r2 auth key-permission-RW password
 +        catch {$r2 SET x 5} err
 +        set err
-+    } {NOPERM No permissions to access a key}
++    } {NOPERM this user has no permissions to access one of the keys used as arguments}
 +
      test {Test separate read and write permissions on different selectors are not additive} {
          r ACL SETUSER key-permission-RW-selector on nopass "(%R~read* +@all)" "(%W~write* +@all)"

