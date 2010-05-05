Received: from mail-ew0-f225.google.com ([209.85.219.225])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <tasskjapp@gmail.com>) id 1O9Yss-0005sJ-CV
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 May 2010 09:19:15 +0200
Received: by ewy25 with SMTP id 25so1307274ewy.27
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 May 2010 00:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding;
	bh=mnvItsCBIOGWgkr9Pq5hYS7HTdpRUZqPxDR9q0DLrMI=;
	b=SOnJGMHaQRIucVk1VfiXjjegjK4dXKhjEgW60gG+oPhBwVFQhDzmucyCyNq9U45YdN
	U88TXHvTnZ0aPMeEZE+Qr3RbBfFR3iZMGdCW7wPmlJSNb6U/d5/o9rkdeqh7QJ1kFSiE
	uFomFzHia/OggggGxMS3zMDpiZL7vcRqzvF+Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=q+5dO8purM/FaE8dIKpK0DFwhWKNBJRgYilkX8ZPZHsCbF+bpye/w+ZZWZmhdLmxQz
	0RKXZbLoPpuXXBMCXQ4etx3mBGojo/8NDwJevtBCmdQSdpAXuM7O0fWMkhKWFsVcMtFh
	X+8LTB2aLAUU4d1cjcpHa3pF6JkePTbguTucc=
Received: by 10.213.67.207 with SMTP id s15mr2449543ebi.76.1273043718964;
	Wed, 05 May 2010 00:15:18 -0700 (PDT)
Received: from [192.168.0.49] (147.84-49-231.nextgentel.com [84.49.231.147])
	by mx.google.com with ESMTPS id 15sm4187615ewy.12.2010.05.05.00.15.17
	(version=SSLv3 cipher=RC4-MD5); Wed, 05 May 2010 00:15:18 -0700 (PDT)
Message-ID: <4BE11B74.7090901@gmail.com>
Date: Wed, 05 May 2010 09:17:08 +0200
From: Tasslehoff Kjappfot <tasskjapp@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.9pre) Gecko/20100217 Shredder/3.0.3pre
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <mailman.5784.1273038368.24517.openembedded-devel@lists.openembedded.org>
In-Reply-To: <mailman.5784.1273038368.24517.openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 209.85.219.225
X-SA-Exim-Mail-From: tasskjapp@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: python-pyqt compile error with latest org.openembedded.dev
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
X-List-Received-Date: Wed, 05 May 2010 07:19:16 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I was told on #oe that I should have been a bit more verbose in my 
previous mail, and I agree :-)

I'm compiling Angstrom for the Beagleboard with the latest 
org.openembedded.dev, and python-pyqt fails. I took a closer look at the 
recipes for python-pyqt and python-sip, and they use old versions that 
don't match the Qt-version currently in use. I'm attempting to make it 
build with updated versions on my machine, but my recipe-fu isn't very 
good, so any help is appreciated.

Compilation output ===>

NOTE: make MAKEFLAGS=

cd QtCore/ && make -f Makefile

