Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web11.53745.1622523394014561963
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 May 2021 21:56:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hMGe3RcU;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id i22so1069823pju.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 31 May 2021 21:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eRdc190B+8E6WJk+n+jlmLjtZ+LMiSxC4sz9cdO9Bek=;
        b=hMGe3RcUxVUc0wegPpBgKU6SwaWvyK8cWQVD8I+DBxZGXe2/VU8q0PqNxXL8EoxRPn
         X7Yl4MYCxKKw775x5+Quz2vdpRSDwe5X9NYQ+1MesmK061neBC8LV6KFBlsteyDXWgLs
         2ks9WN48bEW0LrTOa9tCBkw6FQuMovYqp/KLB9BTP2gvuCCCVBta9mzPTbKi5BHclw+i
         1W2KhxRjGwSXOJqEvi2lDpMd4GJvkkpv3K9SipOkhA99ElVsRwCU86nKGd/Ia0QzoQLd
         TktaKXV+QRCIIhvWY8U9TXv/v+drwDFxwACVxaZsyOYQD+CLyD4eqvEqzBmn3mOqVl4o
         BjaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eRdc190B+8E6WJk+n+jlmLjtZ+LMiSxC4sz9cdO9Bek=;
        b=Xeod2e6s5ych4A8j11AFtTx8Mnhcu+zwPoSjd5sXwgFzSqnTH1NboKFw2Kgqyg9MCu
         1eHLAb2NZMPlt85Db4uYs7GCAm4YCXPBKO3d1/KfsiI4c/XLziE40Zb055snQxZf25TW
         8IWYOGrGva/pMv5cCGVSp/rfrGpM96bOVYvDMNjCMR1Jeq/qKwYflnI2oW5hICIkQi4O
         hIKYw63YS0mFjCOxOYcRlnrBAuaCAVfgbTAoNZFHtv8TkahWlbLOywj+dvqmUq0wWDYc
         sQos/Y6KJ79+wKazS5LPWu3lrHzI6hUjGvpjaWJV6F9Y1nPbwoDWlxhubDKDei77wcA+
         SKGg==
X-Gm-Message-State: AOAM533DWD9daBUAQAeUZawwrlFRq7PaL6fU/p01b4HnfSikm9qBFGV4
	eMJGpFo2P+Ps8W/6XZYywJq2Abz10x449A==
X-Google-Smtp-Source: ABdhPJzJdcVOUtqdsX20TTsokjCheBYxNecH75jiQi50Mo3cKfB9dcyovd/wVdvw20ryO6VVZ+7Qpg==
X-Received: by 2002:a17:90a:5d8e:: with SMTP id t14mr22611832pji.85.1622523393148;
        Mon, 31 May 2021 21:56:33 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a054])
        by smtp.gmail.com with ESMTPSA id n69sm12196242pfd.132.2021.05.31.21.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 May 2021 21:56:32 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] mariadb: Include missing sys/type.h for ssize_t
Date: Mon, 31 May 2021 21:56:30 -0700
Message-Id: <20210601045630.533047-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

musl finds this problem in sources where its missing to include
needed system header for ssize_t

Fixes
wsrep-lib/include/wsrep/gtid.hpp:80:5: error: unknown type name 'ssize_t'; did you mean 'size_t'?
    ssize_t scan_from_c_str(const char* buf, size_t buf_len,
    ^~~~~~~
    size_t

Signed-off-by: Khem Raj <raj.khem@gmail.com>
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
2.31.1

