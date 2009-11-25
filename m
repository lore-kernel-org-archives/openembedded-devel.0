Received: from fg-out-1718.google.com ([72.14.220.157])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <d.vinokuroff@gmail.com>) id 1NDAXg-0006By-Ko
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Nov 2009 06:35:55 +0100
Received: by fg-out-1718.google.com with SMTP id e12so1476565fga.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Nov 2009 21:34:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=NZ3D3XrIzVo3dDSaxcYLEB+X830PfKBslaaTOBtRqSI=;
	b=wsj4yJVo0kRSgCW4nowPIrXCFm3fZb83nzGJDY4DuF3Ydlp/+nbzgD8eOm+aqDHfFO
	sqVL8GlTGdQZumffpy1VMZu9OckD9d0Pk4tYoytjgCTMil3Cz7fqjfo0EQna7R8Q3lLw
	+wAETvkend6mmefgBmYLC7w72AMTy6NcBHXwY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=L9x/Z7PlnQnwpI7jCJbNIMkYlicX1LB+g9JzLxCPtH8zmzQhlXgiwdd7MQnanOAmSn
	J555seCtWK04quUK2kLtlL8fB+EKH+LFiCNb7SxukTuuBGDHjDbMBywIcCvbwyYS3ewe
	wB54P1jv51D+BEW1xGLGtzE7tF8Bke5Jg33HE=
Received: by 10.87.40.30 with SMTP id s30mr5603585fgj.25.1259127265477;
	Tue, 24 Nov 2009 21:34:25 -0800 (PST)
Received: from ?192.168.0.101? ([92.255.159.177])
	by mx.google.com with ESMTPS id e11sm15006367fga.24.2009.11.24.21.34.24
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 24 Nov 2009 21:34:24 -0800 (PST)
Message-ID: <4B0CC1A4.1060401@gmail.com>
Date: Wed, 25 Nov 2009 10:33:24 +0500
From: Dmitry Vinokurov <d.vinokuroff@gmail.com>
User-Agent: Thunderbird 2.0.0.23 (X11/20091001)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 72.14.220.157
X-SA-Exim-Mail-From: d.vinokuroff@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Making simple QTE application, cannot find libpthread_nonshared.a
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
X-List-Received-Date: Wed, 25 Nov 2009 05:35:55 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello,

Example from manual chapter"Creating and Using a Qt Embedded SDK" fails 
at linking stage:
---------------------------
$ qmake2
$ make
arm-oe-linux-gnueabi-g++ -c -pipe   -Wall -W -D_REENTRANT -DQT_NO_DEBUG 
-DQT_GUI_LIB -DQT_CORE_LIB -DQT_SHARED 
-I/usr/local/minimal/arm/arm-oe-linux-gnueabi/usr/share/qtopia/mkspecs/linux-g++ 
-I. 
-I/usr/local/minimal/arm/arm-oe-linux-gnueabi//usr/include/qtopia/QtCore 
-I/usr/local/minimal/arm/arm-oe-linux-gnueabi//usr/include/qtopia/QtGui 
-I/usr/local/minimal/arm/arm-oe-linux-gnueabi//usr/include/qtopia -I. -o 
main.o main.cpp
arm-oe-linux-gnueabi-g++  -Wl,-rpath-link,/usr/lib -o qte-example 
main.o    -L/usr/local/minimal/arm/arm-oe-linux-gnueabi//usr/lib 
-lQtGuiE -lpng -lfreetype -lQtNetworkE -pthread -pthread -pthread 
-pthread -pthread -pthread -lQtCoreE -lz -lm -pthread -lgthread-2.0 -lrt 
-lglib-2.0 -ldl -lpthread
/usr/local/minimal/arm/lib/gcc/arm-oe-linux-gnueabi/4.4.2/../../../../arm-oe-linux-gnueabi/bin/ld: 
cannot find /usr/lib/libpthread_nonshared.a inside 
/usr/local/minimal/arm/arm-oe-linux-gnueabi
collect2: ld returned 1 exit status
make: *** [qte-example] Ошибка 1
---------------------------

Could anybody suggest, how this issue can be solved? I even have no 
idea, why it searches for static library instead of dynamic.

Thanks.

-- 
Best Regards, 
Dmitry Vinokurov 
<d.vinokuroff@gmail.com>



