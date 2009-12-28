Received: from mail-iw0-f194.google.com ([209.85.223.194])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NP6iJ-0005g6-8u
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Dec 2009 04:56:14 +0100
Received: by iwn32 with SMTP id 32so6734591iwn.24
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Dec 2009 19:54:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:subject:date:to
	:mime-version:content-transfer-encoding:from:organization:message-id
	:user-agent; bh=Ac85HHN59srzSiqcO9lorfWkHhJ2A6a1IdpuVZ5oCk0=;
	b=P64xcBbGkQ4tAemGxxpJ+a6rCebBrVR9Zi3r9NHNePbSQBdMqmvmDrml3R5oWRg5N9
	Ivx12Kn/La3uISgBzeiG0NvXPPh+49tWNpXYQnsDNe0mx/3szZ8Rh+SixgTkmoIjjyun
	CfUoSx6of0luECpxHu0o/ijb9gkm0OBg4T+LA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:subject:date:to:mime-version:content-transfer-encoding
	:from:organization:message-id:user-agent;
	b=SFaAlwgiYIJzQL4zaQoty3Gf5+MJOSiSZfqH3tqrmBDPEwu+5gGuDyQR3Mb4nnpZZF
	dKqtvDbdKLhD8xLx/LBQCVhNOi1zxfbM6YrEnOKRYJhdg4gbZsNj4IAWXpH/jn1L6ozY
	3jQV0JTdcEHBiUTFbTs6o04z5kw62GiBZatwM=
Received: by 10.231.121.164 with SMTP id h36mr687835ibr.9.1261972454060;
	Sun, 27 Dec 2009 19:54:14 -0800 (PST)
Received: from guohr-laptop-ubuntu ([123.162.70.72])
	by mx.google.com with ESMTPS id 20sm10641932iwn.13.2009.12.27.19.54.11
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 27 Dec 2009 19:54:13 -0800 (PST)
Date: Mon, 28 Dec 2009 11:54:06 +0800
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u5mqggdmmn1qzu@guohr-laptop-ubuntu>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.223.194
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: compilation of libxft failed due to lack of XFT* macroes
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
X-List-Received-Date: Mon, 28 Dec 2009 03:56:14 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit

Hi guys,
   I found a building error, when
1. MACHINE=qemux86 DISTRO=micro, see the following url for more detailed.
http://tinderbox.openembedded.net/packages/391109/

It seems that the compiler can not find the XFT* macroes.

i686-oe-linux-libtool: compile:  ccache i686-oe-linux-gcc  
-march=pentiumpro -std=gnu99 -DHAVE_CONFIG_H -I. -I.. -I../include/X11/Xft  
-isystem/media/work-disk/workdir/oe-qemux86-micro/staging/i686-oe-linux/include  
-I/media/work-disk/workdir/oe-qemux86-micro/staging/i686-oe-linux/include  
-I/media/work-disk/workdir/oe-qemux86-micro/staging/i686-oe-linux/include/freetype2  
-I/media/work-disk/workdir/oe-qemux86-micro/staging/i686-oe-linux/include  
-I/media/work-disk/workdir/oe-qemux86-micro/staging/i686-oe-linux/include  
-Wall -Wpointer-arith -Wstrict-prototypes -Wmissing-prototypes  
-Wmissing-declarations -Wnested-externs -fno-strict-aliasing  
-Wbad-function-cast -Wold-style-definition -Wdeclaration-after-statement  
-I../include/X11/Xft  
-isystem/media/work-disk/workdir/oe-qemux86-micro/staging/i686-oe-linux/include  
-fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os -MT  
xftinit.lo -MD -MP -MF .deps/xftinit.Tpo -c xftinit.c  -fPIC -DPIC -o  
.libs/xftinit.o
xftinit.c: In function 'XftGetVersion':
xftinit.c:42: error: 'XFT_MAJOR' undeclared (first use in this function)
xftinit.c:42: error: (Each undeclared identifier is reported only once
xftinit.c:42: error: for each function it appears in.)
xftinit.c:42: error: 'XFT_MINOR' undeclared (first use in this function)
xftinit.c:42: error: 'XFT_REVISION' undeclared (first use in this function)
make[2]: *** [xftinit.lo] Error 1

-- 
Guo Hongruan, Embedded Linux Consultant
Skype: camelguo
Twitter: camelguo
http://www.gulessoft.com


