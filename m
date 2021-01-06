Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web08.9417.1609946273036850612
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Jan 2021 07:17:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ev9gtYXY;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id jx16so5435247ejb.10
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 Jan 2021 07:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=aJMhV52liuMt6wWjmw4lXeYGXhvg6JbHQG5pYDVGVQk=;
        b=ev9gtYXYBFFpsuHv9q4hW75ohKO/z/9gITEUBLJ7ImnE34uuILfsSXCRMSeo7WUjrC
         wf7cPbtpbXb1KO8yW3kcBbMIpmNVamfyaJogTictZ3BHEt/cP3zF/TVjskqpHZoJaYwm
         EqpO9ejwVZRoQCtGR56z0HG/+un4xNybzjI5At8RSqiQTlddelZtpx639KQBdZ35RjUy
         GhwUvJWXPGbAVd98HrgA5df4wXWf7+s7Il+IqkYcMa+HOnDlLqrqmhJOT47gg/S3l9Ta
         2OgdJrFl+uAtxJ5Um0qg244CM3QK0OB1Ta4uvYcd/FiZDBPrUBC8ruB2xZRvjcpHZ0ed
         tLTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aJMhV52liuMt6wWjmw4lXeYGXhvg6JbHQG5pYDVGVQk=;
        b=BzAPkiVyLSSJsMePVx2V6bBmvD2IzxxepXSAhZoz5t81rwAZu/p1/MpMVrJXMlDUKM
         BbQq8YzRW8o9NI9NOivms8e+ycMG6JXFgzJ4axVVW9mzAG1Sux2ldiMr4bLTq73Q2Sb1
         P0UR8gCZtftGvIiZW8iduxhxaoWkfcM8i13uyrqmF5Zh0FOLp5xm9WRVZcofLG4FZwWs
         pjgTkKn1330XUzCw0M0oeTDYgeAY7vZxUOpHK+EbQakruBKMJPEzr9tn++3/o6e67wQ6
         8Ar04z3dsIk6CaYKjngspYVwGYZaKvkn+z43Hq9NYD/6SaiXEduRlPmwrNnjQMyyoipZ
         uItQ==
X-Gm-Message-State: AOAM531WA0iVOcDXQaLU3OZDelAENJ9QHcDWc2H/XsLnYeZ9hbowsG40
	l0OtfN9++nYgOoDmPnZ6amnbhfCJUlLKIg==
X-Google-Smtp-Source: ABdhPJwklyKVNg37R+6c+QnQ4YlOeD27UDMS5MBN0YHVxAFbo5594gj6hQWRhkJQDQNQNp6Ecd9nLA==
X-Received: by 2002:a17:906:af75:: with SMTP id os21mr3252099ejb.330.1609946271664;
        Wed, 06 Jan 2021 07:17:51 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f47431850a04677ec24921a.dip0.t-ipconnect.de. [2003:f0:7f47:4318:50a0:4677:ec24:921a])
        by smtp.gmail.com with ESMTPSA id lc18sm1366899ejb.77.2021.01.06.07.17.50
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jan 2021 07:17:50 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 17/28] xfce4-terminal: 0.8.9.2 -> 0.8.10
Date: Wed,  6 Jan 2021 16:17:06 +0100
Message-Id: <20210106151717.1779543-17-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210106151717.1779543-1-schnitzeltony@gmail.com>
References: <20210106151717.1779543-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 0.8.10
========================
- Bump libvte, gtk and xfce minimal versions (4.14)
- Stop using G_SPAWN_CHILD_INHERITS_STDIN spawn flag
- Updates README.md.
- Added new stock icons
- Limit font picker to fixed-size fonts
- Add gtk-doc as a dependency
- Do not require connection to generate manpage
- Bug #16875: Do not add ui.h file in datadir
- Simplify terminal manpage generation
- Switch preferences ui file to xdt-csource
- Switch to README.md and foreign automake mode
- Do not override clipboard contents
- Unsafe paste: Support bracketed paste mode
- Do not select text in Search dialog
- Add basic GitLab pipeline
- Translation Updates:
  Albanian, Armenian (Armenia), Basque, Bulgarian, Chinese (China),
  Chinese (Taiwan), Danish, Dutch, Eastern Armenian, Estonian, French,
  Greek, Hebrew, Hungarian, Indonesian, Interlingue, Italian, Japanese,
  Lithuanian, Norwegian Bokmål, Occitan (post 1500), Polish,
  Portuguese, Portuguese (Brazil), Russian, Serbian, Slovak, Slovenian,
  Spanish, Swedish, Turkish, Ukrainian, Uyghur

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{xfce4-terminal_0.8.9.2.bb => xfce4-terminal_0.8.10.bb}    | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-xfce/recipes-apps/xfce4-terminal/{xfce4-terminal_0.8.9.2.bb => xfce4-terminal_0.8.10.bb} (70%)

diff --git a/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.9.2.bb b/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.10.bb
similarity index 70%
rename from meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.9.2.bb
rename to meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.10.bb
index ba0f12771..783d38652 100644
--- a/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.9.2.bb
+++ b/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.10.bb
@@ -8,7 +8,6 @@ inherit xfce-app
 FILES_${PN} += "${datadir}/xfce4 \
                 ${datadir}/gnome-control-center"
 
-SRC_URI[md5sum] = "d0308313def5d7cc51070a6db1cf24dc"
-SRC_URI[sha256sum] = "9ba23bf86d350ef8a95d2dfb50bbd1bbb2144d82985a779ec28caf47faaeeeeb"
+SRC_URI[sha256sum] = "7a3337c198e01262a0412384823185753ac8a0345be1d6776a7e9bbbcbf33dc7"
 
 RRECOMMENDS_${PN} += "vte-prompt"
-- 
2.26.2

