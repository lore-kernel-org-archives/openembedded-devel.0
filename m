Received: from mail-iw0-f174.google.com ([209.85.223.174])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <listjiason@gmail.com>) id 1NoyQc-0004rQ-9j
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Mar 2010 13:20:51 +0100
Received: by iwn4 with SMTP id 4so6344936iwn.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Mar 2010 04:17:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=19xevmX/9gWLEyplgMDiBtlJLvmm+Oz1E7bjiQ5hLc0=;
	b=dYRzb6vmDpJE4jnollG/OpPQTeWxcE5nzSIw9BlIpzM9fW/6E8Ga/MC3TSCJiNbm3u
	L1lGPGWklXAtPlcR/Q7pcxrHsf6m/j53/8Bsyeqmw5z4OTv1JfeNT0NDvnTSbtyKMD3j
	e2MVNq/shnNXVtPI8ALDQngq2uqM9B705eUjw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=U5dcm5Ybw3CFMcXXxP3e5SNZxjLzRoJ7uCbjMJUl81CpnWQOFMTZPBS7oMNJAs9HAi
	2aDZEhwJImeO/Bc8yCwogQXsPuBRAD65di3aHdimEtXa4BxmAb1mgfXSkBUWHK7UWnzO
	KMbKW2FXgje5nXv6Gr3UhY/uqH3qHq/KFXXhs=
MIME-Version: 1.0
Received: by 10.231.155.18 with SMTP id q18mr126417ibw.80.1268137072667; Tue, 
	09 Mar 2010 04:17:52 -0800 (PST)
Date: Tue, 9 Mar 2010 20:17:52 +0800
Message-ID: <f275a9df1003090417s3ea8bcf5y3b547ce7303d5e32@mail.gmail.com>
From: Jiason Li <listjiason@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.174
X-SA-Exim-Mail-From: listjiason@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: 'bitbake opie-image' problem
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
X-List-Received-Date: Tue, 09 Mar 2010 12:20:51 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

I was trying to make some images followed the getting_started guide,
'bitbake nano', 'bitbake console-image' all succeeded,
but soon I encountered problem when doing 'bitbake opie-image'.

Do you have any idea about this issue?
Any info are very appreciated. :)

Thank you!
jiason
20100309


here my local.conf:

BBFILES = "/home/oe/openembedded/recipes/*/*.bb"
MACHINE = "c7x0"
DISTRO = "angstrom-2008.1"
BB_NUMBER_THREADS = "2"


here the log --
build/tmp/work/armv5te-angstrom-linux-gnueabi/opie-packagemanager-1.2.4-r1/temp/log.do_compile.20550:

