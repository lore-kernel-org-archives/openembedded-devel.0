Received: from mail-vb0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.betafive@gmail.com>) id 1USmr7-0001Q6-FK
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Apr 2013 13:18:23 +0200
Received: by mail-vb0-f47.google.com with SMTP id x13so2184671vbb.20
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Apr 2013 04:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:date:x-google-sender-auth:message-id
	:subject:from:to:content-type;
	bh=u2gDCKWPjWHvEziFp8gudXhfN9yyPpL0GYI867duU1M=;
	b=V5gxEVeLUtSDp/yQkAoEkhOEC3i4HJWiNsS2GAt44W6EUpXH4HvjOQLMSujExg6D37
	VN0iXklnmYELRByxbzCymhDfrAd10l9t3Ab+4g737rGpFOcUY7HOs3dgDbuO3Fx39bUN
	6Wls/mQPGEqGUVnXBxm8xwl7UDs699LYLb4kfIsydl8wujZdAAfKAj5gH5AR4vhzP7+b
	6cnJeWX3NptNkWs/c+419fbbLR7oe3hib+36wzEnGzC3c3D3eFd2cKTc7AgHnEsvKZ4D
	xOyfW8jKpX49SoqRQuOwOqqcrivcTTbC7tvkaDBD8T12ACVkrNte9BHwRe09AEoIICnR
	iEKA==
MIME-Version: 1.0
X-Received: by 10.220.245.4 with SMTP id ls4mr7758453vcb.17.1366282848063;
	Thu, 18 Apr 2013 04:00:48 -0700 (PDT)
Sender: paul.betafive@gmail.com
Received: by 10.220.224.135 with HTTP; Thu, 18 Apr 2013 04:00:47 -0700 (PDT)
Date: Thu, 18 Apr 2013 12:00:47 +0100
X-Google-Sender-Auth: nep2Tp8pKzRbTy8VR3gFoJOrea8
Message-ID: <CANyK_8c7CqEqO+X5EkNpqpA0Y3brbAzQSxhkH_afThxJXpas-Q@mail.gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe] libftdi uses library search path "/lib"
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
X-List-Received-Date: Thu, 18 Apr 2013 11:18:33 -0000
Content-Type: text/plain; charset=ISO-8859-1

I'm getting to a warning about an unsafe library search path when
building libftdi. A look into the source tree after do_configure shows
that all the Makefiles have "LIBS= -L/lib -lusb", manually removing
"-L/lib" before running do_compile removes this warning. I don't know
enough about autotools to do something to prevent this happening in
the first place but searching the list archive did turn up
http://article.gmane.org/gmane.comp.handhelds.openembedded/55197/.

The following is the relevant extract from log.do_compile:

../arm-wych-linux-gnueabi-libtool --tag=CC   --mode=link
arm-wych-linux-gnueabi-gcc  -march=armv6    -mthumb-interwork
-mfloat-abi=softfp
--sysroot=/home/paul/work/wych/build-raspberrypi/tmp-eglibc/sysroots/raspberrypi
 -O2 -pipe -g -feliminate-unused-debug-types
-I/home/paul/work/wych/build-raspberrypi/tmp-eglibc/sysroots/raspberrypi/usr/include
-version-info 20:0:19 -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed
-Wl,--as-needed -o libftdi.la -rpath /usr/lib ftdi.lo  -L/lib -lusb

arm-wych-linux-gnueabi-libtool: link: arm-wych-linux-gnueabi-gcc
-march=armv6    -mthumb-interwork -mfloat-abi=softfp
--sysroot=/home/paul/work/wych/build-raspberrypi/tmp-eglibc/sysroots/raspberrypi
-shared  -fPIC -DPIC  .libs/ftdi.o   -L/lib
/home/paul/work/wych/build-raspberrypi/tmp-eglibc/sysroots/raspberrypi/lib/libusb.so
-L=/lib -L/home/paul/work/wych/build-raspberrypi/tmp-eglibc/sysroots/raspberrypi/lib
/home/paul/work/wych/build-raspberrypi/tmp-eglibc/sysroots/raspberrypi/lib/libusb-1.0.so
-lrt  -march=armv6 -mthumb-interwork -mfloat-abi=softfp
--sysroot=/home/paul/work/wych/build-raspberrypi/tmp-eglibc/sysroots/raspberrypi
-O2 -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -Wl,--as-needed
-pthread -Wl,-soname -Wl,libftdi.so.1 -o .libs/libftdi.so.1.19.0

/home/paul/work/wych/build-raspberrypi/tmp-eglibc/sysroots/x86_64-linux/usr/libexec/armv6-vfp-wych-linux-gnueabi/gcc/arm-wych-linux-gnueabi/4.7.2/ld:
warning: library search path "/lib" is unsafe for cross-compilation

--
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk


