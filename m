Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.41216.1606160465635180812
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Nov 2020 11:41:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=H8YzczI8;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id x24so3621132pfn.6
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2020 11:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:autocrypt:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=DGkbOwoOJdBpmMUIGABJtJV/+GaBDpMYotfSJbHM1jY=;
        b=H8YzczI8bq8OWl8+UE6xQyDaVtzXCLQGvKJEKK5enxTZOlngY6GHzKxhcmtd1jZwJQ
         oktbaSunW6Ma3luEPctcEy7Dfova6cHl7xTbYbkp6yTh6TeL0gedCfFs0og3fqwLByhy
         jhnIaVtvQQXykoIROG2vtya3ShN6e3/oIVDRIhWbKWioFQ5eju4At2q/i6zGmI3ANnLh
         xy5iHTBnekakC1ZGpubWBbM273VWEx8rAUcVmEjHfA8GrvTwGdOuwCm/xuWijqWzTsHH
         uXwB2AJqDqaeib4ghtFX4hesThliL6h9xu/6paYn9b1IB0xgL1gSqJFRhbgw+Nz94PQZ
         ijXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:autocrypt:message-id:date
         :user-agent:mime-version:content-transfer-encoding:content-language;
        bh=DGkbOwoOJdBpmMUIGABJtJV/+GaBDpMYotfSJbHM1jY=;
        b=NiWnaP9oStaAuJ6njrPI/ybsdh9puiDGQOmcx/VlgUwttqFqccPs4P0JuPkOnrMSKz
         RbrjVvEWLAP3WZCo22TtUDjiKc0Oba1akFtBSpeXssGPsH8xlJ1wdWpUVxq1ahmQowTb
         shb1mipLBAbhPh8sHlarrVi90JERwMw2ljd/l4ojUyBP4VawEC8/6dC8CmeVVL7i4Y9H
         0Ykc/uftKiA2CvWLEnJffBLmaAsPZ+0lbNIOfksnd/CWVpMcI5x2u+Tr9cwrFlsuCe4B
         9ITChspu9jDzFSwLU3Gh4ejqMfB9BuA3JCLTTr5MwSghEkWs1op54WB76rbdZoUc2lXv
         L0kg==
X-Gm-Message-State: AOAM531IwDDYHVOGtrtc57Vl04dMXuU6aenwUptnPBZTMKVzSwxPWwjY
	/J+pjDh1eS2T3suQ11fWerA=
X-Google-Smtp-Source: ABdhPJxDLDUE4R6WSfPkF/TPkflv26IjcuAVGhvCLCNRj6LOjO54vZI0rOP4GZXDw+HCdcZyIHTyIw==
X-Received: by 2002:aa7:96ba:0:b029:197:e733:ae3c with SMTP id g26-20020aa796ba0000b0290197e733ae3cmr940339pfk.46.1606160465108;
        Mon, 23 Nov 2020 11:41:05 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:55a3:5ef5:c2ab:7e5b? ([2601:202:4180:a5c0:55a3:5ef5:c2ab:7e5b])
        by smtp.gmail.com with ESMTPSA id mp16sm183716pjb.13.2020.11.23.11.41.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2020 11:41:04 -0800 (PST)
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
 Khem Raj <raj.khem@gmail.com>
From: "akuster" <akuster808@gmail.com>
Subject: Dunfell-next merge request Nov 23
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <9a7c96e6-34e7-0331-a97b-9f5f2c423552@gmail.com>
Date: Mon, 23 Nov 2020 11:41:03 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

The following changes since commit 2a5c534d2b9f01e9c0f39701fccd7fc874945b1c:

  python3-pykwalify: fix missing comma (2020-10-04 16:32:42 -0700)

are available in the Git repository at:

  git://git.openembedded.org/meta-openembedded dunfell-next

for you to fetch changes up to f2d02cb71eaff8eb285a1997b30be52486c160ae:

  python3-pyinotify: Add missing ctypes dependency (2020-11-15 11:13:25
-0800)

