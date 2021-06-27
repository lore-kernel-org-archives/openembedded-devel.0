Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web11.2664.1624825341601068546
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Jun 2021 13:22:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Bx+hVJLd;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id gd24-20020a17090b0fd8b02901702bcb0d90so4662312pjb.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Jun 2021 13:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version:in-reply-to:references
         :content-transfer-encoding;
        bh=XHOvypW7cP0EVfnQaktjunc0EnKMtWolFVZxLj1xS4M=;
        b=Bx+hVJLd/0snC2WkyIzsAbq608u7cHQxiwem3A0y7FuyakoS74mL42FGFN+yFUzMUv
         +FL8lvlYX1nJY0hTHvVfuMpZ+rXXPjvAXA139ljSqXw3t2uYmHGtBYqBzCQK6vR6wSAB
         /ScI/CptRDprb5aBxOCr2eIrs8wYL3BhlmbDMaC83f99pgwEx7vDrrM2lMS5jTVprI0e
         xFaiqX/3RMa2ZgwVK8TIEPicwQ0vqO0rBV9ELyDpw61jpPwYS90YKjBuYTyVQsLRF1OX
         EbAoebFhaoukZia5Vj+ZZCjtCWjFN+EnkC80lvL8SydyPj8f3cJ08TcSk/qJ3A+vAGR0
         /xxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :in-reply-to:references:content-transfer-encoding;
        bh=XHOvypW7cP0EVfnQaktjunc0EnKMtWolFVZxLj1xS4M=;
        b=Nkyjmf+RInZ4hFdz1+x54YaPh1G0yjJfG3yUwAhVKmStBD7ZjoQG2xxG9ONXZh1qHf
         KtdJYg5+1s5P7euneF4WY5SS/0uNLSZN05Ii9GaLqZZQo2K09i+9l5fmfrLwaKOqMs+V
         cmWbrVXsxog9OnOdtNlG7f1TRCYDLHf3Zotyh3op7ZG5K7gKA7DDfqBi/62gQdOKMPNs
         AfeatPrhWGvpkt1Aqqq5HSmx9+k30grtxV/oSXv3yUKvN3OXFJ/Hmld7tEzSa4jn+xYE
         WiXGl4uszbHTBHvgWoUe8eeP0xMV/w/BIKL5S4R4ozS1ojXiW0wp55woWD1Xe3JiuDK5
         NEJg==
X-Gm-Message-State: AOAM531y2qjkXu7eRc60rgmS8W3THskTaA+JpnkVkVWKXf9I9N05rCK7
	IFgrwqI0hGuC4CYpYFquoYTd6g9nQrTc3w==
X-Google-Smtp-Source: ABdhPJynugZ8zQ1FPLlNjqVkZ/h7mCFvlnsx4q04zs5p+wSRBCxr82jFD8m09qlZUBhCC5J51s4HeA==
X-Received: by 2002:a17:90b:38c3:: with SMTP id nn3mr33606948pjb.92.1624825340984;
        Sun, 27 Jun 2021 13:22:20 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:90a0:cfd2:ffe1:efef])
        by smtp.gmail.com with ESMTPSA id ay3sm3501192pjb.38.2021.06.27.13.22.20
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jun 2021 13:22:20 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 03/20] libeigen: update LICENSE information
Date: Sun, 27 Jun 2021 13:21:58 -0700
Message-Id: <07cff992e3572628a2d8270ad27148326a071d15.1624825239.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
In-Reply-To: <cover.1624825239.git.akuster808@gmail.com>
References: <cover.1624825239.git.akuster808@gmail.com>
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

From: Ovidiu Panait <ovidiu.panait@windriver.com>

From COPYING.README:
"""
Eigen is primarily MPL2 licensed. See COPYING.MPL2 and these links:
  http://www.mozilla.org/MPL/2.0/
  http://www.mozilla.org/MPL/2.0/FAQ.html

Some files contain third-party code under BSD or LGPL licenses, whence the other
COPYING.* files here.

All the LGPL code is either LGPL 2.1-only, or LGPL 2.1-or-later.
For this reason, the COPYING.LGPL file contains the LGPL 2.1 text.
"""

The upstream repository contains multiple COPYING files (various 3rd party
code is under different licenses), so update the LICENSE information
accordingly. Also, add MINPACK to meta-oe/licenses.

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 9efdb6799ed45cf04acde9b435aeb8ccd1f2843c)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/licenses/MINPACK                      | 51 +++++++++++++++++++
 .../libeigen/libeigen_3.3.7.bb                |  9 +++-
 2 files changed, 58 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/licenses/MINPACK

