Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web09.19737.1621261508072664554
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 May 2021 07:25:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CeJZy3HY;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id gc22-20020a17090b3116b02901558435aec1so3792319pjb.4
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 May 2021 07:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tkwl4LCh4RJSMVt5SE+NuXmIUkbYbFNazzhxxzKGd3M=;
        b=CeJZy3HYx9n+8sVhya1tH1BfppHFWuaCsepYaMEaZV42UWQgXUfFrrIB834NGTDrF9
         CFlLcL6BvVqQS1AeMdzTAoDxrhwurfFhLfPLpVLMw+Y7GX5raG7QSlV7YWpkIjGDUy1L
         sp3KrMGK/QcCaHT5v89EJklqGOoJZ9tslSHz2/HZxXLBce9UbjvpdIt1dWM2mf9t7CBx
         Zm5fdwhmBB/sYn5RTUo2TFNFj6+xcatCFl32q+T2Se7cCY4wpkPmvFzb5cmwkXgPeOEs
         CIztj2BRMEYIW1cdkGLkiHea92PCaSx8R1tzyTXCZ70CNlHmrgex95oRJsisanzJW5Kb
         Isow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tkwl4LCh4RJSMVt5SE+NuXmIUkbYbFNazzhxxzKGd3M=;
        b=IvmBq8nPzdvRzS5jegOSW+/FFlwrRe8jLMOZHadh1ip8rVudK+oFIHdWgmbfwiq8uA
         1Qfm5Mapa5K2uIpyI5PP9jbLAr8/owhDjdQU94MXzrRpeHAVpZoGbRsTv543m9T8cPYR
         F4xsk9XC1wEINRmv2F7QUjAb4jsjidyeoc0yKxN8nPrfJGgBMS4pWnKS/erOA7z6lg5y
         dDHM3zEsVgaGOYXqTwCLJz/KSCRUVERUx5Lw6ON93JjUMsaLhzDzYXo2DcZ24W/n8qKy
         hBTJpjRmICMgvXNho6wzl4NdhhbcwqEwElUWR+AZouF3KZQ76tUivhVYzTNsjPlLzTGZ
         Y4IA==
X-Gm-Message-State: AOAM5312nCaz031XxFiJSDw5VduWPPNyPGrwU504jrWF9TAdYY4Jqt4a
	xBJ8BLoV9o0qQVVK7BHKeEyqZ6PHGUM=
X-Google-Smtp-Source: ABdhPJz3xrKo573kdHCX1vwYwD0fqf6rVHphxBsYr9ZGzr01Q0Fhrc491ifuu0TLUDwOn50luHOeQw==
X-Received: by 2002:a17:90a:9202:: with SMTP id m2mr15640081pjo.180.1621261507260;
        Mon, 17 May 2021 07:25:07 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:e1a5:920e:5720:62fe])
        by smtp.gmail.com with ESMTPSA id s16sm10872008pga.5.2021.05.17.07.25.06
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 07:25:06 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 00/11] Pathc review May 17
Date: Mon, 17 May 2021 07:24:53 -0700
Message-Id: <cover.1621261426.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Please review and have comment back by Wednesday

The following changes since commit bbe3855ec7d7e1417a42e9d7a4d1d3d338812088:

  ostree: switch from default master branch to main to fix do_fetch failure (2021-05-13 21:37:32 -0700)

are available in the Git repository at:

  git://git.openembedded.org/meta-openembedded-contrib stable/hardknott-nut
  http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=stable/hardknott-nut

Andreas Müller (2):
  zsh: reduce priority slightly to avoid conflict with bash
  xfce4-settings: upgrade 4.16.0 -> 4.16.1

Khem Raj (3):
  aom: Match the name for AOM-Patent-License-1.0
  libdevmapper,lvm2: Do not inherit license
  python3-jinja2_2.%.bbappend: Delete

Saul Wold (2):
  tbb: Disable PPC as COMPATIBLE_MACHINE
  packagegroup-meta-oe: conditional remove tbb for powerpc

Silcet (1):
  ufw: fix python shebang

zangrc (3):
  fetchmail: upgrade 6.4.18 -> 6.4.19
  openvpn: upgrade 2.5.1 -> 2.5.2
  wireshark: upgrade 3.4.4 -> 3.4.5

 .../recipes-multimedia/aom/aom_3.0.0.bb       |  2 +-
 ...fix-dynamic-update-of-python-shebang.patch | 57 +++++++++++++++++++
 .../recipes-connectivity/ufw/ufw_0.33.bb      |  1 +
 ...etchmail_6.4.18.bb => fetchmail_6.4.19.bb} |  4 +-
 .../{openvpn_2.5.1.bb => openvpn_2.5.2.bb}    |  4 +-
 ...{wireshark_3.4.4.bb => wireshark_3.4.5.bb} |  2 +-
 .../packagegroups/packagegroup-meta-oe.bb     |  2 +-
 meta-oe/recipes-shells/zsh/zsh_5.4.2.bb       |  2 +-
 meta-oe/recipes-support/lvm2/lvm2.inc         |  5 +-
 meta-oe/recipes-support/tbb/tbb_2021.2.0.bb   |  3 +
 .../python/python3-jinja2_2.%.bbappend        | 13 -----
 ...ngs_4.16.0.bb => xfce4-settings_4.16.1.bb} |  2 +-
 12 files changed, 72 insertions(+), 25 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/ufw/ufw/fix-dynamic-update-of-python-shebang.patch
 rename meta-networking/recipes-support/fetchmail/{fetchmail_6.4.18.bb => fetchmail_6.4.19.bb} (83%)
 rename meta-networking/recipes-support/openvpn/{openvpn_2.5.1.bb => openvpn_2.5.2.bb} (95%)
 rename meta-networking/recipes-support/wireshark/{wireshark_3.4.4.bb => wireshark_3.4.5.bb} (97%)
 delete mode 100644 meta-python/recipes-devtools/python/python3-jinja2_2.%.bbappend
 rename meta-xfce/recipes-xfce/xfce4-settings/{xfce4-settings_4.16.0.bb => xfce4-settings_4.16.1.bb} (93%)

-- 
2.17.1

