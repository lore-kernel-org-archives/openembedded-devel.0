Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFB65C79FA0
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 07:33:46 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.85363.1767684818534942583
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Jan 2026 23:33:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EmZZR5kc;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43260a5a096so390025f8f.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 Jan 2026 23:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767684817; x=1768289617; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZbIMaZhCrXzSBjvG0SZc3jPmf4DSjURleuW/Jk9CVEg=;
        b=EmZZR5kcRbrXWIX/Il1rd8NXLzR7X8n15hsNyPttWStaHxoGOh19cLxnPVmn90pwO4
         zlUqUYkOs+xvsj0m4zSb7N/7rvjmsSgDIlQQReMJhxj8C6rDehCBOTqXGyl5uvjLO22a
         oxlBzf2XtZOqRJ10fwwjEXjm9zido008BtlF1e33ZMHbo6IyZ1LDm8tj2+rCRSRZWD8g
         nDT6yYBGprgMfIMD0+3IENGFUKrKeRtxfENYW6KGURS3QJPKg5UXkLutVpgyJWMztAqJ
         GaovO6aN6rhPr2mD2F3a5rs6P9GK5pRV4iPJ1MRNntaJtFoThsMeHDfIe1IMUjRuO2S+
         02CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767684817; x=1768289617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZbIMaZhCrXzSBjvG0SZc3jPmf4DSjURleuW/Jk9CVEg=;
        b=r/i4g/h9bf6mZ3nVN3iHVB6w90EGmEbWNtpc4fFS4IgSmVNUQ3U6LN17Wb52Gru3yg
         pOXbXnk5rvPRew4wtU/VwOeAezIjNYKqa2yB++VgNmbI+lHChXzw4v/TVuppaZckGwoL
         A1B/Iwu+J0rANK1BoLOwWwu3OsHom1z3fRTEcB0v2H33AUDb8CvbnW4GmVozCmON4WYz
         I5nGoF6SnB7Ey+/Oe3QQbAwjm/zh20MrNgls9qS/LiSAOQqmUCtnSCa0Kbu+bIYMZOIr
         2zAlJRTn0Z8LDkJxzCeo4pLjDKWs93n3fA41jWVSb1xAglzcX/YpSjqhITv+leO8Qcvz
         DlRQ==
X-Gm-Message-State: AOJu0YwNRgaECDyq2HLCPcLeoa70JdHwriNnUv8n+OYdP7UMD7xw2a90
	qmT5SpAYbKKA+5RJRPpt8WJOHbRbnjIuMEAlxqi4ZftNIFTm4mqfbDO6FWxr+g==
X-Gm-Gg: AY/fxX5Ui1RXtGtVVZWMtvFLtA0mOA5JMdNacbEBIJhNnvQysAkhe8YNLy8uLdO4lkN
	V9k8oMV7TbTa8H7GwqvpzPu7UMfRqsNhOymfJkmugB5jlMNFLalOqbb6+MWP3dVy04C/HW2ZzkU
	LhG5psN7qgPn170GkYhDLwAU6xuzsXsG5ttMA+sRRf2CwqV7rAPxhE5Fuo2ZU4HVACqAVn2Mwai
	1r5PZSg1+tVu2B1MNJzyH0u6mPTf59EFt0GGANb9ieQZtUO8KGBH0A4BDS/zFiQNuNePJ3g3B1I
	shsKvjLqWqPPjOVUkrT/UOmTHGGqSoy7ukIPRxah7Z7Ke1sWFMaU4SGLRHxaWSZM21Ri+u4Nr3V
	E+z8iDG1qylhf3zZ15sj2s6G2oVFL/RvOXkYEiZvRQx+SrcSAFEWlWrZnhMHmymgJDBoxIVpds6
	07hnhIl3spmP+gq81Pt8I=
X-Google-Smtp-Source: AGHT+IF729q60L32gxjncKdUgiUTIZ9+SwINxRNAxwy29ouN79wghl08wlT+cltcb6dX/8ag3z0QLQ==
X-Received: by 2002:a05:6000:2511:b0:430:f5ab:dc8e with SMTP id ffacd0b85a97d-432bca18775mr2956266f8f.13.1767684816571;
        Mon, 05 Jan 2026 23:33:36 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0e16f4sm2811251f8f.11.2026.01.05.23.33.35
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 23:33:36 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][kirkstone][PATCH 2/5] python3-ipython: patch CVE-2023-24816
Date: Tue,  6 Jan 2026 08:33:26 +0100
Message-ID: <20260106073334.3462222-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260106073334.3462222-1-skandigraun@gmail.com>
References: <20260106073334.3462222-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Jan 2026 07:33:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123164

Details: https://nvd.nist.gov/vuln/detail/CVE-2023-24816

Pick the patch referenced by the NVD report.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../python3-ipython/CVE-2023-24816.patch      | 94 +++++++++++++++++++
 .../python/python3-ipython_8.2.0.bb           |  1 +
 2 files changed, 95 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-ipython/CVE-2023-24816.patch

