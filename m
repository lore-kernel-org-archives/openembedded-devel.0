Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D181E95A86
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 12:25:01 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.63171.1767097499469896745
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Dec 2025 04:24:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fTAqyhjb;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-42fbc305552so7842222f8f.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 04:24:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767097498; x=1767702298; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G+jI+NLjExMijdgxIuQsiRKc9BT2MiHXa9KZozro1Fo=;
        b=fTAqyhjbrBkQfRmHh3hGv2mg/HNyTCPt9m6/d03RDdB6iLJxusqEMubkvOwc9iKaSB
         p4zZyPdu+NiJKwChHozoRzYnWzAEL9mJlcC61k9BupuUMXrQc0uKC+8NSjXNpmK1fVa8
         ZH6awQGNl1lZM6ROneAR+LLUYjp7F7J7HCB0Ar97Oup8Mkr1NGoHwWcXbymGJ/trLHCp
         ApGt7YhAjWpxwB2Tckcy8yMaNnHytMLP1c0s8TXe3mSkrH66AoHb51fd7ZDTrb48quoK
         UKSoApsBhXD56wI+R0UyA4Ri+uLyjKNoqhts1qGmJP6U2HbOTHw58oeP5BzZ/c090xhC
         Ft5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767097498; x=1767702298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=G+jI+NLjExMijdgxIuQsiRKc9BT2MiHXa9KZozro1Fo=;
        b=gXIzcuSO29Iq8LmLLA/cZXaCO85CPrwGwwGwP9H8xg97Ar22iijsOq0K90LgJdf+Bi
         beYfmkbarTYpCiVIxgFsd+SENl3BnGtdzC8dHeFbfmYT+vpyVjM+bvSY+grwk6Su88Hj
         s7fOusAV8PFwKJCq4sFxD/jj5wveI16qg/nOM7bgBmh63IJzF3DCbKAz6F2gAlaFnWQs
         oodf4O8xiPFfZ1VoZFROO28eWTmOhvpM99GGLuuKENqso+oQTofKirTNRyJH3JG8pQbK
         C0FFxGVuRCXKviIlQ25gI4eKaMNfx8+Zxa53FMzmAT/K9i0DUYm/yh1Izy7N04n612KT
         yFNQ==
X-Gm-Message-State: AOJu0Yzq1lZ3elLCsvhlXqB8xl2BvNKwGvRzTVuB8Lcga1iib/Fd5258
	KXOodRhsWsmyVRZ54zXSJc3hdlUzUsgTQEl3I4DQ1/XGg58ewnDMlRwI2qQOUg==
X-Gm-Gg: AY/fxX6C5qtwdoCrnXzFdMYF0ukn7tLZrZmH6lqOv1084F+cxo52zD6wgs8VGeRp6wI
	glITs4LA43ny5SIrU02+9mMmwWjqvThBOfWGZsUXx1AgsbbJfFo3IbcEOj0u4O4CSx1Kc+1OOpI
	81dKp8LvhrbmAzQWqWosfij8Tn31O3rcyYRN9mJjmLsEW6h+Z6BZRf+cVg4B/BIY+FxUZ9hbYjU
	FffGmkRuSWCWklyjXVErpfbnJgjE3h77sNZq/BTZDHdduXZbxVBo4HssbOrRgDWCeQmnXL+ev3j
	Ti95+2dcftTj5G5Nkye4V6YbNe3rhLBQtDdXyxgAfZvH1l0ujHSS1LNKhmygw/OOZUsNMO81K6A
	YlvFKttJvy0vxBUH/OvIneKrynj0T5hhuLA9RolT+iTpJExO1SiMywtln6L6xQ2xvLZUk1hUCgT
	ccGnXxgauK
X-Google-Smtp-Source: AGHT+IGdYvwl1qKH11N1nuSmQbwWHCh+dCTwaJzD3O30wJLKN70uQ9v/d27MWehADkvMOI32p8Aj4A==
X-Received: by 2002:a05:6000:2906:b0:431:9b2:61b0 with SMTP id ffacd0b85a97d-4324e4d2d24mr38713267f8f.25.1767097497810;
        Tue, 30 Dec 2025 04:24:57 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa477bsm68395060f8f.36.2025.12.30.04.24.57
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 04:24:57 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 04/10] python3-twitter: set CVE_PRODUCT
Date: Tue, 30 Dec 2025 13:24:48 +0100
Message-ID: <20251230122454.721515-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251230122454.721515-1-skandigraun@gmail.com>
References: <20251230122454.721515-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 12:25:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123010

The product's CPE doesn't use "python" as the vendor, set the CVE_PRODUCT
accordingly.

See CVE db query:

sqlite> select * from products where PRODUCT = 'tweepy';
CVE-2012-5825|tweepy|tweepy|-|||

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python3-twitter_4.16.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-twitter_4.16.0.bb b/meta-python/recipes-devtools/python/python3-twitter_4.16.0.bb
index 54379673c0..9bbbc9e8c5 100644
--- a/meta-python/recipes-devtools/python/python3-twitter_4.16.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twitter_4.16.0.bb
@@ -17,3 +17,5 @@ RDEPENDS:${PN} += "\
     python3-requests-oauthlib \
     python3-six \
 "
+
+CVE_PRODUCT = "tweepy"

