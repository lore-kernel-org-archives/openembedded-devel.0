Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web12.20526.1600613461283881492
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Sep 2020 07:51:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jQAuwqTY;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id u21so14333361eja.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 20 Sep 2020 07:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=vlG+VX1HltacT6uFABwOo9Xz8QwveyIo1OTCooUQgjs=;
        b=jQAuwqTYj3VcLtV1TEg8sdi+JulWXkfzUzmryS9M272QJYwB/ztS5xvBtX1jGtv9CK
         J7+GD7yeyKwWKlbx9NLlLN8/pVElYVlDb/ZBrcQDQ+kWI4A/rq0kegXhtMouBjbnJjst
         KrRDD0RXVpM6wpuwT33jnApGmqK0pVt95cr+tX2YEPqNdXJOBi8i4ZLKyk3vRtuXTKIm
         RTbWdhvTxMRyCT7Of1ZDecbZAuwDKRbla/rbNtKjhcJdg+oo+KF1bZfkc52RCbgTqJk7
         gfdag7RGB3OnekDvk+V3jyOfPxbc3PKV0H3xiwYe5wlBlICcqBl/eoWAoUE9DmDjkeTn
         TbFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vlG+VX1HltacT6uFABwOo9Xz8QwveyIo1OTCooUQgjs=;
        b=mGbz90Jxt8qHJJY8gTm/EWkHDhQjlm75tDkWknXZ0fM/fJjqzw3D5cdS+3DDZtWmi/
         IUykJ5P/wIj74Q+Z4JSQCYBJ4ULNfhLzcVu9ikMeszKUB6d05jpppY8qUbOxsK6fDRoJ
         u2oxqE3FmUgVfCndqsh7rGUas+lPDa7PlWox64zk56wIGAlG69f3IbGoI+GQ3u2BSxRe
         Eru6XYMlsVzZOg770kMq4+hdS7MUkSIPV8z4i5DAmrM8YcclJOZkQ/H9iYNVMTcZaHhG
         n8JxlERoPH6C6B/78jXQs45KHEuLfykvzp1UKvjfC4Mr2uO+y3b93pdQ/hlnNtrmoBqI
         JTkQ==
X-Gm-Message-State: AOAM533X9KMNeXcDa/6mQR5Kp5wuqdlIN86sZ5AgVpJxrz4MWGORLc3u
	m0eRUDwi5LJcqYnUpmPrEOwuV31PMQI=
X-Google-Smtp-Source: ABdhPJwNXTGt8BMIEpI4Y+xJT9YjbykZijVd9/BSpM/HEHwvqaCRaBzKxsXiU6NaUFc52gHZpENAuQ==
X-Received: by 2002:a17:906:a1d8:: with SMTP id bx24mr44481335ejb.161.1600613459412;
        Sun, 20 Sep 2020 07:50:59 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f33b24861ef8a9f58bb5121.dip0.t-ipconnect.de. [2003:f0:7f33:b248:61ef:8a9f:58bb:5121])
        by smtp.gmail.com with ESMTPSA id m10sm6785777edf.11.2020.09.20.07.50.57
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2020 07:50:58 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 10/11] live555: upgrade 20200721 -> 20200819
Date: Sun, 20 Sep 2020 16:50:38 +0200
Message-Id: <20200920145039.2240-10-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200920145039.2240-1-schnitzeltony@gmail.com>
References: <20200920145039.2240-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../live555/{live555_20200721.bb => live555_20200819.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-multimedia/live555/{live555_20200721.bb => live555_20200819.bb} (97%)

diff --git a/meta-oe/recipes-multimedia/live555/live555_20200721.bb b/meta-oe/recipes-multimedia/live555/live555_20200819.bb
similarity index 97%
rename from meta-oe/recipes-multimedia/live555/live555_20200721.bb
rename to meta-oe/recipes-multimedia/live555/live555_20200819.bb
index df85cd484..c746b6e97 100644
--- a/meta-oe/recipes-multimedia/live555/live555_20200721.bb
+++ b/meta-oe/recipes-multimedia/live555/live555_20200819.bb
@@ -16,7 +16,7 @@ SRC_URI = "https://download.videolan.org/pub/contrib/live555/live.${URLV}.tar.gz
 # only latest live version stays on http://www.live555.com/liveMedia/public/, add mirror for older
 MIRRORS += "http://www.live555.com/liveMedia/public/ http://download.videolan.org/contrib/live555/ \n"
 
-SRC_URI[sha256sum] = "89b2d99589de2ce9b4007ea6625dfce28317421604cf5131f4e1bf5bf7040b63"
+SRC_URI[sha256sum] = "af3af7f2510b0b45f38892c232abca2cee2ab36a62503e7085b47ed2c3c2c537"
 
 S = "${WORKDIR}/live"
 
-- 
2.26.2

