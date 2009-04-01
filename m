Received: from [209.85.220.172] (helo=mail-fx0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <castroenrico@gmail.com>) id 1LovbY-0001Xk-Qr
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Apr 2009 10:15:24 +0200
Received: by fxm20 with SMTP id 20so2675346fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Apr 2009 01:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type;
	bh=EZG1YEL1j5edK+ml+0T4VCYjUnLg7A/kbB1BGD6nX1A=;
	b=pBTx/pJlzavyL9mPRJO2Yk/H455C1qSMPWueniIuV4ha+dWEga6GhPX/Jn9PAF9Tcz
	sHnVr7Hy3rKjz7x8Gk6EiFQtjrD3N6sl/FZsnVaLxykR9InwwrXBx5Na1+gkdf4H6Ubm
	Kkt7yEtu+sKvrGr0RPt8N22yxFwRX1FyQSs/A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type;
	b=D/3qlx+eFVeHwJ6C7K5WuUhD6x0qVvmLbmPypd7IyBmf3OvdjBsTm9Bn2gFI2qgjPG
	tmXU3xO8gnZY+WNZqIW3DYzue/sH9V5c9KOsYQlE9mN8H6dOKYJEFUfJkbIiKn+bXUvO
	S4tszN5KvxF29PQsWDnRM5YQgVWwSUoB1ojLk=
Received: by 10.86.95.20 with SMTP id s20mr5793608fgb.43.1238573585242;
	Wed, 01 Apr 2009 01:13:05 -0700 (PDT)
Received: from ubuntu.redarrow (net-93-144-42-124.t2.dsl.vodafone.it
	[93.144.42.124])
	by mx.google.com with ESMTPS id l12sm1280610fgb.11.2009.04.01.01.13.04
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 01 Apr 2009 01:13:04 -0700 (PDT)
Message-ID: <49D3220F.8070602@gmail.com>
Date: Wed, 01 Apr 2009 10:13:03 +0200
From: Enrico Castro <castroenrico@gmail.com>
User-Agent: Thunderbird 2.0.0.21 (X11/20090318)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: qt4-tools-native_4.4.3.bb failed
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
X-List-Received-Date: Wed, 01 Apr 2009 08:15:25 -0000
Content-Type: multipart/mixed; boundary="------------040304080602090805030107"

--------------040304080602090805030107
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I'm building the next image:

IMAGE_PREPROCESS_COMMAND = "create_etc_timestamp"

ANGSTROM_EXTRA_INSTALL ?= ""

DEPENDS = "task-base-extended \
            ${@base_contains("MACHINE_FEATURES", "screen", "psplash-zap", "",d)} \
            mplayer omapfbplay \
	   qt4-embedded \
            gdb \
            rt73-firmware wireless-tools zd1211-firmware \
	   "

IMAGE_INSTALL = "task-base-extended \
	    ${ANGSTROM_EXTRA_INSTALL} \
	    ${@base_contains("MACHINE_FEATURES", "screen", "psplash-zap", "",d)} \
             mplayer omapfbplay \
	    qt4-embedded \
             gdb \
             rt73-firmware wireless-tools zd1211-firmware \
	   "

export IMAGE_BASENAME = "enrico-image"
IMAGE_LINGUAS = ""

inherit image

But I have the next error:

NOTE: package qt4-tools-native-4.4.3-r2: task do_compile: started
ERROR: function do_compile failed
ERROR: see log in 
/home/enrico/oe/tmp/work/i686-linux/qt4-tools-native-4.4.3-r2/temp/log.do_compile.21027
NOTE: Task failed: 
/home/enrico/oe/tmp/work/i686-linux/qt4-tools-native-4.4.3-r2/temp/log.do_compile.21027
NOTE: package qt4-tools-native-4.4.3-r2: task do_compile: failed
ERROR: TaskFailed event exception, aborting
ERROR: Build of /home/enrico/oe/openembedded/recipes/qt4/qt4-tools-native_4.4.3.bb do_compile failed
ERROR: Task 1237 (/home/enrico/oe/openembedded/recipes/qt4/qt4-tools-native_4.4.3.bb, do_compile) failed
NOTE: Tasks Summary: Attempted 1354 tasks of which 1354 didn't need to be rerun and 1 failed.
ERROR: '/home/enrico/oe/openembedded/recipes/qt4/qt4-tools-native_4.4.3.bb' failed

