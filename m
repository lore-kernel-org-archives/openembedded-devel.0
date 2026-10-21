Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9001.1792581624230038327
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 04:20:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=R0h3JD9F;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso4885645e9.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 04:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792581622; x=1793186422; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QMaxf5RtmpUEaW2hZ7VnVZLuCgL8wa/1imSxIgBEYUg=;
        b=R0h3JD9FKpB2s73pNo2hYqhb951wFJwlwjP2OlPUiiw9HVOpJQwLDbzp67fw/a4NvO
         LxFyCcZOBcJCMLDZjOyxFrbjCC94cRkFCHv8kj3W/mXEIETlW3PbVyA0jHjn2oK3fvuc
         q+mFW3HCPNhWuShIJSk1Uakq4sMdc9S+QnBNUnwRqnNcAtkjcVHGTBxtAweXimS8VFBQ
         n171KqlBPxlbuwYbFq7SFzrCSLuvDMBTjRNfEnm6s9d7nvfYFDFToDi+eO1vFAZ/ErZv
         yKbgtvHQ72GiIGGcYHDosVOpxdADI6hMV4ei2zDk1/qdpjeyKE6iyiM1R1KOztxXoGKR
         MGag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792581622; x=1793186422;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QMaxf5RtmpUEaW2hZ7VnVZLuCgL8wa/1imSxIgBEYUg=;
        b=VYzdZ2Q2XDPp5n3HeoE3o08vAflwo2dB9Ur92L7jRv8pqb/0n/chI0VrsG521r4wqp
         yHsHNVLYir3Oab52jXFsQ5MUj9IzkP8di4gBOjXCOgYymQEfDkfgB7xnN7/0+L3zCAvv
         GWrXnPJ/qGd7f5Yv3IBIGkdEESvsPFRoyA0vwIES3wEzb1CMl38XlmEu26RfI2h8vMnU
         zwHH9q4UcNrsOnPx4PfxZCmJ6ZZSLQw80APEd9DLYnJ48+Md7AQ4X5zkoLlaALF+hpT/
         pIuB27cZqfXLq4TVz3A0Lx4WYX2CVDtSmVCF+zN5LTAzKlYfUV4HKce5OTG7rNgp+SHQ
         ORLA==
X-Gm-Message-State: AFq9FYLzxu04C4V70DYDHxuT52IS7YDQs4TqZXopyK7noYHZ2lmigNM2
	NQ2d85MOXde7qEmf34tvUeQxhtl44PgojCLhGaNhhaeDkEjRGowvb3koWxHKIA==
X-Gm-Gg: AYBFou23vT/85X89TQkGWgJ53h3sjYd+Xr4iRo3s4EAEhMAYPmNV3y9K2Oir3e9K3Gp
	r+p1cqYTpzp/dvN3kdTbthZpakYIa22vjK8iYpu0ulWIUCTTYdnuQhsd0GYrZtNfulhJexJh74M
	mxUXKDhvw23Ux6srgDCGk1lVThzzHjbS21drU1GLtft3ID69FdBlLfysO+sEhYGLwuzajULKxNz
	HAeBl8DuP5S4XoEnBCG9XlceB/9a+KemIDs6S94+DWJvUrlQ40vGtc1nOGpyU2KZEbBnjWFsIF6
	m2/XSNRjsshFWaHhIiVwgmWH+Igutn+lOaF0n/FHvRX29tfYxbeFLShksBF1747FACv1GYNOXrn
	wTyy0xfRc3W4o+zFn1i/TnygU8nbvrzC3yxuewKbQNIIiTPjb7s7HDbYJj5pVVKagqeYRAyDC7d
	lnOJrjiIblaQdVIWRw+/nIpdJqH3NqWj1YeV+mZsupwc6W0CuAsWtOt38inc14EzynEM58Effm1
	MwsanmMBuzyWBkPrwYwo38yyQHICxKhNnMcZqLuXS+Kx6vaUDHXwVNlghScQf+Ut2L7N1L41ziX
	uWaaqpG/bdxFLa9pjQtRMQcZi+kJmm0=
X-Received: by 2002:a05:600c:8b41:b0:4a0:23f:8b0d with SMTP id 5b1f17b1804b1-4a1fd8a7c32mr34868685e9.2.1792581622082;
        Wed, 21 Oct 2026 04:20:22 -0700 (PDT)
Return-Path: <costamagna.gianfranco@gmail.com>
Received: from dld58y9k4-lin.dl.net ([2a02:b025:11:a347:e283:9270:4eba:9eb7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2d85a9bsm163419945e9.15.2026.10.21.04.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 04:20:20 -0700 (PDT)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <locutusofborg@debian.org>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <locutusofborg@debian.org>,
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Subject: [meta-oe][PATCH] vboxguestdrivers: Upgrade to 7.2.22
Date: Wed, 21 Oct 2026 13:20:16 +0200
Message-ID: <20261021112016.2139949-1-locutusofborg@debian.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 11:20:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131298
Content-Type: text/plain; charset="utf-8"

Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
---
 .../{vboxguestdrivers_7.2.20.bb => vboxguestdrivers_7.2.22.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/vboxguestdrivers/{vboxguestdrivers_7.2.20.bb => vboxguestdrivers_7.2.22.bb} (98%)

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.20.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.22.bb
similarity index 98%
rename from meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.20.bb
rename to meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.22.bb
index 8ceef234cf..daedf17160 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.20.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.22.bb
@@ -24,7 +24,7 @@ SRC_URI = "http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2
     file://Makefile.utils \
     file://0001-vboxvideo-let-the-build-decide-if-drm_fb_helper_alloc.patch \
 "
-SRC_URI[sha256sum] = "5c2138213b72f36c129b92c2c267f2a40e9c98513f4c86a584327f09f9be706d"
+SRC_URI[sha256sum] = "440a2b3eeb46e7e992961b70ef24f43e95b3c99fa2ab30aac20b963ef9e91ad7"
 
 S ?= "${UNPACKDIR}/vbox_module"
 S:task-unpack = "${UNPACKDIR}/${VBOX_NAME}"
-- 
2.43.0

