Received: from mail-pz0-f191.google.com ([209.85.222.191])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NbQ69-0002U7-8n
	for openembedded-devel@lists.openembedded.org;
	Sun, 31 Jan 2010 04:03:44 +0100
Received: by pzk29 with SMTP id 29so3152274pzk.17
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Jan 2010 19:01:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:subject:date:to
	:cc:mime-version:content-transfer-encoding:from:organization
	:message-id:user-agent;
	bh=5zPTFl78WwUeEffNiYdZgYRd3MKKI+FB1dllLlpMQdE=;
	b=MbBp2a90r9r5HlBIGASpMyTe7Q18une9mf+E4+3oUekzaX13lPdWOsVWbsZyMJM6hj
	ueV2F3+eyUVDzy3PjnJR/M0fpoUXZLxYp4Bea3zOwb4vxO5j/CcTkEZciqDget2d/zYv
	/cZHTYPVXgs4J1uRaNn2368hqsgRQBFi4joj4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:subject:date:to:cc:mime-version
	:content-transfer-encoding:from:organization:message-id:user-agent;
	b=XLUnpvvDU+B2jC8BEMdRabx49hQH/cC/rc6ZjKRm981c9P0S5BzASlHXU5azVN+xmC
	CRNzW/czjJFA2AsKt++W/LM95INeKF72Hn8zKXsFSckeq2hQhgDa/Qr22gXH9hiV5rC4
	DahvSGQCGc/qQWhWgXzyZduy0vmK/0HBEKg50=
Received: by 10.114.163.19 with SMTP id l19mr1875438wae.170.1264906875236;
	Sat, 30 Jan 2010 19:01:15 -0800 (PST)
Received: from camelguo ([123.54.107.86])
	by mx.google.com with ESMTPS id 23sm3128429pzk.12.2010.01.30.19.01.11
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 30 Jan 2010 19:01:14 -0800 (PST)
Date: Sun, 31 Jan 2010 11:01:05 +0800
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u7dmmldamn1qzu@camelguo>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.222.191
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: tim.ellis@foonas.org
Subject: building piccontrol - 0.4 failed due to lack of liblua5.1.a
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
X-List-Received-Date: Sun, 31 Jan 2010 03:03:44 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit

Hi guys,
   I tried to build MACHINE=tsx09 DISTRO=micro LIBC=glibc, but failed when  
building picontrol. The error is the following:

NOTE: make -j 4 -e MAKEFLAGS=
ccache arm-oe-linux-gnueabi-gcc -march=armv5te -mtune=arm926ej-s  
-mthumb-interwork -mthumb  
-isystem/media/work-disk/workdir/arm-926ejs-test/staging/armv5te-oe-linux-gnueabi/include  
-fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2   
-I/media/work-disk/workdir/arm-926ejs-test/staging/armv5te-oe-linux-gnueabi/include/lua5.1  
-isystem/media/work-disk/workdir/arm-926ejs-test/staging/armv5te-oe-linux-gnueabi/include   
-c -o piccontrol.o piccontrol.c
ccache arm-oe-linux-gnueabi-gcc -march=armv5te -mtune=arm926ej-s  
-mthumb-interwork -mthumb  
-isystem/media/work-disk/workdir/arm-926ejs-test/staging/armv5te-oe-linux-gnueabi/include  
-fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2   
-I/media/work-disk/workdir/arm-926ejs-test/staging/armv5te-oe-linux-gnueabi/include/lua5.1  
-isystem/media/work-disk/workdir/arm-926ejs-test/staging/armv5te-oe-linux-gnueabi/include   
-c -o ts209.o ts209.c
ccache arm-oe-linux-gnueabi-gcc -march=armv5te -mtune=arm926ej-s  
-mthumb-interwork -mthumb  
-isystem/media/work-disk/workdir/arm-926ejs-test/staging/armv5te-oe-linux-gnueabi/include  
-fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2   
-I/media/work-disk/workdir/arm-926ejs-test/staging/armv5te-oe-linux-gnueabi/include/lua5.1  
-isystem/media/work-disk/workdir/arm-926ejs-test/staging/armv5te-oe-linux-gnueabi/include   
-c -o evdev.o evdev.c
ccache arm-oe-linux-gnueabi-gcc -march=armv5te -mtune=arm926ej-s  
-mthumb-interwork -mthumb -o piccontrol piccontrol.o ts209.o evdev.o  
-L/media/work-disk/workdir/arm-926ejs-test/staging/armv5te-oe-linux-gnueabi/lib  
-Wl,-rpath-link,/media/work-disk/workdir/arm-926ejs-test/staging/armv5te-oe-linux-gnueabi/lib  
-Wl,-O1 -Wl,--hash-style=gnu   
/media/work-disk/workdir/arm-926ejs-test/staging/armv5te-oe-linux-gnueabi/lib/liblua5.1.a  
-lpthread -lm -ldl
arm-oe-linux-gnueabi-gcc:  
/media/work-disk/workdir/arm-926ejs-test/staging/armv5te-oe-linux-gnueabi/lib/liblua5.1.a:  
No such file or directory

for more information, please see the following url:
http://tinderbox.openembedded.net/packages/451539/

Is there anyone who can give me some information?

Thanks a lot!

-- 
Guo Hongruan, Embedded Linux Consultant
Skype: camelguo
Twitter: camelguo
http://www.gulessoft.com


