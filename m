Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
 by mx.groups.io with SMTP id smtpd.web10.23491.1586111996598429775
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Apr 2020 11:39:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.210.53, mailfrom: straka.derek@gmail.com)
Received: by mail-ot1-f53.google.com with SMTP id m2so13056664otr.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Apr 2020 11:39:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=hN9FkVTSTcV0e+C+EyrFwRf+w1jJNUHiapiFbDJo6BE=;
        b=N9uVFTTJWH6s7iArIAqJXwyiPOyYO+03FXhRM+liSUV28Zw2jr+4OUEOcQV1ht6wl9
         d6NlLjuTSwammlqQmnLH33Y5BORju1ihmvpTEsx5A0R9+Q2IFIHzWZfbbj0TP+NwhYw3
         KU/ry0FStaGAT1aXHpP1e1pOFej9sAxR1Z4hIa4rFvg7dtyhoxsRxHBmLh1Gd/uVKDaV
         QJRh3ENZF+/deFysRsabCjSaooruN1S+fTxDYCf2H3Png7zKZfmEkIDfYIpU5BN28smg
         XYsKtSZPTN/orLynfBlhykah5f763r0IyjoX/AMFmmwu/AEKfT0PGoZGWHa2zs6x5rd2
         SRQA==
X-Gm-Message-State: AGi0PuYEPu23Kro68J5Fyfb+PUXGTbu67FMs1AAw8sv87dcswOn+pilb
	sZUnjDVRd7X0gWL/FtZc7mywUcqzAZI=
X-Google-Smtp-Source: APiQypIF7U2LuYF+ea6ooedlGz7JT3WKIi/ZA9Ry6Kqckq6CWZNhDoq3IDcbmOoctALWzYSXrEKhkQ==
X-Received: by 2002:a05:6830:1382:: with SMTP id d2mr14038904otq.214.1586111995673;
        Sun, 05 Apr 2020 11:39:55 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id q22sm3833927oic.22.2020.04.05.11.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2020 11:39:55 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 14/15] python-pyelftools: consolidate inc and bb files into a single bb file
Date: Sun,  5 Apr 2020 14:39:28 -0400
Message-Id: <20200405183929.28266-14-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200405183929.28266-1-derek@asterius.io>
References: <20200405183929.28266-1-derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python-pyelftools.inc                 | 14 --------------
 .../python/python3-pyelftools_0.25.bb            | 16 ++++++++++++++--
 2 files changed, 14 insertions(+), 16 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-pyelftools.inc

diff --git a/meta-python/recipes-devtools/python/python-pyelftools.inc b/meta-python/recipes-devtools/python/python-pyelftools.inc
deleted file mode 100644
index 7d4f763ffd..0000000000
--- a/meta-python/recipes-devtools/python/python-pyelftools.inc
+++ /dev/null
@@ -1,14 +0,0 @@
-DESCRIPTION = "pyelftools is a pure-Python library for parsing and analyzing ELF files and DWARF debugging information"
-HOMEPAGE = "https://github.com/eliben/pyelftools"
-SECTION = "devel/python"
-LICENSE = "PD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=5ce2a2b07fca326bc7c146d10105ccfc"
-
-SRC_URI[md5sum] = "c5629b9a5d19c82107a946cce52eeec2"
-SRC_URI[sha256sum] = "89c6da6f56280c37a5ff33468591ba9a124e17d71fe42de971818cbff46c1b24"
-
-PYPI_PACKAGE = "pyelftools"
-
-inherit pypi
-
-BBCLASSEXTEND = "native"
diff --git a/meta-python/recipes-devtools/python/python3-pyelftools_0.25.bb b/meta-python/recipes-devtools/python/python3-pyelftools_0.25.bb
index 56eb8c4cd6..03d96db3c2 100644
--- a/meta-python/recipes-devtools/python/python3-pyelftools_0.25.bb
+++ b/meta-python/recipes-devtools/python/python3-pyelftools_0.25.bb
@@ -1,2 +1,14 @@
-inherit setuptools3
-require python-pyelftools.inc
+DESCRIPTION = "pyelftools is a pure-Python library for parsing and analyzing ELF files and DWARF debugging information"
+HOMEPAGE = "https://github.com/eliben/pyelftools"
+SECTION = "devel/python"
+LICENSE = "PD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=5ce2a2b07fca326bc7c146d10105ccfc"
+
+SRC_URI[md5sum] = "c5629b9a5d19c82107a946cce52eeec2"
+SRC_URI[sha256sum] = "89c6da6f56280c37a5ff33468591ba9a124e17d71fe42de971818cbff46c1b24"
+
+PYPI_PACKAGE = "pyelftools"
+
+inherit pypi setuptools3
+
+BBCLASSEXTEND = "native"
-- 
2.17.1

