Return-Path: <michalwsieron@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A61A2FC9806
	for <webhook@archiver.kernel.org>; Sun, 29 Mar 2026 21:39:06 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37388.1774820338113554676
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Mar 2026 14:38:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=fmBlnjuN;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: michalwsieron@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b79f8f7ea43so747957866b.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 29 Mar 2026 14:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774820336; x=1775425136; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cw04602w1ws7BkNyTyDWix1U78x6dT8jfaAk1mTY9sA=;
        b=fmBlnjuNYWZoBXOBlij6fECIyp6BnrVvHwNYvwP4GtkVoDZNPmzop5YHrE3LSDCl1o
         Kjt8detIANlcDHeXubhEV3qnBZQiI/NnycjX3dGnHdxomFPe/Fc1gwNuWQlql2I/um/K
         1WmAf7Kt+9Imx29fZcMoRdcRYI664zWfpGhy1bz/pR9UjKznNMbaOJ/tETMtoieemVRI
         GPsGzFLBWNh5Ze5C82x7OaXeWXvdA6FUVuc8O7j28awpuwaogmRLWK3Xqib3xnrsG93W
         6R7q70hAp7Jm1gTD7KbV11wgRIDZpicfLPVFcMHrAlhz6IhmkHVzW4z+9nkn+rioJGGT
         uIqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774820336; x=1775425136;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Cw04602w1ws7BkNyTyDWix1U78x6dT8jfaAk1mTY9sA=;
        b=lAzut3kDpOPVIpQFzc+ON+MGqRd4uQWEUqBynTealYUjpVNSJmde3bBNr1TWwIJ18w
         py/ZQ/L/Y8d3IB/oCzwxLnAIEwTyd+Z9cuu7yF/ijtLsWyzLKLZZJVbBIKFZtg7Ohqnh
         bKVHZ5pvnvUwWOPyVmvkaf85LV3tGjKwItRCp1M2VIXXRPv7ovxiNks0w/Gt0JwPaoxr
         3khH0QE/GjkalGm/Q7TnVz/I13t3ZNiKyrOSrQzjpR7kvxCvFYosmn1Tez7vBqPQzBdV
         90IHEl/rj96IryQmcQHwm/iKtHLdaR9NB7jMRaOAkcXgDVKgi2SaTfMh2MVJHjq/R+jt
         Q2oQ==
X-Gm-Message-State: AOJu0YyLdj3WGlZcDSNg9WqbaHekLfsQJBoyN0xBTrnWI4O6sXgIRs/Z
	KLNFR/0a/EDkWx8FmIcDSP5C3RNwI7cyFbFImKBgbdxdIgKw8cc+Fz12iKiA9A==
X-Gm-Gg: ATEYQzwMpNFzx3LohN/6wwf6RbJ8nZPQply1fmous1Racr5FLkBBbFH68J6yGZkTrCJ
	fx7ei/aComWtfJ0Xo6oV6lvnh8N9OlvqoK04vXr3MmFi4oWYFFP5R9NSbfcLhvkv7ZZJqon7qyY
	pzdTReXfRlvW0oM+caw/LqNpoHhTrCjaSI5gpuQ6+wPzCih1OEQVJekez0LxHONchT7A3vLOxOM
	jprSOHreNp4toP50XV8y3ON5yUdqWEynwGuXaodUtVTi+mK19MGSs7yGPxbhWSeUpMvNzSHwcR0
	CZ2o+AUtzSEfNIiaPrw1VrEWImZUbB3K/o2YMiQCdT7KYS9BQIwUm5iZHvDysnJ8VzV4SJ4jJG1
	8UvHDPjNI+3aklYex0FcPpkThAjflhk9u/dyFVTXAYWyR7Fwdy50DSinkGUXt35Q5wop9UmFvaO
	aynCeBQR2pWrbHvBiJGKbmZNQi0OpCFoKArVjgDtcBhnraIJgjS/GdnuWcvJPUlmY/OhSrDLA=
X-Received: by 2002:a17:907:80e:b0:b98:29fb:f32 with SMTP id a640c23a62f3a-b9b502b9148mr677166466b.1.1774820336380;
        Sun, 29 Mar 2026 14:38:56 -0700 (PDT)
Received: from [127.0.1.1] (185-72-185-220.cgnat.inetia.pl. [185.72.185.220])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7ae57679sm202102866b.25.2026.03.29.14.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 14:38:56 -0700 (PDT)
From: Michal Sieron <michalwsieron@gmail.com>
Date: Sun, 29 Mar 2026 23:37:07 +0200
Subject: [PATCH 06/13] postfix: Convert confusing appends to override
 syntax
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260329-fix-confusing-appends-v1-6-df7e87b8b879@gmail.com>
References: <20260329-fix-confusing-appends-v1-0-df7e87b8b879@gmail.com>
In-Reply-To: <20260329-fix-confusing-appends-v1-0-df7e87b8b879@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Michal Sieron <michalwsieron@gmail.com>
X-Mailer: b4 0.15.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 29 Mar 2026 21:39:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125815

While in this case `RDEPENDS:class-target +=` wouldn't result in any
unwanted override, there is no guarantee there won't be a change, which
would be hidden by this override. To avoid any surprises in the future
let's use `:append:class-target =` syntax here.

Signed-off-by: Michal Sieron <michalwsieron@gmail.com>
---
 meta-networking/recipes-daemons/postfix/postfix_3.10.8.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.10.8.bb b/meta-networking/recipes-daemons/postfix/postfix_3.10.8.bb
index 2423e17169..a66ecc0b5d 100644
--- a/meta-networking/recipes-daemons/postfix/postfix_3.10.8.bb
+++ b/meta-networking/recipes-daemons/postfix/postfix_3.10.8.bb
@@ -240,8 +240,8 @@ pkg_postinst_ontarget:${PN}-cfg () {
 }
 
 PACKAGES =+ "${PN}-cfg"
-RDEPENDS:${PN}-cfg:class-target += "${PN}-bin"
-RDEPENDS:${PN}:class-target += "${PN}-cfg"
+RDEPENDS:${PN}-cfg:append:class-target = " ${PN}-bin"
+RDEPENDS:${PN}:append:class-target = " ${PN}-cfg"
 # Exclude .debug directories from the main package
 FILES:${PN}-bin += "${localstatedir} ${bindir}/* ${sbindir}/* \
                ${libexecdir}/* ${systemd_unitdir}/*"

-- 
2.53.0


