Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
 by mx.groups.io with SMTP id smtpd.web11.3671.1617934863129387751
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 19:21:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hCCktecg;
 spf=pass (domain: gmail.com, ip: 209.85.210.44, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f44.google.com with SMTP id w31-20020a9d36220000b02901f2cbfc9743so4307288otb.7
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 19:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=0gl70TaobRJm117SGPiW2Eqh4Bb0YQCOIl+9AYoO8lw=;
        b=hCCktecgGGD5DpnkWT734J8lh3Gq6WDwZC+H7iT+IKOUuAMiGAe6f/7pEKH8we6HEJ
         leQuDCIhSDLY+tHzSWUV2f/ipfMixzKsLxjofel+quMerb6x11de82SMNszkLkb49cC/
         Qi1hEzZO9cpAxyarh+Lz2JQnNhxrSmw4Pd5FWZMNHuRJ3N+IvqwWtKHmD2kjIOSCfoWB
         r3p21nZ3NLVCKxxIfFAr1LDvUxHD/ykDOZVpgvhaH+y+05oC60nVj5xruiDSE81EiPKu
         lkG6jXWenSVkdUsj3cFE5BseKCHOyAWammxPDrmYPx8jteTNL9Zhl0Vj/Q7vgDmYH86m
         0g6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=0gl70TaobRJm117SGPiW2Eqh4Bb0YQCOIl+9AYoO8lw=;
        b=DeR6DIJaPQJXKt27Djb1tlUogk3LD4EENkXAmfWVtkppWYAQ+/IfKtJLsBLQWX+D1i
         cjMv4g1a/nF4Rd8TelLl9j5WwYBITmei7foY2rR4fvUf+Qr9AMuMSgiT9oxW9wG+YpL+
         Ku/snQMWKyWETUS+ID6fLBy4YUwJHO4GJTfMk/5UB2rSIJETwZ1la4uWYXv2sQnuMHj0
         OCXEaLDnZzIYZ++eHs1SfySZr65AwVUSE8DwXt9kAi11/xPIXzKcJ9/lQQSDRfpR5NKk
         iswUj9gwaZJ/9PREPzXe42EcgciTCWGbcaaG5caCWbAxtnx+vf4Cpjv8cvUPSh0M7Avu
         1n7w==
X-Gm-Message-State: AOAM5320jk8OljFBEfaMg8X8y7k531fbM7MbWowC6MKbcIyJLQvFuyV2
	W+LE7KBUkJPObL+XU0kjk0hdDVI9pxM=
X-Google-Smtp-Source: ABdhPJylUTDf7vXejS0pLUBFBc2QW6SbH0Hd4jxO1R8LvE3SKF7Csv9m/1+bhQZvS5lnHfv+s7616w==
X-Received: by 2002:a9d:5d0a:: with SMTP id b10mr10138003oti.180.1617934862356;
        Thu, 08 Apr 2021 19:21:02 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id k65sm299815otk.53.2021.04.08.19.21.01
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 19:21:02 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 10/36] python3-decorator: Upgrade 5.0.1 -> 5.0.5
Date: Thu,  8 Apr 2021 19:20:23 -0700
Message-Id: <6da16d6631a533d231f608b1a4c1729691102f60.1617934043.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617934043.git.akuster808@gmail.com>
References: <cover.1617934043.git.akuster808@gmail.com>

From: Leon Anavi <leon.anavi@konsulko.com>

Upgrade to release 5.0.5:

- Dropped support for Python < 3.5 with a substantial
  simplification of the code base (now building a decorator does
  not require calling "exec").
- Added a way to mimic functools.wraps-generated decorators.
- Ported the Continuous Integration from Travis to GitHub.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
(cherry picked from commit daf804c88290898bb56e401433aa6860c69afa2f)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{python3-decorator_5.0.1.bb => python3-decorator_5.0.5.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-decorator_5.0.1.bb => python3-decorator_5.0.5.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-decorator_5.0.1.bb b/meta-python/recipes-devtools/python/python3-decorator_5.0.5.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-decorator_5.0.1.bb
rename to meta-python/recipes-devtools/python/python3-decorator_5.0.5.bb
index e9d20379f9d..47daba8a0cc 100644
--- a/meta-python/recipes-devtools/python/python3-decorator_5.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-decorator_5.0.5.bb
@@ -9,7 +9,7 @@ decorator, just because you can."
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=be2fd2007972bf96c08af3293d728b22"
 
-SRC_URI[sha256sum] = "1e53162e016f317a61d93848f00e80e7109ca9ed06846c7f2930cf0ebede7c6c"
+SRC_URI[sha256sum] = "acda948ffcfe4bd0c4a57834b74ad968b91925b8201b740ca9d46fb8c5c618ce"
 
 inherit pypi setuptools3
 
-- 
2.17.1

