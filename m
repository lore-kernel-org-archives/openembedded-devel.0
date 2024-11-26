Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84FFAD3B99F
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 15:12:03 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.48080.1732633917147882197
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Nov 2024 07:11:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=RjK0jQbL;
 spf=pass (domain: konsulko.com, ip: 209.85.128.45, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-434a2033562so14459145e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 26 Nov 2024 07:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1732633915; x=1733238715; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZBsa5x8AISMSVjOaFqspsm6due/Gu7XRSj5XBN8LqOQ=;
        b=RjK0jQbLZUQHw1JqySI6TWy6uXtNEvwjKcy630/VMM64nX/kkwswhCr0Qw/L0BUhPf
         H+7mnWQMqaWK4Nj0FjqTJvpIV9CMoR7ECoWgaKJmCcStTRKXfFVXMR89M0c7vCcyEx1J
         uhSfxMdzBl5nhFxZMfdlXd2T11kYzZQCkJSqc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732633915; x=1733238715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZBsa5x8AISMSVjOaFqspsm6due/Gu7XRSj5XBN8LqOQ=;
        b=RvyIHDPpJ1UX7Ua2MPn5/eD1oUTJJ+8YWBpjvBAoGMa3iXE69jyk+e1ipjY9MnHKfP
         oFTvDbR1rljy2BS4Mx9cdG4mg7GFQvBB4d8/Kd35U6WQ6X0APu64XaF+lgQbTArq0UwL
         GmSCTaWyUCOPpktjri0zIy+aoJuaTpO8WveXxm8MwR6CSjN8Vs50s+kYQymSGfd1HXkz
         3ufg0M6PQl80CdzqAaQd+KdG4KL88MhWB/RYOx5C2Vm05CBbyeucWerCeJFa25eK9OHd
         4cth+Fag/P34Y8/TV0vWF2Oc0MNMl2dUE/yKvZNsziVsVGtaqF8OIcdVfTXFqLFQaVd1
         IO+Q==
X-Gm-Message-State: AOJu0Yy4uaHtqWEuSQ4r90jP3GU33qAQjjAZ0GmZi/Ma3PkGgshC5I0/
	jSbMoYlQSYBuDJbUTE1BYA36U2nXWMZfSlzEaR8v/0DGqV9eOEpoWKOI75fEkHz6AWmsR6A0JD5
	U
X-Gm-Gg: ASbGncs89VJPSISAWYumFbVgFMJ+C8Eg0f6nq5MxpAz0qqtR+2WZ9XZmNbSh35JFHfM
	T/VgLmbHpE3yKnIgweABY4sdn67MkukpFfTb7Iuhf1g1eTtT4oVRO8og78Y3XZXhR8oFp+Z8hPV
	FmA9c2KtVrkw6qszlVSjLtIoGu7yNYogpcRBHzfQBa62KEE1ye9Icg80hB0v3nGm56Tf40FVY/m
	C7+2IEvv9h/XqAQZqjSt3TUD/tjTY7egsw7a1IuxiiPd74t1nJQo5CWFOTWHEBw
X-Google-Smtp-Source: AGHT+IFj1eL2URjb+1v4ds+9zIHlSyKXL7Mt90mnAeZxvbU0nHl7kTjM+QZioO+sMPrQzFejI+2I+Q==
X-Received: by 2002:a05:600c:4e49:b0:434:a902:415b with SMTP id 5b1f17b1804b1-434a90242cemr11162025e9.10.1732633915078;
        Tue, 26 Nov 2024 07:11:55 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fbedad6sm13499791f8f.91.2024.11.26.07.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 07:11:54 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-imageio: Upgrade 2.35.1 -> 2.36.0
Date: Tue, 26 Nov 2024 17:11:50 +0200
Message-Id: <20241126151150.95784-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241126151150.95784-1-leon.anavi@konsulko.com>
References: <20241126151150.95784-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Nov 2024 15:12:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114072

Upgrade to version 2.36.0:

- Use bytes instead of to_bytes in pyav metadata call
- Remove support for Python 3.8

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-imageio_2.35.1.bb => python3-imageio_2.36.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-imageio_2.35.1.bb => python3-imageio_2.36.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-imageio_2.35.1.bb b/meta-python/recipes-devtools/python/python3-imageio_2.36.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-imageio_2.35.1.bb
rename to meta-python/recipes-devtools/python/python3-imageio_2.36.0.bb
index 6142884e72..2faa16b4cf 100644
--- a/meta-python/recipes-devtools/python/python3-imageio_2.35.1.bb
+++ b/meta-python/recipes-devtools/python/python3-imageio_2.36.0.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=24cb9a367a9e641b459a01c4d15256ba"
 
-SRC_URI[sha256sum] = "4952dfeef3c3947957f6d5dedb1f4ca31c6e509a476891062396834048aeed2a"
+SRC_URI[sha256sum] = "1c8f294db862c256e9562354d65aa54725b8dafed7f10f02bb3ec20ec1678850"
 
 inherit pypi setuptools3
 
-- 
2.39.5


