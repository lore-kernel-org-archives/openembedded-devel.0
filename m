Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A9CEE7FDE0
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 21:14:20 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1569.1770066854164958095
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Feb 2026 13:14:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kwgweG1N;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4801eb2c0a5so47675705e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 02 Feb 2026 13:14:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770066852; x=1770671652; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gSBhBTi690esTVECfHEuHn1K7Q4BdKWr4bAGqiwq5ns=;
        b=kwgweG1NfEFOTlMlER2pxMAEjk6I/7wrdLFZZ3xMRhxfNV8ZnE+8/6pNeFeLmKBbSJ
         8A3AzHo0DIjfdRxqJDScoJxjMJO7jrypSmAEh+omL51NjNTrkucOugVM0NGfABCG0LF+
         kSOuxTBG8e93tXY8kB2chnfsIke4H4TgW4OR3gdVgJf9BKt201um6d7BHmnBMA96t0gW
         IDvoKfU55V9fqXnr2OeX0PrOm0fynocA9DjxjEcoGQ+CMrPwVhMlAnT1s/Be97wyGwbE
         Hvs+mqBhJ3eo37s1+/ijJZKRR1fth5Tn5tpMK6fhEej9Co9OKZzy0z5Tmfd3vXE6djKh
         9a3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770066852; x=1770671652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gSBhBTi690esTVECfHEuHn1K7Q4BdKWr4bAGqiwq5ns=;
        b=ih4m8wDPoVuhfxWd8IyjmLhpYdzBPjuxA6enwMulNIu1Vdvr421jIQikWyPBfxdeTB
         cWIhqoQzXN9M+bKLfiMaDsCASkN2TmHa9B2HfTNVBaETmTTOJZwn2buNhJxDvskAffET
         bSXYkoY3wuFJUb2ZfwsZi2+kIrzEhMK1mK1tjAojdrC8GUhrLjt2i9MoGZY8aiee/myy
         /h1ERZFhsNv9OrBOCbsrM2gqQCMzVpLwcRi+NUspKvP3o/2aBjcyoJHMvaybNaTr+KxU
         q1240SqGaG2zh0Si3hwwzVVCaDp3IXO5fcOfLLCi5enQ1BGLK6UP+m5u2a6UBip/Tqa2
         2aDg==
X-Gm-Message-State: AOJu0Yyv17bR811WiZ2AvVhsRD/lgkO9uaV16MQqf8rhR9Z3/LlLbz8M
	xnz6k9voiFhYgTz1mYzmqUAKc8tH1bKOnm3pjjnQ6CkUmg3M7mThhgSvuoXxGA==
X-Gm-Gg: AZuq6aI7bouluO1+WhaiYZDlfaSSq6fn/f9LDoxnHgNSF0Wwwn+bZZcKEezq+LYedal
	50M0SratqikjgowzJ8Bar0iWbvDVZQ1zR7c4NQWOKxrLu7+vITlLyi6D0NmtnpQyC1dZzRmY0vw
	lLrxa4U3FvvLwU7D4eBA9v+eBlXBE1l9VDoA6hvmIrR0a4aXJJ9/MeVIniEJ5fkhbQfqh/SPrNe
	SExc9poHXdFnu4e4cGfnba1pYFS8yvvg0/Kp8rTSSD2G2AXFbHw3yfZGU9KnhFIhboWP6f/bt90
	bmDHEN2eCbECCC9uVTF6F91bg4mGyUj+o1cUI8yhnzXjCY6gHNWrD9vCoL0aQrMyfdwCnMaoHny
	iQizI9JxJPzwcpyfUbUpeCIlFPlu4wvFxk/0uTLKnmyW8tXd4c7m7wJlDoZ+7uMl0+D8H880BAE
	QMd9o2Ibeb
X-Received: by 2002:a05:600c:1f14:b0:47d:4047:f377 with SMTP id 5b1f17b1804b1-482db4a1006mr185201005e9.36.1770066852425;
        Mon, 02 Feb 2026 13:14:12 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e131ce64sm48756747f8f.26.2026.02.02.13.14.11
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 13:14:12 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][whinlatter][PATCH 15/15] proftpd: ignore CVE-2021-47865
Date: Mon,  2 Feb 2026 22:14:01 +0100
Message-ID: <20260202211401.1287664-15-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260202211401.1287664-1-skandigraun@gmail.com>
References: <20260202211401.1287664-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Feb 2026 21:14:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124088

Details: https://nvd.nist.gov/vuln/detail/CVE-2021-47865

This CVE was opened based on a 5 years old Github issue[1], and has been made
public recently. The CVE wasn't officially disputed (yet?), but based on
the description and the given PoC the application is working as expected.

The vulnerability description and the PoC basically configures proftpd to
accept maximum x connections, and then when the user tries to open x + 1
concurrent connections, it refuses new connections over the configured limit.

See also discussion in the Github issue.

It seems that it won't be fixed, because there is nothing to fix.

[1]: https://github.com/proftpd/proftpd/issues/1298

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-networking/recipes-daemons/proftpd/proftpd_1.3.9.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.9.bb b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.9.bb
index 65dd2f9561..d64e0a0495 100644
--- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.9.bb
+++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.9.bb
@@ -25,6 +25,7 @@ UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+\w?))"
 CVE_VERSION_SUFFIX = "alphabetical"
 
 CVE_STATUS[CVE-2001-0027] = "fixed-version: version 1.2.0rc3 removed affected module"
+CVE_STATUS[CVE-2021-47865] = "upstream-wontfix: it is not a vulnerability but inproper configuration"
 
 EXTRA_OECONF += "--enable-largefile INSTALL=install"
 

