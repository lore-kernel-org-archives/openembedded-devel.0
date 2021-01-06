Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.9414.1609946271757260607
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Jan 2021 07:17:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Vqcub5Wq;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id ce23so5471610ejb.8
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 Jan 2021 07:17:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=IP8inn6pNufcs/sph/1w86vX9FMEgqFIIEyYux5Z+94=;
        b=Vqcub5Wqm20FCRiwb6JN6dNrVH5imDHyTKFldmDiE8RSXdStx/DFQ6gAfGIt+1KAt9
         lJkTEsIpmsx+YEgJUUglZnl0Vd1Iy7x7L0hj8X6en2IjZ6PeypnaSdHsSD0PckQGgLfH
         2gzumHKTTmp8XTTtPegrBRgQn3Pn67yrJqyUV4CD8kWr9hY5H3DBfIoYig/CnLPnd7wL
         QXpoTHPPrztiEfBq9zGfWSmjHrmsVQk9firGiJUa+LC75X09C1CHZMQF+CIp4XOpijDd
         Wb309iHPQ01/nJZcB5sVx49udsteQpasazPpT0ks0a8KAdeWm+0sIH5Ynt2FQwccLLUu
         5uJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IP8inn6pNufcs/sph/1w86vX9FMEgqFIIEyYux5Z+94=;
        b=kRvekLxyqoQmXAmgoVaGxuQbaWy50TuSk6YNA9E/tB1noMVg16GooMp7+5MK+PNim5
         BE7uCmagrLGGCbZYvfPojR84C2628IshhP32EMXYQf31Uup0gQzYsFsuFGpgashrqhGO
         6caxs4nNkgMmUNh9B8gRC/IczkbJGMnuyERgr1frPaN7bl5Dz9XCOMuecaMyD960klvJ
         pUt+uLla8iCkGbl6XvdtQPvDpMoOEBrBK36YWdx+Fgwvi1OC+qBHi2dgp8gWFBABhX4i
         0SpbPOaPSMRh+x7Ow5WKGRmcKndw1ntc6NYmYIudaE31HSBTZ5KvWrlNOXtVsP0yU4mV
         Am5Q==
X-Gm-Message-State: AOAM533BXEL6c75f+Rjoe5J0OPr6nhMyenh0S7sJiGgVycEauX0ZHm79
	CE12SvXH1zLCm+srBKImFsUxNWHdOhBHLA==
X-Google-Smtp-Source: ABdhPJyfMnKNuXCiMSwAzXZL7lTn/qYm8pMibJtLY9PQD8RmAbmLDcGH8GnliCKVU+iOfBh8Tjh3MA==
X-Received: by 2002:a17:907:3f93:: with SMTP id hr19mr3355893ejc.235.1609946270387;
        Wed, 06 Jan 2021 07:17:50 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f47431850a04677ec24921a.dip0.t-ipconnect.de. [2003:f0:7f47:4318:50a0:4677:ec24:921a])
        by smtp.gmail.com with ESMTPSA id lc18sm1366899ejb.77.2021.01.06.07.17.48
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jan 2021 07:17:49 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 16/28] xfce4-appfinder: upgrade 4.14.0 -> 4.16.0
Date: Wed,  6 Jan 2021 16:17:05 +0100
Message-Id: <20210106151717.1779543-16-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210106151717.1779543-1-schnitzeltony@gmail.com>
References: <20210106151717.1779543-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 4.16.0
========================
- Launch applications reparenting them to init
- Bump gtk minimum version to 3.22.0
- bump glib (and gio, gthread, etc) minimum to 2.50.0
- Translation Updates:
  Albanian, Amharic, Arabic, Armenian (Armenia), Basque, Bulgarian,
  Catalan, Chinese (China), Chinese (Hong Kong), Chinese (Taiwan),
  Croatian, Danish, Dutch, Eastern Armenian, English (Australia),
  English (Canada), English (United Kingdom), Estonian, Finnish,
  French, Galician, German, Greek, Hebrew, Hungarian, Icelandic,
  Interlingue, Italian, Japanese, Kazakh, Korean, Lithuanian, Malay,
  Norwegian Bokmål, Norwegian Nynorsk, Occitan (post 1500), Polish,
  Portuguese, Portuguese (Brazil), Romanian, Russian, Serbian,
  Slovenian, Spanish, Swedish, Telugu, Turkish, Ukrainian, Uyghur,
  Vietnamese

