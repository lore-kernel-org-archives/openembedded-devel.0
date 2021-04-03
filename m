Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.35714.1617484032126660629
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 03 Apr 2021 14:07:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=czyCQCWG;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id w18so8821481edc.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 03 Apr 2021 14:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3GLp4EHEPfnxA11GCzAq1UMr1cEc4jCV8hQuVjHa/D4=;
        b=czyCQCWGafXXVhjAN7ZXw1f+26IPCvnNwwSEZiVL1fqINVM6a5bVmJFdb/hxB9HVg4
         dtB0VCafI0z/c0uY507QQ7C1el0sU7qoHRuU7WI9j+Vj1hIeo+vErtele3kZwxKjAdlx
         l+xrrg3xnvit0kjc90kZHFwGr5LN2mQnxXlV0/4Cr1yxSTG2n7tm5BYNTOLF9W0cY+W3
         5ARrv5r60E7C2rx4ww9G53dYAuEAWxME4Yd0I6g2lAby/qMymk9zgncGqPz6JST1e15p
         Tjcpg7uojyufsv5u4CBh5oBV9sQGwiOUeFrGKFvxd/WakpaXhQcjWU1iSkfKdYEgrw0a
         /3GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3GLp4EHEPfnxA11GCzAq1UMr1cEc4jCV8hQuVjHa/D4=;
        b=DBgcV/qfziqGT2kLP7/OC7n3SZfEp5PpIz8PYmrlnuL+nOhRCtnjAg526OoTURExFR
         nhb+DXpAcgbEC+s/VIOG2sEz5f29DL4CWnrDnGxc5KdeGb0jr4yDpf0SfW4rAsZfpR/3
         U+Zr6cENaPvvrwALgSmS4Tnnlvs6b86L1ah8ezQkZMY2nRqphOd+YRSzBPoBotyFXVJw
         q4RIJfu18CW6aUJs6KGCNyul99IZ9Llwof/6+OtU0OKDP7lHXoECcEqTL1w3nKMgUKrE
         9fNeCfSdIqp/ZjdXve4L7MXhBn96ZbWvX3vb04swvalXi4/Fim93VFwy0yCY21m1vRoY
         hW7Q==
X-Gm-Message-State: AOAM531Z/VnAX7xvMURBgUlwcNMlVFh9DiPrrLd1xMRFqWWCDILH6Jjx
	714Hrqbh7uEeKcf6NmaVbaol56IyBnM=
X-Google-Smtp-Source: ABdhPJzWDgAbDergIaTNs65r4g/MM1Bjnh5OzdnZp3KYGLfxe5AX+LVzOFg6vPto+/X1aLWEMiJZtg==
X-Received: by 2002:aa7:cdcf:: with SMTP id h15mr22674039edw.28.1617484030563;
        Sat, 03 Apr 2021 14:07:10 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id dg26sm7581065edb.88.2021.04.03.14.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Apr 2021 14:07:10 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/2] packagegroup-meta-oe: use 4 spaces for identation
