Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11788.1795762936118020285
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 23:02:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=AikedqxC;
 spf=pass (domain: gmail.com, ip: 74.125.82.45, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1a3c08d6928so11576298c88.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 23:02:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795762935; x=1796367735; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JODybMIjPZqO5BXGSFatUYYpxFNiQ1piBtWNnP0izOs=;
        b=AikedqxCK/4M7ZseQ72KhiOmBgxcCurTwdM+2X63Kbeup9loq3g4szjQHfO4QEeXXR
         UeIZ9MCxbtiiA6mnKkqoWfHovpp/VtM4vT93TPm4W2V0uOBJDOfGuAb+6pp5CkTMd0YJ
         vwyVBhjZn+XkxrPawpjdL1MvOh/YFZpFBTIHhNeJpP2AN7TDtHp2ecjzXsM11F6HegJT
         OFMHHqpmXJuOb1zlwshC1fpiarb3y7i13I77RdRkfl4uYyaHZQnnGMtRJSE6vv4+FV04
         fvgxDlc5usl541MfuLh85zZ0sHt2lXnIuaEF7Y8cZvc1vyDjJASzHPwDX86CgbyYmrde
         7DVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795762935; x=1796367735;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JODybMIjPZqO5BXGSFatUYYpxFNiQ1piBtWNnP0izOs=;
        b=f3G7pXYqiA2qhK1hKlJFUk9YpyLfhJWDugFjy+1Vbjb6naeebUXvK00BKcRgC3pOmj
         ECXYTMfIp/q4tpl2P6oRcLh2WAtnA56skP/jqYDsdMN+MfZhgiNW3uf5M07fSdP8TFRP
         5l5l463EiTNLcHOlQ789B69xl4zec/neMz2GwjKR70LBq6lDy6LYL4yTdAaTNT5gD+o6
         /ufbdvo7nsCpwjwQo6BNt3hOyF3q3/Xvc1vZISHehvcvp39SvxdfKGo1qDtKFm+tE1Iy
         XgLdU0JJcJZA2UnZL48/J2x0sXy89xUInks5yFMgnWK6fTImFrfGFNsZsQQqE9dxIJV1
         5Z2A==
X-Gm-Message-State: APuU4Z8rmo8B7I19oRRBNv0C0WpfwLcxIiA2/vvsZdkNFxmvAeoNHX70
	KV87FPKM+kVJzpUQ+3WTIopIBChhOlLt0qUnbW/+7JTdmN39RbTw+4Aii1DSqRNt
X-Gm-Gg: AZFdTZd+lu2abcodwGDi6DsbGlbEywgAqLsVNV2nG83QKd1184jyna6BlU0OtiiHe3f
	SzcAQRwfz1AkUddHPqgs80KgQndLKr3w4C4mSU+MHcVvXfyQgB8hHH/bKTNA7bwFbmsG2Npq+Va
	Z89Nlka742U9z8yiAO50cvrNcm8vfkiyA3S/jAjThJ3mZTHQy0cFEQIfzfpYW2EdsvmmdjNRFr3
	MezpC8P7Vx4QU5QVT/w3qwDCt8DGsiNewwEpbC0E4YMGDfwrSiQuqZM45cuuFJrZ/iot1GFdhw8
	FOI3RgOu9bddckZ5YWxeJOMDMMz9ugswZKjFO/mKfwvUM69JPVEHN+oG41oUlRys3UFmPXNOzzM
	aKTPNkmEeeMk0F8Qbp50oLi3o8v4ktUe6DIzqTKBydDQx5/DYATri07TZZx9s3sSmwVhCAGo1Wr
	vGmHkgwNvHHNW8jKIcXeeEP2XHxt858QL08xWRTmJg+pZj/fidh0/Ru+iKnDHPg54XCVC84jREA
	iCsMyskupHZiXWw7XfwqGe6TEQma5EDlB9Ij1NMmAMAApJ7egOiaUVq4DlVBFpuk4GiscLOok/m
	0ODSPGvo8NXH9slsy4rfXvR/XI/iGZzqfB8d5B6JL0jeI0QThaMXrqiXHTED8Je3lJFQ52fs90r
	K3ra7QgMNA7ywnlciMOB925xPFcREYEQsHjEeYK/F7nDf4caJ/nrQBJgQ9AHxfBeF9kOVxEwGke
	srABXnVGrTZ0a9LVLDKZnDE8CMsgnEFzfJukCw8hgwx9GOpbr+ffXUNPAOAHVhQH4sC/5BS+HG7
	YaBzw07S2tnxXSw89my8hcVi6m/gPSc4GU8Y+evpuHe0rYU+KLBeDB0vz2CWAvf9SmfyqutZc60
	nHgd
X-Received: by 2002:a05:7022:7f01:b0:15e:9126:c60f with SMTP id a92af1059eb24-1b5568bb55cmr20592967c88.29.1795762935199;
        Thu, 26 Nov 2026 23:02:15 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c3052sm53911395c88.1.2026.11.26.23.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:02:14 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-gnome][PATCH 00/21] Upstream checks, source fixes and upgrades
