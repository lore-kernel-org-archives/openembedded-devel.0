Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.23466.1623627168625915897
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 13 Jun 2021 16:32:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=S4kUOVb6;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id e22so7201584pgv.10
        for <openembedded-devel@lists.openembedded.org>; Sun, 13 Jun 2021 16:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id;
        bh=+RgR51+RF0EWtaZNTUqyBSMJBD38jj1cEa39h689OyA=;
        b=S4kUOVb6BbM4lBypaBU6PCrODMMuBbMHb1ZNAtWb5n+2doeLiJhYBh8GO0/rP+R2cF
         MbFP5U8Dqddi99iCY3MxU2AiBphSrFUydXG0qYivNifiuIvh/In1Eqj2glhkj9zX1V58
         HEr/emxnvK1oecb89M3E5jwUgYXweMCG8rx5moX05qVOOJKyv4WXtd6r5sfq0/g4qECk
         gQICJELQSUKHup6plA/16eAqGWO1fzdVQJhvlguOLPP8lcP2KlW4gVCbACHWaltR5nQR
         oAZabA2aytIh9WJVlxH/KCouMrEXNtDeSQ2i+f/TAHGu5jw9isHZOvUF5QAHw6vjvFck
         nuyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=+RgR51+RF0EWtaZNTUqyBSMJBD38jj1cEa39h689OyA=;
        b=COlrpXDpJH6P+RdBkMZ0zdK4nMn5/7u7TJdZq81saMKXm/nrHjbcS+6dgh5LdMt17N
         OaLuSOVpC+bG8ie3Ubi9KEqq+PjZYTcM4Aw3XGwhJQFQQm+TBhHez5mPCA0MCzuHspSD
         /a0+9edMkCUsg9/3pG6K/yW2JiRq+UjbHbh0CMOa+rz3iSerDB862Rky0o8ySayVse3M
         +dsiWf6dqnB0Ag4yd85GAmmQxvyBLuvYrpKT0Dk9rGNdQlPSvi74ggAugfmVBVAEK7cg
         2sCzNEvI7hG6zx2y9tIiyWMj2MnYkPVGu18j8FkDbR/Lyd8rJgwk6oyAAiIkChUn4H04
         tHUg==
X-Gm-Message-State: AOAM530+pBnkpCw8TZi/bYT8jw+5ADt+ehhlPRwLrG4Hkw+QQyPE3cM6
	Lcw/GH3Wr3Z4F01G0mOJh9Pb/f1DWm1Rrg==
X-Google-Smtp-Source: ABdhPJzrdDjSZvH6ciY6WF0QUBz3+ooE8Kzyr97jPWvl2fvRBcG1lhNFMZ30oKzpmKC/6XnRzP88lQ==
X-Received: by 2002:a63:1163:: with SMTP id 35mr14653387pgr.400.1623627167777;
        Sun, 13 Jun 2021 16:32:47 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:ed93:eb87:6dc9:a518])
        by smtp.gmail.com with ESMTPSA id gd10sm9933924pjb.0.2021.06.13.16.32.46
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jun 2021 16:32:47 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [Hardknott 0/5] Patch review June 13th
Date: Sun, 13 Jun 2021 16:32:39 -0700
Message-Id: <cover.1623627089.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

Please have comments back by Tuesday

The following changes since commit 9ee0e08ba2395b9cb93f2273bb1018adb3630407:

  libgtop: fix do_compile error (2021-05-23 08:29:00 -0700)

are available in the Git repository at:

  git://git.openembedded.org/meta-openembedded-contrib stable/hardknott-nut
  http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=stable/hardknott-nut

Andrej Kozemcak (1):
  squid: upgrade 4.14 -> 4.15

Khem Raj (2):
  mongodb: Update to 4.4.6-rc0
  mongodb: Change PV to 4.4.6

Marek Vasut (1):
  nss: Fix build on Centos 7

Stefan Ghinea (1):
  thunar: fix CVE-2021-32563

 ...0001-Fix-build-on-Fedora-Rawhide-772.patch |  25 +-
 .../squid/{squid_4.14.bb => squid_4.15.bb}    |   2 +-
 ...essage-bump-libmongocrypto-to-v1.0.4.patch | 714 ------------------
 .../recipes-dbs/mongodb/mongodb_git.bb        |   7 +-
 meta-oe/recipes-support/nss/nss_3.64.bb       |   2 +
 .../thunar/thunar/CVE-2021-32563-1.patch      |  97 +++
 .../thunar/thunar/CVE-2021-32563-2.patch      | 208 +++++
 .../recipes-xfce/thunar/thunar_4.16.6.bb      |   4 +
 8 files changed, 316 insertions(+), 743 deletions(-)
 rename meta-networking/recipes-daemons/squid/{squid_4.14.bb => squid_4.15.bb} (98%)
 delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-kms-message-bump-libmongocrypto-to-v1.0.4.patch
 create mode 100644 meta-xfce/recipes-xfce/thunar/thunar/CVE-2021-32563-1.patch
 create mode 100644 meta-xfce/recipes-xfce/thunar/thunar/CVE-2021-32563-2.patch

-- 
2.17.1

