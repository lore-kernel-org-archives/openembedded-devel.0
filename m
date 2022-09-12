Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 780DBECAAD5
	for <webhook@archiver.kernel.org>; Mon, 12 Sep 2022 06:01:47 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web08.4452.1662962504559761153
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Sep 2022 23:01:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lSdEEDoq;
 spf=pass (domain: gmail.com, ip: 209.85.218.54,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id lz22so17667013ejb.3
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Sep 2022 23:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=o213WMFmyuWF84u8h/CqCIenZw/RHwiSSMmgj8oXUbg=;
        b=lSdEEDoq2rkNR2zKS52B5gvaBG+w2E0g5a5v+cuT0GT1EM3DgXh7RH8WOKWYMGYNfY
         9F3ajOxJwPjSR8BKaCxC7qiQkOaXfBwIODW+wOEB3ftduTZh9tBct5JU292yux07gS2F
         VSsdzv2981CIX2nsPrSgkdSoPWCYVahxDKEBTYOnGiUYewbUhiKDM2L6KOSGHiD1/1RI
         fzypwhxJJgFPKMWOaGxBYlHfRalIWCIikFVsdaqVwAu40a8EMXqKCug2e/vlQ9NeqkX+
         CEy5ll5Ifz9sGUTzjLpGscdcgS99TQmwYGUK68HyljJwypJ5P493eG6E5Z2stjaxo2dO
         X3JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=o213WMFmyuWF84u8h/CqCIenZw/RHwiSSMmgj8oXUbg=;
        b=cCEWupZkhNUXK0p1bQlQVXnapFpiYT00mmUE/Hyj/ChGaYczBxiK/YELzBAP+y8EgI
         EBqdqhHt+jPTUwtapy+kxjeOpvP8vyvfa+BYCOtE8fwtRXSwivouQYr8ClIBemliIHsS
         J3wkYbNnDoST4bG5xKAda0FjPQi4YlqTGnsCamGi3bpQnTzGnUeTfBQBWeffdqqin4PF
         xTTNrVPG6ZXeMzgZsmQt6RXxxXwLh2pGl2SoQq/dyCTFSZDPpArjmSo31bij/8mRvOf0
         sOnNiP+tmu6SWba9nBfs57yFs/VxqWXaJiwgHVn52TnWIsUnY6Ug3eJhT6fKH9iSgiqC
         UHHg==
X-Gm-Message-State: ACgBeo0V13KdrVVBWQcUjLTDGMQZm3k0L91UJbxWXNxz09Lb7gvJ6RII
	sy9PHSyqFVIdHEEyEyf++wiHtaCRCd4=
X-Google-Smtp-Source: 
 AA6agR6C5sv8EzmT1Iu8XzmuR4LWDUiR6VZs4Mjc2VxWdH4TNOviCXSOPxTP4v4cJx/Qk11rpZ5j6Q==
X-Received: by 2002:a17:907:7249:b0:77a:1198:f210 with SMTP id
 ds9-20020a170907724900b0077a1198f210mr9508812ejc.33.1662962502578;
        Sun, 11 Sep 2022 23:01:42 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id
 x20-20020a170906299400b0074a82932e3bsm3856898eje.77.2022.09.11.23.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 23:01:42 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCHv2] lvm2: use bfd even with ld-is-gold in
 DISTRO_FEATURES
Date: Mon, 12 Sep 2022 08:01:37 +0200
Message-Id: <20220912060137.98021-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: 
 <CAMKF1sqQydhJ22REL76JFff4Ft80_Sw9UPf2qBTkD=B=yO-ckA@mail.gmail.com>
References: 
 <CAMKF1sqQydhJ22REL76JFff4Ft80_Sw9UPf2qBTkD=B=yO-ckA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Sep 2022 06:01:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98748

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/lvm2/lvm2.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index 34e57ec7a5..277e76f0d2 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -57,3 +57,7 @@ EXTRA_OECONF = "--with-user= \
                 --with-thin-repair=${sbindir}/thin_repair \
                 --with-thin-restore=${sbindir}/thin_restore \
 "
+
+# gold doesn't like multiple dm_bitset_parse_list definitions in libdm/.exported_symbols.DM_1_02_138 and libdm/.exported_symbols.DM_1_02_129
+# after it was uncommented in the later in 2.03.12 with https://github.com/lvmteam/lvm2/commit/60eb608d66c2056a78e81f27db3da14139d9faab
+LDFLAGS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', " -fuse-ld=bfd", '', d)}"
-- 
2.37.3


