Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web12.973.1602637592393972877
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Oct 2020 18:06:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uPOF4BsY;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id p13so1374763edi.7
        for <openembedded-devel@lists.openembedded.org>; Tue, 13 Oct 2020 18:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=BNAe8YVvTSdjjsmfWz8uZbgNA94HsLJTJJWuR0g0HpU=;
        b=uPOF4BsYKb6XFHT2/4ITF1RqOGZbTpYODAry96EHyAO6OJuClacG/w8yYLOEWcd+Y9
         3iAf0GOnKHKnci3GysAA2l1UDGJpoLjlGCzRZeNGDuETBGnWctLNHyMeK6/eo7yPe+rO
         OfVOmDvF9wDXabQv8Fb1dFW1I+MChV8KlyLk2GmslxuS3T8uEUmN5QdeH6Hfxi1j/gzw
         NjMlN5jhVhzSNLzZvaRMe6TEWleJM/eycGgACcvHrOz0+QHBEPTCoSLe2m0abttt/3GF
         1ZSJMYDWf1tg8+g4b0DW7cHAfR/IUcN0TwYzJKfZ3XZdPJ2ck7CwMDlUnVJLVErl8nRo
         xUnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BNAe8YVvTSdjjsmfWz8uZbgNA94HsLJTJJWuR0g0HpU=;
        b=Lrgk4HlTEFghie5UWAJ5O36KOVo2rzFF6kOUtEdPzKH1COd7M6KfKmlEdpTUVXX/9t
         hDXXmUeGZlhaw7D0yrbABsEr58hjIXonX6QFqZQ+8Y/skIkJ8ugG2/udRRqfmdutcLpD
         PUPgw+9ojOF98B0GZfSXhbHiTOWrWO1wgOTilv8CGct+nM1Ix3JMRVlojVoZmEppXn62
         VsIqepjos6c/vjowwyyDBp6Q6YMg1I0c/JrnT7TCP1ptnQ3IEL4kLdfRITCGaNrm+1F3
         svhuKO134VxWQn5+z87mSL5ySSZYTULT1Pz5sVuWI5toVYmvIG5mmC08DYplkdrThVVp
         zOpA==
X-Gm-Message-State: AOAM531fK5BWAo8P5sTXHDWCavLuV+Xaz+nJJoTdxfS7bQnHqoPv3Y6f
	5B95rLpQD5qR7UViV74RP87GuKb6TM8=
X-Google-Smtp-Source: ABdhPJxOBQnV/irPJgV26vRs1Trq0MRcbSGYfUAq0jLl8i9n2oqEkH3kQuZdMOBFwEhMI67HcGEbQQ==
X-Received: by 2002:a05:6402:1c8f:: with SMTP id cy15mr2522245edb.335.1602637590530;
        Tue, 13 Oct 2020 18:06:30 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f375957a175fbdd89b9baae.dip0.t-ipconnect.de. [2003:f0:7f37:5957:a175:fbdd:89b9:baae])
        by smtp.gmail.com with ESMTPSA id i20sm592594edv.96.2020.10.13.18.06.29
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 18:06:29 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/8] hdf5: Shorten SUMMARY and move long text to DESCRIPTION
Date: Wed, 14 Oct 2020 03:06:11 +0200
Message-Id: <20201014010617.1086948-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201014010617.1086948-1-schnitzeltony@gmail.com>
References: <20201014010617.1086948-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-oe/recipes-support/hdf5/hdf5_1.8.21.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/hdf5/hdf5_1.8.21.bb b/meta-oe/recipes-support/hdf5/hdf5_1.8.21.bb
index 9af2b6714..11285451a 100644
--- a/meta-oe/recipes-support/hdf5/hdf5_1.8.21.bb
+++ b/meta-oe/recipes-support/hdf5/hdf5_1.8.21.bb
@@ -1,4 +1,5 @@
-SUMMARY = "Unique technology suite that makes possible the management of \
+SUMMARY = "Management suite for extremely large and complex data collections"
+DESCRIPTION = "Unique technology suite that makes possible the management of \
 extremely large and complex data collections"
 HOMEPAGE = "https://www.hdfgroup.org/"
 SECTION = "libs"
-- 
2.26.2

