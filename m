Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10335.1795753004008904152
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 20:16:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=RLWl0IVG;
 spf=pass (domain: gmail.com, ip: 74.125.82.51, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1b563e32936so3514655c88.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 20:16:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795753003; x=1796357803; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dGk7+js4zU5+GGJs9S4CNC5cxi4nhuBfcnXB/asvPcY=;
        b=RLWl0IVGn22BxcXyYNrip0+ZwfF5WAG1h347ZRPWLw4jzXbYJzNr0zkoFBHRH/DFCs
         Fl8vJ9IwhKO/AOL/3EPSLfkTLjrp1kESH2h6s6UsnMTkQwQz4DqermQTdUAIl1QQJJgd
         S33FWuGg0JjEpo8J9RGpNZ+/pvamR5u2f5ToSha6u3ULMr45c0E5tE5XRVAc7OLYEHGu
         b8q2Lthp08/JJEnjJ0mJThRLhhqO1CzuxHIBGGzRlv5MjtTMqOsVm5VvpprawMX+LPBF
         QCZWRSjqL06E8QbFX7R3e64ND+SBqO/wqjPnk3wvnVn5epZI1CjJfqEe8927+zx1Yed7
         ZjSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795753003; x=1796357803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dGk7+js4zU5+GGJs9S4CNC5cxi4nhuBfcnXB/asvPcY=;
        b=wMaqf49AZVXDGQROVn7HfVh9My/nXDk/b+JFSPgfMs5Mi7/FzKnuJ52k1gXzyVQXHK
         lDQEoDGoSaCCKKYysZSgVNEDHs/LMEp5WWDlP3SsGsFYNB20gG9zTD8b9aPIRBSihLLD
         nD01F2DU0jJNM/xA3u4LnID60FxkiFx3QQJjCPR9+kkyBqXzDPbGEPbzAWJKWdvz/MN/
         R9VlOJQUUDWebcQHBULezhLiG2vShe5YsbzqAwElMLqM5YV0BJcnwochvoB7ZEE58H50
         2YXpULcjwieggbSLFh6J5KYilkJFNkc8dVI5lRaw91tS06AU/hPbejjsVFYr2k0Zp0Od
         asnQ==
X-Gm-Message-State: APuU4Z+xQzgf96HgRbAXRfUxZFVrafA93NarjovZLDq8R0pDjzx1R3S/
	W3eETz+zdhSYPnaT/I/XmnPmHbClru/k3wrise7DHGziOBovhPnO3Zy2vLbVb5bL
X-Gm-Gg: AZFdTZcJ6AQCnUmY3iwHUHFQoJDUueBrCus97TjUswRB/JHCBI/4bGhTNBEubEnbNCN
	MZvzOzja+i9V9T40gRAdaa4/2caO/y7htc6akIcbKnKP5Tc6d5tdHxcKTmdj6hz6kHyXq8pgGsb
	43B4RgpXqUV2/JXN4xNxosgrN+FvGJnEjsGaErKnqAHT2Gp95gtYgN4iF6RHanlCBM8fsXu9TwM
	lD2eAQuHZYr+jSYHNziUCrZwylIxBUWoS0Qs85AjbA4qTTahhsQTKMDy3CJtXPKjGOlatyxEtNV
	pCVf0xnTL0qnasnN7hJsakvDqIpzePj7DPLdomGPGs748KHF+zfV8+0qjb0yngsyHD1Mgdk+AtP
	7GprR7ksJsNAi3OUASwirtwsJKh/jeVA0Ggo5AzfEKP81wWJ3CbO+Nk+5L+w8E0xYXGF65EF2vb
	sXJ9D+za4T8Otw2ocjd+I7LhAuKs4bNWvnOchOCtxOihgGZjuxgS7UEm9CdZc9srDgTJuaYZMlq
	aHQUHVQQS0EpEPA4XX6lejYrp3Dc5vHFf61VsaNIP5p7jaP550VY4J1F0a9LSxtnzo1qEvzJZva
	18cuBkWO+ycXFuisJozoVjYjolQeEy8xnML9ApblFQEy+sZdE9GMqZT+/CzmwTFwUNynhYkBbz8
	ge/cfvlEcZlVWwqfn/rhx/oNT9spkf8twjPSGyOkPwNKWY5EhLGp4rUVhi8eF9eLmdchs3xXmhE
	FcHxdpVxihHiFOcSbcIbtYigQrbOWsP6CjedWP6qcEwIEY9LDTqqGyUa+xhfUE7Euu57TqiKfMC
	uTBQD2SYyTD0ALEsSGzmx+EmKN84x9nf+LduOhBdR4PK5JK6HC4M2xZkVjU3YEovl+EpmDyDp8G
	HsKW
X-Received: by 2002:a05:7022:b043:10b0:1b2:471f:c4c with SMTP id a92af1059eb24-1b5568ce1f3mr23911318c88.19.1795753003323;
        Thu, 26 Nov 2026 20:16:43 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c1142sm52062757c88.2.2026.11.26.20.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:16:42 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 24/32] python3-platformdirs: upgrade 4.14.5 -> 4.14.8
