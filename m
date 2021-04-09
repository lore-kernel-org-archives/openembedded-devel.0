Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
 by mx.groups.io with SMTP id smtpd.web11.3665.1617934855318062278
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 19:20:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=H4YBmv6w;
 spf=pass (domain: gmail.com, ip: 209.85.161.44, mailfrom: akuster808@gmail.com)
Received: by mail-oo1-f44.google.com with SMTP id h2-20020a4ad7420000b02901e5901169a5so769387oot.8
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 19:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TIBIGWSQ5yykZ076AtTk6dRKme17OLQKG1Zfb8zMjMs=;
        b=H4YBmv6w2Mf5QgQ9AFQ7Djt/i3b1mNAOGo/QKJHJdKLL16Gkx7/15WXgS+kkOA7tS+
         k+fgCldW5J2UUnr7wDlxoQcublzQedtyMybGEiMJuW8ycT/B96rP4zGQ8yXY8Q60NKom
         J/TncjFLTHOmr1/Pttk8eqemOu395wsnnhkOv24dx2GeY6XyzignOtGbeWrQtxwN6UXM
         KQNygqWhEoueCrigOYj022FC2Sp4KWGesP9BWwZ00NGwNqM051sKr2fCC4li/iJDdYqn
         gHjE4maSNbEWnNSK4W31b8tJFqs8VTYBjRbIZdeQK43VXoK5mkzjKNwvM2Mv/a4cAl/q
         +UYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TIBIGWSQ5yykZ076AtTk6dRKme17OLQKG1Zfb8zMjMs=;
        b=th4vBG4lf3H8KTlj/7tMnhs3BqyU3FuIFm9+yaszSztOZTD5sknYgIQ9JzAZV6/stA
         k/YkG3GJwAnlBTBaUPSCbjpCPinxeTzlk2L+d6V6Jovmj3i6YvXY006uht2UTu3gL42U
         O+LRyWCol62OmqgBuv6ci8Mrl3sXlL9VCh8ybxBZaRxwcOwlzrTOZA+AXmXBqa35ikaL
         78onEOvKmgtHj5TCtWvwDk8jLk7CXqjFegZwmVPknUSIjit/QyKMW27tjXVeFLi6U1cT
         A1lwyXCPSRRp6lPpQ/QkyRYJQb8juScIcpOJeCjjflkI9vRUPlr/kV7NMYQmvqNKr61g
         pMug==
X-Gm-Message-State: AOAM533OKEqyC2OP8S2kXAIhwe8QhdKvwDNqKogoEibWouNi5Lt9+sXW
	KxsvNQkeg6oJU1o5RpMKARl1eoIty3Y=
X-Google-Smtp-Source: ABdhPJwLFtsUcp6dGfHnMyIA4FK7VPO/jZHCq6OBWBh/PUtVZxb2apE9LDRP6S+0nQ4duCyjTFX7rg==
X-Received: by 2002:a4a:b0c2:: with SMTP id l2mr10129951oon.0.1617934854295;
        Thu, 08 Apr 2021 19:20:54 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id k65sm299815otk.53.2021.04.08.19.20.52
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 19:20:53 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 00/36] Patch review part 2
Date: Thu,  8 Apr 2021 19:20:13 -0700
Message-Id: <cover.1617934043.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Additional sync with master. 

Excludes: Revert "iwd: Upgade to 1.13"

Please have feedback by Saturday.

The following changes since commit 622ede33f6cd5e6e08d20e4e2ac0218e5559645c:

  fluidsynth: update SRC_URI to remove non-existing 2.1.x branch (2021-04-07 18:45:52 -0700)

are available in the Git repository at:

  git://git.openembedded.org/meta-openembedded-contrib stable/hardknott-nut
  http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=stable/hardknott-nut

Andreas Müller (6):
  networkmanager-openvpn: Fix packageing
  mousepad: upgrade 0.5.3 -> 0.5.4
  xfce4-battery-plugin: upgrade 1.1.3 -> 1.1.4
  gigolo: upgrade 0.5.1 -> 0.5.2
  thunar: upgrade 4.16.4 -> 4.16.6
  poppler: upgrade 21.03.0 -> 21.04.0

