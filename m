Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8045CC636F3
	for <webhook@archiver.kernel.org>; Fri, 24 Nov 2023 00:01:12 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.120985.1700784065419848866
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Nov 2023 16:01:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nAwDlR3r;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1cf678043fdso11200235ad.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Nov 2023 16:01:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700784064; x=1701388864; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S7dh33kUptNw5VUc0snrWXpwdMZ4F+thEfkPdmSpPDo=;
        b=nAwDlR3rtwJeKZ+l2qbTsISKjzGbD82hyy4GxATmEd+JndXhDt+B8BbVJ6AbN89xYW
         U37ZhQejBPl3y0K29D7zSwM9P0n7plZc8cgY89LiJmdBkJ15Y0IUFA5Hh9kArHQcxbCr
         Qe37jJS5qYsCzAlq94F6Bops1xKMDZyMow/U5CPlfwxV5mQ1gXiflFS1B+HeQXA6cAmk
         dd4WvBWHz6Sq/0i5z3lje8i+LvcyrsooaTaqsisBQy2gwGN1LmJoyO02M4ZaSTREiTr8
         pW1+p8Fq4bR/U1AfOMkUFDnFeswdxQzrsjQQXOuY73sEeV65DdV61ta1kOZI/OZDEuPB
         VWCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700784064; x=1701388864;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S7dh33kUptNw5VUc0snrWXpwdMZ4F+thEfkPdmSpPDo=;
        b=OAOrMZ3XDAyX6GjlHdQLL4lNW514s4cGRKMERi8YGgWeOoD5PQuaBUVKFXSmr81IPX
         RlaIMhzCOlTA9l1W42Sw+KMv7GJ/4rzMdxdcW98YLoxcqV4gyhmx9wAqo9G0fmlta5DF
         gMfzT+wzB8RjYR3PQVSZ2Mfftn46/95KxRyTufMteqp3kgz8/mt9NKUPAcdI0swhNEKT
         B9QWpQo+bMWx1tMSA/ZTWc85S66UeejiQ22UWUQaJ5rimLto0zxvCK8ErF4gEWHwgJsz
         3k+ZgjRzs6kkNd7UMrN1svK780NfdmHjb/9n71WIa/H4RqHqX2L8p7To4T+W901Pc/mI
         U0NA==
X-Gm-Message-State: AOJu0YwnSXbRxs2UCTVx02fKME4ctLsesQi8wAeBQ+5Npa+p5R7SFR/9
	YS2vIceF+doPBd4zm1vk/GHXQq3Lo9psLQ==
X-Google-Smtp-Source: AGHT+IEyt2cs1Ctg5UYKIJe3Q8UiSH8y+UgGL5mmSpOaj7XsRJ26iqQtnD2safG9EuV8/Kc+CVI4RA==
X-Received: by 2002:a17:902:d303:b0:1cc:4e81:36a4 with SMTP id b3-20020a170902d30300b001cc4e8136a4mr1047209plc.5.1700784064592;
        Thu, 23 Nov 2023 16:01:04 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::2c3f])
        by smtp.gmail.com with ESMTPSA id p12-20020a170902e74c00b001cc3c521affsm1903239plf.300.2023.11.23.16.01.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 16:01:04 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1700634135-7982-1-git-send-email-wangmy@fujitsu.com>
References: <1700634135-7982-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-django: upgrade 4.2.5 ->
 4.2.7
Message-Id: <170078406373.3118595.3040488505252278881.b4-ty@gmail.com>
Date: Thu, 23 Nov 2023 16:01:03 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Nov 2023 00:01:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107034


On Wed, 22 Nov 2023 14:22:15 +0800, wangmy@fujitsu.com wrote:
> Changelog:
> ===========
> -Fixed a regression in Django 4.2 that caused a crash of QuerySet.aggregate()
>  with aggregates referencing expressions containing subqueries (#34798).
> -Restored, following a regression in Django 4.2, creating
>  varchar/text_pattern_ops indexes on CharField and TextField with
>  deterministic collations on PostgreSQL (#34932).
> -CVE-2023-46695: Potential denial of service vulnerability in UsernameField on Windows
> -Fixed a regression in Django 4.2.5 where overriding the deprecated
>  DEFAULT_FILE_STORAGE and STATICFILES_STORAGE settings in tests caused the main
>  STORAGES to mutate (#34821).
> -Fixed a regression in Django 4.2 that caused unnecessary casting of string
>  based fields (CharField, EmailField, TextField, CICharField, CIEmailField, and
>  CITextField) used with the __isnull lookup on PostgreSQL.
> -CVE-2023-43665: Denial-of-service possibility in django.utils.text.Truncator
> 
> [...]

Applied, thanks!

[1/1] python3-django: upgrade 4.2.5 -> 4.2.7
      commit: 8f8c96e1ca7f3b3f1b84c62215cfc864dca24419

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


