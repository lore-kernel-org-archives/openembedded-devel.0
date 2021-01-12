Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web08.17124.1610488336706528105
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Jan 2021 13:52:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BIjOhfME;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id g8so3231168wme.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 Jan 2021 13:52:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=YlA8jpkXFo1FIzE5KLaAX+vSZNdnCwlCZ0qg5pQC3YQ=;
        b=BIjOhfME3Qjkr52hbNk/xGudxeO/MgQQYm/oIFHkowv14j53Qncmv+fCAlzzMjk7bp
         Avf/74XtjrYblkJ+TexELJWbLwtppO5IprKjWAMV69YsLxxwTBKUBoy+2vxw7Z1EsnQN
         i5K4YepafHx+vulO4oa1E29kwrGuClIypj97uspiZP5mwzI9vksF3UvASUICOn1uXGLU
         7WaBW/ZHIiIRnSCa7ktYH09+SSuk36jjMpOQ89Nm6zU75bnwQNG3Rw+KoY5+oOW5auMa
         0OS00kyml4NQRFNNWmfv9tbftL79kF7OMxoDZ56ljz3cryVXzp7Z+jpb24LL5+bKpGtU
         eTXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YlA8jpkXFo1FIzE5KLaAX+vSZNdnCwlCZ0qg5pQC3YQ=;
        b=IwbykOMgoGiRRyS59D8j6jLQ0+A5BG1iukC5nwyr+zBI8pgwZEElFn9kGshkWKloqI
         5fOIlhwXpvxS6H218kKDDipDnqJrsgTd5ij1iUkHSzqj0utBsO5tgRx5ZltxCVkq4fhA
         g/m1lQc/WcGaOXcU0GkTucOZrdRNCVf3/dxxRQRvItk3L+q6yg7CBfNZWIMyjrIOId4s
         1S8PgFyadEV2yQvISsF9bzaWTpj8oQSs296bwKPajgLfmvtUSQ/Fy2hg5+HWEDInd8hD
         A3G1wbGE9m8fAeHXH9jhEvcnCGD5rN7kvh14d5EnEGvj9AEY8SLB8PlSldFMjz4tUxz/
         izAA==
X-Gm-Message-State: AOAM532sZ7gR9e4NWwvHdR853/DwDRvSAYwPtPTiQL7WYaeAecfP/iqb
	wAUtEIVQYsp4KLsWmXTHHxZhYuPVKhoSqQ==
X-Google-Smtp-Source: ABdhPJzPMhaCEg6biINQZGk8QyyACqtqLOZQdlMRdG8sdHmReSjiAxIUFmISczrD5UC41M1E1kb5rA==
X-Received: by 2002:a1c:2e88:: with SMTP id u130mr1118301wmu.83.1610488335295;
        Tue, 12 Jan 2021 13:52:15 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f0538793397820a7f9846fa.dip0.t-ipconnect.de. [2003:f0:7f05:3879:3397:820a:7f98:46fa])
        by smtp.gmail.com with ESMTPSA id c6sm6881300wrh.7.2021.01.12.13.52.14
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jan 2021 13:52:14 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 6/8] catfish: upgrade 1.4.13 -> 4.16.0
Date: Tue, 12 Jan 2021 22:51:59 +0100
Message-Id: <20210112215201.3940196-6-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210112215201.3940196-1-schnitzeltony@gmail.com>
References: <20210112215201.3940196-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It builds out of tree fine now.

