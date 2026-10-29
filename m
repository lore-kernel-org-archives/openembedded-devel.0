Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.862.1793316672292494107
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Oct 2026 16:31:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=ud+F+I3w;
 spf=pass (domain: gmail.com, ip: 74.125.82.52, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1a3c08d6928so128849c88.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 29 Oct 2026 16:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793316672; x=1793921472; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IWBKg2E2A91Sbnyhdc/wy0z2b7PaWzPrGBi9Og3+4jk=;
        b=ud+F+I3wAteBNH3MKDfiuFDo3pJcWX9WrL+zgOVbzd5Gx8btGw3T75AkeRtSWq4cVJ
         /5oQzfkIq2neSiWS3N1H2yofG7KH0xOEzVNTJtAN0dRR5qURhVQrGhNzLsz6sA5rY95x
         WAuqPQFjoisR52x3adgSoYsigX+QMcApDDrNQ7HBD7iygjrZojAhvoCezThAOrE5uM4i
         NOjlbccUYMwqvn2Cry6Py0/OGxqlHc90zC5VatpZ1QfMLLXIs/Yv62Fny13JocHV4Xac
         yxHg+rPwDdEY0/KDnTTK/GpPxJIFOSWkROwIY7r4wNr/+ryj2dFBwqNmi2kcudQZiA3D
         Nd0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793316672; x=1793921472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IWBKg2E2A91Sbnyhdc/wy0z2b7PaWzPrGBi9Og3+4jk=;
        b=rQag40JOdwfHesFJG2JGroyb0rFhjxRth8vydl1rtBTPKgRcVWfJpdlmypoUTotAYK
         j/WcQeV0+zyucWGqWDjiJDsO0IvZbDXIEHAPRC3HPD9fVACzCWcYvDVNE6BOFKP4aVdJ
         D1qHyeVgBAZNg/X0Ug+hprkSXGR6PsF7dhRw+2ickV1mN4GERKCT0nhWWHrxFf24h2oF
         fvPPdVbQFwBsg+NZwlmKGyE9rLyFHeSyHyHT3fMk6TV64eD7+i/VEdmj/gMpKZ6ImW2F
         fjBqVBN/s0AH9sLQm8fPuDZCfBUwRQWqn4TvrlGI9rezaWBdBOuFJ+rO2Ug91FzcDofY
         wctg==
X-Gm-Message-State: AFq9FYJCDNZrgbm/H8l/bcHszEbSv3NqBDCcc7t5BJbmZqYEktOBCu7m
	OXcUQz/ijM4x/stq3WmA8hEMy3dwmG28tVfhwx+7uzj8xAS9Z4cGDZXupdDHzw==
X-Gm-Gg: AYBFou3qxpF0jKdF79xeiJiFEUUzilYOw/yLh/oUzY1jxblNJSVq8EdpC7GEb3B7Nv/
	SvxlmYUsmggfkbV5hCELzQQzVjYJMl9oThQm5vjFceVA7lTGOBSdAMttsSswIZLqJARJi/0oGkH
	QYKWofLCDD5nBYLK29D6E5vBTFo2oW48S9H3flaFEiNPsjO8jqIeHwnudtuB9ztGDkZnuBRW4t7
	YX9mUSUCltrQzlsMZYNgi+yQ9ZVwqKaFFwdJiAutrcRUPrkK3IcDb5q3b/PSRKCd3lZjf3CP8zt
	ZtyUs0sS4aqbaTEs5V16asowd+bVoI5Yx5NS4BYKaPLmJ1AUDuudh23XehSwrCM7oFrZUnN1zoK
	YsLbCUDyq2enugx6I07Ey7EM/WxPO+HP0iTX6EAOPTo102x+ThuhBbtJP4G/DCtX6b5STxtwUvt
	aTA/4xxFj9Ml58di58wBtfVwTkXyQ541PXQSM7vCJGsVhd3nbyxEjbkRp8nx/9rkrcc9VEogz9D
	COZmXOKk0H4oB1aDod9aYkpwEl0LBnIyvuhit2v6c/x7CN2y3ZJCsK07qBLjV9AUdb6CYrO27eE
	r/0SDy1pKeM1zmO7xHxusHlJGnXdDpSEb3V6GtQ0XA1OUx51YOyVG1OEO2DoTw==
X-Received: by 2002:a05:701b:4515:20b0:166:5552:780a with SMTP id a92af1059eb24-1ac5b028b11mr698295c88.8.1793316671307;
        Thu, 29 Oct 2026 16:31:11 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac192c27cdsm2207349c88.10.2026.10.29.16.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 16:31:10 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 2/8] ctags: upgrade 6.2.20260823.0 -> 6.2.20261011.0
Date: Fri, 30 Oct 2026 12:30:56 +1300
Message-ID: <20261029233102.1177876-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029233102.1177876-1-ankur.tyagi85@gmail.com>
References: <20261029233102.1177876-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 29 Oct 2026 23:31:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131671
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../ctags/{ctags_6.2.20260823.0.bb => ctags_6.2.20261011.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_6.2.20260823.0.bb => ctags_6.2.20261011.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_6.2.20260823.0.bb b/meta-oe/recipes-devtools/ctags/ctags_6.2.20261011.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_6.2.20260823.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_6.2.20261011.0.bb
index 0f01c137f5..e2f6b309ef 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_6.2.20260823.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_6.2.20261011.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "f25245f010f206c251005614c6c41be3b49c6cab"
+SRCREV = "82494361bb3e7d4f7cf1d2bdc0d0e9001c926e45"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https;tag=p${PV}"
 
 
