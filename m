Received: from ns.penguin.cz ([84.21.108.25])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <utx@penguin.cz>) id 1QRmpK-0000Zm-5G
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Jun 2011 16:55:18 +0200
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id 692281417191;
	Wed,  1 Jun 2011 16:55:17 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ko4mPoW3SrUO; Wed,  1 Jun 2011 16:55:17 +0200 (CEST)
Received: from [10.20.5.32] (nat.scz.novell.com [213.151.88.252])
	by ns.penguin.cz (Postfix) with ESMTP id 85DFC1416BC5;
	Wed,  1 Jun 2011 16:55:14 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: Paul Menzel <paulepanter@users.sourceforge.net>
In-Reply-To: <1306930030.4315.63.camel@mattotaupa>
References: <1306930030.4315.63.camel@mattotaupa>
Date: Wed, 01 Jun 2011 16:52:04 +0200
Message-ID: <1306939924.23523.20.camel@oct.suse.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.1 
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] lynx: fix checksums
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
X-List-Received-Date: Wed, 01 Jun 2011 14:55:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Paul Menzel wrote:
> Date: Wed, 1 Jun 2011 13:41:59 +0200
> 
> This is a fixup for commit 06d31dc0 [1]

> 	ERROR: The checksums for "/oe/downloads/lynx2.8.7.tar.bz2" did not match.
> 		MD5: expected "cb936aef812e4e463ab86cbbe14d4db9", got "493af4c77ef6761e3f0157cd1be033a0"
> 		SHA256: expected "301bda96ad3cd5032805e8d5315a42061a11e472e3d3a7baee3a2879517ef627", got "40ec9774deb4a7acf69e1bcfb5e272a3857ccc17e20d923255d64cb5dbe55dad"

> I did not push this patch, because I find it strange that the checksums
> are incorrect when you did not copy it. Do you have an idea what might
> have gone wrong?

wget -N http://lynx.isc.org/lynx2.8.7/lynx2.8.7.tar.bz2
md5sum lynx2.8.7.tar.bz2
493af4c77ef6761e3f0157cd1be033a0  lynx2.8.7.tar.bz2
ls -al lynx2.8.7.tar.bz2
-rw-r--r-- 1 sbrabec users 2432045 Jul  6  2009 lynx2.8.7.tar.bz2

For comparison with my copy:
ls -al ~/sources/lynx2.8.7.tar.bz2
-rw-r--r-- 1 sbrabec users 2436801 Jun 21  2010 /OE/home/sources/lynx2.8.7.tar.bz2

I had this recipe in my experimental repo for some time and it seems
that they silently changed (downgraded?) the main tarball in time
between. I can confirm your checksum with the fresh download.

It looks pretty strange. The new tarball misses one security update.
Maybe they did a mistake.

My (byte-to-byte equal) copy is now available as
http://lynx.isc.org/current/lynx2.8.7rel.2.tar.bz2

-- 
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



