Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4A6FC46CD2
	for <webhook@archiver.kernel.org>; Mon, 22 Jan 2024 22:04:43 +0000 (UTC)
Subject: Add python3-apscheduler #error
To: openembedded-devel@lists.openembedded.org
From: p35420102@gmail.com
X-Originating-Location: TW (125.229.195.25)
X-Originating-Platform: Windows Chrome 120
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sun, 21 Jan 2024 22:24:29 -0800
Message-ID: <HwKj.1705904669013507737.KXJd@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="5wvDmGdCzkHQeXYPoGXb"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Jan 2024 22:04:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108376

--5wvDmGdCzkHQeXYPoGXb
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

SUMMARY =3D "In-process task scheduler with Cron-like capabilities"
HOMEPAGE =3D "https://github.com/agronholm/apscheduler"

SECTION =3D "devel/python"

LICENSE =3D "MIT"
LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Df0e423eea5c91e7aa21bdb70184b=
3e53"

PYPI_PACKAGE =3D "APScheduler"

SRC_URI[sha256sum] =3D "e6df071b27d9be898e486bc7940a7be50b4af2e9da7c08f0744=
a96d4bd4cef4a"

RDEPENDS:${PN} +=3D "\
python3-six \
python3-pytz \
python3-tzlocal \
"

inherit pypi setuptools3

