Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5941DD1357B
	for <webhook@archiver.kernel.org>; Sun, 27 Oct 2024 19:08:05 +0000 (UTC)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
 by mx.groups.io with SMTP id smtpd.web10.30467.1730039169027872460
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Oct 2024 07:26:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AgdnGtsR;
 spf=pass (domain: gmail.com, ip: 209.85.219.182, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e28fe3b02ffso3213734276.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Oct 2024 07:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730039168; x=1730643968; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0gEgR2jN6Nkoqa1w15d6pujM+xqZRCQkXl/x4XtcV0g=;
        b=AgdnGtsRHPpzRp/i+cfhI0ez5aj2HWKunXl6+L0IHwbnIF31fzYrYuMeCHdZGSB8E3
         lsbRvBNw4Vb+2S1legAKu+yxfNSrrasN9yUqE9ytXuUW3L4PPjLHidqwZUE4DXpn3JBs
         3a0OmgQ4CjkYWsrA4k4S4oOLb7Mh0ES9AJ6Q3PycYDexzXBUZy7SaGC0K0utWFWBvGj0
         6N6BsdhTeOxFBAtFpp84Vd4mNa0J6ovSo/3yli7Dvb4SGAL2Mu5RXOI9NHQsTfCeUFFh
         C9ySjUoDO5/gRobkbjP3JJ68vW58XWiU8R+DhHwmpGzP5nilwJObX4KH3rNc8ukhGzGW
         RtCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730039168; x=1730643968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0gEgR2jN6Nkoqa1w15d6pujM+xqZRCQkXl/x4XtcV0g=;
        b=RyreLlzR6g8fixjaO+onl1wm+lhYS/54nFpwRkgpOuqxqTt7LQ2LVxhGjat7zM3mFe
         Zi8y352gNmyk+oalyCopNIazdLvqEPwgtRNXubGiiiY2zME9Is1cRhFhvhUBMYTfNLhG
         h/bO2e/0wq/GmR7OCbTrmxbTxzIXPixaa4sEqdfw9GCxkMD13aYcm9tz+/D6f1tOUi7e
         q8etANsRn7nCcZF3oYNQlCQ01YAzFwq+Yy+64LjhqGPlasGpm41cy+Izoj0Gc/PZJf7T
         3nvvpU2ZzTa2bLNVjCT53FW46T8rMmMY8gOKMjwVvfiwvIsdUSRhXXwKbG1uEbk6Bi5d
         mcfA==
X-Gm-Message-State: AOJu0YzFZcDa9ck8uaPX0zGhUNciS5Mn7k+qW59XouptU8XGLBGdD3vX
	gxIOoH3ZKljbQZIm2YX240e3603CcdOMzWgzokSFt1AFUP8eTtwcOv2MXw==
X-Google-Smtp-Source: AGHT+IHGLCLNBTKlDA61jQv6FfEhZv4Kyg3qhlzpA7ndXzRwYEwyT0R1lboVCUN+lu0+jUzEbMuIMQ==
X-Received: by 2002:a05:690c:13:b0:6db:d217:895e with SMTP id 00721157ae682-6e9d8aa6350mr48776007b3.36.1730039167670;
        Sun, 27 Oct 2024 07:26:07 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e9e2953ecdsm5593087b3.1.2024.10.27.07.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 07:26:07 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 4/6] libcrypt-openssl-guess: www.cpan.org -> cpan.metacpan.org
Date: Sun, 27 Oct 2024 10:20:55 -0400
Message-ID: <20241027142547.261248-5-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241027142547.261248-1-schonm@gmail.com>
References: <20241027142547.261248-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Oct 2024 19:08:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113249

Change from www.cpan.org to cpan.metacpan.org use the CPAN_MIRROR variable
defined in the global mirrors.bbclass

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../recipes-perl/libcrypt/libcrypt-openssl-guess-perl_0.15.bb  | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-guess-perl_0.15.bb b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-guess-perl_0.15.bb
index d64fc296e..dd6cd8041 100644
--- a/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-guess-perl_0.15.bb
+++ b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-guess-perl_0.15.bb
@@ -1,9 +1,10 @@
 SUMMARY = "Guess OpenSSL include path"
 SECTION = "libs"
+HOMEPAGE = "https://metacpan.org/pod/Crypt::OpenSSL::Guess"
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ea914cc2718e8d53bd7744d96e66c03c"
 
-SRC_URI = "http://www.cpan.org/modules/by-module/Crypt/Crypt-OpenSSL-Guess-${PV}.tar.gz "
+SRC_URI = "${CPAN_MIRROR}/authors/id/A/AK/AKIYM/Crypt-OpenSSL-Guess-${PV}.tar.gz"
 
 SRC_URI[sha256sum] = "1c5033381819fdb4c9087dd291b90ec70e7810d31d57eade9b388eccfd70386d"
 
-- 
2.43.0


