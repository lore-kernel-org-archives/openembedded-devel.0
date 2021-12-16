Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09717C433EF
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 15:23:30 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web10.11863.1639668209107648878
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Dec 2021 07:23:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=S4FNTMHb;
 spf=pass (domain: gmail.com, ip: 209.85.215.171,
 mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id r138so23308802pgr.13
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Dec 2021 07:23:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=13dGZGRFgHVVSIHXWOcQQ+qRJckO2ndvQy+N1Ue6f90=;
        b=S4FNTMHb89lvFsdxT1pbNFWgQNknzI/p2hy4jSEWLX4D/CzROBIbTpGwlSYSvLGBqD
         sCbDdCY8m5lyOD3Ckw4ETeosGw6MJZZT23ox+L5Yu6i/+wEI4vcAbZrjTWoZvM68O3Lk
         fG0SZLm3mL4oiyBA6H4tpPeYX1HYUzajpANGDCyw5JPuPWo0gB14ZmSB18SF/DVr7HSA
         k3a8bnSRHsSmMmlvGiKM/jvSDp9OMbbVo0VXzoPHqwAQzM15iU9xDFa97FuSiWF3ojKN
         Unyd1Y56eiPOuf6xu5VbkwWksymRTb8zgXj+OwAZGDqxKROJh8WCATUfYaMnrM9Urkuc
         dlSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=13dGZGRFgHVVSIHXWOcQQ+qRJckO2ndvQy+N1Ue6f90=;
        b=4TzuePUEGpyShKEZUCUJpo/9ur8grHEAVijnBrTBRREFRkpcwbep15chRJqBMWldv6
         h7/EdmFxoRdVjRZE5E1PvCuOOXrRpiRm228QStK0i/e+laGhuPo2c3vY0z3uO+JFX/Sw
         wEm75KB/aRGLXsA4B3Bh2E56lcuV6Cii07saeDRtvEpI/1ltBGJMG/RcxASUMx88p6wx
         ILZYHjR7MTsvB1EZ3RQ/E1h0Li94/JmJcZtJkQNq1Vw/XQnV1cIoVHhIqtnj34u8LFA9
         OOznNhQnsQ7837y7UVh+z+cRBnakIzm2oFD1HKWHiCGf221daZ3F6X1b7WioKrVWRD4l
         soIg==
X-Gm-Message-State: AOAM531iBKGjMTuUloyGadUG1zYdQL6TWaFHRRayqViW2oeaEV7Qwq0Q
	3KLx45naFkF1x01b/QDPm/AERT9lLe0=
X-Google-Smtp-Source: 
 ABdhPJxnD9aWkcUEinZT3U8PuBXdHWarXgPKQOgoWaDhoXhaDVpp99ZkYjM7jIuN8RmdqwP5R11oDA==
X-Received: by 2002:a05:6a00:198c:b0:4a4:e75f:75cb with SMTP id
 d12-20020a056a00198c00b004a4e75f75cbmr14546151pfl.38.1639668208500;
        Thu, 16 Dec 2021 07:23:28 -0800 (PST)
Received: from keaua.hsd1.ca.comcast.net
 ([2601:202:4180:a5c0:7d7:ca51:b150:8ee7])
        by smtp.gmail.com with ESMTPSA id
 k15sm6795703pff.215.2021.12.16.07.23.27
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 07:23:28 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [honister 02/18] msgpack-cpp: fix msgpack-cpp is a header only
 library
Date: Thu, 16 Dec 2021 07:23:07 -0800
Message-Id: 
 <2cd24bd20d4407b3e759452a6929f66903c170b0.1639668121.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1639668121.git.akuster808@gmail.com>
References: <cover.1639668121.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Dec 2021 15:23:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94387

From: Sean Nyekjaer <sean.nyekjaer.ext@siemensgamesa.com>

${PN} is empty so don't let the -dev package RDEPEND on it

Signed-off-by: Sean Nyekjaer <sean.nyekjaer.ext@siemensgamesa.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit b8a8fbaf7df3d52acf02e7a3eec97ffd57acabf3)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-devtools/msgpack/msgpack-cpp_4.0.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/msgpack/msgpack-cpp_4.0.2.bb b/meta-oe/recipes-devtools/msgpack/msgpack-cpp_4.0.2.bb
index ef066753d7..25b199f572 100644
--- a/meta-oe/recipes-devtools/msgpack/msgpack-cpp_4.0.2.bb
+++ b/meta-oe/recipes-devtools/msgpack/msgpack-cpp_4.0.2.bb
@@ -19,4 +19,6 @@ S = "${WORKDIR}/git"
 
 inherit cmake pkgconfig
 
+RDEPENDS:${PN}-dev = ""
+
 BBCLASSEXTEND += "native nativesdk"
-- 
2.25.1


