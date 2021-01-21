Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.1048.1611269708886851208
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Jan 2021 14:55:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uV74amzK;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id c124so2795924wma.5
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 Jan 2021 14:55:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DJAWYe/SnhbHh5g2LjVkH78ffeKkbG4x2fLfc/4vUOU=;
        b=uV74amzKx4Q7+oBik3FsGNfqgpdoZFwU3oywDdi6UmodTZacQ3kvw/ooz+jDBbk7gI
         4fDp3gvHoiaHP9CCH6Y+VrgA/7eGk3GK+IpgyFdT/048UOdHvxnMYRe2qhwVOJQA6DxV
         49KEoPWfwohojE08EaH75GiNRfGiFaEy/QtTsNaw05NeQrtHcI9jTDTtZi7Qptb0GFlm
         qp5z/e2gRHFVCFyn2ZEPUEwW3gmh14EfUbrVUJHCVZAZJHfde8fOW8pIbj+lLVn6Co4V
         Pvu2Y3fhDXKHtco1HNXx2dT1R9DwUB72jOUdxlbbpIZ4KHwVaZ6Cx+T+kN/kXlm/EApk
         YTkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DJAWYe/SnhbHh5g2LjVkH78ffeKkbG4x2fLfc/4vUOU=;
        b=GmrOb2RFkhU5+ZXpuSvcknfWm90tu/1+axu5MpRmfWufQVSHqvv7OgtRWwC6tfNekR
         UeenZCO2NJAlzm3b4idbv2SLr8anV5dpsXGk/wP25yPx4YUGwlg68jLeXr/8rOU1hppR
         j88YXpIgtk67uiRFoaW68fPDYRGhviJA/YxzcJVe+oAHE9ks2nIEzjKS706WqUSmh+D+
         Eg2eWhJ0hVWgKtNeoFt7QD4ImPhL782uRiAUTONOgUInQi+F0qFA8cK0syMQazFkF04/
         J7Mpt8FRA3dXr2s/NOktyK+ElP7jz6kPaBbEzhYS3WYxrDKBASathtVDKGNo23lT3NcO
         8YLw==
X-Gm-Message-State: AOAM530V70e0joirFgaZidLdBL44dfvOFL4V8HLZKa3nDW/hs0x4C/hZ
	sUKYTZkG+CSsUjkBoAAMbT5unS72E9mXcg==
X-Google-Smtp-Source: ABdhPJyxCqkX2xQqQrus7Ddr1f3U6QOtmmKWc7LdI6ssAVUl8S58J1RxY9xFjPzCkPX3YW8LU//mnQ==
X-Received: by 2002:a1c:a784:: with SMTP id q126mr1310666wme.52.1611269707154;
        Thu, 21 Jan 2021 14:55:07 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f09d446818dfa6dffe17955.dip0.t-ipconnect.de. [2003:f0:7f09:d446:818d:fa6d:ffe1:7955])
        by smtp.gmail.com with ESMTPSA id n9sm10019742wrq.41.2021.01.21.14.55.06
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jan 2021 14:55:06 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 0/7] upgrades
Date: Thu, 21 Jan 2021 23:54:51 +0100
Message-Id: <20210121225458.278343-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Patch 1-3 are resends - patchwork ignored them first time

Andreas Müller (7):
  garcon: upgrade 0.8.0 -> 4.16.1
  xfce4-whiskermenu-plugin: upgrade 2.5.1 -> 2.5.2
  thunar: upgrade 4.16.0 -> 4.16.2
  jack: upgrade 1.19.16 -> 1.19.17
  networkmanager: upgrade 1.22.14 -> 1.28.0
  appstream-glib: upgrade 0.7.17 -> 0.7.18
  vlc: upgrade 3.0.11.1 -> 3.0.12

 ...lib_0.7.17.bb => appstream-glib_0.7.18.bb} |  3 +-
 .../vlc/vlc/0005-Fix-build-with-Qt-5.15.patch | 56 -----------------
 ...Use-SYS_futex-instead-of-__NR_futex.patch} |  0
 .../vlc/{vlc_3.0.11.1.bb => vlc_3.0.12.bb}    |  5 +-
 ...ttings-settings-property-documentati.patch | 43 ++++++++-----
 ...-to-var-libdir-rather-than-hardcod-.patch} |  0
 ...atch => 0004-fix_reallocarray_check.patch} |  2 +-
 ...Fix-build-with-musl-systemd-specific.patch | 29 +++++----
 .../musl/0002-Fix-build-with-musl.patch       | 23 ++++---
 ...0003-Fix-build-with-musl-for-n-dhcp4.patch | 61 ------------------
 ...ix-build-with-musl-systemd-specific.patch} |  6 +-
 ...er_1.22.14.bb => networkmanager_1.28.0.bb} |  9 ++-
 ...-Use-SYS_futex-instead-of-__NR_futex.patch | 62 -------------------
 .../jack/{jack_1.19.16.bb => jack_1.19.17.bb} |  3 +-
 ...1.bb => xfce4-whiskermenu-plugin_2.5.2.bb} |  2 +-
 .../{garcon_0.8.0.bb => garcon_4.16.1.bb}     |  2 +-
 .../{thunar_4.16.0.bb => thunar_4.16.2.bb}    |  2 +-
 17 files changed, 72 insertions(+), 236 deletions(-)
 rename meta-gnome/recipes-support/appstream-glib/{appstream-glib_0.7.17.bb => appstream-glib_0.7.18.bb} (84%)
 delete mode 100644 meta-multimedia/recipes-multimedia/vlc/vlc/0005-Fix-build-with-Qt-5.15.patch
 rename meta-multimedia/recipes-multimedia/vlc/vlc/{0001-linux-thread-Use-SYS_futex-instead-of-__NR_futex.patch => 0005-linux-thread-Use-SYS_futex-instead-of-__NR_futex.patch} (100%)
 rename meta-multimedia/recipes-multimedia/vlc/{vlc_3.0.11.1.bb => vlc_3.0.12.bb} (96%)
 rename meta-networking/recipes-connectivity/networkmanager/networkmanager/{0001-install-firewalld-to-var-libdir-rather-than-hardcod-.patch => 0003-install-firewalld-to-var-libdir-rather-than-hardcod-.patch} (100%)
 rename meta-networking/recipes-connectivity/networkmanager/networkmanager/{fix_reallocarray_check.patch => 0004-fix_reallocarray_check.patch} (90%)
 delete mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0003-Fix-build-with-musl-for-n-dhcp4.patch
 rename meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/{0004-Fix-build-with-musl-systemd-specific.patch => 0003-Fix-build-with-musl-systemd-specific.patch} (81%)
 rename meta-networking/recipes-connectivity/networkmanager/{networkmanager_1.22.14.bb => networkmanager_1.28.0.bb} (95%)
 delete mode 100644 meta-oe/recipes-multimedia/jack/jack/0001-Use-SYS_futex-instead-of-__NR_futex.patch
 rename meta-oe/recipes-multimedia/jack/{jack_1.19.16.bb => jack_1.19.17.bb} (93%)
 rename meta-xfce/recipes-panel-plugins/whiskermenu/{xfce4-whiskermenu-plugin_2.5.1.bb => xfce4-whiskermenu-plugin_2.5.2.bb} (76%)
 rename meta-xfce/recipes-xfce/garcon/{garcon_0.8.0.bb => garcon_4.16.1.bb} (86%)
 rename meta-xfce/recipes-xfce/thunar/{thunar_4.16.0.bb => thunar_4.16.2.bb} (89%)

-- 
2.26.2

