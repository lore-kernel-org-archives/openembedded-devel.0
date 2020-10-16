Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
 by mx.groups.io with SMTP id smtpd.web12.22872.1602871654349306529
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Oct 2020 11:07:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HIAWOOG1;
 spf=pass (domain: gmail.com, ip: 209.85.218.65, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f65.google.com with SMTP id dt13so4415479ejb.12
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Oct 2020 11:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=olCbhFDJJ1WXp3528sqeTtZPhSzOQC26KBTNB0GtG7c=;
        b=HIAWOOG1uRSYF10h7WhCYXO1Ub5hy3pPmr/IddZp71a9e8CteQacgpUwtuLkKJMLNp
         ZdmFysrL+HmCFU8/HrUC/idw1JKamOUgQlC4/cWEhrNr7p4EOYeay9TmzAuBc/q0yddl
         Hk5ymbrB82A4TxOm+bp+5+3jGf9K8OT0vxHfqAvnut4URuTd5+5LWxTQoGXKHbxlUzZX
         dfBrOmC8fMrMS1AYr+1FSavBhJzm5OttaffE39tP4JqtYgcTowJOLxws0Gi3QsdMvrtc
         mIurQqcahZ8EHN1w8wHtebyF43PessvCH1Bjhxz3psXtTrEpaGIEPliJfompRZWpisky
         CKNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=olCbhFDJJ1WXp3528sqeTtZPhSzOQC26KBTNB0GtG7c=;
        b=Jzcx+8gki8j+8vfZi/jCc7o0sqrgWMsajrhXguDeMR306b9F5mfV5/5ntRcAgHCrIh
         m+kDnMV3r81Or8BYQS8EeL7+rKsVXsfzT9M6AjzXSA1NK3JcTDxwwxxi4ldMif1DGUYr
         5Crkizq1M6y3+6HTzD6zDJWNRQa0P+ldLU8mdacFTSJxqnwHtMw6y+hjiA9uzOaLB8Bl
         mZosFTGHV2tzIwcyunLoxf9BN/PqxtfWs/lK9O4ByKrRYpjqFhlM7i63dI594BTLRw6I
         b31mir2PY3BJWF6WULfWyxK4oOFyzhvP57pM0ycmxAaR8Ix9p1xg8DaMBmzrAvMx9R0w
         dVMg==
X-Gm-Message-State: AOAM5319eUA1YC2skKldMD9T8fxglFb0mBkB1phBYg+ddktJrTNmWwZx
	cMuk6Xl5APpqD2ggR973uhtbyEmz2zI=
X-Google-Smtp-Source: ABdhPJzgDEDu9TEOOG/JYXINRcJrdQUCukyglFIxPHDv/GdG7SV+vGKag9a8zNyKN9cXHYtPdexwrw==
X-Received: by 2002:a17:906:4dc7:: with SMTP id f7mr4905449ejw.73.1602871652501;
        Fri, 16 Oct 2020 11:07:32 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id c17sm2343173ejb.15.2020.10.16.11.07.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 11:07:31 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-multimedia][PATCH] packagegroup-meta-multimedia: include fdk-aac and mpd only with commercial in LICENSE_FLAGS_WHITELIST
Date: Fri, 16 Oct 2020 20:07:30 +0200
Message-Id: <20201016180730.1828900-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ERROR: Nothing RPROVIDES 'fdk-aac' (but meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb RDEPENDS on or otherwise requires it)
fdk-aac was skipped: because it has a restricted license 'commercial'. Which is not whitelisted in LICENSE_FLAGS_WHITELIST
NOTE: Runtime target 'fdk-aac' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['fdk-aac']

ERROR: Nothing RPROVIDES 'mpd' (but meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb RDEPENDS on or otherwise requires it)
mpd was skipped: because it has a restricted license 'commercial'. Which is not whitelisted in LICENSE_FLAGS_WHITELIST
NOTE: Runtime target 'mpd' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['mpd']

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../packagegroups/packagegroup-meta-multimedia.bb             | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb b/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
index c9db21ab52..b4f09cdf54 100644
--- a/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
+++ b/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
@@ -30,8 +30,7 @@ RDEPENDS_packagegroup-meta-multimedia = "\
     dleyna-renderer \
     dleyna-server \
     dvb-apps \
-    ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "faac", "", d)} \
-    fdk-aac \
+    ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "faac fdk-aac mpd", "", d)} \
     gerbera \
     libao \
     libavc1394 \
@@ -43,7 +42,6 @@ RDEPENDS_packagegroup-meta-multimedia = "\
     libmusicbrainz \
     libmpdclient \
     mpc \
-    mpd \
     ncmpc \
     libmpd \
     ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "opencore-amr vo-aacenc vo-amrwbenc", "", d)} \
-- 
2.25.1

