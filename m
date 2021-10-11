Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D92BC4332F
	for <webhook@archiver.kernel.org>; Mon, 11 Oct 2021 18:42:00 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.2738.1633977719529209921
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Oct 2021 11:41:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FIaQGX6v;
 spf=pass (domain: gmail.com, ip: 209.85.221.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id y3so26057541wrl.1
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Oct 2021 11:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eV2lGFL5V4UbJZCB2pqvUosUiq2sYZskRxuHgvhIjKU=;
        b=FIaQGX6vPjA86LTbHk3YjpXJpGtCVRvgSj8K19JXwsDYYbOlWmawSk4wnJnZNl5t4f
         OaX1NoYc9wZCCj3IjUwLhCK+CAhDUHTsyL+El0QH/IvX+YI5BfTZirTiXyVre9b3N8pW
         jdMky+rka4ectZJPfwh0ZgzKvgCj86KqNk2JoSLPuCM1ilyFSpcxbw0ARrdXnUNWbQ6q
         bs5oXnyp8+Apqd75gWXyreCICSGQShmUHGFz1pyreMtbwXozmSCHb1TNzj33V8Q95uWF
         ElvbOv5EkyQGEXPYmmh4bYLojqs8EZMaK9ZZvsWOYQLSoCc0ZHRTPQ8qXttiiCFzTPxt
         H0qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eV2lGFL5V4UbJZCB2pqvUosUiq2sYZskRxuHgvhIjKU=;
        b=eGkavFgwqgtqcvcOiQUh0g8Tm0nkhNqenLv897CcpGLrfeNzZ+rOHUyOvDdhRZ+ade
         tMukWuDSSV0v/ftjME3Dvp+W+WIuMxv2nQIy4fz0rD5h7SjrXH04aCGKh61Aqa7qa3bl
         W8b5bejEjIDFcXS75qPZ5Qz4ofuDPHl90Ed38jrIdurgt3GkOJ+tZVaWqSj7XtWE5f3y
         PrSUyF/f4mNnKKl9WQrwZK/FBDxJY/Vh1FcqI5UjtQTnvtAAh6XgjyRmQfZTTKfXyOfr
         6cVy2z9TmRgqilaRINabe/h8dKSmzCAlk/o3Y5kiffxxbzO9s1L5nxgWHf9HqqT0W66/
         a1jQ==
X-Gm-Message-State: AOAM5334vxl2vznv3qBnp6+hkRzw9xhnvFyVHjMpjBt/agf3z6p+8ClU
	RqBZxL+Acwtp+6d3zUuySouGcT8k0hqxhw==
X-Google-Smtp-Source: 
 ABdhPJyoBLped/YvBQSTnT9zGQWwEJQUgjpCHQPuSiy8Px0LTLkNxiyHYMvxB22wsZSamOhsraBqjw==
X-Received: by 2002:a7b:cb4b:: with SMTP id v11mr666091wmj.155.1633977718203;
        Mon, 11 Oct 2021 11:41:58 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id u5sm272936wmm.39.2021.10.11.11.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 11:41:57 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 16/24] php: disable openssl PACKAGECONFIG
Date: Mon, 11 Oct 2021 20:41:32 +0200
Message-Id: <20211011184140.653609-16-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211011184140.653609-1-alex@linutronix.de>
References: <20211011184140.653609-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Oct 2021 18:42:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93230

Until upstream addresses openssl 3.x compatibility issues.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta-oe/recipes-devtools/php/php_7.4.21.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/php/php_7.4.21.bb b/meta-oe/recipes-devtools/php/php_7.4.21.bb
index 916010a6f..ab87ced88 100644
--- a/meta-oe/recipes-devtools/php/php_7.4.21.bb
+++ b/meta-oe/recipes-devtools/php/php_7.4.21.bb
@@ -77,7 +77,7 @@ EXTRA_OECONF:class-native = " \
                 ${COMMON_EXTRA_OECONF} \
 "
 
-PACKAGECONFIG ??= "mysql sqlite3 imap opcache openssl \
+PACKAGECONFIG ??= "mysql sqlite3 imap opcache \
                    ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6 pam', d)} \
 "
 PACKAGECONFIG:class-native = ""
-- 
2.20.1


