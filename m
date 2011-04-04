Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jan.paesmans@gmail.com>) id 1Q6ppD-00058T-81
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Apr 2011 21:52:35 +0200
Received: by wye20 with SMTP id 20so5396186wye.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Apr 2011 12:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:content-type:content-transfer-encoding;
	bh=mSug4JFUXdLQQDf00TFzm3BqSxn5UJnZyR8ZBRRSvTU=;
	b=V+hSVb+QC+uem0VoPGykDSRU02duErXiHAYjh8xAlE8g5quMc8B8Q2YdrY30cufGOy
	0VEESt9x4sTETwq0tqL2qpGP2reSM/TRc35+BNqITYloMN2VH7n2vspp/ASX17jMzGnr
	/63cwDVzavhXEgVPgnPvVcvtA5QWZnlO9bYto=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=nyrCh8eMk1xTQBecPe2r0QatMBxVQPNURA0sztQn5bWR3/ekEwsRoDkCUtgiRQt4tf
	bzHUGyhwql8NJVyAAfwHCRgRFkHLhMzvDxUF2Zrt95gQTKvXKrpYD+nL2XIiToEWla4n
	8e05K7rW0hW+xH3ypDwU3rw+KARTO3Jt+bhgk=
Received: by 10.216.142.85 with SMTP id h63mr2228389wej.84.1301946630272;
	Mon, 04 Apr 2011 12:50:30 -0700 (PDT)
Received: from [192.168.1.103] (42.55-240-81.adsl-dyn.isp.belgacom.be
	[81.240.55.42])
	by mx.google.com with ESMTPS id c54sm2418905wer.30.2011.04.04.12.50.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 04 Apr 2011 12:50:29 -0700 (PDT)
Message-ID: <4D9A2102.9040904@gmail.com>
Date: Mon, 04 Apr 2011 21:50:26 +0200
From: Jan Paesmans <jan.paesmans@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.15) Gecko/20110321 Thunderbird/3.1.9
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: qt-4.6.3
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
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
X-List-Received-Date: Mon, 04 Apr 2011 19:52:35 -0000
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit

Hi,

For some reason, my build of qt4-4.6.3 fails with undefined references
to libiconv (see below). This is indeed the case because qt-core is not
linked against it. More specifically, in src/corelib/codecs/codecs.pri
the -liconv is assigned to the variable LIBS_PRIVATE. This means that
libiconv is not part of the public interface of qt-core and that the
-liconv is only used when building static libraries, not dynamic ones.
However, the link flag, -Wl,--no-undefined, requires that there are no
undefined symbols when final linking. Manually removing the
-Wl,--no-undefined from the generated Makefile in src/corelib makes the
problem go away.
I suppose the real way to correct this in the bitbake file is overriding
the LDFLAGS, but is there some way to remove part of the LDFLAGS?

Regards,

Jan

Build Configuration:
BB_VERSION        = "1.12.0"
METADATA_BRANCH   = "master"
METADATA_REVISION = "9a888d1"
TARGET_ARCH       = "arm"
TARGET_OS         = "linux-uclibceabi"
MACHINE           = "ronetix-pm9263"
DISTRO            = "minimal-uclibc"
DISTRO_VERSION    = "dev-snapshot-20110404"
TARGET_FPU        = "soft"

