Return-Path: <robert_joslyn@selinc.com>
Received: from scamp.selinc.com (scamp.selinc.com [74.117.214.142])
	by mail.openembedded.org (Postfix) with ESMTP id 72C5577D7A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Apr 2017 16:45:20 +0000 (UTC)
Received: from pps.filterd (scamp.selinc.com [127.0.0.1])
	by scamp.selinc.com (8.16.0.17/8.16.0.17) with SMTP id v3EGWDet017303
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Apr 2017 09:45:22 -0700
Received: from edison.ad.selinc.com (edison.ad.selinc.com [10.100.0.15])
	by scamp.selinc.com with ESMTP id 29pwu1vm9d-1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Apr 2017 09:45:22 -0700
To: <openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
X-KeepSent: 950B2909:9FEAD04C-88258101:006C9468;
 type=4; name=$KeepSent
X-Mailer: Lotus Notes Release 8.5.3FP4 SHF39 May 13, 2013
Message-ID: <OF950B2909.9FEAD04C-ON88258101.006C9468-88258102.005C094F@selinc.com>
From: robert_joslyn@selinc.com
Date: Fri, 14 Apr 2017 09:45:17 -0700
X-MIMETrack: S/MIME Sign by Notes Client on Robert Joslyn/SEL(Release 8.5.3FP4
	SHF39|May 13, 2013) at 04/14/2017 09:45:17 AM,
	Serialize by Notes Client on Robert Joslyn/SEL(Release 8.5.3FP4
	SHF39|May 13, 2013) at 04/14/2017 09:45:17 AM,
	Serialize complete at 04/14/2017 09:45:17 AM,
	S/MIME Sign failed at 04/14/2017 09:45:17 AM: The cryptographic key was
	not found,
	Serialize by Router on Edison/SEL(Release 9.0.1FP3 HF515|April 25,
	2015) at 04/14/2017 09:45:22 AM,
	Serialize complete at 04/14/2017 09:45:22 AM
X-Proofpoint-Virus-Version: vendor=nai engine=5800 definitions=8498
	signatures=668452
Subject: virtualenv Problems when Updating mozjs
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Apr 2017 16:45:21 -0000
Content-Type: text/plain; charset="US-ASCII"

I'm attempting to write a recipe for mozjs 24.2.0, but I've run into some 
problems. I'm using the morty branch and building for qemux86-64. The 
recipe I'm using is just a simplified and lightly modified version of the 
mozjs 17.0.0 recipe presently in meta-oe:

SUMMARY = "SpiderMonkey is Mozilla's JavaScript engine written in C/C++"
LICENSE = "MPL-2.0"
LIC_FILES_CHKSUM = "
file://../../LICENSE;md5=815ca599c9df247a0c7f619bab123dad"

DEPENDS = "nspr zlib"

SRC_URI = "http://ftp.mozilla.org/pub/js/${BP}.tar.bz2"

SRC_URI[md5sum] = "5db79c10e049a2dc117a6e6a3bc78a8e"
SRC_URI[sha256sum] = 
"e62f3f331ddd90df1e238c09d61a505c516fe9fd8c5c95336611d191d18437d8"

S = "${WORKDIR}/${BP}/js/src"

inherit autotools pkgconfig perlnative pythonnative

# nspr's package-config is ignored so set libs manually
EXTRA_OECONF = " \
    --target=${TARGET_SYS} \
    --host=${BUILD_SYS} \
    --build=${BUILD_SYS} \
    --prefix=${prefix} \
    --libdir=${libdir} \
    --with-nspr-libs='-lplds4 -lplc4 -lnspr4' \
    --enable-threadsafe \
    --disable-static"

PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', 
'', d)}"
PACKAGECONFIG[x11] = "--with-x --x-includes=${STAGING_INCDIR} 
--x-libraries=${STAGING_LIBDIR},--without-x,virtual/libx11"

# mozjs requires autoreconf 2.13
do_configure() {
    ( cd ${S}
      gnu-configize --force
      mv config.guess config.sub build/autoconf )
    ${S}/configure ${EXTRA_OECONF}
}


