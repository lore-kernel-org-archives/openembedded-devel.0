Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1K4k0P-00028p-K2
	for openembedded-devel@openembedded.org; Sat, 07 Jun 2008 00:01:53 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m56Lv2ei031005
	for <openembedded-devel@openembedded.org>;
	Fri, 6 Jun 2008 22:57:02 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 30475-07 for <openembedded-devel@openembedded.org>;
	Fri,  6 Jun 2008 22:56:55 +0100 (BST)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m56LuroT030984
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Fri, 6 Jun 2008 22:56:53 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <200806061502.02821.mickey@vanille-media.de>
References: <48486D5B.4060000@nospam.arcornews.de>
	<200806061502.02821.mickey@vanille-media.de>
Date: Fri, 06 Jun 2008 22:56:55 +0100
Message-Id: <1212789415.6840.30.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: RFC: RW for otavio
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Fri, 06 Jun 2008 22:01:53 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2008-06-06 at 15:02 +0200, Michael 'Mickey' Lauer wrote:
> Ok, seems people are convinced this is a good idea.
> 
> Otavio, please send your mtn and ssh keys to
> Koen <k.kooi@student.utwente.nl> and me <mlauer@vanille-media.de>.

I have no objection to Otavio having access so please don't
misunderstand this email in that regard. This is more a general issue I
want to raise.

What I'd like to see is some kind of code of conduct for developers,
particularly new ones to ensure changes get appropriate review and we
don't see cause any conflict.

As guidelines:

* Changes to class files need review on the mailing list
* Changes to more global .conf files need review (e.g. bitbake.conf)
* Changes to core toolchain components need review (gcc, binutils, 
  libtool, pkgconfig, automake, autoconf etc.)
* Machine configs are less sensitive but machine maintainers should be 
  consulted where present and known
* Distro config changes should be reviewed by the distro maintainers 
  where known
* Recipe changes are less sensitive but maintainers should be consulted 
  where known

The point here is to let people build up gradually. Changing the core
infrastructure can influence a lot of people and whilst I don't want to
discourage people hacking on it, we do need to take more care on those
changes than ones in "lower" level recipes. I'm fairly sure most of the
devs know and respect this, I just wonder if having some kind of more
formal policy written down would be a good idea so people know where
they stand?

Opinions?

Cheers,

Richard




