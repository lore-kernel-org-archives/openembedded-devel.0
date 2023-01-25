Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A573BC61DA0
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 13:31:56 +0000 (UTC)
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
 by mx.groups.io with SMTP id smtpd.web11.44964.1674653488006792407
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Jan 2023 05:31:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LipCsK81;
 spf=pass (domain: gmail.com, ip: 209.85.161.41, mailfrom: akuster808@gmail.com)
Received: by mail-oo1-f41.google.com with SMTP id r1-20020a4a3701000000b004f2b4f8200eso3141685oor.7
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 05:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kp38h/Ml8IZeNDEvF3wuByQ5RM3SBvUJHI78Pc2rlZQ=;
        b=LipCsK81HUQyEj886SCULeqgC9msOenmFmo1If7xOPNaAaJ5N/y6KnZJKasEkxrZKu
         2TBNP9dKEz/0bB9NCaCIL39k8FJppqU20EdivMzTBO45r0CwOsNa47riVvcyEd0RtdWz
         qrdhzDInjHVtjBFyW2d7eAOMDO9suM7B4LCYWbHHirf/H7+PoZkiO0KkUnH2NuQwdU2R
         JoXhL5EKdGiAa06vZh8egzSueK32fbrdDgTIM2MY0AG8ZNUQjw1AMn5l43dQ1S14i6sf
         2QW9t1nutUkGEH90pWvX7tgNHo/bZwLOIfzpUagn6Gx10jky0a4r50nMB+PHWj2ZNHPl
         uYYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kp38h/Ml8IZeNDEvF3wuByQ5RM3SBvUJHI78Pc2rlZQ=;
        b=4n1/imaH6DHO1EgVfR3xCEvje3ljeUFqvfByGuNAZ5CnaDNfHDbGOzDA5Y0OmGckTx
         hkrelSBjaZcTo1jjSOCMbF92hrI5VC1wDBnKqqVNfMKNkahvEFRpzhZ2y5Aaq4QTGrB9
         iMFKnmcL0phqn/Ji9cmGplZG66Pbfia9YHUJhkG1jYkjw+4AkPETBtHZKapusWJbYnix
         4RpTLJ2nwqg+gY1wipKT0jEowAkNtNP61oC7D+fA2TqigQyDsxCERFWZ6F8khdNv3Dbu
         4xi9WvYG3aws5w943h2+DaqiDP8eU2qXr4EujX7yD4hPVE6kfzXjzmCwfZucp/y5kpiw
         2+9w==
X-Gm-Message-State: AO0yUKXTntEi0C4CHdS3OPGQQrXvySgzpegOMLnZSLcVrRFk1ezlPeQe
	I2CaA/LMB0MoMTaOJWoFMq2qU/wL1ks=
X-Google-Smtp-Source: AK7set8z+Xzucx7p/uTmTL83Euadao4msrwPU1VaveF2OiHkPQKCBoN+fCqc34xdHTky1IvOMiE3mg==
X-Received: by 2002:a4a:88d3:0:b0:511:f3d2:bb8d with SMTP id q19-20020a4a88d3000000b00511f3d2bb8dmr792827ooh.5.1674653510999;
        Wed, 25 Jan 2023 05:31:50 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:434e:23f3:d1f1:25c3])
        by smtp.gmail.com with ESMTPSA id b43-20020a4a98ee000000b0051134f333d3sm914383ooj.16.2023.01.25.05.31.49
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 05:31:50 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 24/41] networkmanager: install config files into correct place
Date: Wed, 25 Jan 2023 08:31:06 -0500
Message-Id: <43e318de2ff3135054233864d2cb95b2d50ca6ea.1674653280.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674653280.git.akuster808@gmail.com>
References: <cover.1674653280.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 13:31:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100759

From: Chen Qi <Qi.Chen@windriver.com>

The current location has no effect, because NetworkManager
is not looking for config files there.

In meson.build, we have:
  nm_pkglibdir = join_paths(nm_prefix, 'lib', nm_name)
  config_extra_h.set_quoted('NMLIBDIR',          nm_pkglibdir)

It's clear that the configuration directory should be
nonarch_libdir instead of libdir.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 15893f46f8af8c91d922fa41f9a1f537d92aeb9a)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../networkmanager/networkmanager_1.40.0.bb                   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.40.0.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.40.0.bb
index 110b499aaa..b9273ac89e 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.40.0.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.40.0.bb
@@ -295,11 +295,11 @@ do_install:append() {
 
     # Enable iwd if compiled
     if ${@bb.utils.contains('PACKAGECONFIG','iwd','true','false',d)}; then
-        install -Dm 0644 ${WORKDIR}/enable-iwd.conf ${D}${libdir}/NetworkManager/conf.d/enable-iwd.conf
+        install -Dm 0644 ${WORKDIR}/enable-iwd.conf ${D}${nonarch_libdir}/NetworkManager/conf.d/enable-iwd.conf
     fi
 
     # Enable dhcpd if compiled
     if ${@bb.utils.contains('PACKAGECONFIG','dhcpcd','true','false',d)}; then
-        install -Dm 0644 ${WORKDIR}/enable-dhcpcd.conf ${D}${libdir}/NetworkManager/conf.d/enable-dhcpcd.conf
+        install -Dm 0644 ${WORKDIR}/enable-dhcpcd.conf ${D}${nonarch_libdir}/NetworkManager/conf.d/enable-dhcpcd.conf
     fi
 }
-- 
2.25.1


