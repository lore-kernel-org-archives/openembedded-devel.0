Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web12.406.1624658765156777861
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Jun 2021 15:06:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=P/lUAMdf;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id k6so8503395pfk.12
        for <openembedded-devel@lists.openembedded.org>; Fri, 25 Jun 2021 15:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TDu5bR+6bs4c8c3+4aNNbmh4HtTwn+Yutp39Z0i8gW0=;
        b=P/lUAMdfYIud8WbOF0zEWLO8XoZxZ/vNLDYvrt/AhADa9Ce/jaw/cNhCdnLmRGAja9
         l12zBiqAXRgtKemzDMdCv1n9ZEYAgmwwpzty/Xj1ScC6HDVemmDO39jmXf/5mRo6ggDb
         HGgpgxjDtQS6mZVT/q/HBnbun++Ly0BmTVpfeqTeBxYRQR6MhHjB4NGYpplIbZdxUwvQ
         gPxZTdwWxc8cCKFD+B/G6ToJc5X5AUyWBXGE/jCBl9rUQDLWdJgvZdNxAObm838F8aeC
         ke5VLetOFM4/TUQMVTlLqsArcYfvSpJayVTnFRKPW+qqTMm5J2kICewkXQ+pLi1UGjyH
         8tXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TDu5bR+6bs4c8c3+4aNNbmh4HtTwn+Yutp39Z0i8gW0=;
        b=T/xk9b3Cf5mE3erd5wJ+nvZUFsjW5tnMJ3Blk9I+z92fZ1Mi6MrD1yZQRjQR0Vv0GH
         H1lh/EUvLJ9GAepDfbRAJbJ+FYArBrag9ocT3XWcC2oW7lqWAxgzMRzgO8SwQld1pVdk
         W0/wvecomLdNotMdcPTaPa0Q31h+9acS2q6EOsbUmJJNZWEp2T8bvlVaMpnZf9TebXlH
         GEG2T1+2t3sbuog/JQ3p4kQswnuSpKDDnt7L5/NXR7gfZ6/owv0tD+ey2m595NVSXXNO
         QHVLQzB5815nC8Kj3epdLaBi+neyovAZjZBZHCLDM0vuo21OWLKpfBuzUovvbdextboo
         pAPQ==
X-Gm-Message-State: AOAM532JL1EjkMTwbWUX9jiHc3tqidBdcRtNOGMZFAZNgBdx1mEz774t
	wt7vf4Q1+rQF/WkFh9j/zwp3DjTPoEraQg==
X-Google-Smtp-Source: ABdhPJznUIPz2vGPBcu+mgDlmUxtuCNU/A0lFOSu7ebaWNeRtUt1viPW/wGEpQcaew+1liogoFzueA==
X-Received: by 2002:a63:450e:: with SMTP id s14mr11285866pga.312.1624658764453;
        Fri, 25 Jun 2021 15:06:04 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::e0be])
        by smtp.gmail.com with ESMTPSA id k35sm6398737pgi.21.2021.06.25.15.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jun 2021 15:06:04 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] mpich: Add libgcc to ldflags on x86/glibc
Date: Fri, 25 Jun 2021 15:05:55 -0700
Message-Id: <20210625220555.1218235-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210625220555.1218235-1-raj.khem@gmail.com>
References: <20210625220555.1218235-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The build needs them in some subcomponents, it does not come to front
when using libgcc as default but when compiler-rt is used then it does
not link because its expecting functions from libgcc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/mpich/mpich_3.4.2.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/mpich/mpich_3.4.2.bb b/meta-oe/recipes-devtools/mpich/mpich_3.4.2.bb
index 0ee02d685c..20df3620d0 100644
--- a/meta-oe/recipes-devtools/mpich/mpich_3.4.2.bb
+++ b/meta-oe/recipes-devtools/mpich/mpich_3.4.2.bb
@@ -31,7 +31,8 @@ PACKAGECONFIG += " \
 "
 PACKAGECONFIG[x11] = "--with-x --x-includes=${STAGING_INCDIR} --x-libraries=${STAGING_LIBDIR},--without-x,virtual/libx11"
 
-LDFLAGS_append_x86-64 = " -lgcc"
+LDFLAGS_append_libc-glibc_x86-64 = " -lgcc"
+LDFLAGS_append_libc-glibc_x86 = " -lgcc"
 
 inherit autotools gettext pkgconfig
 
-- 
2.32.0

