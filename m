Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAFDAC636CC
	for <webhook@archiver.kernel.org>; Mon, 30 Jan 2023 05:09:25 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.34388.1675055360688786685
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Jan 2023 21:09:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HOVInZZ9;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id h9so1790267plf.9
        for <openembedded-devel@lists.openembedded.org>; Sun, 29 Jan 2023 21:09:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NOke4UIfo5/YX9TCl2j9q4UYejo3Fe5mbc9vxlwh5F8=;
        b=HOVInZZ9XqJ55MgVgdeyrfufPfCeZ97BzA2XWe+aGfh+KWg2W99a5c/mgZYkUYNXzs
         Q7WbZins67dlSYxwhw3wYca6Ps2CKRzF9lcO6jY+C7+e0NaRmNJFezyZ/f+IHuyfC/2u
         auj/W2oofKMTFAIxuKCGOHIj7SlW4ItB4fkm8I5OhBgnD7jh+yihxjJHmDBIALJaraEB
         OvvYiSt8RrGphniaEUclLbEAQwSpbLwsi+nyd08pXt6npsB8F1ljVm4oH68r2tuyW+3I
         LQhNRmluS3MubQz4wNzP2KuPJSrwfmVzN2BgxGN+VDXjRMaAitIRioDhHep8e0KNz67G
         MH1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NOke4UIfo5/YX9TCl2j9q4UYejo3Fe5mbc9vxlwh5F8=;
        b=PdUysZwdvYpAIfjtlkYY6RwrQedixMWVAzp3b4JhAPyzeH8rIejqZ/Yzjo6Z5MDYcO
         jYL+oFpFTsAg/V4zdGTNBHaTjMCcefc78Me1vpvMYF8HghCkFQKuOVzQiwkJOYKOUIGb
         wg54D/zHto2gOD1m3b1GKaEpMZKPR/lUd1qJVAPc66VVGuNx/16cG/pW1CTG5Adjj2M/
         HXRBCE75KD9C6eVPaPcvghTZ8tWAryZwYrTsbGtzotScK4ZqOns6i28Axb0WzLmrtZ5w
         tsKz+9H4Zts3189adjwR9D2DczZws6z2FYSZ/jNBIFXIt9C7GE7Td28Jra05Jefd6wof
         bgLA==
X-Gm-Message-State: AFqh2kojIwl70BPh7kmNOLX+/1S2FV8JNnOfAhBKxqqpk4iZLdt+EQds
	/LpU6TdTloZzLkG3AcLyhikYRCRnANSaOQ==
X-Google-Smtp-Source: AMrXdXtyxF4G2roXlviaQS+7a8VYKVmgeCTKJ/zN3DPRCQ0Nai45bncjE9M+UMv/Mx5bCdPy1PkwrQ==
X-Received: by 2002:a17:902:f610:b0:192:7363:f6c7 with SMTP id n16-20020a170902f61000b001927363f6c7mr51965242plg.37.1675055359878;
        Sun, 29 Jan 2023 21:09:19 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id ju20-20020a170903429400b0019493c84880sm6671467plb.188.2023.01.29.21.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jan 2023 21:09:19 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 10/12] mongodb: Pass MAXLINELENGTH to scons invocation
Date: Sun, 29 Jan 2023 21:09:07 -0800
Message-Id: <20230130050909.133727-10-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230130050909.133727-1-raj.khem@gmail.com>
References: <20230130050909.133727-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Jan 2023 05:09:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100854

This helps in overcoming a problem when using scons with ccache enabled.
When commands get longer, then it resorts to using response files to do
the operations e.g. @/tmp/tmp96j6icra.lnk when this response file is
inboked by compiler it works ok, however, this does not when ccache is
used to invoke the complilation. We see errors e.g.

 ccache @/tmp/tmppsyij_0v.lnk
 ccache: error: execute_noreturn of @/tmp/tmppsyij_0v.lnk failed: No such file or directory

Using MAXLINELENGTH setting ensures that we can use ARG_MAX to extend
the length of commandline and hence avoid using response files. This
issue is also reported in mongodb [1]

[1] https://jira.mongodb.org/browse/SERVER-38389

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../meta-python/recipes-dbs/mongodb/mongodb_git.bb               | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
index 524f0fc90c..56512a2e2e 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
@@ -76,6 +76,7 @@ WIREDTIGER:aarch64 = "on"
 
 EXTRA_OESCONS = "PREFIX=${prefix} \
                  DESTDIR=${D} \
+                 MAXLINELENGTH='2097152' \
                  LIBPATH=${STAGING_LIBDIR} \
                  LINKFLAGS='${LDFLAGS}' \
                  CXXFLAGS='${CXXFLAGS}' \
-- 
2.39.1


