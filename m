Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 965D0D3611F
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:55:17 +0000 (UTC)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
 by mx.groups.io with SMTP id smtpd.web11.27786.1730831960254126022
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:39:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PT7wwKds;
 spf=pass (domain: gmail.com, ip: 209.85.219.180, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e2903a48ef7so5110728276.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:39:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831959; x=1731436759; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9DkJLo2M6Zpxlgregp/LuFlmJYPg7JFPFaSSXxpZkhE=;
        b=PT7wwKdsnkz3Nqx2m8BnPdPjY9FbeYakmQKuZD+3AR6+I6BOyt4iqlzumjjJ3OM9vL
         mzwq86T225pOvqArALreqohNsRtOok75KFVzcLNH/HkLqK8KzbXMcMwwjHC5Xe08O97a
         LD0b17CxRQvIConDeIC4OTGe8aJAbkvltVk3d30Co9ajqKpxlEOqjqHLh/ePoCqaB7p0
         txIGmIU4cZtYH+Pe2ZHe0VUCjbo8bMR7u1TDplGIC6mXILjXHABjUzNk71UPG7PQPVNs
         kGWsy7qujqCswDCXu/qMtsFww75LK0whPt6hUXtEEoJABtRFJLm9n10OX6SvaN4Uo2Fp
         a7Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831959; x=1731436759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9DkJLo2M6Zpxlgregp/LuFlmJYPg7JFPFaSSXxpZkhE=;
        b=esveXtvUkCV0w/X4Fjl49M6A3MFvKdin/n4PuxfAQbmZAbEHVZrRWxgTh4sCfI+I1c
         MjOx+JPuenDPy+35qxbnPNzJzPQ18HHir92Gu08yAKC3chtMrRmBLl2jWyrnek4hgxnL
         SOcR5zpeaDIy63UTsU+VImTlXAuZkUuce5erv/SsK+RAUz17DanhV/fM5TvDvK87r2Dv
         YHqp7XNh9h5/JlExUM38JSIRLuAWeRpnDy+3O9kZJ5zHZAyWATzX5bL3rzRxZMpqYkeV
         I2Xs+VtINXdzeoWeih0srqCoBBaAEL3uoPYTw65vyzWBKjzVx7QjMlGZDyaolUbGrGsl
         VR5A==
X-Gm-Message-State: AOJu0Yx6Va5YALXIRGmSBUVbQO1W//vZKaeSuOSBXfNH8GxMgxcCYWR1
	8aQm0krlWWLqmfgBKM80okQjtEl+kDf6dDAQnvqxeLgiJmqC2rGWkwwkwBgd
X-Google-Smtp-Source: AGHT+IE73KIftbPkTnpbrS3j1xOnAKYFZAwuOKG9vH1BV/tTC85BZ9TVd+PRQNQwkRtcOgBVWbM8/w==
X-Received: by 2002:a05:690c:62c8:b0:6db:d217:895e with SMTP id 00721157ae682-6ea525209f4mr179350567b3.36.1730831958875;
        Tue, 05 Nov 2024 10:39:18 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm23957617b3.103.2024.11.05.10.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:39:18 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-oe][PATCH 099/161] font-cursor-misc: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 13:26:15 -0500
Message-ID: <20241105183658.34982-101-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105183658.34982-2-schonm@gmail.com>
References: <20241105183658.34982-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:55:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113614

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-graphics/xorg-font/font-cursor-misc_1.0.3.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/xorg-font/font-cursor-misc_1.0.3.bb b/meta-oe/recipes-graphics/xorg-font/font-cursor-misc_1.0.3.bb
index ba4575bc2..787541d3b 100644
--- a/meta-oe/recipes-graphics/xorg-font/font-cursor-misc_1.0.3.bb
+++ b/meta-oe/recipes-graphics/xorg-font/font-cursor-misc_1.0.3.bb
@@ -13,5 +13,4 @@ inherit features_check
 # depends on bdftopcf-native -> virtual/libx11
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[md5sum] = "3e0069d4f178a399cffe56daa95c2b63"
 SRC_URI[sha256sum] = "17363eb35eece2e08144da5f060c70103b59d0972b4f4d77fd84c9a7a2dba635"
-- 
2.43.0


