Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <mcbeagle@gmx.de>) id 1KIcet-00014Q-2s
	for openembedded-devel@openembedded.org; Tue, 15 Jul 2008 07:01:03 +0200
Received: (qmail invoked by alias); 15 Jul 2008 05:00:26 -0000
Received: from dslb-084-061-005-085.pools.arcor-ip.net (EHLO sheik.priv.chaos)
	[84.61.5.85]
	by mail.gmx.net (mp025) with SMTP; 15 Jul 2008 07:00:26 +0200
X-Authenticated: #432297
X-Provags-ID: V01U2FsdGVkX1+HYXxiUSuHAa3BpDRpYzCGsUoOjHUDOXN6CB1oB0
	PLTBiOxo2GPz8f
From: Peter Klar <mcbeagle@gmx.de>
To: openembedded-devel@openembedded.org
Date: Tue, 15 Jul 2008 07:00:25 +0200
User-Agent: KMail/1.9.9
MIME-Version: 1.0
Message-Id: <200807150700.25195.mcbeagle@gmx.de>
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.42
Subject: qt-embedded-4.4 and bitbake-1.6.8
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 15 Jul 2008 05:01:03 -0000
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi,

first I have to admit that I use oe and bb for a few days only, so pls let 
me know if I missed some basics.

My goal is to compile qt-embedded-4.4 for the dreambox-7025 (mipsel).

Therefore I setup an oe environment within debian etch - or more precisly a 
dreambox developer environment which is mostly based on oe. The dreambox 
community provides a makefile which setups the environment and builds an 
image w/o any user input:
http://schwerkraft.elitedvb.net/plugins/scmcvs/cvsweb.php/~checkout~/Makefile-opendreambox?content-type=text%2Fplain;cvsroot=opendreambox

This environment does not provide the qt-embedded-4.4 package, so I got it 
from the openembedded git:
http://gitweb.openembedded.net/?p=org.openembedded.dev.git;a=tree;f=packages/qt4;hb=HEAD
I did the required steps to run bitbake manually and tried to build it which 
failed:

$> bitbake -c rebuild qt-embedded
NOTE: Using cache in '/home/dreambox/dreambox-7025/cache/oe-cache.dreambox'
NOTE: Handling BitBake files: - (4096/4096) [100 %]
NOTE: Parsing finished. 3908 cached, 0 parsed, 160 skipped, 28 masked.

NOTE: build 200807150100: started

OE Build Configuration:
BB_VERSION     = "1.6.8"
OE_REVISION    = "format_version "1"

new_manifest [0000000000000000000000000000000000000004]

old_revision [3bf15b642ccda5728a4a42fec49cefe5a7439ab4]"
TARGET_ARCH    = "mipsel"
TARGET_OS      = "linux"
MACHINE        = "dm7025"
DISTRO         = "opendreambox"
DISTRO_VERSION = "1.5.0"
TARGET_FPU     = "soft"

NOTE: package qt-embedded-4.4.0: started
NOTE: package qt-embedded-4.4.0-r4: task do_rebuild: started
NOTE: package qt-embedded-4.4.0-r4: task do_clean: started
NOTE: 
removing /home/dreambox/dreambox-7025/build/tmp/work/qt-embedded-4.4.0-r4
NOTE: 
removing /home/dreambox/dreambox-7025/build/tmp/stamps/qt-embedded-4.4.0-r4.*
NOTE: package qt-embedded-4.4.0-r4: task do_clean: completed
NOTE: package qt-embedded-4.4.0-r4: task do_fetch: started
NOTE: package qt-embedded-4.4.0-r4: task do_fetch: completed
NOTE: package qt-embedded-4.4.0-r4: task do_unpack: started
NOTE: 
Unpacking /home/dreambox/dreambox-7025/sources/qt-embedded-linux-opensource-src-4.4.0.tar.bz2 
to /home/dreambox/dreambox-7025/build/tmp/work/qt-embedded-4.4.0-r4/
NOTE: 
Unpacking /home/dreambox/dreambox-7025/openembedded/packages/qt4/qt-embedded-4.4.0/qconfig-oe.h 
to /home/dreambox/dreambox-7025/build/tmp/work/qt-embedded-4.4.0-r4/
NOTE: package qt-embedded-4.4.0-r4: task do_unpack: completed
NOTE: package qt-embedded-4.4.0-r4: task do_patch: started
NOTE: Applying patch '0001-cross-compile.patch'
NOTE: Applying patch '0003-no-tools.patch'
NOTE: Applying patch '0004-no-qmake.patch'
NOTE: Applying patch '0005-fix-mkspecs.patch'
NOTE: Applying patch 'build-tools.patch'
NOTE: Applying patch '0006-freetype-host-includes.patch'
NOTE: Applying patch '0007-openssl-host-includes.patch'
NOTE: package qt-embedded-4.4.0-r4: task do_patch: completed
NOTE: package qt-embedded-4.4.0-r4: task do_configure: started
NOTE: exceptions.AssertionError: while evaluating:
${@qt_endian(d)}
NOTE: exceptions.AssertionError: while evaluating:
${@qt_endian(d)}
NOTE: exceptions.AssertionError: while evaluating:
    cp ${WORKDIR}/qconfig-oe.h ${S}/src/corelib/global
    unset QMAKESPEC
    unset QTDIR
    ln -sf ${STAGING_BINDIR_NATIVE}/qmake2 bin/qmake
    ln -s linux-g++ mkspecs/${TARGET_OS}-oe-g++

    echo "[Paths]"                                 > $QT_CONF_PATH
    echo "Prefix=${prefix}"                       >> $QT_CONF_PATH
    echo "Documentation=${docdir}/${QT_DIR_NAME}" >> $QT_CONF_PATH
    echo "Headers=${includedir}/${QT_DIR_NAME}"   >> $QT_CONF_PATH
    echo "Libraries=${libdir}"                    >> $QT_CONF_PATH
    echo "Binaries=${bindir}"                     >> $QT_CONF_PATH
    echo "Plugins=${libdir}/${QT_DIR_NAME}/plugins" >> $QT_CONF_PATH
    echo "Data=${datadir}/${QT_DIR_NAME}"         >> $QT_CONF_PATH
    echo "Translations=${datadir}/${QT_DIR_NAME}/translations" >> 
