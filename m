Received: from [209.85.132.250] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <lvcargnini@gmail.com>) id 1HugLL-0007D2-UH
	for openembedded-devel@lists.openembedded.org;
	Sun, 03 Jun 2007 05:01:25 +0200
Received: by an-out-0708.google.com with SMTP id b33so232892ana
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 02 Jun 2007 19:59:22 -0700 (PDT)
Received: by 10.100.95.19 with SMTP id s19mr1845390anb.1180839562450;
	Sat, 02 Jun 2007 19:59:22 -0700 (PDT)
Received: by 10.100.11.6 with HTTP; Sat, 2 Jun 2007 19:59:22 -0700 (PDT)
Message-ID: <ae36f8040706021959p2c020f17k454aa346d7123f95@mail.gmail.com>
Date: Sat, 2 Jun 2007 23:59:22 -0300
From: "=?ISO-8859-1?Q?Lu=EDs_Cargnini?=" <lvcargnini@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Subject: problems doing bitbake task-base
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 03 Jun 2007 03:01:27 -0000
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Please someone could told me what is the reason of this error messsage:
NOTE: Using cache in
'/home/lvcargnini/puc/instramed/openembedded/tmp/cache/omap5912osk'
NOTE: Handling BitBake files: | (4598/4598) [100 %]
NOTE: Parsing finished. 723 cached, 3663 parsed, 212 skipped, 0 masked.

NOTE: build 200706022342: started

OE Build Configuration:
BB_VERSION     =3D "1.6.6"
OE_REVISION    =3D "c6559ceba5987d7142c9759ae7f895632ac3b712"
TARGET_ARCH    =3D "arm"
TARGET_OS      =3D "linux"
MACHINE        =3D "omap5912osk"
DISTRO         =3D "generic"
DISTRO_VERSION =3D ".dev-snapshot-20070603"
TARGET_FPU     =3D "soft"

NOTE: package glibc-2.5: started
NOTE: package glibc-2.5-r6: task do_package: started
ERROR: Error in executing:
/home/lvcargnini/puc/instramed/openembedded/org.openembedded.dev/packages/g=
libc/glibc_2.5.bb
ERROR: Exception:exceptions.ValueError Message:need more than 1 value to
unpack
ERROR: Printing the environment of the function
ERROR:  0057:   # Collate the locales by base and encoding
ERROR:  0058:   encodings =3D {}
ERROR:  0059:   for l in supported:
ERROR:  0060:           l =3D l[:-1]
ERROR:  0061:           (locale, charset) =3D l.split(" ")
ERROR:  0062:           m =3D dot_re.match(locale)
ERROR:  0063:           if m:
ERROR:  0064:                   locale =3D m.group(1)
ERROR:  0065:           if not encodings.has_key(locale):
ERROR: Error in executing:
/home/lvcargnini/puc/instramed/openembedded/org.openembedded.dev/packages/g=
libc/glibc_2.5.bb
ERROR: Exception:exceptions.ValueError Message:need more than 1 value to
unpack
ERROR: Printing the environment of the function
ERROR:  0057:   if (bb.data.getVar('INHIBIT_PACKAGE_STRIP', d, 1) !=3D '1')=
:
ERROR:  0058:           stripfunc =3D ""
ERROR:  0059:           for root, dirs, files in os.walk(dvar):
ERROR:  0060:                   for f in files:
ERROR:  0061:                           file =3D os.path.join(root, f)
ERROR:  0062:                           if not os.path.islink(file) and not
os.path.isdir(file) and isexec(file):
ERROR:  0063:                                   stripfunc +=3D "\trunstrip =
%s
|| st=3D1\n" % (file)
ERROR:  0064:           if not stripfunc =3D=3D "":
ERROR:  0065:                   from bb import build
ERROR: Error in executing:
/home/lvcargnini/puc/instramed/openembedded/org.openembedded.dev/packages/g=
libc/glibc_2.5.bb
ERROR: Exception:exceptions.ValueError Message:need more than 1 value to
unpack
ERROR: Printing the environment of the function
ERROR: Error in executing:
/home/lvcargnini/puc/instramed/openembedded/org.openembedded.dev/packages/g=
libc/glibc_2.5.bb
ERROR: Exception:exceptions.ValueError Message:need more than 1 value to
unpack
ERROR: Printing the environment of the function
ERROR: Error in executing:
/home/lvcargnini/puc/instramed/openembedded/org.openembedded.dev/packages/g=
libc/glibc_2.5.bb
ERROR: Exception:exceptions.ValueError Message:need more than 1 value to
unpack
ERROR: Printing the environment of the function
Traceback (most recent call last):
  File "/usr/bin/bitbake", line 1162, in ?
    main()
  File "/usr/bin/bitbake", line 1157, in main
    cooker.cook( BBConfiguration( options ), args[1:] )
  File "/usr/bin/bitbake", line 973, in cook
    if self.buildProvider( k , False ) =3D=3D 0:
  File "/usr/bin/bitbake", line 608, in buildProvider
    if self.tryBuild(fn, item, buildAllDeps, build_depends + [fn]):
  File "/usr/bin/bitbake", line 308, in tryBuild
    if self.buildProvider( dependency , buildAllDeps , build_depends ) =3D=
