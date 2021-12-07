Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC38AC433FE
	for <webhook@archiver.kernel.org>; Tue,  7 Dec 2021 15:49:57 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.68936.1638892196629874796
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Dec 2021 07:49:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JMnHyR1H;
 spf=pass (domain: gmail.com, ip: 209.85.214.174,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id u11so9734141plf.3
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Dec 2021 07:49:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UqdLvu6Y0wje0cg/Vb1tk0IvujCCJADcE2JRs0JqGdg=;
        b=JMnHyR1HWzo/C6Kk/O1iKedNg+ClUH0UOhK6LHaO0NnBR+ByjeYiyNCTyXbok7vy2Z
         6Xo4ysX78bUC4U9ZwXat8LWtMSzy6koQhCm8F8Z0jkHj7Me/c89/SkHcrKZQa/CYWWOH
         xIs4Sj3Im0+cMm/aB5vGSYKAt9Br47ufG7xeWJeYmQo8GU1h/xUXEGZPQ3VNo+pKSbsB
         cJmlsyoICyO3c7bYofcOqeZtXD4kdowv+o7Y8d7qTPNgXJ5p9Q1kRjgIj/f0+IzqE5hU
         2iaxPGrjAltXHv5pz3HkWQen0eGhguHkAy06lqFMFhP5c6jcGqIt0oRYyinRxy7O0I0r
         aIDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UqdLvu6Y0wje0cg/Vb1tk0IvujCCJADcE2JRs0JqGdg=;
        b=eO/Gsl0+qfJctMAndDP0Jd7c1OLV/ZNJ9YBE3u0V9ktqA8IHVEA4u3rk+gFbBtY7Xn
         MxCXxr0DyajwR3E/W7WsYW9AflC/iCgkehHN68HRlEcqwGmKFTZVj03CoNP1swWFliCd
         3sHqJASIlxe80TQbC3NNxRwX1PbcP0RhLA+uyZhCBNPc5xmtCGn/bKBPxaOxbEvaG89I
         y6M6Z2FKxImrpq4spS5LHSn9alo3ZxJaVP2A7xdtHypIN/0UyOmksnvTA5a0YgiCFzv5
         oRtwacumovmQxkiAo3fGfi9rIiBqFuryE0wDcT2wQZhb8z+SBNwPPj5mqPZBSw5NLk/E
         3y/g==
X-Gm-Message-State: AOAM533xfYEL63ODSd3Fm/p2AykTPqPYk8N7CPxbP9pcE7rGblmVfihw
	e7z2ZZUxIMum7x3E9p6tEUicZo+LrdHNKA==
X-Google-Smtp-Source: 
 ABdhPJzU7fgx3o+3lwXVz6r4eG+y4ntKbvU2KS3Tjcs3/7pmjRyvV3Rn9/0kcbnBiAe8Qko99P9QFQ==
X-Received: by 2002:a17:902:d491:b0:142:1c30:dc17 with SMTP id
 c17-20020a170902d49100b001421c30dc17mr52777531plg.14.1638892195536;
        Tue, 07 Dec 2021 07:49:55 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ce68])
        by smtp.gmail.com with ESMTPSA id
 il7sm3432845pjb.54.2021.12.07.07.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Dec 2021 07:49:55 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] pangomm: Upgrade to 2.50.0
Date: Tue,  7 Dec 2021 07:49:52 -0800
Message-Id: <20211207154952.2010275-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Dec 2021 15:49:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94238

List of changes

* AttrList: Add get_attributes(), update(), equal()
  (Kjell Ahlstedt) Issue #12 (misos1)
* Make CairoFontMap::set_resolution() usable
  by adding the CairoFontMapImpl class
  (Kjell Ahlstedt) Issue #15 (Ievgenii Meshcheriakov)
* Add FontMap::get_family()
  (Kjell Ahlstedt)
* AttrList: Add to_string() and from_string()
  Attribute: Add TextTransform, BaselineShift and FontScle enums
  and some create_attr_*() methods
  (Kjell Ahlstedt)

Build:
* Don't include individual pango headers
  (Matthias Clasen, Kjell Ahlstedt) Merge request !22
* Support Visual Studio 2022 builds
  (Chun-wei Fan)
* Require pango >= 1.49.4
  (Kjell Ahlstedt)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../pango/{pangomm_2.46.1.bb => pangomm_2.50.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/pango/{pangomm_2.46.1.bb => pangomm_2.50.0.bb} (83%)

diff --git a/meta-oe/recipes-graphics/pango/pangomm_2.46.1.bb b/meta-oe/recipes-graphics/pango/pangomm_2.50.0.bb
similarity index 83%
rename from meta-oe/recipes-graphics/pango/pangomm_2.46.1.bb
rename to meta-oe/recipes-graphics/pango/pangomm_2.50.0.bb
index 0aa100fa29..a03ff547df 100644
--- a/meta-oe/recipes-graphics/pango/pangomm_2.46.1.bb
+++ b/meta-oe/recipes-graphics/pango/pangomm_2.50.0.bb
@@ -10,7 +10,7 @@ GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase features_check
 
-SRC_URI[archive.sha256sum] = "c885013fe61a4c5117fda395770d507563411c63e49f4a3aced4c9efe34d9975"
+SRC_URI[archive.sha256sum] = "a27aa77e017b9afce9e751d85bd1cf890abbb3a58bf59d0fac917eef82db3b5b"
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-- 
2.34.1