Khem Raj (1):
  opencv: Upgrade to 5.4.2

Leon Anavi (12):
  python3-sqlalchemy: Upgrade 1.4.4 -> 1.4.5
  python3-pychromecast: Upgrade 9.1.1 -> 9.1.2
  python3-decorator: Upgrade 5.0.1 -> 5.0.5
  python3-pymisp: Upgrade 2.4.141 -> 2.4.141.1
  python3-pyroute2: Upgrade 0.5.16 -> 0.5.17
  python3-transitions: Upgrade 0.8.7 -> 0.8.8
  python3-sqlalchemy: Upgrade 1.4.5 -> 1.4.6
  python3-bitarray: Upgrade 1.9.0 -> 1.9.1
  python3-pysonos: Upgrade 0.0.41 -> 0.0.42
  python3-django: Upgrade 3.1.7 -> 3.2
  python3-tqdm: Upgrade 4.59.0 -> 4.60.0
  python3-xmlschema: Upgrade 1.5.3 -> 1.6.0

Martin Jansa (6):
  libsmi: use /bin/sh instead of ${base_bindir}/sh to silence QA error
    with usrmerge
  libyui: switch to libyui-old repo which still has this SRCREV
  libyui(-ncurses): upgrade to 4.1.1, libyui repo was rewritten
    completely
  android-tools: use PN instead of BPN in RDEPENDS
  pidgin-sipe: fix g_memdup2 changes to be backwards compatible with
    glib-1.67
  pidgin: upgrade to 2.14.2

Mingli Yu (1):
  hostapd: fix CVE-2021-0326 and CVE-2021-27803

Randy MacLeod (1):
  doxygen: Upgrade 1.8.20 -> 1.9.1

Vinicius Aquino (1):
  networkmanager: upgrade 1.28.0 -> 1.30.2

