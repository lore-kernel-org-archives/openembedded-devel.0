Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1424.1793731032079400608
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Nov 2026 10:37:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=fStRV/fN;
 spf=pass (domain: gmail.com, ip: 74.125.82.44, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1ae18eb9ad0so4649321c88.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 10:37:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793731031; x=1794335831; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vtxVUCDkyrpDZujdFzKfcmFxiGF9TLsSAMOuMJ/F0ZA=;
        b=fStRV/fNnaJHrYJCpCcKrE8CD9GLK0vRj81OyQlqw1vkW4Nim3gnZ5+FPm+PACvXiU
         vgclHGmjnU7M9/1BevPadrlVspL0z1FMJJvva+5SQNbq/ZwtmouqIaUVSo62AxI9+Pjr
         gdUdZ+g5ZU9RE4pvX4DddqrLEeH3qjw/Fh1ljh0h8SIZOWbvncKn+y5W7EK0YSScjyoc
         DG18ianfbyrm88qGwH6jJtIK6fuEb9coKfgv5g00yt/DUboQU1nPqbTythGo+YpD0Ain
         lfnkv5A2geX3Ztpo2bh3H75dPXjhE54ae3bDeryic7GWcZCGMQw/wfbCKQFQrx/aUg32
         dYEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793731031; x=1794335831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vtxVUCDkyrpDZujdFzKfcmFxiGF9TLsSAMOuMJ/F0ZA=;
        b=LveZTLlXP+y9oAhT28laBP5qa8wkw7zbhCNxUi9628b1W4VgyTfdh/cLHHcJuPWIZA
         U0TMbUheSQzdpitDqVv5oeQ+JJioUHZYK/XjNCu9oPnU/sNSlVjsZFI0q7lrjmy4Pdbm
         QXfAS9Gh6lbkZwAeFX1CT4KRxZ7W0AXK7U/NnCqT9rGWibgsVm9/cS+VKxizX0vLgV8O
         bAN0yD0Pim5w/mWB14IrZJBcSI0q2syCy9jV+98tqDUj/aBoA20rQi9jJnJP//guIsJJ
         Ap5+hVHuT/C/pfQD/1VjYoDC+d17OdWIcPf4UxSpHVafsiP04iyWQA5FFZwqeDDE08d1
         6GxA==
X-Gm-Message-State: APuU4Z99tIji0XF/+LmV/Zc7ZIqC0dswyouQ68JlSz98Xl3X4JcrS0zm
	7FyBgtXUIH/uiBp1eX7fBNM+1X8zpwMg5Hx/A+ste+XejeD12xRmID6yE2GtOw==
X-Gm-Gg: AYBFou26xmQEjRlQsjokpGn2m7kL7SGyETXS10A9pZsrM4+te9JtMwCCqX+UnG+wB89
	mLjskJfyJQQTqFLEwPhsUAds3saETIhHsPR65fYHMH8Sebz/hntbdTcKx+GIYzy3K8Yr3HtdBtZ
	XChtVfB4hp1lxQBnjF5S8i52hZulTSYeit/xSN8Guj/XsbVHa2uM86GlvV3+45wRX7jmo5HGVXe
	p07rUR7Uhu40YIqwnD1y2GByOyJjkl8jeku8WbTWC25FPpuVZt6ugXLEAft/jEBFDGNpJfbSlqT
	AoM/ISHD9WX9k/ZCbIYsfIEFpl3smjWb+ezxq+sKpFM4dwOkR8ZbuSMTal5c2/uu9wB8crs9oQS
	S26j140HF8Z6QMHeCbL2e2dyhIqKqdU85rG84fkMDL6gOpbK8ZF8SewTzzKgKGveHpc9uGjUmio
	YErUH60cFaiA08POjCPAjuv4NMAP8vg7HjTf5MGI+Tn0Lp8FVm+fzAeDioBOXqFvA/3pNzFlHxy
	dKWcWm9LRR2ankU8jJbYRgZ1WhQA2cza60XctNX5ObiNLlh6t1qHLnXFK+IWU3+ZqMNcJPQWS3H
	I1WDNque61jtLT5uSxM4sDInYpo9DQf7H7yhQweSTw01jvOhOWPfV5dFIJGdjw==
X-Received: by 2002:a05:7023:90b:b0:14c:8461:b3ef with SMTP id a92af1059eb24-1ac5e6f5132mr26410818c88.24.1793731031316;
        Tue, 03 Nov 2026 10:37:11 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c4f83fsm1192887c88.17.2026.11.03.10.37.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 10:37:10 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 13/20] imagemagick: upgrade 7.1.2-34 -> 7.1.2-35
Date: Wed,  4 Nov 2026 07:36:33 +1300
Message-ID: <20261103183640.919438-13-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103183640.919438-1-ankur.tyagi85@gmail.com>
References: <20261103183640.919438-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 18:37:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131811
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{imagemagick_7.1.2-34.bb => imagemagick_7.1.2-35.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/imagemagick/{imagemagick_7.1.2-34.bb => imagemagick_7.1.2-35.bb} (99%)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-34.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-35.bb
similarity index 99%
rename from meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-34.bb
rename to meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-35.bb
index 7c09525d9a..877aa4dbba 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-34.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-35.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=htt
            file://imagemagick-ptest.sh \
 "
 
-SRCREV = "a0c4bf729a26a5c2feb28b0365b47a8db736078a"
+SRCREV = "5d1bcc55f2c83bc2ff802118b7369756610f3ad4"
 
 inherit autotools pkgconfig update-alternatives ptest
 export ac_cv_sys_file_offset_bits = "64"
