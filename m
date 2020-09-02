Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
 by mx.groups.io with SMTP id smtpd.web10.10041.1599005371988722164
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Sep 2020 17:09:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lXBojNWG;
 spf=pass (domain: gmail.com, ip: 209.85.214.195, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f195.google.com with SMTP id s10so942031plp.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 01 Sep 2020 17:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GD9vNAi7MlFTCM0XSRuCPZEU9qLeKKUmnad0GjRbT34=;
        b=lXBojNWGkWXNz4nLj/PQK4rHTfl0oSijnAMuDpTdKXgf/2FT5ezRRnP3Ypqoeqwbv2
         hEE0yrhF1mVPYqdja3kOjtbillaOpWTG/hUi85Ai8C/bnara8z6x4rood0WPxARiMHqO
         F9IRbqR3ngQzA3nUAuuqPt/V5A2qbt2SrzVSrXmzAyMxLHIWE/guQIBufHRt9OeWjLaI
         8zqbE4UTVcAXhvRU8oO5QHrFRz6zjLy8RM9vYZ/lvv8cqMD65MBRe1R10HkoQseZ1iY2
         2A74P+u2vJ7YPNGLuxmY924ohMYFdkv3IqfZe3IDRRtu4U3B8wK/XtWiOgn4+aSsIXoO
         gvWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GD9vNAi7MlFTCM0XSRuCPZEU9qLeKKUmnad0GjRbT34=;
        b=p2ovW9Fh8mOXB0Vm0S3CFOf3WE0ll6jNaBlAkl5y31Q6b+dqEbDtrMHG8QnO0WIHEz
         pDsdKWZR61uBUlTvkwEIMyOkIOHm+FsBQVvElIvdthG51SZIJ0VUaypNRAKYnJtU/SFi
         qTzozb/8CyYKLBCLL5yzxKvqFpxRwA+zC2QQWZ9qUCnPP89xC9/Eex0I3sg94NDMONEJ
         51kP+/ZRd3XfnWXYXdJFRQ8y2VGa0YtfIDmCqBQgCy3psOehseyC9eSE19qENvAAzbGE
         phzcaxnO+BRthzRs54MGfs4eGjumRf6HBQtwSfbRqM566CxQeUEs7uptTYmauWnT1kyj
         nE+w==
X-Gm-Message-State: AOAM533WwqD3ks3WJx1J3p5TjS82gym6neuvkyW5/VxJxriUPwqJMxb8
	tWnN4kEpUMJPpybZlhBpAz1nwtAR0tQDGQ==
X-Google-Smtp-Source: ABdhPJxwpg3C4b7x2Je1r0uCKk8lEAQJvo7s5hCop+PMI8EpAwFypHkNeHjk3tsxBVIW4EQ9C9kNzw==
X-Received: by 2002:a17:90a:bc96:: with SMTP id x22mr4101052pjr.164.1599005371107;
        Tue, 01 Sep 2020 17:09:31 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e89d])
        by smtp.gmail.com with ESMTPSA id gt13sm2511218pjb.43.2020.09.01.17.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2020 17:09:30 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 3/3] mycroft: rdep on procps
Date: Tue,  1 Sep 2020 17:09:26 -0700
Message-Id: <20200902000926.2271220-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200902000926.2271220-1-raj.khem@gmail.com>
References: <20200902000926.2271220-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mycroft needs pgrep

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-multimedia/recipes-multimedia/mycroft/mycroft_19.8.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/mycroft/mycroft_19.8.1.bb b/meta-multimedia/recipes-multimedia/mycroft/mycroft_19.8.1.bb
index 62d1ad7f74..2db30dda06 100644
--- a/meta-multimedia/recipes-multimedia/mycroft/mycroft_19.8.1.bb
+++ b/meta-multimedia/recipes-multimedia/mycroft/mycroft_19.8.1.bb
@@ -84,4 +84,7 @@ RDEPENDS_${PN} += "flac mpg123"
 # Mycroft can do this itself on the target, but it's quicker to do it here
 RDEPENDS_${PN} += "mimic"
 
+# pgrep is used by stop-mycroft.sh
+RDEPENDS_${PN} += "procps"
+
 SYSTEMD_SERVICE_${PN} = "mycroft-setup.service mycroft.service"
-- 
2.28.0

