Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web12.5247.1587597505187923377
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Apr 2020 16:18:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=S9jhE9nq;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id 145so1915219pfw.13
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Apr 2020 16:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zCnE1jeWi8+OwReTYtZKrPArFCR1UlS4LS0YjdK9RG0=;
        b=S9jhE9nqRi+jDdJ02kQpOUC7iL56BzOl9bqkz0UGcu/4krqhoUUGj36+xujS5ZsfyK
         wqUYfB7t6H+sJO13gUSNvR+zkBoEEIydYIQPOiM6XDToelU9sGCKKNrQzpOEwNI3Jh27
         viPgjhei9c6h6n2bvgW57A9vjUrgGPGokuZ6CMVQxIoMcpnhBXqoSazhsl1LDnrIXnMu
         7gBz3nEWF1GcR/6OsZwB5eTvvOkstN7psKIvRhesCXnQGiQiFmLUTTGuQYvL/zzNgXqC
         s4hn7uK4hb6F5CGOUkBJ7L7bNxIVZJF1GkJTi2phcYU5ZCI8KuK4H+pI4U8ht05He1WI
         w08w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zCnE1jeWi8+OwReTYtZKrPArFCR1UlS4LS0YjdK9RG0=;
        b=QiEFHbPseGt/OJz3Ou4M/GGueDzkQn60udfqPVY7h35eWcV94EBd5bjAjZdQgcyM2z
         5WPyhuxZkdbz0NmFmtNNpjd1+OT08qT+3/3au4x0Pf+Siws3umfQH8/cb7Bmi9GUyUaR
         aWGp2eNMZcFRXpmr/gwa34oM6pKXU7FIrgBxp5AyoiWyixirig+y+SlfmnbTOYYxFvTk
         qy0YKmvNA0aZ2DsZ3RozfqOeP6pZFyQF1v8eAx3r2eEmz4QVrvxnDOwUXyCxC8IPbFpD
         jQ7UAcBYigvmjRwFyZWuq+worNHXAtrYo4fc+BGy7gTlYxhEDkdKDIYEJaDDkfo+kS5E
         aYzw==
X-Gm-Message-State: AGi0Pua4B7HXJJx6eLmPkzNhtMTVmduKG439LBm5SIHE3wFX6ScjT5Nl
	ug6zAahPyzD1HTgGfHCJaxeArIE2b7Y=
X-Google-Smtp-Source: APiQypLzSAHyW/jEyFrwQiHutm/zSCFd6i1drTQ3gN4oY+QHADO6U2tW4MBsFQiVxNzfnqmZWkRckQ==
X-Received: by 2002:a63:d709:: with SMTP id d9mr1341846pgg.82.1587597504360;
        Wed, 22 Apr 2020 16:18:24 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::1a60])
        by smtp.gmail.com with ESMTPSA id g1sm311213pjt.25.2020.04.22.16.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2020 16:18:23 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/4] ltrace: Do not build on riscv
Date: Wed, 22 Apr 2020 16:18:18 -0700
Message-Id: <20200422231819.1029522-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200422231819.1029522-1-raj.khem@gmail.com>
References: <20200422231819.1029522-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Does not have riscv port yet

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/ltrace/ltrace_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
index 6b66c25297..5710943d74 100644
--- a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
+++ b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
@@ -38,6 +38,9 @@ PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'selinux', d)}"
 PACKAGECONFIG[unwind] = "--with-libunwind,--without-libunwind,libunwind"
 PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux,libselinux"
 
+COMPATIBLE_HOST_riscv64 = "null"
+COMPATIBLE_HOST_riscv32 = "null"
+
 do_configure_prepend () {
     ( cd ${S}; ./autogen.sh )
 }
-- 
2.26.2