zangrc (8):
  mosquitto: upgrade 2.0.9 -> 2.0.10
  nbdkit: upgrade 1.25.4 -> 1.25.5
  stunnel: upgrade 5.58 -> 5.59
  usbredir: upgrade 0.8.0 -> 0.9.0
  hwdata: upgrade 0.345 -> 0.346
  live555: upgrade 20210322 -> 20210406
  rabbitmq-c: upgrade 0.10.0 -> 0.11.0
  xterm: upgrade 366 -> 367

 ...mosquitto_2.0.9.bb => mosquitto_2.0.10.bb} |   4 +-
 .../networkmanager-openvpn_1.8.14.bb          |   1 +
 ...ttings-settings-property-documentati.patch |  50 +---
 .../0004-fix_reallocarray_check.patch         |  27 ---
 ...Fix-build-with-musl-systemd-specific.patch |  52 ++--
 ...Fix-build-with-musl-systemd-specific.patch |  26 ++
 .../musl/0002-Fix-build-with-musl.patch       | 121 ---------
 ...Fix-build-with-musl-systemd-specific.patch |  26 --
 ...ger_1.28.0.bb => networkmanager_1.30.2.bb} |   6 +-
 .../{nbdkit_1.25.4.bb => nbdkit_1.25.5.bb}    |   2 +-
 .../{usbredir_0.8.0.bb => usbredir_0.9.0.bb}  |   2 +-
 .../stunnel/stunnel/fix-openssl-no-des.patch  |  10 +-
 .../{stunnel_5.58.bb => stunnel_5.59.bb}      |   2 +-
 .../hostapd/hostapd/CVE-2021-0326.patch       |  43 ++++
 .../hostapd/hostapd/CVE-2021-27803.patch      |  54 +++++
 .../hostapd/hostapd_2.9.bb                    |   2 +
 ...bitmq-c_0.10.0.bb => rabbitmq-c_0.11.0.bb} |   4 +-
 .../android-tools/android-tools_5.1.1.r37.bb  |   4 +-
 .../0001-build-don-t-look-for-Iconv.patch     |   9 +-
 .../doxygen-native-only-check-python3.patch   | 116 +++++----
 .../{doxygen_1.8.20.bb => doxygen_1.9.1.bb}   |   3 +-
 ...urses_4.0.0.bb => libyui-ncurses_4.1.1.bb} |  11 +-
 .../{libyui_4.0.0.bb => libyui_4.1.1.bb}      |  10 +-
 ...-Add-configure-time-check-for-setsid.patch |  10 +-
 .../xorg-app/{xterm_366.bb => xterm_367.bb}   |   4 +-
 ...ive555_20210322.bb => live555_20210406.bb} |   2 +-
 meta-oe/recipes-support/hwdata/hwdata_git.bb  |   4 +-
 .../recipes-support/libsmi/libsmi_0.5.0.bb    |   2 +-
 ...building-opencv-using-gcc-11.x-19244.patch |  28 ---
 .../{opencv_4.5.1.bb => opencv_4.5.2.bb}      |   5 +-
 .../0001-Migrate-to-use-g_memdup2.patch       |  58 ++---
 ...gure.ac-fix-build-with-autoconf-2.71.patch | 229 ------------------
 ...able-few-languages-not-compatible-wi.patch |  49 ----
 .../{pidgin_2.14.1.bb => pidgin_2.14.2.bb}    |   6 +-
 ...tock-glib-macro-to-define-boxed-type.patch | 228 -----------------
 ...rrecly-used-volatile-from-enum-type-.patch |  47 ----
 ...{poppler_21.03.0.bb => poppler_21.04.0.bb} |   4 +-
 ...ray_1.9.0.bb => python3-bitarray_1.9.1.bb} |   2 +-
 ...or_5.0.1.bb => python3-decorator_5.0.5.bb} |   2 +-
 ...-django_3.1.7.bb => python3-django_3.2.bb} |   4 +-
 ...9.1.1.bb => python3-pychromecast_9.1.2.bb} |   2 +-
 ...2.4.141.bb => python3-pymisp_2.4.141.1.bb} |   2 +-
 ...2_0.5.16.bb => python3-pyroute2_0.5.17.bb} |   2 +-
 ...os_0.0.41.bb => python3-pysonos_0.0.42.bb} |   2 +-
 ...y_1.4.4.bb => python3-sqlalchemy_1.4.6.bb} |   2 +-
 ...-tqdm_4.59.0.bb => python3-tqdm_4.60.0.bb} |   2 +-
 ..._0.8.7.bb => python3-transitions_0.8.8.bb} |   2 +-
 ...ma_1.5.3.bb => python3-xmlschema_1.6.0.bb} |   2 +-
 .../{gigolo_0.5.1.bb => gigolo_0.5.2.bb}      |   3 +-
 .../{mousepad_0.5.3.bb => mousepad_0.5.4.bb}  |   4 +-
 ...1.1.3.bb => xfce4-battery-plugin_1.1.4.bb} |   3 +-
 .../{thunar_4.16.4.bb => thunar_4.16.6.bb}    |   2 +-
 52 files changed, 306 insertions(+), 991 deletions(-)
 rename meta-networking/recipes-connectivity/mosquitto/{mosquitto_2.0.9.bb => mosquitto_2.0.10.bb} (95%)
 delete mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/0004-fix_reallocarray_check.patch
 create mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0002-Fix-build-with-musl-systemd-specific.patch
 delete mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0002-Fix-build-with-musl.patch
 delete mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0003-Fix-build-with-musl-systemd-specific.patch
 rename meta-networking/recipes-connectivity/networkmanager/{networkmanager_1.28.0.bb => networkmanager_1.30.2.bb} (96%)
 rename meta-networking/recipes-support/nbdkit/{nbdkit_1.25.4.bb => nbdkit_1.25.5.bb} (95%)
 rename meta-networking/recipes-support/spice/{usbredir_0.8.0.bb => usbredir_0.9.0.bb} (88%)
 rename meta-networking/recipes-support/stunnel/{stunnel_5.58.bb => stunnel_5.59.bb} (94%)
 create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2021-0326.patch
 create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2021-27803.patch
 rename meta-oe/recipes-connectivity/rabbitmq-c/{rabbitmq-c_0.10.0.bb => rabbitmq-c_0.11.0.bb} (88%)
 rename meta-oe/recipes-devtools/doxygen/{doxygen_1.8.20.bb => doxygen_1.9.1.bb} (79%)
 rename meta-oe/recipes-graphics/libyui/{libyui-ncurses_4.0.0.bb => libyui-ncurses_4.1.1.bb} (79%)
 rename meta-oe/recipes-graphics/libyui/{libyui_4.0.0.bb => libyui_4.1.1.bb} (70%)
 rename meta-oe/recipes-graphics/xorg-app/{xterm_366.bb => xterm_367.bb} (89%)
 rename meta-oe/recipes-multimedia/live555/{live555_20210322.bb => live555_20210406.bb} (97%)
 delete mode 100644 meta-oe/recipes-support/opencv/opencv/0001-Fix-building-opencv-using-gcc-11.x-19244.patch
 rename meta-oe/recipes-support/opencv/{opencv_4.5.1.bb => opencv_4.5.2.bb} (98%)
 delete mode 100644 meta-oe/recipes-support/pidgin/pidgin/0001-configure.ac-fix-build-with-autoconf-2.71.patch
 delete mode 100644 meta-oe/recipes-support/pidgin/pidgin/0002-configure.ac-disable-few-languages-not-compatible-wi.patch
 rename meta-oe/recipes-support/pidgin/{pidgin_2.14.1.bb => pidgin_2.14.2.bb} (94%)
 delete mode 100644 meta-oe/recipes-support/poppler/poppler/0001-glib-Use-stock-glib-macro-to-define-boxed-type.patch
 delete mode 100644 meta-oe/recipes-support/poppler/poppler/0002-glib-Remove-incorrecly-used-volatile-from-enum-type-.patch
 rename meta-oe/recipes-support/poppler/{poppler_21.03.0.bb => poppler_21.04.0.bb} (89%)
 rename meta-python/recipes-devtools/python/{python3-bitarray_1.9.0.bb => python3-bitarray_1.9.1.bb} (77%)
 rename meta-python/recipes-devtools/python/{python3-decorator_5.0.1.bb => python3-decorator_5.0.5.bb} (86%)
 rename meta-python/recipes-devtools/python/{python3-django_3.1.7.bb => python3-django_3.2.bb} (59%)
 rename meta-python/recipes-devtools/python/{python3-pychromecast_9.1.1.bb => python3-pychromecast_9.1.2.bb} (76%)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.141.bb => python3-pymisp_2.4.141.1.bb} (91%)
 rename meta-python/recipes-devtools/python/{python3-pyroute2_0.5.16.bb => python3-pyroute2_0.5.17.bb} (90%)
 rename meta-python/recipes-devtools/python/{python3-pysonos_0.0.41.bb => python3-pysonos_0.0.42.bb} (79%)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_1.4.4.bb => python3-sqlalchemy_1.4.6.bb} (85%)
 rename meta-python/recipes-devtools/python/{python3-tqdm_4.59.0.bb => python3-tqdm_4.60.0.bb} (78%)
 rename meta-python/recipes-devtools/python/{python3-transitions_0.8.7.bb => python3-transitions_0.8.8.bb} (73%)
 rename meta-python/recipes-devtools/python/{python3-xmlschema_1.5.3.bb => python3-xmlschema_1.6.0.bb} (83%)
 rename meta-xfce/recipes-apps/gigolo/{gigolo_0.5.1.bb => gigolo_0.5.2.bb} (67%)
 rename meta-xfce/recipes-apps/mousepad/{mousepad_0.5.3.bb => mousepad_0.5.4.bb} (67%)
 rename meta-xfce/recipes-panel-plugins/battery/{xfce4-battery-plugin_1.1.3.bb => xfce4-battery-plugin_1.1.4.bb} (66%)
 rename meta-xfce/recipes-xfce/thunar/{thunar_4.16.4.bb => thunar_4.16.6.bb} (89%)

-- 
2.17.1

