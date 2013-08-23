Return-Path: <martiert@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 14F6A61013
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Aug 2013 07:39:24 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id j17so226011wiw.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Aug 2013 00:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	bh=D2KJOot4dRX4Kb98TNn+jTGB6PYxaYgGostGt8KsCGI=;
	b=UURNyVN7pVlPyxoBBy8Y2MFtALHMXJQKvFlbrBLInn/lGS9OxEYevhz+X6GEE6eQ4E
	iAskXhonq4RYf2+nLojjfL9bNaE1rEkntaft88zFO2p3NdKIqzgw8YgrQspdWH/c5p+n
	OQXiID9ZRTsIutteXezQ1rGq1GxyahnoGjaUbp5JNpHoIXoYZXxAvXqIMy0VND3GPTNR
	WDHYWUazNddK4FEBdNVQofZp4jnAx8gyGgQpm3TBF7dU7QyxfWvTjOUk5CV//gCE46Za
	ErrN1R3LiYgm6eybchczCcXdX6wFegHdJqwYBkZ01A6Cy+9y8W2F6+eZR7fXonPdG+PU
	TuMQ==
X-Received: by 10.194.248.130 with SMTP id ym2mr6107wjc.61.1377243565337;
	Fri, 23 Aug 2013 00:39:25 -0700 (PDT)
Received: from ?IPv6:2001:420:44ff:fd0e:52e5:49ff:fe32:d20b?
	([2001:420:44ff:fd0e:52e5:49ff:fe32:d20b])
	by mx.google.com with ESMTPSA id eb3sm1736812wic.10.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 23 Aug 2013 00:39:24 -0700 (PDT)
Message-ID: <5217126A.5000403@gmail.com>
Date: Fri, 23 Aug 2013 09:42:34 +0200
From: Martin Ertsaas <martiert@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130813 Thunderbird/17.0.8
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: Issues with xbmc and expat.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Aug 2013 07:39:27 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi.

I'm trying to build xbmc, but I am stuck at the following error:

| arm-atto-linux-gnueabi-libtool: link: arm-atto-linux-gnueabi-gcc 
-march=armv7-a -mthumb-interwork -mfloat-abi=hard
--sysroot=/home/martin/Programmering/attolinux/build/tmp-attolinux_next-eglibc-eglibc/sysroots/pandaboard
-shared  -fPIC -DPIC  .libs/psymbol.o .libs/pscan.o .libs/ploader.o
.libs/pinfo.o .libs/pcontrol.o .libs/serial.o .libs/logging.o
.libs/context.o .libs/cpluff.o .libs/util.o .libs/list.o .libs/hash.o
.libs/thread_posix.o   /usr/lib/libexpat.so -ldl  -march=armv7-a
-mthumb-interwork -mfloat-abi=hard
--sysroot=/home/martin/Programmering/attolinux/build/tmp-attolinux_next-eglibc-eglibc/sysroots/pandaboard
-O4 -O2 -mno-apcs-stack-check -Wl,-O1 -Wl,--hash-style=gnu
-Wl,--as-needed   -Wl,-soname -Wl,libcpluff.so.0 -o .libs/libcpluff.so.0.0.3
| /usr/lib/libexpat.so: file not recognized: File format not recognized
| collect2: error: ld returned 1 exit status


What is strange to me is the /usr/lib/libexpat.so inside of there, which
seems like it shouldn't be there. To me it looks like it tries to link
to my host system expat libary, which of course would fail badly. Any
tips on what might be wrong, or how to fix it?

Regards
Martin

