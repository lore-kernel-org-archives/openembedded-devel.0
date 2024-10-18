Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95CC9D3E1A3
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 19:48:42 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web11.30072.1729278795135372719
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Oct 2024 12:13:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VUWi/7in;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6e396a69062so23916167b3.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 12:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729278794; x=1729883594; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=edHkzY0fR0v+A6RtDqmSGz4YaT6LW9UAOU88qXcnmyA=;
        b=VUWi/7inxIV3DQQ23rg7+sSZTgVbGOYlEay6S5AN5jynj2mLQAGelPfZ8fFWWCOCcI
         xmdTWSLcHzJD2J49bXrqldDF7QyEoUZuYiD2RnhZye0QtN/dsoH8vLJu2/h+xg286oic
         oswYa0KkG27fM/JzwJbjai0NOC5XtBUWpnPs/23Sb5j+wOvRiTZac4IABlQKB1nyLIUz
         vVY734OGvOfmyZSpqB/UxAY19ZYmPuD95PhUK6YgrG3nqa0e7oCGXFMTnD7OdQG91lNA
         NvSVAgo0sKEQJ5jh/8Q5KOT2cHxbJD/eNb2h0vB5/ktD8ePz+/M7Z16b1QMnMf/b4uX9
         vbww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729278794; x=1729883594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=edHkzY0fR0v+A6RtDqmSGz4YaT6LW9UAOU88qXcnmyA=;
        b=b8oDoKXi/dWtmm41ruw5BgG7HH4rXgp8RW9AbVXqOCREzQwyrw3G5WOWuW7nYNgXp6
         xVZ3788FYQtANtpzqOZFEmhg6yeRkplrpwRk0s+Y37+vIBuo1c3uYQkFVFTJTcujktkV
         vUKIZ25GtlwJgZmr6jCYuilYSVUhjksj5WRigXsOEKInllIiBdpZrqu45zjgp/S1080w
         KF5uCIxn8IiIgVcE9jg9PliqWcpTXmx8/vn88daB3C23MEWLLWsVn6gXEioy3fwevO2/
         lL0XeXQVjF23PKlX5XN/g+m+5+57A5x8WLNE2QiuwMaWCXrJjfGUK6bW/R9Nj8aRG1Mq
         Zm3g==
X-Gm-Message-State: AOJu0YxI6CQiku9TSMkM3Va3l7KQhJHvY36dDjIb9rahzR18B6FANnU7
	7eeBl5NGvzTFE987BDio5/4L0cCwzMybdUZMExjoA6kVEUs7VCCa5GJriw==
X-Google-Smtp-Source: AGHT+IFB229cCk+tGKmZ8sCdGqmlB65OpkbyLN7eVVcGnfDQFKi+dCHTV/hDhFL7LKu4tHpG70T7JQ==
X-Received: by 2002:a05:690c:2b01:b0:6e3:dce:d30e with SMTP id 00721157ae682-6e5bfc2c3aamr31636097b3.12.1729278793739;
        Fri, 18 Oct 2024 12:13:13 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5c00df1d2sm4280517b3.31.2024.10.18.12.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 12:13:13 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-python][PATCH 05/68] pyrtm: Drop unnecessary SRC_URI md5sum
Date: Fri, 18 Oct 2024 15:05:52 -0400
Message-ID: <20241018191101.25184-6-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018191101.25184-1-schonm@gmail.com>
References: <20241018191101.25184-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 19:48:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112992

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-python/recipes-devtools/python/pyrtm_0.4.2.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/pyrtm_0.4.2.bb b/meta-python/recipes-devtools/python/pyrtm_0.4.2.bb
index ed4e58850..cf800c958 100644
--- a/meta-python/recipes-devtools/python/pyrtm_0.4.2.bb
+++ b/meta-python/recipes-devtools/python/pyrtm_0.4.2.bb
@@ -4,7 +4,6 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=a53cbc7cb75660694e
 
 PYPI_PACKAGE_EXT = "tar.bz2"
 
-SRC_URI[md5sum] = "7c87da94656b620dfe532ca63d642eb8"
 SRC_URI[sha256sum] = "b2d701b25ad3f9a1542057f3eb492c5c1d7dbe2b8d1e8f763043dcc14ee1d933"
 
 inherit pypi setuptools3
-- 
2.43.0


