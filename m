Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web11.949.1632338543014245145
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Sep 2021 12:22:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZLNvfd0I;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id s11so3744427pgr.11
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Sep 2021 12:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cS8+fNBFvrJwzya+6UOMRnyUnmVyG2QOxX1q9LJapLg=;
        b=ZLNvfd0IHuExAyizLIIDuRbESl9/m2CDaWvlAr0Hdn7P5O0bPODgcQ1zW+Ee4LrkZJ
         vj+oREGlFN4Naue9/t+wRye49KLPvjVbfYS16XybVNqNBQQWAdnb7CnKxH6NBFMGsIS9
         ZMcg+GfYoo2XbHpU3bDjC2UtSMA9IdsE1YgecTfcSXNwDfTDUP1ZNrrv6HwoNmtM4v/5
         TJnE4cSXNmaiJT0JmD7Zlp5puzjWpLcgtM1GS8GoTPtgEXVNNx6/A/qy41Hawmc6qpXr
         Glh5NdamQyJ41o+KdJPIwLrM3mbfdu7zWR9j+3ubfx3DsOAStr5gIwtw4c6raPNmTWNY
         INPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cS8+fNBFvrJwzya+6UOMRnyUnmVyG2QOxX1q9LJapLg=;
        b=3sCC3FPGR3K1W0g/l8g+VEngLKih6K1BXwbayoSxHTN+UFxsD+1LsmwmOrEzyQ7gky
         dWAusG+2tN5qeKG6gQW8wSiG67EHt02Hl7kAYWe+Y0W6dsGNamLGU9RSHrkcHYx5+ThI
         u8kktAcgzzrBGjFJPvX/xTLqubDnKpSl+s/tusPhRtlQHM7cKmyrZApXXaqnW/AoTPp3
         lqTG6lxV7U8eWqleWQA4cBV0EE6kJGH4j55f21e1sd9C7XGI9BPjKmzPUTzv12IAK2pj
         q0QvaEHHhVcOfnNGhoyx8WNlcMAlt3E8bIliVjs/TmUiVohGHCX3o4d3bXiUTOdHz9Cj
         X/HA==
X-Gm-Message-State: AOAM531ezBxt0ccAUtBBmtNZijGLv0iX+rMVh4OHMRjcndave69GsyBE
	Z+dTnsFqWbJmwVuZAhHBA2WG/lq2wTnM/Q==
X-Google-Smtp-Source: ABdhPJwONj+j3SFrUd+jhw60zktFNVuS+APSqtma3SZBvrNrutUEP9wNzkrmz2hpI+BGtJhCLhkBaA==
X-Received: by 2002:a63:6e48:: with SMTP id j69mr495491pgc.460.1632338542400;
        Wed, 22 Sep 2021 12:22:22 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::728f])
        by smtp.gmail.com with ESMTPSA id y13sm3083119pjc.50.2021.09.22.12.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 12:22:22 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 08/39] rrdtool: Inherit pkgconfig
Date: Wed, 22 Sep 2021 12:21:42 -0700
Message-Id: <20210922192213.3062719-8-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210922192213.3062719-1-raj.khem@gmail.com>
References: <20210922192213.3062719-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes
configure: error: Please fix the library issues listed above and try again.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/rrdtool/rrdtool_1.7.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/rrdtool/rrdtool_1.7.2.bb b/meta-oe/recipes-extended/rrdtool/rrdtool_1.7.2.bb
index a1919e7400..e96138ea83 100644
--- a/meta-oe/recipes-extended/rrdtool/rrdtool_1.7.2.bb
+++ b/meta-oe/recipes-extended/rrdtool/rrdtool_1.7.2.bb
@@ -15,7 +15,7 @@ SRC_URI = "\
 
 S = "${WORKDIR}/git"
 
-inherit cpan autotools-brokensep gettext python3native python3-dir systemd
+inherit cpan autotools-brokensep gettext pkgconfig python3native python3-dir systemd
 
 BBCLASSEXTEND = "native"
 
-- 
2.33.0

