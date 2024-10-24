Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41336D1039B
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 20:36:25 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.web10.6194.1729801149601416469
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Oct 2024 13:19:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OHnzidvP;
 spf=pass (domain: gmail.com, ip: 209.85.128.180, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6e2e3e4f65dso15812967b3.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 13:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729801148; x=1730405948; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wznq+34GUaVPp+2uVKjR04l423rzfcUx2peK/abVoAE=;
        b=OHnzidvPUN5mGXzpEYEYHNMycWrRsTP9nDrooImg3CXqgmaukio+3NF0yTxBwB8uuf
         K9DCp/bnU/eLnfmWfXfESNqfYeXne4ZgTOnCBRRQAD/V9DDy7Pcj1DACtkLHBjlTpQUK
         FTkCXwM4J3UPZsymiztAt9JloJGCMkvJw8yMd5EjjKs+BKnJfZqIs+j8e4kZqxGBFGWX
         Q4QW0U/mTS5x4U6LgMmqIwg8gJlmzscLvFV5og7XZi2EaBD4Vpz6/jjeKilgifzI+/uO
         Qkf7t6lb+AkzN79bOSsEj2kVL7kVbGC5inp6EvlD0O7YVOrku8o0EUzmaOaQMzvPZSFO
         UaoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729801148; x=1730405948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wznq+34GUaVPp+2uVKjR04l423rzfcUx2peK/abVoAE=;
        b=PDjvTLW24GvoHESIlj9/ds8V6Ltcvwu+mJha6SWzHwVFuNYPfL8I5X5UftPUVDjMWX
         6CjvTG2RhK2P+GCld9MQLzZLQDnpKWCp0Rc79T2mjSDNho2wXH5PlLxWcnuvbfhkr6CW
         LJwRzjDIMor1TFI0kn/QClubSE6YkQQMtC2MwNVWeQHLYMhn706tTVwx6S+IpW6wqpU4
         04st3+O5T5egG1EY/qQL6YGC2RxrR9m6E9K8d5QMHfyWIm6Z3y2/t4rXjCGUGamYXWl2
         RLuTT9XCXwuD8zU9XbSZGui4qATLgzTUroRT11zP5VaUGAdLFy/gnAbc8fksp0TXpVcb
         qT2Q==
X-Gm-Message-State: AOJu0Yxw8Tp1fKvR+5ufxQ7mi+c1uklhJs1BdC7LR3F7MD2Yo1qKHZIX
	jQk1NMoDNB+mqpCl9OOAVLuaPGYCAGsd6VrltEnwsPzkiG8NPO9bMsRSPA==
X-Google-Smtp-Source: AGHT+IEXmQW544Iw8TyfqxWMQTOXtL8BCGHX7b9i4ezSg7d+xsK0IK44wTTOW9bc5UlRiSInWTFE0A==
X-Received: by 2002:a05:690c:660b:b0:6ac:ce34:9726 with SMTP id 00721157ae682-6e85816be26mr34392157b3.18.1729801148420;
        Thu, 24 Oct 2024 13:19:08 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f59f551csm21484897b3.10.2024.10.24.13.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 13:19:08 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 24/42] libmime-charset-perl: Change references to search.cpan.org to use metacpan.org
Date: Thu, 24 Oct 2024 16:07:43 -0400
Message-ID: <20241024201806.440273-25-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241024201806.440273-1-schonm@gmail.com>
References: <20241024201806.440273-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 20:36:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113202

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libmime/libmime-charset-perl_1.013.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libmime/libmime-charset-perl_1.013.1.bb b/meta-perl/recipes-perl/libmime/libmime-charset-perl_1.013.1.bb
index 27ed41e99..a39081851 100644
--- a/meta-perl/recipes-perl/libmime/libmime-charset-perl_1.013.1.bb
+++ b/meta-perl/recipes-perl/libmime/libmime-charset-perl_1.013.1.bb
@@ -1,7 +1,7 @@
 SUMMARY = "MIME::Charset - Charset Information for MIME."
 DESCRIPTION = "MIME::Charset provides information about character sets used for MIME \
 messages on Internet."
-HOMEPAGE = "http://search.cpan.org/~nezumi/MIME-Charset-${PV}/"
+HOMEPAGE = "https://metacpan.org/release/NEZUMI/MIME-Charset-1.013.1"
 SECTION = "libs"
 
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
-- 
2.43.0


