Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.1006.1632154644895522792
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Sep 2021 09:17:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KaeGROv2;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id g16so31306116wrb.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Sep 2021 09:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PRjPH6of+MvuSS31recuVqIeSM21xsbz6vdgQIKkTjo=;
        b=KaeGROv2tye+yRM+PuwghzMHpSpXcYh/TSK2PorrtQlYm4pSXkz+jrrjxD9ca1TIQN
         Kcis1KTb1mVSu1YjdstEWQ7cV360PUpZNSMGgXsKZDoqOjcjZRbGiBJ2SsDyNR1SY9Qz
         QUX9GEakwuhw9/J/0TB+z4vxWjokG8Z2jzh6zSPiia543Q8kJGeOAhdUFUzqR3qVaYjP
         ACDFeQoythxk+9L+ncmmr0Bpf/qCQz8p/bBgt8Q12e5ZM5XIDXrAOKNKsc0UKDoRhLGs
         fmV8az9RaW0doPrrsiuy/2eZgFdIvEW3dhJcp+5GgtQwcmlxr+7ByslR8F0MBoNOw18g
         HgdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PRjPH6of+MvuSS31recuVqIeSM21xsbz6vdgQIKkTjo=;
        b=qDq6Ao9BfKHYVydrGHrfZACGDFA/Lv/EftiS6Ypq+eu7F9CNSD0HbrG6OupOf0T+6/
         nUzLE3uERx4aYFjwYZkiQQpIzuYltEvR6tGWSzmagmg8CoNzvP7ezmItO0eNBHnRR+Lv
         86uxcyR2yCSQSLAtI+rGAno/siEPnR869x/7vOHXl4jNGuoJ3s0UF21xFAXVTp9N43NA
         h+ezAuHERXQ9Axe2v6W31u+AciyF3b3PwtMkjBzicFkpXWrJSxCl5Rvn0pHHbR2CgPe7
         6tJ3LaoLxlQkAkAFcWRc2EG6lbIMNcDn6kvOBQdYGsENi0w8H7a0KUKe+kxcLCaNzX9R
         iJ5w==
X-Gm-Message-State: AOAM533PQrjPmnhaBkeTWa91+mFDyrWt4mnijc6T+8zK5BqffPYSiQvB
	HzccbiR6mlZeA6YIQMwwMjSdXTqo84U=
X-Google-Smtp-Source: ABdhPJwdneBjFJ9JYnB1cPdXJg77hEiNHDKDaUsfQ/1aZ8ojx7/fEYCb1teRSwxo5KwZ5+UIqVi21A==
X-Received: by 2002:a05:600c:4f54:: with SMTP id m20mr13468962wmq.96.1632154643350;
        Mon, 20 Sep 2021 09:17:23 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id v20sm16666088wra.73.2021.09.20.09.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 09:17:22 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-python2][PATCH] python-lxml: inherit pkgconfig
Date: Mon, 20 Sep 2021 18:17:14 +0200
Message-Id: <20210920161714.2101020-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* fixes:
| Building without Cython.
| ERROR: /bin/sh: 1: pkg-config: not found
|
| ** make sure the development packages of libxml2 and libxslt are installed **
|
| Using build configuration of libxslt
| running build
| running build_py
| running build_ext
| building 'lxml.etree' extension
| gcc -fno-strict-aliasing -isystem/OE/build/oe-core/tmp-glibc/work/x86_64-linux/python-lxml-native/4.4.2-r0/recipe-sysroot-native/usr/include -O2 -pipe -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -isystem/OE/build/oe-core/tmp-glibc/work/x86_64-linux/python-lxml-native/4.4.2-r0/recipe-sysroot-native/usr/include -O2 -pipe -isystem/OE/build/oe-core/tmp-glibc/work/x86_64-linux/python-lxml-native/4.4.2-r0/recipe-sysroot-native/usr/include -fPIC -DCYTHON_CLINE_IN_TRACEBACK=0 -Isrc -Isrc/lxml/includes -I/OE/build/oe-core/tmp-glibc/work/x86_64-linux/python-lxml-native/4.4.2-r0/recipe-sysroot-native/usr/include/python2.7 -c src/lxml/etree.c -o build/temp.linux-x86_64-2.7/src/lxml/etree.o -w
| In file included from src/lxml/etree.c:692:
| src/lxml/includes/etree_defs.h:14:10: fatal error: libxml/xmlversion.h: No such file or directory
|    14 | #include "libxml/xmlversion.h"
|       |          ^~~~~~~~~~~~~~~~~~~~~
| compilation terminated.
| Compile failed: command 'gcc' failed with exit status 1
| cc -I/usr/include/libxml2 -c /tmp/xmlXPathInithJP6pr.c -o tmp/xmlXPathInithJP6pr.o
| unable to execute 'cc': No such file or directory
| *********************************************************************************
| Could not find function xmlCheckVersion in library libxml2. Is libxml2 installed?
| *********************************************************************************
| error: command 'gcc' failed with exit status 1

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-devtools/python/python-lxml_4.4.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-devtools/python/python-lxml_4.4.2.bb b/recipes-devtools/python/python-lxml_4.4.2.bb
index 7cfedbc..88b5544 100644
--- a/recipes-devtools/python/python-lxml_4.4.2.bb
+++ b/recipes-devtools/python/python-lxml_4.4.2.bb
@@ -21,7 +21,7 @@ SRC_URI[sha256sum] = "eff69ddbf3ad86375c344339371168640951c302450c5d3e9936e98d64
 
 DEPENDS += "libxml2 libxslt"
 
-inherit pypi setuptools
+inherit pypi setuptools pkgconfig
 
 # add to the defaults which are set in the setuptools bbclass
 #
-- 
2.32.0

