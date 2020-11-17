Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web12.16256.1605654248662316543
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Nov 2020 15:04:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RW6/dH72;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id 34so13760054pgp.10
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Nov 2020 15:04:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eQ7XnmUCtpVlvp1kaIuZokuDiQO1NNjm06BRo4OaMnQ=;
        b=RW6/dH72OYGO7ik/tFR6sZ59kgEQWiTAZdj0tLMMZqoogTXk6x1+uMvyTcIalFbnqX
         XMKlTQsWIb5Awn0INLPESf+NqKzUjWcQKDlFvTunJMb5fujJbpKi4qMNQQpTS+sf9sjJ
         wvv2UKSkPtjCWFazSg+SZczSd+qeqBjQJE43ff86fGJatH2VCo4p/l5hmxY6KSD2RyDZ
         LcPS/IAoY8etEGz+5/NsG1vaAQwxTz/klDgR7lX28OrtHrL7yPjRzFu3U2d/CQiV7VZh
         swwddHgqaZ1xkOrOvD476N99EAySPIR0faqMC9gMjiVEIppKdkENjVnsS6+A7//KoDPA
         zR1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eQ7XnmUCtpVlvp1kaIuZokuDiQO1NNjm06BRo4OaMnQ=;
        b=oQk+cAvOaXXa28wK4JjGaRYXYgBqSksi+67fGafs1tC5KPs/CvMhqslOSeeGzVbFFQ
         9dUAzXyDUinI5h6eub7ggV0WmHA4+f8rHvxnrKps0QmcqveiD4Bcnz8yMSv0MLVRhDa7
         JSkNE/k1jpVk9thbrDWTcs/QfqbEJesMXaAMCV6+q0I5gBdvkqIZT2qC0tUf/Gj7a5L5
         SBqtsi3jzI/1K31VMdOSpfSc8Xx/5UO11ApEUYX8k3U/boDT3kwvL7skupkxYDBm1YK1
         Uya/I+AYOEY7ajX/KMsyeGDr/RWHTJ0ZB2SD1tRP4foxbGOhV3HF14pF0yUiPyYs5ig7
         nLcQ==
X-Gm-Message-State: AOAM532QeMV8fJlMaGJutCamifUwycZS1v2yBUSKSBrHVxmFGX/t6Fmq
	pAQf0gzxJd3x6tuiHKObz5MpwhJQlmLaRA==
X-Google-Smtp-Source: ABdhPJyQ5w2IcFRPJrseqK4IERUjXzahG+i5mdiTuFvxK3rGr/N7KTDesgHN/ZbDC9uiC9aNk4v1GA==
X-Received: by 2002:a63:5b41:: with SMTP id l1mr2289763pgm.370.1605654247901;
        Tue, 17 Nov 2020 15:04:07 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::4611])
        by smtp.gmail.com with ESMTPSA id t21sm133587pjr.42.2020.11.17.15.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2020 15:04:07 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/5] libplist: Inherit python3targetconfig
Date: Tue, 17 Nov 2020 15:04:01 -0800
Message-Id: <20201117230404.880724-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201117230404.880724-1-raj.khem@gmail.com>
References: <20201117230404.880724-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes

configure: error:
  Could not link test program to Python. Maybe the main Python library has been
  installed in some non-standard library path. If so, pass it to configure,
  via the LIBS environment variable.
  Example: ./configure LIBS="-L/usr/non-standard-path/python/lib"

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/libimobiledevice/libplist_2.2.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/libimobiledevice/libplist_2.2.0.bb b/meta-oe/recipes-extended/libimobiledevice/libplist_2.2.0.bb
index 408fa8ac0e..6ef5b4f432 100644
--- a/meta-oe/recipes-extended/libimobiledevice/libplist_2.2.0.bb
+++ b/meta-oe/recipes-extended/libimobiledevice/libplist_2.2.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ebb5c50ab7cab4baeffba14977030c07 \
 
 DEPENDS = "libxml2 glib-2.0 swig python3"
 
-inherit autotools pkgconfig python3native
+inherit autotools pkgconfig python3native python3targetconfig
 
 SRCREV = "c5a30e9267068436a75b5d00fcbf95cb9c1f4dcd"
 SRC_URI = "git://github.com/libimobiledevice/libplist;protocol=https"
-- 
2.29.2

