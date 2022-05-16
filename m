Return-Path: <nicolas.dechesne@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCB41C433EF
	for <webhook@archiver.kernel.org>; Mon, 16 May 2022 18:06:09 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web08.923.1652724361549825126
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 May 2022 11:06:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=vAit+bgI;
 spf=pass (domain: linaro.org, ip: 209.85.221.54,
 mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-wr1-f54.google.com with SMTP id a5so17797800wrp.7
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 May 2022 11:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=b8CWqNKvM1314Q2C8t7UWMLCIRPu0QfeDZpE2eljfNw=;
        b=vAit+bgIGVPjY3BHwfzS1qsBBu/gp1aw0L9ZzNclOX2Ens/BO224f+9218xuM7tB6p
         ttv/QDeJewe7vrngvh0LfwEZXkBZV+GTM29T7QwLCSjfLoV9xi1AV/2lOmKaQGGPh3A5
         5PzVldbEOI38hdOVek+2YLhg2981+ji1mvfUcvjBMrGOxbCXmc6MmEqwBkFcAAAOm2Xu
         9FAURNilZsJIg83PWQCt65NTSq+dl/oMYvf0y1qagT9B1LADeVT59/Z/WFCys/8PlP7q
         z/cp0U1OjsiAyVzTdxeJccld5DfMt2Q4/0A7rk+nRZgtxgZ4jxZLVyWmDqHOuIPckYNt
         t1Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=b8CWqNKvM1314Q2C8t7UWMLCIRPu0QfeDZpE2eljfNw=;
        b=12S7hnzZte9/W1p0wj7IMJy285bYyvemJhy5yjp5CehpXs2SXT2bijGa2Tb3CqCRHG
         raFhyCOvSfnZhFan+/pjC08Td4icuH70VwWkzUwDVHTflDhbKDZiEzwnoL98BIwBbzum
         33SRQrWZII8Jb7ii4RTRFXQW7CFci/m/Aj75LjI+wJ29YchtXO/sDfaX34oG72E/xyAA
         5Sh3epN8oOU35uuIckioLMBdTvBRmNpxrRXDkZE5nHAD1o2xQjk7lDnx3SEc8NvfmdQH
         QbixbSefQk90LFUq7E51GnTH8TKEEaQMol0qSuBD8tiMpLv0EgGMTKrinaZ/uCMVmPKn
         05MQ==
X-Gm-Message-State: AOAM531POX2ajqJRW/eMao8M2BajiLWOzbyr9+51mxDPcvjLjqHe8Rbe
	ce8U3k0QgunNQnTfF7+TW31oH2UOzLoIXphm
X-Google-Smtp-Source: 
 ABdhPJxR9S+exG0QdA7DHMwTSl2b8p8kPngc6UgMQ6r3wb7Eo7mQX0uibKj+sTm+VWraadAnr8iZtw==
X-Received: by 2002:a05:6000:1866:b0:20d:2834:5155 with SMTP id
 d6-20020a056000186600b0020d28345155mr647465wri.101.1652724359654;
        Mon, 16 May 2022 11:05:59 -0700 (PDT)
Received: from matterhorn.localdomain
 ([2a01:e0a:1b9:3e10:6883:56ff:2b71:f8a3])
        by smtp.gmail.com with ESMTPSA id
 d6-20020adfc086000000b0020c5253d8fcsm12283569wrf.72.2022.05.16.11.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 May 2022 11:05:59 -0700 (PDT)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-devel@lists.openembedded.org
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][kirkstone][PATCH] imlib2: update SRC_URI
Date: Mon, 16 May 2022 20:05:42 +0200
Message-Id: <20220516180542.583012-1-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 May 2022 18:06:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97142

The upstream repo location has changed, it's now
https://git.enlightenment.org/old/legacy-imlib2

It's not clear when or why it happened, but the the commit hash we use
in SRCREV exists in the 'new' location, so let's at least update the
SRC_URI for now, and fix this warning:

WARNING: imlib2-1.7.1-r0 do_fetch: Failed to fetch URL git://git.enlightenment.org/legacy/imlib2.git;protocol=https;branch=master, attempting MIRRORS if available

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 62becef1091d21f487e826df7be7dcef3ab8f94c)
Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 meta-oe/recipes-graphics/imlib2/imlib2_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/imlib2/imlib2_git.bb b/meta-oe/recipes-graphics/imlib2/imlib2_git.bb
index 56d41cd39..869f8123d 100644
--- a/meta-oe/recipes-graphics/imlib2/imlib2_git.bb
+++ b/meta-oe/recipes-graphics/imlib2/imlib2_git.bb
@@ -14,7 +14,7 @@ inherit autotools pkgconfig lib_package
 
 AUTO_LIBNAME_PKGS = ""
 
-SRC_URI = "git://git.enlightenment.org/legacy/${BPN}.git;protocol=https;branch=master"
+SRC_URI = "git://git.enlightenment.org/old/legacy-${BPN}.git;protocol=https;branch=master"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= "jpeg png zlib ${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
-- 
2.36.0


