Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FDBCCCF9EF
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 17:57:56 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.29.1761328675669178328
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Oct 2025 10:57:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jwrqCivL;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-46fcf9f63b6so14221015e9.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 24 Oct 2025 10:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761328674; x=1761933474; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fmMHmO8DSpfNw47glBGD3pZaw6aaGrN8cTuW3rwz6W8=;
        b=jwrqCivLcg9osDyA5U7aJdHKTZdYbsREhvgXFsfHxpGw9H1NH/oeHhvzOABzOC4OUC
         GmjG6BEgDQVF2yvw0tegZQtGeZCYgjX2gH/IgdOqmA5N0VHDzBkkg8mlOnBvyB0rw5nU
         erge8V5FlkkOFLibq2TfgwI9sYNjPpV0IHk5ZpKdJ6mCnmxrP4ggc2dp12bPSGEc51BU
         Oo2quFTtNguB4mjNpiDNQWnz5qfwsf6TuZigVsg7sRl6pWPie0jtX3YfdKZQ9e941/49
         qQfncmyZ352tnCqZNQDsfSif+2TMru1Mp5wSgRwz/LmH3dKrvw4kOYfYvrgfcM1hEB4O
         +Wbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761328674; x=1761933474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fmMHmO8DSpfNw47glBGD3pZaw6aaGrN8cTuW3rwz6W8=;
        b=wGU7oERsZ1yzVElTj5W1asAXYuzIH1QJzNoqJI6XkK4WWCiYrlJ7CfKYpTAYkrZ15f
         mqvLUH9+IJDL0Hll/03Wve7hqWbX+9/Yz5Env8Szsn5hEpL56tryWlJLE1jq9TZKYY6E
         4RU1vp8hCPNE7hTa9b0587zRd4tyYPz30wvcFiN+dNxA2y9FplrjcqS4toI2K1EZisc1
         IcgAq3jtF4hrSvKUWVVRqqDuPADkMIW75+ubumPRxMGZkVkkG90wxLuulK43W3C1vIff
         08W2aYu4p3Fk1CZ2X/5fpzDI+OZ2nPCBWsEnohEoyvaOabBwLyBK3453qrtw8xgT/+PA
         fU/g==
X-Gm-Message-State: AOJu0Yw3MQ7IS4P2f05m/ZBstdm4Ys6rHnFLdzUxfI4WrR/0HHJO3VI3
	Ua5EHkXxtsEjncBoC1QiqLs1s409MUO/Q/2Lyts0qYkp4gjvn+5oUEnDz1d+cA==
X-Gm-Gg: ASbGncv3zJruEqOUVUhb8Vb0+v6sgSu6nXhegjYwFxvYNgwTNDM9MF+NUmG9kFG6Vj3
	Y6k/Qc+EeX4GcSTpYO8++H3bo6VLs/+Ek6X8+kSstZQOnz2+CI7d6u9DiiszpiBs5cCJTI+7bvx
	pR0Yh/k6zEKS7pDqYPlt2OQotmu+l9SFhycenXk5H0h+y5NDOThKNEzyxfgkn4PUCycBDRBXiLb
	wzwBSzNhlk7Mw/sQdTL56xPmltrXgBYl5YjkBT1vijzQxiy+4qaie/ZmNpiD7ZaQuMiMO8MSzCZ
	7Qk64DG5RDNQdZxrxntWfdn4dsW7LXEr7vuQ1pnEx+duFtfz/jPhr4bUqevHtRpcXWIpm/HtW2p
	ozUBU1QBWe2i5Al5bH/9rba0DhCvOoB0XBZcZVlEagJtP9RyNp1z1Zr0vKQsR6xwrv1OLfZfHpg
	==
X-Google-Smtp-Source: AGHT+IH7bPhl1fMU1FBiPqEhzarTlNp/Sq5XX++mf4fPw9cSp2XTm6m228xQ/9byGQPQwsTQnk/8Gw==
X-Received: by 2002:a05:600c:a14:b0:471:15bb:ad7b with SMTP id 5b1f17b1804b1-4711786d60fmr233607265e9.6.1761328674054;
        Fri, 24 Oct 2025 10:57:54 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c43900e1sm192686925e9.17.2025.10.24.10.57.53
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 10:57:53 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-perl][PATCH 08/11] libsub-uplevel-perl: fix ptests
Date: Fri, 24 Oct 2025 19:57:44 +0200
Message-ID: <20251024175747.704498-8-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251024175747.704498-1-skandigraun@gmail.com>
References: <20251024175747.704498-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Oct 2025 17:57:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120966

Add missing dependency.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-perl/conf/include/ptest-packagelists-meta-perl.inc     | 2 +-
 meta-perl/recipes-perl/libsub/libsub-uplevel-perl_0.2800.bb | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-perl/conf/include/ptest-packagelists-meta-perl.inc b/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
index 1411eb9990..02c239d9fd 100644
--- a/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
+++ b/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
@@ -26,6 +26,7 @@ PTESTS_FAST_META_PERL = "\
     libmozilla-ca-perl \
     libnet-ldap-perl \
     libstrictures-perl \
+    libsub-uplevel-perl \
     libterm-readkey-perl \
     libtest-nowarnings-perl \
     libtext-diff-perl \
@@ -42,7 +43,6 @@ PTESTS_PROBLEMS_META_PERL = "\
     libnet-dns-perl \
     libnet-dns-sec-perl \
     libnet-ssleay-perl \
-    libsub-uplevel-perl \
     libtest-deep-perl \
     libtest-harness-perl \
     libtest-warn-perl \
diff --git a/meta-perl/recipes-perl/libsub/libsub-uplevel-perl_0.2800.bb b/meta-perl/recipes-perl/libsub/libsub-uplevel-perl_0.2800.bb
index 084d55ee60..1d6c8dc27d 100644
--- a/meta-perl/recipes-perl/libsub/libsub-uplevel-perl_0.2800.bb
+++ b/meta-perl/recipes-perl/libsub/libsub-uplevel-perl_0.2800.bb
@@ -34,6 +34,7 @@ RDEPENDS:${PN}-ptest += " \
     perl-module-cpan \
     perl-module-exporter \
     perl-module-extutils-makemaker \
+    perl-module-extutils-mm-unix \
     perl-module-file-spec \
     perl-module-lib \
     perl-module-test-more \

