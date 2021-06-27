Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web09.2637.1624825351851937248
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Jun 2021 13:22:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tGx17xX2;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id e33so13491668pgm.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Jun 2021 13:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=FnDPVugyUGvkdy4jYMSaHr2tAXUn2RlH/f9k3C7qUyA=;
        b=tGx17xX2buwDzUXeM84/o+omj6WM27MFnntNgb6xskpij9gfi8yM/+5RSvtv1scR7w
         p2iYvbWqYEQHf7+cHmHzHG0FpgD0l7oHp+bGFVtYPuoTp83nPK78RvwDFGR839ghRQ8N
         uNIyNZD1jpfIR+5EfC6QqNQqJW9R411pekQ3NUhH0j84HgrvT81dQCARFE122HcSkPjQ
         hA5OBKOEoUS+kn9xIhr+1Dbxcj5n/O9Rma/gZV7zKoI9X/QJ0O0hZTYaM8zUO05QNRnY
         zBMXWlRryxwyWZyPJv5cObvWhe4l48Y3vagGNufb3uQgNXwrALNRFGsz91+iLg44i4lR
         qIAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=FnDPVugyUGvkdy4jYMSaHr2tAXUn2RlH/f9k3C7qUyA=;
        b=nD9b0tqIauGw1nd4QCaZ7xQA7lU9n5K7dXHsVFIaxyXs4b8i4hPds6AIGag9cX+lBg
         maAgh1XEcw95WzvxojUqN6m9/4Oh7kNhaNbU8SNbigK1rQC4N1fo0UP48pDGdxnEM+GE
         iKkMgRu0LhvCTXYC2ZT1S4YuEP/ft65Zw7lHmGvl8rPnGCPcFxWSbpxQy7L8pWWUwVbm
         yl86yyEcEKKvxNWAHGgQDF93kfuva3hxvTF+AyHToMWoeU7HI+H+IAyJ6iM32+gvuZJm
         ZOo8SNkDdbRlcycZJfZMGfMZfwYDyZLX/pVBi0mGyAflJ2WoqcNHVuxfLyYMqiZpXBma
         Chjw==
X-Gm-Message-State: AOAM530g3zshbaM+JIVGB47noPIkXJ0INFNml008ERP9XPXIxQ/YCw58
	Gtqq9lqvLeFnkk5vUPjxpL3NzhV35SEDzg==
X-Google-Smtp-Source: ABdhPJzMUiJ26ieVjqdp2jOVvAMFI5+pZ1iiJ+RCSYNiVwfvFF6TVKkdSRdMJV20moKWSBeXF93vIg==
X-Received: by 2002:a63:ff4b:: with SMTP id s11mr20026613pgk.436.1624825351303;
        Sun, 27 Jun 2021 13:22:31 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:90a0:cfd2:ffe1:efef])
        by smtp.gmail.com with ESMTPSA id ay3sm3501192pjb.38.2021.06.27.13.22.30
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jun 2021 13:22:31 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 14/20] minifi-cpp: set CLEANBROKEN to 1
Date: Sun, 27 Jun 2021 13:22:09 -0700
Message-Id: <22f613b047acbe5051e5fad3bba54cecb70a55a0.1624825239.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1624825239.git.akuster808@gmail.com>
References: <cover.1624825239.git.akuster808@gmail.com>

From: Chen Qi <Qi.Chen@windriver.com>

Rebuilding minifi-cpp in old build dir sometimes result
in do_compile failure. So set CLEANBROKEN to "1" to workaround
this problem. If further investigation is done and the underlying
problem is addressed, this setting could be removed.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit a9e17243875b82dba698924cf2f1d31408127521)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
index 5b27601c04..68d83eb008 100644
--- a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
+++ b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
@@ -138,3 +138,5 @@ pkg_postinst_${PN}() {
         fi
     fi
 }
+
+CLEANBROKEN = "1"
-- 
2.17.1

