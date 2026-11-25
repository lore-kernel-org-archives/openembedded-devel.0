Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34788.1795576071826373599
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Nov 2026 19:07:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Q/m6EjOO;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: schonm@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-9215934a14cso28450006d6.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2026 19:07:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795576071; x=1796180871; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xt0WG+0EbXiT7zwp9xa4Jo+anUzZfEfNMf0Ve+kcm7g=;
        b=Q/m6EjOOKfDe8OkjfZe7emwSRyS79gUXaFzmt+gbmKObb1ElFUUEOuJVySOy/1nY5o
         gY5Gg/HQNhUy8J1cDagANlfCi8dHPWTu5ucJ1103+JcL32hrXOdBm6Rsh03oBE5oyZiq
         bfGwYKYACqi3k7bXmQULqyo/l+MYWHzD1LyHK2qPxo4pagoHp3rY4pFEUfAEXqaxcADv
         VRL4477XxeoRnqlwjWm7wNMTepCPOuIweqrDsQzKghnE1yg0/B0bh3chaGLJeFVXx28Z
         1BG40fcrFlnUloyjOx8moyr9lIY7EhqNQWfc6d5mZbEb8y2SIn118q7BbY1HxmPcCo2F
         VdUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795576071; x=1796180871;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xt0WG+0EbXiT7zwp9xa4Jo+anUzZfEfNMf0Ve+kcm7g=;
        b=MfuxJphX1dgUjX3ZoPGMf0FF8SY6HYxcu8RrtDKHzG1iQRRSxtrYyhd/Sybe7QzAjc
         WFBmn5rFVIL/Gr5MMhL/c65iDH1lFmXnTcnGclBmHA905eNGZU5HZcmhfHvhlQ8Novj+
         AG4gPqEODtT9tOT05wAQYREfQuCo5lXtymuVF0iu7/8b7zGO0bt/xXpwKr5QByDY7x/m
         2S2lLJJL4KDQc0FgDhxuwZx1XTomBiO3OKqDtOQm64CxYUVWcKHSIGZZaok18kHJFllj
         zVmAuFjJMHI1wdnEaNzEqYuDiNBjgyLZU4/CdmRSSErLOfZi884l2R9kQYZLlNUjP8kq
         Pjug==
X-Gm-Message-State: APuU4Z+2Yi4h2m7EIubcuBoPRhBMGhaS58SKPGmUlsAlNFjL78ef4B1r
	MJAMcR/SRX+8/JOB6/bEsCyUlQx4vbZ4wp8TSHUstJJ1YtbNvGavoCDKrs5nqe1t
X-Gm-Gg: AZFdTZdsCPcKsvPBM/A3xkjjCcLUPyP6k7MMMbzz8AQCD2R16y0RlBD68N01RSZzvH7
	QLv9w/CryAMYMepmviu2Li7guR8NREux7rP3LrJ2Wp347o/o7wKFh/3vjZECnwh2B1/PNc8Ph5G
	SWSFZ/KUnMqUJoaxk5P3hCBJgwuzl0AZqxQAFEbhZtV9TEs242kZt2ERU5J0RJdZkUpDm0O0msb
	n3ry+5DqNfSUxD08UTrjK3sIecBdHwRBU69LKPvM5kpZeoAZ/EkxGXqAEZfm/iVyhCVb4UeOdTI
	7KOqTQnbLyfukVGMDolf68LLLGjRTqZ9T7Vl9bPSI9R+Caotf4DLTDT4qMygsBLJI2vZ3Q8o7Uv
	ZipyaautHZp6cT/nhO1zifZbqChMLxgQ1+nyxC/YMTsRyt5OUqYQkMLXkYl2AAOJ0rIML4GdCDN
	aYel3sS1im6VaHkqp8qxQY8xfQOwzD4XEKj9oEBiwAizxA6mKFldRnz18mBc0YwlItxwLaA4ghQ
	09kDTpT7DFw55qYmAXay4oXocO665LEZBMIIj4m+MU3yYcExkVq2NnfUbdP6xudJZ1+/xdOLJPB
	4mppwHJpSLzCx+cBASiZaPYs4sUR7aWzhGWjcbuw51kjHm2wicLwiFQQn71AQMUvCVWiZmCp5vs
	NPKUDNGLNnopux0EN50Nq0J8on5vLB5ikbvZ5
X-Received: by 2002:a05:6214:d69:b0:91b:87cc:6d51 with SMTP id 6a1803df08f44-9213476359fmr300424066d6.0.1795576070519;
        Tue, 24 Nov 2026 19:07:50 -0800 (PST)
Return-Path: <schonm@gmail.com>
Received: from testing.lan ([8.40.85.38])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921347a0b6bsm148858816d6.1.2026.11.24.19.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 19:07:50 -0800 (PST)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH v2] libmine-types-perl: fix HOMEPAGE
Date: Tue, 24 Nov 2026 22:07:17 -0500
Message-ID: <20261125030717.6074-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 03:07:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132964
Content-Type: text/plain; charset="utf-8"

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libmime/libmime-types-perl_2.30.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libmime/libmime-types-perl_2.30.bb b/meta-perl/recipes-perl/libmime/libmime-types-perl_2.30.bb
index e6a72577ba..1814d25da3 100644
--- a/meta-perl/recipes-perl/libmime/libmime-types-perl_2.30.bb
+++ b/meta-perl/recipes-perl/libmime/libmime-types-perl_2.30.bb
@@ -5,7 +5,7 @@ is transmitted. Sometimes real knowledge about a mime-type is need.\
 \n\
 This module maintains a set of MIME::Type objects, which each describe \
 one known mime type."
-HOMEPAGE = "https://metacpan.org/release/MARKOV/MIME-Types-2.27"
+HOMEPAGE = "https://metacpan.org/dist/MIME-Types"
 SECTION = "libraries"
 
 LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"
-- 
2.43.0

