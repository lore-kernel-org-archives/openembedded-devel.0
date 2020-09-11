Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.7534.1599866242194302104
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Sep 2020 16:17:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=H04jRyZz;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id x123so8423030pfc.7
        for <openembedded-devel@lists.openembedded.org>; Fri, 11 Sep 2020 16:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cjiwHE7dhCXe4l4BHDz741pdVz0Vb+rNcG9SWUCkjxA=;
        b=H04jRyZzolJxw4uDWiDlg2j8LsxGImFLmKtO5Nyoe8yzakZ/35fmfviqrcrLQQn2Qp
         uvBfqjilYDbMpc7DMek4gsdfF2nzfyDX1D3M6bPQe0EFMMRQtEt8fGs6QEjV1pNKlC25
         5KHioZrBxAyENftu2T6rV7ruxanOL+QOo9mK0bau/oMhHs65E4bOfpcEDoeRvVRpMjcc
         lWU5oDr1fbfM6U+MDXWpZRqUN/dVV1uBVmtv4L68WlNxJH3hYSC7aWW5DhOSuwB+Fenh
         MhCiZ+4xODO0kZXYKQWiNuf4NL2HIyxyq/WwIUlo+a+1SK3iT7rHLlWgFaJh5YrCBu5U
         9ncw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cjiwHE7dhCXe4l4BHDz741pdVz0Vb+rNcG9SWUCkjxA=;
        b=Wl6SalqrcbReUcaB8gmoHwZ+UW+Rk5adXq7CmIaUXbuDo6xzXeGTipVqJNbqf5CSgZ
         0UF3rztbo8bFhrKiKAZzvqVohs+6fODwOPMPZRpbz8WxXPYv1mw60HXBiUOMni8HQZ9n
         FFvfbBVvuqXrCWaMDYsFp+v/0ulYn/AuXWc+cMK00Bb5Vm0PIDn/vtOJZE1mkNopkh7d
         cBHFnJ8m8xt3/RDv4fqgF+E7bja8aeGd0t+qAMy/EhsAgVyYAcVHzRr25o5O6n2KPhvi
         kzH19Zcnyc9zKDtqWj95ENWFFN9cFEEZVprBS2waV1Qz5q9EQyxIuerdFJhM+P4dyzNq
         rmdg==
X-Gm-Message-State: AOAM5312vbkvPYShzDM9LFT/86vAvaLYeN74EtsbjryRiF3RhshSlfou
	GKRb8U7VLAGyQMK1i1pk1u2+Sq7vRBXqvA==
X-Google-Smtp-Source: ABdhPJxcPZTNhx9xhF+wrx2b8a0Eera9XZLPu5AwjCfoWf7NMbuHfaSBsb3xs+0UygL04A+C2UjHYg==
X-Received: by 2002:aa7:9787:0:b029:13e:d13d:a05c with SMTP id o7-20020aa797870000b029013ed13da05cmr4079047pfp.34.1599866241461;
        Fri, 11 Sep 2020 16:17:21 -0700 (PDT)
Return-Path: <ticotimo@gmail.com>
Received: from thetis.hsd1.or.comcast.net ([2601:1c0:6000:9640:5532:62fe:ec6f:17d8])
        by smtp.gmail.com with ESMTPSA id h7sm2721756pgc.58.2020.09.11.16.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2020 16:17:20 -0700 (PDT)
From: "Tim Orling" <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <ticotimo@gmail.com>
Subject: [meta-python2][dunfell,master][PATCH] kas-meta-python-ptest-image: fixes for GL
Date: Fri, 11 Sep 2020 16:17:11 -0700
Message-Id: <20200911231711.14666-1-ticotimo@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To make testing as fast as possible, it is desired
to use KVM and OpenGL.

Add
  DISTRO_FEATURES_append = "opengl"
  PACKAGECONFIG_pn-qemu-system-native = "fdt alsa kvm virglrenderer glx gtk+"

It shouldn't be required to be explicit about the PACKAGECONFIG above,
when all I was trying to do was add gtk+, but but using _pn- += or even
_append_pn- syntax resulted in a system with either disabled OpenGL or
missing canberra-gtk-module (sound). The above explicit definition worked.

Change gl to gl-es:
  TEST_RUNQEMUPARAMS = "kvm gl-es gtk"

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 kas-meta-python2-ptest-image.yml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/kas-meta-python2-ptest-image.yml b/kas-meta-python2-ptest-image.yml
index 1dc0f4b8..a2ee8ca0 100644
--- a/kas-meta-python2-ptest-image.yml
+++ b/kas-meta-python2-ptest-image.yml
@@ -8,15 +8,17 @@ distro: poky
 target: meta-python2-ptest-image
 
 local_conf_header:
+  enable_gtk_in_qemu: |
+    DISTRO_FEATURES_append = "opengl"
+    PACKAGECONFIG_pn-qemu-system-native = "fdt alsa kvm virglrenderer glx gtk+"
   enable_ptest_and_testimage: |
-    INHERIT += "rm_work_and_downloads"
     IMAGE_CLASSES += " testimage"
     DISTRO_FEAURES_append = " ptest"
     EXTRA_IMAGE_FEATURES = "debug-tweaks"
     TESTIMAGE_AUTO = "1"
     TEST_SUITES = " ping ssh python2 ptest"
     TEST_QEMUPARAMS += "-smp 4 -m 8192"
-    TEST_RUNQEMUPARAMS += "kvm gl"
+    TEST_RUNQEMUPARAMS = "kvm gl-es gtk"
     IMAGE_ROOTFS_SIZE ?= "8192"
     IMAGE_ROOTFS_EXTRA_SPACE_append = "${@bb.utils.contains("DISTRO_FEATURES", "systemd", " + 4096", "", d)}"
     IMAGE_INSTALL_append = " ptest-runner dropbear procps coreutils iproute2 sysstat"
-- 
2.25.0

