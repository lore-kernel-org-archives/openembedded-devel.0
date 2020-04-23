Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
 by mx.groups.io with SMTP id smtpd.web10.1914.1587682453775779180
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Apr 2020 15:54:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=untsaTLY;
 spf=pass (domain: gmail.com, ip: 209.85.214.193, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f193.google.com with SMTP id c21so2167172plz.4
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Apr 2020 15:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LMAwybacUmdGe6DIah6eF7zzqjjcTuFLX8rQWUYi4Ts=;
        b=untsaTLY9pQILCDQ5pT3wnbAqqxQ4Xln92IzLMXP0/b13Yw3po0HXMPGnisBhiWynb
         EV7LH5qNpZEz+99ZAflm8L9xZj10Ej3/6rCKfVHzCu0nXtP50k+AXOhHnK3zcGSuwp2c
         f9iLywGwSL2GdnbbfApdyMsGGrZCtcp08t8T9cEpjfEjNNdQbm/BCNYb0KHiboq3mC0p
         hv5o+YNMVAtSOTnDxXuhxi33DR/QYnFV7f9v47N9GMNKBPDBHcjcu3O4SwSC5zP5R1Tg
         doF5q8vBkfWgeTgKyPXomtkQ/mAZ6qQoIBWiXBD7VBSz2w0xy5p9dgbqvuPWYbAUo6H4
         snkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LMAwybacUmdGe6DIah6eF7zzqjjcTuFLX8rQWUYi4Ts=;
        b=MojKmyShJo8+7hibNt34h2AnY/JYutmJdNvdQVkjTXpmr1iFhhQDz+UJnemMl4tVbI
         D+1gQQSNgoAvwhN0lI0ke5VWHf76jY/BEtO9UjWdgt5PDgPfxfqANHr4Zcf5ojZ1HyRs
         zOSyVStuykvrxNDxUtXtr+s5IEuSttS0dG62HqyEq0nmwHdSHR8FYqk4xWK+VZjxj7bE
         XCOwNGbNI8gY/CG7dAXjFNBuL2HyeojoEpYHltdd/xFONe0ijxLwrAhepTRgYspeTuog
         tsQpLjB1nsoeL8p87RYnGxq+IVe9uKRaTWzSCZcbye6yhMrWQQGZruKWvLTCGPRKKq5h
         tZ8g==
X-Gm-Message-State: AGi0PubKOjQMicmSHJBDeCPkByz1ZM5J8i0rc06pMDMOoMeJf1HWt6eO
	Y7ufhMkuCWrkkiMuwZ+zItlI/pVuhB4=
X-Google-Smtp-Source: APiQypJB1AuylR/bciwnVCs+NgItmtrI/bY7Ik3jyqz512uzdE7R6k0RjqaUQlZ7OIUUf7ahmB3o5g==
X-Received: by 2002:a17:90a:5b:: with SMTP id 27mr3299743pjb.190.1587682452851;
        Thu, 23 Apr 2020 15:54:12 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::1a60])
        by smtp.gmail.com with ESMTPSA id 128sm3654153pfx.187.2020.04.23.15.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2020 15:54:12 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] rsyslog: Disable valgrind dependency for riscv32
Date: Thu, 23 Apr 2020 15:54:09 -0700
Message-Id: <20200423225409.3180706-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/rsyslog/rsyslog_8.2002.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2002.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2002.0.bb
index 6a90614bfd..8605145ebc 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2002.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2002.0.bb
@@ -191,6 +191,7 @@ VALGRIND_libc-musl_powerpc64le = ''
 
 # RISC-V support for valgrind is not there yet
 VALGRIND_riscv64 = ""
+VALGRIND_riscv32 = ""
 
 RDEPENDS_${PN}-ptest += "\
   make diffutils gzip bash gawk coreutils procps \
-- 
2.26.2

