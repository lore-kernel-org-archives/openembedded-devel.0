Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web08.8981.1629857723101160018
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Aug 2021 19:15:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mzbI/QHD;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id c4so13402020plh.7
        for <openembedded-devel@lists.openembedded.org>; Tue, 24 Aug 2021 19:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IJc2Na3U4AuFHnF8tF5G6LJg0e3CakK2Q0Pm7C+47cI=;
        b=mzbI/QHD/sEqT8inSb7s3NtKPS+s6rq2CUvHfTGptgjpXTMuptM5FePLmbCZW+wUK8
         56h1EG6baLrL+IpDSQ3mcW9IsxW1DapF+MovYcY7geTIcE5OJyDaiQsnYSjaMaloQBn+
         W63afABtItS2+YNm/nOZ5Z7OfBWb1J3eSFYM7dAiEwP5M8sAU75ieP8+WyfpgUk2xZlg
         7hiZbvqz4+IuPslZVfQTBcNkkt8U5KLWsEzLdHoVe2LLRGS3cOgdTNZZEAOFWBWPfQ+U
         nJ02yvbzM2en05xFbG4H0tJ5qX4ETuL4wBYlaeLreQUMU6yX6m6ipn7DonG12HqiOcRw
         2pLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IJc2Na3U4AuFHnF8tF5G6LJg0e3CakK2Q0Pm7C+47cI=;
        b=ElH01HC9vVS+F9RXgoOF+IUBLxFgMOQe1VPtscjUVpgpqxYmD0/3NDUt6THLvahmKL
         jvt3wayCiWXuIbM29vhstCe5jxs0PxA2f3mTqexpHIk4tMts7F3u5SciAFtiNSuWkBJd
         fGkARMtsqoQzNOStnDCd557iGTSpNx474opUoNmzJrFu6hyZ2W4mFrYeQanCGGYIXJwM
         I5L9OGrTWTufaKeDV85FlpdS5jakDOJCd0kieEXsjgMywxkHRFNQN85EYtiwyo8/YP8O
         /9J73pF+3SFU9l0oVSkJQq+AbYvSaJ1CwlO5zU+IamhIZcpQRj8l/+ek4vVxg6SVPFvY
         wz/Q==
X-Gm-Message-State: AOAM533eLTkHXYV5GVG2Ke00cwHcWKWJxmY/Dd0ji85+1FZ7/QAnMhHd
	ZeaU1L62jUb1PDIaenCW0mp1wEZD6gc=
X-Google-Smtp-Source: ABdhPJw3bJjpGlrJdor4EZVCMTHvryCpZiRgY+ekxG8KpL777APShmF3GapfrvmrqdrBipYe5YY+lA==
X-Received: by 2002:a17:90a:8b08:: with SMTP id y8mr7796758pjn.173.1629857722168;
        Tue, 24 Aug 2021 19:15:22 -0700 (PDT)
Return-Path: <ticotimo@gmail.com>
Received: from thetis.hsd1.or.comcast.net ([2601:1c0:6000:1830::47f3])
        by smtp.gmail.com with ESMTPSA id c15sm20085198pfl.181.2021.08.24.19.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Aug 2021 19:15:21 -0700 (PDT)
From: "Tim Orling" <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <timothy.t.orling@intel.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <timothy.t.orling@intel.com>
Subject: [meta-python][PATCH] python3-django_2.2.x: only check upstream 2.2.x
Date: Wed, 25 Aug 2021 02:15:11 +0000
Message-Id: <20210825021511.1393477-1-timothy.t.orling@intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

AUH currently sees this recipe needing to upgrade to 3.x but we do
not want that. We are intentionally pinning at the 2.2.x LTS for this
recipe.

References:
https://www.djangoproject.com/download/

Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
---
 meta-python/recipes-devtools/python/python3-django_2.2.24.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-django_2.2.24.bb b/meta-python/recipes-devtools/python/python3-django_2.2.24.bb
index 2c0bcf720e..982362bdd1 100644
--- a/meta-python/recipes-devtools/python/python3-django_2.2.24.bb
+++ b/meta-python/recipes-devtools/python/python3-django_2.2.24.bb
@@ -1,4 +1,8 @@
 require python-django.inc
+
+# Pin to 2.2.x LTS releases ONLY for this recipe
+UPSTREAM_CHECK_REGEX = "/${PYPI_PACKAGE}/(?P<pver>(2\.2\.\d*)+)/"
+
 inherit setuptools3
 
 SRC_URI[md5sum] = "ebf3bbb7716a7b11029e860475b9a122"
-- 
2.30.2

