Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
 by mx.groups.io with SMTP id smtpd.web10.7883.1589646394692740996
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 16 May 2020 09:26:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=J4K/P76y;
 spf=pass (domain: gmail.com, ip: 209.85.216.65, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f65.google.com with SMTP id hi11so2399453pjb.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 16 May 2020 09:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=245ztA5/bn6sryewt9ICfoH/anLrUh/vzRa9PyOFXdA=;
        b=J4K/P76yebGT0MXD9C8awJBxi4PXn/IwGChhj//7gXxUGl7Z2w1+r1LyGnZg1PF7Ie
         lQK+65YKOgIk8nfxJhNxzyL9S//CFFlqpKzrMfR9H79MnjfnNSwae4LSqhNxcxg3iZjt
         Pqde29YF7JbquyxESWQLpT6vPgjVCvS2YRc+w4k58jVru3xdvHonxFmHyiS1NgPsWvYx
         mv9J2HstCdYeOQt37P18w9GvkVMwvVer2it5ihpaEc10HM3RPxR1rweZR5SAPUGZA7IS
         L5vI3XqLOKePYPPegQcvIbYTsW+u/GnQghgvQOyTHKpkUGC8m5FtNU9FhIyBLaLIfKL6
         NmsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=245ztA5/bn6sryewt9ICfoH/anLrUh/vzRa9PyOFXdA=;
        b=QJ3147aRi+GdchrPlIfx4I0HgQXLt9QXWkXe7MyCkRbS1bM+QZ2lq0EqtscLWr5DeG
         3w2iIIUxoeQN7nsA83XL+tb4oCnLgkkmnNbBLgPyVUzuagtv3IfrpZs+TPwunDCMVgI1
         NVwx0cTRcuGT8Odf7v9AJV9BYBfjqs5lAjH40rKq+HxbzBlScp4iASi9s5F6ko1HtE2N
         xP7QlBtVOGohXb9KEySQqQVOrbvnDInwjM5WbjaQKo9RZdmxxRWLhXJathy0jj9yL0dM
         h/FJakN7N3+Lm/d+ss8MJXuuYZkNGsGgzbMu5APl1iIM8/3u5bPRw1YK245rZL0bUdG8
         Jdvg==
X-Gm-Message-State: AOAM532U8BlhgUyYEm7HdjBreyNV0pZcBFWBK78bqK0H0Qk22P1RAk8Q
	i/rc0Ps89pjagIg9iUqFolH8Ivmr4Z4=
X-Google-Smtp-Source: ABdhPJwddAH0zsWWcuJDxas8EMkYY5VqnJc7LzjAGtohe7zHzuFSPSsxI3jxMyTf4BYi1IXINlI03w==
X-Received: by 2002:a17:90a:1aa2:: with SMTP id p31mr9555018pjp.233.1589646393718;
        Sat, 16 May 2020 09:26:33 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e62a])
        by smtp.gmail.com with ESMTPSA id t20sm4206084pjo.13.2020.05.16.09.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2020 09:26:33 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 1/3] netplan: Depend on systemd if its in distro
Date: Sat, 16 May 2020 09:26:29 -0700
Message-Id: <20200516162631.1862339-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

it needs to link with libsystemd when using systemd as init system
Fixes
Package libsystemd was not found in the pkg-config search path.
Perhaps you should add the directory containing `libsystemd.pc'
to the PKG_CONFIG_PATH environment variable

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-connectivity/netplan/netplan_0.98.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/netplan/netplan_0.98.bb b/meta-networking/recipes-connectivity/netplan/netplan_0.98.bb
index db029a4b8a..15c4968132 100644
--- a/meta-networking/recipes-connectivity/netplan/netplan_0.98.bb
+++ b/meta-networking/recipes-connectivity/netplan/netplan_0.98.bb
@@ -18,7 +18,8 @@ SRC_URI = " \
         git://github.com/CanonicalLtd/netplan.git \
 "
 
-DEPENDS = "glib-2.0 libyaml"
+DEPENDS = "glib-2.0 libyaml ${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','',d)}"
+
 RDEPENDS_${PN} = "python3 python3-core python3-pyyaml python3-netifaces python3-nose python3-coverage python3-pycodestyle python3-pyflakes util-linux-libuuid"
 
 inherit pkgconfig systemd
-- 
2.26.2

