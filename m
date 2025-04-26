Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09DDBC369CB
	for <webhook@archiver.kernel.org>; Sat, 26 Apr 2025 11:56:51 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.7494.1745668607941716950
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Apr 2025 04:56:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=llpqLM/L;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5e677f59438so4677535a12.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 26 Apr 2025 04:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745668606; x=1746273406; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QCCXp/auKoWG6SrKuxlhjwLT4ZwGXbGKXubwI909/LM=;
        b=llpqLM/Lm+HVuLmmT2L/vrF81a4i9FiYHcN+prNZE5BVTdeDvkNHeyrcjREATGH1Nk
         0AVb3K0cMXi2zcbLzxuX3hFhMRNTkzvWJ5OvvsyLDJYNcFtSJXbMPJuYXB+iHfcPlsbr
         cYSAQIgpq4/rOg+YAcRfXjXayPppoV0F+gwQ5CYYUm0xNXT5EWO55PsBf4KEBkq9Fa1+
         BV/qgbgcLWjvPuhjNEn/aHxq++PufSQj16Nm60g5nrqLUWnPESXLYNhyLjBSi+FY64V6
         1AQ7Cibo8xHR2auLKRCwYUDWD96KDZy5P5f90tsuxpoFFU/UszUIe5BVVlqTfRCpuqdg
         cbZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745668606; x=1746273406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QCCXp/auKoWG6SrKuxlhjwLT4ZwGXbGKXubwI909/LM=;
        b=BIsBh8cutzZk2d2l8bIR/+a41GFVr4w1jzFDxy6jA+yUG3G1PMbxqRuIttOjFHliPh
         uLWZMq8AUl2Rziz6X7+liEmJHNG1XX1ZZRUEYXriyCVnhNGDW4mTjmBj8JUXK+dInWwn
         JxnIeFjF1gf5bcB9lwnJYjYpY5nfagZ2kUg182i6ThFGy/+yfQyzA2D8MVtl0ogv5AJY
         PWYNSaHHy69s2yxK65h5ccmUoqk8jhyYQipxdTLYk8v+G3GMHlX1CCDw20Rj0nlEMlT3
         EnfXOnfcc3Lz2SewzoV4qMPwQmylZuGqk3oDrXSg7GzKjoFeDW/TKUHjK2TWvJ8cXS0E
         AL6Q==
X-Gm-Message-State: AOJu0YyDyDnEbYqD5a48olZ93jTrchUCjTxM598vzTvCW4FL2eCIXflQ
	wC5xdMswUG737Zaoid8M5CbqwVroaw2xzk52XaXwfscBqNcVOU91pZMWqnw5
X-Gm-Gg: ASbGnctZUbzlaKYlxGvxP1JsIBzeqpU1H5NimcEXk1J9tyHRtzm7qQppJifP/04IULT
	lYMmbtpflATADs591VxuRgkajMegz5ToveijOgkx8UwL9GYwSP3kg0Qo6lwjxf8bpwQBfYTj0jV
	B3M/lCaz/XZzfEV+WT4Fsmg7SWy3KXw+f8HO7dB5LdUdqoFSw2CKaYKCJES7ddjtQeWEbh2mzMp
	6vzuvWYpT4wp+c2UO+YtuB+zMnUMQ4s1nT6N1A2i+1MSRjKQtlrZrpA7mcjKScA1PEZKgo/yE/G
	IggqTs9t1v+npJPDXikr1kfuXoTB+zQNr8Kutv3ti/CIzUlYrTe9aTKWeBaOItksficM+tmsXg=
	=
X-Google-Smtp-Source: AGHT+IGGo3pF9hy9/+Uax0/0UfRYFcD+nEMJ4xAEUIQ2vlST1dGno9kUbBsqFegaPHEFo91XfQolAQ==
X-Received: by 2002:a17:907:1b22:b0:aca:a687:a409 with SMTP id a640c23a62f3a-ace71098d4bmr513128366b.17.1745668606090;
        Sat, 26 Apr 2025 04:56:46 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ace6ed704bdsm280532566b.148.2025.04.26.04.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 04:56:45 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH 8/8] fetchmail: upgrade to 6.5.2 to fix build with gcc-15
Date: Sat, 26 Apr 2025 13:56:23 +0200
Message-ID: <20250426115623.2732743-8-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250426115623.2732743-1-martin.jansa@gmail.com>
References: <20250426115623.2732743-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 26 Apr 2025 11:56:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117149

From: Martin Jansa <martin.jansa@gmail.com>

* fixes:
  http://errors.yoctoproject.org/Errors/Details/852999/

../fetchmail-6.4.38/xmalloc.c:35:1: error: conflicting types for 'xrealloc'; have 'char *(char *, size_t)' {aka 'char *(char *, long unsigned int)'}
   35 | xrealloc (XMALLOCTYPE *p, size_t n)
      | ^~~~~~~~
In file included from ../fetchmail-6.4.38/xmalloc.c:9:
../fetchmail-6.4.38/xmalloc.h:28:14: note: previous declaration of 'xrealloc' with type 'char *(void *, size_t)' {aka 'char *(void *, long unsigned int)'}
   28 | XMALLOCTYPE *xrealloc(/*@null@*/ void *, size_t n);
      |              ^~~~~~~~

COPYING was updated (copyright years update and openssl note was dropped) in:
https://sourceforge.net/p/fetchmail/git/ci/62a11ca4064e5b59e57ca7a8fce08c82af259731/

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../fetchmail/{fetchmail_6.4.38.bb => fetchmail_6.5.2.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/fetchmail/{fetchmail_6.4.38.bb => fetchmail_6.5.2.bb} (85%)

diff --git a/meta-networking/recipes-support/fetchmail/fetchmail_6.4.38.bb b/meta-networking/recipes-support/fetchmail/fetchmail_6.5.2.bb
similarity index 85%
rename from meta-networking/recipes-support/fetchmail/fetchmail_6.4.38.bb
rename to meta-networking/recipes-support/fetchmail/fetchmail_6.5.2.bb
index cc23d5a34e..c1def016e9 100644
--- a/meta-networking/recipes-support/fetchmail/fetchmail_6.4.38.bb
+++ b/meta-networking/recipes-support/fetchmail/fetchmail_6.5.2.bb
@@ -6,13 +6,13 @@ connections). It supports every remote-mail protocol now in use on the Internet:
 RPOP, APOP, KPOP, all flavors of IMAP, ETRN, and ODMR. It can even support IPv6 and IPSEC."
 SECTION = "mail"
 LICENSE = "GPL-2.0-only & MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=ee6b9f41d9324434dd11bd8a38f1b044"
+LIC_FILES_CHKSUM = "file://COPYING;md5=46d2874dd6a0c8961d80c805f106a35f"
 
 DEPENDS = "openssl"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz \
            "
-SRC_URI[sha256sum] = "a6cb4ea863ac61d242ffb2db564a39123761578d3e40d71ce7b6f2905be609d9"
+SRC_URI[sha256sum] = "8fd0477408620ae382c1d0ef83d8946a95e5be0c2e582dd4ebe55cba513a45fe"
 
 inherit autotools gettext pkgconfig python3-dir python3native
 

