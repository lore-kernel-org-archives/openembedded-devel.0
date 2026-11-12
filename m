Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6945.1794459224827291336
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Nov 2026 20:53:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=yaMGB60U;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8b0d63f60bcso51727417b3.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 20:53:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794459224; x=1795064024; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5wiKWqEBw8zYTK4vIr1c0+vObByFfQzos9pTNdc2HFU=;
        b=yaMGB60UrWHkV5EsVq2Yyn7DuPbN7rsITq0tk6efLXPLzf37r0468ovJJZOH0veSNw
         yszeatBrzDU3Qzg7o5PMu+/vX2qPkJi/6sOViomnEKFuEhUIJ+JPEWPDU38O4HJ9AY1M
         ydxLotb3Wq59CDH2xgShUVZTS557GWS88q7PSKDnaJHvWNyOhDb4MEmoGFvHwqESSYZy
         A7rLT1JN17IpSS4tPNSCqGqNNkREd2teUdTwIT1YVPakVyXd4my8qlafrSHeyVDf617x
         1/R1kDRgqD3v4ZtIQTfJXD+FuCetWZb4RQWSQk+nTLcY7dMXmaOO8X3wUGeZXLqWomEQ
         kxvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794459224; x=1795064024;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5wiKWqEBw8zYTK4vIr1c0+vObByFfQzos9pTNdc2HFU=;
        b=oQO4YJajvojTTmYE8NkAKPbT74QShBNQYICenj8SooqUrlJDAlxP+K4zRdPu+7fLEJ
         8DXtuBmCUlTNvsWFUTICtH/zGTugwzcWJsbs+55hKi4aiQnortpRfGppXS1L95aDQkX+
         /lObYpIXvBk73oP8pUuHezNJ3lbLwbjkPbikKkVcy1rKhYF+sQlxLfLYX3rM7yVIPH/p
         KH6tu0EYK0Twz/hbKNtyeesT2JkNycLyMZgXzTs69zrUrxRTOBZZJq7wvHk2pCjUJ6Yl
         BDKTZeAUcKdvAIVIvyC9rDQ7fyZMHSVzpPEoi+JoZJ04o2Sc1Csj8JmHGQyMJaZZURg9
         1MHg==
X-Gm-Message-State: APuU4Z/IwlzA/W5NtdQC6rlsDFtzAGKOE1hk5tIq7H2TaI7nSFfFd2on
	zjAQkyd0m4P/ntBGMxlB12EXzSE6BbhoIwVtfXhOHzZwX6PYDLwcjwaLrkLIzWmwZ5s=
X-Gm-Gg: AYBFou03kI99194/JW7L39fSDCHO6LPdVbJWlhML6LWZdsoitz8RzVQspcXTfAArizb
	o8YPr94ZF933h9Xz4HzmyneFz9Fygak8FwEdgWUGtUrDaMRZCvKA0YgFzWiwCxVf/caPvo9s5M0
	vPPBxpcFZBxnD5NTjL/48WA3Hot96QgLeIKpd4OKrxgx5403NB4E1LVWJ61KAGCBwmaCqlE9nL3
	IUiIrsXyjC8VYohFYyXbXxByB2VrIed8lZkCDwdd7URtuRNSYclRppQzvdkOvSF1diOcjRH2WUn
	SChhrKJ5s6RqxQg4jRqN2zGptAbp3+hHszKtkAQiNaYC536pdcQRY920U6tCmUpJqsyIE0M37Rv
	GcSvm5/bXAYFLTIPgk18GynD4ANYbQtYJUQzE4qjGF9oSJ9UQ1wjOP0QqzqDjXqDZ8VDNdJL8vG
	aAKi+uSxHYlDBq5wmZHOzCX9SuMM3K7olRG/jSc9ExLQJHU9NUqrZef+2z6SiYXwjw0DadIK5LV
	syWGIx4VUIatgFeMR2+Xt4tA9Fm3i5erHAmk316iTBebsgw6peCSh7t68zE/nb4yLmxSzHMWZ6p
	QBNn2nzpXHc4m8bm0iuDQ9opOtJQtbA5AvG5K4jT+TaqlG/X+8Hl7oftcYPeD0YqcqEHFpIikjh
	I03p+8170pNwUXoWAaI9Q3BbAAOs7dpKSmnaYWYSxKt0trJyVMepV
X-Received: by 2002:a05:690c:9208:b0:8b0:ecb2:8861 with SMTP id 00721157ae682-8b3a820c4a0mr29171907b3.63.1794459223792;
        Wed, 11 Nov 2026 20:53:43 -0800 (PST)
Return-Path: <schonm@gmail.com>
Received: from localhost.localdomain ([71.3.193.106])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b393437e54sm61252647b3.35.2026.11.11.20.53.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 20:53:43 -0800 (PST)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][wrynose][PATCH] nodejs: upgrade 22.23.4 -> 22.23.5
Date: Wed, 11 Nov 2026 23:53:25 -0500
Message-ID: <20261112045326.97145-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 04:53:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132168
Content-Type: text/plain; charset="utf-8"

This is the November 2026 security release.

  7 high severity issues.
  6 medium severity issues.
  3 low severity issues.

High severity issues.
  CVE-2026-123863
  CVE-2026-123864
  CVE-2026-123865
  CVE-2026-123866
  CVE-2026-126051
  CVE-2026-123872
  CVE-2026-123874

Medium severity issues.
  CVE-2026-123828
  CVE-2026-123867
  CVE-2026-123868
  CVE-2026-123871
  CVE-2026-123877
  CVE-2026-123875

Low severity issues.
  CVE-2026-123829
  CVE-2026-123862
  CVE-2026-106071

https://nodejs.org/en/blog/vulnerability/november-2026-security-releases

Changelog: https://github.com/nodejs/node/releases/tag/v22.23.5

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../nodejs/{nodejs_22.23.4.bb => nodejs_22.23.5.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_22.23.4.bb => nodejs_22.23.5.bb} (99%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_22.23.4.bb b/meta-oe/recipes-devtools/nodejs/nodejs_22.23.5.bb
similarity index 99%
rename from meta-oe/recipes-devtools/nodejs/nodejs_22.23.4.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_22.23.5.bb
index 4dedfe36f8..79a2d91020 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_22.23.4.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_22.23.5.bb
@@ -39,7 +39,7 @@ SRC_URI:append:class-target = " \
 SRC_URI:append:toolchain-clang:powerpc64le = " \
            file://0001-ppc64-Do-not-use-mminimal-toc-with-clang.patch \
            "
-SRC_URI[sha256sum] = "7b9adc82d612d0a2a863d96c46de2292552e250cee51956ebbe0146c42aacae9"
+SRC_URI[sha256sum] = "6cce7c58bf058700c643944903d60a325e8c9ceede1f5c2c088b435f2ada091a"
 
 S = "${UNPACKDIR}/node-v${PV}"
 
-- 
2.43.0

