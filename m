Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47B43D75E5C
	for <webhook@archiver.kernel.org>; Sat, 23 Nov 2024 17:00:54 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.50699.1732381246757154339
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Nov 2024 09:00:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=W9Afjmgy;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-724d8422f37so2208297b3a.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 23 Nov 2024 09:00:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732381246; x=1732986046; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y3D5Feb+65woZRIkYntRTKJA0KX001OxfbnAFtRoTkE=;
        b=W9AfjmgyV26WvsT8nQKOcD3qja/4yEGmdHwCMBJw37C4JBMMUTkJDHVPwrPuChRhge
         0cUt5Eb5LrzSrls7np8tgXxqbk1IJcgZ0AOeqdDqDF/xfTFcJ5hIANRlTio59s2lf1+F
         6z9HMRJ+7ZoPuDH+kSeC6jsQYu+dUdigFJjs+AJ/YXdYimNw0RxnenjmAcYs+Wcpvgg6
         yPcR5nZMsw4yizvKus8wVQt/NpitboCQ8o94pZVK/5DkJXcS+RZACPpYQmrAm/CHYUof
         Szh0wiUD0H7/9wHCkVdtRgD7WgISYvZjRROIVZO0LeyqAxMXp+bWEazADTZuzFP2ayFe
         CshQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732381246; x=1732986046;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y3D5Feb+65woZRIkYntRTKJA0KX001OxfbnAFtRoTkE=;
        b=da+BabSvn3yZIA/lpmMt0b93J93vDAmDzj5a+hIOkrftL7NQfPPe34q7nhr2EYKTKv
         yavmcyYBgw6/V9q/jFKw/uCP/bQz2AuWc8BiKus3vkoM7bcmf3vqORtnlbEkHk/jqSff
         M7z0qhvAlJPWWFPAY3kR4eXJx5g41fCRtQlUDy8EbXG3i9JYjaRWgJQjA85Pse4cxuwg
         WcOLV2g0BN9yF8T+0l05cgREC4Vkar/wT4GQJk6zJ+L44FBVd7T9/a115/uwRGlBBQQa
         lTHITDQB2L/nsPUlBjCB8UgTlCq4flTNOZqmE14DgCyF1hJ84E2skP/Qwx2ualgfBRrd
         Lj/g==
X-Gm-Message-State: AOJu0YxsF7/YDf7x4Ru2jN9vMm4MamPWKMIITbuIfyijVHBzk6oLdWMm
	uT+fS2FK6at1wh5AgH/lqBEcdkxLy6ODUi7sYY2dIzyuEnRYpNZ1aRJ6dQ==
X-Gm-Gg: ASbGnct61q7N9XUN0/8MuyJKu3zaCVKVzvZfiDFKgEQRZFlzHVWjvOvwGPcbJZ9f/FK
	u1ANTbkhuwq2YuCuMD0dYA8CaHP6ZWpLV+X+6Y++4gwpxrR6rKb9c5Kh8j1/KQpiGlNHWbQWHOo
	wI1s8YjdONFtALzvbxDh5lFfk4dAjhi91sGa/6ZBltaYNML0L5j75KiebGcl1cR2pINYOBwAUd4
	xp4EVe52yEcNE0lY13IUjk8/dKu0Kn3HT7AkIkA6GD/hnLbWi4=
X-Google-Smtp-Source: AGHT+IFVsIxQgmifVuuzC/xHKMDSGxvd9sS9iACEDaQMVZYTSrVyxFw7ckDS//hqrtjbVo/5es95MQ==
X-Received: by 2002:a17:902:cec2:b0:20d:2848:2bee with SMTP id d9443c01a7336-2129f762404mr84146915ad.16.1732381245641;
        Sat, 23 Nov 2024 09:00:45 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8201:fd20::1dd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dc23a35sm34905055ad.250.2024.11.23.09.00.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Nov 2024 09:00:45 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] meta: Add SECURITY.md file to all layers
Date: Sat, 23 Nov 2024 09:00:43 -0800
Message-ID: <20241123170043.3164865-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 Nov 2024 17:00:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114017

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-filesystems/SECURITY.md | 20 ++++++++++++++++++++
 meta-gnome/SECURITY.md       | 20 ++++++++++++++++++++
 meta-initramfs/SECURITY.md   | 20 ++++++++++++++++++++
 meta-multimedia/SECURITY.md  | 20 ++++++++++++++++++++
 meta-networking/SECURITY.md  | 20 ++++++++++++++++++++
 meta-oe/SECURITY.md          | 20 ++++++++++++++++++++
 meta-perl/SECURITY.md        | 20 ++++++++++++++++++++
 meta-python/SECURITY.md      | 20 ++++++++++++++++++++
 meta-webserver/SECURITY.md   | 20 ++++++++++++++++++++
 meta-xfce/SECURITY.md        | 20 ++++++++++++++++++++
 10 files changed, 200 insertions(+)
 create mode 100644 meta-filesystems/SECURITY.md
 create mode 100644 meta-gnome/SECURITY.md
 create mode 100644 meta-initramfs/SECURITY.md
 create mode 100644 meta-multimedia/SECURITY.md
 create mode 100644 meta-networking/SECURITY.md
 create mode 100644 meta-oe/SECURITY.md
 create mode 100644 meta-perl/SECURITY.md
 create mode 100644 meta-python/SECURITY.md
 create mode 100644 meta-webserver/SECURITY.md
 create mode 100644 meta-xfce/SECURITY.md

