Received: from mail-fx0-f212.google.com ([209.85.220.212])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NXZhh-0002Vy-82
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Jan 2010 13:30:36 +0100
Received: by fxm4 with SMTP id 4so2829659fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jan 2010 04:28:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:message-id:x-mailer;
	bh=yK6YuPPHJChRk8wnxkTRA9RngFjVdJIbVJgXS3gB3aA=;
	b=o/D8377U2CUj9QNdgcC4H9tM7i7JaVz/ZQC/fPI9HLc1RnTR5kTdG3xHF7z+0P+z2l
	irnAfulEaSEOoVCJRASmeDoL3+wRh50to411lA0C5nofKpd1HR0OuvI6BEurUdAz+xiD
	E2Iw/aTVBXWw0ToYc0QwP3CMBle5dHtFwBao4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer;
	b=MbH8Iq7TrjqbfXQQ7VlB4GcWFDSTSqTN//aGBmkkVlLjUeEx2JZ44JBQ/klx/CH1uq
	W8Mh/1e0SE6hFE3I+a4m1IODUlxz24H9/O3KVmnVrRK9uwiWIExjk/jzUaGw2WyAfFfw
	I3nPcxcdYTC7XiSH7a5x3jwTpQMZLleQtP8Eo=
Received: by 10.223.14.89 with SMTP id f25mr4024250faa.15.1263990497330;
	Wed, 20 Jan 2010 04:28:17 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 16sm3150988fxm.4.2010.01.20.04.28.16
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 20 Jan 2010 04:28:16 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Jan 2010 13:27:52 +0100
Message-Id: <1263990478-28107-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.6.6
X-SA-Exim-Connect-IP: 209.85.220.212
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Xorg upgrade and libpixman removal
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
X-List-Received-Date: Wed, 20 Jan 2010 12:30:36 -0000

Hi,

libpixman-native and pixman "conflicts"

It ends like this (libpixman-native is 0.10.0):
arm-oe-linux-gnueabi-libtool: link: cannot find the library 
`/home/projects/OE/tmpdir-dev-shr/staging/armv4t-oe-linux-gnueabi/usr/lib/libpixman-1.la' 
or unhandled argument 
`/home/projects/OE/tmpdir-dev-shr/staging/armv4t-oe-linux-gnueabi/usr/lib/libpixman-1.la'

It can be resolved by rebuilding both in right order, but libpixman was 
used only in cairo-native, so I moved libpixman to obsolete and added
pixman-native to normal pixman recipes (Koen agreed that libpixman can be 
removed)

Can someone test NEON on armv7?
especially pixman-0.17.4/0006-Support-of-overlapping-src-dst-for-pixman_blt_neon.patch, 
because it was partially included upstream and I'm not following it as close as I should :).

There is also few updates for Xorg, tested on spitz and om-gta02 (with rebuild from scratch 
- to use xorg-macros for all recipes).

Regards,



