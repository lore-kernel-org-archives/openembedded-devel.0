Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f44.google.com (mail-pg0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id 2E8216079F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Jan 2018 15:35:20 +0000 (UTC)
Received: by mail-pg0-f44.google.com with SMTP id 136so9121223pgd.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Jan 2018 07:35:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=1RE5gukENqS8b5y1g6zEhkpRnFY9bxU1vXZgn5X/wOI=;
	b=cO1/fBKiCD72xQcq+gnEiY6Gu/tHajOhl2VJUqPc5tllc8bbDE8fWl/yagTYexA7jY
	xN6FNIZi3+gpMD/R1vmdhIW+W0mV6vxmlv7Wedd0ncMEWEK/9XBA3T3blShUT/ueNzGr
	w9/x0VHy1jY8RFkD3PWuMmiZxlF/wMfg3UydTHt5Z9WGoFJ+fUFRb79YDvZj4PUGzGwo
	tedmB5gw4uvJDvSN9Qw/PUs7D8h29+L6jGZKIWxzbu0eQEvib61Ew5IktNhNfoz42pOm
	FyrIL+VW0Fa3prasmrp/oJCWZkUwLEv7jqAzv0Ik4D0Zit4SW+MFewdFiTiorPbo+GFA
	Bpvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=1RE5gukENqS8b5y1g6zEhkpRnFY9bxU1vXZgn5X/wOI=;
	b=hKZWzZeFx2j+jO4WLAaJCEQldTI03reoXzXpZ7wW1U6870OOwapF2GphYlxPvhbv6R
	3/YEWHIW4BQx+qQgdkoqOxQ6iUjnsyblSw4TWK4rh/Kunay3UO3G2iXm06F2SFeVNBl3
	wo9DR0dv90J/I3y7e3Dj173cMdqve9YPcpDh4wupjN8KCTGVPN1VSHSXmE71nUlk6JmY
	EmHujlra/wDR9PH+zriUky4zUFHm1iCcVAPOYtuKLg3XbCGLas7g4x5HRojNEzVmPcSx
	qi7Ielm535wVCSXnjz/ArdLtlE9Hh/89EAN8VB4mkk2kCGXEOjIN1UNg1kVURsslBkn+
	reWA==
X-Gm-Message-State: AKGB3mI5JOV+XbEi4V2b/oM/yYM5aC/TIwQ6wpFNW05NWOenYD0MeaM6
	3pBUYXrtTvpv+S8H8Gmnw78=
X-Google-Smtp-Source: ACJfBouri2tdW2XR1oBSn4v/vZWqRWKCTTWqLjw5Ln9nioZ4P0aSb6kuANxbd28gFE6bzujus5M9gg==
X-Received: by 10.99.175.9 with SMTP id w9mr30663551pge.214.1516116922352;
	Tue, 16 Jan 2018 07:35:22 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1184:94e2:24fc:6a2d:d1a9?
	([2601:202:4000:1184:94e2:24fc:6a2d:d1a9])
	by smtp.gmail.com with ESMTPSA id
	n76sm4536618pfh.95.2018.01.16.07.35.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 Jan 2018 07:35:21 -0800 (PST)
To: Yi Zhao <yi.zhao@windriver.com>,
	openembedded-devel@lists.openembedded.org, martin.jansa@gmail.com
References: <20171117121202.24422-1-alexander.kanavin@linux.intel.com>
	<ab2d7e38-d1bb-0ccd-608e-6c321a8913b7@windriver.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <86f3adc2-3553-0bbe-9374-52f3cf8977a1@gmail.com>
Date: Tue, 16 Jan 2018 07:35:20 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <ab2d7e38-d1bb-0ccd-608e-6c321a8913b7@windriver.com>
Subject: Re: [PATCH] meson: remove recipe and class
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
X-List-Received-Date: Tue, 16 Jan 2018 15:35:21 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 01/15/2018 11:40 PM, Yi Zhao wrote:
> Hi Martin & Armin,
>
> Would you please merge this patch ? Currently the meson recipe and
> class had been merged to oe-core. But due to the higher priority of
> meta-oe layer, the lower version meson in meta-oe would be built which
> cause json-glib build failed.
Wiil do.

- armin
>
>
> Thanks,
>
> Yi
>
>
>
> 在 2017年11月17日 20:12, Alexander Kanavin 写道:
>> They have been moved to oe-core layer, as meson is increasingly
>> the primary build system for many projects, particularly in the
>> Gnome stack.
>>
>> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
>> ---
>>   meta-oe/classes/meson.bbclass                      | 106
>> ---------------------
>>   .../meson/meson/native_bindir.patch                |  71
>> --------------
>>   meta-oe/recipes-devtools/meson/meson_0.40.1.bb     |  20 ----
>>   3 files changed, 197 deletions(-)
>>   delete mode 100644 meta-oe/classes/meson.bbclass
>>   delete mode 100644
>> meta-oe/recipes-devtools/meson/meson/native_bindir.patch
>>   delete mode 100644 meta-oe/recipes-devtools/meson/meson_0.40.1.bb
>>
>> diff --git a/meta-oe/classes/meson.bbclass
>> b/meta-oe/classes/meson.bbclass
>> deleted file mode 100644
>> index a09bc240d..000000000
>> --- a/meta-oe/classes/meson.bbclass
>> +++ /dev/null
>> @@ -1,106 +0,0 @@
>> -inherit python3native
>> -
>> -DEPENDS_append = " meson-native ninja-native"
>> -
>> -# As Meson enforces out-of-tree builds we can just use cleandirs
>> -B = "${WORKDIR}/build"
>> -do_configure[cleandirs] = "${B}"
>> -
>> -# Where the meson.build build configuration is
>> -MESON_SOURCEPATH = "${S}"
>> -
>> -# These variables in the environment override the *native* tools,
>> not the cross.
>> -export CPPFLAGS = "${BUILD_CPPFLAGS}"
>> -export CC = "${BUILD_CC}"
>> -export CFLAGS = "${BUILD_CFLAGS}"
>> -export CXX = "${BUILD_CXX}"
>> -export CXXFLAGS = "${BUILD_CXXFLAGS}"
>> -export LD = "${BUILD_LD}"
>> -export LDFLAGS = "${BUILD_LDFLAGS}"
>> -export AR = "${BUILD_AR}"
>> -export PKG_CONFIG = "pkg-config-native"
>> -
>> -def noprefix(var, d):
>> -    return d.getVar(var, True).replace(d.getVar('prefix', True) +
>> '/', '', 1)
>> -
>> -MESONOPTS = " --prefix ${prefix} \
>> -              --bindir ${@noprefix('bindir', d)} \
>> -              --sbindir ${@noprefix('sbindir', d)} \
>> -              --datadir ${@noprefix('datadir', d)} \
>> -              --libdir ${@noprefix('libdir', d)} \
>> -              --libexecdir ${@noprefix('libexecdir', d)} \
>> -              --includedir ${@noprefix('includedir', d)} \
>> -              --mandir ${@noprefix('mandir', d)} \
>> -              --infodir ${@noprefix('infodir', d)} \
>> -              --sysconfdir ${sysconfdir} \
>> -              --localstatedir ${localstatedir} \
>> -              --sharedstatedir ${sharedstatedir}"
>> -
>> -MESON_C_ARGS = "${TARGET_CC_ARCH}${TOOLCHAIN_OPTIONS}"
>> -MESON_LINK_ARGS = "${MESON_C_ARGS} ${LDFLAGS}"
>> -
>> -MESON_HOST_ENDIAN = "${@bb.utils.contains('SITEINFO_ENDIANNESS',
>> 'be', 'big', 'little', d)}"
>> -MESON_TARGET_ENDIAN = "${@bb.utils.contains('TUNE_FEATURES',
>> 'bigendian', 'big', 'little', d)}"
>> -
>> -EXTRA_OEMESON += "${PACKAGECONFIG_CONFARGS}"
>> -
>> -MESON_CROSS_FILE = ""
>> -MESON_CROSS_FILE_class-target = "--cross-file ${WORKDIR}/meson.cross"
>> -
>> -def meson_array(var, d):
>> -    return "', '".join(d.getVar(var, True).split()).join(("'", "'"))
>> -
>> -addtask write_config before do_configure
>> -do_write_config[vardeps] += "MESON_C_ARGS TOOLCHAIN_OPTIONS"
>> -do_write_config() {
>> -    # This needs to be Py to split the args into single-element lists
>> -    cat >${WORKDIR}/meson.cross <<EOF
>> -[binaries]
>> -c = '${HOST_PREFIX}gcc'
>> -cpp = '${HOST_PREFIX}g++'
>> -ar = '${HOST_PREFIX}ar'
>> -ld = '${HOST_PREFIX}ld'
>> -strip = '${HOST_PREFIX}strip'
>> -readelf = '${HOST_PREFIX}readelf'
>> -pkgconfig = 'pkg-config'
>> -
>> -[properties]
>> -needs_exe_wrapper = true
>> -c_args = [${@meson_array('MESON_C_ARGS', d)}]
>> -c_link_args = [${@meson_array('MESON_LINK_ARGS', d)}]
>> -cpp_args = [${@meson_array('MESON_C_ARGS', d)}]
>> -cpp_link_args = [${@meson_array('MESON_LINK_ARGS', d)}]
>> -
>> -[host_machine]
>> -system = '${HOST_OS}'
>> -cpu_family = '${HOST_ARCH}'
>> -cpu = '${HOST_ARCH}'
>> -endian = '${MESON_HOST_ENDIAN}'
>> -
>> -[target_machine]
>> -system = '${TARGET_OS}'
>> -cpu_family = '${TARGET_ARCH}'
>> -cpu = '${TARGET_ARCH}'
>> -endian = '${MESON_TARGET_ENDIAN}'
>> -EOF
>> -}
>> -
>> -CONFIGURE_FILES = "meson.build"
>> -
>> -meson_do_configure() {
>> -    if ! meson ${MESONOPTS} "${MESON_SOURCEPATH}" "${B}"
>> ${MESON_CROSS_FILE} ${EXTRA_OEMESON}; then
>> -        cat ${B}/meson-logs/meson-log.txt
>> -        bbfatal_log meson failed
>> -    fi
>> -}
>> -
>> -do_compile[progress] = "outof:^\[(\d+)/(\d+)\]\s+"
>> -meson_do_compile() {
>> -    ninja ${PARALLEL_MAKE}
>> -}
>> -
>> -meson_do_install() {
>> -    DESTDIR='${D}' ninja ${PARALLEL_MAKEINST} install
>> -}
>> -
>> -EXPORT_FUNCTIONS do_configure do_compile do_install
>> diff --git a/meta-oe/recipes-devtools/meson/meson/native_bindir.patch
>> b/meta-oe/recipes-devtools/meson/meson/native_bindir.patch
>> deleted file mode 100644
>> index 993e9750e..000000000
>> --- a/meta-oe/recipes-devtools/meson/meson/native_bindir.patch
>> +++ /dev/null
>> @@ -1,71 +0,0 @@
>> -There are some discussions upstream to merge this patch, but I
>> presonaly believe
>> -that is is OE only.
>> https://github.com/mesonbuild/meson/issues/1849#issuecomment-303730323
>> -
>> -Upstream-Status: Inappropriate [OE specific]
>> -Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
>> -diff --git a/mesonbuild/dependencies.py b/mesonbuild/dependencies.py
>> -index 04a22f985941..3e33bc4a79e7 100644
>> ---- a/mesonbuild/dependencies.py
>> -+++ b/mesonbuild/dependencies.py
>> -@@ -95,7 +95,7 @@ class Dependency:
>> -     def need_threads(self):
>> -         return False
>> -
>> --    def get_pkgconfig_variable(self, variable_name):
>> -+    def get_pkgconfig_variable(self, variable_name, use_native=False):
>> -         raise MesonException('Tried to get a pkg-config variable
>> from a non-pkgconfig dependency.')
>> -
>> - class InternalDependency(Dependency):
>> -@@ -224,8 +224,12 @@ class PkgConfigDependency(Dependency):
>> -         return s.format(self.__class__.__name__, self.name,
>> self.is_found,
>> -                         self.version_reqs)
>> -
>> --    def _call_pkgbin(self, args):
>> --        p, out = Popen_safe([self.pkgbin] + args, env=os.environ)[0:2]
>> -+    def _call_pkgbin(self, args, use_native=False):
>> -+        if use_native:
>> -+            pkgbin = [self.pkgbin + "-native"]
>> -+        else:
>> -+            pkgbin = [self.pkgbin]
>> -+        p, out = Popen_safe(pkgbin + args, env=os.environ)[0:2]
>> -         return p.returncode, out.strip()
>> -
>> -     def _set_cargs(self):
>> -@@ -259,8 +263,8 @@ class PkgConfigDependency(Dependency):
>> -                 self.is_libtool = True
>> -             self.libs.append(lib)
>> -
>> --    def get_pkgconfig_variable(self, variable_name):
>> --        ret, out = self._call_pkgbin(['--variable=' +
>> variable_name, self.name])
>> -+    def get_pkgconfig_variable(self, variable_name, use_native=False):
>> -+        ret, out = self._call_pkgbin(['--variable=' +
>> variable_name, self.name], use_native=use_native)
>> -         variable = ''
>> -         if ret != 0:
>> -             if self.required:
>> -@@ -1091,7 +1095,7 @@ class QtBaseDependency(Dependency):
>> -         self.bindir = self.get_pkgconfig_host_bins(core)
>> -         if not self.bindir:
>> -             # If exec_prefix is not defined, the pkg-config file is
>> broken
>> --            prefix = core.get_pkgconfig_variable('exec_prefix')
>> -+            prefix = core.get_pkgconfig_variable('exec_prefix',
>> use_native=True)
>> -             if prefix:
>> -                 self.bindir = os.path.join(prefix, 'bin')
>> -
>> -@@ -1202,7 +1206,7 @@ class Qt5Dependency(QtBaseDependency):
>> -         QtBaseDependency.__init__(self, 'qt5', env, kwargs)
>> -
>> -     def get_pkgconfig_host_bins(self, core):
>> --        return core.get_pkgconfig_variable('host_bins')
>> -+        return core.get_pkgconfig_variable('host_bins',
>> use_native=True)
>> -
>> - class Qt4Dependency(QtBaseDependency):
>> -     def __init__(self, env, kwargs):
>> -@@ -1216,7 +1220,7 @@ class Qt4Dependency(QtBaseDependency):
>> -         applications = ['moc', 'uic', 'rcc', 'lupdate', 'lrelease']
>> -         for application in applications:
>> -             try:
>> --                return
>> os.path.dirname(core.get_pkgconfig_variable('%s_location' %
>> application))
>> -+                return
>> os.path.dirname(core.get_pkgconfig_variable('%s_location' %
>> application, use_native=True))
>> -             except MesonException:
>> -                 pass
>> -
>> diff --git a/meta-oe/recipes-devtools/meson/meson_0.40.1.bb
>> b/meta-oe/recipes-devtools/meson/meson_0.40.1.bb
>> deleted file mode 100644
>> index 14644ba9b..000000000
>> --- a/meta-oe/recipes-devtools/meson/meson_0.40.1.bb
>> +++ /dev/null
>> @@ -1,20 +0,0 @@
>> -HOMEPAGE = "http://mesonbuild.com"
>> -SUMMARY = "A high performance build system"
>> -
>> -LICENSE = "Apache-2.0"
>> -LIC_FILES_CHKSUM =
>> "file://COPYING;md5=3b83ef96387f14655fc854ddc3c6bd57"
>> -
>> -SRC_URI = " \
>> -    git://github.com/mesonbuild/meson.git \
>> -    file://native_bindir.patch \
>> -"
>> -
>> -SRCREV = "b25d3e4d3f2b4d37029a507cc089bdde643c6240"
>> -
>> -S = "${WORKDIR}/git"
>> -
>> -inherit setuptools3
>> -
>> -RDEPENDS_${PN} = "ninja python3-core python3-modules"
>> -
>> -BBCLASSEXTEND = "native"
>


