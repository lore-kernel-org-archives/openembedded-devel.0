Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web12.6422.1602218379040397938
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Oct 2020 21:39:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Y1U9HqaD;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id o25so6200135pgm.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Oct 2020 21:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=v6hoXLRaMQqx0aUBuw58vxoN4UuzeTO/M1YWUxh61V4=;
        b=Y1U9HqaDkWsWhYthhwg0+8TsmoBMW64anKxq7oQoB7h9a77+s1y8qtr1hrpEpFHySz
         xiNny2igu6G5Oq3AneJlmisENAgJwgdHTdpQcTDfRbMPDdBYXHyVRodwrFkh0O71koow
         xXoG0hC380GdFpYksh1MOjvjKGTuZVR/do4eUd+SD5XgVyABXXHhjsTIHD+vTLzWlTdB
         SexkT1ITzhozZGworhe2PQJrczZQJvpT6oR3vI/lg/mvUwwHKFNR5weeLGvLSeWUWhF1
         XC2GbfShN7gxUPr/b7WmdRJFxfHvfGD+V4NtjpyemAuYywLAtAFDJSO2KSllJRDkY/C0
         MDKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=v6hoXLRaMQqx0aUBuw58vxoN4UuzeTO/M1YWUxh61V4=;
        b=oyXHk5Z9Ojn35NsVkj1WHWwTbK4RFQ9Gj6ywR1BVkPDx+ASbOthx9Wkdngwn9LtrMX
         Fv6gKLKtEYwKTNY++B8RWgRP2lgLe36v25J1fptIYlG6Xh7jPIMbrFAR1OMmOrpbNG6G
         1gwhDpSRnLyrpjbSQSjq6RS+bgSp23m7gIL2Y2oV0eKa4VmtwyJ3AnpdEOZJlQOgteyi
         P0KwXalkbWOb/9VbC7sPf9fDXe56wggNampeYH5Gzd5OM49Vwf41C5lkmvgDU7x8xCcB
         gEkCElBLv6fNG9OycmT14kWhF1qebP9POkrsz8K2hdNDcz2rLmu7XB5uPINWutBKsdg5
         ofUg==
X-Gm-Message-State: AOAM530SjcX0dAiFoT8sSQO0Qgzqpkm1VRg6eDlYBoyT4LbsJPK/Ljza
	RhsTXkUvKcRG3TOBz+wx9sy5Ubtt7pk=
X-Google-Smtp-Source: ABdhPJz+fygBN65pbjcsyJI8mwrw82+ZM8TyDGwYG0VDxa+XFMmm5bkB3xoQhVRmhQPAQ29u0Om8zg==
X-Received: by 2002:a17:90a:ba0c:: with SMTP id s12mr2672665pjr.2.1602218378496;
        Thu, 08 Oct 2020 21:39:38 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:f1c6:e45a:6950:664b])
        by smtp.gmail.com with ESMTPSA id v5sm8412183pfu.151.2020.10.08.21.39.37
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2020 21:39:38 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 3/3] Add template-toolkit to pkg grp
Date: Thu,  8 Oct 2020 21:39:35 -0700
Message-Id: <20201009043935.18597-3-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201009043935.18597-1-akuster808@gmail.com>
References: <20201009043935.18597-1-akuster808@gmail.com>

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-perl/recipes-perl/packagegroups/packagegroup-meta-perl.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-perl/recipes-perl/packagegroups/packagegroup-meta-perl.bb b/meta-perl/recipes-perl/packagegroups/packagegroup-meta-perl.bb
index 3fa56d4390..533db5db0e 100644
--- a/meta-perl/recipes-perl/packagegroups/packagegroup-meta-perl.bb
+++ b/meta-perl/recipes-perl/packagegroups/packagegroup-meta-perl.bb
@@ -81,6 +81,7 @@ RDEPENDS_packagegroup-meta-perl = "\
 RDEPENDS_packagegroup-meta-perl-extended = "\
     logcheck \
     mime-construct \
+    template-toolkit \
 "
 
 RDEPENDS_packagegroup-meta-perl-ptest-packages = "\
-- 
2.17.1

