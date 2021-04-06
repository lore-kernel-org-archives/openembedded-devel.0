Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web09.10184.1617705389998314476
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Apr 2021 03:36:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SXRkELcw;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id hq27so21056216ejc.9
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Apr 2021 03:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xDM/UqA+g+vVvgQfIPgIW2xQCTOeRHtMceTLJkjBpvk=;
        b=SXRkELcwWOmwatN7v3jyMx1UY2WQPL/lnLcA9lMmWWalyIF43eTgZ9a3JWNNLUXeX8
         oTF48jwRnAXoO8ap4Br4oKMBNEi0koLktE7Q+UGpAGOvhbkp/PEzuhDL/nPYxQJoAB2Q
         Tm2mcsQDI3FcNShw0ZMMHzdtEAvYvBPb1wnosA+kmJemnPnCd5jCdg0mhAN165Jce1E8
         edCKQRo9tfjvU4V+0QUxgl+/K5ImcSy7/IU2df8sdFIXzHkGlW+u7nwaAbm7IAReiW6y
         MncRKZofnbLVV7I+BqecVz6BQqBaXBQ78z3rkSdMWYRVUjIqM/eUIPiCYsQmg5Lk8LhR
         EgLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xDM/UqA+g+vVvgQfIPgIW2xQCTOeRHtMceTLJkjBpvk=;
        b=a/aGq39ZYlnadpdeM2DephUI56S3F61TPbXl9DQju4owYiEFGY5fahV9a8mN7YtSfd
         8Ux+p/33K0Hw9824spDq2TE5AaLI0UeC4JSYoZ0d3KQhnLQPym5eGRE5KaaBFuhuBghe
         7jWl6C7aOEMo1uC0+P44yUbbgRYEalJPyHhpj8wXNA4D41gtJUU4W3uZH0qSevVDettb
         fCpStx2C1bpVzK6254WB+DBm6zisx1oR07Xop5PyFefqbGeUsBGogVNi+Fp46OjVxYvZ
         sLxW4QipC/U2cyBWOtrHoi0Vr/RdpYRpysS9eoaX8TiNm05qKkBjl2MwSvf/uqJaFqe4
         gQwQ==
X-Gm-Message-State: AOAM530smKN0e6HI6/q+SInnKIJ6so8+WeHvewBGOG69ADDEOpVm934o
	aqpDIaR6a02rOFbukpuolu0p7jApreQ=
X-Google-Smtp-Source: ABdhPJw/XqzIWWlnhuwIN7l3U4U+Nb1IlzvM1ENiuaC0vlsKNk9BQksjnA6KQ2iKqSRR2a/dLgl4JA==
X-Received: by 2002:a17:906:f203:: with SMTP id gt3mr32591471ejb.346.1617705388440;
        Tue, 06 Apr 2021 03:36:28 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id nb29sm559896ejc.118.2021.04.06.03.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 03:36:27 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-python2][dunfell][gatesgarth][hardknott][master][PATCH] python-pyrex: fix installed-vs-shipped QA issue with usrmerge
Date: Tue,  6 Apr 2021 12:36:25 +0200
Message-Id: <20210406103625.1138536-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* fixes:
  ERROR: python-pyrex-0.9.9-r4 do_package: QA Issue: python-pyrex: Files/directories were installed but not shipped in any package:
    /usr/share
    /usr/share/lib
    /usr/share/lib/python2.7
    /usr/share/lib/python2.7/site-packages
    /usr/share/lib/python2.7/site-packages/Pyrex
    /usr/share/lib/python2.7/site-packages/Pyrex/Compiler
    /usr/share/lib/python2.7/site-packages/Pyrex/Compiler/Lexicon.pickle
  Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
  python-pyrex: 7 installed and not shipped files. [installed-vs-shipped]
  ERROR: python-pyrex-0.9.9-r4 do_package: Fatal QA errors found, failing task.

* base_libdir becames /usr/lib with usrmerge in DISTRO_FEATURES:
  # $base_libdir [4 operations]
  #   exported /OE/build/oe-core/openembedded-core/meta/conf/bitbake.conf:26
  #     [export] "1"
  #   set /OE/build/oe-core/openembedded-core/meta/conf/bitbake.conf:26
  #     "${root_prefix}/${baselib}"
  #   override[native]:set /OE/build/oe-core/openembedded-core/meta/conf/bitbake.conf:62
  #     "/lib"
  #   override[nativesdk]:set /OE/build/oe-core/openembedded-core/meta/conf/bitbake.conf:73
  #     "/lib"
  # pre-expansion value:
  #   "${root_prefix}/${baselib}"
  export base_libdir="/usr/lib"

  # $root_prefix
  #   set /OE/build/oe-core/openembedded-core/meta/conf/bitbake.conf:21
  #     "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', '${exec_prefix}', '${base_prefix}', d)}"
  root_prefix="/usr"

* but pyrex setup.py is using get_python_lib from distutils.sysconfig and that
  doesn't get changed to /usr/lib prefix:

    data_files=[
        (compiler_dir, ['Pyrex/Compiler/Lexicon.pickle'])
    ]

    compiler_dir = os.path.join(get_python_lib(prefix=''), 'Pyrex', 'Compiler')

  >>> from distutils.sysconfig import get_python_lib
  >>> print(get_python_lib(prefix=''))
  lib/python2.7/dist-packages

* python3 is also using baselib
  meta/recipes-devtools/python/python3_3.9.2.bb:EXTRA_OECONF = " --without-ensurepip --enable-shared --with-platlibdir=${baselib}"
  meta/recipes-devtools/python/python3_3.9.2.bb:  LIB=${baselib} \

  meta-oe/recipes-extended/mraa/mraa_git.bb:                         -DPYTHON3_PACKAGES_PATH:PATH=${baselib}/python${PYTHON_BASEVERSION}/site-packages

  in python2 it seems to implement the same but through libdirleaf dropping ${prefix}/
  recipes-devtools/python/python.inc:       libdirleaf="$(echo ${libdir} | sed -e 's:${prefix}/::')"
  recipes-devtools/python/python.inc:       sed -i -e "s:SEDMELIBLEAF:${libdirleaf}:g" \

  before that it was using "basename ${libdir}"
  https://git.openembedded.org/openembedded-core/commit/?id=c61c416a6504f7e8885df3c94c839d1031920a1c

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-devtools/python/python-pyrex_0.9.9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-devtools/python/python-pyrex_0.9.9.bb b/recipes-devtools/python/python-pyrex_0.9.9.bb
index 3df784f..51786df 100644
--- a/recipes-devtools/python/python-pyrex_0.9.9.bb
+++ b/recipes-devtools/python/python-pyrex_0.9.9.bb
@@ -19,6 +19,6 @@ S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 inherit distutils
 
-FILES_${PN} += "${datadir}${base_libdir}/${PYTHON_DIR}/site-packages/Pyrex/Compiler/Lexicon.pickle"
+FILES_${PN} += "${datadir}${baselib}/${PYTHON_DIR}/site-packages/Pyrex/Compiler/Lexicon.pickle"
 
 PNBLACKLIST[python-pyrex] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
-- 
2.30.2

