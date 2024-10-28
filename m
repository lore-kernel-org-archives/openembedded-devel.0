Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6836CD3E2DF
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 22:15:16 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.web11.137.1730140103273828385
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Oct 2024 11:28:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dAHW9jpo;
 spf=pass (domain: gmail.com, ip: 209.85.128.175, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6e38ebcc0abso53196677b3.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 11:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730140102; x=1730744902; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Eexyd6XTYT5HlxijugplJWxCpWTitFMhtTaGtCJrDQ=;
        b=dAHW9jpoTIN+PhHJAAJAyTkT2LmYk/fm+Tp4keLlA889+Ywa9b65NFATD5OzQdoFvY
         vY68wJn0YQOyfHKtqZFWlJuVNIIDaReUtnKePSl2d4KXfyzaT2t9R4k+mLPAD8D8E2zx
         q/F9C2RlhanI9Z63rucbydTMWUYn43+LYdyBeLFeVJTpCf2whFoEYgerKtXWNJCon4tX
         UrZx2PEAxeHkLa7/IhuVDJGHfQrh3t0/m24Nr51cYAOZnz6iwA2h7cE404zB4dURxRQF
         DR5Mi6HV+4FT+D5aVgmk/Cea76JAlhkDeAJ0qoBrJLsl3PO63If9qmNVJbKVT/0cLl5L
         mHxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730140102; x=1730744902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Eexyd6XTYT5HlxijugplJWxCpWTitFMhtTaGtCJrDQ=;
        b=EwQioIcwG0ao71Nfqi6NYukH/efgrJCn7k8Hg/CL4z38mHKr+IESuU5Q7mvPSbzfC4
         U95aGeJ60iqe1NlrXCM/1yyixhA9CWOxfe93+8Qr985wAPi9UaaaQwYIMtN5DIONIpml
         OLasSLfSXvapUEpSVd2KH0oRrYmSsnshP7OQ+CYZmTTZgvI0to38vNVQwBV5CJwWv6BA
         ySLF2XonlMuwWLPzZpU5RM6qcja0QPZ0yfupbUS6xeEurxpsq4uXrHpSlyDh1PouBX5k
         Y8hXWaZmYu34CuqZX1al+3lz2oQbvuSMePK7eIfBCI71uASW6XPiMzWQuxSNRfoLfR1/
         S1zg==
X-Gm-Message-State: AOJu0Yxj6oO4vCb1O31aX/yzgH6pfzxhIISN3Db7I2UUWI0Qes1GnYeF
	pndZp5A0ZS2Gq7ZyurZE1FHFpKqb79QwheT+94tM++NtZ18b8YP208INKQ==
X-Google-Smtp-Source: AGHT+IGwG5uIMCvI+jK2B6W9eM3T77FcMBycY68R+2eZGXYNWw1dIWXAQXC38aN7SgIODrqXifZPCQ==
X-Received: by 2002:a05:690c:6001:b0:6ac:8cfc:1cbc with SMTP id 00721157ae682-6e9d8ad6ba7mr83962597b3.45.1730140101839;
        Mon, 28 Oct 2024 11:28:21 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e9c6c770cfsm15493397b3.99.2024.10.28.11.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 11:28:21 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-perl][PATCH 17/22] libnet-telnet-perl: Use
Date: Mon, 28 Oct 2024 14:20:33 -0400
Message-ID: <20241028182749.5058-18-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241028182749.5058-1-schonm@gmail.com>
References: <20241028182749.5058-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 22:15:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113285

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libnet/libnet-telnet-perl_3.05.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libnet/libnet-telnet-perl_3.05.bb b/meta-perl/recipes-perl/libnet/libnet-telnet-perl_3.05.bb
index d5b1c504a..2e79a3b1c 100644
--- a/meta-perl/recipes-perl/libnet/libnet-telnet-perl_3.05.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-telnet-perl_3.05.bb
@@ -14,7 +14,7 @@ SECTION = "Development/Libraries"
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;beginline=4;endline=7;md5=e94ab3b72335e3cdadd6c1ff736dd714"
 
-SRC_URI = "https://cpan.metacpan.org/authors/id/J/JR/JROGERS/Net-Telnet-${PV}.tar.gz"
+SRC_URI = "${CPAN_MIRROR}/authors/id/J/JR/JROGERS/Net-Telnet-${PV}.tar.gz"
 SRC_URI[sha256sum] = "677f68ba2cd2a824fae323fa82e183bf7e3d03c3c499c91d923bd6283796a743"
 
 S = "${WORKDIR}/Net-Telnet-${PV}"
-- 
2.43.0


