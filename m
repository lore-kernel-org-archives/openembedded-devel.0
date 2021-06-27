Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web08.2651.1624825346604566732
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Jun 2021 13:22:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NvXw1LK3;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id y4so12278601pfi.9
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Jun 2021 13:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=7pqHbfkmRhi/okNaoztIIaf9XtQctb37ZWxzmu0+llA=;
        b=NvXw1LK38Ni21NV/0VBTbQRcarsMjNjqIYxyEDmrm65+e/5GXd8hoP4e0bjJ4WV+55
         SYDv3cX9TzsD0Skt9BeFFOaIZ7nEFtZUStuprt5sdtYyGibhRgJ9Hnycnc+u4G3NcQHo
         TJu1YpZqfhyZdQDGJeRNRuNV3868ft+ogYaVd93jTxxfOYr+0yMpH5KT4OLtsLe91sAF
         KSG8mS2dZZPlcsEw+EZOPVRDqRUera5HlZjWawhl5wkcTs98TZKy07+WSx7Us61ttYBg
         9xDNkto01rV6oH5a8PIah9Uh34fwDQM3jONtFQXyKbWjrzB+OQ87/6cs+I7grf0yjh5B
         KBUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=7pqHbfkmRhi/okNaoztIIaf9XtQctb37ZWxzmu0+llA=;
        b=Vrl42ISI6HRutj1to1sHEm8pjbxmH87BqrC6CynkffRk19ODCyAN3m+WCoMxTlvcMn
         QELivob6rQvqlGZgCZPGGPlrRbNzJry0d1P5R1ZN/fVboWrLqhmUiqdsLvNEWNJW4g7N
         qLdcc+yMyK/HTMCqNJGBPn0DjEhTgTb1Y9Ryx+rp8f60lV9iDbf8O1T/wPGy6jYw+Tka
         Mh9ZpkHOX0ozGWw2K5jMLVqw+JwvHPZhBBq5aeGyGMoY2kSvAVC61OXhCq7pE2dpmZ2c
         9qtGzI1QMULj7GZmQ4uV5SZtZuzjMMWD8pg071y/f6S/V3BwyfUOVxVYQCJLJk+mxt1s
         pw5w==
X-Gm-Message-State: AOAM531dWcmxAVYc8c4K/4Lpqkw8X2btVQ00Onw9St6/Wflt16DFQZut
	7OquM8clvnX+fy40XbcRfuweRYpudJaLJg==
X-Google-Smtp-Source: ABdhPJxkmwqRkZP/AwT+T7lpeiRhqECeJkAjzq+3Z9CA6sCPzD59vtF8ZzYW1rff9F29QdQ2MgiWRg==
X-Received: by 2002:a63:a1c:: with SMTP id 28mr1771749pgk.63.1624825346012;
        Sun, 27 Jun 2021 13:22:26 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:90a0:cfd2:ffe1:efef])
        by smtp.gmail.com with ESMTPSA id ay3sm3501192pjb.38.2021.06.27.13.22.25
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jun 2021 13:22:25 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 08/20] initramfs-kexecboot-image: support cases where machines override IMAGE_FSTYPES
Date: Sun, 27 Jun 2021 13:22:03 -0700
Message-Id: <32b4237a2729f025f641f0d52bb0b1b4d93da255.1624825239.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1624825239.git.akuster808@gmail.com>
References: <cover.1624825239.git.akuster808@gmail.com>

From: Andrea Adami <andrea.adami@gmail.com>

test case: zaurus.inc

IMAGE_FSTYPES ?= "tar.gz jffs2 jffs2.sum ubi ubifs"
IMAGE_FSTYPES_collie ?= "tar.gz jffs2 jffs2.sum"
INITRAMFS_FSTYPES ?= "cpio.gz cpio.xz"

The last assignment IMAGE_FSTYPES = "${INITRAMFS_FSTYPES}" did in fact
reset the value to IMAGE_FSTYPES_collie, thus not producing cpio.gz / cpio.xz.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit cdce92b4e9e82327fe2b3118384c424d7f08cc0c)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-core/images/initramfs-kexecboot-image.bb      | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta-initramfs/recipes-core/images/initramfs-kexecboot-image.bb b/meta-initramfs/recipes-core/images/initramfs-kexecboot-image.bb
index 9a686f366f..dd082ba529 100644
--- a/meta-initramfs/recipes-core/images/initramfs-kexecboot-image.bb
+++ b/meta-initramfs/recipes-core/images/initramfs-kexecboot-image.bb
@@ -1,9 +1,13 @@
 SUMMARY = "Initramfs image for kexecboot kernel"
 DESCRIPTION = "This image provides kexecboot (linux as bootloader) and helpers."
 
-inherit image
+# Some BSPs use IMAGE_FSTYPES_<machine override> which would override
+# an assignment to IMAGE_FSTYPES so we need anon python
+python () {
+    d.setVar("IMAGE_FSTYPES", d.getVar("INITRAMFS_FSTYPES"))
+}
 
-IMAGE_FSTYPES = "${INITRAMFS_FSTYPES}"
+inherit image
 
 # avoid circular dependencies
 EXTRA_IMAGEDEPENDS = ""
-- 
2.17.1

