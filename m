Return-Path: <fede@evolware.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D876C433F5
	for <webhook@archiver.kernel.org>; Thu,  6 Oct 2022 12:17:28 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web11.4956.1665058645603880705
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Oct 2022 05:17:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ISGQJEiR;
 spf=pass (domain: gmail.com, ip: 209.85.218.54,
 mailfrom: fede.evol@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id ot12so4197525ejb.1
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Oct 2022 05:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=fTqh8HQtauX9rqGAsSgYSNBDDs8ObIvUcsz3PWIBKlA=;
        b=ISGQJEiRbnHz7DCK6k25XVb+m9ez45Ro6mLJ4iWhRjj1h6Kn7ivoFhu1aEhh0Wy8IK
         WFKzBSMeTqEeQo/0VkzUsfVCBsHieOcyxy6K9mSlYnWxwnUSa5z++CIEOIVevqNDwnvw
         omDu25RDsMIlq8d+v89lxnsC8s/hzN1Tkvgpj8fvzf2wlEPRowxOVyxCnltBj16k3G/m
         l2J3umekZZJvWtVID64vhVN0Fp0Y7SfCmTx7I+08x+WPa8hiwkYu3wWPHl/Ejx/8C2p+
         2hk3loVoaXENOT84fL6cKGOLj9z5mflShNKKlVhOKH94MksemMkuG2UXUfv1lDwHuZYE
         vRug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fTqh8HQtauX9rqGAsSgYSNBDDs8ObIvUcsz3PWIBKlA=;
        b=q/+c/12FMuB7HZXgcv5zQ41KBlibhU9c3pS1H/XpLKJM4epyPhI3I6UjwH846ulA8u
         OHrYnpT++013AKejRc1lDNbeNWYdWPGmHydiiYU4/Usbwm58ppA1/Ys2hij1kfThpZny
         wn3kLWQspqp98aKU8Zg7o0BFqZm0wpL/ibIrMSjKBIDDjZbhsyrvrAvUsurFmyUPOZBl
         QN0V5V1B6zgzXMEjCUjEa/fMO2rZAzvIbYvx3bVy2CA3HjMb3Ej61RqkuWveZuPQEN1P
         oPCN4OjcAk6RjXUJAF3nePgcOOzIfpeCe3j2KRdRitoZgi2l6uwCCMazI4MNnN5bhCik
         SrGA==
X-Gm-Message-State: ACrzQf2xts+eQ7XZnIS0gIj1Kv6ZG+q5iA04HJpW1XZy+dWECdenkDsD
	s+hFTdQrd29OpynMbmzDuCfni1OjJ5wFFA==
X-Google-Smtp-Source: 
 AMsMyM5SmtQCgvrOV55T/k/tK9+4TDwPw6qhBqDNupZ17L3C9pr6MNbxX1xHZsbzhXoOxlgBls0M4Q==
X-Received: by 2002:a17:907:a0c7:b0:787:f13b:5533 with SMTP id
 hw7-20020a170907a0c700b00787f13b5533mr3674176ejc.50.1665058644038;
        Thu, 06 Oct 2022 05:17:24 -0700 (PDT)
Received: from interzone.fritz.box ([2a02:2455:e61:4a00:c805:5e99:7773:8f9e])
        by smtp.gmail.com with ESMTPSA id
 c25-20020aa7c999000000b00457160c3c77sm5619551edt.20.2022.10.06.05.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 05:17:23 -0700 (PDT)
Sender: Federico Pellegrin <fede.evol@gmail.com>
From: Federico Pellegrin <fede@evolware.org>
To: openembedded-devel@lists.openembedded.org
Cc: Federico Pellegrin <fede@evolware.org>
Subject: [meta-networking][PATCH 1/1] chrony: add pkgconfig class as
 pkg-config is explicitly searched for
Date: Thu,  6 Oct 2022 14:17:21 +0200
Message-Id: <20221006121721.10025-1-fede@evolware.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Oct 2022 12:17:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99079

The configure script present in chrony will explicitly look for
pkg-config and without the pkgconfig class it will fail:

Checking for pkg-config : No

This then affects the possibility (via image features or bbappend)
to use features based on nettle/gnutls/nss which strictly require
pkgconfig to be present and working.

Signed-off-by: Federico Pellegrin <fede@evolware.org>
---
 meta-networking/recipes-support/chrony/chrony_4.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/chrony/chrony_4.3.bb b/meta-networking/recipes-support/chrony/chrony_4.3.bb
index 083d2cbc0..6617164e3 100644
--- a/meta-networking/recipes-support/chrony/chrony_4.3.bb
+++ b/meta-networking/recipes-support/chrony/chrony_4.3.bb
@@ -45,7 +45,7 @@ DEPENDS = "pps-tools"
 
 # Note: Despite being built via './configure; make; make install',
 #       chrony does not use GNU Autotools.
-inherit update-rc.d systemd
+inherit update-rc.d systemd pkgconfig
 
 # Add chronyd user if privdrop packageconfig is selected
 inherit ${@bb.utils.contains('PACKAGECONFIG', 'privdrop', 'useradd', '', d)}
-- 
2.37.3


