Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web08.6559.1616721776238235789
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Mar 2021 18:22:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ARqHYXGz;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id a22-20020a17090aa516b02900c1215e9b33so3456105pjq.5
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 Mar 2021 18:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tGS9f63b7ljfKIyb8fbDEn/0bwyMiaaP6USFKYZdzi0=;
        b=ARqHYXGzm9F+gHHyhfaTc1RtQ07zoxQ+oLeymAMkrrJmSbAzymthhXblFHRBjNVJC7
         W8AGuKAgPlGPlLu3uGRjddMCE7eYGtJN8xOeyLBgyJXwhimQMSr1233MgDLYSSw3uvVC
         s0VUf9O626Nj1UsqyrANYJYpjk5dYXZ7s0ntctuh5AD/V216yOdcbAtyS+ePJnDLQxRV
         7gvZF+aEICBxv3WHGRYtm0TDcdGjkAJeQA6K2UyWtv6ySLUwFV6oto+HYiu0gdRttzE8
         uObP/ihGwyxQQGN50rRfzonigZNZD/4B3Md+KFCgx+HqvMXt9RV6ru94n3kuQ9g3zIPH
         +6Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tGS9f63b7ljfKIyb8fbDEn/0bwyMiaaP6USFKYZdzi0=;
        b=UDDxGp/NgqkydrJEQzzMrXZW83PS7eUwjN1cZyYV3trQbROzA6wv4JRhPaIn7PJdPR
         Fff1wX5DA9V+1QmuTod2UIPKb39hD5R316l+rAYd8onnKPERyyS6G7rH5OUb8HTt22TF
         0G6BMmFzjGz0SV9T9KEQ89zd+hNloROculSGJn1/vMEhElaLiy8Vr9BCo+ofMge935PJ
         sHh1TboHAnso+Q5FXfZkNPiDIG4M8A8MTM+vsw7M2iShJV25AZHgn8qzPgg5y4Crxpo1
         crTfeCVC57Tu8+QWi03cCIiZg/gZax6jLW3VZz4VinhizG6u2l8bMqnuUyhmiijDOtiZ
         4gNQ==
X-Gm-Message-State: AOAM533CFkXZUtLjUizRtarZ7VC9sECTIYwfy5X2J8MUwd8nfs1WawO9
	vbZAgLUSdXOBSET63hzWoPc3d/toY+Dz2w==
X-Google-Smtp-Source: ABdhPJxpyqCoSsvBbbW0YxHpBKB5RPkc9B7D3aZfzGGGG60m11VibcKWf2UmrLHnN4SJ0A9fVofC0w==
X-Received: by 2002:a17:90b:a0d:: with SMTP id gg13mr10965492pjb.29.1616721775640;
        Thu, 25 Mar 2021 18:22:55 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::aebb])
        by smtp.gmail.com with ESMTPSA id q10sm6472873pgs.44.2021.03.25.18.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 18:22:55 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/4] mpv: Exclude from world if commercial is not in inclusion list
Date: Thu, 25 Mar 2021 18:22:50 -0700
Message-Id: <20210326012251.1063470-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210326012251.1063470-1-raj.khem@gmail.com>
References: <20210326012251.1063470-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-multimedia/mplayer/mpv_0.32.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-multimedia/mplayer/mpv_0.32.0.bb b/meta-oe/recipes-multimedia/mplayer/mpv_0.32.0.bb
index 6a3fd97157..171eef7b73 100644
--- a/meta-oe/recipes-multimedia/mplayer/mpv_0.32.0.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mpv_0.32.0.bb
@@ -111,3 +111,4 @@ FILES_${PN} += " \
     ${datadir}/zsh \
     ${datadir}/bash-completion \
     "
+EXCLUDE_FROM_WORLD = "${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "0", "1", d)}"
-- 
2.31.0

