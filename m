Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.16845.1610488338676626509
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Jan 2021 13:52:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=h+C6nHl4;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id g10so1759673wmh.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 Jan 2021 13:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=7BQyUuQdwAZ5yD5vh0YhlLsPGPrHp20nfC1PplFvpN0=;
        b=h+C6nHl4OQ5/EWIAVb/OGihnqpCiBn+MBF0bye+XjCuPRk6Ry7O8tVnLUtsi2JcFbb
         bJw9ZN4jEyEglwca/LSlanll3EdGRDWSXzRhmgFKZXfhnF6cNx/dObE2ybVwK3LUwZNB
         wM+X4BGS/yJ9+gM7+ML1xVfPR8h1IzmmK4cjYDKrS/qALKcUyI3nxI7xhIWEv2GiE6V+
         eht2TAayEiNAUxDGNprZpcy7CNmBLrjyWU2aXmIaJZzAmVluJ6uDqGIDlySDGJs4ZHMD
         ZhV3ltkDy0EBuHq8jKAM1X828BD9waIUV/fmuW2yNQ6TJcILqjuqKB7hxGAvRjIvzbKv
         5BIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7BQyUuQdwAZ5yD5vh0YhlLsPGPrHp20nfC1PplFvpN0=;
        b=s6Jk0a2/Ks3U1f8eMFIHQjIDH3/6o0qEJzXLgGN6bz4FWWDNQQK71ebR7naUzf1Rp1
         BzPlpvcXWmbW+sEZq6RIFiovVjp0V31KIyKYlIusS34TV5ICaD41A0g3OecbQiDShInz
         fnN/sLVQcddyK5NclRyrUd9qoZuJo7ypa+Wh3UByR/KVncYZFO4LdJUoQxEe1ypqteOi
         D+aLrgRSUi5Yc/rNoyWFtvDVsPhivjzRLvI5SMTG5tGbrDvlbqe06LkARwsDmie+x0LZ
         f6VStDGWpN1T62VkF4DvD+s9fg1Bg647XuCctCqnHmrvjhwjVGnzIDZS2ndAaHiOxpZN
         VM6g==
X-Gm-Message-State: AOAM530rvHz2ijSWnd9IguGzgkMXcc6SNYnYb3k/hf9rqcVeP/WqKPuY
	hbev1BAp2KWTQ4PFcjyVlddcu22OQFWtFg==
X-Google-Smtp-Source: ABdhPJy5RId0W76R37pManGPZZSdhlmcVEPHeX497hJ97SHAJk0InuXhdJO5iH/wfwg1oEwF1DnVPg==
X-Received: by 2002:a1c:2182:: with SMTP id h124mr1120593wmh.25.1610488337293;
        Tue, 12 Jan 2021 13:52:17 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f0538793397820a7f9846fa.dip0.t-ipconnect.de. [2003:f0:7f05:3879:3397:820a:7f98:46fa])
        by smtp.gmail.com with ESMTPSA id c6sm6881300wrh.7.2021.01.12.13.52.16
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jan 2021 13:52:16 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 8/8] parole: upgrade 1.0.5 -> 4.16.0
Date: Tue, 12 Jan 2021 22:52:01 +0100
Message-Id: <20210112215201.3940196-8-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210112215201.3940196-1-schnitzeltony@gmail.com>
References: <20210112215201.3940196-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 4.16.0
========================
- Add README.md to EXTRA_DIST (#72)
- Translation Updates: Albanian, Basque, Belarusian, Catalan, Chinese
  (China), Chinese (Taiwan), Czech, Dutch, Estonian, Finnish, French,
  German, Hebrew, Italian, Japanese, Lithuanian, Norwegian Bokmål,
  Portuguese, Portuguese (Brazil), Russian, Serbian, Spanish, Swedish,
  Turkish

Release notes for 4.15.0
========================
This is a development release aimed at testers and translators. Parole
4.16.0 should be expected in the coming weeks.

Playlist Improvements:
- Playlist is now an in-window popover instead of a slide-out panel
- Shuffle functionality now utilizes a sort filter instead of randomly
  selecting the next track, making it possible makeing the playback
  history more accurate (#32)

DVD Support:
- Added a menu option to activate the subpicture menu
- DVD chapter selection from the playlist is functional again
- The DVD menu will now automatically load if playback does not start
  successfully

Dialog Appearance Improvements:
Each of the dialogs were ported to CSD with some cleanup and default
buttons marked as "suggested". The following dialogs had some additional
improvements:
- Go To Position: Timestamp inputs changed to vertical orientation for
  better clock-like appearance
- Keyboard Shortcuts: Adjusted to "always-center" positioning since
transient positioning failed
- Open File: Spinner configured as the FileChooser "extra" widget
- Open Location: Removed some duplicated text
- Plugins: Rearranged the plugins manager, and moved credits to a
  per-plugin About dialog
- Save Playlist: File type panel replaced with a combobox that also
filters the FileChooser

General:
- Added basic GitLab pipeline
- Added new icon and icon name "org.xfce.parole"
- Added README.md
- Fixed distcheck builds with intltool 0.51.0
- Fixed full-debug builds with GLib 2.35+
- Fixed missing-prototypes errors
- Player controls are no longer hidden while the sound popover is open
- Selecting an option on the "Stream is taking too long" dialog will now
  dismiss the dialog
- Sort POTFILES.in to make it easier to review

Translation Updates:
Albanian, Arabic, Armenian (Armenia), Basque, Belarusian, Bulgarian,
Chinese (China), Chinese (Taiwan), Croatian, Czech, Danish, Dutch,
Eastern Armenian, English (Australia), Estonian, Galician, German,
Greek, Hebrew, Hungarian, Icelandic, Indonesian, Interlingue, Italian,
Japanese, Kazakh, Lithuanian, Occitan (post 1500), Polish, Portuguese,
Slovak, Slovenian, Spanish, Swedish, Telugu, Turkish, Ukrainian, Uyghur

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../parole/{parole_1.0.5.bb => parole_4.16.0.bb}               | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-xfce/recipes-multimedia/parole/{parole_1.0.5.bb => parole_4.16.0.bb} (84%)

diff --git a/meta-xfce/recipes-multimedia/parole/parole_1.0.5.bb b/meta-xfce/recipes-multimedia/parole/parole_4.16.0.bb
similarity index 84%
rename from meta-xfce/recipes-multimedia/parole/parole_1.0.5.bb
rename to meta-xfce/recipes-multimedia/parole/parole_4.16.0.bb
index f55b19459..136e3baa5 100644
--- a/meta-xfce/recipes-multimedia/parole/parole_1.0.5.bb
+++ b/meta-xfce/recipes-multimedia/parole/parole_4.16.0.bb
@@ -16,8 +16,7 @@ DEPENDS += " \
     taglib \
 "
 
-SRC_URI[md5sum] = "74fcde5da018c011e5febd9649817c05"
-SRC_URI[sha256sum] = "1adb4bd96c4cc4b4a79eeafe1316e170f506426e3737e8ba8898f7ea6bec572a"
+SRC_URI[sha256sum] = "0d305ad8ccd3974d6b632f74325b1b8a39304c905c6b405b70f52c4cfd55a7e7"
 
 RDEPENDS_${PN} += "gstreamer1.0-plugins-good"
 
-- 
2.26.2

