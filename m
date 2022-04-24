Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC4CBC352A8
	for <webhook@archiver.kernel.org>; Mon, 25 Apr 2022 19:26:11 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web09.14272.1650769815646307481
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Apr 2022 20:10:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cqoHYbWG;
 spf=pass (domain: gmail.com, ip: 209.85.214.179,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id u7so4198558plg.13
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Apr 2022 20:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LKt+In8DOjuluHj5Y9T4MTswY+DyzdHR/cMNwt6D6CM=;
        b=cqoHYbWGY+QhJC7Xhi8ZIByG1m33MxVzFqrugBniQh0rLyRP78G9DucPo7Px4Ok1R6
         YMmQkW+iOT1vUcMTK1DjJ9BfRQixZlpvMAAubvV0cPGbmggJpXAIws8O2yhc0cGE60nJ
         Zl8h4+Cxn/pPclGyVeVDlZ3J1q/+qNBWdFqDWfLiJsTAOKKpBhY8phKPFe4iXsreXhEw
         5Qnnuf7PASGtqF05yljeI9iPQIUkU68LsQWMvVP9L8p811YjKPQB9P6TJEtrUJzMId/K
         HXZyp/0j2dbVKu678PPJ+680LeCBdgMId0S/eSOCvEoM2Nzu4GT4aAsh0gzhqdSUiQIh
         OSsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LKt+In8DOjuluHj5Y9T4MTswY+DyzdHR/cMNwt6D6CM=;
        b=6jY7zuR7K9WNs2Rec/h/oDiynDePmNpq3WMpOmKlRA7kkSRW5G0JurUNl9zvWdWZ57
         xmxLuRo51NcdODgbWSJxay5rHiM/UDpSCOisSWRx4Hie1DC3i1BhGVbsff1iFum3L2dr
         EZ98PruO4WzxOL9WroZsj1/YN+15X0XnfZi6Wd7jN/+5bOdOWC2U8UmTcIipwIjue0rq
         vKj2/4jQemV/FEZqicnTZieZC9tk2mJ5/MYQ2lfLXvsLjQVl8Eluvtuf9TkMarHBYy3g
         mGpGOWSrvF9ZbOd0iqLO7jtst+YKoKvhWWX6fMzujkYQahjZkbFFvq+gReRraDvYCa5y
         AjyA==
X-Gm-Message-State: AOAM531Xm6BLaJaPlvmf1+YZzUlO4QukbceYI9vlEaTsH7H2qFyum2W/
	DqSNSG9JrFaTGpVx+A3AlnBEuZpRKtI/Yw==
X-Google-Smtp-Source: 
 ABdhPJyNgLdZPIpwlT0TyfscreFPm6MbDEvlCHlixfKglrEnS0ClYgmGF2wO6w1+AQu3xREEjMHdww==
X-Received: by 2002:a17:902:bd05:b0:158:544d:6557 with SMTP id
 p5-20020a170902bd0500b00158544d6557mr11868651pls.70.1650769814992;
        Sat, 23 Apr 2022 20:10:14 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::2ca3])
        by smtp.gmail.com with ESMTPSA id
 q13-20020a17090a2e0d00b001cd4989feebsm10630987pjd.55.2022.04.23.20.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Apr 2022 20:10:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 10/12] dietsplash: specify install rootdir
Date: Sat, 23 Apr 2022 20:10:02 -0700
Message-Id: <20220424031004.3209576-10-raj.khem@gmail.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220424031004.3209576-1-raj.khem@gmail.com>
References: <20220424031004.3209576-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Apr 2022 19:26:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96747

This takes care of rootdir being different when using usrmerge

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/dietsplash/dietsplash_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/dietsplash/dietsplash_git.bb b/meta-oe/recipes-graphics/dietsplash/dietsplash_git.bb
index 44fc2d08ca..2c28fde347 100644
--- a/meta-oe/recipes-graphics/dietsplash/dietsplash_git.bb
+++ b/meta-oe/recipes-graphics/dietsplash/dietsplash_git.bb
@@ -17,6 +17,6 @@ inherit autotools
 S = "${WORKDIR}/git"
 
 EXTRA_OECONF = " --with-systemdsystemunitdir=${systemd_unitdir}/system \
-                 --disable-staticimages"
+                 --disable-staticimages --with-rootdir=${root_prefix}"
 
 FILES:${PN} += "${systemd_unitdir}/system/"
-- 
2.36.0


