Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64A15C43219
	for <webhook@archiver.kernel.org>; Sun, 15 May 2022 13:49:50 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web09.17037.1652622587872429778
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 May 2022 06:49:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=I6MFCkPJ;
 spf=pass (domain: gmail.com, ip: 209.85.215.177,
 mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id v10so11757677pgl.11
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 May 2022 06:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=FkEZe2eM5D/PBhZiUZtNEejSaPg0lgjeIn5VScjYq/A=;
        b=I6MFCkPJyWGzspNzzTF1WqZ7s0zu6gaQFZke+i/QlEIaKNuVG8OYXQSvZLzkAgnYkQ
         VCYjUAMQRfyI22BU2pG73EpD+DuCbWKBvNigZJVPv4VqTz9dcG6ZeWtVQLDuXPkHu5SF
         oOR3mPRb2Q7m+/7MVBJzQeRcwrRVWQ0xh7STObEMt/O2MlD2mqz5/C4dRKxLfPMQQ75z
         eUhJ7d8an8m12p3qcS06RpHyBZcYsRORVCd/drKFz6NLvLdCD0AChw/OnKEDjcUE9mPL
         N/HNkPb563fK2+VDlsY9/1sy7DZfrj5+8vNrxEfp1hrkgrlPOrZXfynO6NBKxnGjLvFj
         l6QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FkEZe2eM5D/PBhZiUZtNEejSaPg0lgjeIn5VScjYq/A=;
        b=FJC5Cj1W6Lg/wGn8nsD0/0suLXM7G4dKnC/OI3B3bnoFuQEHjxrjL1ZHpDrq3J9WSv
         Wj6Sal0twjsZTW7j36NxuMIFxT6CD7AdS0+JJWN8DeAHWOHDtgW6bMYAmoWoec84VSjT
         5VfslWF4b32Ny7qw2huLyktY7d1cTV72w04LJcrbG94Gv5oBqFTKJCoRsR2URQiv0Eiq
         pHEhLqiHcBbmRI94zFAf7tGGIa3uo84OBmguogwIDfxbMgiCrlL+mH/5ugCOIQJNcK8I
         vybUAe9hwAKaxihhhIOfsQIVr4EXS5UXMOJbX0ExNS910lICalNy5xJBuCutfYA7iGl0
         0e1g==
X-Gm-Message-State: AOAM530Maz8KfKSIKu461mIQ86BV93kXp1PD+/kwNXVzX7CdO7TyCWCj
	vpsO9QwvmbFfNliUvmIigCFUeCNKLBbDuQ==
X-Google-Smtp-Source: 
 ABdhPJxNUPaOCLBYY3dZdHJyRE/urQyfjDrn7GZvC1aOrFQjWb8VRgRfnCG/Da1bsUNbAHUq/7+3mA==
X-Received: by 2002:a63:4c56:0:b0:3c6:b63f:4bc8 with SMTP id
 m22-20020a634c56000000b003c6b63f4bc8mr11754188pgl.413.1652622588037;
        Sun, 15 May 2022 06:49:48 -0700 (PDT)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:48be:3d3d:c26:7949])
        by smtp.gmail.com with ESMTPSA id
 z22-20020a63e556000000b003c644b2180asm4961650pgj.77.2022.05.15.06.49.47
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 May 2022 06:49:47 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 17/22] s-nail: Set VAL_MTA
Date: Sun, 15 May 2022 06:49:17 -0700
Message-Id: 
 <eb37ec6ba87d78338c66ea1ec5f76a54891000ec.1652622481.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652622481.git.akuster808@gmail.com>
References: <cover.1652622481.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 May 2022 13:49:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97114

From: Mingli Yu <mingli.yu@windriver.com>

Some build server may provide sendmail like /usr/lib/sendmail which
may result the VAL_MTA to be /usr/lib/sendmail during do_configure,
but the sendmail is actually /usr/sbin/sendmail on the target.

