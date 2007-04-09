Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1Hb1oJ-0002DX-28
	for openembedded-devel@openembedded.org; Mon, 09 Apr 2007 23:54:04 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l39Ls30D018897
	for <openembedded-devel@openembedded.org>;
	Mon, 9 Apr 2007 22:54:03 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18551-10 for <openembedded-devel@openembedded.org>;
	Mon,  9 Apr 2007 22:54:00 +0100 (BST)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l39Lrt7G018865
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Mon, 9 Apr 2007 22:53:56 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <evcm2e$15q$1@sea.gmane.org>
References: <evcm2e$15q$1@sea.gmane.org>
Date: Mon, 09 Apr 2007 22:53:56 +0100
Message-Id: <1176155636.5842.25.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: OE a deterministic build system?
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
X-List-Received-Date: Mon, 09 Apr 2007 21:54:06 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

On Mon, 2007-04-09 at 15:22 +0900, Rolf Leggewie wrote:
> I am pulling my hair out and losing faith in OE being a deterministic 
> build system.  As documented in bug 1568, I have not been able to build 
> nunome for about half a year now.  When I asked hrw for help in fixing 
> it , I was quite surprised for him to come back and say "Built fine for 
> me". This success was later repeated by psokolovsky.  Alas, I can't.
[...]
>    9. "bitbake qte-mt && bitbake nunome" then fails with the same old
>       error of "undefined reference to `main'" as always ->
>       http://bugs.openembedded.org/attachment.cgi?id=1335

FWIW, I tried bitbake qte-mt and then bitbake nunome and it succeeded
for me.

> Now, I really wonder what causes this virgin build to fail for me when 
> it seems everybody else can happily build it?  Is OE not deterministic?  
> Hints and discussion welcome.

OE is deterministic but it does to some degree depend the environment
your building within too. Whilst we go to lengths to remove that from
the equation, it does sometimes creep in. You need to debug that build
failure, looking particularly to something creeping in from your build
system...

Regards,

Richard



