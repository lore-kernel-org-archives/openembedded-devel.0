Return-Path: <hugo.saldanha@aker.com.br>
Received: from asmg.aker.com.br (asmg.aker.com.br [177.159.144.67])
	by mail.openembedded.org (Postfix) with SMTP id D068C60169
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Feb 2015 17:43:37 +0000 (UTC)
Received: from mail.aker.com.br (bat.bsb.aker.com.br [10.0.0.20])
	by asmg.aker.com.br [10.0.1.3]; Thu, 5 Feb 2015 15:43:26 -0200
	(envelope-from hugo.saldanha@aker.com.br)
Received: from localhost (10.4.3.1) by mail.aker.com.br (10.0.0.20) with
	Microsoft SMTP Server (TLS) id 8.3.342.0; Thu, 5 Feb 2015 15:42:39 -0200
Date: Thu, 5 Feb 2015 15:45:12 -0200
From: Hugo Vasconcelos Saldanha <hugo.saldanha@aker.com.br>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Message-ID: <20150205174512.GE1012@saldanha.aker.com.br>
References: <DA8287CC96892A4EB4FCF4FB3FBDA1AB0D86B1@dor-sms-xch01.digi.com>
	<3777411.pG0mYOicST@peggleto-mobl5.ger.corp.intel.com>
	<DA8287CC96892A4EB4FCF4FB3FBDA1AB0D891E@dor-sms-xch01.digi.com>
	<3700387.1Q9y16bqhG@peggleto-mobl5.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <3700387.1Q9y16bqhG@peggleto-mobl5.ger.corp.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-AkerSMTPGW-ServerID: 51f68171b98dfe728ef69b3fd9ed422989bd9b1e
X-AkerSMTPGW-MessageID: 46e4f53363e394ebdc0cd0ab15058ba4554b986d-10o
Cc: "Viguera, Javier" <Javier.Viguera@digi.com>
Subject: Re: [meta-networking] crda-1.1.3 broken in dylan, dora, daisy and dizzy
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Feb 2015 17:43:46 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Feb 05, 2015 at 02:49:13PM -0200, Paul Eggleton wrote:
> On Tuesday 03 February 2015 09:05:54 Viguera, Javier wrote:
> > > -----Original Message-----
> > > From: Paul Eggleton [mailto:paul.eggleton@linux.intel.com]
> > > 
> > > I agree, #2 is the best option to take care of the older branches.
> > > 
> > > Tom, can you please fetch the following files and add them to the OE
> > > source
> > > 
> > > mirror:
> > >   http://distfiles.lesslinux.org/crda-1.1.3.tar.bz2
> > >   http://distfiles.lesslinux.org/2013.01.11-regulatory.bin
> > > 
> > > I've verified the md5sums match the recipe:
> > >   29579185e06a75675507527243d28e5c  crda-1.1.3.tar.bz2
> > >   e0c8a5ca63fb8bf803213f9a0c90b50b  2013.01.11-regulatory.bin
> > 
> > Good to know we agree on the best option.
> > 
> > Could I make a humble request to speed up the copy of the packages to OE
> > source mirror?
> > 
> > We have a BSP layer that depends on this and currently our build is broken
> > fetching crda.
> 
> I've been thinking about this, and this is getting ridiculous. Instead of 
> manually adding files to the OE source mirror, I think it's time we simply had 
> a populated fallback source mirror that has all the sources for at least the 
> recipes in layers hosted on openembedded.org (if not other commonly used 
> layers) aside from OE-Core which is already handled by the yoctoproject.org 
> mirrors. This issue keeps coming up far too often.

The newest example of this problem, at least for me, is samba. The website is
apparently gone and I'm not able to download its sources.

-- 
		Hugo


