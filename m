Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.5413.1618064733430368205
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 10 Apr 2021 07:25:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=J/mlMcKC;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id c17so6170810pfn.6
        for <openembedded-devel@lists.openembedded.org>; Sat, 10 Apr 2021 07:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:autocrypt:message-id:date:user-agent
         :mime-version:content-transfer-encoding:content-language;
        bh=t05vusdwbHwFY3e6rqaeiN7MWl27FeNTAH+Hk+s6Oxw=;
        b=J/mlMcKCkbKJVpWv3cwrxvZ2stOcFSPX5mKSBN1w7eDSSYL6zqcVeL9wModtw+JNbK
         Kfhm05/iSqj8LRGUa3SSL7QQJFkfMnsjLczV0urEVrvVHEuRKWomqCaSYdQbUIS4Dpnb
         NinX0WcYjPAIp33eMmjkb/tRoSI0H+s2KUlXs8s8mHuY6yqoTIixTCUkyRhnlNXR/Mwo
         scgpNknj70fXslUr9jEzPelyvloVMuMfJWa50iVUgKUY1F1sQIpk55p+WKcWJgzkY1S4
         vlvo/DrOisIezFNHN00EkuLtgZ/rLw15ApjUGKZHyL+56YedhJKoA+kXrG6O/bOWsQHw
         2Kuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:autocrypt:message-id:date
         :user-agent:mime-version:content-transfer-encoding:content-language;
        bh=t05vusdwbHwFY3e6rqaeiN7MWl27FeNTAH+Hk+s6Oxw=;
        b=Mu8Z31DF0+8f8IiotnBpmk0Iarwa5Mh0/+C494w027Ia0iGNYPfHAZC8zVB9SGSSBI
         sYgUBnuTI+HjSoyFFNjC6/dvZXBFU/43BFJcQYmRrwZiApztMbQifVgtppP3Qvgi7gmc
         uR7Z0Hyk+GwEHYNu3BSni2EpRq1mHrkB79i6EN2HB7fCrZZto2v8ch+yRNz3x+sC71ro
         op26ncHElLhjPtlAHJhJO9p3F0afZdru9foiydQ/3bXMvd3KXK/F6EIhTG8wiYsmf2tv
         uij2IZtTMBadhRYMCj6F5s5VQrYIbNJMajUE0yy6iB+2qWHTx4rTa2AIcAM1skb4WzG8
         Z1KQ==
X-Gm-Message-State: AOAM531bMwHXlR1LWuo7unUNKO1V86nGss09M4yE74zOpJReLosetqGR
	wFrN9vDrGWl6/g4GXFdkdE0=
X-Google-Smtp-Source: ABdhPJyZQntCO5BggCA489htpBbcFJybaynNP+essLdclFXDqgjOuRhJeFS0mZJZfj26mIdutLBW8g==
X-Received: by 2002:a63:eb49:: with SMTP id b9mr17550530pgk.318.1618064732765;
        Sat, 10 Apr 2021 07:25:32 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:8d5:10ce:6d52:dfc6? ([2601:202:4180:a5c0:8d5:10ce:6d52:dfc6])
        by smtp.gmail.com with ESMTPSA id em16sm5415491pjb.43.2021.04.10.07.25.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Apr 2021 07:25:32 -0700 (PDT)
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Khem Raj <raj.khem@gmail.com>
From: "akuster" <akuster808@gmail.com>
Subject: Hardknott merge request - April 10
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <46848cd2-8006-2c56-a21c-b2e90512e04f@gmail.com>
Date: Sat, 10 Apr 2021 07:25:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

The following changes since commit 4ff36ed798939b20746e5b06a04eadf235cceffa:

  README: updated Maintainers list for Hardknott (2021-03-31 07:05:07 -0700)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded hardknott-next

for you to fetch changes up to 94fe80ce8609d62e51cc190595a9f0c2a4a5a89e:

  xterm: upgrade 366 -> 367 (2021-04-08 13:13:29 -0700)

----------------------------------------------------------------
Andreas Müller (6):
      networkmanager-openvpn: Fix packageing
      mousepad: upgrade 0.5.3 -> 0.5.4
      xfce4-battery-plugin: upgrade 1.1.3 -> 1.1.4
      gigolo: upgrade 0.5.1 -> 0.5.2
      thunar: upgrade 4.16.4 -> 4.16.6
      poppler: upgrade 21.03.0 -> 21.04.0

Andrew Geissler (1):
      nodejs: ppc64le machine support

Awais Belal (1):
      libnet-ssleay-perl: add rdep on perl-module-autoloader

Hermes Zhang (1):
      gpsd: backport d-bus message time patch from upstream

INC@Cisco) (1):
      bpftool: improve reproducibility

Kartikey Rameshbhai Parmar (1):
      fluidsynth: update SRC_URI to remove non-existing 2.1.x branch