diff --git a/meta-oe/licenses/MINPACK b/meta-oe/licenses/MINPACK
new file mode 100644
index 0000000000..132cc3f33f
--- /dev/null
+++ b/meta-oe/licenses/MINPACK
@@ -0,0 +1,51 @@
+Minpack Copyright Notice (1999) University of Chicago.  All rights reserved
+
+Redistribution and use in source and binary forms, with or
+without modification, are permitted provided that the
+following conditions are met:
+
+1. Redistributions of source code must retain the above
+copyright notice, this list of conditions and the following
+disclaimer.
+
+2. Redistributions in binary form must reproduce the above
+copyright notice, this list of conditions and the following
+disclaimer in the documentation and/or other materials
+provided with the distribution.
+
+3. The end-user documentation included with the
+redistribution, if any, must include the following
+acknowledgment:
+
+   "This product includes software developed by the
+   University of Chicago, as Operator of Argonne National
+   Laboratory.
+
+Alternately, this acknowledgment may appear in the software
+itself, if and wherever such third-party acknowledgments
+normally appear.
+
+4. WARRANTY DISCLAIMER. THE SOFTWARE IS SUPPLIED "AS IS"
+WITHOUT WARRANTY OF ANY KIND. THE COPYRIGHT HOLDER, THE
+UNITED STATES, THE UNITED STATES DEPARTMENT OF ENERGY, AND
+THEIR EMPLOYEES: (1) DISCLAIM ANY WARRANTIES, EXPRESS OR
+IMPLIED, INCLUDING BUT NOT LIMITED TO ANY IMPLIED WARRANTIES
+OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, TITLE
+OR NON-INFRINGEMENT, (2) DO NOT ASSUME ANY LEGAL LIABILITY
+OR RESPONSIBILITY FOR THE ACCURACY, COMPLETENESS, OR
+USEFULNESS OF THE SOFTWARE, (3) DO NOT REPRESENT THAT USE OF
+THE SOFTWARE WOULD NOT INFRINGE PRIVATELY OWNED RIGHTS, (4)
+DO NOT WARRANT THAT THE SOFTWARE WILL FUNCTION
+UNINTERRUPTED, THAT IT IS ERROR-FREE OR THAT ANY ERRORS WILL
+BE CORRECTED.
+
+5. LIMITATION OF LIABILITY. IN NO EVENT WILL THE COPYRIGHT
+HOLDER, THE UNITED STATES, THE UNITED STATES DEPARTMENT OF
+ENERGY, OR THEIR EMPLOYEES: BE LIABLE FOR ANY INDIRECT,
+INCIDENTAL, CONSEQUENTIAL, SPECIAL OR PUNITIVE DAMAGES OF
+ANY KIND OR NATURE, INCLUDING BUT NOT LIMITED TO LOSS OF
+PROFITS OR LOSS OF DATA, FOR ANY REASON WHATSOEVER, WHETHER
+SUCH LIABILITY IS ASSERTED ON THE BASIS OF CONTRACT, TORT
+(INCLUDING NEGLIGENCE OR STRICT LIABILITY), OR OTHERWISE,
+EVEN IF ANY OF SAID PARTIES HAS BEEN WARNED OF THE
+POSSIBILITY OF SUCH LOSS OR DAMAGES.
diff --git a/meta-oe/recipes-support/libeigen/libeigen_3.3.7.bb b/meta-oe/recipes-support/libeigen/libeigen_3.3.7.bb
index 6ce318d0b5..fe15f2eb2e 100644
--- a/meta-oe/recipes-support/libeigen/libeigen_3.3.7.bb
+++ b/meta-oe/recipes-support/libeigen/libeigen_3.3.7.bb
@@ -1,8 +1,13 @@
 DESCRIPTION = "Eigen is a C++ template library for linear algebra: matrices, vectors, numerical solvers, and related algorithms."
 AUTHOR = "Benoît Jacob and Gaël Guennebaud and others"
 HOMEPAGE = "http://eigen.tuxfamily.org/"
-LICENSE = "MPL-2.0"
-LIC_FILES_CHKSUM = "file://COPYING.MPL2;md5=815ca599c9df247a0c7f619bab123dad"
+LICENSE = "MPL-2.0 & Apache-2.0 & BSD-3-Clause & GPLv3 & LGPLv2.1 & MINPACK"
+LIC_FILES_CHKSUM = "file://COPYING.MPL2;md5=815ca599c9df247a0c7f619bab123dad \
+                    file://COPYING.BSD;md5=543367b8e11f07d353ef894f71b574a0 \
+                    file://COPYING.GPL;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://COPYING.LGPL;md5=4fbd65380cdd255951079008b364516c \
+                    file://COPYING.MINPACK;md5=5fe4603e80ef7390306f51ef74449bbd \
+"
 
 SRC_URI = "git://gitlab.com/libeigen/eigen.git;protocol=http;nobranch=1"
 
-- 
2.17.1

