Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32762.1793879735513075932
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2026 03:55:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=WXUp3PJ1;
 spf=pass (domain: konsulko.com, ip: 209.85.128.53, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so13826095e9.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 03:55:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793879734; x=1794484534; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G8UrgnoRpem1xxlKHvv/+ww0aaQmMs6KI68zn2WzuUs=;
        b=WXUp3PJ1AnKTgVivQdLx81aaPfAcsKN9UxuiOiPja8ka5Hznl6VejhMStAJJKutOqx
         gV15r8CCqnt0dOXFFNKdtkNBg7k185S9LN0GZgE99hpGDRM1yG8W7fogI7jdYYuC/HYn
         bxR9T7EOQOOuSbqrCBjhQ8kvx2FgKvrB1I7vY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793879734; x=1794484534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G8UrgnoRpem1xxlKHvv/+ww0aaQmMs6KI68zn2WzuUs=;
        b=EtsK9s6OLpHRYBcx7Z6DcmI6LQXfcn4zNaEPEi/sVnyjuJOSYsLC1mVRWyjNgECjFM
         TRCrlbPRMV35WY5TamJiH5Sl2/WND2lxyS5GPZLKDdnYco63XfsdW4i5yIwB4C0ojucV
         aeE56AP6HJW3oXxp78OWkxBPYOqqMregkVDoxJes0XHutjm4KYX5vSXTcXhuRIZKB0Qn
         Z1DsZJ3Y7ppxAFLeN7UDPIyO2Gxp8rTjsn4/biSCXVo/RCPnNWbQD3myPS9c7uNV7gYv
         y9x/GPPJ8L/Vm5cI9n2nsmWgq1k13V+k7oOmRjINMskcmmBPm2qsMsa33vK4/ePu4fnU
         uLOg==
X-Gm-Message-State: APuU4Z83paD6Se9dKgiA8eTufaIvhzF1pAXcLL09PEPuYGpcIUiJ5rS4
	l9OQWGzT/D2wS6xW0GZ8pyDOuQk5CFSwV37/a2UljmpsGjIU2eh//vKILCtDqmK5vSOQ0H9Rlfy
	zar/B
X-Gm-Gg: AYBFou2NKwD23ahl7XROona4H27+apBORSCkrPb9tDT2k/CC34D9W2TvXumENY3lCR2
	d8c3vi0k/4vSfOb5AiMYK/0pz2u3NqAvfZaJq8gp8ca8ef9u66SohHhbSU5K3aapzFJr+mJGheQ
	UEXqooGZmOU1mfx4bt4cD3+d0FLxfZiiGnqpXeSclDdHqdtFHRXR7FvuQB6MJ6HN62GxuF38hqS
	mc059uAa4PLUSBQ5LdeLXmzzPMQfdlQHs+7ng1Xe6sH9v3urWCi0E4fKen4hHxBXmdk+c5Yf8AY
	aVtVDEitAgF1jFk2JWNg1XQwEm5oCq7kk64h7/eVp5I3vvEFye+AK9i/GQNrsQDbsYsYT42NmI7
	Dx3GhPAJKsmgB0E5N18+2O4zlwwJhlffoQl7AAkm67iYKnxi7mNvjLn1qOZal6/OXxVBeOSCu6r
	7zNK1hA1/4tJbO4Y6iO+qIS0rZCliFxtHBxV+8iWEkjFVEEbk8fySrA2QeWeg+FmxhdSQAbTBvj
	q1dxbvsve8DbE1fVIWnbWVfLWnN2pGTgWdbLRCzvd5H/kF/pEluft/d6Bjr66FMkhwP0OQyy/DG
	c7EndQKz4md7QVCoI0+S0jUwVgpt5puB/lasK8jclQLU1zQbE3C/P9xw4/MCiIQZe/ewTACUAR/
	P/yN85bTgJXzAipdn0ngwRucZj5YZSJvlliyVVD6R08JvaqqXvLBpww==
X-Received: by 2002:a05:600c:138c:b0:4a1:f90d:6f4c with SMTP id 5b1f17b1804b1-4ac17ffaff2mr400628805e9.7.1793879733925;
        Thu, 05 Nov 2026 03:55:33 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b4527fed5bsm173720995e9.3.2026.11.05.03.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:55:33 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 06/19] python3-flask-socketio: Upgrade 5.7.1 -> 5.7.2
Date: Thu,  5 Nov 2026 13:55:13 +0200
Message-ID: <20261105115526.634289-6-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105115526.634289-1-leon.anavi@konsulko.com>
References: <20261105115526.634289-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 11:55:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131906
Content-Type: text/plain; charset="utf-8"

Upgrade to release 5.7.2:

- Proper routing of an event called * in the catch-all handler

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...-flask-socketio_5.7.1.bb => python3-flask-socketio_5.7.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-flask-socketio_5.7.1.bb => python3-flask-socketio_5.7.2.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-flask-socketio_5.7.1.bb b/meta-python/recipes-devtools/python/python3-flask-socketio_5.7.2.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-flask-socketio_5.7.1.bb
rename to meta-python/recipes-devtools/python/python3-flask-socketio_5.7.2.bb
index 8471fd8711..81479e40da 100644
--- a/meta-python/recipes-devtools/python/python3-flask-socketio_5.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-socketio_5.7.2.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=38cc21254909604298ce763a6e4440a0"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "6dcbae88b40f2ae99d0f106c751ca2e119b7ccf4a8df95cbda64f56262db99c1"
+SRC_URI[sha256sum] = "6b2f967f24f693f2316d108b2d2125642db856b2681c12e60ded9bff1b8035e0"
 
 RDEPENDS:${PN} += "\
     python3-flask \
-- 
2.47.3

