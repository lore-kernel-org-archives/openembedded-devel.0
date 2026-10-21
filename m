Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7059.1792572071431303605
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 01:41:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=B8n640qb;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48c4d870d54so302971f8f.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 01:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792572069; x=1793176869; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5T8WyXaf0ZlAB35oY+5udqTLvcWUMsg0yGpJwBrhJms=;
        b=B8n640qbeNPeadtoxNPGvGgNT72T6SpAOFTAoNp3VFqMKVPtxLcwjJusmKKeetiKqj
         MDsundukMsupwK5kibQjA3ivl1xqsCFRS/Pc/K/K0UK4b0FHerhQvTGZZavqB9ZKtabr
         7X/wcG9lpfgdpwOYIHtFEBsCuyHF0WyACarz0mxT2gedzn5jiTnMD0PmgDLgYCYfee1m
         J0RHYFwg19lz3Y1W+/qG0K29o1BR9H2Aiyp9JtgOoYAMb/qYOtYkcyEy9OMrNG2lxXal
         5oFlplTKzazVm//Ri6pIzukGf8LQZqMxalk2EqIiPL92KojyOe3Fe37OhNp8y1nkcGzw
         stWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792572069; x=1793176869;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5T8WyXaf0ZlAB35oY+5udqTLvcWUMsg0yGpJwBrhJms=;
        b=Ag2ntJUijkhfzDnvhua4VRETmVGONDnZ2WtBiyWHUFpnTgKElVaKwJwedyEe/sN2yc
         hftqqIDZSe+xd5bbDtVWElrgkFl58wvszZPslQw11BmQoCwn4TaXV+sRl4LR2hO31Pv4
         btKZcygHJhiufPbcb2Ofc0b31lvc8yniIzmLm4UyWLRvRJ7hXJtR9YO+pQx6rMLZez1Q
         kr0Qk8jwT9J6TKDLpgG91wR00bhO/SRtIEUqKRTJNYqEMt++NYt265RY1y9K3Vd/kB0t
         QHW6gW0Nlm1jvcgNSswvCpd5Y//wU0RlDqs3RffjCk+4EABZ61g/YoxNqBxMj7lkGnEd
         xmjQ==
X-Gm-Message-State: AFq9FYLnzrX2RvJkkvxYG22E6+gTkxxzMN8HnjWzZB82z0KTPoUI+8n6
	EQ1LIqaapWfpevl6+x/1mKjHF6Brs3MqUXv/Cv0XsqIsyJXo/QwbqQQ0EUx52A==
X-Gm-Gg: AYBFou0f+Bg/B5Z5597VfhE6a6TxQMj+tyIncVqfLsBfJi01qhdi7+ZQCXL/EEn7xB7
	aUEnLxbMclfHoK6LGyXK89LtKxyvayGdAmTHZacn0ylDxMYJEfOUj4QpbuEKy8t/3yMJD8v55Pc
	EkVq9zOflXUNxb0eMECFX1BIXzzyEUnedQEJmTUTB2WvHl8FPFXJWDlJLhYGzD6iR97ReJtjDPl
	iuiYONR+WM8BDC9rljo2SBrFsitZz482YK8nlp69VyptUsJAuHrnawEpSZeqckCTDxAV9W8AlCF
	NbaMGYsMgdIQRc/mERwygxRy/nGKCUCHfcc3YgKuCjYuqMoBKM8gi+evKHUTnREXMtFRqgRQxVS
	66ZuJj2ZDIgI4GVj7dCrcuUmem1MsaVmR33KOImRd1J4AZrEkUKilyeEtfFUVyLrfDijUZLtt6X
	VX3jyNR62BXozQu/QMpY4Th68UDxLen0lrSRALt04q4TlyYXZvfD6iyEGRGmdQcjgnzJmohB7s5
	LYgIlIIcB7yhTyZUZ/WUKlYtKUXlRd5YsjTVruvRXjOGbeZm2w+CaGr5dX8H+EeJASd6aieWIUi
	T1XBUKDHMLS6P6BgOZ72k0Gwq2QiN+cQxj0mxsid
X-Received: by 2002:a05:600c:628d:b0:4a1:f377:5c6e with SMTP id 5b1f17b1804b1-4a1fdd20a24mr23113825e9.7.1792572069146;
        Wed, 21 Oct 2026 01:41:09 -0700 (PDT)
Return-Path: <alex.kiernan@gmail.com>
Received: from localhost.localdomain (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25834086sm4165098f8f.34.2026.10.21.01.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 01:41:07 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-networking][PATCH] wireshark: let PACKAGECONFIG libnl turn netlink off
Date: Wed, 21 Oct 2026 09:40:45 +0100
Message-ID: <20261021084044.469142-2-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 08:41:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131187
Content-Type: text/plain; charset="utf-8"

When the migration from autotools to cmake happened, the libnl
PACKAGECONFIG was kept, but -DENABLE_NETLINK=ON was in EXTRA_OECMAKE
unconditionally.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 meta-networking/recipes-support/wireshark/wireshark_4.6.9.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_4.6.9.bb b/meta-networking/recipes-support/wireshark/wireshark_4.6.9.bb
index fec2345b0638..a639d698948f 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_4.6.9.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_4.6.9.bb
@@ -44,7 +44,7 @@ PACKAGECONFIG:class-native = "libpcap gnutls ssl libssh"
 PACKAGECONFIG[libcap] = "-DENABLE_CAP=ON,-DENABLE_CAP=OFF -DENABLE_PCAP_NG_DEFAULT=ON, libcap"
 PACKAGECONFIG[libpcap] = "-DENABLE_PCAP=ON,-DENABLE_PCAP=OFF -DENABLE_PCAP_NG_DEFAULT=ON , libpcap"
 PACKAGECONFIG[libsmi] = "-DENABLE_SMI=ON,-DENABLE_SMI=OFF,libsmi"
-PACKAGECONFIG[libnl] = ",,libnl"
+PACKAGECONFIG[libnl] = "-DENABLE_NETLINK=ON,-DENABLE_NETLINK=OFF,libnl"
 PACKAGECONFIG[portaudio] = "-DENABLE_PORTAUDIO=ON,-DENABLE_PORTAUDIO=OFF, portaudio-v19"
 PACKAGECONFIG[gnutls] = "-DENABLE_GNUTLS=ON,-DENABLE_GNUTLS=OFF, gnutls"
 PACKAGECONFIG[ssl] = ",,openssl"
@@ -64,8 +64,7 @@ PACKAGECONFIG[qt5] = "-DENABLE_QT5=ON -DBUILD_wireshark=ON -DUSE_qt6=OFF, -DENAB
 
 inherit_defer ${@bb.utils.contains('PACKAGECONFIG', 'qt5', 'cmake_qt5', '', d)}
 
-EXTRA_OECMAKE += "-DENABLE_NETLINK=ON \
-                  -DBUILD_mmdbresolve=OFF \
+EXTRA_OECMAKE += "-DBUILD_mmdbresolve=OFF \
                   -DBUILD_randpktdump=OFF \
                   -DBUILD_androiddump=OFF \
                   -DBUILD_dcerpcidl2wrs=OFF \
