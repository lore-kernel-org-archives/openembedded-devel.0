Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B06A7C64EC4
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 18:33:24 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web10.407.1678386796776950703
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Mar 2023 10:33:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SHokTXBH;
 spf=pass (domain: gmail.com, ip: 209.85.160.180, mailfrom: twoerner@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id y10so3075524qtj.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Mar 2023 10:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678386795;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=PH/WSjtXTajsxq6avaVcKADNJALwMhVj1z6WtK7PPB8=;
        b=SHokTXBHr8flu+qzmvM7w5ryvZ8e4lIMxKVHWn5zXt1M3njUfg0LhdIcIaAw/aGCI7
         6YPh3B34zqewAcQAfschC6ZTKBmRNHLM+g9vreREmuwGHdIimQ1/lCoqvpAXHONqSxmR
         83/9ApWIDZtOTGYZQ08FGZ37+A/FpO+YKk1IDIYfalKtR9ghZl+Hrt1UMp3NZ1rYQ5zc
         UKJ76UaITiHxMKiz30C6blGAXzjlnua0A2TH5VM9p6tZWA3TSLWQcbBiSc7FLzpImB7P
         qT+Bp/s7cXHa68NCNpC3DOI00s7QBIZfjuR5R2B2eCLa6aNM9+ijp7I3IiOe/eW5C50V
         7gug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678386795;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PH/WSjtXTajsxq6avaVcKADNJALwMhVj1z6WtK7PPB8=;
        b=S8jlU/KfNrq5qXYLBsDtVhn4tem0WX2AwwG8rQ6Q2jDQsMKKSxjV6sjzlEfq8Xd6Yi
         KH1KgLkUgOhxTvb94vuVqmJUmOr+IpvGo3BJcXmxzbkHbJ/WsQCTvplnhGNBCLD/MWlw
         MDGAvBdWfzeyrKs++l0LkOi3slHohiZMP0ZSPe+BpYqRw3moB0oZiF2qrQjYuegZP1fe
         niV1xuiF8aMa2H3Pipfmp7GtzA0JxY1iq5es9p5nUoHvLUBz32dVNrPxZOvE/Jo1DRYD
         HoJkGig7IGLbKkm+ZyztrYumrVzw0Dv/e5y3teVUVcTjtEtzAN2bxFv/K6T3ZAHw6BTg
         zvxw==
X-Gm-Message-State: AO0yUKVXhB/bGbq0NkB3dZbGE/0x5RZ/93vaKvZH0myTnTSh7Hhb+wKB
	OuvQWAWqCqx5XyEm3KbPZgjVJ6ByktQ=
X-Google-Smtp-Source: AK7set/y2kEu7xu20GbY0RM7jhy+Aak8326ghJ3T3UT4gXrg5IybCfhzK082qhSDH+tqzGY933bz0Q==
X-Received: by 2002:a05:622a:174b:b0:3bf:d9d2:4866 with SMTP id l11-20020a05622a174b00b003bfd9d24866mr31731733qtk.24.1678386795561;
        Thu, 09 Mar 2023 10:33:15 -0800 (PST)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id e8-20020ac85988000000b003b9bca1e093sm14339564qte.27.2023.03.09.10.33.14
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 10:33:14 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] hplip: add runtime dependency on ghostscript
Date: Thu,  9 Mar 2023 13:33:10 -0500
Message-Id: <20230309183310.35074-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.36.0.rc2.17.g4027e30c53
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Mar 2023 18:33:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101465

The fax/filters/pstotiff program invokes /usr/bin/gs and therefore has a
runtime dependency on ghostscript:

	fax/filters/pstotiff
	 24 gs_command = "/usr/bin/gs" + " " + font + " " + device
	 25
	 26 exit_code = os.system(gs_command)

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta-oe/recipes-extended/hplip/hplip_3.22.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/hplip/hplip_3.22.10.bb b/meta-oe/recipes-extended/hplip/hplip_3.22.10.bb
index d8e249f04796..23cc5197fa51 100644
--- a/meta-oe/recipes-extended/hplip/hplip_3.22.10.bb
+++ b/meta-oe/recipes-extended/hplip/hplip_3.22.10.bb
@@ -72,7 +72,7 @@ RDEPENDS:${PN} += " \
         python3-resource \
         python3-terminal \
 "
-RDEPENDS:${PN}-filter += "perl"
+RDEPENDS:${PN}-filter += "perl ghostscript"
 
 # need to snag the debug file or OE will fail on backend package
 FILES:${PN}-dbg += "\
-- 
2.36.0.rc2.17.g4027e30c53


