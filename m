Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web08.19877.1621261513711852760
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 May 2021 07:25:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=js/5SpEU;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id h7so3240597plt.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 May 2021 07:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=as70hGEEXOe7UatdP3LLwjBQ9fxXxn5faDYYbQEt/Eg=;
        b=js/5SpEUi6XD0pomaOkH51indKy19iS+09saXIsm5VS87dIgoGzKp5boebh4xu4xHb
         sBiDWHUA+1ZsjXwDW6J6IKHH26z1k/nOFr5KGpGG1qBfl3BjXImc+NvV8LFVozzJe//z
         WiKINuAxQ0rCQBCuxB61VTuHhMCY7EY1Fl4tMIlDzXtCDx9JVA/Vjlz9mnHhw7Ls27aJ
         cZuilKm2H8RvcZBCtOiBpMSQ/EhHxWs4lR6EsusxRr0PZMwv1R+W79PN1keONVJN6avI
         si7wrR9ccz7l60iaS2yCPPhw5kYRHucAzC5ZZ31MIJvhPjUTmyuRDqU/rmMwN+BYL5p4
         zYhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=as70hGEEXOe7UatdP3LLwjBQ9fxXxn5faDYYbQEt/Eg=;
        b=b5BSrdst8jOIsEUTE1nBEMXSbSuaGCJda/5WB1PESe4I8aUGW2PWine1j8zvVfq4mT
         RE+ekg0MUU+adWqevsH8yprQ5e5cL0znL5V03Yt12BcVBAuDk5SZtc/KEp1OfEA594mb
         xW35obHujrHQGIDdvOlbhT9HPY80/XLGTTJtZwq5Qj3budySJiQzpPX3FaYC8k7SRVCM
         Up4IUJRN6/PUw6Qu8NYMEC+/UVtjhw1vf3O+yXSeacUGBM8+KwBPsJFaFBSU8yCB/KfX
         MMq906JyLEMvFnmC0t9QS/q6Xl5S6Nu6uWueyTJAI+p7VXdzhabcxUgKqJAMr9tdVqO6
         y4dA==
X-Gm-Message-State: AOAM532KgDGSaTNrj9bZ3w0Zvt3rQOaKDw0mhqyGssVgSlNDEras29bB
	Srm/rcB/ftRSep9EdiYahBp/PGzHtIk=
X-Google-Smtp-Source: ABdhPJxlrSuknNo5Y5XsXltNq24ST9jpStS2P2JuMHhuyuiIToHbJ6kvRaCO5sPhfEkHCAzN26O8sw==
X-Received: by 2002:a17:902:650f:b029:ef:905f:e82f with SMTP id b15-20020a170902650fb02900ef905fe82fmr259555plk.78.1621261513095;
        Mon, 17 May 2021 07:25:13 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:e1a5:920e:5720:62fe])
        by smtp.gmail.com with ESMTPSA id s16sm10872008pga.5.2021.05.17.07.25.12
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 07:25:12 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 06/11] fetchmail: upgrade 6.4.18 -> 6.4.19
Date: Mon, 17 May 2021 07:24:59 -0700
Message-Id: <a570657c084c6b7cd2135445d58098071af79a0d.1621261426.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1621261426.git.akuster808@gmail.com>
References: <cover.1621261426.git.akuster808@gmail.com>

From: zangrc <zangrc.fnst@fujitsu.com>

-License-Update: Change distribition to distribution.
Specific permission is granted for the GPLed code in this distribution to be linked to OpenSSL without invoking GPL clause 2(b).

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 902eea11f1618946932bbb9324beada0b103658c)
[Bug fix update]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../fetchmail/{fetchmail_6.4.18.bb => fetchmail_6.4.19.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/fetchmail/{fetchmail_6.4.18.bb => fetchmail_6.4.19.bb} (83%)

diff --git a/meta-networking/recipes-support/fetchmail/fetchmail_6.4.18.bb b/meta-networking/recipes-support/fetchmail/fetchmail_6.4.19.bb
similarity index 83%
rename from meta-networking/recipes-support/fetchmail/fetchmail_6.4.18.bb
rename to meta-networking/recipes-support/fetchmail/fetchmail_6.4.19.bb
index 7254a4713a..aead5e9f0f 100644
--- a/meta-networking/recipes-support/fetchmail/fetchmail_6.4.18.bb
+++ b/meta-networking/recipes-support/fetchmail/fetchmail_6.4.19.bb
@@ -6,13 +6,13 @@ connections). It supports every remote-mail protocol now in use on the Internet:
 RPOP, APOP, KPOP, all flavors of IMAP, ETRN, and ODMR. It can even support IPv6 and IPSEC."
 SECTION = "mail"
 LICENSE = "GPLv2 & MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=06a8d16599e1d0b131390bec01fb571c"
+LIC_FILES_CHKSUM = "file://COPYING;md5=ad73c6bd421c137fbf18cf8b92474186"
 
 DEPENDS = "openssl"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz \
            "
-SRC_URI[sha256sum] = "302dc9bcdc6927dedf375d2baaead2347557faa70d98b1da83f2409fa6fb259f"
+SRC_URI[sha256sum] = "cd8d11a3d103e50caa2ec64bcda6307eb3d0783a4d4dfd88e668b81aaf9d6b5f"
 
 inherit autotools gettext python3-dir python3native
 
-- 
2.17.1

