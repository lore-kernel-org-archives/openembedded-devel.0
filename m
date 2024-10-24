Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED8FED10388
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 20:36:24 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web10.6202.1729801154419411337
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Oct 2024 13:19:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=F5j0zt/6;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6e305c2987bso12956167b3.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 13:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729801153; x=1730405953; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OZS5QVH0RHdlSzXXPHbNY1Mt2QMeBQYjyAaw32+KO1Y=;
        b=F5j0zt/6DWKjPKvSdLZxuAeTxLCOByBlt4AjokIxXEDeiHJwTuR2AkIg7Eoo7bMUGk
         I16VcrskT9ewDkRqi4m5ltuB4H4GTMi/CI4gEEGAjACUdgzUUUuYD/WwXMulhDJcRH5V
         //E+5lGf6e5PlX+T5pQpy4lvzh6qM3KQye0vcVebS2qTwaPe5osYuagxhz6emrAqDHGy
         V7rlT0Rr01kXah/bLKQN5LPeb4tntx87EloJn+6yEWVghE3k44A++vnLdcb0P53feEPk
         85qQQMlR2zmPQex6t9ODOQbFf6UjU4HExmSzLeHLykjSSIZ6thJHb9xt/bM746Sgb4fR
         1HqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729801153; x=1730405953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OZS5QVH0RHdlSzXXPHbNY1Mt2QMeBQYjyAaw32+KO1Y=;
        b=nGjUoZ+sNXl5q061CCMrwgZHtLun9vgotsIEFMmbqxQ8Vq+Bxve5G9wM7bwjcFO2iV
         Kxp0QTUpDwXVI5qo3daWmpXw60vtUWd7PqlVkA6JiyT96x+KNWQt0fJiT7BBoFd+pTuX
         H0dAJBahgGFdwpv4Ss1q4cVV4zYX6MfJ45ziXUTEfpn6MG7AO498PuUgl6nsoIIbyYlV
         5q9+h31IQnxhrVCxbPKJduDzLRc3KnaIW1/NZi21uNAAZWnqLD92Jrt9eDIQMqsa7249
         LmEj/q0KGA3XqgIr7N286VZiSDQDqojWjNHigeJFEnshxgfuitxzfWADRzWefvX08dmQ
         oylQ==
X-Gm-Message-State: AOJu0YzCknHby0BVwSkmItki3tDLY8WRONjWrP0AOtehNUzrTqTNRHAD
	sEfYKvzublF/vSgCuZtwCzsi088oGLwPqIW3k1VqcdGFkB+Zvxn++P2C0g==
X-Google-Smtp-Source: AGHT+IHpbCPBpopxr+oWDvcYkGvTUMbcDiGmzbiuBmVbq3W/EXjuePGVJ8/RqpHfiJXWcBZ2jyti6w==
X-Received: by 2002:a05:690c:4512:b0:6e3:12f6:d8b3 with SMTP id 00721157ae682-6e7f0fd7e50mr90639267b3.37.1729801153170;
        Thu, 24 Oct 2024 13:19:13 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f59f551csm21484897b3.10.2024.10.24.13.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 13:19:12 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 31/42] libnet-telnet-perl: Change references to search.cpan.org to use metacpan.org
Date: Thu, 24 Oct 2024 16:07:50 -0400
Message-ID: <20241024201806.440273-32-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241024201806.440273-1-schonm@gmail.com>
References: <20241024201806.440273-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 20:36:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113209

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libnet/libnet-telnet-perl_3.05.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-perl/recipes-perl/libnet/libnet-telnet-perl_3.05.bb b/meta-perl/recipes-perl/libnet/libnet-telnet-perl_3.05.bb
index d90b47d21..d5b1c504a 100644
--- a/meta-perl/recipes-perl/libnet/libnet-telnet-perl_3.05.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-telnet-perl_3.05.bb
@@ -8,13 +8,13 @@ These interactive features include the ability to specify a time-out and to \
 wait for patterns to appear in the input stream, such as the prompt from a \
 shell."
 
-HOMEPAGE = "http://search.cpan.org/dist/Net-Telnet/"
+HOMEPAGE = "https://metacpan.org/dist/Net-Telnet"
 SECTION = "Development/Libraries"
 
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;beginline=4;endline=7;md5=e94ab3b72335e3cdadd6c1ff736dd714"
 
-SRC_URI = "http://search.cpan.org/CPAN/authors/id/J/JR/JROGERS/Net-Telnet-${PV}.tar.gz"
+SRC_URI = "https://cpan.metacpan.org/authors/id/J/JR/JROGERS/Net-Telnet-${PV}.tar.gz"
 SRC_URI[sha256sum] = "677f68ba2cd2a824fae323fa82e183bf7e3d03c3c499c91d923bd6283796a743"
 
 S = "${WORKDIR}/Net-Telnet-${PV}"
-- 
2.43.0


