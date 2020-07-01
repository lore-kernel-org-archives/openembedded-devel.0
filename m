Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.10735.1593562055566218361
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2020 17:07:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=prvnkMZe;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id cm21so872064pjb.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2020 17:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=Xo7Z2a/VVI7rqz+ovxKYUldXTK+ky1RrZl9BmdZ1Ruw=;
        b=prvnkMZeKXskECZOzD9PkKo78q4fBgLPDTybeqNUAgUFK5OHfEY34H097rxVSHj44q
         Bo9J1icBWi82FhhBQgeJBJUInVSrnW3Mafgf37pLFzoFI4PC0BmGY/HHo8iywes+eQCV
         aoJkfft5SHTOB7Poq7item5zRjcyJ/oC1ZQp9qAMxVSGJjuO295g3xEYPz+yx5uHhChv
         heVK+qBqdItnYchvXj+h6qyYa3Pw2IBuc3HORBG+xpGemLFv7/C7cBfSoGzCU6pEUZdJ
         DQlN1lLptJQwzeR0sOwzRPksVJ6V85Npiya9dRXNsuEj26H5wcbJaFXozM3jEVRMP8wU
         ieiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=Xo7Z2a/VVI7rqz+ovxKYUldXTK+ky1RrZl9BmdZ1Ruw=;
        b=c636uwBsTIyYHjqlQ59SBCh1c7ZU/xCspZCLCfYQUovxj9HGxY2AEj6oXD7tICQNsL
         VBudZjs6UsX43i5LtBsY2zckKm1JlmPODQqFjeKgXfQIrw/pqy4gPVT1T2OCtSxgC6e8
         msRVAlkfeTU/GA63uV4R0DA3ifDaZ86je0XnWrJFr0Fi26hQ76YhyWisgEuZ6T0kYXsU
         14SM6zS/+/9k2FJVtNZrV4LFbH42G3uzqvSQzloudU53qe2bRjgRmoeIn4mOcXQrFvR0
         3P4c66/WYTsapQHmO9AHCdNILHPv14YF8UyHCtcozdTR+JE9Y88pR3xAhicuTmOhUnv/
         aUjA==
X-Gm-Message-State: AOAM530N1RL3C+Nd4jAT/97Ajk/aVMz+ceruL2tu+14ljm5xkPXjqoi2
	WmruYmABR6sm394rTaNsV8LAsKaix1Y=
X-Google-Smtp-Source: ABdhPJxCQfGzZhTu4jkq7AsFbaNdG+UjofqQ5TMi/5WwtzC8N2wV2bIvgAmlAGWvzAQeJUkyUvHmVw==
X-Received: by 2002:a17:902:7592:: with SMTP id j18mr15757770pll.298.1593562054927;
        Tue, 30 Jun 2020 17:07:34 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:c85d:3ce:5443:9164])
        by smtp.gmail.com with ESMTPSA id z2sm3940544pff.36.2020.06.30.17.07.34
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 17:07:34 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfel 12/32] jpnevulator: upgrade 2.3.4 -> 2.3.5
Date: Tue, 30 Jun 2020 17:06:57 -0700
Message-Id: <0ad652654e7cec35cc639c09e0d7e394535b7bdf.1593561840.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1593561840.git.akuster808@gmail.com>
References: <cover.1593561840.git.akuster808@gmail.com>

From: Pierre-Jean Texier <pjtexier@koncepto.io>

See changelog https://github.com/snarlistic/jpnevulator/blob/master/Changelog

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 28bf55bafc57c905755f32d685452492db9eae41)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-extended/jpnevulator/jpnevulator_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/jpnevulator/jpnevulator_git.bb b/meta-oe/recipes-extended/jpnevulator/jpnevulator_git.bb
index d2819f76c5..50dd74b685 100644
--- a/meta-oe/recipes-extended/jpnevulator/jpnevulator_git.bb
+++ b/meta-oe/recipes-extended/jpnevulator/jpnevulator_git.bb
@@ -2,10 +2,10 @@ SUMMARY = "A handy serial sniffer"
 LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=892f569a555ba9c07a568a7c0c4fa63a"
 
-PV = "2.3.4+git${SRCPV}"
+PV = "2.3.5+git${SRCPV}"
 
 SRC_URI = "git://github.com/snarlistic/jpnevulator.git;protocol=http"
-SRCREV = "97438ecbd52fbc01540221bc590f8388a43c74e0"
+SRCREV = "c2d857091c0dfed05139ac07ea9b0f36ad259638"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1

