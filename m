Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
 by mx.groups.io with SMTP id smtpd.web11.9830.1600425300411190474
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Sep 2020 03:35:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HKB6BosC;
 spf=pass (domain: gmail.com, ip: 209.85.218.68, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f68.google.com with SMTP id z22so7411659ejl.7
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Sep 2020 03:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Gu/w8JdWaUtdGH3hFZn8f78eH/k++Tpe5iv7RU4vCBc=;
        b=HKB6BosCZlzE+v1pmeGDopiu+JtGDm3x5mgLsXVh7e/XZONd6qimARdrT+mrjC2FuE
         MZSsj22rqYwBPA5CkLFrpjXrzX9CFMWLOLr0k5a6anaAArq8QrI6NYXbU/RvsB2Y0WmS
         2MO4UJ72cwcswGCrDYt/fa8YtJseaI74xn9RcHaxPMIZP1RM+fj208BxvNNZKUG9tYQf
         XIXSlIDYzpJPFAljN7AiIqAAjpdei12/RQkZtk1IvDgXjP8y+ZBZ/HAeXTaMK0onpxwo
         2KxeEnVbg+aRLmb104jxUuRdv4TBsD57mTd8ZEzpBxTmUYO1ybD/IGjQjSvTqXofUED9
         1y+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Gu/w8JdWaUtdGH3hFZn8f78eH/k++Tpe5iv7RU4vCBc=;
        b=H89Qy05ttOH2+kIZeQOi8KM19jt5Ac5GtrAIXU9K2I6loDIdUaXHPDThfO3JLA31SA
         dOKqRDVQz8M6AaW+bc8GLmx5Z62fcglq2H7zNC6hNMyyCU34ep5Uw08O4WHLft8zFOqO
         HS8H7GXAvXCAXblMVVTT0V8D6dAHvayOHVybsWuG7rjPCizOXMBZHFoeB5WwccSymYKu
         yaazNqgR7jpMJEVyoPuNgWRgXtJkPskXkCH9dBnRxMp10cVPQdigVWxuFzykbagz0Rgh
         lz1iJ9I4lUGuz9hhnNTJHwB/4JazQYzrh1PQf7guglwLc64CUMSeg8I6srTS52XOKK/J
         XsSQ==
X-Gm-Message-State: AOAM531iy7z7+xDzqkGoHtyT9WY4EqspcboiXH741rE0HTUloWt4rFFW
	XH+Rk5rwPhD1qKKHuemAy2JlqYe2f2k=
X-Google-Smtp-Source: ABdhPJx4dtHgn0Jw3Hhu6AsKb95HkBN8sHNjH6SmVMj/nfddN5OMNuhJssWFexElTz0ugbxh59eUTA==
X-Received: by 2002:a17:906:364b:: with SMTP id r11mr34497870ejb.48.1600425298657;
        Fri, 18 Sep 2020 03:34:58 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id i3sm1971429edn.55.2020.09.18.03.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2020 03:34:58 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][dunfell][PATCH 1/3] iwd: upgrade 1.6 -> 1.7
Date: Fri, 18 Sep 2020 12:34:53 +0200
Message-Id: <20200918103455.370682-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pierre-Jean Texier <pjtexier@koncepto.io>

This includes the following changes:

ver 1.7:
	Fix issue with APs that send IGTK falsely in big endian.
	Fix issue with setting linkmode & operstate for open networks.

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-connectivity/iwd/{iwd_1.6.bb => iwd_1.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/iwd/{iwd_1.6.bb => iwd_1.7.bb} (96%)

diff --git a/meta-oe/recipes-connectivity/iwd/iwd_1.6.bb b/meta-oe/recipes-connectivity/iwd/iwd_1.7.bb
similarity index 96%
rename from meta-oe/recipes-connectivity/iwd/iwd_1.6.bb
rename to meta-oe/recipes-connectivity/iwd/iwd_1.7.bb
index 10ac03ef06..4911b3d803 100644
--- a/meta-oe/recipes-connectivity/iwd/iwd_1.6.bb
+++ b/meta-oe/recipes-connectivity/iwd/iwd_1.7.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fb504b67c50331fc78734fed90fb0e09"
 DEPENDS = "ell"
 
 SRC_URI = "git://git.kernel.org/pub/scm/network/wireless/iwd.git"
-SRCREV = "ad97f4f945b828425ff288e905523e11b330d41d"
+SRCREV = "ef6084dcb4fe2e00327bb9c7b113ece204042c22"
 S = "${WORKDIR}/git"
 
 inherit autotools manpages pkgconfig python3native systemd
-- 
2.25.1

