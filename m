Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2510D35E2B
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:55:16 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web11.27760.1730831931088991013
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:38:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mH9F3b3k;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6e330b7752cso650857b3.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:38:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831930; x=1731436730; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MemEXWkcILt0XqCDERfM6BCuN/ffw8wlwKjJngYITw0=;
        b=mH9F3b3kjAPqovr7BGPBwmNrS+WNXeboc31urFvpTQyv9SZ2inQK8FPHx7j8Ypfo0A
         IST4U/ZKZa+5a/cujfnA8jT+oFHQ4XY6WhlSmh7xvuGES7bnw4z2psmZF5+GS3O6BD9d
         jNRDMyrgBoTQ9MA5tP6+5r2fhWT1S8KxIlY/Fop9SWHJINt1m0yYA0RVNfUcoES127Rr
         FyGj3NIi6V6bvQImRwAausBcJ54OpdKDuWW0bZn/DTCP0wfA7yPEtz0r+sM2WY73pkJB
         KpkgaW5XsXQvB5s9T7LN6mx9YWJUMPG0FBsYLnVzIw3DsJvecJ9wXArf/XMaYo71RYj6
         GKgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831930; x=1731436730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MemEXWkcILt0XqCDERfM6BCuN/ffw8wlwKjJngYITw0=;
        b=H8Iorai/PwdPppw+p3Z0SdgjsPqIjYGXAxDpcMKxd/o7ClDcspXpihJTAv9oaYEUGb
         g+ZBv6TLehlgGv+L8KrctAdvvC1adKavIci/PX1xelvhXEkveICGHXJK3qIWP8P10tzE
         83a0XvYeemNhbNN6FaBMRYjPZeApSfdycERwuZVWBOkTmBF/rM67u/Y6JvmLJASikFvG
         LHU5WnRwiCCtLL/Hy9UkQImLqiWA6qjgz/lN7xpJvpEPxR6dtlxEUrSEOSaKyf0C8ZHz
         Ie+RPQyNjTFj8ueWatz4YUynWzEiAwsNj56WqjHysQEAJc0fk7ExR2zbrGa0esLwUof0
         6CsQ==
X-Gm-Message-State: AOJu0Yxlh4Qy7YJXuI/cOurlTg3QXqUSvnRsC7p5OEfqqRXa1cgQ26me
	/0hTpOzgUxNDUpbnfMSTuNGj+ftn8zD8uuBNmSyseR50WfdBuV540iBZKEym
X-Google-Smtp-Source: AGHT+IHA/LGH+NZva8yY7upPjcYEg6iKWvcakTJW1XZKmcRVl3jqEg/cqqD8zsnJTL4YmyjCbn2d1Q==
X-Received: by 2002:a05:690c:45c1:b0:6ea:1230:2467 with SMTP id 00721157ae682-6ea557e0ea9mr163679557b3.2.1730831929762;
        Tue, 05 Nov 2024 10:38:49 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm23957617b3.103.2024.11.05.10.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:38:49 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-oe][PATCH 063/161] uml-utilities: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 13:25:39 -0500
Message-ID: <20241105183658.34982-65-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105183658.34982-2-schonm@gmail.com>
References: <20241105183658.34982-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:55:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113578

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-extended/uml-utilities/uml-utilities_20040406.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-extended/uml-utilities/uml-utilities_20040406.bb b/meta-oe/recipes-extended/uml-utilities/uml-utilities_20040406.bb
index 93daafbeb..09797124c 100644
--- a/meta-oe/recipes-extended/uml-utilities/uml-utilities_20040406.bb
+++ b/meta-oe/recipes-extended/uml-utilities/uml-utilities_20040406.bb
@@ -11,7 +11,6 @@ SRC_URI = "http://downloads.sourceforge.net/project/user-mode-linux/tools/1/uml_
            file://0001-cow.c-Replace-stat64-with-stat.patch \
            file://0001-makefiles-Append-to-CFLAGS-instead-of-re-assign.patch \
            "
-SRC_URI[md5sum] = "2c1ccd9efacbfb39e42d482b89b2550a"
 SRC_URI[sha256sum] = "4f179b1db021ef15ac7e9b2eed57c525db127a754c574f591c367460cded9f41"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/user-mode-linux/files/tools/1/"
-- 
2.43.0