Date: Thu, 26 Nov 2026 20:16:06 -0800
Message-ID: <20261127041614.1775064-25-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127041614.1775064-1-khem.raj@oss.qualcomm.com>
References: <20261127041614.1775064-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 04:16:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133243
Content-Type: text/plain; charset="utf-8"

Hardens user-dirs.dirs and WIN_PD_OVERRIDE_* parsing, checks the
parents of runtime and POSIX user directories, and writes a PEP 770 SBOM
into the wheel with python-sbom, whose hatch hook the build now
requires; add python3-python-sbom-native to DEPENDS.

New tests mock Path.mkdir for system directories and only pass as a
non-root user; as root, which ptests run as, os.lstat() fails on the
directory the mock never created. Deselect
test_system_site_dir_keeps_default_mode and
test_site_data_dir_default_ensure_exists_creates_only_the_first_entry.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-devtools/python/python3-platformdirs/run-ptest  | 6 +++++-
 ...latformdirs_4.14.5.bb => python3-platformdirs_4.14.8.bb} | 3 ++-
 2 files changed, 7 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-platformdirs_4.14.5.bb => python3-platformdirs_4.14.8.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-platformdirs/run-ptest b/meta-python/recipes-devtools/python/python3-platformdirs/run-ptest
index fa98212711..ea0dae2066 100644
--- a/meta-python/recipes-devtools/python/python3-platformdirs/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-platformdirs/run-ptest
@@ -1,4 +1,8 @@
 #!/bin/sh
 
+# The *keeps_default_mode / creates_only_the_first_entry tests mock Path.mkdir
+# and only pass as non-root; ptests run as root
 pytest --automake \
-       --deselect tests/test_pytest_plugin.py::test_import_before_pytest_main
+       --deselect tests/test_pytest_plugin.py::test_import_before_pytest_main \
+       --deselect tests/test_api.py::test_system_site_dir_keeps_default_mode \
+       --deselect tests/test_unix.py::test_site_data_dir_default_ensure_exists_creates_only_the_first_entry
diff --git a/meta-python/recipes-devtools/python/python3-platformdirs_4.14.5.bb b/meta-python/recipes-devtools/python/python3-platformdirs_4.14.8.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-platformdirs_4.14.5.bb
rename to meta-python/recipes-devtools/python/python3-platformdirs_4.14.8.bb
index be9e043d87..4866770e1e 100644
--- a/meta-python/recipes-devtools/python/python3-platformdirs_4.14.5.bb
+++ b/meta-python/recipes-devtools/python/python3-platformdirs_4.14.8.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/platformdirs/platformdirs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ea4f5a41454746a9ed111e3d8723d17a"
 
-SRC_URI[sha256sum] = "32e9921db7385aa8169bee4fe9501923e5715ba9fb7ea3b9c69b0d8e0639f7a1"
+SRC_URI[sha256sum] = "96893d686e84e9e6f358a9ea41a8de544df66dbf2ba6cda250e7dc73acf85b9b"
 
 inherit pypi python_hatchling ptest-python-pytest
 
@@ -12,6 +12,7 @@ SRC_URI += "file://run-ptest"
 DEPENDS += " \
     python3-hatch-fancy-pypi-readme-native \
     python3-hatch-vcs-native \
+    python3-python-sbom-native \
 "
 
 RDEPENDS:${PN}-ptest += " \