NOTE: make MAKEFLAGS=
arm-angstrom-linux-gnueabi-g++ -march=armv5te -mtune=xscale
-mthumb-interwork -mno-thumb -c -pipe
-isystem/home/oe/build/tmp/staging/armv5te-angstrom-linux-gnueabi/usr/include
-fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2
-ggdb3  -fno-exceptions -fno-rtti
-isystem/home/oe/build/tmp/staging/armv5te-angstrom-linux-gnueabi/usr/include
-fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2
-ggdb3 -fpermissive -fvisibility-inlines-hidden  -fvisibility=hidden
-fvisibility-inlines-hidden -Wall -W  -O2 -D_REENTRANT -fPIC
-DIPKG_LIB -DHAVE_MKDTEMP -DOPIE_APP_INTERFACE
-DQUICKAPP_NAME="\"packagemanager\"" -DGCC_SUPPORTS_VISIBILITY
-DOPIE_NEW_MALLOC -DOPIE_NO_ERASE_RECT_HACKFIX -DQWS
-DOPIE_BINDIR='"/usr/bin"' -DOPIE_LIBDIR='"/usr/lib/opie/lib"'
-DOPIE_QTDIR='"/usr/lib/opie"' -DQT_NO_DEBUG -DQT_THREAD_SUPPORT
-DQT_PLUGIN -I/home/oe/build/tmp/staging/i686-linux/usr/share/qmake/linux-gnueabi-oe-g++
-I. -I../../../../staging/armv5te-angstrom-linux-gnueabi/usr/include/libopkg
-I/home/oe/build/tmp/staging/armv5te-angstrom-linux-gnueabi/include
-I/home/oe/build/tmp/staging/armv5te-angstrom-linux-gnueabi/qt2/include
-o opackage.o opackage.cpp
arm-angstrom-linux-gnueabi-g++ -march=armv5te -mtune=xscale
-mthumb-interwork -mno-thumb -c -pipe
-isystem/home/oe/build/tmp/staging/armv5te-angstrom-linux-gnueabi/usr/include
-fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2
-ggdb3  -fno-exceptions -fno-rtti
-isystem/home/oe/build/tmp/staging/armv5te-angstrom-linux-gnueabi/usr/include
-fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2
-ggdb3 -fpermissive -fvisibility-inlines-hidden  -fvisibility=hidden
-fvisibility-inlines-hidden -Wall -W  -O2 -D_REENTRANT -fPIC
-DIPKG_LIB -DHAVE_MKDTEMP -DOPIE_APP_INTERFACE
-DQUICKAPP_NAME="\"packagemanager\"" -DGCC_SUPPORTS_VISIBILITY
-DOPIE_NEW_MALLOC -DOPIE_NO_ERASE_RECT_HACKFIX -DQWS
-DOPIE_BINDIR='"/usr/bin"' -DOPIE_LIBDIR='"/usr/lib/opie/lib"'
-DOPIE_QTDIR='"/usr/lib/opie"' -DQT_NO_DEBUG -DQT_THREAD_SUPPORT
-DQT_PLUGIN -I/home/oe/build/tmp/staging/i686-linux/usr/share/qmake/linux-gnueabi-oe-g++
-I. -I../../../../staging/armv5te-angstrom-linux-gnueabi/usr/include/libopkg
-I/home/oe/build/tmp/staging/armv5te-angstrom-linux-gnueabi/include
-I/home/oe/build/tmp/staging/armv5te-angstrom-linux-gnueabi/qt2/include
-o oconfitem.o oconfitem.cpp
arm-angstrom-linux-gnueabi-g++ -march=armv5te -mtune=xscale
-mthumb-interwork -mno-thumb -c -pipe
-isystem/home/oe/build/tmp/staging/armv5te-angstrom-linux-gnueabi/usr/include
-fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2
-ggdb3  -fno-exceptions -fno-rtti
-isystem/home/oe/build/tmp/staging/armv5te-angstrom-linux-gnueabi/usr/include
-fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2
-ggdb3 -fpermissive -fvisibility-inlines-hidden  -fvisibility=hidden
-fvisibility-inlines-hidden -Wall -W  -O2 -D_REENTRANT -fPIC
-DIPKG_LIB -DHAVE_MKDTEMP -DOPIE_APP_INTERFACE
-DQUICKAPP_NAME="\"packagemanager\"" -DGCC_SUPPORTS_VISIBILITY
-DOPIE_NEW_MALLOC -DOPIE_NO_ERASE_RECT_HACKFIX -DQWS
-DOPIE_BINDIR='"/usr/bin"' -DOPIE_LIBDIR='"/usr/lib/opie/lib"'
-DOPIE_QTDIR='"/usr/lib/opie"' -DQT_NO_DEBUG -DQT_THREAD_SUPPORT
-DQT_PLUGIN -I/home/oe/build/tmp/staging/i686-linux/usr/share/qmake/linux-gnueabi-oe-g++
-I. -I../../../../staging/armv5te-angstrom-linux-gnueabi/usr/include/libopkg
-I/home/oe/build/tmp/staging/armv5te-angstrom-linux-gnueabi/include
-I/home/oe/build/tmp/staging/armv5te-angstrom-linux-gnueabi/qt2/include
-o oipkg.o oipkg.cpp
In file included from
../../../../staging/armv5te-angstrom-linux-gnueabi/usr/include/libopkg/void_list.h:21,
                 from
../../../../staging/armv5te-angstrom-linux-gnueabi/usr/include/libopkg/pkg_src_list.h:22,
                 from
../../../../staging/armv5te-angstrom-linux-gnueabi/usr/include/libopkg/opkg_conf.h:29,
                 from
../../../../staging/armv5te-angstrom-linux-gnueabi/usr/include/libopkg/pkg_vec.h:26,
                 from