Khem Raj (12):
      flashrom: Add remaining RISCV support
      mpd: Check for commercial in LICENSE_FLAGS_WHITELIST
      mpv: Exclude from world if commercial is not in inclusion list
      sox: Exclude from world if commercial is not in inclusion list
      vlc: Exclude from world if commercial is not in inclusion list
      sox: Remove LICENSE_FLAGS = "commercial"
      mariadb: Fix build on newer 32bit architectures
      libmanette: Add recipe
      pidgin-sipe: Fix build with glib-2.0 >= 2.68
      gjs: Fix build with gcc11
      poppler: Backport patches to fix build with glib-2.0 2.68+ and GCC11
      opencv: Upgrade to 5.4.2

Leon Anavi (34):
      python3-sqlalchemy: Upgrade 1.4.3 -> 1.4.4
      python3-bitarray: Upgrade 1.8.1 -> 1.8.2
      python3-httplib2: Upgrade 0.19.0 -> 0.19.1
      python3-parso: Upgrade 0.8.1 -> 0.8.2
      python3-matplotlib: Upgrade 3.3.4 -> 3.4.1
      python3-pyroute2: Upgrade 0.5.15 -> 0.5.16
      python3-h5py: Upgrade 3.1.0 -> 3.2.1
      python3-cheetah: Upgrade 3.2.6 -> 3.2.6.post1
      python3-google-api-python-client: Upgrade 2.0.2 -> 2.1.0
      python3-xlsxwriter: Upgrade 1.3.7 -> 1.3.8
      python3-pymisp: Upgrade 2.4.140 -> 2.4.141
      python3-tqdm: Upgrade 4.58.0 -> 4.59.0
      python3-contextlib2: Upgrade 0.6.0 -> 0.6.0.post1
      python3-typeguard: Upgrade 2.11.1 -> 2.12.0
      python3-decorator: Upgrade 4.4.2 -> 5.0.1
      python3-pillow: Upgrade 8.1.2 -> 8.2.0
      python3-aiohttp: Upgrade 3.7.4 -> 3.7.4.post0
      python3-networkx: Upgrade 2.5 -> 2.5.1
      python3-pysonos: Upgrade 0.0.40 -> 0.0.41
      python3-docutils: Upgrade 0.16 -> 0.17
      python3-bitarray: Upgrade 1.8.2 -> 1.9.0
      python3-regex: Upgrade 2021.3.17 -> 2021.4.4
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

Martin Jansa (13):
      packagegroup-meta-multimedia: include projucer only with x11 in
DISTRO_FEATURES
      packagegroup-meta-multimedia: include vlc only with x11 in
DISTRO_FEATURES
      packagegroup-meta-oe: include glfw, icewm, geis only with x11 in
DISTRO_FEATURES
      phonet-utils: remove
      packagegroup-meta-oe: use 4 spaces for identation
      telepathy-glib: respect GI_DATA_ENABLED when enabling vala-bindings
      uml-utilities: fix installed-vs-shipped with usrmerge
      libsmi: use /bin/sh instead of ${base_bindir}/sh to silence QA
error with usrmerge
      libyui: switch to libyui-old repo which still has this SRCREV
      libyui(-ncurses): upgrade to 4.1.1, libyui repo was rewritten
completely
      android-tools: use PN instead of BPN in RDEPENDS
      pidgin-sipe: fix g_memdup2 changes to be backwards compatible with
glib-1.67
      pidgin: upgrade to 2.14.2

Mingli Yu (2):
      freeradius: Upgrade to 3.0.21
      hostapd: fix CVE-2021-0326 and CVE-2021-27803

Randy MacLeod (1):
      doxygen: Upgrade 1.8.20 -> 1.9.1

Ross Burton (2):
      flashrom: recipe cleanup
      openjpeg: add native/nativesdk class extension

Valentin Longchamp (1):
      libssh: add gcrypt to PACKAGECONFIG

Vinicius Aquino (1):
      networkmanager: upgrade 1.28.0 -> 1.30.2

Yann Dirson (1):
      mpv: remove explicit LICENSE_FLAGS

Yi Fan Yu (1):
      rsyslog: fix some of the ptests

hasan.men (2):
      librdkafka: Add initial recipe v1.6.1
      libcppkafka: Add initial recipe for cppkafka wrapper

wangmy (1):
      mariadb: upgrade 10.5.8 -> 10.5.9

zangrc (14):
      gnome-autoar: upgrade 0.2.4 -> 0.3.1
      emacs: upgrade 27.1 -> 27.2
      fbgrab: upgrade 1.4 -> 1.5
      ostree: upgrade 2020.8 -> 2021.1
      zabbix: upgrade 5.2.5 -> 5.2.6
      libxaw: upgrade 1.0.13 -> 1.0.14
      mosquitto: upgrade 2.0.9 -> 2.0.10
      nbdkit: upgrade 1.25.4 -> 1.25.5
      stunnel: upgrade 5.58 -> 5.59
      usbredir: upgrade 0.8.0 -> 0.9.0
      hwdata: upgrade 0.345 -> 0.346
      live555: upgrade 20210322 -> 20210406
      rabbitmq-c: upgrade 0.10.0 -> 0.11.0
      xterm: upgrade 366 -> 367

zhengruoqin (4):
      fetchmail: upgrade 6.4.17 -> 6.4.18
      lldpd: upgrade 1.0.4 -> 1.0.8
      networkmanager-openvpn: upgrade 1.8.12 -> 1.8.14
      snort: upgrade 2.9.17 -> 2.9.17.1




