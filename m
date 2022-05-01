Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A858EC433FE
	for <webhook@archiver.kernel.org>; Sun,  1 May 2022 16:26:59 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.181.1651422409432925794
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 May 2022 09:26:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=afceOkXR;
 spf=pass (domain: gmail.com, ip: 209.85.216.51,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id r9so10937637pjo.5
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 May 2022 09:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=C7rdVHxz1D5kJbwqpILzhZLdb1PDB6us4lGFDG17ekM=;
        b=afceOkXRZWWuYosdSk+OuYvgCbsbTpqYG2hWnaqHzAhtNf0fDv6gpy37OJ4n17DHci
         B2gL8EGMCgym9dQuxayBldDcX9FQmjwOdP5wneFh0JoyNW1UMaNkWKzvtyvcqqOCmXDA
         OXJiWqe8TmXxUn4+VravJx22dnRMsHd0fhnrl1EY1lhdb9Qz4CwkGVBltQLvX55kh2A0
         2g76DJadc+NgZIEWu6rkL9JltM14bOsUtvJ+jU/s+5ZbntvLsy6C0+51Pkv8gfYa5a7u
         Pd0psWborfi2KsfYKFjWjMG6HE0DknaJRDmwhl5g9m+g1Mzn40kQ9lwj8hHL/mAfMRAP
         +XfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=C7rdVHxz1D5kJbwqpILzhZLdb1PDB6us4lGFDG17ekM=;
        b=p1IrTW/irVcRNN7rHaFZ8k0uL7uuIXnyThAl5cixW1t0OhRB5avIDLpz2TBe4QJ0XW
         dSlXWr1AGHnR4hgbjNPPoGI24TNNrH7/ZYa2XnYe+xjgwxzP/JKapimSLuvz4vPPrvr4
         qlYU2UC2HfJllCb1KjNkqoyBg9GxGARpvvfDt1LAkz1fW7dsPbXsk26A9hobEMJDyc8z
         76xETW3hnKumNblLHkzktT47bGX0haf9UKLWgkxanXLY8Ez37pYXAeE2gVWCat0ajDV5
         bqnUXt+nEcI/g8Hk2NyHQqe9i3uVWBfQs4x1Q7l5MVeWeJIA/me8xG0hgtBK+4qEU8aR
         wBLw==
X-Gm-Message-State: AOAM53091SlTlpmCXiHuNGnQrFVYk6CdxuOau3EYSJ1fw8KnwBOzaD26
	xYZGiuOa2GkqH2cfGgXopzCnahS7ymZXSg==
X-Google-Smtp-Source: 
 ABdhPJxgoei82e3MBlC3BdSqnGApQTFkibWRwBrWf3nSKLR/SNUbjCeyZuFHiiE/Za9LLnQQoeU4jQ==
X-Received: by 2002:a17:903:41c5:b0:15e:a7b6:e031 with SMTP id
 u5-20020a17090341c500b0015ea7b6e031mr443106ple.82.1651422408592;
        Sun, 01 May 2022 09:26:48 -0700 (PDT)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:9a0c:5968:29f0:efcf])
        by smtp.gmail.com with ESMTPSA id
 h19-20020a170902f2d300b0015e8d4eb243sm3063569plc.141.2022.05.01.09.26.47
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 May 2022 09:26:48 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 02/10] cyrus-sasl: move from meta-networking to
 meta-oe