I removed the patches and a few other things from the existing mozjs 
17.0.0 recipe just to simplify this since almost all of them need to be 
refreshed (the patches do not seem to have an impact on the build issues 
I'm seeing here). The abridged output from do_configure is:


| Using Python from environment variable $PYTHON
| Creating Python environment
| Traceback (most recent call last):
|   File 
"/home/robert/Documents/poky/build/tmp/work/core2-64-poky-linux/mozjs/24.2.0-r0/mozjs-24.2.0/js/src/python/virtualenv/virtualenv.py", 
line 2563, in <module>
|     main()
|   File 
"/home/robert/Documents/poky/build/tmp/work/core2-64-poky-linux/mozjs/24.2.0-r0/mozjs-24.2.0/js/src/python/virtualenv/virtualenv.py", 
line 964, in main
|     never_download=options.never_download)
|   File 
"/home/robert/Documents/poky/build/tmp/work/core2-64-poky-linux/mozjs/24.2.0-r0/mozjs-24.2.0/js/src/python/virtualenv/virtualenv.py", 
line 1065, in create_environment
|     site_packages=site_packages, clear=clear))
|   File 
"/home/robert/Documents/poky/build/tmp/work/core2-64-poky-linux/mozjs/24.2.0-r0/mozjs-24.2.0/js/src/python/virtualenv/virtualenv.py", 
line 1237, in install_python
|     fix_lib64(lib_dir)
|   File 
"/home/robert/Documents/poky/build/tmp/work/core2-64-poky-linux/mozjs/24.2.0-r0/mozjs-24.2.0/js/src/python/virtualenv/virtualenv.py", 
line 1625, in fix_lib64
|     if [p for p in distutils.sysconfig.get_config_vars().values()
|   File 
"/home/robert/Documents/poky/build/tmp/sysroots/x86_64-linux/usr/lib/python2.7/distutils/sysconfig.py", 
line 515, in get_config_vars
|     func()
|   File 
"/home/robert/Documents/poky/build/tmp/sysroots/x86_64-linux/usr/lib/python2.7/distutils/sysconfig.py", 
line 414, in _init_posix
|     raise DistutilsPlatformError(my_msg)
| distutils.errors.DistutilsPlatformError: invalid Python installation: 
unable to open 
/home/robert/Documents/poky/build/tmp/sysroots/qemux86-64/usr/lib/python2.7/config/Makefile 
(No such file or directory)
| Traceback (most recent call last):
|   File 
"/home/robert/Documents/poky/build/tmp/work/core2-64-poky-linux/mozjs/24.2.0-r0/mozjs-24.2.0/js/src/build/virtualenv/populate_virtualenv.py", 
line 384, in <module>
|     manager.ensure()
|   File 
"/home/robert/Documents/poky/build/tmp/work/core2-64-poky-linux/mozjs/24.2.0-r0/mozjs-24.2.0/js/src/build/virtualenv/populate_virtualenv.py", 
line 103, in ensure
|     return self.build()
|   File 
"/home/robert/Documents/poky/build/tmp/work/core2-64-poky-linux/mozjs/24.2.0-r0/mozjs-24.2.0/js/src/build/virtualenv/populate_virtualenv.py", 
line 315, in build
|     self.create()
|   File 
"/home/robert/Documents/poky/build/tmp/work/core2-64-poky-linux/mozjs/24.2.0-r0/mozjs-24.2.0/js/src/build/virtualenv/populate_virtualenv.py", 
line 122, in create
|     raise Exception('Error creating virtualenv.')
| Exception: Error creating virtualenv.


It looks like it is trying to find a version of python in the target 
sysroot, when I think it should be using the native sysroot. If I add 
python to DEPENDS, the error changes:


| Using Python from environment variable $PYTHON
| Creating Python environment
| New python executable in 
/home/robert/Documents/poky/build/tmp/work/core2-64-poky-linux/mozjs/24.2.0-r0/build/_virtualenv/bin/python
| ERROR: The executable 
/home/robert/Documents/poky/build/tmp/work/core2-64-poky-linux/mozjs/24.2.0-r0/build/_virtualenv/bin/python 
is not functioning
| ERROR: It thinks sys.prefix is u'/usr' (should be 
u'/home/robert/Documents/poky/build/tmp/work/core2-64-poky-linux/mozjs/24.2.0-r0/build/_virtualenv')
| ERROR: virtualenv is not compatible with this system or executable
| Traceback (most recent call last):
|   File 
"/home/robert/Documents/poky/build/tmp/work/core2-64-poky-linux/mozjs/24.2.0-r0/mozjs-24.2.0/js/src/build/virtualenv/populate_virtualenv.py", 
line 384, in <module>
|     manager.ensure()
|   File 
"/home/robert/Documents/poky/build/tmp/work/core2-64-poky-linux/mozjs/24.2.0-r0/mozjs-24.2.0/js/src/build/virtualenv/populate_virtualenv.py", 
line 103, in ensure
|     return self.build()
|   File 
"/home/robert/Documents/poky/build/tmp/work/core2-64-poky-linux/mozjs/24.2.0-r0/mozjs-24.2.0/js/src/build/virtualenv/populate_virtualenv.py", 
line 315, in build
|     self.create()
|   File 
"/home/robert/Documents/poky/build/tmp/work/core2-64-poky-linux/mozjs/24.2.0-r0/mozjs-24.2.0/js/src/build/virtualenv/populate_virtualenv.py", 
line 122, in create
|     raise Exception('Error creating virtualenv.')
| Exception: Error creating virtualenv.


My guess is that it's trying to use the target python when it should be 
using the native python when setting up the virtualenv. Any thoughts on 
what's going on here or how to fix this? I'm not very familiar with either 
mozjs or python, and the mozjs build system seems to be a bit over my 
head.

Thanks,

--
Robert Joslyn
Software Engineer, R&D - Automation
Schweitzer Engineering Laboratories
509-332-1890 ext. 3214

