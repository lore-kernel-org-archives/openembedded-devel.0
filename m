Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web12.3561.1618693575028370335
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Apr 2021 14:06:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SMYtIWG2;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id h11so2980271pfn.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Apr 2021 14:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=vSbnKBeZhkLhPvfWKibffpAh/+Z9xKhXfYJ4XJBXiBk=;
        b=SMYtIWG2CQhenD//Qy3L9j/JqYHc2SWlSQ1SEUCL00/UeXeTtFhX7X4F1+rQelRUyV
         87lzo4RQeqGajMjfL33MNaljhiwJGExZ8/RR7s0MIiW3Wb8gwQLvWsih3x10H3iUUwvt
         dQZHF6AVANF+W/W6x7jhEaKjYKEj07vc8yVbMIv1EPnLzk+wFhxkUlKJ38Hi69V6qG2W
         iEL5/jIAbBfFae2BHnZcF3mJx8QGr9oC62VY8usyr3Wky0J9oucjQT/FZwnVUestQSPj
         UCcei+yKu2/VIENVWeOD4NEQ73Mu+4Rak7JDdBvMmslJbqg1AnuSFfzNs0uCIxjxek9N
         31CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=vSbnKBeZhkLhPvfWKibffpAh/+Z9xKhXfYJ4XJBXiBk=;
        b=LpGLgevRX23Obz/w2nryr0YF3dGs7UYUD9JQkS2NxMqRGBunnMouzIC3A1ZV+FvbdU
         pwMxlUG3t+bQoRgIhMxV9IlQO+ZSLt02DsE3qklNtMHaLcPorJLim2ZrtojwZLGf9Y/x
         wfXejFNRTzK4rbPLHWDEnuLFNBR0/KkTfbVi+kbDWkkh8PeaARHZOWpdSSTto4Aw75iA
         UwnRoVNSjKbsgzCovU6XEE/+29GF2/2eQnmMfqS4w/nRrE24XG69funoCwJFkRPcFRWB
         lSpFoHb2PTsdvd7DTf0Lri8+udEhxtbbzRksMYWOfzZ0NnnRUQCLRUiz2Q4hROWgnYCT
         QSeA==
X-Gm-Message-State: AOAM531k5POzFIc+Ge2E1L5sv4n+21YWyQe7mzRNkTaCy+EiFi7jtUqY
	jHZn5DA+2K8Ub7VG+07wLF6gKnkkSpDbcQ==
X-Google-Smtp-Source: ABdhPJybkFf+5bmxBQ2spQZAZ27LCi9EVR//ikUTGGUZKCXn2nHyeM5DYzT6708j7puYByHFLfYvow==
X-Received: by 2002:a63:eb0a:: with SMTP id t10mr4946297pgh.385.1618693574445;
        Sat, 17 Apr 2021 14:06:14 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:7c7e:4cc5:a7d5:fd57])
        by smtp.gmail.com with ESMTPSA id t67sm8509204pfb.210.2021.04.17.14.06.13
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Apr 2021 14:06:14 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardnott 06/50] python3-decorator: Upgrade 5.0.5 -> 5.0.6
Date: Sat, 17 Apr 2021 14:05:15 -0700
Message-Id: <73b0b49d763197c701d6ff5b99d0e7e4d6c8cd53.1618692905.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1618692905.git.akuster808@gmail.com>
References: <cover.1618692905.git.akuster808@gmail.com>

From: Leon Anavi <leon.anavi@konsulko.com>

Upgrade to release 5.0.6:

- The decorator module was not copying the module attribute anymore

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
(cherry picked from commit 88ddbf49e1e2ad00339458400f296646c791b073)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{python3-decorator_5.0.5.bb => python3-decorator_5.0.6.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-decorator_5.0.5.bb => python3-decorator_5.0.6.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-decorator_5.0.5.bb b/meta-python/recipes-devtools/python/python3-decorator_5.0.6.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-decorator_5.0.5.bb
rename to meta-python/recipes-devtools/python/python3-decorator_5.0.6.bb
index 47daba8a0cc..9e837b719ed 100644
--- a/meta-python/recipes-devtools/python/python3-decorator_5.0.5.bb
+++ b/meta-python/recipes-devtools/python/python3-decorator_5.0.6.bb
@@ -9,7 +9,7 @@ decorator, just because you can."
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=be2fd2007972bf96c08af3293d728b22"
 
-SRC_URI[sha256sum] = "acda948ffcfe4bd0c4a57834b74ad968b91925b8201b740ca9d46fb8c5c618ce"
+SRC_URI[sha256sum] = "f2e71efb39412bfd23d878e896a51b07744f2e2250b2e87d158e76828c5ae202"
 
 inherit pypi setuptools3
 
-- 
2.17.1