Fixes:
  # echo "invalide address email" | s-nail -s "test mail" -r test@test.com tester@test.com
  s-nail: Cannot start /usr/lib/sendmail: executable not found (adjust *mta* variable)
  /home/root/dead.letter 10/234
  s-nail: ... message not sent

  # which sendmail
  /usr/sbin/sendmail

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit f334a009472136b266c4f72612b549846df20c0e)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../files/0001-make.rc-set-VAL_MTA.patch      | 48 +++++++++++++++++++
 .../recipes-extended/s-nail/s-nail_14.9.24.bb |  3 +-
 2 files changed, 50 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/s-nail/files/0001-make.rc-set-VAL_MTA.patch

diff --git a/meta-oe/recipes-extended/s-nail/files/0001-make.rc-set-VAL_MTA.patch b/meta-oe/recipes-extended/s-nail/files/0001-make.rc-set-VAL_MTA.patch
new file mode 100644
index 0000000000..f4decda141
--- /dev/null
+++ b/meta-oe/recipes-extended/s-nail/files/0001-make.rc-set-VAL_MTA.patch
@@ -0,0 +1,48 @@
+From da8c7a027390de7828d4272a3c8bcdbffbac25ad Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Thu, 5 May 2022 16:57:48 +0800
+Subject: [PATCH] make.rc: set VAL_MTA
+
+Some build server may provide sendmail like /usr/lib/sendmail which
+may result the VAL_MTA to be /usr/lib/sendmail, but the sendmail
+is actually /usr/sbin/sendmail on the target.
+
+Fixes:
+  # echo "invalide address email" | s-nail -s "test mail" -r test@test.com tester@test.com
+  s-nail: Cannot start /usr/lib/sendmail: executable not found (adjust *mta* variable)
+  /home/root/dead.letter 10/234
+  s-nail: ... message not sent
+
+  # which sendmail
+  /usr/sbin/sendmail
+
+Upstream-Status: Inappropriate[oe-specific]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ make.rc | 9 +--------
+ 1 file changed, 1 insertion(+), 8 deletions(-)
+
+diff --git a/make.rc b/make.rc
+index 98bd968..45ac0d4 100644
+--- a/make.rc
++++ b/make.rc
+@@ -96,14 +96,7 @@ VAL_MAIL=`\
+ 
+ # Path to the local MTA (Mail-Transfer-Agent).
+ # MTA aliases (aliases(5)) are optionally supported via OPT_MTA_ALIASES.
+-VAL_MTA=`\
+-   if [ -x /usr/bin/sendmail ]; then \
+-      echo /usr/bin/sendmail;\
+-   elif [ -x /usr/lib/sendmail ]; then \
+-      echo /usr/lib/sendmail;\
+-   else \
+-      echo /usr/sbin/sendmail;\
+-   fi`
++VAL_MTA=/usr/sbin/sendmail
+ 
+ # Today a lot of systems no longer use sendmail(1), but a different MTA.
+ # To ensure compatibility with sendmail(1), a system called
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-extended/s-nail/s-nail_14.9.24.bb b/meta-oe/recipes-extended/s-nail/s-nail_14.9.24.bb
index bc514b577a..539f9c3c82 100644
--- a/meta-oe/recipes-extended/s-nail/s-nail_14.9.24.bb
+++ b/meta-oe/recipes-extended/s-nail/s-nail_14.9.24.bb
@@ -6,7 +6,8 @@ LICENSE = "ISC & BSD-3-Clause & BSD-4-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=87266591c81260f10221f1f38872d023"
 
 SRC_URI = "https://ftp.sdaoden.eu/${BP}.tar.xz \
-           file://make-errors.patch"
+           file://make-errors.patch \
+           file://0001-make.rc-set-VAL_MTA.patch"
 SRC_URI[sha256sum] = "2714d6b8fb2af3b363fc7c79b76d058753716345d1b6ebcd8870ecd0e4f7ef8c"
 
 DEPENDS = "coreutils-native"
-- 
2.25.1