diff --git a/meta-filesystems/SECURITY.md b/meta-filesystems/SECURITY.md
new file mode 100644
index 0000000000..1530103230
--- /dev/null
+++ b/meta-filesystems/SECURITY.md
@@ -0,0 +1,20 @@
+How to Report a Potential Vulnerability?
+========================================
+
+If you would like to report a public issue (for example, one with a released
+CVE number), please report it to the mailing list:
+
+  https://lists.openembedded.org/g/openembedded-devel
+
+If you are dealing with a not-yet released or urgent issue, please send a
+message to one of the maintainers listed in the README.  Include as many
+details as possible:
+  - the layer or software module affected
+  - the recipe and its version
+  - any example code, if available
+
+Branches maintained with security fixes
+---------------------------------------
+
+See https://wiki.yoctoproject.org/wiki/Releases for the list of current
+releases.  We only accept patches for the LTS releases and the master branch.
diff --git a/meta-gnome/SECURITY.md b/meta-gnome/SECURITY.md
new file mode 100644
index 0000000000..1530103230
--- /dev/null
+++ b/meta-gnome/SECURITY.md
@@ -0,0 +1,20 @@
+How to Report a Potential Vulnerability?
+========================================
+
+If you would like to report a public issue (for example, one with a released
+CVE number), please report it to the mailing list:
+
+  https://lists.openembedded.org/g/openembedded-devel
+
+If you are dealing with a not-yet released or urgent issue, please send a
+message to one of the maintainers listed in the README.  Include as many
+details as possible:
+  - the layer or software module affected
+  - the recipe and its version
+  - any example code, if available
+
+Branches maintained with security fixes
+---------------------------------------
+
+See https://wiki.yoctoproject.org/wiki/Releases for the list of current
+releases.  We only accept patches for the LTS releases and the master branch.
diff --git a/meta-initramfs/SECURITY.md b/meta-initramfs/SECURITY.md
new file mode 100644
index 0000000000..1530103230
--- /dev/null
+++ b/meta-initramfs/SECURITY.md
@@ -0,0 +1,20 @@
+How to Report a Potential Vulnerability?
+========================================
+
+If you would like to report a public issue (for example, one with a released
+CVE number), please report it to the mailing list:
+
+  https://lists.openembedded.org/g/openembedded-devel
+
+If you are dealing with a not-yet released or urgent issue, please send a
+message to one of the maintainers listed in the README.  Include as many
+details as possible:
+  - the layer or software module affected
+  - the recipe and its version
+  - any example code, if available
+
+Branches maintained with security fixes
+---------------------------------------
+
+See https://wiki.yoctoproject.org/wiki/Releases for the list of current
+releases.  We only accept patches for the LTS releases and the master branch.
diff --git a/meta-multimedia/SECURITY.md b/meta-multimedia/SECURITY.md
new file mode 100644
index 0000000000..1530103230
--- /dev/null
+++ b/meta-multimedia/SECURITY.md
@@ -0,0 +1,20 @@
+How to Report a Potential Vulnerability?
+========================================
+
+If you would like to report a public issue (for example, one with a released
+CVE number), please report it to the mailing list:
+
+  https://lists.openembedded.org/g/openembedded-devel
+
+If you are dealing with a not-yet released or urgent issue, please send a
+message to one of the maintainers listed in the README.  Include as many
+details as possible:
+  - the layer or software module affected
+  - the recipe and its version
+  - any example code, if available
+
+Branches maintained with security fixes
+---------------------------------------
+
+See https://wiki.yoctoproject.org/wiki/Releases for the list of current
+releases.  We only accept patches for the LTS releases and the master branch.
diff --git a/meta-networking/SECURITY.md b/meta-networking/SECURITY.md
new file mode 100644
index 0000000000..1530103230
--- /dev/null
+++ b/meta-networking/SECURITY.md
@@ -0,0 +1,20 @@
+How to Report a Potential Vulnerability?
+========================================
+
+If you would like to report a public issue (for example, one with a released
+CVE number), please report it to the mailing list:
+
+  https://lists.openembedded.org/g/openembedded-devel
+
+If you are dealing with a not-yet released or urgent issue, please send a
+message to one of the maintainers listed in the README.  Include as many
+details as possible:
+  - the layer or software module affected
+  - the recipe and its version
+  - any example code, if available
+
+Branches maintained with security fixes
+---------------------------------------
+
+See https://wiki.yoctoproject.org/wiki/Releases for the list of current
+releases.  We only accept patches for the LTS releases and the master branch.
diff --git a/meta-oe/SECURITY.md b/meta-oe/SECURITY.md
new file mode 100644
index 0000000000..1530103230
--- /dev/null
+++ b/meta-oe/SECURITY.md
@@ -0,0 +1,20 @@
+How to Report a Potential Vulnerability?
+========================================
+
+If you would like to report a public issue (for example, one with a released
+CVE number), please report it to the mailing list:
+
+  https://lists.openembedded.org/g/openembedded-devel
+
+If you are dealing with a not-yet released or urgent issue, please send a
+message to one of the maintainers listed in the README.  Include as many
+details as possible:
+  - the layer or software module affected
+  - the recipe and its version
+  - any example code, if available
+
+Branches maintained with security fixes
+---------------------------------------
+
+See https://wiki.yoctoproject.org/wiki/Releases for the list of current
+releases.  We only accept patches for the LTS releases and the master branch.
diff --git a/meta-perl/SECURITY.md b/meta-perl/SECURITY.md
new file mode 100644
index 0000000000..1530103230
--- /dev/null
+++ b/meta-perl/SECURITY.md
@@ -0,0 +1,20 @@
+How to Report a Potential Vulnerability?
+========================================
+
+If you would like to report a public issue (for example, one with a released
+CVE number), please report it to the mailing list:
+
+  https://lists.openembedded.org/g/openembedded-devel
+
+If you are dealing with a not-yet released or urgent issue, please send a
+message to one of the maintainers listed in the README.  Include as many
+details as possible:
+  - the layer or software module affected
+  - the recipe and its version
+  - any example code, if available
+
+Branches maintained with security fixes
+---------------------------------------
+
+See https://wiki.yoctoproject.org/wiki/Releases for the list of current
+releases.  We only accept patches for the LTS releases and the master branch.
diff --git a/meta-python/SECURITY.md b/meta-python/SECURITY.md
new file mode 100644
index 0000000000..1530103230
--- /dev/null
+++ b/meta-python/SECURITY.md
@@ -0,0 +1,20 @@
+How to Report a Potential Vulnerability?
+========================================
+
+If you would like to report a public issue (for example, one with a released
+CVE number), please report it to the mailing list:
+
+  https://lists.openembedded.org/g/openembedded-devel
+
+If you are dealing with a not-yet released or urgent issue, please send a
+message to one of the maintainers listed in the README.  Include as many
+details as possible:
+  - the layer or software module affected
+  - the recipe and its version
+  - any example code, if available
+
+Branches maintained with security fixes
+---------------------------------------
+
+See https://wiki.yoctoproject.org/wiki/Releases for the list of current
+releases.  We only accept patches for the LTS releases and the master branch.
diff --git a/meta-webserver/SECURITY.md b/meta-webserver/SECURITY.md
new file mode 100644
index 0000000000..1530103230
--- /dev/null
+++ b/meta-webserver/SECURITY.md
@@ -0,0 +1,20 @@
+How to Report a Potential Vulnerability?
+========================================
+
+If you would like to report a public issue (for example, one with a released
+CVE number), please report it to the mailing list:
+
+  https://lists.openembedded.org/g/openembedded-devel
+
+If you are dealing with a not-yet released or urgent issue, please send a
+message to one of the maintainers listed in the README.  Include as many
+details as possible:
+  - the layer or software module affected
+  - the recipe and its version
+  - any example code, if available
+
+Branches maintained with security fixes
+---------------------------------------
+
+See https://wiki.yoctoproject.org/wiki/Releases for the list of current
+releases.  We only accept patches for the LTS releases and the master branch.
diff --git a/meta-xfce/SECURITY.md b/meta-xfce/SECURITY.md
new file mode 100644
index 0000000000..1530103230
--- /dev/null
+++ b/meta-xfce/SECURITY.md
@@ -0,0 +1,20 @@
+How to Report a Potential Vulnerability?
+========================================
+
+If you would like to report a public issue (for example, one with a released
+CVE number), please report it to the mailing list:
+
+  https://lists.openembedded.org/g/openembedded-devel
+
+If you are dealing with a not-yet released or urgent issue, please send a
+message to one of the maintainers listed in the README.  Include as many
+details as possible:
+  - the layer or software module affected
+  - the recipe and its version
+  - any example code, if available
+
+Branches maintained with security fixes
+---------------------------------------
+
+See https://wiki.yoctoproject.org/wiki/Releases for the list of current
+releases.  We only accept patches for the LTS releases and the master branch.

