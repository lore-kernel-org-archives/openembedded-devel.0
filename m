Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web08.11482.1610837437827154799
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 16 Jan 2021 14:50:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lob5drb0;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id 6so5599138wri.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 16 Jan 2021 14:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=foWg2ptD7d43veDQ0I0jGK5Nj2ohdzzuX4ypF38+VhI=;
        b=lob5drb0YIOoIvAAHBo/DilNt4MoAXbWewHyvBEvUf6Q+h00BW5OwlxvuWlP2ftGAC
         iXymVGxe6dXZk8FjT7I7stdp8LbkYDRAL2Ab1Pmyb9KdXXGtTV1waXLmu0aYPudibuBM
         xZOIpgHNW50Zm/N2KFmQCc+EsRJYNwliYSo/nvm1lz4SPygrJ5uzcvIY6HT646gXPawS
         Cucq4FyN+EAV3IqFAeo60jVHnjNg6fvvHlIWcn1L3z554zl0fYixxmjVt026rphSnTZa
         vbKMZnK8iLouqkoHBILS9TsgeFkaFQWqfTznZj0GLG8ZQgMdHFjCj1P2T78M8k1CPudc
         gedQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=foWg2ptD7d43veDQ0I0jGK5Nj2ohdzzuX4ypF38+VhI=;
        b=NAUI0i1JfmiZF/XOzfKwjUFkhlBJyDLn3/4vT8VF0t/gilxx3MQf25TdgfPxfPM7Vb
         tkjRtsQHd9HFPzRkSxqKD0/D1BvtwSHcQL3k2/ltL+x5b8TYpFfize4si2M799gES1Dn
         yiyMOP2HaASPHMrg94ofTjWGbQPAFkiKsR5LNsbrFcqxXEvF2srnRJ+wSpUM1VMHDIsP
         kvz1tnV3qEvgN5phfcPaS1xwrZNEnpnMPVY/RnA6NXEV/y9iy7I+fbxlwOGs1qQibLYN
         hI5Y11CtzWGgDymd3a/ab5QAgZ4rnZknmErMK3tbaIRnhOE13QY7l2XHOUHtT3o0LiQz
         XBXA==
X-Gm-Message-State: AOAM533xLxhdP4Jea0kPOL+wElnnFQpB0DWbpmw2QaAABlhTJLavbXSb
	A75pPLfC4Dw1khLAR2YOjbXw8UUnu0kivA==
X-Google-Smtp-Source: ABdhPJwcOgiHzj2Qh9cBhSBV9c6jYdK6eg0qUKjEYgeGy/qL5be69A+NXlyKmbIt1ekCp4Ab68xcAg==
X-Received: by 2002:a5d:457a:: with SMTP id a26mr19767513wrc.53.1610837436500;
        Sat, 16 Jan 2021 14:50:36 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f07b34716c71558fcd84d86.dip0.t-ipconnect.de. [2003:f0:7f07:b347:16c7:1558:fcd8:4d86])
        by smtp.gmail.com with ESMTPSA id z21sm16891167wmk.20.2021.01.16.14.50.35
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Jan 2021 14:50:35 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 3/3] thunar: upgrade 4.16.0 -> 4.16.2
Date: Sat, 16 Jan 2021 23:50:21 +0100
Message-Id: <20210116225021.3753895-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210116225021.3753895-1-schnitzeltony@gmail.com>
References: <20210116225021.3753895-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Changes (and yes 4.16.2 'Regression:'... was on my list)

4.16.2

- Regression: "Open with other application" missing (Issue #470)
- Always create new files and folders in current directory (Issue #462)
- Translation Updates:
  Albanian, Arabic, Armenian, Armenian (Armenia), Asturian, Basque,
  Belarusian, Bengali, Bulgarian, Catalan, Chinese (China), Chinese
  (Hong Kong), Chinese (Taiwan), Croatian, Czech, Danish, Dutch,
  Eastern Armenian, English (Australia), English (United Kingdom),
  Esperanto, Estonian, Finnish, French, Galician, German, Greek,
  Hebrew, Hungarian, Icelandic, Indonesian, Interlingue, Italian,
  Japanese, Kazakh, Korean, Latvian, Lithuanian, Malay, Norwegian
  Bokmål, Norwegian Nynorsk, Occitan (post 1500), Panjabi (Punjabi),
  Persian (Iran), Polish, Portuguese, Portuguese (Brazil), Romanian,
  Russian, Serbian, Slovak, Spanish, Swedish, Telugu, Thai, Turkish,
  Ukrainian, Urdu, Urdu (Pakistan), Vietnamese

4.16.1

- Prevent crash on Ctrl+H when there is no sidepane (Issue #453)
- Roleback to previous spinner handling (Issue #448)

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-xfce/thunar/{thunar_4.16.0.bb => thunar_4.16.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/thunar/{thunar_4.16.0.bb => thunar_4.16.2.bb} (89%)

diff --git a/meta-xfce/recipes-xfce/thunar/thunar_4.16.0.bb b/meta-xfce/recipes-xfce/thunar/thunar_4.16.2.bb
similarity index 89%
rename from meta-xfce/recipes-xfce/thunar/thunar_4.16.0.bb
rename to meta-xfce/recipes-xfce/thunar/thunar_4.16.2.bb
index ae05f867f..6b1a6b482 100644
--- a/meta-xfce/recipes-xfce/thunar/thunar_4.16.0.bb
+++ b/meta-xfce/recipes-xfce/thunar/thunar_4.16.2.bb
@@ -8,7 +8,7 @@ inherit xfce gobject-introspection features_check mime-xdg
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[sha256sum] = "6277c448116a91ebfa564972645d8d79ef69864992a02bb164b7b13f98fdfd9b"
+SRC_URI[sha256sum] = "67a90b98c436192f9aa6cd18a22a089e713007864aebfa65f36f121c86ba7add"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[pcre] = "--enable-pcre,--disable-pcre,libpcre"
-- 
2.26.2

