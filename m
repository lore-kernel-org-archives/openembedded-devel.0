Received: from li19-45.members.linode.com ([64.22.125.45] helo=wiki.koala.it)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koansoftware@gmail.com>) id 1QQybj-0003Sr-MN
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 May 2011 11:17:55 +0200
Received: from localhost (localhost [127.0.0.1])
	by wiki.koala.it (Postfix) with ESMTP id 399DB2C812
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 May 2011 09:13:43 +0000 (UTC)
Received: from wiki.koala.it ([127.0.0.1])
	by localhost (wiki.koala.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QE8J-yr0-wgu
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 May 2011 09:13:38 +0000 (UTC)
Received: from [192.168.0.5] (host56-7-static.30-87-b.business.telecomitalia.it
	[87.30.7.56]) by wiki.koala.it (Postfix) with ESMTPSA id 318652C7D2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 May 2011 09:13:38 +0000 (UTC)
Message-ID: <4DE36002.6060904@gmail.com>
Date: Mon, 30 May 2011 11:14:42 +0200
From: Marco Cavallini <koansoftware@gmail.com>
Organization: Marco Cavallini
User-Agent: Thunderbird 2.0.0.24 (X11/20101027)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4DE352E5.7090604@gmail.com> <1306744542.4106.31.camel@mattotaupa>
In-Reply-To: <1306744542.4106.31.camel@mattotaupa>
Subject: Re: Error building qt4e-base-image with angstrom-2010.x
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
X-List-Received-Date: Mon, 30 May 2011 09:17:56 -0000
Content-Type: multipart/mixed; boundary="------------050003050904060805020905"

--------------050003050904060805020905
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Paul Menzel ha scritto, Il 30/05/2011 10:35:
> Dear Marco,
> 
> 
> Am Montag, den 30.05.2011, 10:18 +0200 schrieb Marco Cavallini:
> 
>> I'm facing to a problem building qt4e-base-image with angstrom-2010.x on
>> a Debian lenny host, is it normal?
>> http://pastebin.com/6SnFSYs6
> 
> please always paste the logs into the message so that people do not need
> to open a browser, can comment inline and have everything in the archive
> too.

See attachment.


>> I suspect a Debian lenny issue with new OE stuff.
> 
> I would not think so, because the tool chain used for compiling is build
> extra (native/sysroot).
> 
>> Any hint would be appreciated.
> 
> Does it build with another distribution or tool chain? Did the build
> ever work for you?
> 

I built smoothly until March 2011, today I'm unable to build using
angstrom-2010.x nor kaeilos


TIA
--
Marco

d-emb-arm/qrc_WebKit.o .rcc/release-shared-emb-arm/qrc_WebKit.cpp
| In file included from ../../../../include/QtCore/qstring.h:1:0,
|                  from ../WebKit/qt/Api/qwebsettings.h:25,
|                  from ../WebKit/qt/Api/qwebpage.h:24,
|                  from ../WebKit/qt/Api/qwebpage.cpp:23:
| ../../../../include/QtCore/../../src/corelib/tools/qstring.h: At global scope:
| ../../../../include/QtCore/../../src/corelib/tools/qstring.h:187:17: note: the mangling of 'va_list' has changed in GCC 4.4
| In file included from ../../../../include/QtCore/qstring.h:1:0,
|                  from .moc/release-shared-emb-arm/../../../WebKit/qt/Api/qwebsettings.h:25,
|                  from .moc/release-shared-emb-arm/../../../WebKit/qt/Api/qwebpage.h:24,
|                  from .moc/release-shared-emb-arm/../../../WebKit/qt/Api/qwebinspector.h:24,
|                  from .moc/release-shared-emb-arm/moc_qwebinspector.cpp:10:
| ../../../../include/QtCore/../../src/corelib/tools/qstring.h:187:17: note: the mangling of 'va_list' has changed in GCC 4.4
| rm -f libQtWebKitE.so.4.7.3 libQtWebKitE.so libQtWebKitE.so.4 libQtWebKitE.so.4.7
| arm-angstrom-linux-gnueabi-g++ -march=armv5te -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/home/koan/devel/build/angstrom/tmp/sysroots/armv5te-angstrom-linux-gnueabi -Wl,-rpath-link,/home/koan/devel/build/angstrom/tmp/sysroots/armv5te-angstrom-linux-gnueabi/usr/lib -Wl,-O1 -Wl,--hash-style=gnu -Wl,--no-undefined -Wl,--gc-sections -Wl,--no-undefined -Wl,-rpath-link,/home/koan/devel/build/angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/qt4-embedded-4.7.3-r33.1/qt-everywhere-opensource-src-4.7.3/lib -Wl,-rpath-link,../JavaScriptCore/release -Wl,-rpath-link,/home/koan/devel/build/angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/qt4-embedded-4.7.3-r33.1/qt-everywhere-opensource-src-4.7.3/lib -shared -Wl,-Bsymbolic-functions -Wl,-soname,libQtWebKitE.so.4

...

| /home/koan/devel/build/angstrom/tmp/sysroots/x86_64-linux/usr/armv5te/lib/gcc/arm-angstrom-linux-gnueabi/4.5.3/../../../../arm-angstrom-linux-gnueabi/bin/ld: BFD (GNU Binutils) 2.20.1.20100303 internal error, aborting at /home/koan/devel/build/angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/binutils-cross-2.20.1-r14.4/binutils-2.20.1/bfd/merge.c line 876 in _bfd_merged_section_offset
|
| /home/koan/devel/build/angstrom/tmp/sysroots/x86_64-linux/usr/armv5te/lib/gcc/arm-angstrom-linux-gnueabi/4.5.3/../../../../arm-angstrom-linux-gnueabi/bin/ld: Please report this bug.
|
| collect2: ld returned 1 exit status
| make[1]: *** [../../../../lib/libQtWebKitE.so.4.7.3] Error 1
| make[1]: Leaving directory `/home/koan/devel/build/angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/qt4-embedded-4.7.3-r33.1/qt-everywhere-opensource-src-4.7.3/src/3rdparty/webkit/WebCore'
| make: *** [sub-webkit-make_default-ordered] Error 2
| FATAL: oe_runmake failed
| ERROR: Function do_compile failed
NOTE: package qt4-embedded-4.7.3-r33.1: task do_compile: Failed
ERROR: TaskFailed event exception, aborting
ERROR: Build of /home/koan/devel/openembedded/recipes/qt4/qt4-embedded_4.7.3.bb do_compile failed
ERROR: Task 400 (/home/koan/devel/openembedded/recipes/qt4/qt4-embedded_4.7.3.bb, do_compile) failed with 256
ERROR: '/home/koan/devel/openembedded/recipes/qt4/qt4-embedded_4.7.3.bb' failed
ERROR: '/home/koan/devel/openembedded/recipes/qt4/qt4-embedded_4.7.3.bb' failed

--------------050003050904060805020905--