Date: Sat,  3 Apr 2021 23:07:06 +0200
Message-Id: <20210403210706.1427733-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210403210706.1427733-1-Martin.Jansa@gmail.com>
References: <20210403210706.1427733-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../packagegroups/packagegroup-meta-oe.bb     | 204 +++++++++---------
 1 file changed, 102 insertions(+), 102 deletions(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index d5e5aa01cd..a6513352c0 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -321,109 +321,109 @@ RDEPENDS_packagegroup-meta-oe-devtools_remove_aarch64 = "concurrencykit"
 RDEPENDS_packagegroup-meta-oe-devtools_remove_x86 = "ply"
 
 RDEPENDS_packagegroup-meta-oe-extended ="\
-     bitwise \
+    bitwise \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11 wayland opengl", "boinc-client", "", d)} \
-     brotli \
-     byacc \
-     cmpi-bindings \
-     collectd \
-     cfengine-masterfiles \
-     cfengine \
-     ddrescue \
-     dialog \
-     enscript \
-     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "gnuplot", "", d)} \
-     dlt-daemon \
-     docopt.cpp \
-     iotop \
-     dumb-init \
-     konkretcmpi \
-     figlet \
-     libcec \
-     libdivecomputer \
-     fluentbit \
-     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "libgxim", "", d)} \
-     liblognorm \
-     libmodbus \
-     haveged \
-     hexedit \
-     hiredis \
-     hplip \
-     hwloc \
-     libleak \
-     libuio \
-     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "libwmf", "", d)} \
-     lprng \
-     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "icewm", "", d)} \
-     md5deep \
-     indent \
-     jansson \
-     nana \
-     nicstat \
-     ${@bb.utils.contains("DISTRO_FEATURES", "pam", "openwsman", "", d)} \
-     p7zip \
-     isomd5sum \
-     jpnevulator \
-     ${@bb.utils.contains("DISTRO_FEATURES", "polkit", "polkit-group-rule-datetime polkit-group-rule-network polkit", "", d)} \
-     rarpd \
-     redis \
-     libfastjson \
-     librelp \
-     sblim-cmpi-devel \
-     sblim-sfc-common \
-     ${@bb.utils.contains("DISTRO_FEATURES", "pam", "sblim-sfcb ", "", d)} \
-     sblim-sfcc \
-     libblockdev \
-     sgpio \
-     smartmontools \
-     can-utils \
-     canutils \
-     libsocketcan \
-     libconfig \
-     linuxconsole \
-     uml-utilities \
-     libidn \
-     libqb \
-     wipe \
-     libzip \
-     zram \
-     libplist \
-     libusbmuxd \
-     liblockfile \
-     liblogging \
-     libnss-nisplus \
-     libpwquality \
-     ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "libreport", "", d)} \
-     libserialport \
-     libstatgrab \
-     lockfile-progs \
-     logwatch \
-     mailx \
-     mraa \
-     ostree \
-     ${@bb.utils.contains("DISTRO_FEATURES", "pam", "pam-plugin-ccreds pam-plugin-ldapdb pam-ssh-agent-auth", "", d)} \
-     pegtl \
-     libfile-fnmatch-perl \
-     rrdtool \
-     sanlock \
-     scsirastools \
-     sedutil \
-     libsigrok \
-     libsigrokdecode \
-     sigrok-cli \
-     snappy \
-     tipcutils \
-     tiptop \
-     tmate \
-     tmux \
-     triggerhappy \
-     upm \
-     vlock \
-     volume-key \
-     wxwidgets \
-     zlog \
-     zstd \
-     redis-plus-plus \
+    brotli \
+    byacc \
+    cmpi-bindings \
+    collectd \
+    cfengine-masterfiles \
+    cfengine \
+    ddrescue \
+    dialog \
+    enscript \
+    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "gnuplot", "", d)} \
+    dlt-daemon \
+    docopt.cpp \
+    iotop \
+    dumb-init \
+    konkretcmpi \
+    figlet \
+    libcec \
+    libdivecomputer \
+    fluentbit \
+    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "libgxim", "", d)} \
+    liblognorm \
+    libmodbus \
+    haveged \
+    hexedit \
+    hiredis \
+    hplip \
+    hwloc \
+    libleak \
+    libuio \
+    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "libwmf", "", d)} \
+    lprng \
+    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "icewm", "", d)} \
+    md5deep \
+    indent \
+    jansson \
+    nana \
+    nicstat \
+    ${@bb.utils.contains("DISTRO_FEATURES", "pam", "openwsman", "", d)} \
+    p7zip \
+    isomd5sum \
+    jpnevulator \
+    ${@bb.utils.contains("DISTRO_FEATURES", "polkit", "polkit-group-rule-datetime polkit-group-rule-network polkit", "", d)} \
+    rarpd \
+    redis \
+    libfastjson \
+    librelp \
+    sblim-cmpi-devel \
+    sblim-sfc-common \
+    ${@bb.utils.contains("DISTRO_FEATURES", "pam", "sblim-sfcb ", "", d)} \
+    sblim-sfcc \
+    libblockdev \
+    sgpio \
+    smartmontools \
+    can-utils \
+    canutils \
+    libsocketcan \
+    libconfig \
+    linuxconsole \
+    uml-utilities \
+    libidn \
+    libqb \
+    wipe \
+    libzip \
+    zram \
+    libplist \
+    libusbmuxd \
+    liblockfile \
+    liblogging \
+    libnss-nisplus \
+    libpwquality \
+    ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "libreport", "", d)} \
+    libserialport \
+    libstatgrab \
+    lockfile-progs \
+    logwatch \
+    mailx \
+    mraa \
+    ostree \
+    ${@bb.utils.contains("DISTRO_FEATURES", "pam", "pam-plugin-ccreds pam-plugin-ldapdb pam-ssh-agent-auth", "", d)} \
+    pegtl \
+    libfile-fnmatch-perl \
+    rrdtool \
+    sanlock \
+    scsirastools \
+    sedutil \
+    libsigrok \
+    libsigrokdecode \
+    sigrok-cli \
+    snappy \
+    tipcutils \
+    tiptop \
+    tmate \
+    tmux \
+    triggerhappy \
+    upm \
+    vlock \
+    volume-key \
+    wxwidgets \
+    zlog \
+    zstd \
+    redis-plus-plus \
 "
 RDEPENDS_packagegroup-meta-oe-extended_append_libc-musl = " libexecinfo"
 RDEPENDS_packagegroup-meta-oe-extended_append_x86-64 = " pmdk libx86-1"
-- 
2.30.2

