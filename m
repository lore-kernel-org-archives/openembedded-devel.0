Received: from mail-io1-f67.google.com (mail-io1-f67.google.com [209.85.166.67])
 by mx.groups.io with SMTP id smtpd.web12.7476.1599867130478074393
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Sep 2020 16:32:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Fjfcc4+d;
 spf=pass (domain: gmail.com, ip: 209.85.166.67, mailfrom: ticotimo@gmail.com)
Received: by mail-io1-f67.google.com with SMTP id z25so12797730iol.10
        for <openembedded-devel@lists.openembedded.org>; Fri, 11 Sep 2020 16:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xsQ9YGHvzbErOIC2/6rLc2kRkoyZejV0FhFlt7KGeuc=;
        b=Fjfcc4+dXZyKO6pP4Fwo0ntAU1J60lR6OtsfOO/0xoJnG4//pTvgJCJ7E9phPZiMxG
         g0kdICgrkXMML8VnUES/X1xKnxhQHolsONI17x5jmRyE6R6/Lk1RGEultJFdZQlWBZKZ
         PHk1/aLeBSJn1z6DlfarG4VwHcTBb8objPYAHAftzzhup9l2EJ8M4gIERgALZLEqtKc9
         //wKTt1sL2EjeLdF+xPNlatYOBQrIaUuAwarT4/z4eM3zEV4RHXt7OVd6uyLhcMlrmcv
         tluPqz3ykoz0HmEWdW/dXAeKeEc6a5LfIF4r5fdzVkW4ebn5DaaWyR9EcQPo0sON9wMk
         Tz2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xsQ9YGHvzbErOIC2/6rLc2kRkoyZejV0FhFlt7KGeuc=;
        b=cSjQUMFc+ipxREAUtC7/FBuuLG8XDq0IdcX1xgaFGcS/uKgQJVOKGOagmsLhj4Ak37
         N7wgsOVpVn6z7S6GwvFg7b3C6vGKG5vir79wmnFcGhhrjKe3X2L6L20pMfeoZVx6Gw35
         IJutqO608Gct0yMD45Xx3M/aASZEOIrZCO+81KBvcYo/Jdb5bLMQZyRLKk1rn3XfYHT8
         Mwo82KdrNRT0nzxU2jIBW5eYP7HWo490WyCObBRLbLo5yOl7vMjgwW7EnAoRgmqQLP4e
         P6Psi9S2MWeeDElh2ChLdch5l4ZfRPlUKEbA0/A0bfsErRKnVhgL3D4h/Shs7btdvkw1
         2ZtA==
X-Gm-Message-State: AOAM533SLqLp+bk/YCNT5yphj19mi18TCBNI6Df43Jh9iEjqtnk9FXnD
	p8Ddma6NBU1/xviE2Lxr4iwt7k9JU8gYvPN1Sos=
X-Google-Smtp-Source: ABdhPJylP+0HJYUFcNncCookYEIHCOqNss0RKghpYniC6P+etcyL/cxEG/6LVcWoESHEZO033zWX5f78HN7D6BUNI4w=
X-Received: by 2002:a05:6602:2b13:: with SMTP id p19mr3802005iov.30.1599867129699;
 Fri, 11 Sep 2020 16:32:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200907130747.3043-1-Martin.Jansa@gmail.com>
In-Reply-To: <20200907130747.3043-1-Martin.Jansa@gmail.com>
From: "Tim Orling" <ticotimo@gmail.com>
Date: Fri, 11 Sep 2020 16:31:58 -0700
Message-ID: <CANx9H-D2dhf3gzV4rf_+oAkPDJTTSnmfefG+ENiN2r5T7PeyOg@mail.gmail.com>
Subject: Re: [oe] [meta-python2][dunfell][PATCH] python: prevent lib32-python depending on python
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000f4251905af12173d"

--000000000000f4251905af12173d
Content-Type: text/plain; charset="UTF-8"

Merged. Thank you.
It would be nice to have a test case for this.

On Mon, Sep 7, 2020 at 6:08 AM Martin Jansa <Martin.Jansa@gmail.com> wrote:

> * it was a bit tricky to find this, because
>   $ bitbake -g lib32-python
>   $ grep '"python\.' task-depends.dot
>   doesn't show anything, but if you set
>   COMPATIBLE_HOST_pn-python = "^(?!x86_64).*"
>   $ bitbake lib32-python
>   will fail with:
>     NOTE: Resolving any missing task queue dependencies
>     ERROR: Nothing PROVIDES 'python'
>     python was skipped: incompatible with host x86_64-oe-linux (not in
> COMPATIBLE_HOST)
>     ERROR: Required build target 'lib32-python' has no buildable providers.
>     Missing or unbuildable dependency chain was: ['lib32-python', 'python']
>
>   so I was wondering where this dependency was created when it isn't part
>   of task-depends.dot
>
>   in the end I've added small debug output in bitbake:
>     diff --git a/lib/bb/taskdata.py b/lib/bb/taskdata.py
>     index ffbaf362..e7fab3cc 100644
>     --- a/lib/bb/taskdata.py
>     +++ b/lib/bb/taskdata.py
>     @@ -70,6 +70,7 @@ class TaskData:
>              """
>
>              task_deps = dataCache.task_deps[fn]
>     +        logger.verbose('add_tasks for %s: %s' % (fn, task_deps))
>
>              if fn in self.failed_fns:
>                  bb.msg.fatal("TaskData", "Trying to re-add a failed file?
> Something is broken...")
>
>   which showed exactly where the issue was:
>   NOTE: add_tasks for
> virtual:multilib:lib32:/OE/meta-python2/recipes-devtools/python/
> python_2.7.18.bb: {'tasks': ['do_patch', 'do_populate_sysroot',
> 'do_populate_sysroot_setscene', 'do_prepare_recipe_sysroot',
> 'do_listtasks', 'do_clean', 'do_checkuri', 'do_fetch', 'do_unpack',
> 'do_configure', 'do_compile', 'do_install', 'do_build', 'do_cleansstate',
> 'do_cleanall', 'do_rm_work_all', 'do_rm_work', 'do_build_without_rm_work',
> 'do_package_qa', 'do_package_qa_setscene', 'do_package',
> 'do_package_setscene', 'do_packagedata', 'do_packagedata_setscene',
> 'do_package_write_ipk_setscene', 'do_package_write_ipk', 'do_devshell',
> 'do_devpyshell', 'do_populate_lic', 'do_populate_lic_setscene',
> 'do_create_manifest'], 'parents': {'do_patch': ['do_unpack'],
> 'do_populate_sysroot': ['do_install'], 'do_populate_sysroot_setscene': [],
> 'do_prepare_recipe_sysroot': ['do_fetch'], 'do_listtasks': [], 'do_clean':
> [], 'do_checkuri': [], 'do_fetch': [], 'do_unpack': ['do_fetch'],
> 'do_configure': ['do_prepare_recipe_sysroot', 'do_patch'], 'do_compile':
> ['do_configure'], 'do_install': ['do_compile'], 'do_build': ['do_rm_work',
> 'do_populate_lic', 'do_packagedata', 'do_package_qa', 'do_rm_work_all',
> 'do_populate_sysroot'], 'do_cleansstate': ['do_clean'], 'do_cleanall':
> ['do_cleansstate'], 'do_rm_work_all': [], 'do_rm_work': ['do_deploy',
> 'do_package_qa', 'do_package_write_ipk', 'do_packagedata',
> 'do_populate_lic', 'do_populate_sysroot'], 'do_build_without_rm_work':
> ['do_deploy', 'do_package_qa', 'do_package_write_ipk', 'do_packagedata',
> 'do_populate_lic', 'do_populate_sysroot'], 'do_package_qa':
> ['do_packagedata', 'do_package'], 'do_package_qa_setscene': [],
> 'do_package': ['do_install'], 'do_package_setscene': [], 'do_packagedata':
> ['do_package'], 'do_packagedata_setscene': [],
> 'do_package_write_ipk_setscene': [], 'do_package_write_ipk':
> ['do_packagedata', 'do_package'], 'do_devshell': ['do_patch',
> 'do_prepare_recipe_sysroot'], 'do_devpyshell': ['do_patch'],
> 'do_populate_lic': ['do_patch'], 'do_populate_lic_setscene': [],
> 'do_create_manifest': []}, 'mcdepends': {}, 'depends': {'do_patch':
> 'quilt-native:do_populate_sysroot
> patch-replacement-native:do_populate_sysroot', 'do_populate_sysroot': '
> virtual/lib32-i686-oemllib32-linux-binutils:do_populate_sysroot',
> 'do_prepare_recipe_sysroot': '
> virtual/fakeroot-native:do_populate_sysroot', 'do_fetch': '
> wget-native:do_populate_sysroot', 'do_unpack': '
> xz-native:do_populate_sysroot', 'do_install': '
> virtual/fakeroot-native:do_populate_sysroot', 'do_package_qa': '
> virtual/lib32-i686-oemllib32-linux-binutils:do_populate_sysroot
> virtual/fakeroot-native:do_populate_sysroot', 'do_package': '
> virtual/fakeroot-native:do_populate_sysroot rpm-native:do_populate_sysroot
> dwarfsrcfiles-native:do_populate_sysroot file-native:do_populate_sysroot',
> 'do_package_setscene': ' virtual/fakeroot-native:do_populate_sysroot',
> 'do_package_write_ipk': '  opkg-utils-native:do_populate_sysroot
> virtual/fakeroot-native:do_populate_sysroot xz-native:do_populate_sysroot',
> 'do_devshell': ' virtual/fakeroot-native:do_populate_sysroot',
> 'do_create_manifest': ' python:do_prepare_recipe_sysroot python:do_patch'},
> 'rdepends': {}, 'deptask': {'do_prepare_recipe_sysroot':
> 'do_populate_sysroot', 'do_package': ' do_packagedata'}, 'rdeptask':
> {'do_package_qa': 'do_packagedata', 'do_package_write_ipk':
> 'do_packagedata'}, 'recrdeptask': {'do_build': ' do_deploy
> do_package_write_ipk', 'do_rm_work_all': 'do_rm_work'}, 'recideptask': {},
> 'nostamp': {'do_listtasks': '1', 'do_clean': '1', 'do_checkuri': '1',
> 'do_cleansstate': '1', 'do_cleanall': '1', 'do_devshell': '1',
> 'do_devpyshell': '1'}, 'fakeroot': {'do_install': '1', 'do_package_qa':
> '1', 'do_package': '1', 'do_package_setscene': '1', 'do_package_write_ipk':
> '1'}, 'noexec': {'do_build': '1', 'do_rm_work_all': '1',
> 'do_build_without_rm_work': '1'}, 'umask': {'do_patch': '022',
> 'do_populate_sysroot': '022', 'do_unpack': '022', 'do_configure': '022',
> 'do_compile': '022', 'do_install': '022', 'do_package': '022',
> 'do_package_write_ipk': '022'}}
>
> * now the fix was simple (the same fix is already in oe-core's python3
> recipe,
>   since
> https://git.openembedded.org/openembedded-core/commit/?id=02714c105426b0d687620913c1a7401b386428b6
> )
>
> * and now when I know what task was causing it, it can be shown with
> bitbake -g as well:
>   $ bitbake -g lib32-python -c create_manifest
>     NOTE: Started PRServer with DBfile:
> /OE/build/oe-core/cache/prserv.sqlite3, IP: 127.0.0.1, PORT: 43095, PID:
> 47453
>     Loading cache: 100%
> |###################################################################################################################################################################################################################################|
> Time: 0:00:00
>     Loaded 7076 entries from dependency cache.
>     NOTE: Resolving any missing task queue dependencies
>     NOTE: PN build list saved to 'pn-buildlist'
>     NOTE: Task dependencies saved to 'task-depends.dot'
>   $ grep '"python\.' task-depends.dot
> "lib32-python.do_create_manifest" -> "python.do_patch"
> "lib32-python.do_create_manifest" -> "python.do_prepare_recipe_sysroot"
> "python.do_fetch" [label="python
> do_fetch\n:2.7.18-r0\n/OE/build/oe-core/meta-python2/recipes-devtools/python/
> python_2.7.18.bb"]
> "python.do_patch" [label="python
> do_patch\n:2.7.18-r0\n/OE/build/oe-core/meta-python2/recipes-devtools/python/
> python_2.7.18.bb"]
> "python.do_patch" -> "patch-native.do_populate_sysroot"
> "python.do_patch" -> "python.do_unpack"
> "python.do_patch" -> "quilt-native.do_populate_sysroot"
> "python.do_prepare_recipe_sysroot" [label="python
> do_prepare_recipe_sysroot\n:2.7.18-r0\n/OE/build/oe-core/meta-python2/recipes-devtools/python/
> python_2.7.18.bb"]
> "python.do_prepare_recipe_sysroot" -> "autoconf-native.do_populate_sysroot"
> "python.do_prepare_recipe_sysroot" -> "automake-native.do_populate_sysroot"
> "python.do_prepare_recipe_sysroot" -> "bzip2.do_populate_sysroot"
> "python.do_prepare_recipe_sysroot" -> "db.do_populate_sysroot"
> "python.do_prepare_recipe_sysroot" ->
> "gcc-cross-x86_64.do_populate_sysroot"
> "python.do_prepare_recipe_sysroot" -> "gcc-runtime.do_populate_sysroot"
> "python.do_prepare_recipe_sysroot" -> "gdbm.do_populate_sysroot"
> "python.do_prepare_recipe_sysroot" -> "glibc.do_populate_sysroot"
> "python.do_prepare_recipe_sysroot" ->
> "gnu-config-native.do_populate_sysroot"
> "python.do_prepare_recipe_sysroot" -> "libffi.do_populate_sysroot"
> "python.do_prepare_recipe_sysroot" -> "libtool-cross.do_populate_sysroot"
> "python.do_prepare_recipe_sysroot" -> "libtool-native.do_populate_sysroot"
> "python.do_prepare_recipe_sysroot" -> "libxcrypt.do_populate_sysroot"
> "python.do_prepare_recipe_sysroot" -> "openssl.do_populate_sysroot"
> "python.do_prepare_recipe_sysroot" ->
> "pkgconfig-native.do_populate_sysroot"
> "python.do_prepare_recipe_sysroot" -> "pseudo-native.do_populate_sysroot"
> "python.do_prepare_recipe_sysroot" -> "python-native.do_populate_sysroot"
> "python.do_prepare_recipe_sysroot" -> "python.do_fetch"
> "python.do_prepare_recipe_sysroot" -> "readline.do_populate_sysroot"
> "python.do_prepare_recipe_sysroot" -> "sqlite3.do_populate_sysroot"
> "python.do_prepare_recipe_sysroot" -> "zlib.do_populate_sysroot"
> "python.do_unpack" [label="python
> do_unpack\n:2.7.18-r0\n/OE/build/oe-core/meta-python2/recipes-devtools/python/
> python_2.7.18.bb"]
> "python.do_unpack" -> "python.do_fetch"
> "python.do_unpack" -> "xz-native.do_populate_sysroot"
>
> * I've included all these debugging steps, to discuss whether "bitbake -g"
> should
>   show also the "optional" tasks - no task from python.do_build depends on
>   do_create_manifest tasks, it's only called manually with:
>   bitbake python -c create_manifest
>   but still bitbake includes this task dependency when preparing runqueue
> or
>   maybe bitbake shouldn't include it in the dependency tree when it's not
>   going to call that task anyway
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  recipes-devtools/python/python_2.7.18.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-devtools/python/python_2.7.18.bb
> b/recipes-devtools/python/python_2.7.18.bb
> index be7c6d2..bca2910 100644
> --- a/recipes-devtools/python/python_2.7.18.bb
> +++ b/recipes-devtools/python/python_2.7.18.bb
> @@ -256,5 +256,5 @@ do_create_manifest() {
>  addtask do_create_manifest
>
>  # Make sure we have native python ready when we create a new manifest
> -do_create_manifest[depends] += "python:do_prepare_recipe_sysroot"
> -do_create_manifest[depends] += "python:do_patch"
> +do_create_manifest[depends] += "${PN}:do_prepare_recipe_sysroot"
> +do_create_manifest[depends] += "${PN}:do_patch"
> --
> 2.25.1
>
> 
>

--000000000000f4251905af12173d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Merged. Thank you.<div>It would be nice to have a test cas=
e for this.</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Mon, Sep 7, 2020 at 6:08 AM Martin Jansa &lt;<a href=3D=
"mailto:Martin.Jansa@gmail.com">Martin.Jansa@gmail.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">* it was a bit tricky=
 to find this, because<br>
=C2=A0 $ bitbake -g lib32-python<br>
=C2=A0 $ grep &#39;&quot;python\.&#39; task-depends.dot<br>
=C2=A0 doesn&#39;t show anything, but if you set<br>
=C2=A0 COMPATIBLE_HOST_pn-python =3D &quot;^(?!x86_64).*&quot;<br>
=C2=A0 $ bitbake lib32-python<br>
=C2=A0 will fail with:<br>
=C2=A0 =C2=A0 NOTE: Resolving any missing task queue dependencies<br>
=C2=A0 =C2=A0 ERROR: Nothing PROVIDES &#39;python&#39;<br>
=C2=A0 =C2=A0 python was skipped: incompatible with host x86_64-oe-linux (=
not in COMPATIBLE_HOST)<br>
=C2=A0 =C2=A0 ERROR: Required build target &#39;lib32-python&#39; has no b=
uildable providers.<br>
=C2=A0 =C2=A0 Missing or unbuildable dependency chain was: [&#39;lib32-pyt=
hon&#39;, &#39;python&#39;]<br>
<br>
=C2=A0 so I was wondering where this dependency was created when it isn&#3=
9;t part<br>
=C2=A0 of task-depends.dot<br>
<br>
=C2=A0 in the end I&#39;ve added small debug output in bitbake:<br>
=C2=A0 =C2=A0 diff --git a/lib/bb/taskdata.py b/lib/bb/taskdata.py<br>
=C2=A0 =C2=A0 index ffbaf362..e7fab3cc 100644<br>
=C2=A0 =C2=A0 --- a/lib/bb/taskdata.py<br>
=C2=A0 =C2=A0 +++ b/lib/bb/taskdata.py<br>
=C2=A0 =C2=A0 @@ -70,6 +70,7 @@ class TaskData:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0task_deps =3D dataCache.ta=
sk_deps[fn]<br>
=C2=A0 =C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 logger.verbose(&#39;add_tasks f=
or %s: %s&#39; % (fn, task_deps))<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if fn in self.failed_fns:<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.msg.fatal=
(&quot;TaskData&quot;, &quot;Trying to re-add a failed file? Something is b=
roken...&quot;)<br>
<br>
=C2=A0 which showed exactly where the issue was:<br>
=C2=A0 NOTE: add_tasks for virtual:multilib:lib32:/OE/meta-python2/recipes=
-devtools/python/<a href=3D"http://python_2.7.18.bb" rel=3D"noreferrer" tar=
get=3D"_blank">python_2.7.18.bb</a>: {&#39;tasks&#39;: [&#39;do_patch&#39;,=
 &#39;do_populate_sysroot&#39;, &#39;do_populate_sysroot_setscene&#39;, &#3=
9;do_prepare_recipe_sysroot&#39;, &#39;do_listtasks&#39;, &#39;do_clean&#39=
;, &#39;do_checkuri&#39;, &#39;do_fetch&#39;, &#39;do_unpack&#39;, &#39;do_=
configure&#39;, &#39;do_compile&#39;, &#39;do_install&#39;, &#39;do_build&#=
39;, &#39;do_cleansstate&#39;, &#39;do_cleanall&#39;, &#39;do_rm_work_all&#=
39;, &#39;do_rm_work&#39;, &#39;do_build_without_rm_work&#39;, &#39;do_pack=
age_qa&#39;, &#39;do_package_qa_setscene&#39;, &#39;do_package&#39;, &#39;d=
o_package_setscene&#39;, &#39;do_packagedata&#39;, &#39;do_packagedata_sets=
cene&#39;, &#39;do_package_write_ipk_setscene&#39;, &#39;do_package_write_i=
pk&#39;, &#39;do_devshell&#39;, &#39;do_devpyshell&#39;, &#39;do_populate_l=
ic&#39;, &#39;do_populate_lic_setscene&#39;, &#39;do_create_manifest&#39;],=
 &#39;parents&#39;: {&#39;do_patch&#39;: [&#39;do_unpack&#39;], &#39;do_pop=
ulate_sysroot&#39;: [&#39;do_install&#39;], &#39;do_populate_sysroot_setsce=
ne&#39;: [], &#39;do_prepare_recipe_sysroot&#39;: [&#39;do_fetch&#39;], &#3=
9;do_listtasks&#39;: [], &#39;do_clean&#39;: [], &#39;do_checkuri&#39;: [],=
 &#39;do_fetch&#39;: [], &#39;do_unpack&#39;: [&#39;do_fetch&#39;], &#39;do=
_configure&#39;: [&#39;do_prepare_recipe_sysroot&#39;, &#39;do_patch&#39;],=
 &#39;do_compile&#39;: [&#39;do_configure&#39;], &#39;do_install&#39;: [&#3=
9;do_compile&#39;], &#39;do_build&#39;: [&#39;do_rm_work&#39;, &#39;do_popu=
late_lic&#39;, &#39;do_packagedata&#39;, &#39;do_package_qa&#39;, &#39;do_r=
m_work_all&#39;, &#39;do_populate_sysroot&#39;], &#39;do_cleansstate&#39;: =
[&#39;do_clean&#39;], &#39;do_cleanall&#39;: [&#39;do_cleansstate&#39;], &#=
39;do_rm_work_all&#39;: [], &#39;do_rm_work&#39;: [&#39;do_deploy&#39;, &#3=
9;do_package_qa&#39;, &#39;do_package_write_ipk&#39;, &#39;do_packagedata&#=
39;, &#39;do_populate_lic&#39;, &#39;do_populate_sysroot&#39;], &#39;do_bui=
ld_without_rm_work&#39;: [&#39;do_deploy&#39;, &#39;do_package_qa&#39;, &#3=
9;do_package_write_ipk&#39;, &#39;do_packagedata&#39;, &#39;do_populate_lic=
&#39;, &#39;do_populate_sysroot&#39;], &#39;do_package_qa&#39;: [&#39;do_pa=
ckagedata&#39;, &#39;do_package&#39;], &#39;do_package_qa_setscene&#39;: []=
, &#39;do_package&#39;: [&#39;do_install&#39;], &#39;do_package_setscene&#3=
9;: [], &#39;do_packagedata&#39;: [&#39;do_package&#39;], &#39;do_packageda=
ta_setscene&#39;: [], &#39;do_package_write_ipk_setscene&#39;: [], &#39;do_=
package_write_ipk&#39;: [&#39;do_packagedata&#39;, &#39;do_package&#39;], &=
#39;do_devshell&#39;: [&#39;do_patch&#39;, &#39;do_prepare_recipe_sysroot&#=
39;], &#39;do_devpyshell&#39;: [&#39;do_patch&#39;], &#39;do_populate_lic&#=
39;: [&#39;do_patch&#39;], &#39;do_populate_lic_setscene&#39;: [], &#39;do_=
create_manifest&#39;: []}, &#39;mcdepends&#39;: {}, &#39;depends&#39;: {&#3=
9;do_patch&#39;: &#39;quilt-native:do_populate_sysroot patch-replacement-na=
tive:do_populate_sysroot&#39;, &#39;do_populate_sysroot&#39;: &#39; virtual=
/lib32-i686-oemllib32-linux-binutils:do_populate_sysroot&#39;, &#39;do_prep=
are_recipe_sysroot&#39;: &#39; virtual/fakeroot-native:do_populate_sysroot&=
#39;, &#39;do_fetch&#39;: &#39; wget-native:do_populate_sysroot&#39;, &#39;=
do_unpack&#39;: &#39; xz-native:do_populate_sysroot&#39;, &#39;do_install&#=
39;: &#39; virtual/fakeroot-native:do_populate_sysroot&#39;, &#39;do_packag=
e_qa&#39;: &#39; virtual/lib32-i686-oemllib32-linux-binutils:do_populate_sy=
sroot virtual/fakeroot-native:do_populate_sysroot&#39;, &#39;do_package&#39=
;: &#39; virtual/fakeroot-native:do_populate_sysroot rpm-native:do_populate=
_sysroot dwarfsrcfiles-native:do_populate_sysroot file-native:do_populate_s=
ysroot&#39;, &#39;do_package_setscene&#39;: &#39; virtual/fakeroot-native:d=
o_populate_sysroot&#39;, &#39;do_package_write_ipk&#39;: &#39;=C2=A0 opkg-u=
tils-native:do_populate_sysroot virtual/fakeroot-native:do_populate_sysroot=
 xz-native:do_populate_sysroot&#39;, &#39;do_devshell&#39;: &#39; virtual/f=
akeroot-native:do_populate_sysroot&#39;, &#39;do_create_manifest&#39;: &#39=
; python:do_prepare_recipe_sysroot python:do_patch&#39;}, &#39;rdepends&#39=
;: {}, &#39;deptask&#39;: {&#39;do_prepare_recipe_sysroot&#39;: &#39;do_pop=
ulate_sysroot&#39;, &#39;do_package&#39;: &#39; do_packagedata&#39;}, &#39;=
rdeptask&#39;: {&#39;do_package_qa&#39;: &#39;do_packagedata&#39;, &#39;do_=
package_write_ipk&#39;: &#39;do_packagedata&#39;}, &#39;recrdeptask&#39;: {=
&#39;do_build&#39;: &#39; do_deploy do_package_write_ipk&#39;, &#39;do_rm_w=
ork_all&#39;: &#39;do_rm_work&#39;}, &#39;recideptask&#39;: {}, &#39;nostam=
p&#39;: {&#39;do_listtasks&#39;: &#39;1&#39;, &#39;do_clean&#39;: &#39;1&#3=
9;, &#39;do_checkuri&#39;: &#39;1&#39;, &#39;do_cleansstate&#39;: &#39;1&#3=
9;, &#39;do_cleanall&#39;: &#39;1&#39;, &#39;do_devshell&#39;: &#39;1&#39;,=
 &#39;do_devpyshell&#39;: &#39;1&#39;}, &#39;fakeroot&#39;: {&#39;do_instal=
l&#39;: &#39;1&#39;, &#39;do_package_qa&#39;: &#39;1&#39;, &#39;do_package&=
#39;: &#39;1&#39;, &#39;do_package_setscene&#39;: &#39;1&#39;, &#39;do_pack=
age_write_ipk&#39;: &#39;1&#39;}, &#39;noexec&#39;: {&#39;do_build&#39;: &#=
39;1&#39;, &#39;do_rm_work_all&#39;: &#39;1&#39;, &#39;do_build_without_rm_=
work&#39;: &#39;1&#39;}, &#39;umask&#39;: {&#39;do_patch&#39;: &#39;022&#39=
;, &#39;do_populate_sysroot&#39;: &#39;022&#39;, &#39;do_unpack&#39;: &#39;=
022&#39;, &#39;do_configure&#39;: &#39;022&#39;, &#39;do_compile&#39;: &#39=
;022&#39;, &#39;do_install&#39;: &#39;022&#39;, &#39;do_package&#39;: &#39;=
022&#39;, &#39;do_package_write_ipk&#39;: &#39;022&#39;}}<br>
<br>
* now the fix was simple (the same fix is already in oe-core&#39;s python3=
 recipe,<br>
=C2=A0 since <a href=3D"https://git.openembedded.org/openembedded-core/com=
mit/?id=3D02714c105426b0d687620913c1a7401b386428b6" rel=3D"noreferrer" targ=
et=3D"_blank">https://git.openembedded.org/openembedded-core/commit/?id=3D0=
2714c105426b0d687620913c1a7401b386428b6</a>)<br>
<br>
* and now when I know what task was causing it, it can be shown with bitba=
ke -g as well:<br>
=C2=A0 $ bitbake -g lib32-python -c create_manifest<br>
=C2=A0 =C2=A0 NOTE: Started PRServer with DBfile: /OE/build/oe-core/cache/=
prserv.sqlite3, IP: 127.0.0.1, PORT: 43095, PID: 47453<br>
=C2=A0 =C2=A0 Loading cache: 100% |#######################################=
###########################################################################=
###########################################################################=
######################################| Time: 0:00:00<br>
=C2=A0 =C2=A0 Loaded 7076 entries from dependency cache.<br>
=C2=A0 =C2=A0 NOTE: Resolving any missing task queue dependencies<br>
=C2=A0 =C2=A0 NOTE: PN build list saved to &#39;pn-buildlist&#39;<br>
=C2=A0 =C2=A0 NOTE: Task dependencies saved to &#39;task-depends.dot&#39;<=
br>
=C2=A0 $ grep &#39;&quot;python\.&#39; task-depends.dot<br>
&quot;lib32-python.do_create_manifest&quot; -&gt; &quot;python.do_patch&qu=
ot;<br>
&quot;lib32-python.do_create_manifest&quot; -&gt; &quot;python.do_prepare_=
recipe_sysroot&quot;<br>
&quot;python.do_fetch&quot; [label=3D&quot;python do_fetch\n:2.7.18-r0\n/O=
E/build/oe-core/meta-python2/recipes-devtools/python/<a href=3D"http://pyth=
on_2.7.18.bb" rel=3D"noreferrer" target=3D"_blank">python_2.7.18.bb</a>&quo=
t;]<br>
&quot;python.do_patch&quot; [label=3D&quot;python do_patch\n:2.7.18-r0\n/O=
E/build/oe-core/meta-python2/recipes-devtools/python/<a href=3D"http://pyth=
on_2.7.18.bb" rel=3D"noreferrer" target=3D"_blank">python_2.7.18.bb</a>&quo=
t;]<br>
&quot;python.do_patch&quot; -&gt; &quot;patch-native.do_populate_sysroot&q=
uot;<br>
&quot;python.do_patch&quot; -&gt; &quot;python.do_unpack&quot;<br>
&quot;python.do_patch&quot; -&gt; &quot;quilt-native.do_populate_sysroot&q=
uot;<br>
&quot;python.do_prepare_recipe_sysroot&quot; [label=3D&quot;python do_prep=
are_recipe_sysroot\n:2.7.18-r0\n/OE/build/oe-core/meta-python2/recipes-devt=
ools/python/<a href=3D"http://python_2.7.18.bb" rel=3D"noreferrer" target=
=3D"_blank">python_2.7.18.bb</a>&quot;]<br>
&quot;python.do_prepare_recipe_sysroot&quot; -&gt; &quot;autoconf-native.d=
o_populate_sysroot&quot;<br>
&quot;python.do_prepare_recipe_sysroot&quot; -&gt; &quot;automake-native.d=
o_populate_sysroot&quot;<br>
&quot;python.do_prepare_recipe_sysroot&quot; -&gt; &quot;bzip2.do_populate=
_sysroot&quot;<br>
&quot;python.do_prepare_recipe_sysroot&quot; -&gt; &quot;db.do_populate_sy=
sroot&quot;<br>
&quot;python.do_prepare_recipe_sysroot&quot; -&gt; &quot;gcc-cross-x86_64.=
do_populate_sysroot&quot;<br>
&quot;python.do_prepare_recipe_sysroot&quot; -&gt; &quot;gcc-runtime.do_po=
pulate_sysroot&quot;<br>
&quot;python.do_prepare_recipe_sysroot&quot; -&gt; &quot;gdbm.do_populate_=
sysroot&quot;<br>
&quot;python.do_prepare_recipe_sysroot&quot; -&gt; &quot;glibc.do_populate=
_sysroot&quot;<br>
&quot;python.do_prepare_recipe_sysroot&quot; -&gt; &quot;gnu-config-native=
.do_populate_sysroot&quot;<br>
&quot;python.do_prepare_recipe_sysroot&quot; -&gt; &quot;libffi.do_populat=
e_sysroot&quot;<br>
&quot;python.do_prepare_recipe_sysroot&quot; -&gt; &quot;libtool-cross.do_=
populate_sysroot&quot;<br>
&quot;python.do_prepare_recipe_sysroot&quot; -&gt; &quot;libtool-native.do=
_populate_sysroot&quot;<br>
&quot;python.do_prepare_recipe_sysroot&quot; -&gt; &quot;libxcrypt.do_popu=
late_sysroot&quot;<br>
&quot;python.do_prepare_recipe_sysroot&quot; -&gt; &quot;openssl.do_popula=
te_sysroot&quot;<br>
&quot;python.do_prepare_recipe_sysroot&quot; -&gt; &quot;pkgconfig-native.=
do_populate_sysroot&quot;<br>
&quot;python.do_prepare_recipe_sysroot&quot; -&gt; &quot;pseudo-native.do_=
populate_sysroot&quot;<br>
&quot;python.do_prepare_recipe_sysroot&quot; -&gt; &quot;python-native.do_=
populate_sysroot&quot;<br>
&quot;python.do_prepare_recipe_sysroot&quot; -&gt; &quot;python.do_fetch&q=
uot;<br>
&quot;python.do_prepare_recipe_sysroot&quot; -&gt; &quot;readline.do_popul=
ate_sysroot&quot;<br>
&quot;python.do_prepare_recipe_sysroot&quot; -&gt; &quot;sqlite3.do_popula=
te_sysroot&quot;<br>
&quot;python.do_prepare_recipe_sysroot&quot; -&gt; &quot;zlib.do_populate_=
sysroot&quot;<br>
&quot;python.do_unpack&quot; [label=3D&quot;python do_unpack\n:2.7.18-r0\n=
/OE/build/oe-core/meta-python2/recipes-devtools/python/<a href=3D"http://py=
thon_2.7.18.bb" rel=3D"noreferrer" target=3D"_blank">python_2.7.18.bb</a>&q=
uot;]<br>
&quot;python.do_unpack&quot; -&gt; &quot;python.do_fetch&quot;<br>
&quot;python.do_unpack&quot; -&gt; &quot;xz-native.do_populate_sysroot&quo=
t;<br>
<br>
* I&#39;ve included all these debugging steps, to discuss whether &quot;bi=
tbake -g&quot; should<br>
=C2=A0 show also the &quot;optional&quot; tasks - no task from python.do_b=
uild depends on<br>
=C2=A0 do_create_manifest tasks, it&#39;s only called manually with:<br>
=C2=A0 bitbake python -c create_manifest<br>
=C2=A0 but still bitbake includes this task dependency when preparing runq=
ueue or<br>
=C2=A0 maybe bitbake shouldn&#39;t include it in the dependency tree when =
it&#39;s not<br>
=C2=A0 going to call that task anyway<br>
<br>
Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" =
target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
---<br>
=C2=A0recipes-devtools/python/<a href=3D"http://python_2.7.18.bb" rel=3D"n=
oreferrer" target=3D"_blank">python_2.7.18.bb</a> | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/recipes-devtools/python/<a href=3D"http://python_2.7.18.bb" r=
el=3D"noreferrer" target=3D"_blank">python_2.7.18.bb</a> b/recipes-devtools=
/python/<a href=3D"http://python_2.7.18.bb" rel=3D"noreferrer" target=3D"_b=
lank">python_2.7.18.bb</a><br>
index be7c6d2..bca2910 100644<br>
--- a/recipes-devtools/python/<a href=3D"http://python_2.7.18.bb" rel=3D"n=
oreferrer" target=3D"_blank">python_2.7.18.bb</a><br>
+++ b/recipes-devtools/python/<a href=3D"http://python_2.7.18.bb" rel=3D"n=
oreferrer" target=3D"_blank">python_2.7.18.bb</a><br>
@@ -256,5 +256,5 @@ do_create_manifest() {<br>
=C2=A0addtask do_create_manifest<br>
<br>
=C2=A0# Make sure we have native python ready when we create a new manifes=
t<br>
-do_create_manifest[depends] +=3D &quot;python:do_prepare_recipe_sysroot&q=
uot;<br>
-do_create_manifest[depends] +=3D &quot;python:do_patch&quot;<br>
+do_create_manifest[depends] +=3D &quot;${PN}:do_prepare_recipe_sysroot&qu=
ot;<br>
+do_create_manifest[depends] +=3D &quot;${PN}:do_patch&quot;<br>
-- <br>
2.25.1<br>
<br>
<br>
</blockquote></div>

--000000000000f4251905af12173d--