../../../../staging/armv5te-angstrom-linux-gnueabi/usr/include/libopkg/pkg.h:25,
                 from
../../../../staging/armv5te-angstrom-linux-gnueabi/usr/include/libopkg/opkg.h:21,
                 from oipkg.h:42,
                 from oipkg.cpp:31:
../../../../staging/armv5te-angstrom-linux-gnueabi/usr/include/libopkg/list.h:39:
error: expected ',' or '...' before 'new'
../../../../staging/armv5te-angstrom-linux-gnueabi/usr/include/libopkg/list.h:
In function 'void __list_add(list_head*)':
../../../../staging/armv5te-angstrom-linux-gnueabi/usr/include/libopkg/list.h:42:
error: 'next' was not declared in this scope
../../../../staging/armv5te-angstrom-linux-gnueabi/usr/include/libopkg/list.h:42:
error: expected type-specifier before ';' token
../../../../staging/armv5te-angstrom-linux-gnueabi/usr/include/libopkg/list.h:43:
error: expected type-specifier before '->' token
../../../../staging/armv5te-angstrom-linux-gnueabi/usr/include/libopkg/list.h:43:
error: expected `;' before '->' token
../../../../staging/armv5te-angstrom-linux-gnueabi/usr/include/libopkg/list.h:44:
error: expected type-specifier before '->' token
../../../../staging/armv5te-angstrom-linux-gnueabi/usr/include/libopkg/list.h:44:
error: expected `;' before '->' token
../../../../staging/armv5te-angstrom-linux-gnueabi/usr/include/libopkg/list.h:45:
error: 'prev' was not declared in this scope
../../../../staging/armv5te-angstrom-linux-gnueabi/usr/include/libopkg/list.h:45:
error: expected type-specifier before ';' token
../../../../staging/armv5te-angstrom-linux-gnueabi/usr/include/libopkg/list.h:
At global scope:
../../../../staging/armv5te-angstrom-linux-gnueabi/usr/include/libopkg/list.h:56:
error: expected ',' or '...' before 'new'
../../../../staging/armv5te-angstrom-linux-gnueabi/usr/include/libopkg/list.h:
In function 'void list_add(list_head*)':
../../../../staging/armv5te-angstrom-linux-gnueabi/usr/include/libopkg/list.h:57:
error: expected type-specifier before ',' token
../../../../staging/armv5te-angstrom-linux-gnueabi/usr/include/libopkg/list.h:57:
error: 'head' was not declared in this scope
../../../../staging/armv5te-angstrom-linux-gnueabi/usr/include/libopkg/list.h:
At global scope:
../../../../staging/armv5te-angstrom-linux-gnueabi/usr/include/libopkg/list.h:68:
error: expected ',' or '...' before 'new'
../../../../staging/armv5te-angstrom-linux-gnueabi/usr/include/libopkg/list.h:
In function 'void list_add_tail(list_head*)':
../../../../staging/armv5te-angstrom-linux-gnueabi/usr/include/libopkg/list.h:69:
error: expected type-specifier before ',' token
../../../../staging/armv5te-angstrom-linux-gnueabi/usr/include/libopkg/list.h:69:
error: 'head' was not declared in this scope
../../../../staging/armv5te-angstrom-linux-gnueabi/usr/include/libopkg/list.h:
In function 'void list_del(list_head*)':
../../../../staging/armv5te-angstrom-linux-gnueabi/usr/include/libopkg/list.h:93:
warning: invalid conversion from 'void*' to 'list_head*'
../../../../staging/armv5te-angstrom-linux-gnueabi/usr/include/libopkg/list.h:94:
warning: invalid conversion from 'void*' to 'list_head*'
../../../../staging/armv5te-angstrom-linux-gnueabi/usr/include/libopkg/list.h:
In function 'void list_move(list_head*, list_head*)':
../../../../staging/armv5te-angstrom-linux-gnueabi/usr/include/libopkg/list.h:56:
error: too many arguments to function 'void list_add(list_head*)'
../../../../staging/armv5te-angstrom-linux-gnueabi/usr/include/libopkg/list.h:113:
error: at this point in file
../../../../staging/armv5te-angstrom-linux-gnueabi/usr/include/libopkg/list.h:
In function 'void list_move_tail(list_head*, list_head*)':
../../../../staging/armv5te-angstrom-linux-gnueabi/usr/include/libopkg/list.h:68:
error: too many arguments to function 'void list_add_tail(list_head*)'
../../../../staging/armv5te-angstrom-linux-gnueabi/usr/include/libopkg/list.h:124:
error: at this point in file
In file included from
../../../../staging/armv5te-angstrom-linux-gnueabi/usr/include/libopkg/pkg_dest_list.h:21,
                 from