diff --git a/meta-python/recipes-devtools/python/python3-ipython/CVE-2023-24816.patch b/meta-python/recipes-devtools/python/python3-ipython/CVE-2023-24816.patch
new file mode 100644
index 0000000000..e5f65fbb68
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-ipython/CVE-2023-24816.patch
@@ -0,0 +1,94 @@
+From 06db417ff15192d73ddac4bf0e2f20579d47b2e0 Mon Sep 17 00:00:00 2001
+From: Konstantin Weddige <konstantin.weddige@lutrasecurity.com>
+Date: Sat, 3 Dec 2022 19:14:09 +0100
+Subject: [PATCH] Fix CVE-2023-24816 by removing legacy code.
+
+Remove legacy code that might trigger a CVE.
+
+Currently set_term_title is only called with (semi-)trusted input that
+contain the current working directory of the current IPython session. If
+an attacker can control directory names, and manage to get a user cd
+into this directory the attacker can execute arbitrary commands
+contained in the folder names.
+
+Example:
+
+    - On a windows machine where python is built without _ctypes, create
+      a folder called && echo "pwn" > pwn.txt. This can be done by for
+      example cloning a git repository.
+    - call toggled_set_term_title(True), (or have the preference to
+      true)
+    - Open IPython and cd into this directory.
+    - the folder now contain a pwn.txt, with pwn as content, despite the
+      user not asking for any code execution.
+
+Workaround:
+
+    Set the configuration option
+    c.TerminalInteractiveShell.term_title_format='IPython' (or to any
+    other fixed, safe string).
+
+CVE: CVE-2023-24816
+Upstream-Status: Backport [https://github.com/ipython/ipython/commit/385d69325319a5972ee9b5983638e3617f21cb1f]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ IPython/__init__.py       |  2 +-
+ IPython/utils/terminal.py | 32 ++++++++------------------------
+ 2 files changed, 9 insertions(+), 25 deletions(-)
+
+diff --git a/IPython/__init__.py b/IPython/__init__.py
+index e12da90..20e6e48 100644
+--- a/IPython/__init__.py
++++ b/IPython/__init__.py
+@@ -62,7 +62,7 @@ __version__  = release.version
+ version_info = release.version_info
+ # list of CVEs that should have been patched in this release.
+ # this is informational and should not be relied upon.
+-__patched_cves__ = {"CVE-2022-21699"}
++__patched_cves__ = {"CVE-2022-21699", "CVE-2023-24816"}
+ 
+ 
+ def embed_kernel(module=None, local_ns=None, **kwargs):
+diff --git a/IPython/utils/terminal.py b/IPython/utils/terminal.py
+index 49fd3fe..d884799 100644
+--- a/IPython/utils/terminal.py
++++ b/IPython/utils/terminal.py
+@@ -79,30 +79,14 @@ if os.name == 'posix':
+         _set_term_title = _set_term_title_xterm
+         _restore_term_title = _restore_term_title_xterm
+ elif sys.platform == 'win32':
+-    try:
+-        import ctypes
+-
+-        SetConsoleTitleW = ctypes.windll.kernel32.SetConsoleTitleW
+-        SetConsoleTitleW.argtypes = [ctypes.c_wchar_p]
+-    
+-        def _set_term_title(title):
+-            """Set terminal title using ctypes to access the Win32 APIs."""
+-            SetConsoleTitleW(title)
+-    except ImportError:
+-        def _set_term_title(title):
+-            """Set terminal title using the 'title' command."""
+-            global ignore_termtitle
+-
+-            try:
+-                # Cannot be on network share when issuing system commands
+-                curr = os.getcwd()
+-                os.chdir("C:")
+-                ret = os.system("title " + title)
+-            finally:
+-                os.chdir(curr)
+-            if ret:
+-                # non-zero return code signals error, don't try again
+-                ignore_termtitle = True
++    import ctypes
++
++    SetConsoleTitleW = ctypes.windll.kernel32.SetConsoleTitleW
++    SetConsoleTitleW.argtypes = [ctypes.c_wchar_p]
++
++    def _set_term_title(title):
++        """Set terminal title using ctypes to access the Win32 APIs."""
++        SetConsoleTitleW(title)
+ 
+ 
+ def set_term_title(title):
diff --git a/meta-python/recipes-devtools/python/python3-ipython_8.2.0.bb b/meta-python/recipes-devtools/python/python3-ipython_8.2.0.bb
index 35af7dd4d8..197578ae41 100644
--- a/meta-python/recipes-devtools/python/python3-ipython_8.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ipython_8.2.0.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING.rst;md5=59b20262b8663cdd094005bddf47af5f"
 
 PYPI_PACKAGE = "ipython"
 
+SRC_URI += "file://CVE-2023-24816.patch"
 SRC_URI[sha256sum] = "70e5eb132cac594a34b5f799bd252589009905f05104728aea6a403ec2519dc1"
 
 RDEPENDS:${PN} = "\