Regards

Enrico Castro
NOTE: make CC=ccache gcc  CXX=ccache g++ 
make: Nothing to be done for `first'.
NOTE: make CC=ccache gcc  CXX=ccache g++ 
make: Nothing to be done for `first'.
NOTE: make CC=ccache gcc  CXX=ccache g++ 
make: Nothing to be done for `first'.
NOTE: make CC=ccache gcc  CXX=ccache g++ 
make: Nothing to be done for `first'.
NOTE: make CC=ccache gcc  CXX=ccache g++ 
make: Nothing to be done for `first'.
NOTE: make CC=ccache gcc  CXX=ccache g++ 
g++ -fno-exceptions -Wl,-rpath,/home/enrico/oe/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/home/enrico/oe/tmp/staging/i686-linux/usr/lib -o ../../../bin/uic .obj/release-static-emb-x86/customwidgetsinfo.o .obj/release-static-emb-x86/databaseinfo.o .obj/release-static-emb-x86/driver.o .obj/release-static-emb-x86/treewalker.o .obj/release-static-emb-x86/ui4.o .obj/release-static-emb-x86/uic.o .obj/release-static-emb-x86/validator.o .obj/release-static-emb-x86/cppextractimages.o .obj/release-static-emb-x86/cppwritedeclaration.o .obj/release-static-emb-x86/cppwriteicondata.o .obj/release-static-emb-x86/cppwriteicondeclaration.o .obj/release-static-emb-x86/cppwriteiconinitialization.o .obj/release-static-emb-x86/cppwriteincludes.o .obj/release-static-emb-x86/cppwriteinitialization.o .obj/release-static-emb-x86/main.o .obj/release-static-emb-x86/qglobal.o .obj/release-static-emb-x86/qmalloc.o .obj/release-static-emb-x86/qnumeric.o .obj/release-static-emb-x86/qbuffer.o .obj/release-static-emb-x86/qdir.o .obj/release-static-emb-x86/qdiriterator.o .obj/release-static-emb-x86/qfile.o .obj/release-static-emb-x86/qfileinfo.o .obj/release-static-emb-x86/qfsfileengine.o .obj/release-static-emb-x86/qfsfileengine_iterator.o .obj/release-static-emb-x86/qiodevice.o .obj/release-static-emb-x86/qtemporaryfile.o .obj/release-static-emb-x86/qtextstream.o .obj/release-static-emb-x86/qurl.o .obj/release-static-emb-x86/qbytearraymatcher.o .obj/release-static-emb-x86/qdatetime.o .obj/release-static-emb-x86/qhash.o .obj/release-static-emb-x86/qlistdata.o .obj/release-static-emb-x86/qlocale.o .obj/release-static-emb-x86/qmap.o .obj/release-static-emb-x86/qstring.o .obj/release-static-emb-x86/qstringlist.o .obj/release-static-emb-x86/qvector.o .obj/release-static-emb-x86/qabstractfileengine.o .obj/release-static-emb-x86/qbytearray.o .obj/release-static-emb-x86/qbitarray.o .obj/release-static-emb-x86/qvsnprintf.o .obj/release-static-emb-x86/qregexp.o .obj/release-static-emb-x86/qmetatype.o .obj/release-static-emb-x86/qvariant.o .obj/release-static-emb-x86/qtextcodec.o .obj/release-static-emb-x86/qutfcodec.o .obj/release-static-emb-x86/qisciicodec.o .obj/release-static-emb-x86/qtsciicodec.o .obj/release-static-emb-x86/qlatincodec.o .obj/release-static-emb-x86/qsimplecodec.o .obj/release-static-emb-x86/qxmlutils.o .obj/release-static-emb-x86/qdom.o .obj/release-static-emb-x86/qxml.o .obj/release-static-emb-x86/qfsfileengine_unix.o .obj/release-static-emb-x86/qfsfileengine_iterator_unix.o     -lz -ldl
/usr/bin/ld: cannot find -lz
collect2: ld returned 1 exit status
make: *** [../../../bin/uic] Error 1
FATAL: oe_runmake failed

--------------040304080602090805030107--
