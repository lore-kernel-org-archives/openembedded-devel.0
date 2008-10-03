Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Klf6G-0006wH-Tm
	for openembedded-devel@openembedded.org; Fri, 03 Oct 2008 09:29:20 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1Klf26-0007VI-Jy
	for openembedded-devel@openembedded.org; Fri, 03 Oct 2008 07:25:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 03 Oct 2008 07:25:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Fri, 03 Oct 2008 07:25:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 03 Oct 2008 09:23:27 +0200
Message-ID: <gc4h9f$abi$1@ger.gmane.org>
References: <gc35ba$voi$1@ger.gmane.org>
	<1222986336.5190.33.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b1pre) Gecko/20080922030535 Shredder/3.0b1pre
In-Reply-To: <1222986336.5190.33.camel@dax.rpnet.com>
Sender: news <news@ger.gmane.org>
Subject: Re: Heads up: staging changes are going to land
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
X-List-Received-Date: Fri, 03 Oct 2008 07:29:21 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03-10-2008 00:25, Richard Purdie wrote:

> @@ -404,7 +414,7 @@ FULL_OPTIMIZATION = "-fexpensive-optimiz
>   ##################################################################
>
>   FULL_OPTIMIZATION = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2"
> -DEBUG_OPTIMIZATION = "-O -g"
> +DEBUG_OPTIMIZATION = "-O -fno-omit-frame-pointer -g"
>
>
> I think OE changed this for a reason and Poky never merged that change?
> Maybe I don't remember right though?

mtn log leads it back to my bitkeeper import from 3 years ago, svn says 
revision 1152 changed it in poky: 
http://svn.o-hand.com/view/poky?rev=1152&view=rev
So I suspect it's indeed about getting usefull profiling out of ARM 
binaries :)

regards,

Koen