arm-oe-linux-uclibceabi-g++ -march=armv5te -mtune=arm926ej-s
-mthumb-interwork -mno-thumb
--sysroot=/home/janp/src/openembedded/build/tmp/sysroots/armv5te-oe-linux-uclibceabi
-Wl,-rpath-link,/home/janp/src/openembedded/build/tmp/sysroots/armv5te-oe-linux-uclibceabi/usr/lib
-Wl,-O1 -Wl,--hash-style=gnu -Wl,--no-undefined
-Wl,-e,qt_core_boilerplate -shared -Wl,-Bsymbolic-functions
-Wl,--dynamic-list,/home/janp/src/openembedded/build/tmp/work/armv5te-oe-linux-uclibceabi/qt4-x11-free-4.6.3-r24.2/qt-everywhere-opensource-src-4.6.3/src/corelib/QtCore.dynlist
-Wl,-soname,libQtCore.so.4 -o libQtCore.so.4.6.3
.obj/release-shared/qabstractanimation.o
.obj/release-shared/qvariantanimation.o
.obj/release-shared/qpropertyanimation.o
.obj/release-shared/qanimationgroup.o
.obj/release-shared/qsequentialanimationgroup.o
.obj/release-shared/qparallelanimationgroup.o
.obj/release-shared/qpauseanimation.o .obj/release-shared/qatomic_arm.o
.obj/release-shared/qfuture.o .obj/release-shared/qfutureinterface.o
.obj/release-shared/qfuturesynchronizer.o
.obj/release-shared/qfuturewatcher.o .obj/release-shared/qrunnable.o
.obj/release-shared/qtconcurrentfilter.o
.obj/release-shared/qtconcurrentmap.o
.obj/release-shared/qtconcurrentresultstore.o
.obj/release-shared/qtconcurrentthreadengine.o
.obj/release-shared/qtconcurrentiteratekernel.o
.obj/release-shared/qtconcurrentexception.o
.obj/release-shared/qthreadpool.o .obj/release-shared/qglobal.o
.obj/release-shared/qlibraryinfo.o .obj/release-shared/qmalloc.o
.obj/release-shared/qnumeric.o .obj/release-shared/qatomic.o
.obj/release-shared/qmutex.o .obj/release-shared/qreadwritelock.o
.obj/release-shared/qmutexpool.o .obj/release-shared/qsemaphore.o
.obj/release-shared/qthread.o .obj/release-shared/qthreadstorage.o
.obj/release-shared/qmutex_unix.o .obj/release-shared/qthread_unix.o
.obj/release-shared/qwaitcondition_unix.o
.obj/release-shared/qbitarray.o .obj/release-shared/qbytearray.o
.obj/release-shared/qbytearraymatcher.o
.obj/release-shared/qcryptographichash.o .obj/release-shared/qdatetime.o
.obj/release-shared/qeasingcurve.o .obj/release-shared/qhash.o
.obj/release-shared/qline.o .obj/release-shared/qlinkedlist.o
.obj/release-shared/qlist.o .obj/release-shared/qlocale.o
.obj/release-shared/qpoint.o .obj/release-shared/qmap.o
.obj/release-shared/qmargins.o .obj/release-shared/qcontiguouscache.o
.obj/release-shared/qrect.o .obj/release-shared/qregexp.o
.obj/release-shared/qshareddata.o .obj/release-shared/qsharedpointer.o
.obj/release-shared/qsize.o .obj/release-shared/qstring.o
.obj/release-shared/qstringbuilder.o .obj/release-shared/qstringlist.o
.obj/release-shared/qtextboundaryfinder.o
.obj/release-shared/qtimeline.o .obj/release-shared/qvector.o
.obj/release-shared/qvsnprintf.o .obj/release-shared/harfbuzz-buffer.o
.obj/release-shared/harfbuzz-gdef.o .obj/release-shared/harfbuzz-gsub.o
.obj/release-shared/harfbuzz-gpos.o .obj/release-shared/harfbuzz-impl.o
.obj/release-shared/harfbuzz-open.o
.obj/release-shared/harfbuzz-stream.o
.obj/release-shared/harfbuzz-shaper-all.o
.obj/release-shared/qharfbuzz.o
.obj/release-shared/qabstractfileengine.o .obj/release-shared/qbuffer.o
.obj/release-shared/qdatastream.o .obj/release-shared/qdebug.o
.obj/release-shared/qdir.o .obj/release-shared/qdiriterator.o
.obj/release-shared/qfile.o .obj/release-shared/qfileinfo.o
.obj/release-shared/qiodevice.o
.obj/release-shared/qnoncontiguousbytedevice.o
.obj/release-shared/qprocess.o .obj/release-shared/qtextstream.o
.obj/release-shared/qtemporaryfile.o .obj/release-shared/qresource.o
.obj/release-shared/qresource_iterator.o .obj/release-shared/qurl.o
.obj/release-shared/qsettings.o .obj/release-shared/qfsfileengine.o
.obj/release-shared/qfsfileengine_iterator.o
.obj/release-shared/qfilesystemwatcher.o
.obj/release-shared/qfsfileengine_unix.o
.obj/release-shared/qfsfileengine_iterator_unix.o
.obj/release-shared/qprocess_unix.o
.obj/release-shared/qfilesystemwatcher_inotify.o
.obj/release-shared/qfilesystemwatcher_dnotify.o
.obj/release-shared/qpluginloader.o .obj/release-shared/qfactoryloader.o
.obj/release-shared/quuid.o .obj/release-shared/qlibrary.o
.obj/release-shared/qlibrary_unix.o
.obj/release-shared/qabstracteventdispatcher.o
.obj/release-shared/qabstractitemmodel.o
.obj/release-shared/qbasictimer.o .obj/release-shared/qeventloop.o
.obj/release-shared/qcoreapplication.o .obj/release-shared/qcoreevent.o
.obj/release-shared/qmetaobject.o .obj/release-shared/qmetatype.o
.obj/release-shared/qmimedata.o .obj/release-shared/qobject.o
.obj/release-shared/qobjectcleanuphandler.o
.obj/release-shared/qsignalmapper.o
.obj/release-shared/qsocketnotifier.o .obj/release-shared/qtimer.o
.obj/release-shared/qtranslator.o .obj/release-shared/qvariant.o
.obj/release-shared/qcoreglobaldata.o
.obj/release-shared/qsharedmemory.o
.obj/release-shared/qsystemsemaphore.o .obj/release-shared/qpointer.o
.obj/release-shared/qmath.o .obj/release-shared/qcore_unix.o
.obj/release-shared/qcrashhandler.o
.obj/release-shared/qsharedmemory_unix.o
.obj/release-shared/qsystemsemaphore_unix.o
.obj/release-shared/qeventdispatcher_glib.o
.obj/release-shared/qeventdispatcher_unix.o
.obj/release-shared/qisciicodec.o .obj/release-shared/qlatincodec.o
.obj/release-shared/qsimplecodec.o .obj/release-shared/qtextcodec.o
.obj/release-shared/qtsciicodec.o .obj/release-shared/qutfcodec.o
.obj/release-shared/qtextcodecplugin.o
.obj/release-shared/qfontlaocodec.o .obj/release-shared/qiconvcodec.o
.obj/release-shared/qstatemachine.o .obj/release-shared/qabstractstate.o
.obj/release-shared/qstate.o .obj/release-shared/qfinalstate.o
.obj/release-shared/qhistorystate.o
.obj/release-shared/qabstracttransition.o
.obj/release-shared/qsignaltransition.o
.obj/release-shared/qeventtransition.o .obj/release-shared/qxmlstream.o
.obj/release-shared/qxmlutils.o .obj/release-shared/moc_qfuturewatcher.o
.obj/release-shared/moc_qthreadpool.o
.obj/release-shared/moc_qnamespace.o .obj/release-shared/moc_qthread.o
.obj/release-shared/moc_qeasingcurve.o .obj/release-shared/moc_qlocale.o
.obj/release-shared/moc_qtimeline.o .obj/release-shared/moc_qfile.o
.obj/release-shared/moc_qiodevice.o
.obj/release-shared/moc_qnoncontiguousbytedevice_p.o
.obj/release-shared/moc_qtemporaryfile.o
.obj/release-shared/moc_qsettings.o
.obj/release-shared/moc_qfilesystemwatcher_p.o
.obj/release-shared/moc_qfilesystemwatcher_inotify_p.o
.obj/release-shared/moc_qfilesystemwatcher_dnotify_p.o
.obj/release-shared/moc_qpluginloader.o
.obj/release-shared/moc_qlibrary.o
.obj/release-shared/moc_qfactoryloader_p.o
.obj/release-shared/moc_qabstracteventdispatcher.o
.obj/release-shared/moc_qabstractitemmodel.o
.obj/release-shared/moc_qeventloop.o
.obj/release-shared/moc_qcoreapplication.o
.obj/release-shared/moc_qcoreevent.o .obj/release-shared/moc_qmimedata.o
.obj/release-shared/moc_qsocketnotifier.o
.obj/release-shared/moc_qtimer.o .obj/release-shared/moc_qtranslator.o
.obj/release-shared/moc_qobjectcleanuphandler.o
.obj/release-shared/moc_qsharedmemory.o
.obj/release-shared/moc_qeventdispatcher_glib_p.o
.obj/release-shared/moc_qeventdispatcher_unix_p.o
.obj/release-shared/moc_qtextcodecplugin.o
.obj/release-shared/moc_qabstractstate.o
.obj/release-shared/moc_qstate.o .obj/release-shared/moc_qfinalstate.o
.obj/release-shared/moc_qhistorystate.o
.obj/release-shared/moc_qabstracttransition.o
.obj/release-shared/moc_qsignaltransition.o
.obj/release-shared/moc_qeventtransition.o  
-L/home/janp/src/openembedded/build/tmp/sysroots/armv5te-oe-linux-uclibceabi/usr/lib
-L/home/janp/src/openembedded/build/tmp/work/armv5te-oe-linux-uclibceabi/qt4-x11-free-4.6.3-r24.2/qt-everywhere-opensource-src-4.6.3/lib
-Wl,-rpath-link,/home/janp/src/openembedded/build/tmp/work/armv5te-oe-linux-uclibceabi/qt4-x11-free-4.6.3-r24.2/qt-everywhere-opensource-src-4.6.3/lib
-lglib-2.0 -lpthread -lz -lm -ldl -pthread -lgthread-2.0 -lglib-2.0
-lintl -lrt
| .obj/release-shared/qiconvcodec.o: In function `setByteOrder':
|
/home/janp/src/openembedded/build/tmp/work/armv5te-oe-linux-uclibceabi/qt4-x11-free-4.6.3-r24.2/qt-everywhere-opensource-src-4.6.3/src/corelib/codecs/qiconvcodec.cpp:320:
undefined reference to `libiconv'
| .obj/release-shared/qiconvcodec.o: In function `~IconvState':
|
/home/janp/src/openembedded/build/tmp/work/armv5te-oe-linux-uclibceabi/qt4-x11-free-4.6.3-r24.2/qt-everywhere-opensource-src-4.6.3/src/corelib/codecs/qiconvcodec.cpp:145:
undefined reference to `libiconv_close'
| .obj/release-shared/qiconvcodec.o: In function
`QIconvCodec::createIconv_t(char const*, char const*)':
|
/home/janp/src/openembedded/build/tmp/work/armv5te-oe-linux-uclibceabi/qt4-x11-free-4.6.3-r24.2/qt-everywhere-opensource-src-4.6.3/src/corelib/codecs/qiconvcodec.cpp:470:
undefined reference to `libiconv_open'
|
/home/janp/src/openembedded/build/tmp/work/armv5te-oe-linux-uclibceabi/qt4-x11-free-4.6.3-r24.2/qt-everywhere-opensource-src-4.6.3/src/corelib/codecs/qiconvcodec.cpp:479:
undefined reference to `libiconv_open'
|
/home/janp/src/openembedded/build/tmp/work/armv5te-oe-linux-uclibceabi/qt4-x11-free-4.6.3-r24.2/qt-everywhere-opensource-src-4.6.3/src/corelib/codecs/qiconvcodec.cpp:520:
undefined reference to `libiconv_open'
|
/home/janp/src/openembedded/build/tmp/work/armv5te-oe-linux-uclibceabi/qt4-x11-free-4.6.3-r24.2/qt-everywhere-opensource-src-4.6.3/src/corelib/codecs/qiconvcodec.cpp:527:
undefined reference to `libiconv_open'
|
/home/janp/src/openembedded/build/tmp/work/armv5te-oe-linux-uclibceabi/qt4-x11-free-4.6.3-r24.2/qt-everywhere-opensource-src-4.6.3/src/corelib/codecs/qiconvcodec.cpp:532:
undefined reference to `libiconv_open'
|
.obj/release-shared/qiconvcodec.o:/home/janp/src/openembedded/build/tmp/work/armv5te-oe-linux-uclibceabi/qt4-x11-free-4.6.3-r24.2/qt-everywhere-opensource-src-4.6.3/src/corelib/codecs/qiconvcodec.cpp:537:
more undefined references to `libiconv_open' follow
| .obj/release-shared/qiconvcodec.o: In function
`QIconvCodec::convertFromUnicode(QChar const*, int,
QTextCodec::ConverterState*) const':
|
/home/janp/src/openembedded/build/tmp/work/armv5te-oe-linux-uclibceabi/qt4-x11-free-4.6.3-r24.2/qt-everywhere-opensource-src-4.6.3/src/corelib/codecs/qiconvcodec.cpp:358:
undefined reference to `libiconv_close'
|
/home/janp/src/openembedded/build/tmp/work/armv5te-oe-linux-uclibceabi/qt4-x11-free-4.6.3-r24.2/qt-everywhere-opensource-src-4.6.3/src/corelib/codecs/qiconvcodec.cpp:398:
undefined reference to `libiconv'
|
/home/janp/src/openembedded/build/tmp/work/armv5te-oe-linux-uclibceabi/qt4-x11-free-4.6.3-r24.2/qt-everywhere-opensource-src-4.6.3/src/corelib/codecs/qiconvcodec.cpp:431:
undefined reference to `libiconv'
|
/home/janp/src/openembedded/build/tmp/work/armv5te-oe-linux-uclibceabi/qt4-x11-free-4.6.3-r24.2/qt-everywhere-opensource-src-4.6.3/src/corelib/codecs/qiconvcodec.cpp:440:
undefined reference to `libiconv'
| .obj/release-shared/qiconvcodec.o: In function
`QIconvCodec::convertToUnicode(char const*, int,
QTextCodec::ConverterState*) const':
|
/home/janp/src/openembedded/build/tmp/work/armv5te-oe-linux-uclibceabi/qt4-x11-free-4.6.3-r24.2/qt-everywhere-opensource-src-4.6.3/src/corelib/codecs/qiconvcodec.cpp:245:
undefined reference to `libiconv'
|
/home/janp/src/openembedded/build/tmp/work/armv5te-oe-linux-uclibceabi/qt4-x11-free-4.6.3-r24.2/qt-everywhere-opensource-src-4.6.3/src/corelib/codecs/qiconvcodec.cpp:280:
undefined reference to `libiconv'
|
.obj/release-shared/qiconvcodec.o:/home/janp/src/openembedded/build/tmp/work/armv5te-oe-linux-uclibceabi/qt4-x11-free-4.6.3-r24.2/qt-everywhere-opensource-src-4.6.3/src/corelib/codecs/qiconvcodec.cpp:294:
more undefined references to `libiconv' follow
| collect2: ld returned 1 exit status
| make[1]: *** [../../lib/libQtCore.so.4.6.3] Error 1
| make[1]: Leaving directory
`/home/janp/src/openembedded/build/tmp/work/armv5te-oe-linux-uclibceabi/qt4-x11-free-4.6.3-r24.2/qt-everywhere-opensource-src-4.6.3/src/corelib'
| make: *** [sub-corelib-make_default-ordered] Error 2
| + die 'oe_runmake failed'
| + oefatal 'oe_runmake failed'
| + echo FATAL: 'oe_runmake failed'
| FATAL: oe_runmake failed
| + exit 1
NOTE: package qt4-x11-free-4.6.3-r24.2: task do_compile: Failed