$QT_CONF_PATH
    echo "Settings=${sysconfdir}/${QT_DIR_NAME}"  >> $QT_CONF_PATH
    echo "Examples=${bindir}/${QT_DIR_NAME}/examples" >> $QT_CONF_PATH
    echo "Demos=${bindir}/${QT_DIR_NAME}/demos"   >> $QT_CONF_PATH

    echo yes | ./configure -v \
            -prefix ${prefix} \
            -bindir ${bindir} \
            -libdir ${libdir} \
            -datadir ${datadir}/${QT_DIR_NAME} \
            -sysconfdir ${sysconfdir}/${QT_DIR_NAME} \
            -docdir ${docdir}/${QT_DIR_NAME} \
            -headerdir ${includedir}/${QT_DIR_NAME} \
            -plugindir ${libdir}/${QT_DIR_NAME}/plugins \
            -translationdir ${datadir}/${QT_DIR_NAME}/translations \
            -examplesdir ${bindir}/${QT_DIR_NAME}/examples \
            -demosdir ${bindir}/${QT_DIR_NAME}/demos \
            -platform ${TARGET_OS}-oe-g++ \
            -xplatform ${TARGET_OS}-oe-g++ \
            -embedded ${QT_ARCH} ${QT_ENDIAN} -fast \
            -crossarch ${QT_ARCH} \
            ${QT_CONFIG_FLAGS} -fast \
            -L${STAGING_LIBDIR} -I${STAGING_INCDIR} \
            -I${STAGING_INCDIR}/freetype2

ERROR: function do_configure failed
ERROR: see log 
in /home/dreambox/dreambox-7025/build/tmp/work/qt-embedded-4.4.0-r4/temp/log.do_configure.9253
NOTE: Task 
failed: /home/dreambox/dreambox-7025/build/tmp/work/qt-embedded-4.4.0-r4/temp/log.do_configure.9253
NOTE: package qt-embedded-4.4.0-r4: task do_configure: failed
ERROR: Error in 
executing: /home/dreambox/dreambox-7025/openembedded/packages/qt4/qt-embedded_4.4.0.bb
ERROR: Exception:bb.build.EventException Message:('Function failed in 
task: /home/dreambox/dreambox-7025/build/tmp/work/qt-embedded-4.4.0-r4/temp/log.do_configure.9253', 
<bb.build.TaskFailed instance at 0xb2911c6c>)
ERROR: Printing the environment of the function
ERROR: Error in 
executing: /home/dreambox/dreambox-7025/openembedded/packages/qt4/qt-embedded_4.4.0.bb
ERROR: Exception:bb.build.EventException Message:('Function failed in 
task: /home/dreambox/dreambox-7025/build/tmp/work/qt-embedded-4.4.0-r4/temp/log.do_configure.9253', 
<bb.build.TaskFailed instance at 0xb2911c6c>)
ERROR: Printing the environment of the function
ERROR: TaskFailed event exception, aborting
NOTE: package qt-embedded-4.4.0: failed
ERROR: Build of qt-embedded failed

$> cat [...]/log.do_configure.9253
[...]/run.do_configure.9253: line 587: do_configure: command not found

I'm not sure but I think this is caused by an older bitbake version, the 
dreambox environment supports only bitbake-1.6.8 and before, when using 
bitbake-1.8.x it fails on parsing the bitbake files:

$> bitbake dreambox-image
NOTE: Invalid cache found, rebuilding...
ERROR: Error in executing:
ERROR: Exception:exceptions.UnboundLocalError Message:local variable 'bb' 
referenced before assignment
ERROR: Printing the environment of the function
ERROR:  0001:def __anonfunc():
ERROR:  0002:   import exceptions
ERROR:  0003:   need_host = bb.data.getVar('COMPATIBLE_HOST', d, 1)
ERROR:  0004:   if need_host:
ERROR:  0005:           import re
ERROR:  0006:           this_host = bb.data.getVar('HOST_SYS', d, 1)
ERROR:  0007:           if not re.match(need_host, this_host):
ERROR: local variable 'bb' referenced before assignment while 
parsing /home/dreambox/dreambox-7025/openembedded/packages/gpe-bluetooth/gpe-bluetooth_0.52.bb
[...]

For me it looks like the dreambox setup uses bitbake metadata files which 
are incompatible to the latest bitbake versions while the qt-embedded 
package needs latest bitbake.

Can you confirm this and/or do you have some hints how to solve this 
problem?

Thanks & Regards
Peter


