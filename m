Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web09.19838.1609637168518185832
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 02 Jan 2021 17:26:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UlPgyCpg;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id r3so27384798wrt.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 02 Jan 2021 17:26:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kOYIkzWdpKcwBrPemCGHeEujmU+f7mVcEnEOf63rDo4=;
        b=UlPgyCpgv0tiWxrRjp9AfJfH8n3yYIWxmJU+DEpMW+9Tnx6hf6W8ylv0p909+7zxn3
         Yh11nw0QZCgESmnNqhXF/44eu07OM3ptApkaQB6/KdKEw73bTPY5CnrEccn93D/RaIKk
         K9ajMUtAV9+h8tkuDRgOpSF880g3aRQvNtdvT9ksLwQnzBSaguIxvvMXM4VfAw8GlL9F
         comnq7ljghz7JUBau1DcUAK6t7OZ6Iy1grB6Ipp2niK5P04VwUGjfp8VeqjQRijaXh6X
         dzRV3bPrdo7IJVZPc3MZojyh6LhGqEnBdnBbheEsL+zGLZVNSH2GhJaOKmOcJ3O/+955
         F6LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kOYIkzWdpKcwBrPemCGHeEujmU+f7mVcEnEOf63rDo4=;
        b=re36nnAkntM01xm6SADtxdMWc6gDxAxrgHY+XwMmiuKogsi9dQPaDVA+IiSbooo8F1
         KdADQUlFlgor/yWm8Yft56fZrGmx2HGVlM2iR5xPM4o3WwnO7+1R4dPnLa8S/Tam9fRb
         Lbaa4CWYpBOTOETydBbkAsMJq24DIGg3Lkt+g9ifDiKaVRnudCuaZQ32IG2aIreju7fv
         XVl/+A6ewDtOgmfHblLEDh3FrFe2LudSmcGecNgRog7pXIxV/xhjj9ClF1mDacbmpC3h
         0Pp2BIExtVzn8CxiQGx1FG4JB3euSD11a3a+gPGygYm37DqiKztLhkO1NX/NAjE3LTRW
         q+DQ==
X-Gm-Message-State: AOAM531GXaEqlPJPi9xqW3es1s0MUMLCtKargGmQjYdN7fmQ3MgcxvZs
	vq9ngRsxa6OUZZ1tOVotYw6QKUbXhr4xsw==
X-Google-Smtp-Source: ABdhPJyhAr195tWNmq5k+c5zevkbyRvQ9G2CBcO+3J9SX6s+6LiG0najl96clXKYU2wwhaEC4arGnw==
X-Received: by 2002:adf:94e1:: with SMTP id 88mr48191172wrr.341.1609637166493;
        Sat, 02 Jan 2021 17:26:06 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f078d4623796d93462157c3.dip0.t-ipconnect.de. [2003:f0:7f07:8d46:2379:6d93:4621:57c3])
        by smtp.gmail.com with ESMTPSA id o125sm27248539wmo.30.2021.01.02.17.26.05
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jan 2021 17:26:05 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 00/16] xfce pre 4.16 batch
Date: Sun,  3 Jan 2021 02:25:40 +0100
Message-Id: <20210103012556.557336-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Non xfce core upgrades tested befor upgrading to 4.16

