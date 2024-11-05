Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3870D35E3D
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:55:16 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web10.27901.1730831955837363495
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:39:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N5XFOuK+;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6e3cdbc25a0so64382327b3.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:39:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831955; x=1731436755; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mksubXJXoj7Ky1SAutTT37AxdISCNQT/PgI4XielXSw=;
        b=N5XFOuK+HJJGmW5HyFp9Cbx/mdR58bOe6eV3SgKyeKFjRhHhnU1dAWl1nEaKaleV+z
         qXTHqPhZ0Zok0HPYddimnKvefg5XvltBHFhZRUwhn8NuJcR9D/ZJSPvS3738VU3fzx1r
         ZzAxeRP0S5FVtV7DTm697yaoxA6n1P/efl9/KyGeOxo1F6OuHiETzCVEgwfujXMdx+4c
         sYjpxb9QKit+RDlLNAAajOpURC2jbTWGVJ3aPzbK3Kk+uJQOgTx2PLqm/opOi1EWQ33N
         QrflrDBFM/j483raEsVqcYy9ed7AE6yghJGoBD+U9bR6L8zzIh7E7zS0JBiRk2mFmF/O
         iQww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831955; x=1731436755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mksubXJXoj7Ky1SAutTT37AxdISCNQT/PgI4XielXSw=;
        b=CQT48kYLa5xQOHVWpC4mQpLxHvDH/L2gd8xwxL2hzO9gj7fzpKO8JPyjn1u5a8/eBx
         eyFgKx8dNqGvRPjy6kkuFnHnvh1QTqwHf15+X3/Ujrp4fWl/2cvAkQEVZ4/Fc7QiPj8m
         BviV1BXJwyHcKW28UVtpAQ9W92qYQedERAnN5NlGST/WkWXbrZj8xHWM8QVY0nL4vIlJ
         683YsBkB5HZZEUBXSG/Sx3doSFMrBhrSwWneA/RbddN1xKZrfEku15w+ogchgl35mtNs
         Uk4oLEYmZ0BCScvVQcWHY2qxxBX9k/f1EccfurA15heGL/aet6mCNhlaPKW6bZuGP9OZ
         qSoA==
X-Gm-Message-State: AOJu0YxiB5xY3fNGcJfJxv7JYJD4jmDDI94cl57dcBI4h0pGW0EL8Ht4
	RwAbFkbMkxuyWBet/0rb6kEIg3LMkKMEDp8h8ypmfqTnLF9FAXvDKuC5WtFa
X-Google-Smtp-Source: AGHT+IFqjrN6RWGfjF4ADMuJmjP78bKIirMqc4QWEGOE2BDFvhJH90wCbtLqS6JoFsXAhiZwiRPmDQ==
X-Received: by 2002:a05:690c:6811:b0:683:37a8:cd77 with SMTP id 00721157ae682-6ea64bdd705mr179542827b3.29.1730831953384;
        Tue, 05 Nov 2024 10:39:13 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm23957617b3.103.2024.11.05.10.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:39:13 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-oe][PATCH 092/161] xbindkeys: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 13:26:08 -0500
Message-ID: <20241105183658.34982-94-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105183658.34982-2-schonm@gmail.com>
References: <20241105183658.34982-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:55:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113608

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-graphics/xbindkeys/xbindkeys_1.8.7.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/xbindkeys/xbindkeys_1.8.7.bb b/meta-oe/recipes-graphics/xbindkeys/xbindkeys_1.8.7.bb
index 0c316edf9..5076b5a94 100644
--- a/meta-oe/recipes-graphics/xbindkeys/xbindkeys_1.8.7.bb
+++ b/meta-oe/recipes-graphics/xbindkeys/xbindkeys_1.8.7.bb
@@ -12,7 +12,6 @@ inherit features_check autotools
 REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI = "http://www.nongnu.org/xbindkeys/xbindkeys-${PV}.tar.gz"
-SRC_URI[md5sum] = "b5e1a9668ba13ff8673836d1d965d951"
 SRC_URI[sha256sum] = "a29b86a8ec91d4abc83b420e547da27470847d0efe808aa6e75147aa0adb82f2"
 
 EXTRA_OECONF = "--disable-guile"
-- 
2.43.0


