Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web12.48667.1591047938906541309
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jun 2020 14:45:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=d+6kLfUS;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id c3so1271395wru.12
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Jun 2020 14:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Rw+E8BEIGBo5ONLrxETiWuP6ZVG0INuuIVC0MIiFu1c=;
        b=d+6kLfUSXiKa/nILXKfZGyKpMHrLXTs8PRpH0kZcUZKU/hnCgO/sjq9tmUfsXl+A8W
         r0Ts82Lybrgwp0J2mLD8d8brow73J4RHK2IKlys9TUQBqposL7ucnyGXwK7uOnYceXTz
         gjpDNaHEYnd1PPRHFYEnCXJfdPQc2T043TV1f2zBy6xZ7tVrUT5Ap4hvEV5xFklqwBs3
         4upNWLZ2izkFrw9dZ/GMwMC7nX1zNnsw++fcQgdjUh1tUxtTfjnVBA+Pi8L/eeqPGtpb
         ULG7OdPBMZZos3zTZq8rTXHDbUxz/TcUIGu8Kpqd3OzQjY64vtttQqRojfS86waD6FLm
         cjhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Rw+E8BEIGBo5ONLrxETiWuP6ZVG0INuuIVC0MIiFu1c=;
        b=d+gDyTVO20TggtZmQbmR1I2GTjavesjHzd37VeeHywYGxh52X0NmNH4GfWkcv7+23u
         7+npClqKDbkhQoE7kGGy1DPVGf0MK+uCa6ECutgy+015rT3La9UCsvfqbIYIU0gk14kS
         nEj6O3PkMdVWFeyiLgj72+xNhXcq/aQHMjze5rjTTli8Yg8S2MCI6YXzib4KJGIWrqlc
         yoEqw3/72HGQnr/PUrhmSg6fd+I7/SFuabsMx+pU6SDMNdkSCzdr2nVjD+K+bC0T6Z8G
         k+gWzJP7dDCr78IKS43uXZh2gdBttw/zpln5ZWw5ZCQ+ZbMCkY0b1GbBU7hrXYq2r6DQ
         HbzQ==
X-Gm-Message-State: AOAM531YzR00bEjB0eDcGLYyw8KJ429lDoolfBnxqiZay3HuCFzVhIzs
	H4/q89bDEBuBpmLJIvYfdaxm1AEFqZY=
X-Google-Smtp-Source: ABdhPJxToKR2+Yo1DqI6UKHUERXQcj3K8nuXjz3HmtBwbGaqIP/JyKek9bVAYAd7hPqwhD9KmWWqvw==
X-Received: by 2002:a5d:69cb:: with SMTP id s11mr23439302wrw.91.1591047937126;
        Mon, 01 Jun 2020 14:45:37 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f06ad34da2c69d11ac2eac0.dip0.t-ipconnect.de. [2003:f0:7f06:ad34:da2c:69d1:1ac2:eac0])
        by smtp.gmail.com with ESMTPSA id 40sm1050119wrc.15.2020.06.01.14.45.36
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 14:45:36 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 09/38] file-roller: upgrade 3.32.5 -> 3.36.2
Date: Mon,  1 Jun 2020 23:44:47 +0200
Message-Id: <20200601214516.26624-10-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200601214516.26624-1-schnitzeltony@gmail.com>
References: <20200601214516.26624-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

version 3.36.2
--------------

 Bugs fixed:

  * libarchive: do not follow external links when extracting files.
  * libarchive: overwrite symbolic links as well if requested by the user.
  * Help: Update steps to create a new archive to 3.34 UI. (Andre Klapper)

 New or updated application translations:

  * Hebrew (Yosef Or Boczko)
  * Kurdish (Sorani) (Jwtiyar Nariman)
  * Turkish (Emin Tufan Ã‡etin)

 New or updated manual translations:

  * French (Guillaume Bernard)
  * Indonesian (Andika Triwidada)
  * Polish (Piotr DrÄ…g)
  * Ukrainian (Yuri Chornoivan)

