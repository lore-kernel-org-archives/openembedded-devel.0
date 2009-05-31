Received: from [87.194.255.145] (helo=woodbine.london.02.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <bluelightning@bluelightning.org>) id 1MAuyk-0004fp-KZ
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Jun 2009 02:02:14 +0200
Received: from shodan.localnet (93.96.131.185) by woodbine.london.02.net
	(8.5.016.1)
	id 4A203296001A5E1E for openembedded-devel@lists.openembedded.org;
	Mon, 1 Jun 2009 00:53:32 +0100
From: Paul Eggleton <bluelightning@bluelightning.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 1 Jun 2009 00:53:30 +0100
User-Agent: KMail/1.11.2 (Linux/2.6.28-11-generic; KDE/4.2.2; i686; ; )
References: <20090529233958.GA16815@misibook.miska.isageek.net>
	<gvrgts$7uc$2@ger.gmane.org>
	<20090530194215.GA1186@misibook.miska.isageek.net>
In-Reply-To: <20090530194215.GA1186@misibook.miska.isageek.net>
MIME-Version: 1.0
Message-Id: <200906010053.30975.bluelightning@bluelightning.org>
Subject: Re: [PATCH] zuc: fixed build
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
X-List-Received-Date: Mon, 01 Jun 2009 00:02:14 -0000
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Sat, 30 May 2009, Michal Hrusecky wrote:
> Rolf Leggewie - 23:47 30.05.09 wrote:
> > do_fetch fails for this package.  Can you guys please look into this?
>
> You are right, it seems like sources are no longer available on original
> URL. I got them in my download directory. I found that it has
> sourceforge pages. There is some downloadable version but it is older
> then version which was on URL in bitbake file. Will try to contact
> original author and if he wouldn't respond, will try to merge it
> somehow...

Another alternative is to fetch it from one of the source directories for 
OpenZaurus (eg. http://www.openzaurus.org/download/3.5.4/sources/ , looking 
through checksums.ini there are a few other mirrors around as well). 

I did notice that we are using an OZ sources mirror on ewi546.ewi.utwente.nl 
for a few recipes but it doesn't seem to be responding right now for me. 
Should we still be fetching from this server or do we need to switch to a 
different mirror? Koen, is this your machine?

Cheers,
Paul