ERROR: python3-apscheduler-3.10.4-r0 do_compile: 'python3 setup.py bdist_wh=
eel ' execution failed.
ERROR: python3-apscheduler-3.10.4-r0 do_compile: ExecutionError('/home/iot-=
yocto/build/tmp/work/armv8a-poky-linux/python3-apscheduler/3.10.4-r0/temp/r=
un.do_compile.531694', 1, None, None)
ERROR: Logfile of failure stored in: /home/iot-yocto/build/tmp/work/armv8a-=
poky-linux/python3-apscheduler/3.10.4-r0/temp/log.do_compile.531694
Log data follows:
| DEBUG: Executing shell function do_compile
| /home/iot-yocto/build/tmp/work/armv8a-poky-linux/python3-apscheduler/3.10=
.4-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/setuptools/dis=
t.py:720: UserWarning: Usage of dash-separated 'upload-dir' will not be sup=
ported in future versions. Please use the underscore name 'upload_dir' inst=
ead
|=C2=A0 =C2=A0warnings.warn(
| /home/iot-yocto/build/tmp/work/armv8a-poky-linux/python3-apscheduler/3.10=
.4-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/setuptools/ins=
taller.py:27: SetuptoolsDeprecationWarning: setuptools.installer is depreca=
ted. Requirements should be satisfied by a PEP 517 installer.
|=C2=A0 =C2=A0warnings.warn(
| /home/iot-yocto/build/tmp/work/armv8a-poky-linux/python3-apscheduler/3.10=
.4-r0/recipe-sysroot-native/usr/bin/python3-native/python3: No module named=
 pip
| Traceback (most recent call last):
|=C2=A0 =C2=A0File "/home/iot-yocto/build/tmp/work/armv8a-poky-linux/python=
3-apscheduler/3.10.4-r0/recipe-sysroot-native/usr/lib/python3.10/site-packa=
ges/setuptools/installer.py", line 82, in fetch_build_egg
|=C2=A0 =C2=A0 =C2=A0subprocess.check_call(cmd)
|=C2=A0 =C2=A0File "/home/iot-yocto/build/tmp/work/armv8a-poky-linux/python=
3-apscheduler/3.10.4-r0/recipe-sysroot-native/usr/lib/python3.10/subprocess=
.py", line 369, in check_call
|=C2=A0 =C2=A0 =C2=A0raise CalledProcessError(retcode, cmd)
| subprocess.CalledProcessError: Command '['/home/iot-yocto/build/tmp/work/=
armv8a-poky-linux/python3-apscheduler/3.10.4-r0/recipe-sysroot-native/usr/b=
in/python3-native/python3', '-m', 'pip', '--disable-pip-version-check', 'wh=
eel', '--no-deps', '-w', '/tmp/tmpmh5cnujt', '--quiet', 'setuptools_scm']' =
returned non-zero exit status 1.
|
| The above exception was the direct cause of the following exception:
|
| Traceback (most recent call last):
|=C2=A0 =C2=A0File "/home/iot-yocto/build/tmp/work/armv8a-poky-linux/python=
3-apscheduler/3.10.4-r0/APScheduler-3.10.4/setup.py", line 10, in <module>
|=C2=A0 =C2=A0 =C2=A0setup(
|=C2=A0 =C2=A0File "/home/iot-yocto/build/tmp/work/armv8a-poky-linux/python=
3-apscheduler/3.10.4-r0/recipe-sysroot-native/usr/lib/python3.10/site-packa=
ges/setuptools/__init__.py", line 152, in setup
|=C2=A0 =C2=A0 =C2=A0_install_setup_requires(attrs)
|=C2=A0 =C2=A0File "/home/iot-yocto/build/tmp/work/armv8a-poky-linux/python=
3-apscheduler/3.10.4-r0/recipe-sysroot-native/usr/lib/python3.10/site-packa=
ges/setuptools/__init__.py", line 147, in _install_setup_requires
|=C2=A0 =C2=A0 =C2=A0dist.fetch_build_eggs(dist.setup_requires)
|=C2=A0 =C2=A0File "/home/iot-yocto/build/tmp/work/armv8a-poky-linux/python=
3-apscheduler/3.10.4-r0/recipe-sysroot-native/usr/lib/python3.10/site-packa=
ges/setuptools/dist.py", line 809, in fetch_build_eggs
|=C2=A0 =C2=A0 =C2=A0resolved_dists =3D pkg_resources.working_set.resolve(
|=C2=A0 =C2=A0File "/home/iot-yocto/build/tmp/work/armv8a-poky-linux/python=
3-apscheduler/3.10.4-r0/recipe-sysroot-native/usr/lib/python3.10/site-packa=
ges/pkg_resources/__init__.py", line 771, in resolve
|=C2=A0 =C2=A0 =C2=A0dist =3D best[req.key] =3D env.best_match(
|=C2=A0 =C2=A0File "/home/iot-yocto/build/tmp/work/armv8a-poky-linux/python=
3-apscheduler/3.10.4-r0/recipe-sysroot-native/usr/lib/python3.10/site-packa=
ges/pkg_resources/__init__.py", line 1056, in best_match
|=C2=A0 =C2=A0 =C2=A0return self.obtain(req, installer)
|=C2=A0 =C2=A0File "/home/iot-yocto/build/tmp/work/armv8a-poky-linux/python=
3-apscheduler/3.10.4-r0/recipe-sysroot-native/usr/lib/python3.10/site-packa=
ges/pkg_resources/__init__.py", line 1068, in obtain
|=C2=A0 =C2=A0 =C2=A0return installer(requirement)
|=C2=A0 =C2=A0File "/home/iot-yocto/build/tmp/work/armv8a-poky-linux/python=
3-apscheduler/3.10.4-r0/recipe-sysroot-native/usr/lib/python3.10/site-packa=
ges/setuptools/dist.py", line 880, in fetch_build_egg
|=C2=A0 =C2=A0 =C2=A0return fetch_build_egg(self, req)
|=C2=A0 =C2=A0File "/home/iot-yocto/build/tmp/work/armv8a-poky-linux/python=
3-apscheduler/3.10.4-r0/recipe-sysroot-native/usr/lib/python3.10/site-packa=
ges/setuptools/installer.py", line 84, in fetch_build_egg
|=C2=A0 =C2=A0 =C2=A0raise DistutilsError(str(e)) from e
| distutils.errors.DistutilsError: Command '['/home/iot-yocto/build/tmp/wor=
k/armv8a-poky-linux/python3-apscheduler/3.10.4-r0/recipe-sysroot-native/usr=
/bin/python3-native/python3', '-m', 'pip', '--disable-pip-version-check', '=
wheel', '--no-deps', '-w', '/tmp/tmpmh5cnujt', '--quiet', 'setuptools_scm']=
' returned non-zero exit status 1.
| ERROR: 'python3 setup.py bdist_wheel ' execution failed.
| WARNING: exit code 1 from a shell command.
ERROR: Task (/home/iot-yocto/src/poky/../meta-openembedded/meta-python/reci=
pes-devtools/python/python3-apscheduler_3.10.4.bb:do_compile) failed with e=
xit code '1'
NOTE: Tasks Summary: Attempted 7610 tasks of which 7603 didn't need to be r=
erun and 1 failed.

Summary: 1 task failed:
/home/iot-yocto/src/poky/../meta-openembedded/meta-python/recipes-devtools/=
python/python3-apscheduler_3.10.4.bb:do_compile
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.

--5wvDmGdCzkHQeXYPoGXb
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>SUMMARY =3D "In-process task scheduler with Cron-like capabilities"</d=
iv>
<div>HOMEPAGE =3D "https://github.com/agronholm/apscheduler"</div>
<div>&nbsp;</div>
<div>SECTION =3D "devel/python"</div>
<div>&nbsp;</div>
<div>LICENSE =3D "MIT"</div>
<div>LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Df0e423eea5c91e7aa21bdb7=
0184b3e53"</div>
<div>&nbsp;</div>
<div>PYPI_PACKAGE =3D "APScheduler"</div>
<div>&nbsp;</div>
<div>SRC_URI[sha256sum] =3D "e6df071b27d9be898e486bc7940a7be50b4af2e9da7c08=
f0744a96d4bd4cef4a"</div>
<div>&nbsp;</div>
<div>RDEPENDS:${PN} +=3D "\</div>
<div><span style=3D"white-space: normal;"><span style=3D"white-space: pre;"=
> </span>python3-six \</span></div>
<div><span style=3D"white-space: normal;"><span style=3D"white-space: pre;"=
> </span>python3-pytz \</span></div>
<div><span style=3D"white-space: normal;"><span style=3D"white-space: pre;"=
> </span>python3-tzlocal \</span></div>
<div><span style=3D"white-space: normal;"><span style=3D"white-space: pre;"=
> </span>"</span></div>
<div>&nbsp;</div>
<div>inherit pypi setuptools3<br /><br />
<div>ERROR: python3-apscheduler-3.10.4-r0 do_compile: 'python3 setup.py bdi=
st_wheel ' execution failed.</div>
<div>ERROR: python3-apscheduler-3.10.4-r0 do_compile: ExecutionError('/home=
/iot-yocto/build/tmp/work/armv8a-poky-linux/python3-apscheduler/3.10.4-r0/t=
emp/run.do_compile.531694', 1, None, None)</div>
<div>ERROR: Logfile of failure stored in: /home/iot-yocto/build/tmp/work/ar=
mv8a-poky-linux/python3-apscheduler/3.10.4-r0/temp/log.do_compile.531694</d=
iv>
<div>Log data follows:</div>
<div>| DEBUG: Executing shell function do_compile</div>
<div>| /home/iot-yocto/build/tmp/work/armv8a-poky-linux/python3-apscheduler=
/3.10.4-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/setuptool=
s/dist.py:720: UserWarning: Usage of dash-separated 'upload-dir' will not b=
e supported in future versions. Please use the underscore name 'upload_dir'=
 instead</div>
<div>|&nbsp; &nbsp;warnings.warn(</div>
<div>| /home/iot-yocto/build/tmp/work/armv8a-poky-linux/python3-apscheduler=
/3.10.4-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/setuptool=
s/installer.py:27: SetuptoolsDeprecationWarning: setuptools.installer is de=
precated. Requirements should be satisfied by a PEP 517 installer.</div>
<div>|&nbsp; &nbsp;warnings.warn(</div>
<div>| /home/iot-yocto/build/tmp/work/armv8a-poky-linux/python3-apscheduler=
/3.10.4-r0/recipe-sysroot-native/usr/bin/python3-native/python3: No module =
named pip</div>
<div>| Traceback (most recent call last):</div>
<div>|&nbsp; &nbsp;File "/home/iot-yocto/build/tmp/work/armv8a-poky-linux/p=
ython3-apscheduler/3.10.4-r0/recipe-sysroot-native/usr/lib/python3.10/site-=
packages/setuptools/installer.py", line 82, in fetch_build_egg</div>
<div>|&nbsp; &nbsp; &nbsp;subprocess.check_call(cmd)</div>
<div>|&nbsp; &nbsp;File "/home/iot-yocto/build/tmp/work/armv8a-poky-linux/p=
ython3-apscheduler/3.10.4-r0/recipe-sysroot-native/usr/lib/python3.10/subpr=
ocess.py", line 369, in check_call</div>
<div>|&nbsp; &nbsp; &nbsp;raise CalledProcessError(retcode, cmd)</div>
<div>| subprocess.CalledProcessError: Command '['/home/iot-yocto/build/tmp/=
work/armv8a-poky-linux/python3-apscheduler/3.10.4-r0/recipe-sysroot-native/=
usr/bin/python3-native/python3', '-m', 'pip', '--disable-pip-version-check'=
, 'wheel', '--no-deps', '-w', '/tmp/tmpmh5cnujt', '--quiet', 'setuptools_sc=
m']' returned non-zero exit status 1.</div>
<div>|&nbsp;</div>
<div>| The above exception was the direct cause of the following exception:=
</div>
<div>|&nbsp;</div>
<div>| Traceback (most recent call last):</div>
<div>|&nbsp; &nbsp;File "/home/iot-yocto/build/tmp/work/armv8a-poky-linux/p=
ython3-apscheduler/3.10.4-r0/APScheduler-3.10.4/setup.py", line 10, in &lt;=
module&gt;</div>
<div>|&nbsp; &nbsp; &nbsp;setup(</div>
<div>|&nbsp; &nbsp;File "/home/iot-yocto/build/tmp/work/armv8a-poky-linux/p=
ython3-apscheduler/3.10.4-r0/recipe-sysroot-native/usr/lib/python3.10/site-=
packages/setuptools/__init__.py", line 152, in setup</div>
<div>|&nbsp; &nbsp; &nbsp;_install_setup_requires(attrs)</div>
<div>|&nbsp; &nbsp;File "/home/iot-yocto/build/tmp/work/armv8a-poky-linux/p=
ython3-apscheduler/3.10.4-r0/recipe-sysroot-native/usr/lib/python3.10/site-=
packages/setuptools/__init__.py", line 147, in _install_setup_requires</div=
>
<div>|&nbsp; &nbsp; &nbsp;dist.fetch_build_eggs(dist.setup_requires)</div>
<div>|&nbsp; &nbsp;File "/home/iot-yocto/build/tmp/work/armv8a-poky-linux/p=
ython3-apscheduler/3.10.4-r0/recipe-sysroot-native/usr/lib/python3.10/site-=
packages/setuptools/dist.py", line 809, in fetch_build_eggs</div>
<div>|&nbsp; &nbsp; &nbsp;resolved_dists =3D pkg_resources.working_set.reso=
lve(</div>
<div>|&nbsp; &nbsp;File "/home/iot-yocto/build/tmp/work/armv8a-poky-linux/p=
ython3-apscheduler/3.10.4-r0/recipe-sysroot-native/usr/lib/python3.10/site-=
packages/pkg_resources/__init__.py", line 771, in resolve</div>
<div>|&nbsp; &nbsp; &nbsp;dist =3D best[req.key] =3D env.best_match(</div>
<div>|&nbsp; &nbsp;File "/home/iot-yocto/build/tmp/work/armv8a-poky-linux/p=
ython3-apscheduler/3.10.4-r0/recipe-sysroot-native/usr/lib/python3.10/site-=
packages/pkg_resources/__init__.py", line 1056, in best_match</div>
<div>|&nbsp; &nbsp; &nbsp;return self.obtain(req, installer)</div>
<div>|&nbsp; &nbsp;File "/home/iot-yocto/build/tmp/work/armv8a-poky-linux/p=
ython3-apscheduler/3.10.4-r0/recipe-sysroot-native/usr/lib/python3.10/site-=
packages/pkg_resources/__init__.py", line 1068, in obtain</div>
<div>|&nbsp; &nbsp; &nbsp;return installer(requirement)</div>
<div>|&nbsp; &nbsp;File "/home/iot-yocto/build/tmp/work/armv8a-poky-linux/p=
ython3-apscheduler/3.10.4-r0/recipe-sysroot-native/usr/lib/python3.10/site-=
packages/setuptools/dist.py", line 880, in fetch_build_egg</div>
<div>|&nbsp; &nbsp; &nbsp;return fetch_build_egg(self, req)</div>
<div>|&nbsp; &nbsp;File "/home/iot-yocto/build/tmp/work/armv8a-poky-linux/p=
ython3-apscheduler/3.10.4-r0/recipe-sysroot-native/usr/lib/python3.10/site-=
packages/setuptools/installer.py", line 84, in fetch_build_egg</div>
<div>|&nbsp; &nbsp; &nbsp;raise DistutilsError(str(e)) from e</div>
<div>| distutils.errors.DistutilsError: Command '['/home/iot-yocto/build/tm=
p/work/armv8a-poky-linux/python3-apscheduler/3.10.4-r0/recipe-sysroot-nativ=
e/usr/bin/python3-native/python3', '-m', 'pip', '--disable-pip-version-chec=
k', 'wheel', '--no-deps', '-w', '/tmp/tmpmh5cnujt', '--quiet', 'setuptools_=
scm']' returned non-zero exit status 1.</div>
<div>| ERROR: 'python3 setup.py bdist_wheel ' execution failed.</div>
<div>| WARNING: exit code 1 from a shell command.</div>
<div>ERROR: Task (/home/iot-yocto/src/poky/../meta-openembedded/meta-python=
/recipes-devtools/python/python3-apscheduler_3.10.4.bb:do_compile) failed w=
ith exit code '1'</div>
<div>NOTE: Tasks Summary: Attempted 7610 tasks of which 7603 didn't need to=
 be rerun and 1 failed.</div>
<div>&nbsp;</div>
<div>Summary: 1 task failed:</div>
<div>&nbsp; /home/iot-yocto/src/poky/../meta-openembedded/meta-python/recip=
es-devtools/python/python3-apscheduler_3.10.4.bb:do_compile</div>
<div>Summary: There was 1 WARNING message.</div>
<div>Summary: There were 2 ERROR messages, returning a non-zero exit code.<=
/div>
</div>

--5wvDmGdCzkHQeXYPoGXb--

