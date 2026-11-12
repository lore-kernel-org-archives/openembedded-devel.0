Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6929.1794458677166760557
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Nov 2026 20:44:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=K01Zv6VT;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8b29b83fdf1so1763038b3a.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 20:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794458676; x=1795063476; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=h0FUFLEZTGzlWamemxAXdZY+ZtgQNv3UyFvsYDXcDYQ=;
        b=K01Zv6VT8r5o6lVsQUkSRfwtX0Qt0qCWUGysDVQqd6hySvHhEvSwuYvkcc3EN6OD4q
         hf2HyFyYnNuuMj9Il53chwZkBDzCISkF0kp/B6VJmWXuUvZS76337PRP18X+qGgkLgSn
         h1+iVbhCDuphkjFudlGkwx5DLMKk5rkU/IHqARvhCYigp5Ev5pmlKZ6WIlCsDb9G8YyG
         o0+Sh/E0C1RzyhGyHv8g+cQk/7WK50j/L/ryX2Ge01P5YMYDil1n+ajltIk3tQlaHLo/
         uXa4QbKSvsheniQV5y4aJvKjJGUfLUaGdf8i2ppBemudnHs3zZ9ofYOa00YtNjzGAMEm
         eY7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794458676; x=1795063476;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h0FUFLEZTGzlWamemxAXdZY+ZtgQNv3UyFvsYDXcDYQ=;
        b=lQCOeP+dptkM1Wiw2NX38xK4iBlY2jOy7BLfZxeg4LpDTg4goxWDe9yCUJu204XFAL
         dqF/wXETGIm4WxkXDwyhx8yu+vnon+vDtCEH29Lpj+5n9Xr8uGT/HDRBq8nOeQ1wI8yg
         mRo/6FLF/Z6geOAfZzePVy3IyjN3ccPqoYiFnywcEu7LVEGA4w9ONKMEz3wbYtj7J8Bt
         vyco+s1qbd+WkeCNjDQkQ2dl+sS/aUSn1ADr8FtCMaqmoKPgJxw9nexGp3pvxLZ8qKYi
         t4CWq5Ivi+N+EUlGGkpbzOnfob1K92ythIYp5zz104X/RwyEGmf1fZhMpRYg0XjrT7fN
         4YBw==
X-Gm-Message-State: APuU4Z/V+x6VFpBx/j96FqWobtZ/Ensff9KCcU46jh4zn2ullUcJg04w
	ldXGUysLWtJQZflzDwDRZJPGoBDR2WfCaKJkcV4CXSheQcQqLt6Co0tfnUma3g==
X-Gm-Gg: AYBFou1dMNYkE+7yWKWjbBTOoRaBtnKm9W1GTHJpbMvKlRysv6aktSHNPPL1BuxXweR
	NRwqQc90yg776c67VQhzfiXl2mPR71RsYjNCTMnRorDAtWxQMT9EELbvvsKGh32EQUki1dpjWKa
	l7qE3HGor8tgKfG1vgwvoB+K0LzSdaIO8emam3jcesaa8hpqjrKT7wNd216GLgET8gZrEob0FhS
	XAiG7zPXeM/Q//c7OTIyKEHvoCgfH0a+kM/vmRm4vlgacm42mdJ5QhsDs3FSqDzcPZu/9iWOhyt
	VbrU26wjGikuxBCa4p5mavWFwLrBMg3LPdhmnKEQwcJrJ/V7p/DNtSi1DOtc0hwSrF+uk5B9VBk
	U9N5A19+UpM81+KF3zuQ8z1p5B1l3gQypCO36R49d3lzAwJscDISwpF8YEexLmXt4uZA8yvLWWS
	xoXp5+pXkYIwFGtoPzrV6KMffwvWbYShIemIUVOJwUrnXaPf/Bt0ujH4QGXBNv95p1/n9wbmGXT
	hzptwNql1rEcUgd7oxUE9UBBt1MTQEuTHyZhtSISShMDCVbXcK4bg/TvETSy+LxXKzbbxx+hF3a
	pORX1ZXFrX03H/dBnyauYayyYwcZ7RQ1X5Sdw1fZV7X26NRiILekAAfgFSjpVw==
X-Received: by 2002:a05:6a20:1446:b0:3eb:a628:1095 with SMTP id adf61e73a8af0-3f2fd18b6c1mr3982688637.20.1794458676240;
        Wed, 11 Nov 2026 20:44:36 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdd8d7dd5bbsm2238527a12.30.2026.11.11.20.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 20:44:35 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][blacksail][PATCH 1/16] 7zip: upgrade 26.05 -> 26.06
Date: Thu, 12 Nov 2026 17:44:11 +1300
Message-ID: <20261112044426.3933391-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 04:44:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132152
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/ip7z/7zip/releases/tag/26.06

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-extended/7zip/{7zip_26.05.bb => 7zip_26.06.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/7zip/{7zip_26.05.bb => 7zip_26.06.bb} (98%)

diff --git a/meta-oe/recipes-extended/7zip/7zip_26.05.bb b/meta-oe/recipes-extended/7zip/7zip_26.06.bb
similarity index 98%
rename from meta-oe/recipes-extended/7zip/7zip_26.05.bb
rename to meta-oe/recipes-extended/7zip/7zip_26.06.bb
index 050673f678..375f55f0ef 100644
--- a/meta-oe/recipes-extended/7zip/7zip_26.05.bb
+++ b/meta-oe/recipes-extended/7zip/7zip_26.06.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://github.com/ip7z/7zip.git;protocol=https;branch=main;tag=${PV} \
            file://0001-Remove-treating-warning-as-errors.patch \
            file://7z_wrapper.sh \
            "
-SRCREV = "b88c6bc09339de32f7d18bbab900686b244f42ba"
+SRCREV = "d3296e39e1f1f92c7b41c0c3848e65640428d42d"
 
 UPSTREAM_CHECK_URI = "https://github.com/ip7z/7zip/releases/latest"
 
