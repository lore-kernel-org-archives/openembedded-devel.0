Received: from [209.85.216.171] (helo=mail-px0-f171.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1MVLDN-0002BZ-KY
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Jul 2009 10:05:46 +0200
Received: by pxi1 with SMTP id 1so2131024pxi.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jul 2009 00:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=gwPvs6DOp24goatXme8OBHDnq7Te5qhsvVrCvY2HhJY=;
	b=TZzLhV5/tV6FLgZdVQauzfjCzBB0MIBj8hiBKccLeaNCGq5DJQFoHYfbqWRgNf0j/S
	KOdyZKlYuB2EBSnDaFhsY84vjTZTISUHQRxjiMj1icAkL4leK4kxTBp4ikOD2cnDe55k
	LSja+nnSeAOykvxdHsOVblwQFJYSmLiKfunhg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=GYjVyRbppjVkL/yuYOaVzP2HEq+tKjai0My6iuNDNOhy+l6iEXbiqyq8ylQCFHp1Vz
	M19ZG60iKnXblFqfpAK6uHpXS++X16sFT9uFSVfJkxnBaIrKi/yun1mi2mZ3jj3e3PM8
	xmCgAzqa1gI71YmWPPH9UR/E2RQETLrO3mau4=
Received: by 10.114.183.4 with SMTP id g4mr9252510waf.0.1248681063633;
	Mon, 27 Jul 2009 00:51:03 -0700 (PDT)
Received: from ?10.0.0.19? (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id
	17sm11238650pzk.66.2009.07.27.00.51.00
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 27 Jul 2009 00:51:02 -0700 (PDT)
Message-ID: <4A6D5C5A.2010003@gmail.com>
Date: Mon, 27 Jul 2009 17:20:50 +0930
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Thunderbird 2.0.0.22 (X11/20090605)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: linux recipe selected despite ASSUME_PROVIDED += "virtual/kernel"
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
X-List-Received-Date: Mon, 27 Jul 2009 08:05:47 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,
I wish to build an Angstrom based console-image for mipsel from the
org.openembedded.dev branch. I maintain a kernel for the device but am
not yet ready to integrate this into an OE recipe. The default linux_2.6.30.bb
fails to build for me, thus I wish to not build the kernel at this point
in time.

My local.conf contains the following lines,
STAGING_KERNEL_DIR = "/home/grg/jz/linux"
ASSUME_PROVIDED += "virtual/kernel"

However, when i run 'bitbake console-image the default linux_2.6.30.bb recipe
is still selected and the build procedes to fail.

Is this the correct procedure to avoid building a kernel? If so, what else
could I be doing wrongly?

-Graham


