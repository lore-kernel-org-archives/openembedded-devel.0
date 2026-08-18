Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5631CC5DF67
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 05:02:39 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2352.1787029358846018989
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Aug 2026 22:02:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=NB5QfWnc;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso34812185ad.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Aug 2026 22:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787029358; x=1787634158; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X/GvHigZ2zoRxsO5d283zZa27ZIQ2/GHwNjlXZXInBE=;
        b=NB5QfWncSgg8t9Hue1g3zD+Gdi83zVKinuxYUWyGjHl1bHfXamA53bYXPNqOQCgPwV
         IEmKA7q+sElfBvDCDfmauL5S0MV+2sOYW4gJ1qskHSOdye7WCbiT9xtHkIh5enPk3v+m
         1rL4k5p+edSHNvsJ65hDOX/WowV/O6ne4dFM7NEJvzC810U/H82KnejDlFtThRX+ljwk
         qgC4visf4Z8oD6jgCxC7e3/xQQrZmpSN9Ixn+7+VyxA5I9mpXrCnGuqf++G7sql2/6L2
         3NBnlZ/UKA8VxIub4STo37/OBfoeI0Lvhf5FYKDXBH7f8Qe73I54LT/W8jO/hUXyv0wl
         R/fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787029358; x=1787634158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X/GvHigZ2zoRxsO5d283zZa27ZIQ2/GHwNjlXZXInBE=;
        b=SubyX31l0HjiFIyt9U0t8Ap7iVHZT90krvOwjV4jmD3p3jFheTo3qU/BNBh+hP0IWK
         yUyWXkU6yZczCkQhkKQKOXGD0JXzlfmrfes47wnPW7cvmF4GfsK3apf12sfgujyVbwWK
         4OE2C4z4/InetrJBtBGRAchaq9MxdfHRrm3zLhTpRvNokijqeX1TQ207kvJ8EiUFZjsu
         hBM4GelnHn85ZZZBkxL7iYhLsNdiqeZQ91wwOpaN4hQQ4ZVzwGqgmETKt1O59Utyx7S+
         FpL5n5b1hvvzDhi72p1H5KMqLXDxLknlp6+jflNHkeyr4aXPLutkfAWoFlt9BR56TXEw
         DV+A==
X-Gm-Message-State: AOJu0Yy+UO1A+J0iHAGug/oc3zGhgB38v8PK5NypP2RnxlKKeLuNPgQP
	CgKR0MVjIHi7TK+59kKFV0/DRfy8LdspWJ0TlaV259u4yKnrSDnKP75ny+HSgg==
X-Gm-Gg: AR+sD11e+VBZ8NW3W/C99EYn8r2q/tXeGRzYuaYzfQ6VqqGIUeUAFm5AP+d0JXAgV7t
	GBnMMzFJrWGdgWq8bYvRygXvPLBsuGHUTkCVHvw+UNASEjVO5fwjLQhDvXF2SePoLtVy6TcLn+w
	HXGjd9UwMu523d7rQem7OCDUqEpjrEgBDC5J2e4ztIwHLX0yR4IpCl0t9Tf2rjdEb5PtrBwgf9W
	NFualpd4z1hChaOHHYWrjkRdwC2cii/AeImGveWzId5xEIZWZEYVYbBPDbnj+H/GxPmO/7mBu1W
	4MaJITBm5nHLZIwdCprf5y63JMQN7wiCHJ1/j7HZryiguV0TjJoSeDqQ6vZcEhDUtvykPr+f+5Q
	psk660//cH4AmQGk3KvlrJ/iF/iiDB8eJnZwSADaHuoWmBV8s7O63p37aCFlp9OZSAaK73gK25j
	PFnLerpwjEdkBgj9kK7v+emG19tLZ4hYmYgRUD6pdw9OAkxwJdGoUUIdquiHbN+6BjY6dNKgMOq
	g==
X-Received: by 2002:a17:90b:5450:b0:37f:b0a9:1a68 with SMTP id 98e67ed59e1d1-3933b8470a1mr31390033a91.7.1787029358165;
        Mon, 17 Aug 2026 22:02:38 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3267be8e5c8sm12840095eec.16.2026.08.17.22.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 22:02:37 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][PATCH 22/27] nftables: add UPSTREAM_CHECK variables
Date: Tue, 18 Aug 2026 17:01:17 +1200
Message-ID: <20260818050123.2901739-22-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818050123.2901739-1-ankur.tyagi85@gmail.com>
References: <20260818050123.2901739-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Aug 2026 05:02:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129221

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Fixes:
$ devtool latest-version nftables
...
INFO: Current version: 1.1.6
INFO: Latest version:

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-networking/recipes-filter/nftables/nftables_1.1.6.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-filter/nftables/nftables_1.1.6.bb b/meta-networking/recipes-filter/nftables/nftables_1.1.6.bb
index ea42b74615..9567e8f8b9 100644
--- a/meta-networking/recipes-filter/nftables/nftables_1.1.6.bb
+++ b/meta-networking/recipes-filter/nftables/nftables_1.1.6.bb
@@ -17,6 +17,9 @@ SRC_URI = "http://www.netfilter.org/projects/nftables/files/${BP}.tar.xz \
           "
 SRC_URI[sha256sum] = "372931bda8556b310636a2f9020adc710f9bab66f47efe0ce90bff800ac2530c"
 
+UPSTREAM_CHECK_URI = "https://www.netfilter.org/pub/nftables/"
+UPSTREAM_CHECK_REGEX = "${BPN}-(?P<pver>\d+(\.\d+)+)\.tar\.xz"
+
 inherit autotools manpages pkgconfig ptest python3native systemd
 
 PACKAGECONFIG ?= "python readline json ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"

