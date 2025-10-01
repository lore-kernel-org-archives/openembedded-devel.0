Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39D08CCD180
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 13:53:08 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.18629.1759326787358446548
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Oct 2025 06:53:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UzCAy9nL;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6366b7fd337so3319895a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 06:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759326786; x=1759931586; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qi0BdUuThumtVJGKRq+m3Cr7oQQonE1b45uO4nNKy/g=;
        b=UzCAy9nLTvpuB/q3BjMuLo3uUNcht09zhm4y7q2Rn8VQiNweHxKKf3WZDc4hg0qT27
         ZVOVypy6rcet4MAnzABsu4kWqomjOZ1G/jsQYi+PxAi+go3HseVULMiZC/bW691c0H6t
         xVlYhwro/gD00x9FOvqDq8IL9JE5BRr3cGoZTKdAsnAV+rel01FzFV6IagCy7tyiUElk
         2uFlNkm+ueRsj7k4qalaqsf2vwFDF6XkBZ1u4NtA1PeWFPmyIoZz71ovJY/fu8kUEcEg
         XXBtpKj9Tdey63aiC7bLbCnVoZqmwUJdjPvTJ7aDo6SheXqYQO58KTtamMCCTtElCQFh
         xwCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759326786; x=1759931586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qi0BdUuThumtVJGKRq+m3Cr7oQQonE1b45uO4nNKy/g=;
        b=i5kDWWWPLdUsjPq5UY3ExhrpPbyBm/GIt26/8/8RqASeX9unmSgI+yda6pqX+2L/of
         Jt4roc2l2MHjmaRpVs0uUc0vepSW9ZGLir2nUpJDDgZ0+5pqJLPwpzy5q91lxyBpNlPD
         QYI5au7GLpK/fskC1gC+Gv7WAo+h2G8YTpG0UdL0FsxLVy1QxgIoSoO33Qk9u6QI7TfD
         QymWPCixVF3/4kA3QF5RWxiSlrkq4mrSU+jzFC72uKh++kiCuxL2Az8JNQx593MrIqLW
         RHLEyw2RV5XN/GOcacQnHSuY0+0l1QQxLSLhHDWVDOED3MVyeYXZ5bdI0hTttgOow3SM
         yAYA==
X-Gm-Message-State: AOJu0YxE3lLNN+jVy/9pQ1ipZbQt14xQ7JTRtGX+tD8Dlzl9UHHKwvTM
	F4rqOZTCOPYexOfPpdPjo1P7sa+JmHwSqeY8IU1682daEzmMqkxgnONhLNq70w==
X-Gm-Gg: ASbGncvo2nzDnlVOi57ugHuvGNXaEDBuLCxR9pYgV9BA0NH0KuqdEhTNJ4IB3Rbvfyf
	buNeaAnRNhTFY4Im6FjPZN1dNu+hU6GDmqsY+vA+RcCzkTZ/H2D/JVenOdSnJHcQU+trZpjJNZ5
	+ciN44qBrkaxyqCgcvOjrscjSJg74XQcAxVpxhwVTcQiKQNffOaIs8Jl/vyI/A0v9ZysBeHoVS5
	reYH9TXlSuY0FxvrCOXtZfSfURfA5KHUGWh6de7hZeRAe6T0bvf1OSH+VlnCn8Y399lr345wE+7
	oj+PNfIEJX4UT2a2ozgg5Fet8SbwXnMlbWCZ4+wYb3jBEuF7hEaGMUxsPfnJmsoAxh1Uq3FsK0A
	eIRov2oderK2ZJnOsqZeTGkBQaqaB3gKdrPBu92w04wbT2O14OfndgmY=
X-Google-Smtp-Source: AGHT+IHUbc1DbrAruRVR1ubqUZwHOQ75rQzrgI3p3uDU7YIBtbQc9xxhada/0+dheNaVXHL0MMSYLg==
X-Received: by 2002:a17:907:60d1:b0:b3e:d492:d7b8 with SMTP id a640c23a62f3a-b46e6dff602mr444203966b.64.1759326785575;
        Wed, 01 Oct 2025 06:53:05 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634a3629badsm11507823a12.9.2025.10.01.06.53.04
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 06:53:04 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 24/25] nmap: add missing dependency
Date: Wed,  1 Oct 2025 15:52:42 +0200
Message-ID: <20251001135243.1490753-25-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001135243.1490753-1-skandigraun@gmail.com>
References: <20251001135243.1490753-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 13:53:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120139

Building with ndiff PACKAGECONFIG failed with the following error:

|   File "/yocto/sandbox/build/tmp/work/cortexa53-poky-linux/nmap/7.95/nmap-7.95/ndiff/setup.py", line 11, in <module>
|     import setuptools.command.install
| ModuleNotFoundError: No module named 'setuptools'

Fix it by adding the missing dependency.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 3564ec12de4b5ed470e75a9e045adc6bec83c74d)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-security/nmap/nmap_7.80.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-security/nmap/nmap_7.80.bb b/meta-oe/recipes-security/nmap/nmap_7.80.bb
index 52c62cde30..072d729849 100644
--- a/meta-oe/recipes-security/nmap/nmap_7.80.bb
+++ b/meta-oe/recipes-security/nmap/nmap_7.80.bb
@@ -30,7 +30,7 @@ PACKAGECONFIG[libz] = "--with-libz=${STAGING_LIBDIR}/.., --without-libz, zlib, z
 #disable/enable packages
 PACKAGECONFIG[nping] = ",--without-nping,"
 PACKAGECONFIG[ncat] = ",--without-ncat,"
-PACKAGECONFIG[ndiff] = "--with-ndiff=yes,--without-ndiff,python3"
+PACKAGECONFIG[ndiff] = "--with-ndiff=yes,--without-ndiff,python3 python3-setuptools-native"
 PACKAGECONFIG[update] = ",--without-nmap-update,"
 
 EXTRA_OECONF = "--with-libdnet=included --with-liblinear=included --without-subversion --with-liblua=included"

