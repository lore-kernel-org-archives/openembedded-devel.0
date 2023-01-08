Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24704C67871
	for <webhook@archiver.kernel.org>; Sun,  8 Jan 2023 15:21:42 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.web10.46780.1673191297678811917
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Jan 2023 07:21:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iuB6Grru;
 spf=pass (domain: gmail.com, ip: 209.85.210.45, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f45.google.com with SMTP id k7-20020a056830168700b0067832816190so3860644otr.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Jan 2023 07:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=POheii/zeZAH+USrAUAeDkkpAQUVe4NqmQsaItd+i7w=;
        b=iuB6GrruWokCAOtzHQ77wR60fv2rAoCPmw720FrsaYL3VJKBJJtFgLJSUIi+FOIbOm
         hmL+u5/RL1yrO+e6IgHfxBZMx9DLMfvFSu6GSw375lmQbanl4g48eSPi6Ub3XXRsRHJw
         N8uhS53/0rgwTx+LCCpeJE0Tck2yps5fDJQxIim6isTGDbshZN1aYL/numMM+79SQfAL
         Zs1jH1VdOWgQnh9DeF5wbf+QOkYIBLyjY1mmf9nHPR54s3rBRrXAWgOQSIQMXyJdfUMv
         VEB0SeecK0Z6bUVSkucWy79Du49yW6tOE6roEfps3j85K/pinTZepCBcNAkYAxIO+aHH
         i8Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=POheii/zeZAH+USrAUAeDkkpAQUVe4NqmQsaItd+i7w=;
        b=PlHFStep7L5ab1eArjkpVn1/SYbooVD+3+xqYk32qxS8TlM/wLi+J5ltzhgbR89g3t
         m37v6+CGxL5S+cn+YNoNzyXvI2vz/Byj6fq1ABsOa70ylGDSVvdjFIcnf7MCMGX9VbTC
         e7DwoPy1qxxbmSHULsXZpT+lFXmTefdzvNm8OkCaLQFNxJiwbVgnHBarlEveM2SmCl+f
         JZpjqW3zWYuEY60tNzdLUbtnirDsFZpgTGfQBh9IJtSQhiTVaisahsop+XV/fgbMCigB
         ePtYnxfYh/COOTq8EBiif+Z1JDyKrFBN6QH22WX70rRAkRUuaK5MynNgRhYwnEtEEMeG
         bbWw==
X-Gm-Message-State: AFqh2krIq3mAilJEIr/zBwhANNb8Dxv1zx3c9A45TMIBz6B9zlUxf6Se
	Pok2qPyLmp9t+4ciOmZxz6kIY7QOp1s=
X-Google-Smtp-Source: AMrXdXuTzYaDRagvHTpfipA3PM/BneKCITPwLmVoMl5BlNn9pXDN8HLlMOkqtsKLmCkQqKWPk2k5Qg==
X-Received: by 2002:a9d:1e8:0:b0:66c:808f:4a27 with SMTP id e95-20020a9d01e8000000b0066c808f4a27mr32955884ote.20.1673191296924;
        Sun, 08 Jan 2023 07:21:36 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:14ca:f21f:f9fe:c54d])
        by smtp.gmail.com with ESMTPSA id s24-20020a056830125800b00684074fbce6sm3184725otp.54.2023.01.08.07.21.35
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 07:21:36 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 19/26] fontforge: Inherit python3targetconfig
Date: Sun,  8 Jan 2023 10:20:54 -0500
Message-Id: <594500439b0fef0147cec60cf7fba420b4828c5b.1673191116.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1673191116.git.akuster808@gmail.com>
References: <cover.1673191116.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Jan 2023 15:21:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100464

From: Khem Raj <raj.khem@gmail.com>

It currently ends up using native python3-config which adds native paths
to compiler includes which is not what we want.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit aac23a0407089ea23314720d49f9cb120452ce53)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-graphics/fontforge/fontforge_20220308.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/fontforge/fontforge_20220308.bb b/meta-oe/recipes-graphics/fontforge/fontforge_20220308.bb
index c53f2db01b..ddb4443baa 100644
--- a/meta-oe/recipes-graphics/fontforge/fontforge_20220308.bb
+++ b/meta-oe/recipes-graphics/fontforge/fontforge_20220308.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = " \
 DEPENDS = "python3 glib-2.0 pango giflib tiff libxml2 jpeg libtool uthash gettext-native libspiro"
 DEPENDS:append:class-target = " libxi"
 
-inherit cmake pkgconfig python3native features_check gettext gtk-icon-cache mime mime-xdg
+inherit cmake pkgconfig python3native python3targetconfig features_check gettext gtk-icon-cache mime mime-xdg
 
 REQUIRED_DISTRO_FEATURES:append:class-target = " x11"
 
-- 
2.25.1


