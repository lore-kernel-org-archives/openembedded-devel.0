Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F2F3C43217
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 15:58:57 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web11.23294.1668873528683022039
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 19 Nov 2022 07:58:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SANFpr6X;
 spf=pass (domain: gmail.com, ip: 209.85.222.180, mailfrom: akuster808@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id d7so5422629qkk.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 07:58:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3hHqiHI2gn8fHWXADp96OuJb7JRD3VttEd7EdgTDD1A=;
        b=SANFpr6XvwrvhFEKhx+sG+iyHo4kRLgfAO1gcBvoekBAoGkqV8mevB8Pz6qQ0dm/PM
         oLy5NnJ1Tx1PsqnoVEeQSKF5d2lOfH9gUlSALXnaVwYjoFwdqG4VsRQPpnDzMFxJT9Cs
         ZF9UussW8YcuhZro8Z2Kmzfq7EQg5IEvnSiHhAoIkv7HbWV7Q8gyLLGQtiFBmVGH92Pj
         pnG35obdILdfpqNXkkLAqoZiqMgr2IT4Kr5KwjbHoUCx+85OqukXX2Ga6tVj3z4AWHi1
         lGz5PHA8Up/5FmYBiewWVN/EnP8dzN0wtqw+sEqKtzDCAf/yqOaLbljHjdh8FAmdDlTd
         v+6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3hHqiHI2gn8fHWXADp96OuJb7JRD3VttEd7EdgTDD1A=;
        b=Z8Rwsw5DberJ13BxztbcxkE8sBcepgrSz8llP+D5sM8A2dMG3dxwOZzxs699PV8UYu
         igfsP0k95WOpOGYtq6TahS+WAFD0LVCG6KpZhGBSKixIFFd4xayjkyy3YsqWUtx3GVET
         hdVojjybQhgBXAvGHx+SvuDJQdUIQkcj37G1Tmoh+WRtiVF9YRY047u+3zjoxh4fIcSY
         2n8k9QmYjK5V5fJPII6nO/IlxoACLXvB5x5vBpPULEBX70+FC36+/bHcKdQe91E9Fbdi
         NsUEQ77ZPK0Lkxyrg+KTqf/TJvmJrduLC4PGmdhmzIG5xZAk7a1wWytPsHclKJyI09HK
         A6dg==
X-Gm-Message-State: ANoB5plnE2ycdm2zN5aK7+uZLlMsSdivGYYZs/ijnc9akLvHimU9sE/K
	TEBIIbznnEFE0UHJT4+xDTk+CdYRv/YvcA==
X-Google-Smtp-Source: AA0mqf6oTY4bhNehQ1IXT0tJZ4bpu+muuYD+qOBf7iF6CaIN/IPCNN/HWc9P7eap3K9SSSAhxK5sPQ==
X-Received: by 2002:ae9:eb07:0:b0:6fa:2ee1:2975 with SMTP id b7-20020ae9eb07000000b006fa2ee12975mr10017724qkg.458.1668873527387;
        Sat, 19 Nov 2022 07:58:47 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:8dbe:f48d:8b1a:1569])
        by smtp.gmail.com with ESMTPSA id c7-20020a05620a268700b006fb112f512csm4821314qkp.74.2022.11.19.07.58.45
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 07:58:46 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 30/35] poco: upgrade 1.12.2 -> 1.12.3
Date: Sat, 19 Nov 2022 10:57:54 -0500
Message-Id: <258c727969bb7f3170128ca1b2e42a1a625cc9a8.1668873377.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668873377.git.akuster808@gmail.com>
References: <cover.1668873377.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 15:58:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99669

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========

- GH #3682: Including Any.h causes Compiler error on Visual Studio
- GH #3683: Poco::format receives empty Vector<Any>
- GH #3692: v1.12.0 and v1.12.1 Poco::Any compile problem
- GH #3723: DateTimeFormatter creates invalid ISO8601 string
- GH #3737: Poco EventImpl for Win32 breaks INFINITE wait
- GH #3744: bindImplLOB zero size (or NULL) HY104 "Invalid precision value"
- GH #3748: Poco 1.12.2 - Building DataMySQL still fails (issue #3689)
- GH #3753: Fix optional JSON support for MySQL
- GH #3763: Poco::Util::Application VxWorks main is incorrect
- GH #3769: Fixed converting/correcting pre-gregorian dates (#3723).
- GH #3795: aix system NumberFormatter.cpp build error
- GH #3805: Upgrade expat to 2.4.9
- GH #3814: Security Vulnerability identified in POCO version 1.12.2
- GH #3825: VS 2022 Net project missing ARM64 config
- GH #3834: SocketImpl::available()
- GH #3846: Upgrade bundled zlib to 1.2.13 [fixes CVE]
- GH #3847: Upgrade bundled SQLite to 3.39.4

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 0239a702d370a652ce3dd603db1fe32154f80c57)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/poco/{poco_1.12.2.bb => poco_1.12.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/poco/{poco_1.12.2.bb => poco_1.12.3.bb} (98%)

diff --git a/meta-oe/recipes-support/poco/poco_1.12.2.bb b/meta-oe/recipes-support/poco/poco_1.12.3.bb
similarity index 98%
rename from meta-oe/recipes-support/poco/poco_1.12.2.bb
rename to meta-oe/recipes-support/poco/poco_1.12.3.bb
index 5ecc5b8dee..32c57ce978 100644
--- a/meta-oe/recipes-support/poco/poco_1.12.2.bb
+++ b/meta-oe/recipes-support/poco/poco_1.12.3.bb
@@ -11,7 +11,7 @@ DEPENDS = "libpcre2 zlib"
 SRC_URI = "git://github.com/pocoproject/poco.git;branch=master;protocol=https \
            file://run-ptest \
            "
-SRCREV = "be19dc4a2f30eb97cc9bdd7551460db11cc27353"
+SRCREV = "f1aefe34a46891b09230422bbc37465bc6d0a0d1"
 
 UPSTREAM_CHECK_GITTAGREGEX = "poco-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.25.1


