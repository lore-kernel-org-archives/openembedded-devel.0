Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EC4FD33A3E
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:54:55 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.web11.27742.1730831912461589001
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:38:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KBAI/4ZN;
 spf=pass (domain: gmail.com, ip: 209.85.128.173, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6ea339a41f1so50037457b3.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:38:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831911; x=1731436711; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9n8KPw6u8JzfaQUE3Ja6uRGNF/O9xDHiC0r72mPTedQ=;
        b=KBAI/4ZNzD1E2Mbk7Y/SIpaa3maWOUCOK7+bmfqIYGk0ELBE0+UaHKAoKtjwvnAXei
         mJhu4KvDm9Wqe5BAGnuWIpyl5AQY0PPjzXzW8gEEzwST8lYN3W/hx99+E0PM7KGzYKg4
         GTXU6LuZaGvEvlCWqDQGJulEONoy9t5W0+84IN/mLB57bnzMFiumyFhUjAX4meYPQr3A
         qCV5uiNqvusbz5z8ykz0z4phAcmahxZSOm4BPl7saT7Jm5HFxV5c5A/RKWXFF0ng9PYk
         fZBUi8Q3h8GeBuDk3G99nfnOY9W9rzitOMjdl38LKDrlxFaWVHJRcYvQ6bs6YWRelxWx
         h7WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831911; x=1731436711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9n8KPw6u8JzfaQUE3Ja6uRGNF/O9xDHiC0r72mPTedQ=;
        b=vwJV46DTuHeqSmlOldivvdsfKc9RbYoeiim9vvyYk9WgwBVbFp5sYCO3TBK/xRQgQ8
         7E/Qjt5RvpJvHD4gRAJP7ahtLQJUyclbCNw2MOL8OsvS+tJJodAoxQTlurk/OVx726LQ
         5HB+5RBH7d2OC588IklQNE9IGcwrhuJx/3mGnjIo/E2qEQTwKgIknCM8fCfiqLwi8+8M
         qdTRVFBItGPNO/6yf+S3sS5DIdZHp1dijEUiblrwgd1FxNJDKh5mGm/aCqeLCyuQ/skT
         fUXGO+xYhOtFkRqlqjLuOv5kJJOc3j8nHAqr7/LodeAfEUvFVBzDpRUEsq0EFKRU94Rk
         j9oQ==
X-Gm-Message-State: AOJu0YyOFsPacDgTv/MRkYs76EV0Ca/t07uJGdfHB/ti3hneRb7k6BjV
	D6zDJUeQbXegdEBDPMD0sSYl6DWhUtfEcx8OD8HYr/RLj45epwkG2zo/ysad
X-Google-Smtp-Source: AGHT+IGKSwHbkDHcN3iV7RNfqURqRHVf3NtJZ1fiLyaA3FwxU1tvzsaOQT5RosXp/B9POUfILALrow==
X-Received: by 2002:a05:690c:6e8e:b0:6e3:8ecc:bb0e with SMTP id 00721157ae682-6ea52357ef1mr204378767b3.11.1730831911115;
        Tue, 05 Nov 2024 10:38:31 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm23957617b3.103.2024.11.05.10.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:38:30 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-oe][PATCH 038/161] cfengine-masterfiles: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 13:25:14 -0500
Message-ID: <20241105183658.34982-40-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105183658.34982-2-schonm@gmail.com>
References: <20241105183658.34982-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:54:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113553

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-extended/cfengine/cfengine-masterfiles_3.21.5.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-extended/cfengine/cfengine-masterfiles_3.21.5.bb b/meta-oe/recipes-extended/cfengine/cfengine-masterfiles_3.21.5.bb
index acd5b1e80..3dc468fe0 100644
--- a/meta-oe/recipes-extended/cfengine/cfengine-masterfiles_3.21.5.bb
+++ b/meta-oe/recipes-extended/cfengine/cfengine-masterfiles_3.21.5.bb
@@ -22,7 +22,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=bb843e794feb6890f7697637b461c36e"
 
 SRC_URI = "https://cfengine-package-repos.s3.amazonaws.com/tarballs/${BP}.tar.gz \
            "
-#SRC_URI[md5sum] = "5df2f85c75efc351ffadebcc11046a98"
 SRC_URI[sha256sum] = "0adcfcf36d47317776ad64331058a4d2e3669683314716ddb885f8a13309f47d"
 
 UPSTREAM_CHECK_URI = "https://github.com/cfengine/masterfiles/releases"
-- 
2.43.0


