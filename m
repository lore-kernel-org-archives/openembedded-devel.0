Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CF87EC113C
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 19:00:35 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.53112.1772046030372957403
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Feb 2026 11:00:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=G4thct/u;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4398d1f06caso55480f8f.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 11:00:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772046029; x=1772650829; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=tp87zwJeVQflax30uUJ1KIbvK5SXMGl1XOMPLfeD/vk=;
        b=G4thct/uKm2aZZcXqcvj86csh68MTEDL0vU6WhrKQIJsS7gFkg0dz+D8hrIjZuzRfQ
         pXqeLre4zbIJcYuFhsxkvQnYwtH9ZYqmqvgsl2I4+g7Z5u4AR5InFiglGPqhhTHc1Wjc
         B5dTTI/8GCSuBwLmRyqYSSfoBukN8lZQ2clPVx8Ip63FIifKbOuH3iJRftLjh3cdvja1
         hTH6dWi1dt5VhntPfy9PTN/7pwxCOh8DTbehffhEvsV64CFf3wkOgLHjRYF0vJV+4/Vj
         /0LA9VvW+/iZopDX4QImPrLLb3qREQo15HNT5tWnGXK5wtUwPs1ZKPyUEyTrlmqVbnXk
         Vv9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772046029; x=1772650829;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tp87zwJeVQflax30uUJ1KIbvK5SXMGl1XOMPLfeD/vk=;
        b=q5i1JVcbJmQLxuHtCGvOKOyNBGK5J+dy1g7ObT4wKuVCjiNGdvQoH+2b85/wpVHO4l
         8GZVhfQVPA495vckBXcnf/IvFCBdShsEaHsSy7VdIfTnAvVfP9yrrx8YRdU8mbHwr91A
         2NUWSYAcxFeauYzT4UGqX/vVGsP5nCxfUdFHzbrRjZNUBYFIQGT4PNUY/Znr6D36t0de
         m/I4FDJ9a81E7wbsAC+/ON4UjwCqYyhUCBG0MHjj0Qifm9i6ETdEu8rREvXVqhTX3wkq
         pnxDXdmYs15vihQqNKpb1BRTHsz705uHvgk3HobnU7VEp+Yd95gzk60APce4LQGd/TTE
         vuag==
X-Gm-Message-State: AOJu0YxFdPaNEacXG2Tbx9zn7nbKrCizdOWACPB0LNY8mGLeroTuPxGC
	ITo+CzSoKogqtanv+1tI9d6ls3b2Qr1DMIlKuhYFZj9fUaOlPPQ0Xt6xpmagVg==
X-Gm-Gg: ATEYQzxsw5eaIXATdS2uyfJU8sQr/9iXpeIu80kmb5CZdxXW0XBy3ZjmKwW/9vYClqS
	qcRqO+sFo4f7up6fxnEyixGXbY5vf2Q0DNPZXgumwZJxE9iftnY0DtasXvInkW7elz0Epb9cnmw
	qnUX+nwxBHcvHPE44t89+T8GJVr154OQ2TfcoXp9bi+Du8DEtx2+AryF0H0s5xmgx9KWAwo3bgJ
	1/K/qKWpcKP5Z/5QNv8zbY7lY9dYlqdTGGfdSxYwVRONrQIBmxt+1T8cYq2S5nGo24Q10MPiDkf
	9U+qLGr3catbY4W8syOz0MnjmndL3tA2+9wUyFQqwLMd0BQm86efRNtx+nxep8rowJ6E4AjgvKG
	GXDG4pvn4ia8Q2/CwrHenf1CGO/7qWDIBJRaHZSXJGY2XsrzX4u7yWmk+hTS3WJL1bDvyE/QObG
	SYes6RWdJEK0ju0myL5/a+YsuCCDd1jG0=
X-Received: by 2002:a05:6000:25c8:b0:437:6e6e:6f95 with SMTP id ffacd0b85a97d-439942e2c68mr2703546f8f.27.1772046028450;
        Wed, 25 Feb 2026 11:00:28 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bf9fb2sm36072818f8f.1.2026.02.25.11.00.27
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 11:00:28 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-filesystems][PATCH] zfs: upgrade 2.2.8 -> 2.4.1
Date: Wed, 25 Feb 2026 20:00:27 +0100
Message-ID: <20260225190027.617371-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 19:00:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124658

Changelogs:
https://github.com/openzfs/zfs/releases

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-filesystems/zfs/{zfs_2.2.8.bb => zfs_2.4.1.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-filesystems/recipes-filesystems/zfs/{zfs_2.2.8.bb => zfs_2.4.1.bb} (97%)

diff --git a/meta-filesystems/recipes-filesystems/zfs/zfs_2.2.8.bb b/meta-filesystems/recipes-filesystems/zfs/zfs_2.4.1.bb
similarity index 97%
rename from meta-filesystems/recipes-filesystems/zfs/zfs_2.2.8.bb
rename to meta-filesystems/recipes-filesystems/zfs/zfs_2.4.1.bb
index 1fc1457b19..5c02d58242 100644
--- a/meta-filesystems/recipes-filesystems/zfs/zfs_2.2.8.bb
+++ b/meta-filesystems/recipes-filesystems/zfs/zfs_2.4.1.bb
@@ -4,8 +4,8 @@ LICENSE = "CDDL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7087caaf1dc8a2856585619f4a787faa"
 HOMEPAGE = "https://github.com/openzfs/zfs"
 
-SRCREV = "3e4a3e161c00273303cd9fa9e0dc09ead3499a8a"
-SRC_URI = "git://github.com/openzfs/zfs;protocol=https;branch=zfs-2.2-release \
+SRCREV = "1c702dda346a59e05cfd3029569bbb1d5d91c54b"
+SRC_URI = "git://github.com/openzfs/zfs;protocol=https;branch=zfs-2.4-release;tag=${BP} \
            file://0001-Define-strndupa-if-it-does-not-exist.patch \
            file://aaf28a4630af60496c9d33db1d06a7d7d8983422.patch \
            file://0001-fs-tests-cmd-readmmap-Replace-uint_t-with-uint32_t.patch \

