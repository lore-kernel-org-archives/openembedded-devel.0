Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E18EDC07352
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 07:34:57 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web10.32224.1699860892082397216
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Nov 2023 23:34:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lIPxmcyk;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-5bd306f86a8so2637397a12.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Nov 2023 23:34:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699860891; x=1700465691; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U7bpYVxr+ogQWJ5eRXZXPz9QTmnZCIaMqpQaukn955U=;
        b=lIPxmcykzLqzxtOv2CrkFwYP+dGlaWicIXITQN7nSN95g0Fo+/rPhDr5jdNoDlB+vW
         7PjYyamqRhGFBZILh8/HLHiBpdPMiDGFfK20UkQQtBFHkgoDldU4ppd+iSArca0LpsfS
         xmOP9DgTNgPQ9okivfKljMqiuGmRzKRAug8lEsPtuSShhJCJp65PuJe6jiXzAXoE7HSS
         ncoynWuruU5LKNsjd9LxSwHeCzJE92/G5IKUZd49H99SiDTeEafcubF8Gi6+menXq3DZ
         6clscL44TQGPf7QW10aNwfmhP4Sc8P8G8Q1A7rCUKtzHA0b2ORjOdHqs/LsuF5Ee0ZNe
         CP7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699860891; x=1700465691;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U7bpYVxr+ogQWJ5eRXZXPz9QTmnZCIaMqpQaukn955U=;
        b=p9E3+sQkBhHCNHuahDtg6zpPQHP0cJ2L0s7irl3SGL7SR2lvCKhGkfJ9+BQv5K8aR4
         CwZ3PqM94TzR0of6A7mHt8pBbqR3RRRffvkN835DlzweEhZnZyiotAaKZDXwpGb0Z2mC
         do8qgSTodDGYDJT6q0Sg+PEE7mi4rGf2vXmVNwrdTuVP30CNBdLc1Yuq1UW+F3+Gy2ym
         mWDKIVBlMi6BdMO/BMhnblNT54AGyRPamverT5WNBSzEooR3HfwqNthIrmf08LlhLXqD
         TEZS/igZHEO3S1YITm+YZ1QYPoGU8sL45+Jrd6nxI3e/vm3og+XQijv9d9EEv5YB8lkp
         Uh9w==
X-Gm-Message-State: AOJu0Ywht5Iu97YDRo/Hwz3hXm244yeCuiUh6E6luEXul/mCaOyotZXl
	pPtX0FFetrbPzReCGnLc8Lfayg9C9X+YEg==
X-Google-Smtp-Source: AGHT+IHPgIyyyA4bD10lm6dRDtmyqhZyoBF46G0OjimYKiAIupeVQgy59f7jf65d3oOHf/ETbmvE/g==
X-Received: by 2002:a05:6a20:dca0:b0:174:210c:34b0 with SMTP id ky32-20020a056a20dca000b00174210c34b0mr3387327pzb.0.1699860891384;
        Sun, 12 Nov 2023 23:34:51 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::62f8])
        by smtp.gmail.com with ESMTPSA id q9-20020a170902dac900b001cc50f67fbasm3509691plx.281.2023.11.12.23.34.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Nov 2023 23:34:50 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 12 Nov 2023 23:34:47 -0800
Subject: [PATCH v3 3/6] toscoterm: Skip recipe, slated for removal
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231112-kraj-pu-v3-3-51f4c8091bc8@gmail.com>
References: <20231112-kraj-pu-v3-0-51f4c8091bc8@gmail.com>
In-Reply-To: <20231112-kraj-pu-v3-0-51f4c8091bc8@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>, 
 Otavio Salvador <otavio@ossystems.com.br>
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 07:34:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106629

It needs to be brought forward to work with latest, it fails
to build with vte9 0.74.1 in meta-oe

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 1 -
 meta-oe/recipes-support/toscoterm/toscoterm_git.bb         | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 639388dece..fafa247772 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -891,7 +891,6 @@ RDEPENDS:packagegroup-meta-oe-support ="\
     pcsc-lite \
     pcsc-tools \
     sharutils \
-    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "toscoterm", "", d)} \
     sg3-utils \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "uim", "", d)} \
     uchardet \
diff --git a/meta-oe/recipes-support/toscoterm/toscoterm_git.bb b/meta-oe/recipes-support/toscoterm/toscoterm_git.bb
index b9f26051a1..654e886cab 100644
--- a/meta-oe/recipes-support/toscoterm/toscoterm_git.bb
+++ b/meta-oe/recipes-support/toscoterm/toscoterm_git.bb
@@ -27,3 +27,5 @@ do_install() {
 }
 
 RDEPENDS:${PN}:append:libc-glibc = " glibc-gconv-ibm437"
+
+SKIP_RECIPE[toscoterm] ?= "Needs porting to work with latest vte9 >= 0.74.1"

-- 
2.42.1


