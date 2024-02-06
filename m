Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0E40C4829F
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 13:28:26 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.21311.1707226101838293782
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Feb 2024 05:28:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dDOGPT4B;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-33b436dbdcfso896804f8f.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Feb 2024 05:28:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707226100; x=1707830900; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Zz9jCFWmk62M0jMyQYX8/KvF+BoXeEhnYMg/TnjPXA=;
        b=dDOGPT4BvuA3Fe4U8rxT43I25u++YHKOXPsLw2SgsSeTU9dAGgMmO61OMpVZvHFKnj
         Chr7wvAcaH4PTVdFKKKdijULO+4kvyt6M1df/IfNXiU91/+Qmlm9M8S47wNhojR+Nidz
         3ZL7XfPl5T0XBS3l0MTgh4FMHpUc1jF3shZbfFwEs5mTFs//+YggFbfBDbui0HlTJCMY
         XMtIvHqqPb5G2RHL/Oh77RlN6uAmeBsCjOwA5jdfk9jBCvkACOg4zYBqeO+9/AUyCD0a
         NGEswQTs+4EYm1MHEBGUSfb3J/ci5QflL1PIYArCcLItQuIIhqfi1G+vPYTqWaMT5oip
         oQZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707226100; x=1707830900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Zz9jCFWmk62M0jMyQYX8/KvF+BoXeEhnYMg/TnjPXA=;
        b=PD2/zMQuWRo4evKs5Ei/Io2r3oR8Ml+fvskF6tdjoHosROF8ff8lJYNdqSfImkDz81
         AVG6z9jU7z9H/0O4HRVYwDIjvoi68f5ntj+LwqkOzt66TJtk8CBjoSpVAdy5ql1e/m92
         rA3GzV71SJNFiOh1WPnNX1VYHPansJ4hylgP+uTfg7HBWxWI4xiO1J1TFeMcOo7Ugj8a
         5V3hTVZZDVcJHy78zGmnyMFd2VdKzHa4VeppsyFITp8YAkqmWU/P8gXUm/65XrBSbULU
         loamdf3ako3xC/lrlZCij+jBb20XbbTl63ANNDDKzDYIS/SVMSTiZ0ZlJCyw3dta6qSF
         e1cQ==
X-Gm-Message-State: AOJu0Yz1xf8ugD6ulMfLWaZxSIN6+a/4iIkqvqsP+b39gUNwZFv+jbPq
	K40dCGEK8i0GzUYLX7ApUR9cGQeAgxdBBJrQ3AmyamOQuWXx8x+Ii/aj2SAh
X-Google-Smtp-Source: AGHT+IE+6Z+jZY9Tk4X2hW71kA7mNCb0/TYpPBeRY827h/awgRG5ZmZgdf8lw95o6aR9kjZmh9pq/w==
X-Received: by 2002:adf:d1ea:0:b0:33b:4197:75dc with SMTP id g10-20020adfd1ea000000b0033b419775dcmr1677467wrd.14.1707226100205;
        Tue, 06 Feb 2024 05:28:20 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id d6-20020a5d5386000000b0033af5086c2dsm2122184wrv.58.2024.02.06.05.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 05:28:19 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][RFC][PATCH 5/5] evemu-tools: use better PV
Date: Tue,  6 Feb 2024 14:28:12 +0100
Message-ID: <20240206132812.1362456-5-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240206132812.1362456-1-martin.jansa@gmail.com>
References: <20240206132812.1362456-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Feb 2024 13:28:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108631

SRCREV = "86a5627dbeac8d9d9bc34326a758d6a477e876e4"
is 15 commits after v2.7.0 tag and configure.ac says 2.7.0 as well:
https://gitlab.freedesktop.org/libevdev/evemu/-/blob/86a5627dbeac8d9d9bc34326a758d6a477e876e4/configure.ac#L4

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta-oe/recipes-support/evemu-tools/evemu-tools_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/evemu-tools/evemu-tools_git.bb b/meta-oe/recipes-support/evemu-tools/evemu-tools_git.bb
index b8cd1f620a..491f10dda0 100644
--- a/meta-oe/recipes-support/evemu-tools/evemu-tools_git.bb
+++ b/meta-oe/recipes-support/evemu-tools/evemu-tools_git.bb
@@ -11,7 +11,7 @@ SRCREV = "86a5627dbeac8d9d9bc34326a758d6a477e876e4"
 SRC_URI = "git://git@gitlab.freedesktop.org/libevdev/evemu.git;protocol=https;branch=master"
 
 S = "${WORKDIR}/git"
-PV = "gitr"
+PV = "2.7.0+git"
 
 inherit autotools pkgconfig
 
-- 
2.43.0


