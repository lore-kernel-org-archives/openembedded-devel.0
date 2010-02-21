Received: from mail-fx0-f216.google.com ([209.85.220.216])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1NjEpR-0007Ej-0u
	for openembedded-devel@lists.openembedded.org;
	Sun, 21 Feb 2010 17:38:48 +0100
Received: by fxm8 with SMTP id 8so1646707fxm.28
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Feb 2010 08:36:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:subject
	:message-id:mime-version:content-type:content-disposition:user-agent;
	bh=wLsK/X/B8W0AIhJ+d8EXmH0sjssNPlpFMmw+YwfOi9Y=;
	b=xFLtsPOgIIsj1gDTjh+Xs8NMhKK2YmUtXT/t4kRgyLwdd2xRZXn2yCTtxDu0Byc7xL
	dHUmJIW7mCs8kWwlbVPdoPT5D70+9nw09r67kv9XNEwgBCld1zyaujjQKcs4EHqaAx5W
	DCVxni8TR9XAQoYz0COoj0EPiYD+KkMlaO8bI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	b=oZBeauHO+nT99VTqy/tVpk05doxWkcEEwC0Q2PVv4v4VY4E6xVYRZtuWvNyChOhPNZ
	AOCwLHa5i2c5iZa2DvuSHPj0bIeHzSSPs1qiWZgvECbOLU+uO8fBSGx9DkIJ+6WEdaHZ
	Uz51x+5ETkyfitWwTzwS0M51t/xqiGmPe2Uic=
Received: by 10.223.143.71 with SMTP id t7mr2369491fau.38.1266770162052;
	Sun, 21 Feb 2010 08:36:02 -0800 (PST)
Received: from s42.loc ([84.119.103.202])
	by mx.google.com with ESMTPS id 19sm3308720fkr.46.2010.02.21.08.36.01
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 21 Feb 2010 08:36:01 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.71)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1NjErR-00084y-0j; Sun, 21 Feb 2010 17:40:49 +0100
Date: Sun, 21 Feb 2010 17:40:48 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100221164048.GU30265@mx.loc>
MIME-Version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.220.216
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [BBCLASSEXTEND BUG?] Not taking virtual:native provider into account?
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
X-List-Received-Date: Sun, 21 Feb 2010 16:38:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I'm using bitbake 641e6cf3ec3ab4d26929cf4d2a3704ff07eed4d6 (current
HEAD) on HEAD of oe.

I'm adding:
$ cat recipes/git/git_1.7.0.bb 
require git.inc
SRC_URI[git.md5sum] = "c7553b73e2156d187ece6ba936ae30ab"
SRC_URI[git.sha256sum] = "a61e863944381c4f8231841f678f41f56b634bebca486a61005b35e5bcbb7c79"
DEPENDS = "openssl curl zlib expat"
RDEPENDS = "perl perl-module-file-path cpio findutils sed"
PR = "r0"
FILES_${PN}-dbg += "${libexecdir}/git-core/.debug"
BBCLASSEXTEND = "native"

(and add ";name=git" to the .tar in git.inc's SRC_URI)
and bake git-native and see:
DEBUG: adding .../recipes/git/git-native_1.6.0.4.bb to satisfy git-native
instead of
DEBUG: adding virtual:native:.../recipes/git/git_1.7.0.bb to satisfy git-native
which i get if i rm git-native_*

Assuming that the aboce recipe is correct in principle, this somehow
sounds like BBCLASSEXTEND'ed virtual:native never make it into
providers. What am i doing wrong?

thanks and cheers,
Bernhard


