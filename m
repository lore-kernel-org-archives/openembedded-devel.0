Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95E03EB64DE
	for <webhook@archiver.kernel.org>; Tue, 10 Sep 2024 14:53:05 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.25366.1725979975798250674
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Sep 2024 07:52:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DOK0luc7;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-374bb08d011so3261149f8f.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 07:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725979974; x=1726584774; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ggvJAy2lzL+tu7SDrQXjTYEq0YDS4kYmNixceWP7q4s=;
        b=DOK0luc7tUrJye9EgWyZnkhTeqAZoUVvVqTzIHwehKdrGBdcmQTufGwTWgnOVZ0FZS
         7pKrfeSZR/La5i/FXxVcT88I9AFk7Nn8+//J2jIJbnWehbbmnfFWQhBucUhhFLTicwEW
         hlUoBp4BecpLxDKiFbApPyJpxsSdJdNgA/YGfCyKJ9aXKt1Rixx9Sric8gromZRBSRBI
         prjotaDYAFXGDi3h0cUJ0oYmkuLtlu0chwefmILz2Ic9b8dunkh+lZUFs28Zbxx4TxdX
         Ru9UL6jCrZZGLMV/6qkIeZSybJ8O2aWBAIlek48bgBZrD/SFZQ/iIzNmkws28kwXj/kg
         lywQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725979974; x=1726584774;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ggvJAy2lzL+tu7SDrQXjTYEq0YDS4kYmNixceWP7q4s=;
        b=vjv1wmkTu+X4T7tzx9HLFA/Zu4ABv4W3dNBzyEkLh5c5iHYiUZHXay8rVd7EvpDsdc
         zA8CHqRVhZxYUXOw3eGT047oXXgYa/AoVh63ETM76hI/yB57GuzSdzHBJ4MVjkKd0cqf
         D+iOSBx127J+AWJeRR3wEJYXahJn/IgiT5yHlx3AgGKoNcEQ0TIO16jqgBWEfNYBxX+0
         Ip8BhuR6+tTBWpAJrDMXpZIllS1B2Id9gfa6N89l6nxsiZaQ1JypBHu8Nky2ekZd4Kth
         OEjRZYAAf+QiZr2wjTd+exvLqa+EyL349x8laELyqyYRsqdo5TvOCbLiT3BQocJ0C4zI
         xWwg==
X-Gm-Message-State: AOJu0YylGC6ByPTGF6ElX1lDsA8GOT2vffu1TZ3r2gGpVMZVe5Nti0Ax
	xj7A6vgLNpt3JIMnCh4yolMBlW32b2BWnQyq9MegOM6zHEZnIWukk9s0bw==
X-Google-Smtp-Source: AGHT+IG/kxUn1sUx9Fzv7xkyAo8sKogIOCnmt7LVArWjiNqYlp+0MpU5UOHbEuLpmLEhDGKsevEUVw==
X-Received: by 2002:adf:a457:0:b0:374:c0f8:1910 with SMTP id ffacd0b85a97d-3788960b63emr9195950f8f.31.1725979973140;
        Tue, 10 Sep 2024 07:52:53 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37895675b8bsm9180101f8f.54.2024.09.10.07.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 07:52:52 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH] nmap: depend on libpcre2 not libpcre
Date: Tue, 10 Sep 2024 16:52:44 +0200
Message-ID: <20240910145244.1238276-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 14:53:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112233

* switched to libpcre2 in:
  https://github.com/nmap/nmap/commit/828ab48764b82d0226e860c73c5dac5b11f77385

* in builds hwere libpcre2 isn't pulled by some other dependency it was failing with:
| service_scan.h:74:10: fatal error: pcre2.h: No such file or directory                                                                                                                                                                       |    74 | #include <pcre2.h>                                                                                                                                                                                                                  |       |          ^~~~~~~~~|

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta-oe/recipes-security/nmap/nmap_7.95.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-security/nmap/nmap_7.95.bb b/meta-oe/recipes-security/nmap/nmap_7.95.bb
index d3273dc4e9..79c28e71f0 100644
--- a/meta-oe/recipes-security/nmap/nmap_7.95.bb
+++ b/meta-oe/recipes-security/nmap/nmap_7.95.bb
@@ -17,7 +17,7 @@ inherit autotools-brokensep pkgconfig python3native
 PACKAGECONFIG ?= "pcre ncat nping pcap"
 
 PACKAGECONFIG[pcap] = "--with-pcap=linux, --without-pcap, libpcap, libpcap"
-PACKAGECONFIG[pcre] = "--with-libpcre=${STAGING_LIBDIR}/.., --with-libpcre=included, libpcre"
+PACKAGECONFIG[pcre] = "--with-libpcre=${STAGING_LIBDIR}/.., --with-libpcre=included, libpcre2"
 PACKAGECONFIG[ssl] = "--with-openssl=${STAGING_LIBDIR}/.., --without-openssl, openssl, openssl"
 PACKAGECONFIG[ssh2] = "--with-openssh2=${STAGING_LIBDIR}/.., --without-openssh2, libssh2, libssh2"
 PACKAGECONFIG[libz] = "--with-libz=${STAGING_LIBDIR}/.., --without-libz, zlib, zlib"
-- 
2.46.0


