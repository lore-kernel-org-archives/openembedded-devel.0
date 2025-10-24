Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 114CACCF9EB
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 17:57:56 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.28.1761328675018121121
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Oct 2025 10:57:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cna0MJCl;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-471131d6121so18387345e9.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 24 Oct 2025 10:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761328673; x=1761933473; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZE1es8Y3B55m9LGXHExaQ0Hf1GxkhQ3viibzJEMmXQs=;
        b=cna0MJCl4OOL9QfyMHirzGlgBwJFapzvynMb90+kr9ZFFF1Bhx21qOzuT2A9E5wFwT
         v6tx7TO2+Q2j7xJJKTe3p3H1Fkv+IqpUeCWcoK/ibxw9aSFBjI6/fVLcsqJm5SZxJFx/
         toz7Lu2lI1eNcnHZmOIZay+kNpHjpNXao0rhBefS+vl3AOtixX7XvlO838UD3QrfkHB1
         DkY4W1OKUSxqciQfkyEIduL3z3CxxtwN3Pgd6P6RVjCEL0QLnoI/DV53/C7xl4jxBLx7
         FCxgWZz7iqUUzLHQwg5XMPRUfMaTSUVwPX9VXaYogSDfS+9Ug9g7d9j6Zh+lO0Glqw00
         07og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761328673; x=1761933473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZE1es8Y3B55m9LGXHExaQ0Hf1GxkhQ3viibzJEMmXQs=;
        b=npqQI5xVY/RXuwTovar/GE7pNrpv9KLGZN8EVwF4h7LlGxk9lSMOn6BC3z5BOJh2FR
         jxs0UB1kpvrQzErwsM2eRyTaEIKwnTe4l17Bm9RSIx+20W2Nw6rpSAln+qUagrbG+3Cq
         jSN7l/ztq+XnYxiJfv2AF/8QZ5IDxFPDkGvCyEnDz5BXuwaEyBMzBzXAt5wPUyx67Rti
         pQvXwexRGyuFJyRAg8jWpjthsD7yEEes8kTiipuUrbXv1F0o1VYpKhewMe3hsLJTUa7o
         aJ/57eGC6eBIGzLW3sHfYmWBK3Ait6b4cleiUSHspGm7oPFKhfyWySJWXoDvbixd39M1
         WZdg==
X-Gm-Message-State: AOJu0YwpYJnMraFSqBjYhEiHdgrjMxBamYSs1Xl2q7VDb0dqbzTw7IVZ
	zYB/e9N4B/DVYZ89seUQ4R/wgkXP2D2gFVd3sQiOo+vlczlq8bjIqZaZjpRAqA==
X-Gm-Gg: ASbGncv8YuaqUkklifJ1swDImM9xzQgyu5RLln0A2PMe/DXYCKl3oCxtMjyIfsY5fZ/
	nQ4HkSqIdq3P02NRIMmdRg93/nyuPbAL7JmvQCbEFJgIvo5QkntHfZE0eK1WHO7fIACfBv0RZRS
	bwsGyZCD3piVZgJxGFvaVlYniNTYi82q+9b/jXIurSZ22gWiEpSZPhrOtl244x30Doh2W7xEJ6O
	r8BRmY7aGYf3gusZjsJpYSiDMbDN/okrcjwoWDcQWCKuILLhSErJ+rAYIzSbLjm8mZPPuoLkHy9
	oOi0RuPf0ugu9rduHOZ9ET/1NbH0Px/KyevICJtranP0dz3pdCIFYvdXmAxQ91CrSJ/p8Imp+UP
	eLKFtaEexmKlQrWSoKwQ0zzadHYzv//4kPX6mb7Px2CYVPvlj23P9d8RJXULeE9j71aMGMh+OQQ
	==
X-Google-Smtp-Source: AGHT+IHiYmBGsqcq2KTzDmougBnTS6sG7y92+lRFp8xp9EYQ3HDPDWvxLtx+e2+Etu9Jox20QtNa8g==
X-Received: by 2002:a05:600c:4e93:b0:46e:4329:a4d1 with SMTP id 5b1f17b1804b1-4711786d685mr218041115e9.4.1761328673370;
        Fri, 24 Oct 2025 10:57:53 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c43900e1sm192686925e9.17.2025.10.24.10.57.52
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 10:57:52 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-perl][PATCH 07/11] libmime-types-perl: fix ptests
Date: Fri, 24 Oct 2025 19:57:43 +0200
Message-ID: <20251024175747.704498-7-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251024175747.704498-1-skandigraun@gmail.com>
References: <20251024175747.704498-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Oct 2025 17:57:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120965

Add missing runtime dependency.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-perl/conf/include/ptest-packagelists-meta-perl.inc   | 2 +-
 meta-perl/recipes-perl/libmime/libmime-types-perl_2.29.bb | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-perl/conf/include/ptest-packagelists-meta-perl.inc b/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
index e099910775..1411eb9990 100644
--- a/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
+++ b/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
@@ -22,6 +22,7 @@ PTESTS_FAST_META_PERL = "\
     libextutils-installpaths-perl \
     libfile-slurper-perl \
     libhtml-tagset-perl \
+    libmime-types-perl \
     libmozilla-ca-perl \
     libnet-ldap-perl \
     libstrictures-perl \
@@ -37,7 +38,6 @@ PTESTS_SLOW_META_PERL = "\
 PTESTS_PROBLEMS_META_PERL = "\
     libconfig-autoconf-perl \
     libhtml-parser-perl \
-    libmime-types-perl \
     libmodule-build-tiny-perl \
     libnet-dns-perl \
     libnet-dns-sec-perl \
diff --git a/meta-perl/recipes-perl/libmime/libmime-types-perl_2.29.bb b/meta-perl/recipes-perl/libmime/libmime-types-perl_2.29.bb
index 512c068d13..f5cc4ce84f 100644
--- a/meta-perl/recipes-perl/libmime/libmime-types-perl_2.29.bb
+++ b/meta-perl/recipes-perl/libmime/libmime-types-perl_2.29.bb
@@ -35,6 +35,7 @@ RDEPENDS:${PN} = "\
 "
 
 RDEPENDS:${PN}-ptest = "\
+    libmime-types-perl \
     perl-module-lib \
     perl-module-test-more \
 "