Release notes for 4.15.2
========================
Please note that this is a development release.

- Add small delay before reloading menu tree (!6)
- Clear entry's error icon and tooltip
- Update copyright year
- GitLab is the new bugtracker
- Remove unnecessary code for unsupported glib versions
- Remove padding from context menu
- Fix memory leaks when sorting items
- Update README.md
- Apply light blue to 16px icon
- Improved and simplified icons for better scaling
- Add back git tag
- Remove extra spaces in configure.ac.in so xfce-do-release works as
  expected
- Translation Updates:
  Belarusian, Czech, Hindi, Indonesian, Slovak, Swedish, Thai

Release notes for 4.15.1
========================
[Please note that this is a development release.]

- Drop close button
- Add new app icon and switch to rDNS
- Limit popup completion width to be same as entry
- Switch to a few symbolic icons
- Add keywords to .desktop files to xfce4-appfinder
- Translation Updates:
  Albanian, Bulgarian, Chinese (China), Chinese (Hong Kong), Danish,
  Eastern Armenian, English (Canada), Estonian, Finnish, French,
  Galician, German, Hebrew, Hungarian, Italian, Japanese, Kazakh,
  Korean, Lithuanian, Norwegian Bokmål, Portuguese,
  Portuguese (Brazil), Russian, Spanish, Turkish

Release notes for 4.15.0
========================
First development release targeting Xfce 4.16.

- Record last commands only once (Bug #15767)
- Sort by frecency (Bug #9265)
- Switch to README.md and foreign automake mode
- Move from exo-csource to xdt-csource (Bug #16717)
- Make Preferences button always visible (Bug #16489)
- Fix gtk version checking
- Hidden option to disable entry completion (Bug #15827)
- Use casefolded string when searching for apps not commands (Bug
  #15893)
- Translation Updates:
  Albanian, Amharic, Arabic, Basque, Belarusian, Chinese (China),
  Chinese
  (Hong Kong), Chinese (Taiwan), Croatian, Danish, English (Australia),
  English (United Kingdom), Estonian, French, Galician, Greek, Hebrew,
  Hungarian, Icelandic, Indonesian, Interlingue, Italian, Korean,
  Norwegian Nynorsk, Occitan (post 1500), Romanian, Russian, Slovak,
  Slovenian, Spanish, Swedish, Telugu, Uighur, Vietnamese

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{xfce4-appfinder_4.14.0.bb => xfce4-appfinder_4.16.0.bb}   | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/xfce4-appfinder/{xfce4-appfinder_4.14.0.bb => xfce4-appfinder_4.16.0.bb} (69%)

diff --git a/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.14.0.bb b/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.16.0.bb
similarity index 69%
rename from meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.14.0.bb
rename to meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.16.0.bb
index e4f35b0fc..39198306b 100644
--- a/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.14.0.bb
+++ b/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.16.0.bb
@@ -8,7 +8,6 @@ inherit xfce features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[md5sum] = "03b226a2ee20f95243e74d1868e94e0e"
-SRC_URI[sha256sum] = "7ec175d4954fceb2e76cbfbca76ac4a4f53fe799d097a14117e7de68e88a4d98"
+SRC_URI[sha256sum] = "37b92aaaeeec8220ed23163cf89321168d3b49e0c48b4c10f12dc4a21fdf0954"
 
 FILES_${PN} += "${datadir}/metainfo"
-- 
2.26.2

