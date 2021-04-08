Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
 by mx.groups.io with SMTP id smtpd.web11.245.1617899824793439678
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 09:37:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kz6PSyNr;
 spf=pass (domain: gmail.com, ip: 209.85.210.48, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f48.google.com with SMTP id h6-20020a0568300346b02901b71a850ab4so2891919ote.6
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 09:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=Ko8oPuXLtYh2aUUV4fY3JRFL+3oLs07kFlJItZrNHH4=;
        b=kz6PSyNr/o4HVPLmlEdAPnKJh40il1hAu+2zza+GQAJohuDK2lf6e6539eOmWZq03q
         rWtg1GoIuHdQa+1NSaJxAEnBkzGpHZSRB8mNsUrYHdbCyn6gCXrGJwbtz1qEh6sinB0r
         9Gx6xVBNw4uIgCIv4Uuh0LfuxNizsUTAfUoZC7CY21uUE/Dj9mUG4Vf3ox+3GzS1qMzO
         qnaj3hHw34bpbgwn7muOA//3uf0uydLL20sVOVIGkRyoRzVAqtb1/8yx+83uI4jzw4/C
         8Qgyrn7Ww4iv1HLcIo8+fj8J50LQ6azuL8YlE45G/0VnRdq1xY3YvAZJOBAtVTL0gAHl
         N99Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=Ko8oPuXLtYh2aUUV4fY3JRFL+3oLs07kFlJItZrNHH4=;
        b=omuN5s3pUFDHu3Zj7l9OMNH1lN7rqH/8zA7fzB/nYZ5WiwCHzZnnfJNa/VRp31S2Ru
         Wz4e6EOUOzi4MXQsFo6Y16faLvEkbtIIA5W3qaesK2EaYd73ETCS840hF90CIHW2jjEm
         bDjiqBmQwiEEc4WRG1ZnL0sjm2qnZx7iK+Kzc3o03nLsnP2kh/7q2mOXkaD2HA/nN7X8
         FJ+bfFwkfp6ZdY2YdaH8J3YLfYMoVqE5DNi4kdVtpKwbhR+E0UmMcU/soINxHAHx+GP6
         /H41SbWSCrtiv+2XbYs/q5NOdIL1x8LCpxiE5P5hgmJVwl9PPMWFCeS23NnFH/oWeSTI
         yw0g==
X-Gm-Message-State: AOAM531Q3NgRGtqtoMcqtHHAKtTrd+gd9XsIbSKSDIyZmELAwCZrvIqe
	uyGrsU0kYrudRKphQw9bZyXmuiA3Hi4=
X-Google-Smtp-Source: ABdhPJz/uHbFi8ul1RGAG7VkHoVWVW7JxKqwjEPR9JsPCybXGk7IQzRIcxP/EQFTHqJstGLNqbkxig==
X-Received: by 2002:a9d:6d87:: with SMTP id x7mr8440484otp.250.1617899823968;
        Thu, 08 Apr 2021 09:37:03 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id s131sm4977838oib.14.2021.04.08.09.37.03
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 09:37:03 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 55/64] packagegroup-meta-oe: use 4 spaces for identation
Date: Thu,  8 Apr 2021 09:36:02 -0700
Message-Id: <ee7458f08613163d04af0c47002ef117d1686abc.1617899100.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617899100.git.akuster808@gmail.com>
References: <cover.1617899100.git.akuster808@gmail.com>

From: Martin Jansa <Martin.Jansa@gmail.com>

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 5c83f2da63504fc3d6bfaec3e0d149a8926f56b7)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../packagegroups/packagegroup-meta-oe.bb     | 204 +++++++++---------
 1 file changed, 102 insertions(+), 102 deletions(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index d5e5aa01cd6..a6513352c04 100644
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
2.17.1

