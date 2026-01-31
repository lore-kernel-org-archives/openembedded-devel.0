Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBFF3E7C6F2
	for <webhook@archiver.kernel.org>; Sat, 31 Jan 2026 21:56:50 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18480.1769896600852532853
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 31 Jan 2026 13:56:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=k2leIKJb;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47ee0291921so29705085e9.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 31 Jan 2026 13:56:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769896599; x=1770501399; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=/Lsqz6Ss3TXq/42IkTsAzKXEJYPqGTBJJDTVyfdjwmg=;
        b=k2leIKJbQATxlefJhoLWati3m//NsUdS85W2VXaRPBu3fv+Ulooh5H+7w0WtR80AZu
         qTpWftWUblUrjAhHijvpdJRq1PyWxIw2BjHGpf5zHzfiQIHDEX6tAwO/mI/QAWCobWan
         MkHgOmXjnd32vuO+3JxvVmUXqbP5RZ3gIRd/7tSrtcT19p6Lp9BZffvrSOnC8G1/dEti
         AxSAT2n7y9A7MtJ56uUQNWeHumBpYyg3v5rloBPi+rzXi4YHTo+kdk4sAHwBar4y8FAY
         3YkR1hoCMdyDUnItWmRMCbiszmm/uMsJin6UJ85+1LTP1m3cq2LnrvY6m8dF8Uy+cftI
         YS3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769896599; x=1770501399;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Lsqz6Ss3TXq/42IkTsAzKXEJYPqGTBJJDTVyfdjwmg=;
        b=CtHp4/Z4LNTOayQktx2n21bRXbMTTaskl5wGIa56W4liHY44Riqd0aY/FpU512vYSv
         33z0m9tQ5dzMqMJhegOiKDqCgfaH6Vcxplrb1Z5mrgnFaJSJaJdyZDCxcZ3QVpehPnW5
         cb3UhKEdw1+lZCim1T1jEmyOCRfB/D4VAmvsv6LDqV6HjUkMlNsfdSmNG/WThphn4FYo
         3lqxZ14BUijeBWBPZksPWkKWPfEheD3gX2ljgmgOrI6h9gQgLqmA8PlnYLm7rMVh8eJ9
         XhMnIZ4kZPs06dMUkFZZ6WtxLNonPkRtk9hlmTXqyhEZOuaXDB5MEBq3c+XULlccniTr
         J9RQ==
X-Gm-Message-State: AOJu0YwVPNTKAj6Q1BVu2RuehCk7ZKMAr5mvqBoMA95Royye9pN4jS5m
	Ev1ls8eN06kgxGHR/KzhqwPGIhcVhjML50AAXm8lFrwxrVW75+9koXm4NJaMcg==
X-Gm-Gg: AZuq6aLozl+1xQB2ln1SqUsHzTyCgjyt6hvJNnf94gS2vQWz4YzIP8J0izTNRHoYEg1
	aRyGsHlhVPTc3uCKTB/yYQ273k/Sw88/Qq3k/DkzjXSFC4+ngR9ji6kQeBdDYK45EnIITJyx44V
	Ie9upq0GUa/OF2uBbWaxQugSpZt2OeWdB3BcNg/SEySYXT48cpDxI0yMZbNRNxc6MXAQU+SccD+
	SisPIvtgsbFAJYxzGdP/uyM9HAlk4C04rlwTUF8cCucBNWEkJrlpCtYRT3+wm3zjpkYZldrJtCU
	Llf/kCXypElgxyRWOIsX7Zm1ierSSbmtOJTqxuSvn34e11ftr9Tm7i2KldN854pQQeJFAJQM2o7
	VHbXIWkQDEAHqHeiCOsKAA9OxTdkb68GRMhjiZsB3ALxQUQzBomHRcxIPdE+XhFc3D5LSyTMoeA
	VxH3wIe17l
X-Received: by 2002:a05:600d:6409:20b0:480:1c53:2085 with SMTP id 5b1f17b1804b1-482e6668178mr42858085e9.19.1769896598902;
        Sat, 31 Jan 2026 13:56:38 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806ce56490sm276840065e9.12.2026.01.31.13.56.37
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 13:56:37 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 0/3] Update and split mime-support
Date: Sat, 31 Jan 2026 22:56:33 +0100
Message-ID: <20260131215636.2633863-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 31 Jan 2026 21:56:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124020

The mime-support recipe is fairly outdated: it ships a 7 years old
version of the package - Debian even stopped storing it on their server,
and the SRC_URI was inaccesisble.

With version 3.65 (in Oct/2020)[1] Debian has split mime-support package into
two subpackages: mailcap and media-types. With that they also stopped
maintaining the mime-support package (baically it is now a package
that just depends on the two new packages).

This small series removes the old mime-support recipe, and adds recipes
for the two new packages. Made the media-types recipe to provide mime-support
still, with the intention to avoid breaking recipes depending on it.

[1]: https://salsa.debian.org/debian/mime-support/-/blob/master/debian/changelog?ref_type=heads

---

Gyorgy Sarvari (3):
  mime-support: drop recipe
  mailcap: add recipe
  media-types: add recipe

 .../{mime-support_3.62.bb => mailcap_3.75.bb} | 33 ++++++----------
 .../mime-support/media-types_14.0.0.bb        | 39 +++++++++++++++++++
 2 files changed, 50 insertions(+), 22 deletions(-)
 rename meta-oe/recipes-support/mime-support/{mime-support_3.62.bb => mailcap_3.75.bb} (58%)
 create mode 100644 meta-oe/recipes-support/mime-support/media-types_14.0.0.bb


