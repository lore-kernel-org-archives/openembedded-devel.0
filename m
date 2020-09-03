Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
 by mx.groups.io with SMTP id smtpd.web12.16467.1599146273392379588
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Sep 2020 08:17:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=O28BmvIQ;
 spf=pass (domain: gmail.com, ip: 209.85.208.66, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f66.google.com with SMTP id l63so3034343edl.9
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Sep 2020 08:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=15vm4h8suZTpxlo6G6ufGd9TaShTU43ZSkzcG8wPEhc=;
        b=O28BmvIQ2OkYaPeH6YGSQL1mDDlRKr/aV0TEVatWMuEwF6ur6MJcV5+Al9KSoMBNjt
         YhuaLyujKBC3fnnf0pwQ1AOWK7cQroH1KN6kqXdolEoqvPN0uaCL7T4SR+O9q6qzKByS
         od9X2IBLGNL/n5fIxbvYOxLsf3FeMu67Um5W+eq/dWvNWrfnD5+7QwYTnhE3e91x5Mim
         Dro/GIr3zcC6sGi4eukL4gka66olAe+MlqosPb/H41iLfindfI98ltmBdL8aMgHVXPvX
         NYtGO0OzDvHvX0tu4qHa1FVNKleIlHDmQnG5WJoN9p9bg6By3jPqIXOWx/wG8m7H3tph
         o2WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=15vm4h8suZTpxlo6G6ufGd9TaShTU43ZSkzcG8wPEhc=;
        b=HQ4w+zsdBpEkEWBe9z84sYzTKkz58mdbjob1cNk4Sq9t+ImevyWAtIyBRLWV/RtiB8
         /bl3F0baqdeS7uc/LQqf8YA/cklFVc2gbW+qba1rQEPPVG/5uOiFzTiyBI68MbcvY0KA
         1B9o51tGvNNfUETpb+9rAsydCV1kgpbhNd0uLZKD9dXK6JOTwUOoIMCk/qZwk8Uoh44U
         vP8cyXACPdcUmgtM2dhtbVfs+tWHtKaIeMIGYUc9MbY4jm7CCguWCp+xRzs3o0ojZw1A
         6Xs7kALn8buW+m70UctgF1UxgUP3mtobuSu8UndP7yq0K/g23X+IZtoaUmtJ/z583h2Q
         PyTA==
X-Gm-Message-State: AOAM531u2iLUhMqLE4jTc4rtY8UNuw60j9nCnW/OwKE/NQCWi0oo7FDe
	qD+R1Se6DrjecrYu4+q9pEXms/SDjwQ=
X-Google-Smtp-Source: ABdhPJw473wPj+21P9eGffid0YWnX4sZZAgm+9H0AtQXxgDMg5zI5TsAFQDnHFyJeUm2vFTcyhSiUQ==
X-Received: by 2002:a05:6402:b1a:: with SMTP id bm26mr3662081edb.209.1599146271143;
        Thu, 03 Sep 2020 08:17:51 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id h1sm3261393edl.36.2020.09.03.08.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2020 08:17:49 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-python2][PATCH] python: prevent lib32-python depending on python
Date: Thu,  3 Sep 2020 17:17:45 +0200
Message-Id: <20200903151745.48259-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