Date: Sun,  1 May 2022 09:26:35 -0700
Message-Id: <20220501162643.513646-3-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220501162643.513646-1-akuster808@gmail.com>
References: <20220501162643.513646-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 01 May 2022 16:26:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96914

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../cyrus-sasl/0001-sample-Rename-dprintf-to-cyrus_dprintf.patch  | 0
 .../cyrus-sasl/cyrus-sasl/CVE-2019-19906.patch                    | 0
 .../cyrus-sasl/cyrus-sasl/Fix-hardcoded-libdir.patch              | 0
 .../cyrus-sasl/cyrus-sasl/avoid-to-call-AC_TRY_RUN.patch          | 0
 .../cyrus-sasl/debian_patches_0014_avoid_pic_overwrite.diff       | 0
 .../recipes-networking}/cyrus-sasl/cyrus-sasl/saslauthd.conf      | 0
 .../recipes-networking}/cyrus-sasl/cyrus-sasl/saslauthd.service   | 0
 .../recipes-networking}/cyrus-sasl/cyrus-sasl_2.1.28.bb           | 0
 8 files changed, 0 insertions(+), 0 deletions(-)
 rename {meta-networking/recipes-daemons => meta-oe/recipes-networking}/cyrus-sasl/cyrus-sasl/0001-sample-Rename-dprintf-to-cyrus_dprintf.patch (100%)
 rename {meta-networking/recipes-daemons => meta-oe/recipes-networking}/cyrus-sasl/cyrus-sasl/CVE-2019-19906.patch (100%)
 rename {meta-networking/recipes-daemons => meta-oe/recipes-networking}/cyrus-sasl/cyrus-sasl/Fix-hardcoded-libdir.patch (100%)
 rename {meta-networking/recipes-daemons => meta-oe/recipes-networking}/cyrus-sasl/cyrus-sasl/avoid-to-call-AC_TRY_RUN.patch (100%)
 rename {meta-networking/recipes-daemons => meta-oe/recipes-networking}/cyrus-sasl/cyrus-sasl/debian_patches_0014_avoid_pic_overwrite.diff (100%)
 rename {meta-networking/recipes-daemons => meta-oe/recipes-networking}/cyrus-sasl/cyrus-sasl/saslauthd.conf (100%)
 rename {meta-networking/recipes-daemons => meta-oe/recipes-networking}/cyrus-sasl/cyrus-sasl/saslauthd.service (100%)
 rename {meta-networking/recipes-daemons => meta-oe/recipes-networking}/cyrus-sasl/cyrus-sasl_2.1.28.bb (100%)

diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/0001-sample-Rename-dprintf-to-cyrus_dprintf.patch b/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl/0001-sample-Rename-dprintf-to-cyrus_dprintf.patch
similarity index 100%
rename from meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/0001-sample-Rename-dprintf-to-cyrus_dprintf.patch
rename to meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl/0001-sample-Rename-dprintf-to-cyrus_dprintf.patch
diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/CVE-2019-19906.patch b/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl/CVE-2019-19906.patch
similarity index 100%
rename from meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/CVE-2019-19906.patch
rename to meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl/CVE-2019-19906.patch
diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/Fix-hardcoded-libdir.patch b/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl/Fix-hardcoded-libdir.patch
similarity index 100%
rename from meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/Fix-hardcoded-libdir.patch
rename to meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl/Fix-hardcoded-libdir.patch
diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/avoid-to-call-AC_TRY_RUN.patch b/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl/avoid-to-call-AC_TRY_RUN.patch
similarity index 100%
rename from meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/avoid-to-call-AC_TRY_RUN.patch
rename to meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl/avoid-to-call-AC_TRY_RUN.patch
diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/debian_patches_0014_avoid_pic_overwrite.diff b/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl/debian_patches_0014_avoid_pic_overwrite.diff
similarity index 100%
rename from meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/debian_patches_0014_avoid_pic_overwrite.diff
rename to meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl/debian_patches_0014_avoid_pic_overwrite.diff
diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/saslauthd.conf b/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl/saslauthd.conf
similarity index 100%
rename from meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/saslauthd.conf
rename to meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl/saslauthd.conf
diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/saslauthd.service b/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl/saslauthd.service
similarity index 100%
rename from meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/saslauthd.service
rename to meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl/saslauthd.service
diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.28.bb b/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl_2.1.28.bb
similarity index 100%
rename from meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.28.bb
rename to meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl_2.1.28.bb
-- 
2.25.1