make[1]: Entering directory 
`/data/src/openembedded/build/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/python-pyqt-4.4.3-ml5/PyQt-x11-gpl-4.4.3/QtCore'

arm-angstrom-linux-gnueabi-g++ -march=armv7-a -mtune=cortex-a8 
-mfpu=neon -mfloat-abi=softfp -c -pipe 
-isystem/data/src/openembedded/build/angstrom-dev/staging/armv7a-angstrom-linux-gnueabi/usr/include 
-fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2 
-ggdb3 
-isystem/data/src/openembedded/build/angstrom-dev/staging/armv7a-angstrom-linux-gnueabi/usr/include 
-fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2 
-ggdb3 -fpermissive -fvisibility-inlines-hidden -Wall -W -D_REENTRANT 
-fPIC -DQT_NO_DEBUG -DQT_GUI_LIB -DQT_CORE_LIB -DQT_SHARED 
-I/data/src/openembedded/build/angstrom-dev/staging/armv7a-angstrom-linux-gnueabi/usr/share/qt4/mkspecs/linux-g++ 
-I. 
-I/data/src/openembedded/build/angstrom-dev/staging/armv7a-angstrom-linux-gnueabi/usr/include/qt4/QtCore 
-I/data/src/openembedded/build/angstrom-dev/staging/armv7a-angstrom-linux-gnueabi/usr/include/qt4/QtGui 
-I/data/src/openembedded/build/angstrom-dev/staging/armv7a-angstrom-linux-gnueabi/usr/include/qt4 
-I/data/src/openembedded/build/angstrom-dev/staging/armv7a-angstrom-linux-gnueabi/usr/include/qt4/Qt 
-I/data/src/openembedded/build/angstrom-dev/staging/armv7a-angstrom-linux-gnueabi/usr/include/python2.6 
-I. -o sipQtCoreQResource.o sipQtCoreQResource.cpp

/data/src/openembedded/build/angstrom-dev/staging/armv7a-angstrom-linux-gnueabi/usr/include/qt4/QtCore/qscopedpointer.h: 
In copy constructor 'QResource::QResource(const QResource&)':

/data/src/openembedded/build/angstrom-dev/staging/armv7a-angstrom-linux-gnueabi/usr/include/qt4/QtCore/qscopedpointer.h:170: 
error: 'QScopedPointer<T, Cleanup>::QScopedPointer(const 
QScopedPointer<T, Cleanup>&) [with T = QResourcePrivate, Cleanup = 
QScopedPointerDeleter<QResourcePrivate>]' is private

/data/src/openembedded/build/angstrom-dev/staging/armv7a-angstrom-linux-gnueabi/usr/include/qt4/QtCore/qresource.h:59: 
error: within this context

sipQtCoreQResource.cpp: In constructor 'sipQResource::sipQResource(const 
QResource&)':

sipQtCoreQResource.cpp:84: note: synthesized method 
'QResource::QResource(const QResource&)' first required here

/data/src/openembedded/build/angstrom-dev/staging/armv7a-angstrom-linux-gnueabi/usr/include/qt4/QtCore/qscopedpointer.h: 
In member function 'QResource& QResource::operator=(const QResource&)':

/data/src/openembedded/build/angstrom-dev/staging/armv7a-angstrom-linux-gnueabi/usr/include/qt4/QtCore/qscopedpointer.h:170: 
error: 'QScopedPointer<T, Cleanup>& QScopedPointer<T, 
Cleanup>::operator=(const QScopedPointer<T, Cleanup>&) [with T = 
QResourcePrivate, Cleanup = QScopedPointerDeleter<QResourcePrivate>]' is 
private

/data/src/openembedded/build/angstrom-dev/staging/armv7a-angstrom-linux-gnueabi/usr/include/qt4/QtCore/qresource.h:59: 
error: within this context

sipQtCoreQResource.cpp: In function 'void assign_QResource(void*, const 
void*)':

sipQtCoreQResource.cpp:618: note: synthesized method 'QResource& 
QResource::operator=(const QResource&)' first required here

/data/src/openembedded/build/angstrom-dev/staging/armv7a-angstrom-linux-gnueabi/usr/include/qt4/QtCore/qscopedpointer.h: 
In static member function 'static void 
QScopedPointerDeleter<T>::cleanup(T*) [with T = QResourcePrivate]':

/data/src/openembedded/build/angstrom-dev/staging/armv7a-angstrom-linux-gnueabi/usr/include/qt4/QtCore/qscopedpointer.h:100:   
instantiated from 'QScopedPointer<T, Cleanup>::~QScopedPointer() [with T 
= QResourcePrivate, Cleanup = QScopedPointerDeleter<QResourcePrivate>]'

/data/src/openembedded/build/angstrom-dev/staging/armv7a-angstrom-linux-gnueabi/usr/include/qt4/QtCore/qresource.h:59:   
instantiated from here

/data/src/openembedded/build/angstrom-dev/staging/armv7a-angstrom-linux-gnueabi/usr/include/qt4/QtCore/qscopedpointer.h:59: 
error: invalid application of 'sizeof' to incomplete type 
'QResourcePrivate'

/data/src/openembedded/build/angstrom-dev/staging/armv7a-angstrom-linux-gnueabi/usr/include/qt4/QtCore/qscopedpointer.h:59: 
error: creating array with negative size ('-0x00000000000000001')

/data/src/openembedded/build/angstrom-dev/staging/armv7a-angstrom-linux-gnueabi/usr/include/qt4/QtCore/qscopedpointer.h:62: 
warning: possible problem detected in invocation of delete operator:

/data/src/openembedded/build/angstrom-dev/staging/armv7a-angstrom-linux-gnueabi/usr/include/qt4/QtCore/qscopedpointer.h:54: 
warning: 'pointer' has incomplete type

/data/src/openembedded/build/angstrom-dev/staging/armv7a-angstrom-linux-gnueabi/usr/include/qt4/QtCore/qresource.h:56: 
warning: forward declaration of 'struct QResourcePrivate'

/data/src/openembedded/build/angstrom-dev/staging/armv7a-angstrom-linux-gnueabi/usr/include/qt4/QtCore/qscopedpointer.h:62: 
note: neither the destructor nor the class-specific operator delete will 
be called, even if they are declared when the class is defined.

make[1]: *** [sipQtCoreQResource.o] Error 1

make[1]: Leaving directory 
`/data/src/openembedded/build/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/python-pyqt-4.4.3-ml5/PyQt-x11-gpl-4.4.3/QtCore'

make: *** [sub-QtCore-make_default] Error 2

FATAL: oe_runmake failed


