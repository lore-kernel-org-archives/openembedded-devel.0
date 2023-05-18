Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 454C4C7EE30
	for <webhook@archiver.kernel.org>; Thu, 18 May 2023 10:12:46 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.13502.1684404758238555976
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 May 2023 03:12:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=c35dmTHl;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-965fc25f009so326686966b.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 May 2023 03:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684404756; x=1686996756;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GjVYqWsdbsIs3Rx3mUy5cObZqEMz/nUKXEJjJSHdu4U=;
        b=c35dmTHlC+l/fQJZu6SZKzTLrK2NzodMu3l6npaBZpcyQVOdStwJiu76s9seB8M4K8
         eoEjxq8tgIQlVxwGek41edJZpfDpTddS0qduVYZBNWsjUulmnzioCNkRfZ7/tyruVFWw
         9nGDqvBz/hSlh1hWnyAfjL3Mdt3x/Y22hMm9ya3bqhzmfHfV76Kn0jJxq9tYwAK00cM4
         nfiwgEqvgYtBnQshWpqIBzej58QLYWTewJJsH1tO76BskeJdM0z0RUvub9KyJEaVC1BT
         q865WcQsEe0W80Q2df4xYe+H7cFF7ofRj1tFbEAPT1vBl773bN4EBxhATiwNTKeiOLon
         mZ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684404757; x=1686996757;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GjVYqWsdbsIs3Rx3mUy5cObZqEMz/nUKXEJjJSHdu4U=;
        b=C/hVn6gC9DGJbOSWHipKT6MwDWA5d2gnFs4rMl11fHXTnLrkndITJdFjfVe1amHKKh
         4oUN/rIrKP0o9hnHhtb7/LrKsEmvP2VXsVCZ8ytYjh6E8NrOxU/fFelRlMhDg6PukLJi
         cZ1vb5A9Dqu71hwuBZNC8KZ/e5JGzzo7A5cJepUAANpJ1cS8FSai75EQlMMnGhwvgRI+
         p2ips8XZ5fnbnb5RgaSfFVNk++p6kkwbeb8RfTYK4PFVer7TK5OmjTa1KyJOvx4vxn1j
         ip8XhGh4HOLCEeD+S/qBEDliog4cS8X/0Y0gEA+plFlUOIAksy17ueiQp9HjbM8rtcgb
         v67A==
X-Gm-Message-State: AC+VfDxfjTLVfnlWw6jj7zMpIOxkwOZNVnHUXNNotWl+xl6PZ28NkF16
	lKrNYxuZSBqjftX6wxKnoC8jhEl5AJw=
X-Google-Smtp-Source: ACHHUZ6WOKb+s79WF7Ruy22DGpWo38Q3ZyKYK9l2u456MnBxPXyPg4fWUuHWPtaTROO4QjT2tQj04A==
X-Received: by 2002:a17:907:7213:b0:96a:b648:8d5f with SMTP id dr19-20020a170907721300b0096ab6488d5fmr19003525ejc.53.1684404756518;
        Thu, 18 May 2023 03:12:36 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id n16-20020a1709067b5000b0096b0e93193asm772363ejo.90.2023.05.18.03.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 03:12:36 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH] networkmanager: enable vala only with GI_DATA_ENABLED
Date: Thu, 18 May 2023 12:12:33 +0200
Message-Id: <20230518101233.3885135-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 May 2023 10:12:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102657

* cannot be enabled without:
  http://errors.yoctoproject.org/Errors/Details/704353/
  NetworkManager-1.42.6/meson.build:816:4: ERROR: Assert failed: vala api require GObject introspection. Use -Dvapi=false to disable it

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../networkmanager/networkmanager_1.42.6.bb                    | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.42.6.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.42.6.bb
index 31687a30b9..2412775cf1 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.42.6.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.42.6.bb
@@ -70,11 +70,12 @@ do_compile:prepend() {
     export GI_TYPELIB_PATH="${B}}/src/libnm-client-impl${GI_TYPELIB_PATH:+:$GI_TYPELIB_PATH}"
 }
 
-PACKAGECONFIG ??= "readline nss ifupdown dnsmasq nmcli vala \
+PACKAGECONFIG ??= "readline nss ifupdown dnsmasq nmcli \
     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', bb.utils.contains('DISTRO_FEATURES', 'x11', 'consolekit', '', d), d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez5', '', d)} \
     ${@bb.utils.filter('DISTRO_FEATURES', 'wifi polkit', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux audit', '', d)} \
+    ${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'vala', '', d)} \
 "
 
 inherit ${@bb.utils.contains('PACKAGECONFIG', 'vala', 'vala', '', d)}
-- 
2.40.1


