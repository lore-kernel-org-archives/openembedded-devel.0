Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.11332.1629036408834709213
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Aug 2021 07:06:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rYJo+VW8;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id a5so17862383plh.5
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Aug 2021 07:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=D1nx+XeGAWLQvvuawXdJTh686RZopoTSkyANruBa0DE=;
        b=rYJo+VW80XjMLUcKjxGy9BrmL8PmNoSK6WjsEXNlXyIVy04jSILBuTuOUVrw4DQhzq
         1gMaSmfpPq6x0r3Tz9kzqyXFmX+mQZfUfDecu0sm8sGBCzfxo/r09Ev8+ydYQvjOJmbY
         SUMBoDWuJI1jS44fI7g9MpiWzziVdin9NlkxqQv43MonSoMThImxmzqXdgbQyFyOSqB3
         ex1trxVjbwONcHQyg3ep0Rx+Ad+nmambZQJvirp5STR1kPAeum8kBosWs/kazByingzH
         sm7HdwTbzQ8R8xo0hH2iRSvJiszR6W5pEzurAkzk6271bIUuotDy8O+RzQI9+PkjBtPR
         GwqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=D1nx+XeGAWLQvvuawXdJTh686RZopoTSkyANruBa0DE=;
        b=n1IoyNKuIjhbZ9ZR36DO1Az5yogcNgkTK1eiaM7KBD/dmhAn5xkZoEwGenvc//ZsGX
         Wrxu0bdweEiGmbRzzbt9uU08dv1+q17hKPDUuonVX2aN8HQYjUKmw8NBcNS7mf2mugTP
         31QgwtkWn6syNUtJmHjfEtMYT0S4caKlNnNawRXrsdUm484D1He1YyCd3s8RgXmkCFfj
         B9pjl1r0z7QIIutMgrI5BWxB+ZhbgJI6hnbhLdUQOiFIPZ/C7WlsV2wFNpiuoOcB8Gbs
         NYFcajg2GEAsjZqWeLM8jkrTiOZEkemqjdZnKdK1p9w3grRLINnbqlDOHNFBBbN+wjXb
         HHlg==
X-Gm-Message-State: AOAM530o5zd9kad3ruqA4MXyJIUOO8F2nTgNGuyBcfXmlWRTtNMmY+Q1
	YssyNPsrzV1/Fl/ruzt6UKfRZc/JNu1AWQ==
X-Google-Smtp-Source: ABdhPJyIO4LK1CEiE6ttyFoZ5tf1xG2ijXrwrHXjPE3tEYWFdJO7/CTE4aZ+Jzzp1PrwucDfe1W0ig==
X-Received: by 2002:a63:4455:: with SMTP id t21mr6501185pgk.91.1629036408333;
        Sun, 15 Aug 2021 07:06:48 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.hsd1.ca.comcast.net ([2601:202:4180:a5c0:162c:344d:280d:4a4c])
        by smtp.gmail.com with ESMTPSA id y67sm8332901pfg.218.2021.08.15.07.06.47
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Aug 2021 07:06:48 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 09/18] pm-qa: fix paths for shell scripts
Date: Sun, 15 Aug 2021 07:06:21 -0700
Message-Id: <24e01c99c4a06a5281fb80a648729c9b9add3091.1629036279.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1629036279.git.akuster808@gmail.com>
References: <cover.1629036279.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Anastasios Kavoukis <anastasios.kavoukis@arm.com>

A commit in the repo of pm-qa:

"adf9df9 Fix path to library files and change shebang line"

Changed the text that sed was using to replace relative to
absolute paths.

As a result sed was not effectively finding the text
"source ../include" to replace it, as the sed should be now
searching for ". ../include".

Similarly for "../Switches"

Signed-off-by: Anastasios Kavoukis <anastasios.kavoukis@arm.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 06a93a04efe2c2cbae6de93d07962be4dfa35019)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-test/pm-qa/pm-qa_git.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-test/pm-qa/pm-qa_git.bb b/meta-oe/recipes-test/pm-qa/pm-qa_git.bb
index 7e9971ea4c..bb641437c9 100644
--- a/meta-oe/recipes-test/pm-qa/pm-qa_git.bb
+++ b/meta-oe/recipes-test/pm-qa/pm-qa_git.bb
@@ -42,6 +42,7 @@ do_install () {
     do
         # Remove hardcoded relative paths
         sed -i -e 's#..\/utils\/##' ${script}
+        sed -i -e 's#. ..\/Switches#${bindir}#g' ${script}
 
         script_basename=`basename ${script}`
         install -m 0755 $script ${D}${libdir}/${BPN}/${script_basename}
@@ -54,7 +55,7 @@ do_install () {
         # if the script includes any helper scripts from the $libdir
         # directory then change the source path to the absolute path
         # to reflect the install location of the helper scripts.
-        sed -i -e "s#source ../include#source ${libdir}/${BPN}#g" ${script}
+        sed -i -e "s#. ../include#. ${libdir}/${BPN}#g" ${script}
         # Remove hardcoded relative paths
         sed -i -e 's#..\/utils\/##' ${script}
 
-- 
2.25.1

