Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23752C433FE
	for <webhook@archiver.kernel.org>; Fri,  5 Nov 2021 13:16:05 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web08.5339.1636118164812311021
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Nov 2021 06:16:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=arzMYlPz;
 spf=pass (domain: gmail.com, ip: 209.85.215.179,
 mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id p17so8371535pgj.2
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Nov 2021 06:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=kZXMmN/96OQI2q+uKl6mEdF2S9OjvCb3B1XRsx6uPnY=;
        b=arzMYlPzE4PvG0pCVvi7iF+sKrKvwf3FLyGyj1X+ZYBYOpQ0sXi+Tg183oTjARLJuc
         qihgSvecvfwMqrZWYOAAmvKcgeIZ0OB0/Po4gLeQF2X9lm84bXyxTsdGnpJCdMcYt6Bb
         u6WBVD80aJDraO80aA7dsGYcoeFc+7ZyYrYaO98kEBmTZMlFtcHbaCR5BPiHVPcj3bNC
         Ih07AGk/U2RNTUTl0baGJacWIaEHn4Q5nff+by8ChFjF6hXprAA+7+KvX74781qV+bF8
         kvfj7jWHHgcOaLG+j+zrvoCGgy3/FAS+GNEOTmsKB+qzHydob30+bSqo+ESCnkbuZrHX
         f5sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kZXMmN/96OQI2q+uKl6mEdF2S9OjvCb3B1XRsx6uPnY=;
        b=GpfnCLTJJmDLA58PGprCdP3w3yBlDFlTqS9Ij654KrShckGufNNJTYZDjxnxVbzDNj
         B05edDg97AlQU/4d2g1Et9jHUCxfYawsR++MemdFXZupsttLgHfbrCJxPnWbhc8jUr56
         ZC1iFrRNVAMnRSoTL1LF9svuRxRoBt1qFg038yOTdWD+mqLoa9qHixvZww9UBKASj0PM
         PfFdRQNC14zZeg9npqeyXz9ZQG7BLTQK97AAR6QoCa6/QWO3y7Z2T+TuNrXXAseqS/X8
         eMpqv1p3F6+d0FgQ5tXG3eZaEEUc9qiYgG50vOrAvUclyPRIF6z/3hfTRnhAVzfjh7f1
         l+4Q==
X-Gm-Message-State: AOAM530dXZj7zzaxNDUnscLEekXp0/GAj3NXUcQrN6KCvCU2qx2Ebp0O
	x+KkE8TNnpFGLLTdMlSj4cBihjRp+fg=
X-Google-Smtp-Source: 
 ABdhPJyOsxxPvU2Yb7EGjIok58qXmz3Q6wRj3mdOc5If8MMRKaW89FP+SbHND9KfAqxOd9sAfUfvaA==
X-Received: by 2002:a05:6a00:134c:b0:481:1abf:57a1 with SMTP id
 k12-20020a056a00134c00b004811abf57a1mr32254631pfu.64.1636118164150;
        Fri, 05 Nov 2021 06:16:04 -0700 (PDT)
Received: from keaua.hsd1.ca.comcast.net
 ([2601:202:4180:a5c0:1036:3e93:cc4e:1fe7])
        by smtp.gmail.com with ESMTPSA id
 c85sm7899124pfc.146.2021.11.05.06.16.03
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Nov 2021 06:16:03 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 03/10] pm-qa: fix paths for shell scripts
Date: Fri,  5 Nov 2021 06:15:50 -0700
Message-Id: 
 <d10d52aef959111a3edfc01aea4be2a248f8bc79.1636118048.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1636118048.git.akuster808@gmail.com>
References: <cover.1636118048.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 05 Nov 2021 13:16:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93835

From: Anastasios Kavoukis <anastasios.kavoukis@arm.com>

Cherry-pick the following patch from upstream/master branch,
as this fixes the following error(s) seen while running the
'pm-qa' scripts on the targets:

cpufreq_01.sh: line 28: ../include/functions.sh: No such file or directory

-----------------------------------------------

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
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
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


