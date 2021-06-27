Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web09.2630.1624825339627586169
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Jun 2021 13:22:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=osrGlyRX;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id bb10-20020a17090b008ab029016eef083425so11391265pjb.5
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Jun 2021 13:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id;
        bh=4GvMFt+XQoFrGwaerT4AJNF64CFxrZ5dDqeg67GV8f8=;
        b=osrGlyRXZwYuhj4pWfFUTwfsEaN4t7cOkepIP9wcWnfdvSr4kUngLGe26GnPmfptyF
         Ml2e6/ynPsNkGlnY6O8V6YCT76CulWDjXVJqBC2C+fF7oJhxvJU+qCqzb7RWIvrHGY/r
         mdtnPyUKf2x7AO3ykVo7C+9ddhjwDhCDzaDbROkymfHT59OM2ZwPlopVNxcxuObSmSg5
         Ms7kya/Tl418UPsdSSk7OBO3Yfkfw/HhrbKVDddbW9Os+o7/0XirxBb0Bdy9mWMccBnz
         CfmnlIP7Xw8+kfeGymQEcg6t5jDH0LSDKNMs3Lb/ZnvcMVLucDXfgwF7g8/sA/7/cTzq
         8u3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=4GvMFt+XQoFrGwaerT4AJNF64CFxrZ5dDqeg67GV8f8=;
        b=GDJzEHTVlkGeBbsVuWgdz9Z+7RJFWsLAaNNRc6JvxQQhleCGAJb5kgH/Pt8g8cijSL
         uqkCOAHPO33NmIwnY7en136khFJNjazjEwXOLo8hVQ8MVgjrP9sADmub1K8BOPsw94hd
         w6L0bC8T0kNPxUvo6x88krkPwCzmFAMHb4c5hJkBesGre8U8O5/C9EZVhtmK7Khl1D5L
         KuF6I8MkR4flsh8kqp+QNAh2vwBGJ7jJF/JhUkkb/wb8vmOUdMiQkpuOVEsy6hjKHCd3
         PiH5R1QCm7gZ0JVMsRRUgCZwafk577W+9cngVDSJrcRGUC99/rb/86EOjILbod3LVAcF
         mDcg==
X-Gm-Message-State: AOAM533JvPnx7/btIn8uSGQnzvU0Or8+k8Aw7WlGYPCVsG3GKi/HPCRB
	zbVlt4kUpVu7ZEAvN8jw4dHa62Bqq2ifZA==
X-Google-Smtp-Source: ABdhPJz/9ug53m2ZAGRPvmPvoWXvWgskaURDq2LHGgMizk+alwIF0tzdkxKOE+OTRZjUqpm48SfSHg==
X-Received: by 2002:a17:90b:14d1:: with SMTP id jz17mr33047139pjb.45.1624825338529;
        Sun, 27 Jun 2021 13:22:18 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:90a0:cfd2:ffe1:efef])
        by smtp.gmail.com with ESMTPSA id ay3sm3501192pjb.38.2021.06.27.13.22.17
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jun 2021 13:22:18 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 00/20] Patch review; June 27
Date: Sun, 27 Jun 2021 13:21:55 -0700
Message-Id: <cover.1624825239.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

Please have comments back by wednesday.

The following changes since commit aca88908fd329f5cef6f19995b072397fb2d8ec6:

  thunar: fix CVE-2021-32563 (2021-06-13 12:35:48 -0700)

are available in the Git repository at:

  git://git.openembedded.org/meta-openembedded-contrib stable/hardknott-nut
  http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=stable/hardknott-nut

Andrea Adami (3):
  initramfs-kexecboot-image: support cases where machines override
    IMAGE_FSTYPES
  initramfs-debug-image: support cases where machines override
    IMAGE_FSTYPES
  rapidjson: remove stale LIB_INSTALL_DIR

Chen Qi (1):
  minifi-cpp: set CLEANBROKEN to 1

Geoff Parker (1):
  cifs-utils: set ROOTSBINDIR to /usr/sbin if DISTRO_FEATURES has
    usrmerge

Leon Anavi (1):
  python3-django: Upgrade 3.2.3 -> 3.2.4

Olivier Georget (1):
  libpfm4 4.10.1 : enable arm64 host platform

Ovidiu Panait (1):
  libeigen: update LICENSE information

Peter Kjellerstedt (2):
  net-snmp: A little clean up
  net-snmp: Support building for native

Sekine Shigeki (2):
  add CVE-2011-2411 to allowlist
  ntp: add CVE-2016-9312 to allowlist

Trevor Gamblin (3):
  python3-django: upgrade 2.2.22 -> 2.2.23
  python3-django: upgrade 3.2.2 -> 3.2.3
  python3-django: upgrade 2.2.23 -> 2.2.24

Yi Zhao (1):
  minifi-cpp: set correct python processor directory in configure file

ito-yuichi@fujitsu.com (2):
  cyrus-sasl: add CVE-2020-8032 to allowlist
  dovecot: add CVE-2016-4983 to allowlist

zangrc (1):
  wireshark: upgrade 3.4.5 -> 3.4.6

zhengruoqin (1):
  net-snmp: upgrade 5.9 -> 5.9.1

 .../images/initramfs-debug-image.bb           |  7 ++-
 .../images/initramfs-kexecboot-image.bb       |  8 ++-
 .../samba/samba_4.10.18.bb                    |  4 ++
 .../cyrus-sasl/cyrus-sasl_2.1.27.bb           |  3 ++
 ....7.2-fix-engineBoots-value-on-SIGHUP.patch | 19 ++++---
 .../{net-snmp_5.9.bb => net-snmp_5.9.1.bb}    | 53 ++++++++++---------
 .../recipes-support/cifs/cifs-utils_6.13.bb   | 17 ++++--
 .../recipes-support/dovecot/dovecot_2.3.14.bb |  3 ++
 .../recipes-support/ntp/ntp_4.2.8p15.bb       |  3 ++
 ...{wireshark_3.4.5.bb => wireshark_3.4.6.bb} |  2 +-
 meta-oe/licenses/MINPACK                      | 51 ++++++++++++++++++
 .../rapidjson/rapidjson_git.bb                |  2 +-
 .../minifi-cpp/minifi-cpp_0.7.0.bb            |  5 ++
 .../recipes-kernel/libpfm/libpfm4_4.10.1.bb   |  3 +-
 .../libeigen/libeigen_3.3.7.bb                |  9 +++-
 ...ngo_2.2.22.bb => python3-django_2.2.24.bb} |  4 +-
 ...jango_3.2.2.bb => python3-django_3.2.4.bb} |  2 +-
 17 files changed, 149 insertions(+), 46 deletions(-)
 rename meta-networking/recipes-protocols/net-snmp/{net-snmp_5.9.bb => net-snmp_5.9.1.bb} (89%)
 rename meta-networking/recipes-support/wireshark/{wireshark_3.4.5.bb => wireshark_3.4.6.bb} (97%)
 create mode 100644 meta-oe/licenses/MINPACK
 rename meta-python/recipes-devtools/python/{python3-django_2.2.22.bb => python3-django_2.2.24.bb} (41%)
 rename meta-python/recipes-devtools/python/{python3-django_3.2.2.bb => python3-django_3.2.4.bb} (77%)

-- 
2.17.1

