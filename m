Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
 by mx.groups.io with SMTP id smtpd.web10.4618.1592566341099886242
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Jun 2020 04:32:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=T0SAcckP;
 spf=pass (domain: gmail.com, ip: 209.85.218.68, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f68.google.com with SMTP id l27so9863365ejc.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 19 Jun 2020 04:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=fF4Bf3ELuAatYSfg5PEHn753Df+lCcQ1jTHeR4I8G7c=;
        b=T0SAcckPeMH3gC6CkKyhAIiHJgOcWGjH4NyvmsUTNYEPWprQ9Tgn+koZ3UYg1Az4jZ
         Pd8hmxwOaEulC4ZphPuvoHtx4kU179BPZhaqnW4qW0dCwCmt722W1xFLhN9y9dLUm0hG
         zehdtbhBzFUYWw5vbPTj3pC8xbK7QqDUCHnvZDImdS0iDaecnqFlJmylXEnI2VtDDFRQ
         V7WKXDX3QqBMgvVmLzS/9aCZH7gPehLlZ9ed057h8bVbdkp9b6sFBoMXseID39VfrcN6
         wCVLxGt3tsoYCnfmVnEBGHm28y5nzhFO+8kAoOEZRx1GezAn5Ko8tExS/Kmy0kud+l3u
         dm8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fF4Bf3ELuAatYSfg5PEHn753Df+lCcQ1jTHeR4I8G7c=;
        b=K+5D0dqsuNXrKQ/JOLNMAMqeDeFDiNJrnrFYZxsEN9ajixrQmN6rR0SgEdE//oppay
         aSg0vGAcl/StW15+YBQMGDZ2Mvt8XzytyE/c/hFXzPt7a8B1Jvdxqz8LZ44bKTWDRGma
         tTIjVJdgp6Czm/95HVZKIjgJFUq7x+lGRNU/W2cYRwpJiNpPnIRKm9o5tusZ1Bbokkl+
         IZaIiF8CYFr2mXWHgbrVHRw5qCzfmj21WtYteMmpi9B89PiHH9ssNyEHelFFCIjVhWL5
         K9a8BN8EOctUgzPaLMhDpOAQGi/IC/hAcijWuycRHiAZgJbkGfG6cJgPjYLE/xbduzVD
         QXlg==
X-Gm-Message-State: AOAM530YtUjA16bPIyZkBVVd9J5zJ7+7IZokmHF1lGpTLWWbaNUOa0o+
	e5JyNfL0DAqYm6djVlCTWWKhtxKoyWw=
X-Google-Smtp-Source: ABdhPJzNpAMJYaVpOmBWXAfsBlAwOkPXSjEFLpmH/hJnRzjiZzykXwFMJ2tIaMq9glT5CFHBjIHVDA==
X-Received: by 2002:a17:906:e2d5:: with SMTP id gr21mr3041677ejb.219.1592566338922;
        Fri, 19 Jun 2020 04:32:18 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f07a002d299e9f71202562c.dip0.t-ipconnect.de. [2003:f0:7f07:a002:d299:e9f7:1202:562c])
        by smtp.gmail.com with ESMTPSA id o12sm4472346edq.7.2020.06.19.04.32.17
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2020 04:32:18 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 10/10] libgit2: upgrade 1.0.0 -> 1.0.1 / rename recipe
Date: Fri, 19 Jun 2020 13:32:01 +0200
Message-Id: <20200619113201.2811033-10-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200619113201.2811033-1-schnitzeltony@gmail.com>
References: <20200619113201.2811033-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../libgit2/{libgit2_1.0.0.bb => libgit2_git.bb}               | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-oe/recipes-support/libgit2/{libgit2_1.0.0.bb => libgit2_git.bb} (89%)

diff --git a/meta-oe/recipes-support/libgit2/libgit2_1.0.0.bb b/meta-oe/recipes-support/libgit2/libgit2_git.bb
similarity index 89%
rename from meta-oe/recipes-support/libgit2/libgit2_1.0.0.bb
rename to meta-oe/recipes-support/libgit2/libgit2_git.bb
index 74343683f..5f6a38a89 100644
--- a/meta-oe/recipes-support/libgit2/libgit2_1.0.0.bb
+++ b/meta-oe/recipes-support/libgit2/libgit2_git.bb
@@ -6,7 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5b002a195fb7ea2d8d583f07eaff3a8e"
 DEPENDS = "curl openssl zlib libssh2 libgcrypt libpcre2"
 
 SRC_URI = "git://github.com/libgit2/libgit2.git;branch=maint/v1.0"
-SRCREV = "7d3c7057f0e774aecd6fc4ef8333e69e5c4873e0"
+SRCREV = "0ced29612dacb67eefe0c562a5c1d3aab21cce96"
+PV = "1.0.1"
 
 S = "${WORKDIR}/git"
 
-- 
2.26.2

