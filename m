Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 005E8ECAAD8
	for <webhook@archiver.kernel.org>; Wed, 14 Sep 2022 12:03:34 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web09.5284.1663157011809966311
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Sep 2022 05:03:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gWB+aYGq;
 spf=pass (domain: gmail.com, ip: 209.85.221.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id b5so25304029wrr.5
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Sep 2022 05:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=2gf23jIMdUqDZOzttTsb1ysLynrgL8yHdpUZd5hNCAw=;
        b=gWB+aYGqLXdAh7Gep4AWBunsh2p3RLN0LKamQ76706sGDVT1DZQdzWLh05O6oZBqMZ
         nrfeqGN3blvuE2fkW+llCm+FpXwlrE6oQkFX5Nt1m07WCEPhZgZfR7/8LV6IPBjgjSGy
         kCJwGb1cKRH+MEhKFBkDj5fPufpMYCQIVQvj8D9Y54pmsfYOu9jPdHtFj/YGMnJ/sRdN
         S8a8nFhkF5yysXaLys6AXvleZymxcL9LiQyZiJ/3cl8l5U0+1YfJA9EPtNSeqxvrHUdX
         G30+dCcMxE6XH/JjQ3f5vfjzARgtWPGfxUwDxsbeERo2PhstzFkIV1PR/gdQloFxglGY
         2XOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=2gf23jIMdUqDZOzttTsb1ysLynrgL8yHdpUZd5hNCAw=;
        b=mRSK7YXk0Qa/4nY6LuuV66joS/UVgd33h6fnF4j4O9eecOkfMHiKgIrCBkNuN+BbnG
         OgiuGBIBQuVYGObuC34c/pcfqroohHoSrSG69I5U5S9Y2YXU1Btu8G7BK8du9N3j6n50
         bNa79qXVLf1Yqv7wzgN41GjMAtuyn+mfb5ABXYFVJP6bTJHXQhMAmoaCjyp5YTEsyF+G
         iTYNWvR7dXfYwCuUmgHRdV/ywkFh+4+mXRCkbDVCVOjGxCQvqoZMbi7OBZYDPLx+FGzU
         iHSlGTCJWLrWNTHCZ3imSOGrLFBesb6qxGQyLFpY8aS6ACc0hW0tbWSr07ICY398RHRq
         8RIg==
X-Gm-Message-State: ACgBeo0tKKldK/iiO4BcZDhy6LnRB8/uejH+nFBUsKDs6AukXwLOkqnS
	fLlfbcr7gpFKKHsP54GGDPiEU1jbbP3kVw==
X-Google-Smtp-Source: 
 AA6agR5fdo5ttmu9VdXjA2Bi2oAlMGAPhVqbvP00EJSKYdVKjReH3LH0/2jxyydC+ZXdRbCkNLJZ4w==
X-Received: by 2002:adf:e78b:0:b0:228:614c:33a6 with SMTP id
 n11-20020adfe78b000000b00228614c33a6mr19962351wrm.504.1663157010214;
        Wed, 14 Sep 2022 05:03:30 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 w1-20020a5d6081000000b0022a2dbc80fdsm13286233wrt.10.2022.09.14.05.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 05:03:29 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 6/8] collectd: add a python PACKAGECONFIG, off by default
Date: Wed, 14 Sep 2022 14:03:14 +0200
Message-Id: <20220914120316.551377-6-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220914120316.551377-1-alex@linutronix.de>
References: <20220914120316.551377-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Sep 2022 12:03:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98800

This resolves python 3.11 errors as well.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta-oe/recipes-extended/collectd/collectd_5.12.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-extended/collectd/collectd_5.12.0.bb b/meta-oe/recipes-extended/collectd/collectd_5.12.0.bb
index dd97796f4..5dc64588d 100644
--- a/meta-oe/recipes-extended/collectd/collectd_5.12.0.bb
+++ b/meta-oe/recipes-extended/collectd/collectd_5.12.0.bb
@@ -51,6 +51,7 @@ PACKAGECONFIG[libatasmart] = "--with-libatasmart,--without-libatasmart,libatasma
 PACKAGECONFIG[ldap] = "--enable-openldap --with-libldap,--disable-openldap --without-libldap, openldap"
 PACKAGECONFIG[rrdtool] = "--enable-rrdtool,--disable-rrdtool,rrdtool"
 PACKAGECONFIG[rrdcached] = "--enable-rrdcached,--disable-rrdcached,rrdcached"
+PACKAGECONFIG[python] = "--enable-python,--disable-python"
 
 EXTRA_OECONF = " \
                 ${FPLAYOUT} \
-- 
2.30.2


