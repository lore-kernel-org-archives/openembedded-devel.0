Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
 by mx.groups.io with SMTP id smtpd.web12.3634.1617934874950215335
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 19:21:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NYtHRzvG;
 spf=pass (domain: gmail.com, ip: 209.85.210.48, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f48.google.com with SMTP id k14-20020a9d7dce0000b02901b866632f29so4335733otn.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 19:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=AZmBosKMww7o2E0vwpmX+IIBtsb4w/EKwcqMO3g3NVs=;
        b=NYtHRzvGvqC0uhxvqxFTZdX/U0T7Cyd61WNZMI0QQf+UIKxoByI1mEpXiR9vs3fMgB
         bizSWwvfQCY0zSgtz6DE9xvIjxVPk2lrg2TzRbTap33V/ddMTzYItURohw5gukPIsYn5
         IbTZsIc5Eg/KI8tbd6Rdp08GaPiQBZvZrn9X80/KP6qX+BkHxeD9SUQ0Sr0IR/6cZQy3
         +8Y67L4HAuOAwlpteyywnf65r6u5IRDPup5CTCQVHLkrcJk8IDNYZ2seLVROjrNnWrav
         GZsClfkaYOLwnepFf0JzxYqoYtO1eU47J3zchvc5j3oWZnO//YMCuOmqdrjrtaCFAqb9
         OGQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AZmBosKMww7o2E0vwpmX+IIBtsb4w/EKwcqMO3g3NVs=;
        b=SpYo11nfcIfXpP/MayZ4ltIHn6nwL075tcEz6jmglFyaLK3nxYYAZ9VqqXWPzLslrh
         RbzfSbtcfq3o6WeyyMN0XG3PC/ANlGFTpD4R1bX1r6RkS1dSkM6RDnzZzXgTM4f30XQD
         2OnICnnZ5J1kPz/VEWS+AjpEizGqen+ea0kkijnSjvxrNwLpfmnzrcJWcLX8jM41k0WA
         l/2avlgzgz9Qvm/LR9jU/rM4llSwD40nnTo+da1E+Nq/L/eMGQReLl7UZrxRA/E+a+jG
         85FRlclJY7DEJooOPPA/gBRa2KlEmcSxq4Uw7iHlM4BbuH5iTpCjpcJtu8Y/5VkFPKV/
         sf+w==
X-Gm-Message-State: AOAM5320hfbHgOWk5o5Hj2D0zALOH+7emHNmlV2z21ZtX1zd5s+2c4dX
	+ZaMJ35dLcejwlCjGN8IMkQgzD7trS0=
X-Google-Smtp-Source: ABdhPJzayjqSnLwXDqzH9VOW5oWWhKji7bh7Mvi/ndioBzQxnpetPt21wtsM+4lN9opHCu2EjjMU9Q==
X-Received: by 2002:a9d:600a:: with SMTP id h10mr10498219otj.90.1617934874166;
        Thu, 08 Apr 2021 19:21:14 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id k65sm299815otk.53.2021.04.08.19.21.13
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 19:21:13 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 24/36] gigolo: upgrade 0.5.1 -> 0.5.2
Date: Thu,  8 Apr 2021 19:20:37 -0700
Message-Id: <35c2cf73f905384a36428a5b6211ca2fae5e9487.1617934043.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617934043.git.akuster808@gmail.com>
References: <cover.1617934043.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andreas Müller <schnitzeltony@gmail.com>

Release notes for 0.5.2
=======================
A bugfix and translation update, a new icon, various cleanups.. thanks
to all contributors !

======
- Update TODO
- Refresh Glade file, drop unused tab labels (fixes #13)
- move the logic setting GtkSpin port value to setup_for_type() (#11)
- Use new icon in window titlebar
- Fix compilation warnings
- autoconf: Some updates
- Only show an error dialog if the host field is visible/required
- Remove capitalization from icon name
- Update GenericName (#2)
- Fix comment style.
- Remove GSourceFunc casts
- Update Makefile.am
- Add gigolo.ui to POTFILES.in (Issue #6)
- Added new icons following new style and reverse DNS format.
- Add new README.md and update AM_INIT_AUTOMAKE
- Add basic GitLab pipeline
- Bug #16717: Move from exo-csource to xdt-csource
- Translation Updates

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit e2add121d2713ca72f3c4cf6ae2d557dd4cfc062)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-apps/gigolo/{gigolo_0.5.1.bb => gigolo_0.5.2.bb}   | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-xfce/recipes-apps/gigolo/{gigolo_0.5.1.bb => gigolo_0.5.2.bb} (67%)

diff --git a/meta-xfce/recipes-apps/gigolo/gigolo_0.5.1.bb b/meta-xfce/recipes-apps/gigolo/gigolo_0.5.2.bb
similarity index 67%
rename from meta-xfce/recipes-apps/gigolo/gigolo_0.5.1.bb
rename to meta-xfce/recipes-apps/gigolo/gigolo_0.5.2.bb
index 1233fe0693c..517f1f4c506 100644
--- a/meta-xfce/recipes-apps/gigolo/gigolo_0.5.1.bb
+++ b/meta-xfce/recipes-apps/gigolo/gigolo_0.5.2.bb
@@ -7,5 +7,4 @@ DEPENDS = "gtk+3 intltool-native xfce4-dev-tools-native"
 
 inherit xfce-app
 
-SRC_URI[md5sum] = "94e89ad3fabba7167760004b64062f4a"
-SRC_URI[sha256sum] = "ca87badb5871e4844579704704ea9e5ede444f710a3b264c12b60b2a0e48e14e"
+SRC_URI[sha256sum] = "e34a1aa0755f9f6c234c7d24b23a6cecd6ef50741d79da3bb6f698a2281dbbc3"
-- 
2.17.1

