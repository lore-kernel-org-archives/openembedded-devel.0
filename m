Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1OX9m1-0006eU-E6
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Jul 2010 11:21:34 +0200
Received: from [192.168.1.215] (dsl-62-220-14-162.berlikomm.net
	[62.220.14.162])
	by gandharva.secretlabs.de (Postfix) with ESMTPA id D40891B10C09
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Jul 2010 15:39:11 +0000 (UTC)
Message-ID: <4C35F08F.1040705@freyther.de>
Date: Thu, 08 Jul 2010 23:36:47 +0800
From: Holger Freyther <holger+oe@freyther.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.4) Gecko/20100624 Fedora/3.1-1.fc13 Lightning/1.0b2
	Thunderbird/3.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4C356475.2060208@gmail.com>
In-Reply-To: <4C356475.2060208@gmail.com>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] Badness with -ibad, a replacement for zecke-no-host-includes.patch.
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
X-List-Received-Date: Fri, 09 Jul 2010 09:21:34 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 07/08/2010 01:39 PM, Graham Gower wrote:
> This patch introduces a new command line parameter to gcc (at
> Zecke's suggestion), -ibad, which may be used to specify
> blacklisted include prefixes. E.g.
> 
> grg@eye7:/tmp$ ~/oe2/tmp/cross/mipsel/bin/mipsel-angstrom-linux-gcc -c test.c -ibad /usr/include -I /usr/include
> CROSS COMPILE Badness: /usr/include in INCLUDEPATH: /usr/include

nice! The only thing that is worrying is the question how we make sure
these bad path's are enforced.

E.g. a recipe not honoring our CPPFLAGS might silently pass this check
(while before it was hardcoded into the compiler). My proposal would be
to extend the sanity check and grep the compile log for gcc and -ibad
and fail if gcc exists but -ibad does not occur?