Andreas Müller (16):
  xfce4-panel-profiles: upgrade 1.0.10 -> 1.0.12
  xfce4-mount-plugin: upgrade 1.1.3 -> 1.1.5
  mousepad: upgrade 0.4.2 -> 0.5.2
  xfce4-screenshooter: upgrade 1.9.7 -> 1.9.8
  xfce4-taskmanager: upgrade 1.2.3 -> 1.4.0
  xfce4-calculator-plugin: upgrade 0.7.0 -> 0.7.1
  /xfce4-cpugraph-plugin: upgrade 1.1.0 -> 1.2.0
  xfce4-datetime-plugin: upgrade 0.8.0 -> 0.8.1
  xfce4-diskperf-plugin: upgrade 2.6.2 -> 2.6.3
  xfce4-fsguard-plugin: upgrade 1.1.1 -> 1.1.2
  xfce4-smartbookmark-plugin: upgrade 0.5.1 -> 0.5.2
  xfce4-systemload-plugin: upgrade 1.2.3 -> 1.2.4
  xfce4-verve-plugin: upgrade 2.0.0 -> 2.0.1
  xfce4-wavelan-plugin: upgrade 0.6.1 -> 0.6.2
  xfce4-whiskermenu-plugin: upgrade 2.4.6 -> 2.5.1
  xfce4-xkb-plugin: upgrade 0.8.1 -> 0.8.2

 .../{mousepad_0.4.2.bb => mousepad_0.5.1.bb}  |  5 ++--
 .../not-create-link-to-locale.patch           |  6 ++--
 ...0.10.bb => xfce4-panel-profiles_1.0.12.bb} |  6 ++--
 ..._1.9.7.bb => xfce4-screenshooter_1.9.8.bb} |  4 +--
 ...er_1.2.3.bb => xfce4-taskmanager_1.4.0.bb} |  4 +--
 ....0.bb => xfce4-calculator-plugin_0.7.1.bb} |  4 +--
 ....1.0.bb => xfce4-cpugraph-plugin_1.2.0.bb} |  4 +--
 ....8.0.bb => xfce4-datetime-plugin_0.8.1.bb} |  4 +--
 ....6.2.bb => xfce4-diskperf-plugin_2.6.3.bb} |  4 +--
 ...1.1.1.bb => xfce4-fsguard-plugin_1.1.2.bb} |  4 +--
 ...1-check-for-fstab.h-during-configure.patch | 30 +++++++++----------
 ...n_1.1.3.bb => xfce4-mount-plugin_1.1.5.bb} |  5 ++--
 ...bb => xfce4-smartbookmark-plugin_0.5.2.bb} |  4 +--
 ....3.bb => xfce4-systemload-plugin_1.2.4.bb} |  4 +--
 ...n_2.0.0.bb => xfce4-verve-plugin_2.0.1.bb} |  4 +--
 ...0.6.1.bb => xfce4-wavelan-plugin_0.6.2.bb} |  4 +--
 ...6.bb => xfce4-whiskermenu-plugin_2.5.1.bb} |  4 +--
 ...gin_0.8.1.bb => xfce4-xkb-plugin_0.8.2.bb} |  4 +--
 18 files changed, 52 insertions(+), 52 deletions(-)
 rename meta-xfce/recipes-apps/mousepad/{mousepad_0.4.2.bb => mousepad_0.5.1.bb} (67%)
 rename meta-xfce/recipes-apps/xfce4-panel-profiles/{xfce4-panel-profiles_1.0.10.bb => xfce4-panel-profiles_1.0.12.bb} (77%)
 rename meta-xfce/recipes-apps/xfce4-screenshooter/{xfce4-screenshooter_1.9.7.bb => xfce4-screenshooter_1.9.8.bb} (80%)
 rename meta-xfce/recipes-apps/xfce4-taskmanager/{xfce4-taskmanager_1.2.3.bb => xfce4-taskmanager_1.4.0.bb} (61%)
 rename meta-xfce/recipes-panel-plugins/calculator/{xfce4-calculator-plugin_0.7.0.bb => xfce4-calculator-plugin_0.7.1.bb} (65%)
 rename meta-xfce/recipes-panel-plugins/cpugraph/{xfce4-cpugraph-plugin_1.1.0.bb => xfce4-cpugraph-plugin_1.2.0.bb} (66%)
 rename meta-xfce/recipes-panel-plugins/datetime/{xfce4-datetime-plugin_0.8.0.bb => xfce4-datetime-plugin_0.8.1.bb} (66%)
 rename meta-xfce/recipes-panel-plugins/diskperf/{xfce4-diskperf-plugin_2.6.2.bb => xfce4-diskperf-plugin_2.6.3.bb} (72%)
 rename meta-xfce/recipes-panel-plugins/fsguard/{xfce4-fsguard-plugin_1.1.1.bb => xfce4-fsguard-plugin_1.1.2.bb} (71%)
 rename meta-xfce/recipes-panel-plugins/mount/{xfce4-mount-plugin_1.1.3.bb => xfce4-mount-plugin_1.1.5.bb} (57%)
 rename meta-xfce/recipes-panel-plugins/smartbookmark/{xfce4-smartbookmark-plugin_0.5.1.bb => xfce4-smartbookmark-plugin_0.5.2.bb} (66%)
 rename meta-xfce/recipes-panel-plugins/systemload/{xfce4-systemload-plugin_1.2.3.bb => xfce4-systemload-plugin_1.2.4.bb} (71%)
 rename meta-xfce/recipes-panel-plugins/verve/{xfce4-verve-plugin_2.0.0.bb => xfce4-verve-plugin_2.0.1.bb} (66%)
 rename meta-xfce/recipes-panel-plugins/wavelan/{xfce4-wavelan-plugin_0.6.1.bb => xfce4-wavelan-plugin_0.6.2.bb} (66%)
 rename meta-xfce/recipes-panel-plugins/whiskermenu/{xfce4-whiskermenu-plugin_2.4.6.bb => xfce4-whiskermenu-plugin_2.5.1.bb} (66%)
 rename meta-xfce/recipes-panel-plugins/xkb/{xfce4-xkb-plugin_0.8.1.bb => xfce4-xkb-plugin_0.8.2.bb} (75%)

-- 
2.26.2

