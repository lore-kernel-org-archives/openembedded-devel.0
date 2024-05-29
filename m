Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3743C25B75
	for <webhook@archiver.kernel.org>; Wed, 29 May 2024 13:08:49 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web11.13651.1716988128127331343
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 May 2024 06:08:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UPu+EFOr;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-62a2424ecb8so18884957b3.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 May 2024 06:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716988127; x=1717592927; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iqwoVCyV4LGeEfmfRKQ/jGC+F6fd0V03wwAm5HFmay8=;
        b=UPu+EFOr6n8Q2WBSGMn0Ys5BQ/XW2IKpEVNsda+Tur592oU2c49HKFQslSbqXAL67w
         YVoh0UxWd+znrv5DlxIt75ETjO11DWzOnrKQ+x9h1hQiAxsO/Eko6QI9pgrIk6gmJ3zQ
         xADezVc6L3Gkcbi5zI+HTRajoqkQUBuhn2JGmIvtNRecSh8ywg5jUV63J+B5R/chHzJX
         I5+ZXLv6/WvQRz8WJRVlAL0AI9DYcjc3Kgp4503HkkPdF/Afr5sSMOL2rU8XqzRNYOP0
         t9BzMtbGVhl1a65ojmZAY256Vzc39EpmkxLTVBQueMMlxfUfNv+EGlnxsQ9IhnW6Igvs
         1MbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716988127; x=1717592927;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iqwoVCyV4LGeEfmfRKQ/jGC+F6fd0V03wwAm5HFmay8=;
        b=UqV7/0NOOJEOnSBM/asq+A2Lp2GjIjQFRSenYb/BYSHWkYjXK70cp5JnaaQuP7sAOZ
         2dBt3Bpbi7kIkDGjmc8DxkHKXQwnNuhT8CE6Ed6k+ykLWsCtV6wiI3JDCyOqFrcN34VO
         jR4O75VYehJwrND5qIzBCFZIb7o7paKDj9JYTzodxOA+pwat7zC8pLbq9nYKoe0e6IRN
         tz1WhY/uq9yCgSKhQHcmJzvZUFj5JF2Dg5/PFPCDsT+T5f5Dj5yzoYXe1PsDjAj1KdTp
         cBn7PC1eOe7O8bpwNrI6TqwazbvFCH8DHRKLrWm5zubXMniou+8LLmx4SeffiU1NNdC9
         E/2w==
X-Gm-Message-State: AOJu0YxE3niVBvnXBlnm/MVxtmEJJni8VcBemYbv98UuzvGu3yd2EQ9q
	l50v63rjwyOc46GqXCgEcGLSlnuWrGQ+E05V5Qfb8N0Fi6qzGmk7K6XygA==
X-Google-Smtp-Source: AGHT+IHpFyqg9PWf2hMSz5kXlI9UBgrpRWWw159VwyKWjC87IJHIAn8F8aqkuvl4KDrwKwMLYQ+30g==
X-Received: by 2002:a81:ac19:0:b0:61a:e947:5518 with SMTP id 00721157ae682-62a08db771cmr156147807b3.27.1716988125620;
        Wed, 29 May 2024 06:08:45 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000:dd3d:99c2:7ea0:3dfb])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-62a0a52e99asm23950867b3.109.2024.05.29.06.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 06:08:45 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>,
	Alexandre Truong <alexandre.truong@smile.fr>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][scarthgap][PATCH] squid: workaround a build failure with native gcc10
Date: Wed, 29 May 2024 09:08:44 -0400
Message-Id: <20240529130845.2855422-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 May 2024 13:08:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110613

From: Yoann Congal <yoann.congal@smile.fr>

When build on Debian 11 (gcc10), squid fails to build[0] because of a
bug[1] in the configure step (it mixes options between old native compiler
and recent target compiler: the former needs the std=c++17 option, the latter
doesn't).

The workaround is to force the "-std=c++17" option for the native build.

NB: Our Buildroot friends have the same workaround[2].

[0]: https://autobuilder.yoctoproject.org/typhoon/#/builders/155/builds/23/steps/28/logs/stdio
[1]: https://bugs.squid-cache.org/show_bug.cgi?id=5376
     Bug closed as invalid by upstream
[2]: https://github.com/buildroot/buildroot/blob/932b52fad87d79d9f26a343edafe2981079de16e/package/squid/squid.mk#L24

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Reviewed-by: Alexandre Truong <alexandre.truong@smile.fr>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-daemons/squid/squid_6.9.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-networking/recipes-daemons/squid/squid_6.9.bb b/meta-networking/recipes-daemons/squid/squid_6.9.bb
index f0663a5e04..33d286e122 100644
--- a/meta-networking/recipes-daemons/squid/squid_6.9.bb
+++ b/meta-networking/recipes-daemons/squid/squid_6.9.bb
@@ -68,6 +68,11 @@ EXTRA_OECONF += "--with-default-user=squid \
                  --with-logdir=${localstatedir}/log/${BPN} \
                  'PERL=${USRBINPATH}/env perl'"
 
+# Workaround a build failure when using a native compiler that need -std=c++17
+# with a cross-compiler that doesn't.
+# Upstream issue closed as invalid : https://bugs.squid-cache.org/show_bug.cgi?id=5376
+BUILD_CXXFLAGS += "-std=c++17"
+
 export BUILDCXXFLAGS="${BUILD_CXXFLAGS}"
 
 TESTDIR = "test-suite"
-- 
2.34.1


