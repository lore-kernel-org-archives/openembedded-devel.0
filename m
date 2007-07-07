Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1I7BiI-0000dH-Kc
	for openembedded-devel@openembedded.org; Sat, 07 Jul 2007 16:56:46 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1I7Bd1-0004jN-TB
	for openembedded-devel@openembedded.org; Sat, 07 Jul 2007 16:51:19 +0200
Received: from host86-131-242-139.range86-131.btcentralplus.com
	([86.131.242.139]) by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sat, 07 Jul 2007 16:51:19 +0200
Received: from koen by host86-131-242-139.range86-131.btcentralplus.com with
	local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sat, 07 Jul 2007 16:51:19 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
Date: Sat, 07 Jul 2007 15:51:12 +0100
Message-ID: <468FA860.5050300@dominion.kabel.utwente.nl>
References: <E1I75mQ-0005Wr-Px@linuxtogo.org>
	<142948947.20070707122533@vanille-media.de>
Mime-Version: 1.0
X-Complaints-To: usenet@sea.gmane.org
X-Gmane-NNTP-Posting-Host: host86-131-242-139.range86-131.btcentralplus.com
User-Agent: Thunderbird 2.0.0.4 (Macintosh/20070604)
In-Reply-To: <142948947.20070707122533@vanille-media.de>
X-Enigmail-Version: 0.95.2
Sender: news <news@sea.gmane.org>
Subject: Re: [oe-commits] org.oe.dev disapproval of revision '66573a06c1ee62e38d70a6c82f8d99a41243cd5c'
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
X-List-Received-Date: Sat, 07 Jul 2007 14:56:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Dr. Michael Lauer schreef:
> koen commit wrote:
>> disapproval of revision '66573a06c1ee62e38d70a6c82f8d99a41243cd5c'
> 
> May I request that from now on _every_ disapproval goes hand in hand with a
> lengthy explanation on oe-devel?

Yes, sorry about that, I wanted to act quickly before people with glibc builds get the
change, build libiconv and require a build from scratch.

The bottom line:

*NEVER* DEPEND on libiconv directly, but on virtual/libiconv, otherwise you break all
glibc based builds out there

The situation is tricky since uclibc (and maybe newlib) need libiconv, but our glibc build
can use the internal iconv from libc6.so. That's why we have virtual/libiconv which does
the right thing automagically.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGj6hgMkyGM64RGpERAhQSAJ9BRu5yEB5IB3aS6s2p/u5IsErOSQCeOL3e
QazmT2c2fB9En+b0UZkhF4o=
=qFg1
-----END PGP SIGNATURE-----



