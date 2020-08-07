Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web12.2138.1596788814508355636
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Aug 2020 01:26:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Bk0LizsT;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id y6so728940plt.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 07 Aug 2020 01:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=krYIrkhHhg/4lHH1eKiHb8+0b5jwkaH36kr3c49a0Dc=;
        b=Bk0LizsTiHToURF+1lkpVQJ0T6CdMqkBkT2lVMQoiM7huLad+58gNPkQRNQSvMvqp9
         zVpj6lCuDD5ttvD7uQV525f5Y6/g1VfhFt0bu1to2HnkZ4lUXs4M9X/kNK5U4TCHFztd
         5CvEvXqrFysLOzMY1+ufX2/1uwhnfMd6QGVmgHe6MYd/UTy0/ADpauCN7dBXLdjd8qXa
         3COSkaVpRB8B9o3mxE5hX6Xlr9Fbh2ELW0AJzGmlE/daeOVtqhl6qOEz6zYe5FzxVoGU
         mLrWbSA4TKHUCzBHwQEN3/RYXIOmdcyY3ohclcyqqb/4nqzcoAWoWI6jfCAlpo7n+3QK
         xRWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=krYIrkhHhg/4lHH1eKiHb8+0b5jwkaH36kr3c49a0Dc=;
        b=nw4JrgpUrBqvXHkZiw5yk5eWpQhj28eU0vuDDZg/FTd5tdDypEk547cFYnmr/Aeibi
         GvOaqMaPM+76XCezLbhd1+26DvgeKQSBKAhDj2e1fqXGjjqcG6882yuYf03XJdq/qaQY
         IbMFlpCmnjHagMWN0QefCHUCNo2tO7clhX2lRKnGafnIRghBru+tLb5Y0SjSxqxbPtSs
         XDG6wYc93bohjY1w9kL5u/W9LtVqCX6s8fosggw2+Or4+AbV8sN6KujfH7eyDQzBo+px
         krCYWeu8GD+D5htNllCVwNSBbFdgf5bbHd3U7xjB5XUZsFGMZjrjwHH4b8gM00uy6nmo
         NdyQ==
X-Gm-Message-State: AOAM5332tNqgRvlPd1BFT0VUAZU7ju8UhHAgIrn+AJ3h5/0bvehaEyEc
	xhlr0u8fbpJEsg88W2mzPajlvVyv5Io=
X-Google-Smtp-Source: ABdhPJyF9EG6ofu/PonxHIXPKxi+QvLC69qgZ6rlUCFkoGY1MD3NxGkjl8hs8rjTcFzc8qrSR3K0lg==
X-Received: by 2002:a17:902:7612:: with SMTP id k18mr11024771pll.187.1596788813618;
        Fri, 07 Aug 2020 01:26:53 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e60c])
        by smtp.gmail.com with ESMTPSA id h5sm11494569pfq.146.2020.08.07.01.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2020 01:26:53 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH] gnome-settings-daemon: Add introspection to UNKNOWN_CONFIGURE_WHITELIST
Date: Fri,  7 Aug 2020 01:26:51 -0700
Message-Id: <20200807082651.3326045-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gobject-introspection is needed unconditionally therefore add "introspection"
to unknown configure option whitelist

Fixes
ERROR: QA Issue: gnome-settings-daemon: configure was passed unrecognised options: introspection [unknown-configure-option]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gnome-settings-daemon/gnome-settings-daemon_3.36.1.bb       | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_3.36.1.bb b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_3.36.1.bb
index 730ea9ed05..b38ba558c5 100644
--- a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_3.36.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_3.36.1.bb
@@ -30,6 +30,8 @@ REQUIRED_DISTRO_FEATURES = "x11 polkit pulseaudio systemd gobject-introspection-
 SRC_URI[archive.md5sum] = "102dc488a6a726e4050cf5ab7e967e8d"
 SRC_URI[archive.sha256sum] = "3e33dbd319b562a5ab602dcab6de3ca81b85f8346672e90ec632b36bbf15ee4b"
 
+UNKNOWN_CONFIGURE_WHITELIST = "introspection"
+
 # allow cross build mixed with build of native tools
 do_write_config_append() {
     cat >${WORKDIR}/meson.native <<EOF
-- 
2.28.0

