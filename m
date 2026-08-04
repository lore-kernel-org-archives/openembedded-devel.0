Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 801BEC56202
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 19:40:31 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24966.1785872421807402588
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Aug 2026 12:40:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=PeDHOO1S;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2cab973140bso3131615ad.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 12:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785872421; x=1786477221; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pxXvKwlP9XEE4cYhsIPhtxl0/HY0hPQCx2BYV7YgpWY=;
        b=PeDHOO1SNpdGKkiTqzLQjabFAZGZ/tU3SjNNL65NgVw2ZJwm5R7Xx7ZCgJPG5SWYj8
         b2No9D8U19FpXsnDsrXCbzV9Q+qSqvSJLFoYr0Oej19D/Kn0Vtu+k+Se8Nm+oA8+u7J4
         8FpJ+DUt3sVLmhvMlAePDQvtGF+lUaSTAhNWOvvD84/xOr93Fis29uPSWaofj5+pfYK7
         ZwevxjiDqTqi//I+ijiQBbWUdoYA9TLq8S9v8O13P/sJFuAUHxKcDnnM2OmeSZQpvDQV
         4xuCF/zj2dSMfMUy4pU/bBn21DhI0caDbl4Fa3IG5TEpV5HhEXCbAn61eRhMQUdD/4fc
         aKFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785872421; x=1786477221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pxXvKwlP9XEE4cYhsIPhtxl0/HY0hPQCx2BYV7YgpWY=;
        b=FH0CPou1/FOmTQFrbFhNX1ObGkuwcpoA2kQv9CiotKwvk1uNYSBqBe5bfxr41gSjDk
         0+OT4w5txaaT7V3ef1ABoAn95KZCYXgPfwdnNwQRX2CO1FbXw30Kpre+0OPzvP0a1NrO
         dyLb4zDc7KnQd3dpovFuXyZL3NEEQNzf4mGcHiHqQ6x5el3RXYiQDkac1inPcuGfJEWJ
         ZkuEAx1HLVj55vuXwpcD0lcGFbqC+hObu0R8jl9caKaea46+fBCoa1VBAaSENcnv20KW
         BBpMVbLpZWzCCO0bhR5pCuch9ZzEc5LgxzJ8fyCztBGvjlXtDk9GWBx5ZpOYMy0jrnFL
         7OjQ==
X-Gm-Message-State: AOJu0Yxs/fb5ezAFsinxVlag+E11NQTOf5C+NSiQEDtQtl0NF9NMaa3/
	56eWYDm2/lBVNJ5HQNUYohBc3wxjnbSGq+paW1PvbmPypX3oT7ypEkDWlcZW3Fs0
X-Gm-Gg: AR+sD10j3hA8qWdUernkYo3cMBsylXoGX7BPn5tHRRAQU3Otav1NBQbI3jixjA34T7B
	v7nKuFgWCM0sMxTRzh/lJFU/Z41eCQ1hUlSKI9qPrJR7E0jl1yObMcrtW/r7+YaPaAK9rOS2BNX
	JmXEYpeIZ7prVac7ZmCJjQZnoUc+Vf5DmgsUD+6dCtgHjG7olLJKVAep8WTsJbldh7BSu+epMaA
	hfne48FTECsxv8gguZND7jsfpWqi3du9gi3esT64ja0yh1IDV8mynr0yHfnc4EAoTwKaIYye/px
	LRmKwAM766fVMdl0h1S4XyyqpylUQZK6gzaf5SvNUoCqTDFoQq5sp3Q3309Zylw5UvK6odW5M+H
	LdKLMrGycSDTePdyzTXabrNyzoxAohYzY5N55ddSFn3Zqriq2XnS0+CZe/Eaz3G/GAqD7fDm0uX
	tlWiZMknlfLZveTi7lI/q4CYKsA9lpKCXV0sOcygIi9wUFsBgexjIt1vuCVXRGFFQr2Ki1Zunfy
	g==
X-Received: by 2002:a17:903:1986:b0:2c2:be43:39bc with SMTP id d9443c01a7336-2d0ca9feeb1mr12879265ad.22.1785872421009;
        Tue, 04 Aug 2026 12:40:21 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3158673b7f4sm8156417eec.17.2026.08.04.12.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 12:40:20 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 4/36] dovecot: upgrade 2.4.3 -> 2.4.4
Date: Wed,  5 Aug 2026 07:39:31 +1200
Message-ID: <20260804194003.3158916-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260804194003.3158916-1-ankur.tyagi85@gmail.com>
References: <20260804194003.3158916-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 19:40:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128751

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 05fe4e2bfc5a1b278e367b355e601c81183eecf2)

Changelog:
https://dovecot.org/mailman3/archives/list/dovecot-news@dovecot.org/thread/YW7GVOH3VVLNAYW2C4TEBTGJW52J7F6H/

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../dovecot/{dovecot_2.4.3.bb => dovecot_2.4.4.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/dovecot/{dovecot_2.4.3.bb => dovecot_2.4.4.bb} (97%)

diff --git a/meta-networking/recipes-support/dovecot/dovecot_2.4.3.bb b/meta-networking/recipes-support/dovecot/dovecot_2.4.4.bb
similarity index 97%
rename from meta-networking/recipes-support/dovecot/dovecot_2.4.3.bb
rename to meta-networking/recipes-support/dovecot/dovecot_2.4.4.bb
index a6b78ea781..6cac8de964 100644
--- a/meta-networking/recipes-support/dovecot/dovecot_2.4.3.bb
+++ b/meta-networking/recipes-support/dovecot/dovecot_2.4.4.bb
@@ -16,7 +16,7 @@ SRC_URI = "https://dovecot.org/releases/2.4/dovecot-${PV}.tar.gz \
            file://0001-m4-Check-for-libunwind-instead-of-libunwind-generic.patch \
            file://0001-adapt-lua_newstate-to-new-api.patch \
            "
-SRC_URI[sha256sum] = "ff0be85228122f250627b19e67505fdb7fb2f72a702ef6bf35f27fce54c072e5"
+SRC_URI[sha256sum] = "670f98d55a29b02ae6a97281e51374e553b94496480ab0a07439571ab30ca8c3"
 
 DEPENDS = "openssl xz zlib bzip2 libcap icu libtirpc bison-native"
 CFLAGS += "-I${STAGING_INCDIR}/tirpc"