=3D 0:
  File "/usr/bin/bitbake", line 608, in buildProvider
    if self.tryBuild(fn, item, buildAllDeps, build_depends + [fn]):
  File "/usr/bin/bitbake", line 328, in tryBuild
    return self.tryBuildPackage( fn, item, the_data )
  File "/usr/bin/bitbake", line 234, in tryBuildPackage
    bb.build.exec_task('do_%s' % self.configuration.cmd, the_data)
  File "/usr/lib/python2.4/site-packages/bb/build.py", line 288, in
exec_task
    task_graph.walkdown(task, execute)
  File "/usr/lib/python2.4/site-packages/bb/__init__.py", line 1191, in
walkdown
    ret =3D self.walkdown(p, callback, debug, usecache)
  File "/usr/lib/python2.4/site-packages/bb/__init__.py", line 1191, in
walkdown
    ret =3D self.walkdown(p, callback, debug, usecache)
  File "/usr/lib/python2.4/site-packages/bb/__init__.py", line 1191, in
walkdown
    ret =3D self.walkdown(p, callback, debug, usecache)
  File "/usr/lib/python2.4/site-packages/bb/__init__.py", line 1196, in
walkdown
    return callback(self, item)
  File "/usr/lib/python2.4/site-packages/bb/build.py", line 267, in execute
    exec_task(item, d)
  File "/usr/lib/python2.4/site-packages/bb/build.py", line 288, in
exec_task
    task_graph.walkdown(task, execute)
  File "/usr/lib/python2.4/site-packages/bb/__init__.py", line 1196, in
walkdown
    return callback(self, item)
  File "/usr/lib/python2.4/site-packages/bb/build.py", line 277, in execute
    exec_func(item, localdata)
  File "/usr/lib/python2.4/site-packages/bb/build.py", line 98, in exec_fun=
c
    exec_func_python(func, d)
  File "/usr/lib/python2.4/site-packages/bb/build.py", line 117, in
exec_func_python
    utils.better_exec(comp,g,tmp, bb.data.getVar('FILE',d,1))
  File "/usr/lib/python2.4/site-packages/bb/utils.py", line 142, in
better_exec
    exec code in context
  File "do_package", line 4, in ?
  File "do_package", line 2, in do_package
  File "/usr/lib/python2.4/site-packages/bb/build.py", line 98, in exec_fun=
c
    exec_func_python(func, d)
  File "/usr/lib/python2.4/site-packages/bb/build.py", line 117, in
exec_func_python
    utils.better_exec(comp,g,tmp, bb.data.getVar('FILE',d,1))
  File "/usr/lib/python2.4/site-packages/bb/utils.py", line 142, in
better_exec
    exec code in context
  File "package_tar_do_package", line 4, in ?
  File "package_tar_do_package", line 2, in package_tar_do_package
  File "/usr/lib/python2.4/site-packages/bb/build.py", line 98, in exec_fun=
c
    exec_func_python(func, d)
  File "/usr/lib/python2.4/site-packages/bb/build.py", line 117, in
exec_func_python
    utils.better_exec(comp,g,tmp, bb.data.getVar('FILE',d,1))
  File "/usr/lib/python2.4/site-packages/bb/utils.py", line 142, in
better_exec
    exec code in context
  File "package_do_package", line 5, in ?
  File "package_do_package", line 3, in package_do_package
  File "/usr/lib/python2.4/site-packages/bb/build.py", line 98, in exec_fun=
c
    exec_func_python(func, d)
  File "/usr/lib/python2.4/site-packages/bb/build.py", line 117, in
exec_func_python
    utils.better_exec(comp,g,tmp, bb.data.getVar('FILE',d,1))
  File "/usr/lib/python2.4/site-packages/bb/utils.py", line 142, in
better_exec
    exec code in context
  File "populate_packages", line 188, in ?
  File "populate_packages", line 5, in populate_packages
  File "/usr/lib/python2.4/site-packages/bb/build.py", line 98, in exec_fun=
c
    exec_func_python(func, d)
  File "/usr/lib/python2.4/site-packages/bb/build.py", line 117, in
exec_func_python
    utils.better_exec(comp,g,tmp, bb.data.getVar('FILE',d,1))
  File "/usr/lib/python2.4/site-packages/bb/utils.py", line 142, in
better_exec
    exec code in context
  File "package_do_split_gconvs", line 152, in ?
  File "package_do_split_gconvs", line 61, in package_do_split_gconvs
ValueError: need more than 1 value to unpack


--=20
---------------------------------------------------------------------------=
---
Thanks && Regards
Msc. Bsc. Lu=EDs Vit=F3rio Cargnini
IEEE Member
Electrical Engineer Faculty @ PUCRS
Ipiranga Avenue, 6681 =96 Building 30
P.O. Box: 90619-900 =96 Porto Alegre/RS
Phone: +55 51 3320 3500  extension: 7696
---------------------------------------------------------------------------=
------