* it was a bit tricky to find this, because
  $ bitbake -g lib32-python
  $ grep '"python\.' task-depends.dot
  doesn't show anything, but if you set
  COMPATIBLE_HOST_pn-python =3D "^(?!x86_64).*"
  $ bitbake lib32-python
  will fail with:
    NOTE: Resolving any missing task queue dependencies
    ERROR: Nothing PROVIDES 'python'
    python was skipped: incompatible with host x86_64-oe-linux (not in COMP=
ATIBLE_HOST)
    ERROR: Required build target 'lib32-python' has no buildable providers.
    Missing or unbuildable dependency chain was: ['lib32-python', 'python']

  so I was wondering where this dependency was created when it isn't part
  of task-depends.dot

  in the end I've added small debug output in bitbake:
    diff --git a/lib/bb/taskdata.py b/lib/bb/taskdata.py
    index ffbaf362..e7fab3cc 100644
    --- a/lib/bb/taskdata.py
    +++ b/lib/bb/taskdata.py
    @@ -70,6 +70,7 @@ class TaskData:
             """

             task_deps =3D dataCache.task_deps[fn]
    +        logger.verbose('add_tasks for %s: %s' % (fn, task_deps))

             if fn in self.failed_fns:
                 bb.msg.fatal("TaskData", "Trying to re-add a failed file? =
Something is broken...")

  which showed exactly where the issue was:
  NOTE: add_tasks for virtual:multilib:lib32:/OE/meta-python2/recipes-devto=
ols/python/python_2.7.18.bb: {'tasks': ['do_patch', 'do_populate_sysroot', =
'do_populate_sysroot_setscene', 'do_prepare_recipe_sysroot', 'do_listtasks'=
, 'do_clean', 'do_checkuri', 'do_fetch', 'do_unpack', 'do_configure', 'do_c=
ompile', 'do_install', 'do_build', 'do_cleansstate', 'do_cleanall', 'do_rm_=
work_all', 'do_rm_work', 'do_build_without_rm_work', 'do_package_qa', 'do_p=
ackage_qa_setscene', 'do_package', 'do_package_setscene', 'do_packagedata',=
 'do_packagedata_setscene', 'do_package_write_ipk_setscene', 'do_package_wr=
ite_ipk', 'do_devshell', 'do_devpyshell', 'do_populate_lic', 'do_populate_l=
ic_setscene', 'do_create_manifest'], 'parents': {'do_patch': ['do_unpack'],=
 'do_populate_sysroot': ['do_install'], 'do_populate_sysroot_setscene': [],=
 'do_prepare_recipe_sysroot': ['do_fetch'], 'do_listtasks': [], 'do_clean':=
 [], 'do_checkuri': [], 'do_fetch': [], 'do_unpack': ['do_fetch'], 'do_conf=
igure': ['do_prepare_recipe_sysroot', 'do_patch'], 'do_compile': ['do_confi=
gure'], 'do_install': ['do_compile'], 'do_build': ['do_rm_work', 'do_popula=
te_lic', 'do_packagedata', 'do_package_qa', 'do_rm_work_all', 'do_populate_=
sysroot'], 'do_cleansstate': ['do_clean'], 'do_cleanall': ['do_cleansstate'=
], 'do_rm_work_all': [], 'do_rm_work': ['do_deploy', 'do_package_qa', 'do_p=
ackage_write_ipk', 'do_packagedata', 'do_populate_lic', 'do_populate_sysroo=
t'], 'do_build_without_rm_work': ['do_deploy', 'do_package_qa', 'do_package=
_write_ipk', 'do_packagedata', 'do_populate_lic', 'do_populate_sysroot'], '=
do_package_qa': ['do_packagedata', 'do_package'], 'do_package_qa_setscene':=
 [], 'do_package': ['do_install'], 'do_package_setscene': [], 'do_packageda=
ta': ['do_package'], 'do_packagedata_setscene': [], 'do_package_write_ipk_s=
etscene': [], 'do_package_write_ipk': ['do_packagedata', 'do_package'], 'do=
_devshell': ['do_patch', 'do_prepare_recipe_sysroot'], 'do_devpyshell': ['d=
o_patch'], 'do_populate_lic': ['do_patch'], 'do_populate_lic_setscene': [],=
 'do_create_manifest': []}, 'mcdepends': {}, 'depends': {'do_patch': 'quilt=
-native:do_populate_sysroot patch-replacement-native:do_populate_sysroot', =
'do_populate_sysroot': ' virtual/lib32-i686-oemllib32-linux-binutils:do_pop=
ulate_sysroot', 'do_prepare_recipe_sysroot': ' virtual/fakeroot-native:do_p=
opulate_sysroot', 'do_fetch': ' wget-native:do_populate_sysroot', 'do_unpac=
k': ' xz-native:do_populate_sysroot', 'do_install': ' virtual/fakeroot-nati=
ve:do_populate_sysroot', 'do_package_qa': ' virtual/lib32-i686-oemllib32-li=
nux-binutils:do_populate_sysroot virtual/fakeroot-native:do_populate_sysroo=
t', 'do_package': ' virtual/fakeroot-native:do_populate_sysroot rpm-native:=
do_populate_sysroot dwarfsrcfiles-native:do_populate_sysroot file-native:do=
_populate_sysroot', 'do_package_setscene': ' virtual/fakeroot-native:do_pop=
ulate_sysroot', 'do_package_write_ipk': '  opkg-utils-native:do_populate_sy=
sroot virtual/fakeroot-native:do_populate_sysroot xz-native:do_populate_sys=
root', 'do_devshell': ' virtual/fakeroot-native:do_populate_sysroot', 'do_c=
reate_manifest': ' python:do_prepare_recipe_sysroot python:do_patch'}, 'rde=
pends': {}, 'deptask': {'do_prepare_recipe_sysroot': 'do_populate_sysroot',=
 'do_package': ' do_packagedata'}, 'rdeptask': {'do_package_qa': 'do_packag=
edata', 'do_package_write_ipk': 'do_packagedata'}, 'recrdeptask': {'do_buil=
d': ' do_deploy do_package_write_ipk', 'do_rm_work_all': 'do_rm_work'}, 're=
cideptask': {}, 'nostamp': {'do_listtasks': '1', 'do_clean': '1', 'do_check=
uri': '1', 'do_cleansstate': '1', 'do_cleanall': '1', 'do_devshell': '1', '=
do_devpyshell': '1'}, 'fakeroot': {'do_install': '1', 'do_package_qa': '1',=
 'do_package': '1', 'do_package_setscene': '1', 'do_package_write_ipk': '1'=
}, 'noexec': {'do_build': '1', 'do_rm_work_all': '1', 'do_build_without_rm_=
work': '1'}, 'umask': {'do_patch': '022', 'do_populate_sysroot': '022', 'do=
_unpack': '022', 'do_configure': '022', 'do_compile': '022', 'do_install': =
'022', 'do_package': '022', 'do_package_write_ipk': '022'}}

* now the fix was simple (the same fix is already in oe-core's python3 reci=
pe,
  since https://git.openembedded.org/openembedded-core/commit/?id=3D02714c1=
05426b0d687620913c1a7401b386428b6)

* and now when I know what task was causing it, it can be shown with bitbak=
e -g as well:
  $ bitbake -g lib32-python -c create_manifest
    NOTE: Started PRServer with DBfile: /OE/build/oe-core/cache/prserv.sqli=
te3, IP: 127.0.0.1, PORT: 43095, PID: 47453
    Loading cache: 100% |##################################################=
###########################################################################=
###########################################################################=
###########################| Time: 0:00:00
    Loaded 7076 entries from dependency cache.
    NOTE: Resolving any missing task queue dependencies
    NOTE: PN build list saved to 'pn-buildlist'
    NOTE: Task dependencies saved to 'task-depends.dot'
  $ grep '"python\.' task-depends.dot
"lib32-python.do_create_manifest" -> "python.do_patch"
"lib32-python.do_create_manifest" -> "python.do_prepare_recipe_sysroot"
"python.do_fetch" [label=3D"python do_fetch\n:2.7.18-r0\n/OE/build/oe-core/=
meta-python2/recipes-devtools/python/python_2.7.18.bb"]
"python.do_patch" [label=3D"python do_patch\n:2.7.18-r0\n/OE/build/oe-core/=
meta-python2/recipes-devtools/python/python_2.7.18.bb"]
"python.do_patch" -> "patch-native.do_populate_sysroot"
"python.do_patch" -> "python.do_unpack"
"python.do_patch" -> "quilt-native.do_populate_sysroot"
"python.do_prepare_recipe_sysroot" [label=3D"python do_prepare_recipe_sysro=
ot\n:2.7.18-r0\n/OE/build/oe-core/meta-python2/recipes-devtools/python/pyth=
on_2.7.18.bb"]
"python.do_prepare_recipe_sysroot" -> "autoconf-native.do_populate_sysroot"
"python.do_prepare_recipe_sysroot" -> "automake-native.do_populate_sysroot"
"python.do_prepare_recipe_sysroot" -> "bzip2.do_populate_sysroot"
"python.do_prepare_recipe_sysroot" -> "db.do_populate_sysroot"
"python.do_prepare_recipe_sysroot" -> "gcc-cross-x86_64.do_populate_sysroot"
"python.do_prepare_recipe_sysroot" -> "gcc-runtime.do_populate_sysroot"
"python.do_prepare_recipe_sysroot" -> "gdbm.do_populate_sysroot"
"python.do_prepare_recipe_sysroot" -> "glibc.do_populate_sysroot"
"python.do_prepare_recipe_sysroot" -> "gnu-config-native.do_populate_sysroo=
t"
"python.do_prepare_recipe_sysroot" -> "libffi.do_populate_sysroot"
"python.do_prepare_recipe_sysroot" -> "libtool-cross.do_populate_sysroot"
"python.do_prepare_recipe_sysroot" -> "libtool-native.do_populate_sysroot"
"python.do_prepare_recipe_sysroot" -> "libxcrypt.do_populate_sysroot"
"python.do_prepare_recipe_sysroot" -> "openssl.do_populate_sysroot"
"python.do_prepare_recipe_sysroot" -> "pkgconfig-native.do_populate_sysroot"
"python.do_prepare_recipe_sysroot" -> "pseudo-native.do_populate_sysroot"
"python.do_prepare_recipe_sysroot" -> "python-native.do_populate_sysroot"
"python.do_prepare_recipe_sysroot" -> "python.do_fetch"
"python.do_prepare_recipe_sysroot" -> "readline.do_populate_sysroot"
"python.do_prepare_recipe_sysroot" -> "sqlite3.do_populate_sysroot"
"python.do_prepare_recipe_sysroot" -> "zlib.do_populate_sysroot"
"python.do_unpack" [label=3D"python do_unpack\n:2.7.18-r0\n/OE/build/oe-cor=
e/meta-python2/recipes-devtools/python/python_2.7.18.bb"]
"python.do_unpack" -> "python.do_fetch"
"python.do_unpack" -> "xz-native.do_populate_sysroot"

* I've included all these debugging steps, to discuss whether "bitbake -g" =
should
  show also the "optional" tasks - no task from python.do_build depends on
  do_create_manifest tasks, it's only called manually with:
  bitbake python -c create_manifest
  but still bitbake includes this task dependency when preparing runqueue or
  maybe bitbake shouldn't include it in the dependency tree when it's not
  going to call that task anyway

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-devtools/python/python_2.7.18.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-devtools/python/python_2.7.18.bb b/recipes-devtools/py=
thon/python_2.7.18.bb
index 0945cb3..c28c010 100644
--- a/recipes-devtools/python/python_2.7.18.bb
+++ b/recipes-devtools/python/python_2.7.18.bb
@@ -256,5 +256,5 @@ do_create_manifest() {
 addtask do_create_manifest
=20
 # Make sure we have native python ready when we create a new manifest
-do_create_manifest[depends] +=3D "python:do_prepare_recipe_sysroot"
-do_create_manifest[depends] +=3D "python:do_patch"
+do_create_manifest[depends] +=3D "${PN}:do_prepare_recipe_sysroot"
+do_create_manifest[depends] +=3D "${PN}:do_patch"
--=20
2.25.1

