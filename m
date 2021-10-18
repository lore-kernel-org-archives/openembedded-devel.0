Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F912C433F5
	for <webhook@archiver.kernel.org>; Mon, 18 Oct 2021 15:15:54 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.37747.1634570153175314479
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Oct 2021 08:15:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Mg7zBvsp;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id
 oa12-20020a17090b1bcc00b0019f715462a8so208901pjb.3
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Oct 2021 08:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CvEr5PsrtzAulr0DaxlrrwsyjRqNk5vUsh2/3WCGCgs=;
        b=Mg7zBvsp7nWZApQKpJqqUEVkpK6yxppiX5KS/fi4Hju9LDD5cISngevM4+RPLERJPW
         JN/9kTBO+KoOArBZFoObNUdE/qCOqNUACweh5J3l9GPcO54ATZXD+iEOXNrzTHqGSF97
         1LRN8FK3t+XEkA5HS9dB2bleBjxPNFxpoanQGCX3165Dl46Aua9AJrM76uIqfm7ezu4e
         pExoW00LzoaORvRZY0AlCvb0v381v1DyypFk9tCVH/k9fcuOjgqIU0Y95adtrF4FiKam
         4yMM2q97d/zwy0iP0xpZJ8C6gYXBco7UQ5vzwXT5MMvN52IY8qmlBNH16Th8u16nQ9/r
         WqVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CvEr5PsrtzAulr0DaxlrrwsyjRqNk5vUsh2/3WCGCgs=;
        b=IrFxLlicEEY9HtFELWiAsko8yYQPlq7pur8Mb/bEAFIpraqqHk68J1BRd4FXY7KZ66
         fj2T8lyfCZB+sHoz/VVjjaiPXV+/9QdInZ/p4bgyT0Oq1n5fY5VqWCr0DToF2jVscqR0
         eRo3jcK8A1AFbt53+rkYrZlw4VOzL9cUyu0VB+Rz0OgY9YnVYwH1QF3aN56QefoLsovH
         vbwq5AD3D1QUHeuJwG27AeopNBEThkM1++12BXGyhzgR+EX7uokC89OhWhZ5dt5484x1
         oC81Rv0Q/lIQx0F+Xly/HZ0+fBQ2dDmhmVisLSQN9UtcGywqJKJMBcTUpOOqpl5iFq9o
         GTqw==
X-Gm-Message-State: AOAM533xWgeVxBKWAxZQC2DkaDXNtNuQe7V/hFh8rsahtJ9hkOTzE479
	XJlr1lY6pGgGM3mMou7y6RNwxGDqByU=
X-Google-Smtp-Source: 
 ABdhPJzTZywPHzCZmnyhWjkKUHLkcACcXRFsm2oCJPWUtT3XLjyiz/7hO5+iSUeEeSV7J5rXn98qJg==
X-Received: by 2002:a17:902:ec83:b0:13f:551b:526d with SMTP id
 x3-20020a170902ec8300b0013f551b526dmr27366410plg.27.1634570152251;
        Mon, 18 Oct 2021 08:15:52 -0700 (PDT)
Received: from nereus.local ([2601:1c0:6000:1830:ffc7:e2cb:a2b6:d240])
        by smtp.gmail.com with ESMTPSA id
 x7sm19798756pjg.5.2021.10.18.08.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Oct 2021 08:15:51 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <ticotimo@gmail.com>
Subject: [meta-oe][PATCH] colord: inherit pkgconfig
Date: Mon, 18 Oct 2021 08:15:39 -0700
Message-Id: <20211018151539.2313513-1-ticotimo@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Oct 2021 15:15:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93425

meson can't find gio-2.0 without pkg-config

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 meta-oe/recipes-support/colord/colord.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/colord/colord.bb b/meta-oe/recipes-support/colord/colord.bb
index 66dc4a5802..563a0ee00a 100644
--- a/meta-oe/recipes-support/colord/colord.bb
+++ b/meta-oe/recipes-support/colord/colord.bb
@@ -1,6 +1,6 @@
 require ${BPN}.inc
 
-inherit meson gobject-introspection gsettings gettext bash-completion systemd features_check useradd
+inherit meson gobject-introspection gsettings gettext bash-completion systemd features_check useradd pkgconfig
 
 # polkit and gobject-introspection are mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES = "polkit gobject-introspection-data"
-- 
2.30.2


