Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.web10.1583.1586020400019668393
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Apr 2020 10:13:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.167.174, mailfrom: straka.derek@gmail.com)
Received: by mail-oi1-f174.google.com with SMTP id q204so9139784oia.13
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Apr 2020 10:13:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=W1zEVXfm+43fHeFx8ySWftwsKJimxY+TM4HsZE2dUhg=;
        b=DCX1dxGjgq6tCwOs7ZNpEyEM/L6g0DrsbvLqmkcxgjH8LqAuiRFy4yID10bBNJFcCe
         VbIbIElIbGljnHyftZQ01g/+uYLDUTg/6G6VOTC++Bnrbvrg82DNeCt3TvOSuxTHz1fp
         zMQqWAofTBC77zJQICVUyfCvndoy9QnCAwNkWuYWEfMAqHO6NQglmRePrFly1B7fErE4
         hFmFZPAvW4QNW5kfHNBOjzaO2Hn5x5tBC79LaS+71UU6JELfAJf5UHKV/eokroTI/6rs
         Sb9vZgFlXiL6x6AhBdkiS5aQXr7U9pQRB37Ehnbc5mAKR9/r6pZwVCQqMhMOYmccPmxH
         SWQw==
X-Gm-Message-State: AGi0PubLBOH1T99rrk4fOVbhK/SHiSlpVDpSx3sR4AlQ8uf/VhDj+GqV
	cpkYIfK+MPRvJcggAutKE3fZE7T0rlA=
X-Google-Smtp-Source: APiQypL/nnMjI/q/cnqDGp7WS0idaeCPzQ3gwDKEkb0tcIe0CTybEAgPxWfpNQimxNJvvUu/9usOCw==
X-Received: by 2002:aca:4403:: with SMTP id r3mr6979441oia.84.1586020399090;
        Sat, 04 Apr 2020 10:13:19 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id q12sm3054551otn.43.2020.04.04.10.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2020 10:13:18 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 13/27] python-speakleter: consolidate inc and bb files into a single bb file
Date: Sat,  4 Apr 2020 13:12:37 -0400
Message-Id: <20200404171251.19823-13-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200404171251.19823-1-derek@asterius.io>
References: <20200404171251.19823-1-derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-speaklater.inc        | 9 ---------
 .../recipes-devtools/python/python3-speaklater_1.3.bb    | 9 ++++++++-
 2 files changed, 8 insertions(+), 10 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-speaklater.inc

diff --git a/meta-python/recipes-devtools/python/python-speaklater.inc b/meta-python/recipes-devtools/python/python-speaklater.inc
deleted file mode 100644
index a2534e401e..0000000000
--- a/meta-python/recipes-devtools/python/python-speaklater.inc
+++ /dev/null
@@ -1,9 +0,0 @@
-DESCRIPTION = "Media asset management for Python, with glue code for various frameworks"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=b810770075a29bf44b96607440e7c801"
-
-SRC_URI[md5sum] = "e8d5dbe36e53d5a35cff227e795e8bbf"
-SRC_URI[sha256sum] = "59fea336d0eed38c1f0bf3181ee1222d0ef45f3a9dd34ebe65e6bfffdd6a65a9"
-
-PYPI_PACKAGE = "speaklater"
-
diff --git a/meta-python/recipes-devtools/python/python3-speaklater_1.3.bb b/meta-python/recipes-devtools/python/python3-speaklater_1.3.bb
index aa4f699be0..5948dc8596 100644
--- a/meta-python/recipes-devtools/python/python3-speaklater_1.3.bb
+++ b/meta-python/recipes-devtools/python/python3-speaklater_1.3.bb
@@ -1,2 +1,9 @@
+DESCRIPTION = "Media asset management for Python, with glue code for various frameworks"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b810770075a29bf44b96607440e7c801"
+
+SRC_URI[md5sum] = "e8d5dbe36e53d5a35cff227e795e8bbf"
+SRC_URI[sha256sum] = "59fea336d0eed38c1f0bf3181ee1222d0ef45f3a9dd34ebe65e6bfffdd6a65a9"
+
+PYPI_PACKAGE = "speaklater"
 inherit pypi setuptools3
-require python-speaklater.inc
-- 
2.17.1

