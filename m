Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 498C1C55179
	for <webhook@archiver.kernel.org>; Sat,  1 Aug 2026 13:12:20 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5262.1785589936861508449
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 Aug 2026 06:12:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=WAubU98y;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-84864086bfeso2119361b3a.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 06:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785589936; x=1786194736; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NFgFEN1qTpWn4tMejt1sedqBPU2itJTi+VNnI/woCnc=;
        b=WAubU98yBSxMsUlK0y9LLjgRw98zRC7n/lKUaKPazMtsXAGVd6eDwtAB4f8AqJOvSy
         X1s4SHF2LaI7etWPjyGzB8u6S9nyTuCCo6AXXGDQpogZBr6VJJcWM3SlIxru4QeVqEnQ
         7XBGtSQ3SbnOKehtzmfs8J3ELw+72A8NDetYj8Q8AVCd+7K37grzBBhABlEIsBxf6/mS
         FZe77a+6uMT/KqGzLHU0I7KvWzVOKtA47Cegs07sm8/mtt6BhZTOTsvu7su96Iejzmhf
         7KFRvVnDVo6fVOYLcxmJa+1N95JBkmrIGpkoM+bGoW8iEeZFnAxodUXdhqggZAW4c7YY
         i0tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785589936; x=1786194736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NFgFEN1qTpWn4tMejt1sedqBPU2itJTi+VNnI/woCnc=;
        b=klTETYjWh9IXnL/DFoQcu3E0DEB6QC2ne3mb1XLFvNg11NZhj8JuozD1egX67bRZS1
         QSYfK75VzpXHxkAJk9ipMbCH7UUAYCLPMAU85mMYE4ZB5YBrNR97V5eqJvdNBmVkaETM
         m1eP1b9iJ890DeaEKifKiMD5FUY2tOqEzH5WQStkwOv3KH4E/QcEc1bKt96FgHVo/9PP
         xRpBfxPkQsYh6wcvp6nj9RU9XaLHL+smR1RGxQMQjg5Gpf0bR6WbnK3blwAZv+myRiF3
         RKA1s+vGCXQsERlPBKeMUTjRry9uNlSX19kPXgOtNyxpfDYgv42z77XoAXR/LbEEBKJW
         +DmQ==
X-Gm-Message-State: AOJu0Yw/CvJ2U7JNYftKnSsqQ0OYO266l1rSjiEsUQrRkW2e5BNqlVkR
	qIYbj+Xsu3bqIlW2ak+DGnZZjFB547oqGDy4VopXlVmtxwEWJ1NdP0Zq0hv5NHV+
X-Gm-Gg: AR+sD11dv4NVMvq+oyv7OHgEQra1be87OClbTfbkDAwuB4nA1AqQfInmcXvWZdqpm5C
	2Q5lm3CircMzSmS5wAAfkBQPxQ9usvZ+O2Do7Cn33Q76Hsk7rvJxQF3XlU/nEXMJA26p6obc04o
	ue+YIbHPpo2duzIRAoZsVmQQIE7VMyw5f1cNsCky+aTAyIZHOhOCsHilxmCaQaDyQHa8psCtwEB
	F2dXsqMxv/ViijbNITRvHDMQhJOxMkquXwB7a6HIarYNgwIufp0UN/DMzFKzXg3RN9Pfuy236eB
	9qiRglSxh6T3EUZdzNqATUmebuURzCEBpADnkQ3ZS3EDB1C1yNbdfmZJgc5Z4ArVi6WunAO+Xpo
	/OdtCVzxpxDtnAeUD/fR0Au+p7wXBPflq9XA3cduvMwbkjO0ZNbtIHlrSojn8DaDdqQQCcZt85N
	L5YYkU+OGRpO2HEm4VWrl4MYD5Q10HL6+oVYCwwuC+CDd/bqrjGlyKzBWhG+fRVHKSvIql3f9YG
	g==
X-Received: by 2002:a05:6a00:4518:b0:848:2f84:733 with SMTP id d2e1a72fcca58-84ee4942c89mr3175698b3a.70.1785589936120;
        Sat, 01 Aug 2026 06:12:16 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edbd35ad5sm1652362b3a.1.2026.08.01.06.12.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 06:12:15 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][PATCH 11/20] rygel: upgrade 45.0 -> 45.2
Date: Sun,  2 Aug 2026 01:11:29 +1200
Message-ID: <20260801131138.3299410-11-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260801131138.3299410-1-ankur.tyagi85@gmail.com>
References: <20260801131138.3299410-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 13:12:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128605

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

https://gitlab.gnome.org/GNOME/rygel/-/blob/45.2/NEWS?ref_type=tags

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-connectivity/rygel/{rygel_45.0.bb => rygel_45.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-connectivity/rygel/{rygel_45.0.bb => rygel_45.2.bb} (97%)

diff --git a/meta-multimedia/recipes-connectivity/rygel/rygel_45.0.bb b/meta-multimedia/recipes-connectivity/rygel/rygel_45.2.bb
similarity index 97%
rename from meta-multimedia/recipes-connectivity/rygel/rygel_45.0.bb
rename to meta-multimedia/recipes-connectivity/rygel/rygel_45.2.bb
index 60a79f5fb3..363f71b989 100644
--- a/meta-multimedia/recipes-connectivity/rygel/rygel_45.0.bb
+++ b/meta-multimedia/recipes-connectivity/rygel/rygel_45.2.bb
@@ -20,7 +20,7 @@ inherit gnomebase features_check vala gobject-introspection gettext systemd
 # gobject-introspection is mandatory for libmediaart-2.0 and cannot be configured
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data x11"
 
-SRC_URI[archive.sha256sum] = "82667b902fc0672e64cf91eb727a70137a8fdfe7a3d9a4c158b0f4b1fc700882"
+SRC_URI[archive.sha256sum] = "20e57b70b15a865d77dc38f9f786abc52c64b111fe5f938a62c28d712df1331d"
 
 GIR_MESON_ENABLE_FLAG = 'enabled'
 GIR_MESON_DISABLE_FLAG = 'disabled'

