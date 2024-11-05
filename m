Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07223D40D02
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 22:58:10 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web10.30641.1730838959410078341
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 12:35:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MXeerwTK;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6e5e5c43497so47818967b3.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 12:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730838958; x=1731443758; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G27ZTc782X24EkrNWbR/3O6nYxbYJMe0riXxXXVnhEE=;
        b=MXeerwTK0jBvE0qsJi0OcCjDMKaTXJ4ECPvkaKjUG2vnJWC+5SBlV45MeRAVN1QmR3
         zPoHmbk9CfC6veg/A2me6S+ucpygSjIasEDkkirKhvp4njBol3k/5JgecloiSRzbR2o1
         TaOm2nsmFX1umES4+w6Xt63kKd94sOzE/uJOOZPwKEOzAQQs2QzEJ36ozyAsQT1dkXHc
         UDw1k1Xvz0BWbn1Dx70lG61MV1F0ZMzPKlqMKjfo4NwzyIYCsj0IgjAJw6gyLbhzQ0Po
         nrI23s2jHleccuBdl3BB247uqT2TaOdq39oLWOx/1uvZerui579WT3NQyLYslMzunrXS
         AElA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730838958; x=1731443758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G27ZTc782X24EkrNWbR/3O6nYxbYJMe0riXxXXVnhEE=;
        b=Dlzkpgx9OGBTrGx77UhDKtT3VRLv+0KfCPfwFgEIuY0QotH/Z4/fcrtlIuPpXjOa/c
         DERa5sTOlBzciXqXA4KqLi7cUXth5Ss8Qh6xorY1wbdTqFtV3k4A1L6b0mVMc0Eu+vs/
         3eyo0yqOhfniE3Ndz7oAbscK9pXWQ4Cfjm2Fxqqf1S72Ce6Vc5+DzOaYN7W7RztHLMaa
         klv6uA2YOUjAoZE2RJGBncfPCttCQQvOXChgxKlU/MVfUKZKOHL610f/EYSQPN/lFm8v
         1m/6XvImP1bVqRVhQeDQKTGQmMEng4vJQM3XzxmrkCu/4MGm+EJt6mJkkki3yAugQzzs
         n2NA==
X-Gm-Message-State: AOJu0YwqFrXSKAeUdZCek4+9+dkls/5sYWUEPb/ykK5QbcrPIN3Hq+pB
	yZelciKvikQTNKNxhdUtHL1Pc/m45ZWSirQoYoObVqeLX7X84tSBlYwqdDcx
X-Google-Smtp-Source: AGHT+IHdIC4aV8q6mGCTtXMIMh6rTW67dkDqGWSVHqHWNgSvjssse2NquceNYNWQ++g0QSGiLiRsBg==
X-Received: by 2002:a05:690c:4b8f:b0:6e5:b6a7:1640 with SMTP id 00721157ae682-6ea525435a1mr225022747b3.42.1730838958027;
        Tue, 05 Nov 2024 12:35:58 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55ac9d34sm24295827b3.15.2024.11.05.12.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 12:35:57 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH 130/161] libestr: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 15:27:55 -0500
Message-ID: <20241105202827.3104-130-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105202827.3104-108-schonm@gmail.com>
References: <20241105202827.3104-108-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 22:58:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113647

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-support/libestr/libestr_0.1.11.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-support/libestr/libestr_0.1.11.bb b/meta-oe/recipes-support/libestr/libestr_0.1.11.bb
index 2ebf2757d..e8e786fa1 100644
--- a/meta-oe/recipes-support/libestr/libestr_0.1.11.bb
+++ b/meta-oe/recipes-support/libestr/libestr_0.1.11.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=9d6c993486c18262afba4ca5bcb894d0"
 
 SRC_URI = "http://libestr.adiscon.com/files/download/${BP}.tar.gz"
 
-SRC_URI[md5sum] = "1f25a2332750d4bfacfb314235fedff0"
 SRC_URI[sha256sum] = "46632b2785ff4a231dcf241eeb0dcb5fc0c7d4da8ee49cf5687722cdbe8b2024"
 
 UPSTREAM_CHECK_URI = "http://libestr.adiscon.com/download/"
-- 
2.43.0


