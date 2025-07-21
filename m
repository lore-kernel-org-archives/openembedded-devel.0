Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20C72C87FC6
	for <webhook@archiver.kernel.org>; Mon, 21 Jul 2025 04:00:40 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.32554.1753070437375887611
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Jul 2025 21:00:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DdpNx4s0;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7425bd5a83aso3232478b3a.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 20 Jul 2025 21:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753070436; x=1753675236; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Of9m6Hhebxao/cUTLhDUsE8NYRrK1NtPFCf6rknmUtg=;
        b=DdpNx4s0ffhhF9Z/0lHJkDtfEujcUKTb4Ezazgfr7RROPvsuF7+L6ued0cJp6pCZh1
         vncb7AjcgmdyMER7oM7Cp8QQs5hxxKA/oFadY1POFkrQINGKSKKVkYI1x2CxmAL0ZrAp
         AvRoSC8y2TPXlsqIWpSQBdoEbN5y1cKyBTOxGB7lxGG15K4c6igz0kL6v26/4qBY2OVt
         wqOdmOifrsO2OEo24XTdj9xiCkR++LQt8Qr17k08FRDZcHLgaS39GdNE93XS3sA2ay1o
         9kb2dkRzrYMTNVHKmnwlz/ZRfQcZ3TgIT2+CQ8BhYKlHmkeA47AMsvsICcQDjvAmq7Or
         7i5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753070436; x=1753675236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Of9m6Hhebxao/cUTLhDUsE8NYRrK1NtPFCf6rknmUtg=;
        b=RfDC4sYp3O+Z7P5o+YEm1bv/xJMGLMzNM37q/1s6m1YR09O4ehyPqSamNaS0WNicTd
         FoqnGx2TrNrPQ+ghRrE7dpmE5mCX7s0Uxi8FsDfTDPeEVn5f9Rm9j1au9rumGwFWSRb1
         jn7BDl8lc5jXgxXHUB974KKkzA7bN61CANYfMnD0ZZ1PR/laDS80KbDAsCOJ2kbJUGUA
         PsTkGua5oAA42BAfduXUjf5+fbofAjBGxgml+rOcpAl/SOgyzO/hVyjWNkgfN2M1A083
         n88Tm6IbyqFv7wW9Lp2s5xUQQBhJ/8kcEaMZ1i1H21b62unEHk4liQse+CP1YSkDY6CI
         LRYw==
X-Gm-Message-State: AOJu0Yzl8W5Z5yQfaPuuWB8PGeZcVbE7PuCEBYkFuFeZwQhRxGAlGGuP
	/6yt9AIbZtusGZo1S8fHbaqqnSQGcYBjjtIqqwrq0Le8U1ow4PKdKh4BkICzZuhsCrU=
X-Gm-Gg: ASbGnctjmZNG0e58zOYuSP7t3cSoqVDUNPo60ZSCsenx9LlVwb+3oAOrLJQ+NvWjhfi
	KCMGA+q4XK7296UmpV3QtD6lqw6JJHUvr7RF/aa0pn4+V89b8hwBTMQSuiXF7t/CvAgT6fejiw8
	ZY+es6IIf6T387YeF8P2YhBA0vpmp6fB0xhcJxE2WpklE9OHvprdPZbBeNMub68g36XSyRQ1TC/
	6zc+PHC5CZtF14fm0OrKGvAvywmXCGBaYHt72WlRufLU68nXK5wBcJOaMS8rPBlu5kSrSPAZdAM
	EoKdwTM0KSAm8rqA1RUFQk/t2qcWHn3wq6GoENo+j7O/emzyKGbzoj0rrhngOl/mS0AXetgI0ua
	uDGMd87z5wRflhw==
X-Google-Smtp-Source: AGHT+IH5wKbDtN1Rg0J86nIHKs1iDYtQy5T4mAI3YcLhI0aqGSgdo0lFiHqDlOyxnKsSuj71qIlYpw==
X-Received: by 2002:a05:6a00:1945:b0:736:5f75:4a3b with SMTP id d2e1a72fcca58-75722869626mr24708765b3a.7.1753070436027;
        Sun, 20 Jul 2025 21:00:36 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::b985])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759c89d5e73sm4812987b3a.59.2025.07.20.21.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 21:00:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 4/7] tsocks: Always use ligcc for compiler runtime with clang on x86
Date: Sun, 20 Jul 2025 21:00:27 -0700
Message-ID: <20250721040030.641212-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250721040030.641212-1-raj.khem@gmail.com>
References: <20250721040030.641212-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Jul 2025 04:00:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118647

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-protocols/tsocks/tsocks_1.8beta5.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-protocols/tsocks/tsocks_1.8beta5.bb b/meta-networking/recipes-protocols/tsocks/tsocks_1.8beta5.bb
index 2cbb025049..af0823829d 100644
--- a/meta-networking/recipes-protocols/tsocks/tsocks_1.8beta5.bb
+++ b/meta-networking/recipes-protocols/tsocks/tsocks_1.8beta5.bb
@@ -21,6 +21,9 @@ inherit autotools-brokensep
 LIBS:append:libc-musl = " -lssp_nonshared"
 LIBS:append:libc-glibc = " -lc_nonshared"
 
+# i686-yoe-linux-ld.lld: error: undefined symbol: __unordtf2
+LDFLAGS:append:libc-glibc:toolchain-clang:x86 = " --rtlib=libgcc --unwindlib=libgcc"
+
 S = "${UNPACKDIR}/tsocks-1.8"
 
 FILES:${PN} = "${libdir}/* ${bindir}/tsocks"
@@ -28,4 +31,3 @@ FILES:${PN}-dev = ""
 INSANE_SKIP:${PN} = "dev-so"
 
 EXTRA_OEMAKE = "SHCC='${CC} -fPIC ${LDFLAGS}' LIBS='${LIBS}'"
-