../../../../staging/armv5te-angstrom-linux-gnueabi/usr/include/libopkg/opkg_conf.h:30,
                 from
../../../../staging/armv5te-angstrom-linux-gnueabi/usr/include/libopkg/pkg_vec.h:26,
                 from
../../../../staging/armv5te-angstrom-linux-gnueabi/usr/include/libopkg/pkg.h:25,
                 from
../../../../staging/armv5te-angstrom-linux-gnueabi/usr/include/libopkg/opkg.h:21,
                 from oipkg.h:42,
                 from oipkg.cpp:31:
../../../../staging/armv5te-angstrom-linux-gnueabi/usr/include/libopkg/pkg_dest.h:
At global scope:
../../../../staging/armv5te-angstrom-linux-gnueabi/usr/include/libopkg/pkg_dest.h:30:
warning: ISO C++ forbids declaration of 'FILE' with no type
../../../../staging/armv5te-angstrom-linux-gnueabi/usr/include/libopkg/pkg_dest.h:30:
error: expected ';' before '*' token
In file included from
../../../../staging/armv5te-angstrom-linux-gnueabi/usr/include/libopkg/opkg.h:21,
                 from oipkg.h:42,
                 from oipkg.cpp:31:
../../../../staging/armv5te-angstrom-linux-gnueabi/usr/include/libopkg/pkg.h:206:
error: variable or field 'pkg_formatted_info' declared void
../../../../staging/armv5te-angstrom-linux-gnueabi/usr/include/libopkg/pkg.h:206:
error: 'FILE' was not declared in this scope
../../../../staging/armv5te-angstrom-linux-gnueabi/usr/include/libopkg/pkg.h:206:
error: 'fp' was not declared in this scope
../../../../staging/armv5te-angstrom-linux-gnueabi/usr/include/libopkg/pkg.h:206:
error: expected primary-expression before '*' token
../../../../staging/armv5te-angstrom-linux-gnueabi/usr/include/libopkg/pkg.h:206:
error: expected primary-expression before ')' token
../../../../staging/armv5te-angstrom-linux-gnueabi/usr/include/libopkg/pkg.h:207:
error: variable or field 'pkg_formatted_field' declared void
../../../../staging/armv5te-angstrom-linux-gnueabi/usr/include/libopkg/pkg.h:207:
error: 'FILE' was not declared in this scope
../../../../staging/armv5te-angstrom-linux-gnueabi/usr/include/libopkg/pkg.h:207:
error: 'fp' was not declared in this scope
../../../../staging/armv5te-angstrom-linux-gnueabi/usr/include/libopkg/pkg.h:207:
error: expected primary-expression before '*' token
../../../../staging/armv5te-angstrom-linux-gnueabi/usr/include/libopkg/pkg.h:207:
error: expected primary-expression before ',' token
../../../../staging/armv5te-angstrom-linux-gnueabi/usr/include/libopkg/pkg.h:207:
error: expected primary-expression before 'const'
../../../../staging/armv5te-angstrom-linux-gnueabi/usr/include/libopkg/pkg.h:211:
error: 'FILE' has not been declared
In file included from oipkg.cpp:31:
oipkg.h:105: warning: ISO C++ forbids declaration of 'opkg_t' with no type
oipkg.h:105: error: expected ';' before '*' token
oipkg.cpp:53: error: variable or field 'fsignalOpkgProgress' declared void
oipkg.cpp:53: error: 'opkg_t' was not declared in this scope
oipkg.cpp:53: error: 'opkg' was not declared in this scope
oipkg.cpp:53: error: expected primary-expression before 'const'
oipkg.cpp:53: error: expected primary-expression before 'void'
make: *** [oipkg.o] Error 1
FATAL: oe_runmake failed


