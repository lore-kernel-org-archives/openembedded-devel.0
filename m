Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BAB9D6D225
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 13:47:05 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.42287.1766065624261277013
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Dec 2025 05:47:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WB+mitUd;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-42fbbc3df8fso299416f8f.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Dec 2025 05:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766065623; x=1766670423; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sFz3H8rawJrANqDbGi8NBscNDtr2AWnI+JYNzOInpoY=;
        b=WB+mitUdD0O9+rXhExIlYOsMLeTJZg6WPcLf+gb1O1/ZZ9dFEY8poJCusx+hUw6rv4
         gG0SZA+MCS4+S9BUbYwrwkmxpLTwcHxPEFsiDvm2y+J7tq11fuqnhNTRXwTcFdp4yBzN
         Zma7AoGIaa6dRiDTHo2Cyl6mjZ7joQ4w9adYXCnqQpHp0utx+VIx6UgdsAiDIKInCBy2
         mLXXKSDXrSMVJWzvRKnTemDLx4ZxjXni0vYJHLD0BhhUEE3GAznMzeCTzQiYD0nm/Q12
         wXADVWeeBofQ9oT1NY08/KsUDmF3z+rJLAPFpTZL6sT/UYUXuopx+qbCGz1EuXUn9qoO
         2D9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766065623; x=1766670423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sFz3H8rawJrANqDbGi8NBscNDtr2AWnI+JYNzOInpoY=;
        b=a6KmkAURhmU1q7efpNSRBSwghbF0iPaETS/h+NmPYjOn97oiJJqRZZdHS835zOy5bS
         IAJ93kkUZDmSCxvjrSJ5EEXV0I0pvfAAU59YFNKZAC7v1oL1jjaqVQwdRUaspdgGkrDw
         oQ7wjgNq6yAZaK7InN1CmBbzfDrOjjFan7+BN2V0tUWckyT27Pz6v0jyNlSJNKM9d8OJ
         1yC3rfNlKSMnBEwPHhaPtYgD2Me4V5vXfUVH2fpYCxWWJoMMsErMxFYLNDBSbDYE43wj
         gCkBE2jupd895J1d92PT/sOGP4bvjYagnDE6mxAiRzlMs5p+V3GTHCbbJLFapDLsndeh
         /7ng==
X-Gm-Message-State: AOJu0YzCNH2i58+IqG278n4bDgAI/VBI0GzwzormpoGXgbST38+3+W9k
	olo1qKX+9LlVGQu+X3YdZ2J3WnfzeQ1/wDrh7cFr5P4IEacqUShpKCDQIRti8Q==
X-Gm-Gg: AY/fxX56zxiN6+CeGuuS4hsCqLZDvdZieFa6Q/iaCx0q4AMvdAf5yyb3o+DhbYa9Ok1
	bY99cYBlPvJ0ic9DFHlIr/bqUro2XwfadT6k3yL3NEMftpCc7l4yPkmS4ospoNKzbI6XIHNzoOf
	va4noAv/3ycz5TLBzgRau06EL0sNtLNfJMKkJknol2jZshn3IBjnPDdZrwliGihO3GKbczU1cNA
	Fl2AkJmbtGNts69Huwshkn81M1ZJIY7ocaF0g/PpuKiQt3Tfy4ajDuDiLOJE2SS2EPCVHyPsXMp
	tbnqOQcdPFsDOCBA0r+W3HxWW18rPJOltkcI6muiVJK9pEKfi1CCcGUyil2VdLpA3r1OH6SJ6LY
	aTp3HrAwNqGcAcB4dpo7+ylm9srTWu/dtStCWjK5bNqG5SA2YHINM6Z7KjcmOapiTuOnnhAxzFk
	K6l8EXB8Iw
X-Google-Smtp-Source: AGHT+IFMeC6aD6hgyOqYiZlBHjEPSoBk/RF5P2aW6qJvuaQkYVIcRTHyy+723GrjcgjL/JJDtFUliA==
X-Received: by 2002:a05:6000:2909:b0:401:5ad1:682 with SMTP id ffacd0b85a97d-42fb44b764dmr21366916f8f.14.1766065622483;
        Thu, 18 Dec 2025 05:47:02 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324493fda5sm5272239f8f.17.2025.12.18.05.47.01
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 05:47:02 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-webserver][kirkstone][PATCH 3/4] phpmyadmin: upgrade 5.1.3 -> 5.1.4
Date: Thu, 18 Dec 2025 14:46:59 +0100
Message-ID: <20251218134700.3509105-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251218134700.3509105-1-skandigraun@gmail.com>
References: <20251218134700.3509105-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Dec 2025 13:47:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122766

Last bugfix release of the 5.1.x series.

Changelog:
- Fixed sorting the database list with "statistics" enabled on "Data" column creates a PHP type error
- Fix for invalid cache when losing access to config storage after it being cached
- Fix session cookie not respecting the CookieSameSite configuration directive in PHP 7.2
- Fix create index form accepting too many columns
- Disable editing to system schemas
- Add better error handling when IndexedDB is not working
- Fixed incorrect escaping of special MySQL characters on some pages
- Fix GIS visualization with an edited query
- Remove the use of the deprecated `strftime` function in OpenDocument exports
- Enable tabindex recompute on preview button while insert new rows
- Fix invalid SQL generated when PRIMARY/UNIQUE key contains a POINT column
- Fix setup's CSS not loading when the URL doesn't have a trailing slash
- Remove jQuery SVG JavaScript dependency
- Fix column visibility dropdown when the column name is too long
- Fix issue when exporting using Firefox or Safari on PHP 8.1.4
- Update JavaScript dependencies
- Fix case where errors were thrown when browsing a table
- Fix UI issue when user accounts page has the initials navigation bar

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../phpmyadmin/{phpmyadmin_5.1.3.bb => phpmyadmin_5.1.4.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-php/phpmyadmin/{phpmyadmin_5.1.3.bb => phpmyadmin_5.1.4.bb} (94%)

diff --git a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.1.3.bb b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.1.4.bb
similarity index 94%
rename from meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.1.3.bb
rename to meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.1.4.bb
index 85a18dfd1e..0b855735cb 100644
--- a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.1.3.bb
+++ b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.1.4.bb
@@ -14,7 +14,7 @@ SRC_URI = "https://files.phpmyadmin.net/phpMyAdmin/${PV}/phpMyAdmin-${PV}-all-la
            file://CVE-2025-24530.patch \
 "
 
-SRC_URI[sha256sum] = "c562feddc0f8ff5e69629113f273a0d024a65fb928c48e89ce614744d478296f"
+SRC_URI[sha256sum] = "3230cf0e004b6284c70e0cb26064a8666b271749ef54236d035104a972822999"
  
 UPSTREAM_CHECK_URI = "https://www.phpmyadmin.net/downloads/"
 UPSTREAM_CHECK_REGEX = "phpMyAdmin-(?P<pver>\d+(\.\d+)+)-all-languages.tar.xz"

