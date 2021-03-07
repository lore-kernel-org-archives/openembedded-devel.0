Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web10.27976.1615156501445592531
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Mar 2021 14:35:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NfBvqSrd;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id p7so5057122eju.6
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Mar 2021 14:35:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bDBNTs/U1mEtank3TgCQ77D4ME6zKBlSRBzhrXYKeNM=;
        b=NfBvqSrdMKF/BeBM71It0VZsZW+XRQAsdHDheph7vkeS7aUbCrct6IHo905hRf6Mwk
         WinW8wEibPHYTONnTwIDphSZi+9F5IdQIC5grEtyqzervPs2lY+UfWndqKVX0VDhBuPH
         4OtDo3wg6qTe8uok+u0Np2K2sZ9viME5AVXVJN/9gNK3/tteJ0LsT7wzjSbKfA8AxRBe
         YxBF0BqxgDDLM9ObC4t++6lTHpvODykRnl3nBbkFMMeFpBA9m4gTktE248TK2Y3OctAU
         HuS+W2nij49AUcPeUjCuoZ5qL27EPFoGqm591mFyo6YtOG9hVd0UOvLiWqkhfLN0uPKR
         e1ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bDBNTs/U1mEtank3TgCQ77D4ME6zKBlSRBzhrXYKeNM=;
        b=SWWSUd/TY+Nn1ZBDHyGDfXIDFIfpsMSd2fgXV6ePlEnLMcr4CHhkUblmnjo8aQSplF
         K0fMJqkyk8IJzulg4/Lsx+AKSpS9IgHNZNBTJ20spPxncOjPoF7DsGXuwQohHIDZhJ0s
         j8m6N/gCk5zxNRQGkZY7rPcNQYZdneP41EPqVSff5sWrc1a+cZHjPSkg/pS6xoNy0/5h
         sq7Wi8KgAD8lVjzHNKZsHsnzY2DvNFir5LX/Vvjry30Q2aBljUav+XxfO9f4cBed77+6
         /xJPxtx2u3wVoAzjEQyL0FCHG1a33BkohmO6OD9m8ZTOMDGnnYL24OYSzvG9rJrJgR+M
         plrg==
X-Gm-Message-State: AOAM531mztRrZUdNMEWhj/J3q1MhifQBOPNMgkUFcFhZmL9uom8/7CUV
	8sZGdZkJsb73kqkQ0Oehh9ft9IE+8jk=
X-Google-Smtp-Source: ABdhPJzoeNvdEa+LC7x39kRvW8K+WfDvbpW5JRQufHUYUYoKOg2mRX5F/JigZDf44oMAM67CQqTNdQ==
X-Received: by 2002:a17:906:2c44:: with SMTP id f4mr251966ejh.508.1615156499706;
        Sun, 07 Mar 2021 14:34:59 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f3c4e6849043cb4c496f775.dip0.t-ipconnect.de. [2003:f0:7f3c:4e68:4904:3cb4:c496:f775])
        by smtp.gmail.com with ESMTPSA id mc2sm5501399ejb.115.2021.03.07.14.34.58
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Mar 2021 14:34:59 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 1/9] udisks2: upgrade 2.9.1 -> 2.9.2 / replace '_git' by version in recipe-name
Date: Sun,  7 Mar 2021 23:34:40 +0100
Message-Id: <20210307223448.1063315-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is a bugfix release, notable changes include:

* the /etc/fstab "noauto" mount option is now reflected in the org.freedesktop.UDisks2.Block.HintAuto property
* security: the recursive org.freedesktop.UDisks2.Filesystem.TakeOwnership() method call is now less prone to race conditions
* (e)MMC block devices are now always marked as non-removable and non-ejectable
* missing /etc/crypttab is now handled gracefully when adding or removing entries
* loop device setup fixes for recent kernels

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../udisks/{udisks2_git.bb => udisks2_2.9.2.bb}            | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-support/udisks/{udisks2_git.bb => udisks2_2.9.2.bb} (89%)

diff --git a/meta-oe/recipes-support/udisks/udisks2_git.bb b/meta-oe/recipes-support/udisks/udisks2_2.9.2.bb
similarity index 89%
rename from meta-oe/recipes-support/udisks/udisks2_git.bb
rename to meta-oe/recipes-support/udisks/udisks2_2.9.2.bb
index 196198c52..f9e127438 100644
--- a/meta-oe/recipes-support/udisks/udisks2_git.bb
+++ b/meta-oe/recipes-support/udisks/udisks2_2.9.2.bb
@@ -17,11 +17,8 @@ DEPENDS += "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 
 RDEPENDS_${PN} = "acl"
 
-SRC_URI = " \
-    git://github.com/storaged-project/udisks.git;branch=master \
-"
-PV = "2.9.1"
-SRCREV = "95444ab6bf2b8d8c205b540dded4029fcb15f91b"
+SRC_URI = "git://github.com/storaged-project/udisks.git;branch=master"
+SRCREV = "da6d9480fefeb0ffdf8a84626b5096827d8d7030"
 S = "${WORKDIR}/git"
 
 CVE_PRODUCT = "udisks"
-- 
2.26.2

