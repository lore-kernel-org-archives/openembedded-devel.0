Return-Path: <costamagna.gianfranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10C03C433F5
	for <webhook@archiver.kernel.org>; Fri,  6 May 2022 06:08:55 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.6252.1651817325529433399
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 May 2022 23:08:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NcH3vpDi;
 spf=pass (domain: gmail.com, ip: 209.85.221.44,
 mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id e24so8612032wrc.9
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 May 2022 23:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=e5dMxMXLo/tbBxwT9RynX6PNuvSObpkc/L8/eCAp9hc=;
        b=NcH3vpDiJW7sxoPFShKBj5CRBpsRaYHpbNnNmoBRMLJ59pIKcYf1qXHSaXBe61fRjR
         80KPk4dPGv80tMhErw6oCJ7ACgMyAMCHFxL4/lVw4cx63BI0Q0X3qYgr5cvqDc2fw8mo
         PxTTrvFY732bL3TTivwxEqJzsinajgfsDwwqldymom1niDS7fj8cbJ58CSJi3GKoR1Qj
         HGHdZdR7f97GkGgI8WlPORnMcO5SYPKGBOKYaG6tlkX8RB88Ft9jRFm+GC1uanVWC1kR
         OuaHTUlXaNNC5xFl9HcW0XDs3gF2JrxW4QmWgj5EgfOVSTw79BZ4qwPh6TIRXTAQjY8C
         HLEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=e5dMxMXLo/tbBxwT9RynX6PNuvSObpkc/L8/eCAp9hc=;
        b=rhA6Xlqv4fJ6R+WP0EazdLIg7zug42RikZQjGwmNHOYQiVIc+cKd8FLlzDy6B5uNaB
         vib7mutCvWsaWzgER15a+z8dO7MZonGQ3A7Bp5vmUgFln93VTWlcyLszE/P6XlGGUu7e
         aiYNtei+uTbFKTV/+MUq4wlgfspfqSkhpVU/UPBbnX77Vm1WTFQl4WPA8lHK3ySd/Y8h
         wRlDqbFSfWw0AYHq0HjB2UEyZt8YkW0uG/1j+IJb74xub9r6NzuJDYShgHr6L9K9+nmY
         aV5Dycm0SrsJzjJoAKZAkWlH3QV5DmsrswzriPer2+xQ8YzFYyuJSujytTmMuBw1Ido2
         bPUg==
X-Gm-Message-State: AOAM530v8V0b2IZBG+2fx1gIBRGSNwwbsRgY+DPF5EHgY/Q2HygtAL67
	w5fuFgf6w11JqZVq7yliMdZP/N4WABc=
X-Google-Smtp-Source: 
 ABdhPJyl6PBPjBCvK2c4cvKyV30I8ZDiNUyBStiGmF5BcaGubI0KMIShiyUhVMC6XD8NUpCRnbOykw==
X-Received: by 2002:a5d:6949:0:b0:20a:e021:f8e0 with SMTP id
 r9-20020a5d6949000000b0020ae021f8e0mr1310362wrw.231.1651817323513;
        Thu, 05 May 2022 23:08:43 -0700 (PDT)
Received: from Unimatrix08-Focal.lan ([62.18.178.29])
        by smtp.gmail.com with ESMTPSA id
 n7-20020a05600c500700b003942a244ee1sm3100859wmr.38.2022.05.05.23.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 May 2022 23:08:43 -0700 (PDT)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Gianfranco Costamagna <locutusofborg@debian.org>
Subject: [meta-oe][PATCH] vboxguestdrivers: upgrade 6.1.32 -> 6.1.34
Date: Fri,  6 May 2022 08:01:39 +0200
Message-Id: <20220506060139.801474-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 06 May 2022 06:08:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96969

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
---
 .../{vboxguestdrivers_6.1.32.bb => vboxguestdrivers_6.1.34.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/vboxguestdrivers/{vboxguestdrivers_6.1.32.bb => vboxguestdrivers_6.1.34.bb} (97%)

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.32.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.34.bb
similarity index 97%
rename from meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.32.bb
rename to meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.34.bb
index a8cf32658..5e0accb23 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.32.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.34.bb
@@ -16,7 +16,7 @@ SRC_URI = "http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2
     file://0001-utils-fix-build-against-5.15-libc-headers-headers.patch \
 "
 
-SRC_URI[sha256sum] = "5d11384200b4e943ad0056d2cf75980ae4bee852c89650e2914e1b34eedc2d2c"
+SRC_URI[sha256sum] = "9c3ce1829432e5b8374f950698587038f45fb0492147dc200e59edb9bb75eb49"
 
 S ?= "${WORKDIR}/vbox_module"
 S:task-patch = "${WORKDIR}/${VBOX_NAME}"
-- 
2.25.1


