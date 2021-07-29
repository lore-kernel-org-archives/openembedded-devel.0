Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.17219.1627601819075879774
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Jul 2021 16:36:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=magFwczu;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id e21so8840590pla.5
        for <openembedded-devel@lists.openembedded.org>; Thu, 29 Jul 2021 16:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=8Y2R2W+dRC0SN1AKLqQcbLWAq1zmiK9OV/4bQypfrGk=;
        b=magFwczu7tnR59Lw9jGbO4Mq73YXnEJv3hdwF65eWV4QSxufnIJrQourhIgiGg10IJ
         1tMFfGA6lmld6iCtX9LzRO9tNPsPQ7+O85D2GbBFVvih1GK6sJQZXyi9qbnOSK6Jo5yF
         iTrF9yzdGAdQQSPVnOVjx76Pzse9NJYUZR6oV20YpyjhFOo9mRfHLE3BE+XRgFGOTSBQ
         wPOR/Ll0ZEG+wENi9WjSCvw+1JvOaczlzABvOvamS6Lo1/yjmJKvS3wVtC0j5sdgUIOS
         zaOsR5eHa1pnKIHvHO8sfyDIQk5z4//3Vf7LRbi+VTMwwvV5sLnMSqrD3GYxzt2OowJN
         5+5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8Y2R2W+dRC0SN1AKLqQcbLWAq1zmiK9OV/4bQypfrGk=;
        b=o7FJMdkW0l7hf7vIkQwJoe2dB8xCIGMcusZMOpzJojaYAIeQBKDCOiyTm+wXfVHLiD
         pzIMLCHeXRm9SMrhIpB89hFCXLTs9zuf0fBm7SyUP4nVSf7A0IIg+Vyc5pSGNTQOnIQt
         wAWDI/F5qr/iCBkHGaa9sYLWlp6xPHvd0smdLKnHqcg4r4h/8USazofU8ymIbuCmVkbJ
         lGV9DelgQCFT676tuu48WT+t++2fT18fuvGabqKIDSaJTMrhvc4zUINXhkR5RjByzWzj
         algqHg8RDmiO6vyAQybSkfiOt0Ov0XMCRiP81XJXLut/8INBBJEPmGiuNoL+RIqiomlG
         Re3g==
X-Gm-Message-State: AOAM5311CH3EtenwvjiGTwjxgAFFzBTKb62JYRDQcm26TCEtdYjTsYka
	vKrBqrwo3433IFX5eTVO9Ig6xSCsGnfwQw==
X-Google-Smtp-Source: ABdhPJxkbP1pGoe1IyokqjaoXmxv/Z3+bo44QNHChgOlv+T/JBPxUopdK/864s9BU/qhE0QtJNQfYA==
X-Received: by 2002:a17:90a:2882:: with SMTP id f2mr7992295pjd.102.1627601818595;
        Thu, 29 Jul 2021 16:36:58 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.hsd1.ca.comcast.net ([2601:202:4180:a5c0:43fe:2e36:1546:5b06])
        by smtp.gmail.com with ESMTPSA id w15sm2360487pfu.89.2021.07.29.16.36.58
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 16:36:58 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 06/15] mariadb: Include missing sys/type.h for ssize_t
Date: Thu, 29 Jul 2021 16:36:39 -0700
Message-Id: <9aad47d679f0453fe354409afa5f19ac4179958d.1627593245.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1627593245.git.akuster808@gmail.com>
References: <cover.1627593245.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Khem Raj <raj.khem@gmail.com>

musl finds this problem in sources where its missing to include
needed system header for ssize_t

Fixes
wsrep-lib/include/wsrep/gtid.hpp:80:5: error: unknown type name 'ssize_t'; did you mean 'size_t'?
    ssize_t scan_from_c_str(const char* buf, size_t buf_len,
    ^~~~~~~
    size_t

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 0298521fcd9eefdd9cd415b58740b972d65cf93c)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-dbs/mysql/mariadb.inc           |  1 +
 meta-oe/recipes-dbs/mysql/mariadb/ssize_t.patch | 15 +++++++++++++++
 2 files changed, 16 insertions(+)
 create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/ssize_t.patch

diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 2974341bfe..25e630a16a 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -22,6 +22,7 @@ SRC_URI = "https://downloads.mariadb.org/interstitial/${BP}/source/${BP}.tar.gz
            file://0001-aio_linux-Check-if-syscall-exists-before-using-it.patch \
            file://sys_futex.patch \
            file://cross-compiling.patch \
+           file://ssize_t.patch \
           "
 SRC_URI_append_libc-musl = " file://ppc-remove-glibc-dep.patch"
 
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/ssize_t.patch b/meta-oe/recipes-dbs/mysql/mariadb/ssize_t.patch
new file mode 100644
index 0000000000..4e499d4137
--- /dev/null
+++ b/meta-oe/recipes-dbs/mysql/mariadb/ssize_t.patch
@@ -0,0 +1,15 @@
+ssize_t comes from sys/types.h therefore include it
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+--- a/wsrep-lib/include/wsrep/gtid.hpp
++++ b/wsrep-lib/include/wsrep/gtid.hpp
+@@ -25,7 +25,7 @@
+ #include "compiler.hpp"
+ 
+ #include <iosfwd>
+-
++#include <sys/types.h>
+ /**
+  * Minimum number of bytes guaratneed to store GTID string representation,
+  * terminating '\0' not included (36 + 1 + 20).
-- 
2.25.1

