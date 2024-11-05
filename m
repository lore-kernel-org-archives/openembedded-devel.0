Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE867D33A5D
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:54:55 +0000 (UTC)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
 by mx.groups.io with SMTP id smtpd.web11.27730.1730831896323204345
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:38:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z+PBwIIl;
 spf=pass (domain: gmail.com, ip: 209.85.219.171, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e28fe07e97dso5934667276.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831895; x=1731436695; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pWWE9WkWWYpGsSVpZxC4qAyZpqpczLt7g9pqyGUGL3M=;
        b=Z+PBwIIleFiN6UiUQtv0jxKAbUtGxh04s7PrKsVp8F/Nn3U78MDhu3LJm45ROlt9fU
         jQwPasZaW0RCr5rDoOP86fNeiiaWtBUTakSihaFJqaWLkMn++MlWMVBLvLfkRF03qDE6
         vtvgVmmLZ7Dhp2VLJrcQd3A6DOEW/ibxt62WIhV+qQ1YEcrFjYF8qZOpOYVzFazwjJmo
         yvrpKsjzjmfE56WYQl3ahY9kcxl3A0BWUnrIPo1FDtZDUXLMpVBJyyJa3qdLFnwkLURp
         R4gGjSUKbMYylYGtH8v3yPLE+hyJ4aUyqkUzZVduDu0ZlJ+HLeiiPyDK0ZIaAfnt43YP
         jdyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831895; x=1731436695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pWWE9WkWWYpGsSVpZxC4qAyZpqpczLt7g9pqyGUGL3M=;
        b=cZ6RHYU6jmjN4ZM3uo2Cf4SGMd+P4hOzgfmgmIIss7jk9Ixgq/25LBnC3rgXwQa2Du
         hXPKJWQ1Q6mnBt6sHGCKX9UsVKTeBhG4YaSMZmdncd4jZl6hmsJPXh/r6juyyNgz4VWG
         45vulOc/4vQ8hUZ8ghZHjVTNDVR3eT49+f6PcTWjYfKiKDPZqJITY+kHRf0G2q7KCY8v
         F3iSsvcBQ1SI3VWnIio7loe2RAJ1QIwkYCiN7AZ/5wjE+sh3KBRkGEshjCtjJwaykfY8
         7e0sDUxVC9XsDDGCDyFi/6FZIvU1LDc31vCEKpkkucvd/PjyVcWw5L/JJ9LlOFp4mxfn
         uwzw==
X-Gm-Message-State: AOJu0YxdUsZC+0mNi+0VLh0yvHNEgCUvI1ICBS0ToCuqOT1rKi3jdQNN
	FzeST2HJeOVBxo6L/K7PIYE6eDhSPR+U9tJq64sGhyXe1xmip/Pv1i1ruscI
X-Google-Smtp-Source: AGHT+IEZ4jI7VD5BZnKZkAjPPwtaiV+0AHxy56vAMlRaqIuCEpKSBQt5vPnNpfkRDmI+4ozP8bOQEA==
X-Received: by 2002:a05:690c:315:b0:6ea:807c:bba2 with SMTP id 00721157ae682-6ea807cc08bmr102519097b3.10.1730831894853;
        Tue, 05 Nov 2024 10:38:14 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm23957617b3.103.2024.11.05.10.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:38:14 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-oe][PATCH 023/161] libdbus-c++: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 13:24:59 -0500
Message-ID: <20241105183658.34982-25-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105183658.34982-2-schonm@gmail.com>
References: <20241105183658.34982-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:54:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113538

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-core/dbus/libdbus-c++_0.9.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-core/dbus/libdbus-c++_0.9.0.bb b/meta-oe/recipes-core/dbus/libdbus-c++_0.9.0.bb
index 8940e19f8..e24ebe447 100644
--- a/meta-oe/recipes-core/dbus/libdbus-c++_0.9.0.bb
+++ b/meta-oe/recipes-core/dbus/libdbus-c++_0.9.0.bb
@@ -15,7 +15,6 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/dbus-cplusplus/dbus-c++/${PV}/${BP}.tar
            file://0004-use-POSIX-poll.h-instead-of-sys-poll.h.patch \
            file://0001-pipe.c-Use-a-string-instead-of-char.patch \
            "
-SRC_URI[md5sum] = "e752116f523fa88ef041e63d3dee4de2"
 SRC_URI[sha256sum] = "bc11ac297b3cb010be904c72789695543ee3fdf3d75cdc8225fd371385af4e61"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/dbus-cplusplus/files"
-- 
2.43.0


