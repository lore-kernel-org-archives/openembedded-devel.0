Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D79EC0502A
	for <webhook@archiver.kernel.org>; Tue, 30 Aug 2022 21:37:17 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web09.18010.1661895431748408345
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Aug 2022 14:37:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=X157ZyDy;
 spf=pass (domain: gmail.com, ip: 209.85.214.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id l3so12346377plb.10
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Aug 2022 14:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=v4eod89ckCRFfpK2N2CHqqzl92mX2x3ONDLPEj7zHFc=;
        b=X157ZyDy5BiOKBtd5uErt5mDs6VWvltS0w5vWixn9ZSBmgP4GcQYwhaXejYrPaD5vc
         5/MQ5E1O7qgnQ8FnsTTD8vJL/+cozeBwgj3Lgk8XCJShdUXrUmc1Ej14qUdwRW+2L3ur
         3Rtjls3f2ThAQeMv6J82YfLFdCpQ0Y3ZYO2cmNtdS08r9h00EvQp+gKNW16ttAQkXAnv
         5c2WgxoaFzEEhZvr8V0iinazH4Oi1R3FIpmOE00CzhwhR4ZdugsCZEnFRlP+jtuCVCNJ
         1AEmVE+Lc9ICindNOjf6oBKSIfwfcJSAEXiqvbmq8YVjzY5KVBnHb/Vk6mernQ3lilVN
         Ayrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=v4eod89ckCRFfpK2N2CHqqzl92mX2x3ONDLPEj7zHFc=;
        b=09qw7uzT1lOwII1xm5j2iNupTM+WqRQ0tlh2ScL8nHQrHpZ1wC15AddFXacR+Ul/PL
         t53JyhQoUhBaZzO7rrcJF1yYinhdkoHwfvXBHNNCeY5k0lGUdHzDu85pbg7pchiWRmjQ
         RKaRRbKnLiXjpUJkp5obiBAkBcsUEQhjFP8eBgCSFQ+A175DoT8eSJ6eefyMO7XFDT3I
         B8Wu5e2KCdRBMRyyeaXEqe4qlXmSwUgv7CpezNiZNQ4YVqy5z2kV7EfS8cH4h9FdWH28
         10fh6o0LZbfZ+GPOAIqC/H1r/H5KFdCUlhQU/qTkszcUz5o5bZ/Pi6wzrIOaxDsPYkQp
         jIKQ==
X-Gm-Message-State: ACgBeo31H8kEl9pklvttpl+L/wUPb5/BUdaMG2au02Sgvagw0Usi1rMd
	H8Q/U0v+bvtEWhf1TcMnPOSXZxbOtkssgQ==
X-Google-Smtp-Source: 
 AA6agR6v1uHsQNvh0QKeNvaKfvQTv9607gS8hFMjxtX3ev1wdQq0DYZBPqpKLY9kGjmIprnLdN8lQA==
X-Received: by 2002:a17:902:ecc6:b0:172:cc88:18df with SMTP id
 a6-20020a170902ecc600b00172cc8818dfmr23345565plh.167.1661895430985;
        Tue, 30 Aug 2022 14:37:10 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::24e6])
        by smtp.gmail.com with ESMTPSA id
 n6-20020a622706000000b005385109fe5fsm4155250pfn.81.2022.08.30.14.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 14:37:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 2/4] gnome-keyring: Upgrade to 42.1
Date: Tue, 30 Aug 2022 14:37:05 -0700
Message-Id: <20220830213707.1413842-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220830213707.1413842-1-raj.khem@gmail.com>
References: <20220830213707.1413842-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Aug 2022 21:37:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98565

Package systemd user unit files

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{gnome-keyring_40.0.bb => gnome-keyring_42.1.bb}           | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-keyring/{gnome-keyring_40.0.bb => gnome-keyring_42.1.bb} (92%)

diff --git a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_40.0.bb b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_42.1.bb
similarity index 92%
rename from meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_40.0.bb
rename to meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_42.1.bb
index a30303cd8c..5937e74423 100644
--- a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_40.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_42.1.bb
@@ -21,7 +21,7 @@ inherit gnomebase gsettings features_check gettext
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-SRC_URI[archive.sha256sum] = "a3d24db08ee2fdf240fbbf0971a98c8ee295aa0e1a774537f4ea938038a3b931"
+SRC_URI[archive.sha256sum] = "c7f4d040cc76a6b7fe67e08ef9106911c3c80d40fc88cbfc8e2684a4c946e3e6"
 SRC_URI += " \
     file://0001-Set-paths-to-ssh-agent-and-ssh-add-by-configure-opti.patch \
     file://musl.patch \
@@ -41,6 +41,7 @@ FILES:${PN} += " \
     ${datadir}/xdg-desktop-portal \
     ${base_libdir}/security/*${SOLIBSDEV} \
     ${libdir}/pkcs11/gnome-keyring-pkcs11.so \
+    ${systemd_user_unitdir} \
 "
 # fix | gnome-keyring-daemon: insufficient process capabilities, unsecure memory might get used
 pkg_postinst:${PN} () {
-- 
2.37.2


