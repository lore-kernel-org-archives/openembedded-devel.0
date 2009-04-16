Received: from [84.21.108.25] (helo=ns.penguin.cz ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1LuRPf-0002ck-1l
	for openembedded-devel@openembedded.org; Thu, 16 Apr 2009 15:14:03 +0200
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id AB9AF140971A
	for <openembedded-devel@openembedded.org>;
	Thu, 16 Apr 2009 15:11:45 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jAdxl7UpFpo7 for <openembedded-devel@openembedded.org>;
	Thu, 16 Apr 2009 15:11:45 +0200 (CEST)
Received: from [10.20.1.86] (unknown [82.119.242.94])
	by ns.penguin.cz (Postfix) with ESMTP id 8F8521417196
	for <openembedded-devel@openembedded.org>;
	Thu, 16 Apr 2009 15:11:45 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@openembedded.org
In-Reply-To: <69E6C70090A0A14498CC98FAE5E06B6E3CF75C@hiob.intern.dresearch.de>
References: <69E6C70090A0A14498CC98FAE5E06B6E3CF75C@hiob.intern.dresearch.de>
Date: Thu, 16 Apr 2009 15:09:59 +0200
Message-Id: <1239887399.21612.182.camel@hammer.suse.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.0 
X-SA-Exim-Connect-IP: 84.21.108.25
X-SA-Exim-Mail-From: utx@penguin.cz
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=AWL,BAYES_20,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: wrong shebang in mc-extfs files
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
X-List-Received-Date: Thu, 16 Apr 2009 13:14:04 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Sledz, Steffen wrote:
> Found with mc-4.6.2:
> 
> The perl scripts in /usr/share/mc/extfs/ contain wrong shebang headers with pathes into the OE staging area which is not available at the target machine.  :(
> 
>   #! /home/sledz/oe/tmp.1/staging/x86_64-linux/usr/bin/perl -w
> 
> instead of
> 
>   #! /usr/bin/perl -w
> 
> I'm not that familiar with this python/bitbake path magic. Can someone please help?

configure magic:
http://cgit.openembedded.net/cgit.cgi?url=openembedded/commit/&id=a873d2ce9842923b8d0abae7e4cdfca606b3dd90

Note: Maybe mc-extfs should RRECOMMEND all these tools: unzip zip perl
unrar lha apt deb mtools ... But I am not sure whether is will be
useful.

-- 
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