Release notes for 4.16.0
========================
- Fulltext now searches files with UTF-7, UTF-8, UTF-16 BE/LE, and
UTF-32 BE/LE encodings
- Replace Gtk/Gdk/GLib deprecated code (#6)
- Use "match all" method for fulltext search (#30)

Translation Updates:
Arabic, Basque, Belarusian, Danish, Estonian, Finnish, French,
Indonesian, Japanese, Kabyle, Norwegian Bokmål, Portuguese, Portuguese
(Brazil), Russian, Serbian, Slovak, Slovenian, Spanish, Swedish, Turkish

Release notes for 4.15.0
========================
[Please note that this is a development release.]

Disclaimer on the significant version bump (1.4.x to 4.15.x):
With this release, Catfish has started integrating Xfce components.
Going forward, Catfish's versioning scheme will reflect the target Xfce
release.

Dependency Changes:
- GTK >= 3.22
- GLib >= 2.42
- Python 2 support has been removed
- Python 3 >= 3.2 (#33)
- Xfconf >= 4.14.0 (requires GObject Introspection, see INSTALL)
- Zeitgeist optional dependency now requires GObject Introspection

New Features:
- Added Ctrl+H shortcut to show/hide hidden files (#16)
- Added "Today" and "Month" filters to the sidebar (#23)
- Fulltext searches now include more text files (#7)

General:
- New app icon, now using an rDNS icon name (org.xfce.catfish)
- Migrated ChangeLog to NEWS to better match Xfce projects
- Renamed README to README.md and updated to match Xfce projects
- Updated INSTALL to reference python3-specific packages (#36)
- Various in-app icon updates (#15, #17, #26)
- Added additional padding to Other and Custom gear icons (#20)

Bug Fixes:
- Check if zeitgeist daemon is running at startup (#34)
- Correctly position custom filter popups above gear icon (#18)
- Default to the current date in the custom date filters (#24)
- Fix 'list' object has no attribute 'lower' (#9)
- Fix fulltext freeze with special files (#32)
- Fix python crash when some extension scheme is used (#35)
- Fix statusbar moving on mouseover
- Move custom file extension hint to tooltip (#25)
- Sidebar entries no longer move when losing focus (#22)

Translation Updates:
Albanian, Arabic, Armenian (Armenia), Basque, Belarusian, Bulgarian,
Catalan, Chinese (China), Chinese (Taiwan), Croatian, Czech, Danish,
Dutch, Eastern Armenian, English (Australia), Estonian, Finnish, French,
Galician, German, Greek, Hebrew, Hungarian, Icelandic, Indonesian,
Interlingue, Italian, Japanese, Korean, Lithuanian, Malay, Norwegian
Bokmål, Norwegian Nynorsk, Polish, Portuguese, Portuguese (Brazil),
Russian, Serbian, Slovak, Slovenian, Spanish, Thai, Turkish, Ukrainian

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../catfish/{catfish_1.4.13.bb => catfish_4.16.0.bb}         | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)
 rename meta-xfce/recipes-apps/catfish/{catfish_1.4.13.bb => catfish_4.16.0.bb} (70%)

diff --git a/meta-xfce/recipes-apps/catfish/catfish_1.4.13.bb b/meta-xfce/recipes-apps/catfish/catfish_4.16.0.bb
similarity index 70%
rename from meta-xfce/recipes-apps/catfish/catfish_1.4.13.bb
rename to meta-xfce/recipes-apps/catfish/catfish_4.16.0.bb
index 01a36e1fc..f0391cb23 100644
--- a/meta-xfce/recipes-apps/catfish/catfish_1.4.13.bb
+++ b/meta-xfce/recipes-apps/catfish/catfish_4.16.0.bb
@@ -7,10 +7,7 @@ inherit xfce-app distutils3 gtk-icon-cache mime-xdg
 
 DEPENDS += "python3-distutils-extra-native"
 
-B = "${S}"
-
-SRC_URI[md5sum] = "750b65401c9445e185e71c808d7509a4"
-SRC_URI[sha256sum] = "58c0ea06e5f286019295545fbfd1dbca23aea74c625762bbb4c89a6f484ae839"
+SRC_URI[sha256sum] = "1f6facee57a659af560f06024ca6f98aa4d638bf57a8bcfb613b4dc70fcc3b47"
 
 FILES_${PN} += "${datadir}/metainfo"
 
-- 
2.26.2

