Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web09.9391.1609946268319849908
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Jan 2021 07:17:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=D26FtQPH;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id g20so5581173ejb.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 Jan 2021 07:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=QS7ZKdoOVFhPs/s8D9W9uBwFRtNA5JJMayXBE0ykqgE=;
        b=D26FtQPHhv3ISmdTZNQbIaM+05t3mX0MHN3UpnfK5suG8rft/oW/krakZKcRI8Ti1n
         vWAD4ULdfrQuZorXfUNv/5L9QwdUyjgHyh7Zu8d122pVvaRH4i9K5wSQaepv17YJdpS/
         UUAkuocj230w4sXjUAxrzttCVvev9Y0+6zhDHfg5qX2bTaz4NpLkLJfPqO4191jBl5F5
         1FZ3mwKc0jsaZB9MhpgyRExvz4zdlCY1DkCFoNXUucHVG/cSQJSpHWRMcoJM91JQlq8/
         ZiM/27JkG1S/kPBP7jXV2K+v41MtMQNnAzqtSVyZ6Ij00TYdmmh59YgwQGJf3sVJlZ46
         tJQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QS7ZKdoOVFhPs/s8D9W9uBwFRtNA5JJMayXBE0ykqgE=;
        b=lGf0FxnFGAxPmK2OqN1vFi70EZAiNr3/Tp8lQGoNGRCXfJ5ApstGUx7Cp4WhCZCpCE
         g18ZiuqUnvNg6+PUMewxY7bFqabyaTAKSlrCy8k2fv/fdYLF/QQXZp+6Yb4IwJIcLeti
         JxQ4PGrPZYyunThmK5+PhM96nmgtEIp0OdhHZDJdYPfg2YnZouqtCTv9bSbMLCD49wnV
         vnLjNwh8Cjf9nYTG5fo+V0EzRzwfqzyf4hXVH+aOOSTeYC8Z/p6I8HbRCjbeuOCcACrx
         zPGNkprLLp1unNqp8wddKxRiHTumO6lS9954NrQFH3TW+ZwW1R80m05QiXnLvN6o/VU4
         57ZQ==
X-Gm-Message-State: AOAM530xkOn5QQGf1toS0piK2NBJlWYbCzEZBsbtMgprkLOudN0ujUKz
	XhQNeDOMF751bWXbxNR8K5YsYp/YZVdWqw==
X-Google-Smtp-Source: ABdhPJy4vllh/0sy5M10IQ3NnkKroBnzu2+LUVhXoeThXAlXRyBR1uhqKA7X+V0aNC1c8d6u+4CKaA==
X-Received: by 2002:a17:906:2681:: with SMTP id t1mr3182500ejc.29.1609946266946;
        Wed, 06 Jan 2021 07:17:46 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f47431850a04677ec24921a.dip0.t-ipconnect.de. [2003:f0:7f47:4318:50a0:4677:ec24:921a])
        by smtp.gmail.com with ESMTPSA id lc18sm1366899ejb.77.2021.01.06.07.17.45
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jan 2021 07:17:45 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 14/28] thunar-volman: upgrade 0.9.5 -> 4.16.0
Date: Wed,  6 Jan 2021 16:17:03 +0100
Message-Id: <20210106151717.1779543-14-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210106151717.1779543-1-schnitzeltony@gmail.com>
References: <20210106151717.1779543-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 4.16.0
========================
- Remove GLIB_CHECK_VERSION IFDEFs which are obsolete after glib bump
- bump glib (and gio, gthread, etc) minimum to 2.50.0
- Add README.md to EXTRA_DIST
- Translation Updates:
  Turkish, Vietnamese

Release notes for 4.15.1
========================
This is a development release of Thunar-volman aiming the upcoming
release of Xfce 4.16.

- Fix typo in README
- Adds new README.md updates AM_INIT_AUTOMAKE
- Translation Updates:
  Albanian, Amharic, Arabic, Armenian (Armenia), Basque, Belarusian,
  Bulgarian, Catalan, Chinese (China), Chinese (Hong Kong), Chinese
  (Taiwan), Croatian, Czech, Danish, Dutch, Eastern Armenian, English
  (Australia), English (United Kingdom), Estonian, Finnish, French,
  Galician, German, Greek, Hebrew, Hungarian, Icelandic, Indonesian,
  Interlingue, Italian, Japanese, Kazakh, Korean, Latvian, Malay,
  Norwegian Bokmål, Norwegian Nynorsk, Occitan (post 1500), Polish,
  Portuguese, Portuguese (Brazil), Romanian, Russian, Serbian, Slovak,
  Slovenian, Spanish, Swedish, Telugu, Thai, Turkish, Ukrainian, Urdu,
  Urdu (Pakistan), Uyghur, Vietnamese

Release notes for 4.15.0
========================
[Please note that this is a development release.]

- Use icons from icon theme in the dialog (!3)
- Add new app icon and switch to rDNS
- Remove PDA tab (!1)
- Avoid critical error when closing preferences dialog
- Support libxfce4ui XfceTitledDialog new API
- Translation Updates:
  Albanian, Belarusian, Bulgarian, Chinese (China), Chinese (Taiwan),
  Croatian, Danish, Dutch, Eastern Armenian, English (United Kingdom),
  Estonian, Galician, Greek, Hebrew, Hungarian, Indonesian,
  Interlingue, Italian, Japanese, Lithuanian, Portuguese, Russian,
  Slovenian, Spanish

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{thunar-volman_0.9.5.bb => thunar-volman_4.16.0.bb}        | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/thunar-volman/{thunar-volman_0.9.5.bb => thunar-volman_4.16.0.bb} (74%)

diff --git a/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.9.5.bb b/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_4.16.0.bb
similarity index 74%
rename from meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.9.5.bb
rename to meta-xfce/recipes-xfce/thunar-volman/thunar-volman_4.16.0.bb
index d499e22ea..138796e6c 100644
--- a/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.9.5.bb
+++ b/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_4.16.0.bb
@@ -8,8 +8,7 @@ inherit xfce features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[md5sum] = "f9ef39ed4bbff05eb74058dfff24dd84"
-SRC_URI[sha256sum] = "7ea7c6693334f2248cf399586af8974dfb7db9aad685ee31ac100e62e19a1837"
+SRC_URI[sha256sum] = "d2c0e719b242b7fd3db70bc6678a2df1abf2cfaa899b775a1591a5efa08a547d"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[notify] = "--enable-notifications,--disable-notifications,libnotify"
-- 
2.26.2

