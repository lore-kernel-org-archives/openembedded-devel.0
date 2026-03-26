Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52A1610A88D9
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 15:22:25 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50122.1774538536683088397
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 08:22:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=VENJ+kNm;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4852afd42ceso8655675e9.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 08:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774538534; x=1775143334; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oFbOoP3hJM6rhXUJABHeYp7hNc8OCwOlKHgE9gbxgt4=;
        b=VENJ+kNmVAJkO/KHiQRCSh1/rBmCwjm0wpnW58+igRaR1r/cLrGam+54EXq0WGg3fV
         8WPEcUhVVv32dwrPBhZi0aBs66oACvu0KCisCSxi0upWu3Jn7z+Om+PpO97TJeMlAXIQ
         9yqimLJk1kdWXtHOE410qHqiTpWY3n+CNhKgjSIN6kYkldoErpv1igPkRrb07JZC4iRg
         +ekxTQJmX4/FfvaIdP6Ke3HEyAHSL6YrTjctyDhE1EYP1+8lY+9lg6qH/u4q19rf0p9t
         SXUR/Wksq/uwUP2NUNXqv5d28DDsPU40dNkF9EF/1MUextXYTiIuvMj5fDjhHvhtnFYW
         Gr+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774538534; x=1775143334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oFbOoP3hJM6rhXUJABHeYp7hNc8OCwOlKHgE9gbxgt4=;
        b=FjUA+2QpwOOUD4FvYvVPkaWKXA79Lhs1YpHUI+uuVFDpYtuqbZVjxodSpD0s8jRl0J
         wIMhM1vuNhuSfTE3plDWWr//kiZacHeGrXw1UH+0VVUR55NoGn+zNoWzUaiP68G/uoiu
         N7z68+JjIlta1AVoUh4aNPxj7T+IlsLhcsIQSvqIecBZbcld5JlI45ao9vjUr+oSLFqx
         nump7TLJN+SOek7DpA/P/Dtm0pQmSeAXhR8KpY6DdnjvT5ZfCRyMKSnKt6OA01y0euqQ
         HQcoeOCSxfCjUFQ8V5uF0/aQPnsFI6XXdfDzmlHH1IYl2Sr5sCZRW4icJnt4YpUGN7wY
         Cy6A==
X-Gm-Message-State: AOJu0YyFlakbQHkKQrn6KeX9QyX0EP0E7wE4jNzqeju1TEx0SyFrUsBl
	+Un23Q+n896MSXPfL1pNZLqH1ca5Mew7xWhOSUPmNIirlfpZIiRfd8S9bR+mmg==
X-Gm-Gg: ATEYQzxAxgUh1teHKB8YA17TdrvNHeNDUv1JaYoRrs0Kqc7nvFatJc5MoCH854Zl6uB
	RkhaxbMUObvoq5sLAFTaaD/0O7z+RD94y2R+KqnSDMHetp9T+anjDpPGFQ5Z8YyToLIrD5INBbP
	a7g20w+O/irNGC735XUH/m6b7G/lW9tVaRRAxr9CENTZua75K7BxgUga3tpRXScuyNOI727geH1
	4DY0lWMzyus+rYrnpJKDQ1Qt5k0QnSBO081UjCfPBZtUvTDKql7eSx23agqMP+vBz2SvjSQfE1k
	hzq0IFSEgp4es6SLemGXnkfbogd10kAqlayAfuB9f3Z71prPf1k4z1dgGVOuicEM2RM3ZAjFO+i
	0VhYIngB/WHYJKeIc6Xa7gMsMPozOfOJEyVZdpc50lUYOX6AafzmGqvmeGfrDTHN1k/y6LAfkpH
	QAQnx41JrelIRv9A==
X-Received: by 2002:a05:600c:6287:b0:479:1b0f:dfff with SMTP id 5b1f17b1804b1-48715fd545bmr122044625e9.10.1774538532718;
        Thu, 26 Mar 2026 08:22:12 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48720925591sm16478935e9.25.2026.03.26.08.22.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 08:22:10 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-oe][PATCH 11/13] audit: Use PYTHON_DIR
Date: Thu, 26 Mar 2026 16:14:36 +0100
Message-ID: <20260326152143.2224099-12-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326152143.2224099-1-zboszor@gmail.com>
References: <20260326152143.2224099-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 15:22:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125750

Use PYTHON_DIR instead of custom constructed paths for FILES.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta-oe/recipes-security/audit/audit_4.1.3.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-security/audit/audit_4.1.3.bb b/meta-oe/recipes-security/audit/audit_4.1.3.bb
index 12636045d4..21dc9cef70 100644
--- a/meta-oe/recipes-security/audit/audit_4.1.3.bb
+++ b/meta-oe/recipes-security/audit/audit_4.1.3.bb
@@ -65,8 +65,8 @@ FILES:audispd-plugins = "${sysconfdir}/audit/audisp-remote.conf \
         ${base_sbindir}/audisp-syslog \
         ${localstatedir}/spool/audit \
         "
-FILES:${PN}-dbg += "${libdir}/python${PYTHON_BASEVERSION}/*/.debug"
-FILES:${PN}-python = "${libdir}/python${PYTHON_BASEVERSION}"
+FILES:${PN}-dbg += "${libdir}/${PYTHON_DIR}/*/.debug"
+FILES:${PN}-python = "${libdir}/${PYTHON_DIR}"
 
 CONFFILES:auditd = "${sysconfdir}/audit/audit.rules"
 
-- 
2.53.0


