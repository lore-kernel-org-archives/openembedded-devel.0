Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68AC4C83F1B
	for <webhook@archiver.kernel.org>; Sat, 12 Jul 2025 01:38:32 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.28397.1752284310250428892
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Jul 2025 18:38:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eBHGysrA;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-748d982e97cso2439412b3a.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 11 Jul 2025 18:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752284309; x=1752889109; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E7RUuo6yy8VH8WqvEqZwDCypbdRNllV55XEp7b4wjQk=;
        b=eBHGysrAA9vjKWZ/SAi2ZmNYP6TKMYfufJX2EQlS9qGLwJpU66z/zZauaAfNbT2fJd
         al07Q/5TH9yCxHbqaDZOERM0ql3sqOTniJIJYtLM228Cs87c4ulKLCcz/IBsPINv2t7s
         dhIEwGN4rq1OW2SvXr0z5ELX195yypcMeV7cbp9xCrAA/7ESB4Xa0nIXmaR3BS5gD3Oa
         1QD3VKr365DWwUbRP2k16mkHTWXW6IUU79t/T8QvjPKSzOFYee2GVg8AX6dncm7WZOrB
         Er/EXOna09ztASvCcxg2q5p6qqVPpnzef2PSfHq45Z6TzEDfb/WBD5kNp7pLxERJ0Kg+
         FAJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752284309; x=1752889109;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E7RUuo6yy8VH8WqvEqZwDCypbdRNllV55XEp7b4wjQk=;
        b=hseRtXmT0KPASauHegO4vBLcAv+beVjjrfiy5CXX6JTNHh3I9YWI6pxkLksuwQuk8I
         o2sfSgP7ytz9L/43ZAJkuerYvXr8K1muJillmnBy1qPw1Sv7V4siU2r/C7ccR1iA3MPv
         CAueykHfrR9WxPQ7SSlccqqHjLhc819Qddt7fninYhqGpdBnL6AnyOg7WuLunh3LEeXQ
         EqcMrHDhtqKyYbKhiV6k2k+3cC7NhepfHrihw2R9XsPAOxoKKDUsZm6L+TUaMkWNaxiA
         pYyOJuK/V1Bv+FJqrcpPo4h73EP/P7rOI5qipqge8q/lA6238oD9sAS5/8BrqV+jFCJI
         4xhg==
X-Gm-Message-State: AOJu0YzhLpm/eleeQdZrBE2CRxPuAG5ephQHclOrYUziw8KzWP38xlGL
	uKu0jPjY/Bxs7fOW+3fig5chWBU/aK+YpDyZQgZYf1RZA6G23OGHQrfWHaI5gYSN
X-Gm-Gg: ASbGnctDYmrjY0sXN0QMa0woAyzDvmxxeDP50eBlIxuQsg8GQoDx71XaA18IP6pxkrR
	FR1DXhhH6/jaCtyRtdB0Bw2fGOoIUzeDs2I7o8lZSzaTXce8/grj21KhtdYsm0V9YBT2zAWXK7u
	hfau80CO8CIRLe6c6sh7xwIk9TOOjYrzPWvayY8/HN7D4rwkWSakNIE1OsuEUCy1TMrheTUdl9W
	M3UwEQrAlxN2ULIw9HK+K+1S5agDZsoM2yr/aHQdHGWSjgMudrarngY6qrD09MFbksRktQftl4/
	MkaGyOGpog36QbYubjI3wS45B8qK4Rj2fTXdkJErQPwFHm4ypc1yeTc3QeVctkL1bZHpE8aY20A
	6wyb/SzGzdG/FlLmI6PBeFx/Y
X-Google-Smtp-Source: AGHT+IFgeIk6pZa+GLeWdQg4apDPJiVkAo3RRrjxFhimtduvl9+QgSeX304T7Qk+eXgz1qzw2O+j6w==
X-Received: by 2002:a05:6a00:c95:b0:749:472:d3a7 with SMTP id d2e1a72fcca58-74ee2d6067dmr6758625b3a.18.1752284308844;
        Fri, 11 Jul 2025 18:38:28 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::1c1d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9f1a851sm5972348b3a.82.2025.07.11.18.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 18:38:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-xfce][PATCH 1/2] classes/xfce-panel-plugin: Make download tarball extention type configurable
Date: Fri, 11 Jul 2025 18:38:25 -0700
Message-ID: <20250712013826.3708694-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 12 Jul 2025 01:38:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118464

Default is still tar.bz2, but there is now option to use tar.xz which is
some of new plugin releases are only xz compressed tarballs.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-xfce/classes/xfce-panel-plugin.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-xfce/classes/xfce-panel-plugin.bbclass b/meta-xfce/classes/xfce-panel-plugin.bbclass
index b43f9e3125..3f115cab22 100644
--- a/meta-xfce/classes/xfce-panel-plugin.bbclass
+++ b/meta-xfce/classes/xfce-panel-plugin.bbclass
@@ -4,7 +4,9 @@ REQUIRED_DISTRO_FEATURES = "x11"
 
 DEPENDS += "libxfce4ui libxfce4util xfce4-panel"
 
-SRC_URI = "http://archive.xfce.org/src/panel-plugins/${BPN}/${@xfce_verdir("${PV}")}/${BPN}-${PV}.tar.bz2"
+XFCE_COMPRESS_TYPE ?= "bz2"
+
+SRC_URI = "http://archive.xfce.org/src/panel-plugins/${BPN}/${@xfce_verdir("${PV}")}/${BPN}-${PV}.tar.${XFCE_COMPRESS_TYPE}"
 
 FILES:${PN} += "${datadir}/xfce4/panel-plugins/"
 FILES:${PN} += "${datadir}/xfce4/panel/plugins/"

