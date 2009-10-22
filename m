Received: from [76.76.67.137] (helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gary@mlbassoc.com>) id 1N14Br-0001ol-Kv
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Oct 2009 22:23:22 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id 4F91716604EB; Thu, 22 Oct 2009 14:22:19 -0600 (MDT)
Received: from hermes.chez-thomas.org (hermes_local [192.168.1.101])
	by mail.chez-thomas.org (Postfix) with ESMTP id EEB7F16604B5;
	Thu, 22 Oct 2009 14:22:18 -0600 (MDT)
Message-ID: <4AE0BEFA.4020905@mlbassoc.com>
Date: Thu, 22 Oct 2009 14:22:18 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.4pre) Gecko/20091014 Fedora/3.0-2.8.b4.fc11
	Thunderbird/3.0b4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 76.76.67.137
X-SA-Exim-Mail-From: gary@mlbassoc.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: SDK problems
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
X-List-Received-Date: Thu, 22 Oct 2009 20:23:22 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I tried to build the QTE SDK using
   git://git.openembedded.org/openembedded
   9e54aa00b3de07933fabf5f6193a4f40af3b54f9

When I try the example
   (http://docs.openembedded.org/usermanual/html/ch05s08.html),
I get:

$ make
arm-angstrom-linux-gnueabi-g++ -c -pipe   -Wall -W -D_REENTRANT -DQT_NO_DEBUG -DQT_GUI_LIB -DQT_CORE_LIB -DQT_SHARED 
-I/usr/local/angstrom/arm/arm-angstrom-linux-gnueabi/usr/share/qtopia/mkspecs/linux-g++ -I. -I/usr/local/angstrom/arm/arm-angstrom-linux-gnueabi//usr/include/qtopia/QtCore 
-I/usr/local/angstrom/arm/arm-angstrom-linux-gnueabi//usr/include/qtopia/QtGui -I/usr/local/angstrom/arm/arm-angstrom-linux-gnueabi//usr/include/qtopia -I. -o main.o main.cpp
arm-angstrom-linux-gnueabi-g++  -Wl,-rpath-link,/usr/lib -o qte-example main.o    -L/usr/local/angstrom/arm/arm-angstrom-linux-gnueabi//usr/lib -lQtGuiE -lpng -lfreetype 
-lQtNetworkE -pthread -pthread -pthread -pthread -pthread -pthread -lQtCoreE -lz -lm -pthread -lgthread-2.0 -lrt -lglib-2.0 -ldl -lpthread
/usr/local/angstrom/arm/arm-angstrom-linux-gnueabi/usr/lib/crt1.o: In function `_start':
init.c:(.text+0x2c): undefined reference to `__libc_csu_fini'
init.c:(.text+0x34): undefined reference to `__libc_csu_init'
collect2: ld returned 1 exit status
make: *** [qte-example] Error 1

Any ideas what I need to do to fix this?

Thanks

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


