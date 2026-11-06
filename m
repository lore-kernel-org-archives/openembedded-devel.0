Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5707.1793971270440775962
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 06 Nov 2026 05:21:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=bbRaFnIx;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8b31ca7e0bcso4886617b3.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 06 Nov 2026 05:21:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793971269; x=1794576069; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=a6sURhmVG/k2/V8WOTzW3L9U7W5+nR4OLrHHblppiC8=;
        b=bbRaFnIxLX4gFF3Zdiwa2GEL/oJ9H6Qm7zGrBUoZfyYcmF8+r7oYPgnguowKoc6G+a
         XRoGicClQp6fnIP0MNo/qQJ3kc/T2P0kxSLQ5nEBqpVeV3ve/HAB3mJfxhmHHfe3tDqk
         ZVZompG7N4NF7Sybk99znxTi0zrK9qbHeXGZLVBp0nToRgK1EX47s6o2+NcSix+qjNBR
         mf5b3lyURLCAP/xfy72fFcZ4W1BQs7IoNh775q8jGFsUnpfDDmsAOH6WwbTGWKvM5I8C
         ejziClY4KavbyotF93Cfb8nez67FvhR59Lt/94ewQIUEnl+wK9gYqE4/DXVhKhJ50XTM
         pxIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793971269; x=1794576069;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a6sURhmVG/k2/V8WOTzW3L9U7W5+nR4OLrHHblppiC8=;
        b=LbcaS+wVhY6r/oN4EfWxj/ywjLbGoSjv6uW6sefwtrbQZlV1NWlhRKYrOCJOiLFYT8
         0eEPdDFRFOvdAQ9qUtBcvpnc8QBRLgvdpfgDsoqesCzfaCKCV1o3GLbE1XQr7sgZagsb
         ZJ8hIRM1rC3ezv9t/MFCKrI+NbJwn1lGg+zisReYqbw2xM7PN7HqH+kcdK8Oi8l4sAoL
         zRdODzzYokJmBY9Dm0DroK50RxmC+VcqOGTKwVGIM4kL/NG/oAy9yvtUTe1rpwVVHXk4
         /GQ4L3+SLpMVD/dyxO7u8NEUQe1Vj96UbeSXX4MzJgRg4Hn9TWbhEqCcGF4+S0w6GpE9
         KQ4w==
X-Gm-Message-State: APuU4Z9xc4v2cxxiQRSA4p6pYB9fkqPUj620mzvTTM5PlUSx7YPnho2w
	3gFiPVAhCkgfZYAaWuSiujQZ/joHq71Tl+f84MGRbRBU7b2szhT0SqOdOe8ZFmPf
X-Gm-Gg: AYBFou2JH7irt9L7jvpMsXQWQtQtvPdYzgsf8K13pHamQZHBMhFLNuax3nC8BfzEySR
	by4Yi6yBalW32XzUZ11bOA+cwS/hmILy6RZuAAf8gZdZDt53kqQoBGtkPHVR8KhCR879aN2/4/g
	d2z623eUvTWFEc+eoI0WNmIWCnfswUQOXy2FHAmkeRjpMkVTyLjtODvwYRUIANhRzSAw6wTXEpG
	gfIqd+RbLycrgUGZNRnkbnGX8cFlm7BB0PktA3vBjaBIUre3aGyFW2a3mj8EsWTDxo5ORrGQhI9
	3DfQSbn94TzKIcujmVjsI/YrVURkg+GzkuTXjeXbzfE4SN04uLF0wcQYpG47XbFEI43UIUsaUib
	z2zMECPNprq18XRryCRrckOUnFI7HPnJisC8rAMWg913BOO3GWz6/SjBa1Fd4y8bUZvPmN7kzS2
	DkjkQPbOSp69Mt33WU7qfBPdLpAvXOXZ6W66IhPsLhEd7igak827+ssjDGITolInwswYtISZeCz
	qHxjxVoeL9IVN8bt4IllIn7x8xYnSVNiKj3H5mfM3Wy45OwAudj9kN3mhufyeCXjARqUyNPTuKk
	8xEVvCZuG8f6MNTS8Lr1e4tlbhbDiehXyFgZoILH3ygF22/EpUnAeM+IGajxKJOBpcDbxKnJTla
	P+q08xtp/c/nbe5rYglwdJJVHl0PoKd7Sf7kjYvT14HIWgMAPk6Uf
X-Received: by 2002:a05:690c:113:b0:8ae:e69d:913a with SMTP id 00721157ae682-8b34179cfe1mr16100637b3.1.1793971269218;
        Fri, 06 Nov 2026 05:21:09 -0800 (PST)
Return-Path: <schonm@gmail.com>
Received: from localhost.localdomain ([71.3.193.106])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b33f8240dbsm18306197b3.28.2026.11.06.05.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 05:21:08 -0800 (PST)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH] yyjson: upgrade 0.12.0 -> 0.13.0
Date: Fri,  6 Nov 2026 08:20:58 -0500
Message-ID: <20261106132058.1399801-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 06 Nov 2026 13:21:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131971
Content-Type: text/plain; charset="utf-8"

Changelog: https://github.com/ibireme/yyjson/releases/tag/0.13.0

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../yyjson/{yyjson_0.12.0.bb => yyjson_0.13.0.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/yyjson/{yyjson_0.12.0.bb => yyjson_0.13.0.bb} (96%)

diff --git a/meta-oe/recipes-support/yyjson/yyjson_0.12.0.bb b/meta-oe/recipes-support/yyjson/yyjson_0.13.0.bb
similarity index 96%
rename from meta-oe/recipes-support/yyjson/yyjson_0.12.0.bb
rename to meta-oe/recipes-support/yyjson/yyjson_0.13.0.bb
index 703c2ab3ee..8e20e11d31 100644
--- a/meta-oe/recipes-support/yyjson/yyjson_0.12.0.bb
+++ b/meta-oe/recipes-support/yyjson/yyjson_0.13.0.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c8ae1b99922935413d4c596f50b59545"
 
 SRC_URI = "git://github.com/ibireme/yyjson.git;protocol=https;branch=master;tag=${PV}"
-SRCREV = "8b4a38dc994a110abaec8a400615567bd996105f"
+SRCREV = "6447536015f3d600f3d65323b10976103b337ca7"
 
 
 inherit cmake
-- 
2.43.0

