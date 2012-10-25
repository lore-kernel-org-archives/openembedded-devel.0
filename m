Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jason.mclaurin@gmail.com>) id 1TRTe3-0007TA-7i
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Oct 2012 22:03:11 +0200
Received: by mail-ie0-f175.google.com with SMTP id c13so2830601ieb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Oct 2012 12:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=AqqKkIi7Ay8nhtYljW+cnk75hkJAO7YApQqaGF3c3ac=;
	b=BXQFPt93C1NV0GptmI0mSvyCxjcDZU7X/nkKTk6R2Hwl1V4uWmSP0t++9WRP028uoK
	VQglbXToZ1r5XhLUv7jSjvBCTdYqdOBLIh7fANvuloh7J6y9vG4w34sd9dI8QTQsZ4tx
	UhnNAQqfHrwX+pvquxLMexzBDwSMr4eMkVogBcZYA509WrylbAviMywhzj6I4h4Z3FU6
	IkCyzQNMxaVk2XoHGdjXr+LD5a2ssGV3jCwaoyWaUC7rk62WWkFVRv9j8j7pzOvHTftC
	9Y8HGpTSltupSMgIYe8cQ23qbsF28EH0NzcIFw5BLC5HA5gAdZUUjWL/plo49KEJLh07
	U5tA==
MIME-Version: 1.0
Received: by 10.50.171.101 with SMTP id at5mr7134325igc.60.1351194581581; Thu,
	25 Oct 2012 12:49:41 -0700 (PDT)
Received: by 10.231.50.149 with HTTP; Thu, 25 Oct 2012 12:49:41 -0700 (PDT)
Date: Thu, 25 Oct 2012 14:49:41 -0500
Message-ID: <CAKgF1Sus=VdZb=YPDRHZWDCLQfDQHHBKyv1Y4BmH=MDojjXocw@mail.gmail.com>
From: Jason McLaurin <jason.mclaurin@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Cross compiler including files from /usr/include
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
X-List-Received-Date: Thu, 25 Oct 2012 20:03:11 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi everyone,

I'm having a build failure where it looks like g++ is including a file
from the regular Linux environment, instead of the cross-compile
environment.  Look at how pthread.h is coming from /usr/include
instead of somewhere inside OpenEmbedded.

I looked under the sysroot specified in the g++ command
(/home/linux3ps/src/oe_sd50/tmp/sysroots/armv5te-angstrom-linux-gnueabi),
and there is a usr/include/pthread.h in that path.  Reading the gcc
docs makes it seem like the --sysroot= option would make
-I/usr/include redirect to <sysroot>/usr/include, but that doesn't
seem to be happening here.

Thanks in advance,

-Jason

-------------------------------------

| arm-angstrom-linux-gnueabi-g++ -march=armv5te -mtune=arm926ej-s
-mthumb-interwork -mno-thumb
--sysroot=/home/linux3ps/src/oe_sd50/tmp/sysroots/armv5te-angstrom-linux-gnueabi
-c -pipe -fexpensive-optimizations -fomit-frame-pointer
-frename-registers -O2 -ggdb2 -fexpensive-optimizations
-fomit-frame-pointer -frename-registers -O2 -ggdb2 -fpermissive
-fvisibility-inlines-hidden -g -Wall -W -D_REENTRANT -DQT_XML_LIB
-DQT_GUI_LIB -DQT_NETWORK_LIB -DQT_CORE_LIB -DQT_SHARED
-I../../../../sysroots/armv5te-angstrom-linux-gnueabi/usr/share/qtopia/mkspecs/linux-g++
-I. -I/home/linux3ps/src/oe_sd50/tmp/sysroots/armv5te-angstrom-linux-gnueabi/usr/include/qtopia/QtCore
-I/home/linux3ps/src/oe_sd50/tmp/sysroots/armv5te-angstrom-linux-gnueabi/usr/include/qtopia/QtNetwork
-I/home/linux3ps/src/oe_sd50/tmp/sysroots/armv5te-angstrom-linux-gnueabi/usr/include/qtopia/QtGui
-I/home/linux3ps/src/oe_sd50/tmp/sysroots/armv5te-angstrom-linux-gnueabi/usr/include/qtopia/QtXml
-I/home/linux3ps/src/oe_sd50/tmp/sysroots/armv5te-angstrom-linux-gnueabi/usr/include/qtopia
-I/usr/include -I. -o autoheightlabel.o
src/common/gui/autoheightlabel.cpp
| In file included from
/home/linux3ps/src/oe_sd50/tmp/sysroots/i686-linux/usr/armv5te/lib/gcc/arm-angstrom-linux-gnueabi/4.5.3/../../../../arm-angstrom-linux-gnueabi/include/c++/4.5.3/arm-angstrom-linux-gnueabi/bits/gthr-default.h:41:0,
|                  from
/home/linux3ps/src/oe_sd50/tmp/sysroots/i686-linux/usr/armv5te/lib/gcc/arm-angstrom-linux-gnueabi/4.5.3/../../../../arm-angstrom-linux-gnueabi/include/c++/4.5.3/arm-angstrom-linux-gnueabi/bits/gthr.h:162,
|                  from
/home/linux3ps/src/oe_sd50/tmp/sysroots/i686-linux/usr/armv5te/lib/gcc/arm-angstrom-linux-gnueabi/4.5.3/../../../../arm-angstrom-linux-gnueabi/include/c++/4.5.3/ext/atomicity.h:34,
|                  from
/home/linux3ps/src/oe_sd50/tmp/sysroots/i686-linux/usr/armv5te/lib/gcc/arm-angstrom-linux-gnueabi/4.5.3/../../../../arm-angstrom-linux-gnueabi/include/c++/4.5.3/bits/basic_string.h:41,
|                  from
/home/linux3ps/src/oe_sd50/tmp/sysroots/i686-linux/usr/armv5te/lib/gcc/arm-angstrom-linux-gnueabi/4.5.3/../../../../arm-angstrom-linux-gnueabi/include/c++/4.5.3/string:53,
|                  from src/common/gui/../app/appconstants.h:5,
|                  from src/common/gui/../app/appcommon.h:9,
|                  from src/common/gui/autoheightlabel.h:4,
|                  from src/common/gui/autoheightlabel.cpp:1:
| /usr/include/pthread.h:228:31: error: expected initializer before '__THROWNL'
| /usr/include/pthread.h:743:6: error: expected initializer before '__THROWNL'
| /usr/include/pthread.h:747:6: error: expected initializer before '__THROWNL'
| /usr/include/pthread.h:753:20: error: expected initializer before '__THROWNL'
| /usr/include/pthread.h:758:6: error: expected initializer before '__THROWNL'
| /usr/include/pthread.h:882:6: error: expected initializer before '__THROWNL'
| /usr/include/pthread.h:886:3: error: expected initializer before '__THROWNL'
| /usr/include/pthread.h:892:23: error: expected initializer before '__THROWNL'


