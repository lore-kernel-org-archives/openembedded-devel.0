Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
 by mx.groups.io with SMTP id smtpd.web10.56936.1597709899326884624
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Aug 2020 17:18:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VB/PR1fz;
 spf=pass (domain: gmail.com, ip: 209.85.216.67, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f67.google.com with SMTP id mw10so8432220pjb.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Aug 2020 17:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lDKLK5mVt6iE2WZRktkaEIjy8X05UXulz2G3OjGhN7g=;
        b=VB/PR1fzFFh0zFG6CugMzguyFc7MV8FdkpIvz2cNL9/YSUfQqCxJfgnN7d9mosFv3+
         ZWhbUAkMWs2afv3kLenWebhKXJSBSM1TVXhkAd0ErFTrEs+QM+UNP3pTlA6xb8w9sK0y
         p2bQqnPhEAz+kLXNZ0pJj/mtu3invAb+r4QuwEMRn7+2VafvqJJvYn6uvwvZBpz/M2+P
         317RSg3+vRf5JkXdCc+MJ9Qvlj6nr9vLM+YS4/tpxWdK2bF9+k/3pB0EAiFzhN3BKK/t
         Jlp6cjgdJ39c9xmgaLLvAD/Of8mDKzWgIcUqK2T50M5xihFeO6UIKodQ2afJ30kcL5Rb
         hlCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lDKLK5mVt6iE2WZRktkaEIjy8X05UXulz2G3OjGhN7g=;
        b=cejup5tZ8GLm7Jxac7f3btlV1ysxOV47zPs2OR0VY0cYUweaf7Kz5x0Kl2yNt9O+w/
         t1w9eHLkkz2ta+kOXdlkv5DYXpI9AsOXesoOBLinfLusOMehJp3eJYmB1F2lXkbe+eMD
         BU7H52b9RlgT15XXLYZKy11zokwHO9xN6GZMzS0x4Be7BfqojPrfM/lCYSOgQ30zUPtv
         Qj/wZ3Kf1c6tKi/ZzuKddhYj0hxBYdaTcibGTWe+WfK5x+Be/0xAnY3rXd2/P5hFit3W
         u+14VFstysu/XqtFTtncTTtTHMO+fn/cIb7EFQk8b7cRIzyuHwsOw377txKRjETreihw
         i/HQ==
X-Gm-Message-State: AOAM530ATDoGF/7INRRjZneC+1BDlBUk4Qnlvniq+na1Ba7ZT8fNqtIg
	+JBtenUGtYOyaPsmb5SnKoC6jK9xdz21KQ==
X-Google-Smtp-Source: ABdhPJyPv9RtjnkfmM8fGtEEeu/TAqfUZ5nJTUNv3pnDK+ZJOKc2+Uf1xsjy6USd+ms8CsRxugs/Aw==
X-Received: by 2002:a17:90a:e64b:: with SMTP id ep11mr14713518pjb.86.1597709898544;
        Mon, 17 Aug 2020 17:18:18 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net (c-73-63-224-124.hsd1.ca.comcast.net. [73.63.224.124])
        by smtp.gmail.com with ESMTPSA id a5sm21058393pfi.79.2020.08.17.17.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2020 17:18:17 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] libyui-ncurses: Disable werror with clang
Date: Mon, 17 Aug 2020 17:18:14 -0700
Message-Id: <20200818001814.3839147-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

clang11 find inconsistencies with overloading of functions and emits
additional warning, lets not treat the warnings as errors on clang
untill this is fixed

Add RELWITHDEBINFO so debug info is generated as well

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/libyui/libyui-ncurses_2.55.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-graphics/libyui/libyui-ncurses_2.55.0.bb b/meta-oe/recipes-graphics/libyui/libyui-ncurses_2.55.0.bb
index d23ec3faef..ba94a838a9 100644
--- a/meta-oe/recipes-graphics/libyui/libyui-ncurses_2.55.0.bb
+++ b/meta-oe/recipes-graphics/libyui/libyui-ncurses_2.55.0.bb
@@ -20,6 +20,9 @@ DEPENDS += "boost libyui ncurses"
 
 BBCLASSEXTEND = "nativesdk"
 
+EXTRA_OECMAKE += "-DCMAKE_BUILD_TYPE=RELWITHDEBINFO"
+EXTRA_OECMAKE_append_toolchain-clang = "-DENABLE_WERROR=OFF"
+
 do_configure_prepend () {
     cd ${S}
     git checkout bootstrap.sh
-- 
2.28.0

