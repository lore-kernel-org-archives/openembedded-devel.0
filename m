Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64C07C369C2
	for <webhook@archiver.kernel.org>; Sun, 20 Apr 2025 20:59:02 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web11.3772.1745182739189596942
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Apr 2025 13:58:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ddzVw+aO;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6ff37565232so27900167b3.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 20 Apr 2025 13:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745182738; x=1745787538; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CkQoNGPc9+uP7HsQjT8zVh7GeCBB3FonuxBbtatXBAk=;
        b=ddzVw+aOrcggc4dGusCO3etVw8CFNdHHkQSyE8fkSJIHlDBP2GdT4gWOGVbyIzZrTd
         wbSOQtlieVz9ow1l6AC9JwacVIk4sFwA1aNPR5ivc3B2k5eJpmESdtjiXLSjKBcL+UVw
         M1o6uIXJv2WCRIos5YhBjob8i+OXYUJb0DPaYMZDFBUPpT89MjF+qJ9auREGofsuos0v
         G0piaOx9Qw9Ilb/TXdTUW+7UMApA5xWGWRRFmD6EOkxYBQLFl9h+vaEKLrtF5QMavfNx
         2aLICvGVB5SgLkMcjMSSsAwGY3nmBoVmAwDdgRQpWBi72kcvcaVUt6VPj5Umhmc7TDw4
         7yeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745182738; x=1745787538;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CkQoNGPc9+uP7HsQjT8zVh7GeCBB3FonuxBbtatXBAk=;
        b=Z48FDrBM+513TfoETJww/se244QQzW/PSb/C0noBkVfyQEpxERg4ytMG/qwJvTLFdj
         Xcx4+Doa9a0LctYTXLHjYwH198vq/jO+51T8gtJJRqosjhCo20/Xz0I1igo0GsS9/nsg
         0OGb1Sx7c2djpA1CwnKoMHpCLqWaJNMutaJDoqAj+5JfeKGJYuQndkWxKv/I4h33cyOg
         vh7oLOSBxDtfyryFEoa7VEdG694IJEl7zyx32+q0IQ0LEeMjCcaTo6Hdg0fRJfv+Xt00
         JzTJISRUNsq08OHbqPOEgQ5ZuCklB41VkavL8/LVO4SJBJFvPTiCcmd77OhJqHSY5xgp
         XolQ==
X-Gm-Message-State: AOJu0YzAjXwo6Ddbk8DtV8TuVD0PacnNHvWPJNhPduAq9bk8hSUhv0gd
	5F5NvDSMLIhC3VSgpa5dcqcwciPwYTi6N6DHWYO3wAfWwsguyWFS1cNk1BDL
X-Gm-Gg: ASbGnctxS0xLi+ruXSAxsVO+nPWZY5UOVELPVPdvpk7ID7NAHcXWJWDQABX4KQnvG+K
	nD9xGdlrGLRcpzW7F6LNqtNm6sjgUznYQtzN7gM7foT/KZOle0bgKm10SNr2tk2xpdrBtGBa02W
	YStABcb/QKWIp8RkQXgX588zXVqysELngzzQHmwfZtPkQHTlPJWxXi84orkrpp039G+b110gt47
	6PZMa6L20Rgdjm/aJefb6REF+50h+e30nLmQHUttz4z7CiSbM9YPcecoHopkteMEARW0z+8Ft2R
	19dqf4jbDr6cIuYkI6QoA8OJNjhsLr88R2NgEeIX58k+3w==
X-Google-Smtp-Source: AGHT+IGAAYmwddiLNaYJAJi5nKyrwpc8640GeT3Rbh1TCVbvjkP3U04y0jmBaTTI0qAe5LSQmHjryw==
X-Received: by 2002:a05:690c:6b83:b0:6f9:97f7:a5c4 with SMTP id 00721157ae682-706ccde345cmr132519957b3.29.1745182737843;
        Sun, 20 Apr 2025 13:58:57 -0700 (PDT)
Received: from localhost.localdomain ([71.215.9.36])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-706ca556025sm15954567b3.94.2025.04.20.13.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Apr 2025 13:58:57 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH] c-ares: update 1.34.4 -> 1.34.5
Date: Sun, 20 Apr 2025 16:58:41 -0400
Message-ID: <20250420205841.21305-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 20 Apr 2025 20:59:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116990

Changelog: https://github.com/c-ares/c-ares/releases/tag/v1.34.5

Security:

    CVE-2025-31498. A use-after-free bug has been uncovered in read_answers() that was introduced in v1.32.3. Please see GHSA-6hxc-62jh-p29v

Changes:

    Restore Windows XP support. PR #958

Bugfixes:

    A missing mutex initialization would make busy polling for configuration changes (platforms other than Windows, Linux, MacOS) eat too much CPU PR #974
    Pkgconfig may be generated wrong for static builds in relation to -pthread PR #965
    Localhost resolution can fail if only one address family is in /etc/hosts PR #947

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../c-ares/{c-ares_1.34.4.bb => c-ares_1.34.5.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/c-ares/{c-ares_1.34.4.bb => c-ares_1.34.5.bb} (91%)

diff --git a/meta-oe/recipes-support/c-ares/c-ares_1.34.4.bb b/meta-oe/recipes-support/c-ares/c-ares_1.34.5.bb
similarity index 91%
rename from meta-oe/recipes-support/c-ares/c-ares_1.34.4.bb
rename to meta-oe/recipes-support/c-ares/c-ares_1.34.5.bb
index 1fee769f25..b6945f221d 100644
--- a/meta-oe/recipes-support/c-ares/c-ares_1.34.4.bb
+++ b/meta-oe/recipes-support/c-ares/c-ares_1.34.5.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=d3e72a10e08191f2ca1be3f3228d78f3"
 
 SRC_URI = "https://github.com/c-ares/c-ares/releases/download/v${PV}/${BPN}-${PV}.tar.gz \
            file://run-ptest"
-SRC_URI[sha256sum] = "fa38dbed659ee4cc5a32df5e27deda575fa6852c79a72ba1af85de35a6ae222f"
+SRC_URI[sha256sum] = "7d935790e9af081c25c495fd13c2cfcda4792983418e96358ef6e7320ee06346"
 
 PACKAGECONFIG ?= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
 PACKAGECONFIG[manpages] = ""
-- 
2.43.0


