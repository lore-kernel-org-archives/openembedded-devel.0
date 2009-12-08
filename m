Received: from mail-pz0-f192.google.com ([209.85.222.192])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rk.raggit@gmail.com>) id 1NHreH-0000AL-1Q
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Dec 2009 05:26:08 +0100
Received: by pzk30 with SMTP id 30so4313779pzk.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Dec 2009 20:24:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=aE1Ps4XqbjYHbTG8tsq4xit/hdaDrzEiK2btIsa5dGE=;
	b=NxBIsMgy+1neZApkbmhi0cBctQQXOycmsDj0WaRDttPE1pThbaiO9Wzgxbi3amV1GF
	ydXx/G8rvp37rkE/FgnIB/a1DSHIvDFzp7Hpx2O4AMG5SnALd6cVVZmU9vAQVT2pmyNK
	zGdqc+zfjR8KrGgTHYdSImsGwcyMy8jZsiI2g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=qjrRbkJJBwAn/YPzhfuELt+VTr471aQ2WKOzgpUwsm563XYs+wywxrT3YAhYCu1gni
	VL+JXG6LSVraJjw2o+ozgk3hzJgyMzHohXlzsQxcFAylVSwmN4C6YMD7NBFxJ2H3mAO+
	sq/gkMWuGPQhNSLPASDrL4BuZGv9IVK7veKuQ=
MIME-Version: 1.0
Received: by 10.140.194.18 with SMTP id r18mr461640rvf.80.1260246263955; Mon, 
	07 Dec 2009 20:24:23 -0800 (PST)
In-Reply-To: <19c1b8a90911301042t6ed432b2m1189c619772edf9c@mail.gmail.com>
References: <ec1f3d400911270337wbbbcae8gab291075d242c9d9@mail.gmail.com>
	<19c1b8a90911301042t6ed432b2m1189c619772edf9c@mail.gmail.com>
Date: Tue, 8 Dec 2009 09:54:23 +0530
Message-ID: <ec1f3d400912072024u2ab3a98bg96665cd8457efcd9@mail.gmail.com>
From: RK Raggit <rk.raggit@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.222.192
X-SA-Exim-Mail-From: rk.raggit@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: cortex-a9 build failure at glibc
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
X-List-Received-Date: Tue, 08 Dec 2009 04:26:08 -0000
Content-Type: text/plain; charset=ISO-8859-1

>
> This is gcc ICE. You could preprocess the file and provide commandline
> options and the preprocessed file.
> Secondly I also noticed that you are using gcc 4.2. It would be
> interesting to know if the same ICE happens
> with gcc 4.4. Btw. you would be better of using gcc 4.4 for new arm
> processors like cortex a9
>
Thanks Khem. I moved to gcc4.4 - it chugged past glibc without problem. But
further down i have a new error with util-linux-ng package. Something like
this -

***************
make[2]: Entering directory
`/home/raghu/opendistro/build/tmp/work/armv7a-angstrom-linux-gnueabi/util-linux-ng-2.16-r8.3/util-linux-ng-2.16/login-utils'
ccache arm-angstrom-linux-gnueabi-gcc -march=armv7-a -mtune=cortex-a9
-mfpu=neon -mfloat-abi=softfp -DHAVE_CONFIG_H -I. -I..  -include ../config.h
-I../include -DLOCALEDIR=\"/usr/share/locale\"
-isystem/home/raghu/opendistro/build/tmp/staging/armv7a-angstrom-linux-gnueabi/usr/include
-fsigned-char
-isystem/home/raghu/opendistro/build/tmp/staging/armv7a-angstrom-linux-gnueabi/usr/include
-fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb3
-MT login.o -MD -MP -MF .deps/login.Tpo -c -o login.o login.c
mv -f .deps/login.Tpo .deps/login.Po
ccache arm-angstrom-linux-gnueabi-gcc -march=armv7-a -mtune=cortex-a9
-mfpu=neon -mfloat-abi=softfp -DHAVE_CONFIG_H -I. -I..  -include ../config.h
-I../include -DLOCALEDIR=\"/usr/share/locale\"
-isystem/home/raghu/opendistro/build/tmp/staging/armv7a-angstrom-linux-gnueabi/usr/include
-fsigned-char
-isystem/home/raghu/opendistro/build/tmp/staging/armv7a-angstrom-linux-gnueabi/usr/include
-fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb3
-MT setproctitle.o -MD -MP -MF .deps/setproctitle.Tpo -c -o setproctitle.o
`test -f '../lib/setproctitle.c' || echo './'`../lib/setproctitle.c
mv -f .deps/setproctitle.Tpo .deps/setproctitle.Po
ccache arm-angstrom-linux-gnueabi-gcc -march=armv7-a -mtune=cortex-a9
-mfpu=neon -mfloat-abi=softfp -DHAVE_CONFIG_H -I. -I..  -include ../config.h
-I../include -DLOCALEDIR=\"/usr/share/locale\"
-isystem/home/raghu/opendistro/build/tmp/staging/armv7a-angstrom-linux-gnueabi/usr/include
-fsigned-char
-isystem/home/raghu/opendistro/build/tmp/staging/armv7a-angstrom-linux-gnueabi/usr/include
-fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb3
-MT checktty.o -MD -MP -MF .deps/checktty.Tpo -c -o checktty.o checktty.c
/tmp/ccQfmzYl.s: Assembler messages:
/tmp/ccQfmzYl.s:9352: Error: offset out of range
/tmp/ccQfmzYl.s:9361: Error: offset out of range
/tmp/ccQfmzYl.s:9700: Error: offset out of range
/tmp/ccQfmzYl.s:9702: Error: offset out of range
make[2]: *** [checktty.o] Error 1
make[2]: Leaving directory
`/home/raghu/opendistro/build/tmp/work/armv7a-angstrom-linux-gnueabi/util-linux-ng-2.16-r8.3/util-linux-ng-2.16/login-utils'
******************

Anyone seen something like this ? Is it still due to an improperly
built toolchain ?

--RK

