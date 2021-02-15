Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.25701.1613351622335103615
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Feb 2021 17:13:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZfK3UMFB;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id cv23so2771069pjb.5
        for <openembedded-devel@lists.openembedded.org>; Sun, 14 Feb 2021 17:13:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=8NiMvIhmezMaBZTBW6AZL8GvGFeVgNXPq9vnDXCUtQM=;
        b=ZfK3UMFBT1Uze39q5WonhjxM2E/E/lfD68qeG7CTBbdgB8qdluxUS2AXjPm7wA71UH
         poO8RvTd2SENCWXMgtX6SPzNaCQwJSb82PUvJ3kFfFyTW2SKMYSbd9WVVi7dyZjxKN+s
         hvSDaFTMhZqTs0FZfCUfBx46/5r4gFurDMX9MbYWIBRiprGkyau+sScIum20tjwRIe9k
         A09GiQ67Vg1b09CA4uWVXFvRarggzDQ68lcBhsls8QFXySSxbDMc+vneSNM0zYjb8HIk
         X4Xgl6Zj0PU4AJZ64+oSctyOIJ8Qwlt+GgEsPQEo3kR4b0CtUydwI9m0O4J86nSouZFu
         cjCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=8NiMvIhmezMaBZTBW6AZL8GvGFeVgNXPq9vnDXCUtQM=;
        b=VayLtP7EtSAA3wsMXaFbxB/7BoLRXip/EPraPiCCRESIkKPnMCGqtS902TgQ53T7Q4
         ECUsZoSHcuLvugCbDF/gUjdQJPr2uxZ+d3oBRUK2O1mGgOUmW3+9OvNH549dF2gT3NMl
         NN2+TkuTEEZ15+o45OqY9+fizeOsQh0/syuLdzBk3UUWmBv2aZoC6Rz2vpyt/wU1bQOj
         Zk/M5SApbN2cgLyTxDDSJzjLUyai4Lt5l2MHAA21ixLxv47i7K8eS9rTfUTTrvcucAO+
         ZiZsbOHNnJUcfU0g39xGJczoqFr1sEZei3BbasyTAYa7HYOg3cQT/359+UGmTkh9O4br
         kvjA==
X-Gm-Message-State: AOAM531WTuhbZ77xJXtutihUqEb9qBZpqLbqoFZJxDy2+IvHjY9xbH5b
	oAgp/gzqBZlc+OYoQnFaH8gZmNFCgdI5Ew==
X-Google-Smtp-Source: ABdhPJwbc+dH0IlFbNjM6iforrcgOvqyqnDiOuliV2dcd9aIOmMhLhCBG3+m3rrNzVIPWTjBe2NjuQ==
X-Received: by 2002:a17:902:f689:b029:e3:21c9:c745 with SMTP id l9-20020a170902f689b02900e321c9c745mr12321775plg.39.1613351621818;
        Sun, 14 Feb 2021 17:13:41 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:c8b8:7fc5:a225:bb8d])
        by smtp.gmail.com with ESMTPSA id t1sm16077998pfl.194.2021.02.14.17.13.41
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Feb 2021 17:13:41 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [gatesgarth 09/15] minifi-cpp: set PSEUDO_CONSIDER_PATHS
Date: Sun, 14 Feb 2021 17:13:23 -0800
Message-Id: <6950684345120770aefda36e1064860d9b3710a4.1613349480.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1613349480.git.akuster808@gmail.com>
References: <cover.1613349480.git.akuster808@gmail.com>

From: "Qi.Chen@windriver.com" <Qi.Chen@windriver.com>

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 252fd475e928512dac92077564e0877ab7b4060f)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
index 2b884e3a1b..defbee8de1 100644
--- a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
+++ b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
@@ -75,6 +75,7 @@ TARGET_CFLAGS_append_riscv64 += "-fpic"
 TARGET_CXXFLAGS_append_riscv64 += "-fpic"
 
 do_install[cleandirs] += "${WORKDIR}/minifi-install"
+PSEUDO_CONSIDER_PATHS .= ",${WORKDIR}/minifi-install"
 
 do_install() {
     DESTDIR='${WORKDIR}/minifi-install' cmake_runcmake_build --target ${OECMAKE_TARGET_INSTALL}
-- 
2.17.1