Date: Thu, 26 Nov 2026 23:01:48 -0800
Message-ID: <20261127070211.2329979-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 07:02:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133327
Content-Type: text/plain; charset="utf-8"

Upstream version check fixes, libuser and libchamplain fetched from
their current hosts, GNOME point releases (gdm 51.2 fixes
CVE-2026-132858 and CVE-2026-133445), and libgweather4 4.6.0 with the new
gweather-locations recipe that now holds the locations database.

Khem Raj (21):
  gexiv2-0.14: Restrict upstream check to the 0.14 series
  gnome-calendar: Fix upstream version check
  gnome-terminal: Fix upstream version check
  gtksourceview4: Restrict upstream check to the 4.x series
  libgweather4: Fix upstream version check
  libpeas-1: Restrict upstream check to the 1.x series
  ibus: Fix upstream version check
  faenza-icon-theme: Mark upstream version as unknown
  libuser: Fetch from codeberg.org/libuser/libuser
  libchamplain: Fetch from gitlab.gnome.org
  file-roller: upgrade 44.7 -> 44.8
  gdm: upgrade 51.1.1 -> 51.2
  gexiv2-0.14: upgrade 0.14.6 -> 0.14.7
  gnome-control-center: upgrade 51.1 -> 51.2.1
  gspell: upgrade 1.14.5 -> 1.14.6
  nautilus: upgrade 51.1 -> 51.2
  gweather-locations: Add recipe
  libgweather4: upgrade 4.4.4 -> 4.6.0
  gedit: upgrade 51.0 -> 51.1
  libgedit-gfls: upgrade 0.5.0 -> 0.5.1
  gnome-online-accounts-gtk: upgrade 3.50.12 -> 3.50.13

 ...b => gnome-online-accounts-gtk_3.50.13.bb} |  3 +-
 .../faenza-icon-theme_1.3.bb                  |  3 ++
 ...ile-roller_44.7.bb => file-roller_44.8.bb} |  2 +-
 .../gdm/{gdm_51.1.1.bb => gdm_51.2.bb}        |  2 +-
 .../gedit/{gedit_51.0.bb => gedit_51.1.bb}    |  3 +-
 ...t-gfls_0.5.0.bb => libgedit-gfls_0.5.1.bb} |  3 +-
 ...2-0.14_0.14.6.bb => gexiv2-0.14_0.14.7.bb} |  6 +++-
 .../gnome-calendar/gnome-calendar_51.0.bb     |  4 ++-
 ...51.1.bb => gnome-control-center_51.2.1.bb} |  2 +-
 .../gnome-terminal/gnome-terminal_3.60.0.bb   |  2 ++
 .../{gspell_1.14.5.bb => gspell_1.14.6.bb}    |  2 +-
 .../gtksourceview/gtksourceview4_4.8.4.bb     |  3 ++
 .../libchamplain/libchamplain_0.12.21.bb      |  4 ++-
 .../libgweather/gweather-locations_2026.2.bb  | 29 +++++++++++++++++++
 ...w-building-gir-in-cross-environments.patch | 10 +++----
 ...eather4_4.4.4.bb => libgweather4_4.6.0.bb} | 16 +++++++---
 .../recipes-gnome/libpeas/libpeas-1_1.38.1.bb |  3 ++
 .../{nautilus_51.1.bb => nautilus_51.2.bb}    |  2 +-
 .../recipes-support/ibus/ibus_1.5.35.bb       |  2 ++
 .../recipes-support/libuser/libuser_0.64.bb   | 10 ++++---
 20 files changed, 87 insertions(+), 24 deletions(-)
 rename meta-gnome/recipes-extended/gnome-online-accounts-gtk/{gnome-online-accounts-gtk_3.50.12.bb => gnome-online-accounts-gtk_3.50.13.bb} (89%)
 rename meta-gnome/recipes-gnome/file-roller/{file-roller_44.7.bb => file-roller_44.8.bb} (92%)
 rename meta-gnome/recipes-gnome/gdm/{gdm_51.1.1.bb => gdm_51.2.bb} (96%)
 rename meta-gnome/recipes-gnome/gedit/{gedit_51.0.bb => gedit_51.1.bb} (92%)
 rename meta-gnome/recipes-gnome/gedit/{libgedit-gfls_0.5.0.bb => libgedit-gfls_0.5.1.bb} (82%)
 rename meta-gnome/recipes-gnome/gexiv2/{gexiv2-0.14_0.14.6.bb => gexiv2-0.14_0.14.7.bb} (83%)
 rename meta-gnome/recipes-gnome/gnome-control-center/{gnome-control-center_51.1.bb => gnome-control-center_51.2.1.bb} (96%)
 rename meta-gnome/recipes-gnome/gspell/{gspell_1.14.5.bb => gspell_1.14.6.bb} (83%)
 create mode 100644 meta-gnome/recipes-gnome/libgweather/gweather-locations_2026.2.bb
 rename meta-gnome/recipes-gnome/libgweather/{libgweather4_4.4.4.bb => libgweather4_4.6.0.bb} (57%)
 rename meta-gnome/recipes-gnome/nautilus/{nautilus_51.1.bb => nautilus_51.2.bb} (94%)