----------------------------------------------------------------
Anatol Belski (1):
      chrony: Patch CVE-2020-14367

Diego Rondini (5):
      README: fix incorrect links
      gvfs: adjust fuse packageconfig to fuse3
      libeigen: update SRC_URI to download from gitlab
      libeigen: update SRC_URI to use gitlab git
      hplip: use libexecdir

Gianluca Pacchiella (1):
      Add missing dependencies for rsnapshot.

Khem Raj (1):
      ubi-utils-klibc: Remove trailing slash from S

Lee Chee Yang (2):
      glog : improve reproducibility
      libgphoto2: improve reproducibility

Mark Jonas (1):
      python3-pyinotify: Add missing ctypes dependency

Martin Jansa (1):
      remmina: use git fetcher

Ross Burton (1):
      mpv: fetch waf in do_fetch

Ulrich Ölmann (1):
      usb-modeswitch, usb-modeswitch-data: fix usrmerge

Yi Zhao (1):
      samba: upgrade 4.10.17 -> 4.10.18

Zang Ruochen (2):
      wireshark: upgrade 3.2.5 -> 3.2.6
      wireshark: upgrade 3.2.6 -> 3.2.7

 meta-gnome/recipes-gnome/gvfs/gvfs_1.42.2.bb       |   2 +-
 .../recipes-devtools/mtd/ubi-utils-klibc_2.0.2.bb  |   2 +-
 meta-multimedia/README                             |   2 +-
 .../0001-util-Simplify-input-validation.patch      |  59 ------
 ...ild-on-FreeBSD-by-avoiding-NSS_BUFLEN_PAS.patch |  79 --------
 ...cate-larger-buffer-if-getpwuid_r-returns-.patch |  50 -----
 .../samba/{samba_4.10.17.bb => samba_4.10.18.bb}   |   7 +-
 .../chrony/chrony/CVE-2020-14367.patch             | 204
+++++++++++++++++++++
 .../recipes-support/chrony/chrony_3.5.bb           |   1 +
 .../{wireshark_3.2.5.bb => wireshark_3.2.7.bb}     |   2 +-
 meta-oe/README                                     |   4 +-
 meta-oe/recipes-extended/hplip/hplip_3.19.12.bb    |  14 +-
 .../recipes-graphics/gphoto2/libgphoto2_2.5.25.bb  |   6 +
 meta-oe/recipes-multimedia/mplayer/mpv_0.32.0.bb   |  12 +-
 meta-oe/recipes-support/glog/glog_0.3.5.bb         |   7 +
 meta-oe/recipes-support/libeigen/libeigen_3.3.7.bb |   8 +-
 meta-oe/recipes-support/remmina/remmina_1.3.6.bb   |   7 +-
 meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb |   2 +
 .../usb-modeswitch/usb-modeswitch-data_20191128.bb |   4 +-
 .../usb-modeswitch/usb-modeswitch_2.6.0.bb         |   2 +-
 .../python/python3-pyinotify_0.9.6.bb              |   3 +-
 21 files changed, 252 insertions(+), 225 deletions(-)
 delete mode 100644
meta-networking/recipes-connectivity/samba/samba/0001-util-Simplify-input-validation.patch
 delete mode 100644
meta-networking/recipes-connectivity/samba/samba/0002-util-Fix-build-on-FreeBSD-by-avoiding-NSS_BUFLEN_PAS.patch
 delete mode 100644
meta-networking/recipes-connectivity/samba/samba/0003-util-Reallocate-larger-buffer-if-getpwuid_r-returns-.patch
 rename meta-networking/recipes-connectivity/samba/{samba_4.10.17.bb =>
samba_4.10.18.bb} (97%)
 create mode 100644
meta-networking/recipes-support/chrony/chrony/CVE-2020-14367.patch
 rename meta-networking/recipes-support/wireshark/{wireshark_3.2.5.bb =>
wireshark_3.2.7.bb} (96%)