version 3.36.1
--------------

 Bugs fixed:

  * Fixed Properties command in menubar. (Sabri Ãœnal)
  * Fixed compiling with GCC 10. (Sabri Ãœnal)

 New or updated application translations:

  * Burmese (Vampire)
  * Ukrainian (Yuri Chornoivan)

 New or updated manual translations:

  * Catalan (Manel Vidal)
  * Czech (Marek ÄŒernockÃ½)
  * French (Charles Monzat)
  * Indonesian (Andika Triwidada)

version 3.36.0
--------------

 New or updated application translations:

  * Japanese (sicklylife)
  * Kurdish (Sorani) (Jwtiyar Nariman)

 New or updated manual translations:

  * Polish (Piotr DrÄ…g)
  * Swedish (Anders Jonsson)

version 3.35.92
---------------

 New features and user visible changes:

  * User's manual updates (Andre Klapper)

 New or updated application translations:

  * English - United Kingdom (Bruce Cowan)

 New or updated manual translations:

  * Brazilian Portuguese (FÃ¡bio Nogueira)

version 3.35.91
---------------

 New features and user visible changes:

  * Updated manual (Andre Klapper)

 New or updated application translations:

  * Japanese (sicklylife)

 New or updated manual translations:

  * es (Daniel Mustieles)

version 3.35.90
---------------

 New or updated application translations:

  * Galician (Fran Dieguez)
  * Japanese (sicklylife)
  * Pasukan Terjemahan Malaysia (abuyop)
  * Turkish (Emin Tufan Ã‡etin)

 New or updated manual translations:

  * Galician (Fran DiÃ©guez)

version 3.35.1
--------------

 New features and user visible changes:

  * Support for Zstandard compressed files/archives. (Felix Riemann)
  * Allow to directly open .tar.lzo files. (Felix Riemann)
  * libarchive: implemented read support for 7z. (Peter Keresztes Schmidt)
  * Provide a development variant of the app icon. (Jakub Steiner) (!12)
  * Converted README to README.md (Roger)
  * Remove file-roller from the recommended applications for ePub
    files. (Bastien Nocera)

 Bugs fixed:

  * Removed deprecated functions. (Peter Keresztes Schmidt)
  * Add application/x-xar as a supported mime-type. (Bastien Nocera) (!50)

 New or updated application translations:

  * Basque (Asier Sarasua Garmendia)
  * Japanese (Ryuta Fujii)

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{file-roller_3.32.5.bb => file-roller_3.36.2.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/file-roller/{file-roller_3.32.5.bb => file-roller_3.36.2.bb} (81%)

diff --git a/meta-gnome/recipes-gnome/file-roller/file-roller_3.32.5.bb b/meta-gnome/recipes-gnome/file-roller/file-roller_3.36.2.bb
similarity index 81%
rename from meta-gnome/recipes-gnome/file-roller/file-roller_3.32.5.bb
rename to meta-gnome/recipes-gnome/file-roller/file-roller_3.36.2.bb
index 2070f18a9..bf5e6f6d1 100644
--- a/meta-gnome/recipes-gnome/file-roller/file-roller_3.32.5.bb
+++ b/meta-gnome/recipes-gnome/file-roller/file-roller_3.36.2.bb
@@ -13,8 +13,8 @@ DEPENDS = " \
 
 inherit gnomebase gsettings itstool gnome-help gettext upstream-version-is-even mime-xdg
 
-SRC_URI[archive.md5sum] = "2afc688ac66a50213f6c42ee99479a96"
-SRC_URI[archive.sha256sum] = "d53d30b4b45f61158b7e550b71a8a5556e877695f43a2ceb88be895960e54176"
+SRC_URI[archive.md5sum] = "caa0103ab34d237a9760fbf5e1c72bc1"
+SRC_URI[archive.sha256sum] = "268f7fdad8d2a78dfed5e82eb8710bad389c311b720666d6f07a04ed51056bd2"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'packagekit', '', d)}"
 
-- 
2.21.3

