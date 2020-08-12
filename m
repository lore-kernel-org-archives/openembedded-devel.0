Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web12.302.1597264907095699267
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Aug 2020 13:41:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SRyeSM/O;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id p1so1632891pls.4
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Aug 2020 13:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=w2/sthgsgkEz9GHaoXu0NTw5/ZnpJj+ykvy1dyoncXE=;
        b=SRyeSM/OuBblBwWLVUPNxEOcL/NwLyjhrGRuN/NDoZd12BU9ytV4mwH0OcCgICVSkf
         7KVuNO3qF0z52OrsHyitDjErTwf1J1f6u8t2WY1Wo7KLvMDTxtXUX7yAecCh9LCpi7di
         mXofGXu/quHKDLF/ugUFU1+PaIG+LC4Ri4fgCPRwmY/Anni8nbZiifFaYWtmGJAF5iCH
         6Z98H8OuJym5wzG7ePgRRtAB+bolqBhwlB4+XD6qOC2LZcoXyWoDMv9qaTiCwLWxVAsD
         WtTyEYPGw/ue08qhvqn8nFL10OvNi2XdQbY29UV0GDtpkzm5Bf5uexEedL0YnLgQDBjB
         vq0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=w2/sthgsgkEz9GHaoXu0NTw5/ZnpJj+ykvy1dyoncXE=;
        b=MNjbGBgxxqRcgWqAeLGAddset4FnotPGLkXxlq9UmfKaLHD34yGG1fOKT+zAZcwPM/
         Fw0zpgtGLJUk222dLmnl/QcuHIYFZT0solg2lT7hJyCz4WbeMmutBTIKW8GQkFWVwTvL
         nF880sqUs15tdejpsn52iqsMu2aT7l0netaovQtE1HCqUdvFY33MQbCWALVKHCTkIFZo
         vKtyeIPSnJ2r6e+sInkZo0LG4W61B28wO6k2Ib1iFXggxeA8Wp0iIswr4SnIfGBl1A/l
         eDx1fmk7lPDKLsmLjtfgRR0Mgp8+ts9RRRlbcT7lxLVE50AKLQ/r+Rac4I9AIBUXSKWO
         kw4g==
X-Gm-Message-State: AOAM533r0Fcgaauvi/3rXom86gswScEm5qYWybmk/wgPzAu+Tpm3GZIc
	VHnr7wp00uMnwd1nSxlGbSPaJ0TpHZk=
X-Google-Smtp-Source: ABdhPJxiqUiW0mPj+84/yQmITsq3w4yT33wtWoPDm96Zh1uN7iJwZ2AJNCnVxz1FzClY0qzhvLQlUg==
X-Received: by 2002:a17:902:a50e:: with SMTP id s14mr995856plq.164.1597264906279;
        Wed, 12 Aug 2020 13:41:46 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e60c])
        by smtp.gmail.com with ESMTPSA id l22sm2984287pjy.31.2020.08.12.13.41.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2020 13:41:45 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][ 15/18] snort: Upgrade to 2.9.16.1
Date: Wed, 12 Aug 2020 13:41:27 -0700
Message-Id: <20200812204130.1012160-15-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200812204130.1012160-1-raj.khem@gmail.com>
References: <20200812204130.1012160-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../snort/{snort_2.9.16.bb => snort_2.9.16.1.bb}              | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)
 rename meta-networking/recipes-connectivity/snort/{snort_2.9.16.bb => snort_2.9.16.1.bb} (96%)

diff --git a/meta-networking/recipes-connectivity/snort/snort_2.9.16.bb b/meta-networking/recipes-connectivity/snort/snort_2.9.16.1.bb
similarity index 96%
rename from meta-networking/recipes-connectivity/snort/snort_2.9.16.bb
rename to meta-networking/recipes-connectivity/snort/snort_2.9.16.1.bb
index d8073d865b..e967f7a034 100644
--- a/meta-networking/recipes-connectivity/snort/snort_2.9.16.bb
+++ b/meta-networking/recipes-connectivity/snort/snort_2.9.16.1.bb
@@ -14,9 +14,7 @@ SRC_URI = "https://www.snort.org/downloads/archive/snort/${BP}.tar.gz \
     file://disable-run-test-program-while-cross-compiling.patch \
     file://configure.in-disable-tirpc-checking-for-fedora.patch \
 "
-
-SRC_URI[md5sum] = "1cec58babaea3420014d61a93e6e1545"
-SRC_URI[sha256sum] = "9688d8edf1da09dec6574000fb3c0e62f99c56428587616e17c60103c0bcbad7"
+SRC_URI[sha256sum] = "e3ac45a1a3cc2c997d52d19cd92f1adf5641c3a919387adab47a4d13a9dc9f8e"
 
 UPSTREAM_CHECK_URI = "https://www.snort.org/downloads"
 UPSTREAM_CHECK_REGEX = "snort-(?P<pver>\d+(\.\d+)+)\.tar"
-- 
2.28.0

