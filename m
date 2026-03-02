Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 149BAEA4E11
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 14:56:16 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.162403.1772463371060910352
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Mar 2026 06:56:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=OOnuYiUA;
 spf=pass (domain: konsulko.com, ip: 209.85.221.50, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-439b9b1900bso604649f8f.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 02 Mar 2026 06:56:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1772463369; x=1773068169; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+tswQW1xmFH192O7HbGP4CpWtWML8zADKYDAVqRvxWg=;
        b=OOnuYiUAYDK+3zhm7TjVEmUlCcNsue7fE3YTLIrXyWmUQgzpRvSiIyUuvVdDFqnwaL
         pVHVb1+WAZcJumvoXDi4GRLiTNa9MNxIAEfD5zlmjzaiETorNDuCZBy2oUIQYLR0QOuF
         AdqTqRC235wFKiz1csBKAEUWj2IgQEegh+SNc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772463369; x=1773068169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+tswQW1xmFH192O7HbGP4CpWtWML8zADKYDAVqRvxWg=;
        b=sN0+1AXkLnMbHMop8PXrXUxJs4WnzLxBFH5IRzFMvu1NbaGWzzk5Bmj+TRLjRO4PgU
         5y1/8b3g1wcaNFpawaYMvHq6oRUxyO7S4ZbHlWGf0nosjvocJVjm2hoSimr1Z9zK+8Pn
         utOjfNLxuG2fGG/3CNc4QfRaauAiqLfe871tbsNtaZYM9NilWmavbecUyMwNEGQzES1i
         87G9NAtJvC6KiHYzJjlDJ7y1TOAtgh8czBQhsiwnwRpDdx2ZOd2l8cI/NKbDu5bC2rae
         IZH0OOpIH5E6/SGckdMEVWPSvbWxZRi9NGj8xO9LuLtlDZeJbh/jjHbFNvfo3gvgUBc8
         5d2Q==
X-Gm-Message-State: AOJu0YzP4fSw7ie2gMeJeHie9lPeuItPWgILwaaWnHUg5BfCu4s19fqw
	DYBAz+PeMfKJtFH7HC70IRXPCSv3trVJR/rXfcWG39mzwVwfk6O9Bn1aFB/ftbIQK2vqjsHakQa
	/73pu
X-Gm-Gg: ATEYQzwfCixM6HoxlmT0M723NbJ/oxuENi55wXnSdwiknOCO5xV0Tdj9NObMr2Y/XM9
	jWCpoHcyzS9YaRosukSj01sctPX0Y2rafZkvDbZwjx3pt74+yyuW0bz7tN7M16U2t8+rNe6EaIA
	ZQIfgokJ5XJ6Wje1g40bBIt41fr3+mh7eLv7JxKtsOoynl1xGGFcSyuL0pTChZhwaJQQAHS+9FL
	jD1XIWguEDPENIPH8XFtIZMoncixKyElS2RoKuaEoTh7xsST/MhxH4UFEjSblQgWLXeuf3mr7UP
	gmmmsDi4XWUvK8Y1N+8RkAM7Sd33dj6NOHtz7CFUVKEkcEXASWBzgn192IL8lJMQVqwpx3BmIc6
	j+C+HttrgoW8HV2p1+7A0LxOOPTTKQtVXvOWi/SzQMCRK/EvSoA/FAGR/ccQkGX6z1Y0UAOjBVv
	86fbXPHG8uVh2aBSgFpHexViZWzpxyBLvzGc+V/oFO69KdKJM=
X-Received: by 2002:a05:6000:250d:b0:439:ae82:6ab2 with SMTP id ffacd0b85a97d-439ae826be5mr12268088f8f.57.1772463368328;
        Mon, 02 Mar 2026 06:56:08 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c75a25dsm27445295f8f.21.2026.03.02.06.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 06:56:07 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-identify: Upgrade 2.6.16 -> 2.6.17
Date: Mon,  2 Mar 2026 16:56:02 +0200
Message-ID: <20260302145602.1385229-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260302145602.1385229-1-leon.anavi@konsulko.com>
References: <20260302145602.1385229-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Mar 2026 14:56:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124809

Upgrade to release 2.6.17:

- Add support for sconstruct and sconscript extensions
- Add support for 'slnx' file extension
- Add 'escript' file type for Erlang
- Add support for HLSL
- Add jbuilder extension as ruby text files
- Add support for *.diff
- Add support for *.cmd
- Add support for *.entitlements
- Add support for *.xaml
- Add support for uv.lock
- Add support for Fastfile
- Add support for Brewfile
- Add support for xcodebuild file formats

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-identify_2.6.16.bb => python3-identify_2.6.17.bb} | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-identify_2.6.16.bb => python3-identify_2.6.17.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-identify_2.6.16.bb b/meta-python/recipes-devtools/python/python3-identify_2.6.17.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-identify_2.6.16.bb
rename to meta-python/recipes-devtools/python/python3-identify_2.6.17.bb
index ef33b3d6cd..0ec329c954 100644
--- a/meta-python/recipes-devtools/python/python3-identify_2.6.16.bb
+++ b/meta-python/recipes-devtools/python/python3-identify_2.6.17.bb
@@ -5,7 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=bbdc006359f3157660173ec7f133a80e"
 PYPI_PACKAGE = "identify"
 
 inherit pypi setuptools3
-SRC_URI[sha256sum] = "846857203b5511bbe94d5a352a48ef2359532bc8f6727b5544077a0dcfb24980"
+
+SRC_URI[sha256sum] = "f816b0b596b204c9fdf076ded172322f2723cf958d02f9c3587504834c8ff04d"
 
 RDEPENDS:${PN} = " \
 	python3-ukkonen \
-- 
2.47.3


