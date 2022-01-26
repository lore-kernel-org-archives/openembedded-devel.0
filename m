Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BE58C28CF5
	for <webhook@archiver.kernel.org>; Wed, 26 Jan 2022 05:03:00 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web08.8745.1643173370617256079
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jan 2022 21:02:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EyDdo1GG;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id
 s61-20020a17090a69c300b001b4d0427ea2so3683029pjj.4
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jan 2022 21:02:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=28OZCqLfb4oQ1wg3RYtCBBEGcfyPIztEhBvgIU801PA=;
        b=EyDdo1GGdJ91oEZiHw/z+deyU9zi3IInol2AQeUkLMKmQoKvw8JIZPBVUR2cYsHniH
         fXfbhmftijJ47loDH2kUoc+SkKytm7ScbiatThIrYYid2TivlglWTVSuQoeM3huniLE/
         QR8W5KqHk6fQlNvmQQ4+6uVc6cGpXUNkOSTTxLMn9fUkcdfTMFEFecvPa4ujziRBu5e4
         ioe095I5a10KFFKeCXuIpJXBKaMFQT13/qQU2H/XhkX+Ytqd6TP9yJZHP4aScPsRdndD
         tTXiEFQv14NnAZjpUHZU8zO+NO02LJbGla+k76hFwALzXGZAjT075hHCkRgI2mEIJt5s
         8S1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=28OZCqLfb4oQ1wg3RYtCBBEGcfyPIztEhBvgIU801PA=;
        b=7oOEWurwYzT42skWopW9BG0FB2iXNZpu2ITV64IImgkXEEAQDxtA4XWeJH2fymrTTG
         7A4Fz6n3F7C/evVY7viaALJtpvuIKhjCUxFTPbLzFPwn1U3pM4qLcHiCwwH0ilRpY507
         Iv8z7hxbvEm8D6geU5C5nHEPfBGgTMLKmP0bO1L4sFLDbRBTCYfhQj3kBVC7i3WyLiwO
         CaFkMYieM+NxpZANfVYnMpTVDfv42k2B93WIjioisHTwpbAHnx/RhP+6RZsdP6cSk12s
         QqNLztyROETdaCV7XBJfrbvqzJmQRcykmSHWW8lGXTDjL3V0QZHdjVbNJ42IUBDiyYn5
         +vOg==
X-Gm-Message-State: AOAM532KhJ9V7YFOZV19s3TWi5YGaBUcznr+qvqeug0O1c+K/2bGrnNJ
	Xm/Dcg9616HnRdBHtvKQGY53LpeTXL5qWA==
X-Google-Smtp-Source: 
 ABdhPJwCGV6iS70fUedf550YKn0q4jHEXDe00PaJIN4sP/fWuJh9zLpfZ0JIJeop76Xfw7v6NVYqrQ==
X-Received: by 2002:a17:90a:2d86:: with SMTP id
 p6mr7069865pjd.222.1643173369852;
        Tue, 25 Jan 2022 21:02:49 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b5e3])
        by smtp.gmail.com with ESMTPSA id
 x17sm597305pfu.135.2022.01.25.21.02.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jan 2022 21:02:49 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] dlt-daemon: Bump to latest revision on master
Date: Tue, 25 Jan 2022 21:02:46 -0800
Message-Id: <20220126050246.2491965-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Jan 2022 05:03:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95094

This helps fix compile errors seen with clang
e.g.
src/lib/dlt_user.c:455:11: error: address argument to atomic operation must be a pointer to _Atomic type ('bool *' invalid)
    if (!(atomic_compare_exchange_strong(&dlt_user_initialised, &expected, true)))
          ^                              ~~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.8.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.8.bb b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.8.bb
index c3fa4677e2..f07d4c4067 100644
--- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.8.bb
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.8.bb
@@ -18,7 +18,9 @@ SRC_URI = "git://github.com/GENIVI/${BPN}.git;protocol=https;branch=master \
            file://0002-Don-t-execute-processes-as-a-specific-user.patch \
            file://0004-Modify-systemd-config-directory.patch \
            "
-SRCREV = "1438fcf8c88cd47b20b2984180a8457c3eb9193d"
+SRCREV = "0138c00811c86eab4ff6bff3c6528163885ade19"
+
+PV .= "+2.18.9git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-- 
2.35.0


