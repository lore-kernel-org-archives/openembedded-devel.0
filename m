Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web12.6867.1621931328465739400
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 May 2021 01:28:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SHK7wVuB;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id r12so31204899wrp.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 25 May 2021 01:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=84wIWCGitKtJVId43Z6Eg9FRkwr/5g1heqLCRJTW6U0=;
        b=SHK7wVuB7N24zDQZ5V4tE7xx8GuKTOZSFaEXWr9gp81Os8qfbMeJc+9tOa+yGLY0xA
         qvImOe7aNIZmmlLGIXgicf2qG4Nu0zo2gxb2ZvQDlE5L1WCE8UseqgSSfUcZrev5bSXV
         XtdYhCMcvklPLRQxVfAfnfhotTtVd5xR9dPYRMzkG8U6oCwX53xwCiMBBM93p8gyN6Cr
         rsGziNZWKCkqMZIUNJbR0fauQtPq+F17Fnuftx5qRoKRMoYOPgL07VFrArffUcsJ1p0g
         O3u+Gpr9sSS+QsVvgqDtEKidxO2/yW1h1G4j3SKp61fStCc26IRptSw/q3kmA8b14yHt
         CApw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=84wIWCGitKtJVId43Z6Eg9FRkwr/5g1heqLCRJTW6U0=;
        b=EEHz3F7Kp33CqI8LvgoKBnvwfNBTjus3J3isR7ewxjTm0yKio4zhhO/suKRW7bWgdf
         5qAV4wM5SJ79E1cXRWaH8E84POWRHlU+gxfyfpVGjEYHL8i0mNvPotcLoLT6dwZfVEEF
         JYNFR3x1mJVDQOWhdyqZNZErwqt8UsTmtQgwA8NuTvrJAerqRi7YfTBpjatagZSUOduX
         bSY95QMNp5rACEJeK58KnjsVTVgqmUXJm5SROaHhLZWfKgqa7mw5Mn3xjDLDlZEfQM4b
         tgka4Qds+hWeahE5j/OaRXkZMDoYyFDULABtKw+YXpcTG3pRFf0G04Mz54yeWAH14Jxj
         AlPA==
X-Gm-Message-State: AOAM532WTy6PMzuzqpJEPaOgdyxaQwl1KZM7A1waJl7gJcbqHecWj45L
	Jxd9fRwtjQPcs/LS7xSk7Oft5n7LQwM=
X-Google-Smtp-Source: ABdhPJwPpFyh4KbH38qsb/4540+OA6r9SJkdDjUAEoq0zXAIfWL0+uVeiBHO0ARTKullYdy2VG2kIg==
X-Received: by 2002:a5d:4902:: with SMTP id x2mr25747236wrq.233.1621931326727;
        Tue, 25 May 2021 01:28:46 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f1b9019c1b4d242cdde1949.dip0.t-ipconnect.de. [2003:f0:7f1b:9019:c1b4:d242:cdde:1949])
        by smtp.gmail.com with ESMTPSA id k11sm1897149wmj.1.2021.05.25.01.28.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 May 2021 01:28:46 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin.Jansa@gmail.com
Subject: [PATCH] hunspell-dictionaries: use better names for dictionary files
Date: Tue, 25 May 2021 10:28:36 +0200
Message-Id: <20210525082836.3344-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Played around with gspell and followed their suggestion to prefer hunspell [1]
in enchant [2].
Tests with gedit showed that all entries for sub-languages (e.g English UK)
were missing. By changing names of *.dic and *.aff from

<language>-<SUBLANGUAGE>.*
to
<language>_<SUBLANGUAGE>.*

languages as 'English UK' appear and can be selected in gedit.
Tested also on libreoffice: That displayed all languages properly before and
does still with files renamed.

[1] https://gitlab.gnome.org/GNOME/gspell
[2] https://github.com/schnitzeltony/meta-mortsgna/commit/b5d17de7cf9fd033339c2609c5b14c108bbbff4f

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-oe/recipes-support/hunspell/hunspell-dictionaries.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/hunspell/hunspell-dictionaries.bb b/meta-oe/recipes-support/hunspell/hunspell-dictionaries.bb
index 3da67d1e3..28c2d809a 100644
--- a/meta-oe/recipes-support/hunspell/hunspell-dictionaries.bb
+++ b/meta-oe/recipes-support/hunspell/hunspell-dictionaries.bb
@@ -141,7 +141,7 @@ S = "${WORKDIR}/git"
 
 do_install() {
     for LANGUAGE in `ls -d1 ${S}/dictionaries/*` ; do
-        LANGUAGE_DIR=`basename $LANGUAGE`
+        LANGUAGE_DIR=`basename $LANGUAGE | sed 's:-:_:'`
         install -D -m0644 $LANGUAGE/index.dic ${D}${datadir}/hunspell/$LANGUAGE_DIR.dic
         install -D -m0644 $LANGUAGE/index.aff ${D}${datadir}/hunspell/$LANGUAGE_DIR.aff
         install -D -m0644 $LANGUAGE/LICENSE   ${D}${datadir}/hunspell/LICENSE-$LANGUAGE_DIR 2>/dev/null || echo "No LICENSE for language $LANGUAGE"
-- 
2.31.1

