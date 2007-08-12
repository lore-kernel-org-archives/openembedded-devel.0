Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1IKDDz-0001Gb-N3
	for openembedded-devel@openembedded.org; Sun, 12 Aug 2007 15:11:20 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l7CDBCeK007262
	for <openembedded-devel@openembedded.org>;
	Sun, 12 Aug 2007 14:11:12 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 06903-08 for <openembedded-devel@openembedded.org>;
	Sun, 12 Aug 2007 14:11:08 +0100 (BST)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l7CDB6Md007256
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Sun, 12 Aug 2007 14:11:06 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <1186920412.5193.15.camel@utx.utx.cz>
References: <46BA010A.1020106@dominion.kabel.utwente.nl>
	<1186920412.5193.15.camel@utx.utx.cz>
Date: Sun, 12 Aug 2007 14:11:05 +0100
Message-Id: <1186924265.6156.22.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Reminder: autotools 2.61 will be made default tomorrow
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 12 Aug 2007 13:11:23 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, 2007-08-12 at 14:06 +0200, Stanislav Brabec wrote:
> ERROR: '/OE/org.openembedded.dev/packages/autoconf/autoconf-native_2.61.bb' failed
> 
> It seems that we have a new requirement for the build environment:
> /OE/build/tmp/work/x86_64-linux/autoconf-native-2.61-r0/autoconf-2.61/build-aux/missing: line 54: help2man: command not found

If you used sanity.bbclass it should have warned you about help2man
being missing?

> If you are interested, I can retry bootstrap of an actual OE to update
> this list.
> 
> bison: Probably no more needed, added to native.

This is not needed, some recipes are possibly missing a DEPENDS =
"bison-native" though.

> python-devel: I don't remember why.
> subversion: For fetching.
> diffstat: I don't remember why.
> git: For fetching.

Any git based packages should automatically build git-native now.

> help2man: For autoconf-2.61.

See above.

> monotone: For fetching org.openembedded.dev.
> zlib-devel: Probably ne more true, bug 2561.

zlib should not be needed.

> unzip: Probably no more needed, added to native. For spectrum_fw.
> wget: For fetching.
> gcc gcc-c++ libstdc++: Initial compilation.
> gcc33: Even if qemu now accepts gcc4, at least in SuSE it does not work.
> bc: For linux-rp on collie.

Cheers,

Richard




