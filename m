Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1I7T7i-00088a-5r
	for openembedded-devel@openembedded.org; Sun, 08 Jul 2007 11:32:11 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l689QgqB028589
	for <openembedded-devel@openembedded.org>;
	Sun, 8 Jul 2007 10:26:42 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 28161-07 for <openembedded-devel@openembedded.org>;
	Sun,  8 Jul 2007 10:26:39 +0100 (BST)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l689QZh1028582
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Sun, 8 Jul 2007 10:26:35 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <f6q30v$s2$1@sea.gmane.org>
References: <513012886.20070708041151@gmail.com> <f6q30v$s2$1@sea.gmane.org>
Date: Sun, 08 Jul 2007 10:26:34 +0100
Message-Id: <1183886795.6407.15.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [RFC] Adding screen dimensions to machine configs
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
X-List-Received-Date: Sun, 08 Jul 2007 09:32:16 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, 2007-07-08 at 08:16 +0100, Koen Kooi wrote:
> Paul Sokolovsky schreef:
> >   We already discussed issue of providing more exact device screen
> > properties info than currently available screen classes "smallscreen"
> > and "bigscreen". I for one was proponent of staying with those classes
> > instead of hasting with introducing too many screen parameters without
> > proper way of handling them in OE. However, it's just the matter of
> > fact that at least the most basic of them, like screen dimensions are
> > already in use by more than one package (I can point to opie and
> > fbreader out of top of mind), and so far in adhoc manner, so
> > standardizing them would be beneficial.
> > 
> >   When discussing this on IRC, Marcin Juszkiewicz pointed me to Poky's
> > formfactor package, designed to query various device properties at
> > runtime (including current screen resolution).
> > http://svn.o-hand.com/view/poky/trunk/meta/packages/formfactor/
> 
> Formfactor is a hack that does nothing what our Xserver scripts and HAL+OHM can't do. And
> we were explicitly asked *not* to merge it into OE by someone from o-hand.

The ideas in formfactor are directly lifted from zaurusd. I still wish
zaurusd could become a more generic kind of glue program like the fabled
devmand should have been but I can't be the person to do that.

> >   I think that it is great tool, and we should merge and leverage it
> > in OE by all means. But it handles only runtime configuration,
> 
> And we already have sufficient tools inplace to handle that, formfactor just muddies the
> waters. And if you take a closer look at formfactor, you'll notice it's internally
> inconsistent (e.g. dpi = resolution/size, but you need to specify all 3 in formfactor)

That was mainly because you get some weird DPI values out and often want
control of the rounding.

Formfactor does solve some problems that currently exist. Its a pain
having to patch xtscal for every machine with a rotated screen for
example (duplicating the code in the Xserver script). In the end I've
extended the Xcalibrate extension in Poky to solve that problem properly
though (xtscal no longer needs a rotate option). formfactor also gives
information about the relationship of the keyboard with the screen which
you can't get from anywhere else.

> >    Now with formfactor around, I guess it would be nice to use
> > consistent variable names for the same info. Marcin still suggested to
> > use MACHINE_ prefix for build-time (i.e. machine config) variables.
> > So, the exact topic of this RFC is adding
> > 
> > MACHINE_DISPLAY_WIDTH_PIXELS=
> > MACHINE_DISPLAY_HEIGHT_PIXELS=
> > 
> > to machine configs.
> 
> We can add those without adding formfactor.

I'd be in favour of moving the variables defined in formfactor to the
machine.conf file. Poky could then autogenerate the machine specific
formfactor config file and its also becomes available at build time.

Cheers,

Richard




