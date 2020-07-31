Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web11.3360.1596226735017102491
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Jul 2020 13:18:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LK69ZoSh;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id ha11so8367201pjb.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 31 Jul 2020 13:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5j+4NMiA+OuGBC7XBo/jgv2+0MpRvJZMWIcp1Hg1c2Y=;
        b=LK69ZoSh/DnUV0jJGBMrDfjM7M4PegOieTXSIuCQfRKm+8+92U6TPQGftdgU7Ty7Mz
         zGLZ0m82s7baLjRQ6eSghJlOWoUuAaLsjy5GyjWNflPkKyPIMGTPkq83tC2Eibivsrnq
         5G2Rs26l6dgtetYQ1FmXc9tSGxd3uoMaYfXRKn1gAr8yUYd6jgG4n8QqjuEnZw91i4VL
         1kt93RJgsBUe8CEvaZTgvNgYmfME7UJYCO4tBB8ZRFOLeO69/wmK7c6r8SDnJQKn8eYM
         Y3HGkE4751W/8xTWEfrklCG1s+apEcxwLMucp03kQKHXk8ghsyUe5a2+1/AGbIUKqNjT
         rczw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5j+4NMiA+OuGBC7XBo/jgv2+0MpRvJZMWIcp1Hg1c2Y=;
        b=TY4HPFz2dverTZZkTGJGr2B4H2pmzvWXUZqWRtDCrlNcx7q2H4GL/KpaZC5t4JSM+u
         PeBU/qBRvbgjPGefVPMi375pV1bECRHhqtGC5Mt3kAjmwYylnmErOmIBU50SQZXpMbKM
         9vzMkC31mLw/mlemKA0OUE7Z/AGXFMcfFPEaVHMfA08hdtbmerXX+xJ8l4OYqk7oOjcK
         XqCuXAe1gSEwB6mHEV9lto9+Bmk9GdNRNP8nZJoMs22uGFr8HqBgj5OjzW0ZAlKIbf2r
         8CQnPMUvh3Y27Tws++2q+m4RRo1SGQBbCrJzWx/qK1zEdw9T6guvngq9l+vrUnNdfdlV
         gx+w==
X-Gm-Message-State: AOAM530K2kKFG3cwTof0Y77CPgP6eR7IhwPdlrntMdy+sEE73uJm5fGr
	rLJyDa7cyjbjIzZlUdT1z+qMSYTDutY=
X-Google-Smtp-Source: ABdhPJyJ+egFK2L8d8d+UPb26z8fO3MBk89AUB2zzmJM1a66HzxpMYijwBJNUhdtR2JafjE8CemLxw==
X-Received: by 2002:a17:90a:4502:: with SMTP id u2mr5225038pjg.187.1596226734135;
        Fri, 31 Jul 2020 13:18:54 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e841])
        by smtp.gmail.com with ESMTPSA id s8sm10973727pfc.122.2020.07.31.13.18.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2020 13:18:53 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Colin McAllister <colinmca242@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 4/4] python3-lorem: Added recipe
Date: Fri, 31 Jul 2020 13:18:48 -0700
Message-Id: <20200731201848.484776-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200731201848.484776-1-raj.khem@gmail.com>
References: <20200731201848.484776-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Colin McAllister <colinmca242@gmail.com>

Created Python3 recipe for python3-lorem.

Signed-off-by: Colin McAllister <colinmca242@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python3-lorem_0.1.1.bb                | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-lorem_0.1.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-lorem_0.1.1.bb b/meta-python/recipes-devtools/python/python3-lorem_0.1.1.bb
new file mode 100644
index 0000000000..fc75e43485
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-lorem_0.1.1.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "Generator for random text that looks like Latin"
+HOMEPAGE = "https://github.com/sfischer13/python-lorem"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=5301c01b2bcdeedba23645f94db2f179"
+SRC_URI[md5sum] = "e3f0064a94c13e19780eb724affdb426"
+SRC_URI[sha256sum] = "785f4109a241fc2891e59705e85d065f6e6d3ed6ad91750a8cb54d4f3e59d934"
+
+PYPI_PACKAGE = "lorem"
+
+inherit pypi setuptools3
+
+CLEANBROKEN = "1"
+
+RDEPENDS_${PN} += " \
+        python3 \
+"
-- 
2.28.0

