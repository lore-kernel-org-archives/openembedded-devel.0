Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 339D6C48BF8
	for <webhook@archiver.kernel.org>; Mon, 19 Feb 2024 19:23:47 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.2987.1708370619187996233
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Feb 2024 11:23:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d0CjiSdn;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1d746ce7d13so30298115ad.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 11:23:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708370618; x=1708975418; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n5T4B64xBeKf0GJwc2xdlH76YgLhMt4hytxlz19+6zA=;
        b=d0CjiSdnRfPlK1T8YS/+E/O/8CpEpXlG2dtkFXxccQ/mup/U9Ukpnk7Rues/OQiaxn
         wNLUmQDThxYJev4kcAmImvOV2b6Jg/H+ggMNHT4UCH9pbezyx+ujcFOgRpW/3yKNybYi
         obwYQuWDnsaO1EgCx0HXnlrRtkHQJPbNeVXZQV9g3gKB65LtlyX7RCYT6OS6eGNEvU2G
         efz0uPZCm0PaczyCV7bGe5ztkRCRjkpXu9d2jFUuipx3vM9UZKA37HtMKA+50xUUiRe2
         FURi1RiWeQLyD4KKPw7nXZ9uk4fjoRYL98y8x5UnUReivqL98U+jO1rPhEp3+9pNaI2e
         9X9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708370618; x=1708975418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n5T4B64xBeKf0GJwc2xdlH76YgLhMt4hytxlz19+6zA=;
        b=fN6WEEuKMla846e5Pavjc5UX0vlkbfBi2jKkkYwAQooqUkWNfPiSXh9yTm7SJerYXC
         nQF5p3TjiBOCXRIY7ZatKHhHFv9dlPaUhRuDPIkJYvm1fzmRJeR1W/OK4qupJny7yIg2
         94kgT3N3OLIAsdn86TEnwZWqxV1H3EqtxjNvacCjlQnhqVuU1uuanNcYGrOTnQXqVTZn
         yBSFy95NjhU0pp1ZEPnXFxWoookF8TP4F+2+EDzzbqHUFakxRrKi6rIsVts2VPokEirk
         Hk0XrwRysXALGa+fTBWS0Ytw0MtJ0ZHDsXMU1h8qjV9BzUQacnPxGbWg5kIZTHTVKBoX
         7HrQ==
X-Gm-Message-State: AOJu0YyxPrI1EPN/YdgQL0/kuLd4we6aZiLEnuXoc7OTVYipRPXFcqu+
	uSbfLlDhQGHXe7pJnDTvXTPxsNzjNhC+wH/aOaYBNJgVQnUMtV433GTzTihX
X-Google-Smtp-Source: AGHT+IHW6IGUEwhXXBY7m/XkOj2BjfHpI/W+OmIi718nno+97ctSpoobHUhPn0LdpGZ7PWwpmik6RA==
X-Received: by 2002:a17:902:d4c3:b0:1dc:10a5:8be7 with SMTP id o3-20020a170902d4c300b001dc10a58be7mr803771plg.50.1708370618358;
        Mon, 19 Feb 2024 11:23:38 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0:7caf:da97:8daf:f655])
        by smtp.gmail.com with ESMTPSA id u10-20020a170903304a00b001d7222d8caasm4797723pla.50.2024.02.19.11.23.37
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 11:23:38 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 5/5] meta-gnome: drop ${PYTHON_PN}
Date: Mon, 19 Feb 2024 11:23:19 -0800
Message-Id: <f7b4df564c10f34a6449ca2532636e1d5f2149d7.1708370337.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708370337.git.tim.orling@konsulko.com>
References: <cover.1708370337.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 19:23:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108884

python 2 is long unsupported, so we no longer need this variable

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta-gnome/recipes-gnome/gnome-shell/gnome-shell_45.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_45.3.bb b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_45.3.bb
index 1dd043ec82..96fcba7f49 100644
--- a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_45.3.bb
+++ b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_45.3.bb
@@ -50,7 +50,7 @@ EXTRA_OEMESON = " \
 do_install:append() {
     # fix shebangs
     for tool in `find ${D}${bindir} -name '*-tool'`; do
-        sed -i 's:#!${PYTHON}:#!${bindir}/${PYTHON_PN}:' $tool
+        sed -i 's:#!${PYTHON}:#!${bindir}/python3:' $tool
     done
 }
 
-- 
2.34.1


