Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web08.11468.1629036403688890642
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Aug 2021 07:06:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hZyjwyNx;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d17so17821134plr.12
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Aug 2021 07:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=MCx/jeWa/Re4kcxNfxWSGA3eCN0FXoRzmfk0/k3KMzY=;
        b=hZyjwyNxz1t80v1hiZHY6RhHixOymhuK7douZaaozbq76IhIf2hfc9J7HYwzM9I1+y
         WwXQsVYP86j/6gc5OSy9PiLC7XiEYSLgoo8+HUKcY/8bOZTLc/YlcKnK2xbT0GTnkDP+
         WDPu7lhB0LFVntB3tJTfH4K+ptIwBIkj7sK5OVR9eA4sP8sZIfG7tQ8pQeCtwXO1m/Ca
         y9iz3YqIx9RpQw9LF6d4Xov/BPoDnqVO9D0FV7iYbqXLVIkosR5r/mD+7QLFOgFKFn52
         qqFg//byFW2LmvOhTEjwYZwcPhYeVJA95QWYyFwnIV6NqQAP/WP86Hd/dQZFVXtTG7uE
         145w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MCx/jeWa/Re4kcxNfxWSGA3eCN0FXoRzmfk0/k3KMzY=;
        b=PFgM115WBhoESL+QrxoAZw65a1Vzt3qY14VlrBlxcur8gAq5vra1USEWISH6M4PGPU
         aMDUOkoeceQQ0AbOijG4SPYWrgEgaTunbJTAFph6wP9RpasDTxyIoAYY9csJ5WkhPWxh
         XOMe7vU1gzQTR7Xs6KaFtzM8ERzHn33vpDBRmMdsjqFxkFShI/s4cEo0LCBUxGHbpYFp
         NiIMh4RjlMLwr0CHmY708NBCvHtedHmi7/wgm8t+Nggomi2okGmpcZ3AQxo6kav6h9mD
         AwKpkVI3fv9QNb7lfYnFGbH9/7EYyjF+WXEFqoX0YsoIVt5FsakgP6+qSC3QVg0UqovG
         BE4Q==
X-Gm-Message-State: AOAM533SoxQfApOyRzbDwOTx9Nd86qpZv2qBG/1F9EtezjpEo4QrXBOy
	5qQ9g4exRmLAC6vArJqBph48u7Kw8swRHg==
X-Google-Smtp-Source: ABdhPJzFiTZ9MrXHpm1kDUY5mzbsKPspUtGuREtQXiYScNZeNP1VH0gfW8ykZrSxazPwn35eqPIabw==
X-Received: by 2002:a17:902:7b83:b029:12c:2758:1d2d with SMTP id w3-20020a1709027b83b029012c27581d2dmr9535293pll.80.1629036403150;
        Sun, 15 Aug 2021 07:06:43 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.hsd1.ca.comcast.net ([2601:202:4180:a5c0:162c:344d:280d:4a4c])
        by smtp.gmail.com with ESMTPSA id y67sm8332901pfg.218.2021.08.15.07.06.42
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Aug 2021 07:06:42 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 03/18] libtalloc: upgrade 2.3.2 -> 2.3.3
Date: Sun, 15 Aug 2021 07:06:15 -0700
Message-Id: <a649ee623d474804a3b8c84044b46c4ee0af2519.1629036279.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1629036279.git.akuster808@gmail.com>
References: <cover.1629036279.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: wangmy <wangmy@fujitsu.com>

License-Update:
 add note:
     ** NOTE! The following LGPL license applies to the talloc
     ** library. This does NOT imply that all of Samba is released
     ** under the LGPL
 "GNU General Public License" changed to "GNU Lesser General Public License"

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 173cf5fd6b3fa2b0ee74ccb5fc11a96319943821)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../libtalloc/{libtalloc_2.3.2.bb => libtalloc_2.3.3.bb}    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-support/libtalloc/{libtalloc_2.3.2.bb => libtalloc_2.3.3.bb} (91%)

diff --git a/meta-networking/recipes-support/libtalloc/libtalloc_2.3.2.bb b/meta-networking/recipes-support/libtalloc/libtalloc_2.3.3.bb
similarity index 91%
rename from meta-networking/recipes-support/libtalloc/libtalloc_2.3.2.bb
rename to meta-networking/recipes-support/libtalloc/libtalloc_2.3.3.bb
index ae92de2db3..1d227dac6c 100644
--- a/meta-networking/recipes-support/libtalloc/libtalloc_2.3.2.bb
+++ b/meta-networking/recipes-support/libtalloc/libtalloc_2.3.3.bb
@@ -3,14 +3,14 @@ HOMEPAGE = "http://talloc.samba.org"
 SECTION = "libs"
 LICENSE = "LGPL-3.0+ & GPL-3.0+"
 LIC_FILES_CHKSUM = "file://talloc.h;beginline=3;endline=27;md5=a301712782cad6dd6d5228bfa7825249 \
-                    file://pytalloc.h;beginline=1;endline=18;md5=2c498cc6f2263672483237b20f46b43d"
+                    file://pytalloc.h;beginline=1;endline=18;md5=21ab13bd853679d7d47a1739cb3b7db6 \
+                    "
 
 
 SRC_URI = "https://www.samba.org/ftp/talloc/talloc-${PV}.tar.gz \
            file://options-2.2.0.patch \
 "
-SRC_URI[md5sum] = "3376a86bdf9dd4abc6b8d8d645390902"
-SRC_URI[sha256sum] = "27a03ef99e384d779124df755deb229cd1761f945eca6d200e8cfd9bf5297bd7"
+SRC_URI[sha256sum] = "6be95b2368bd0af1c4cd7a88146eb6ceea18e46c3ffc9330bf6262b40d1d8aaa"
 
 inherit waf-samba
 
-- 
2.25.1

