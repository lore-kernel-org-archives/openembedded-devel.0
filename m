Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1PJP6R-0004VN-TO
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Nov 2010 12:26:17 +0100
Received: by fxm11 with SMTP id 11so2600437fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Nov 2010 03:24:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=FRYR96/YlVjoKJVW6BlVYH1eqMRjitvBdBid1LMXiZ4=;
	b=GtJDLTTHiK0SKRgh4jeNz1w4lJlAdtHhRK3Exp7Aj1x9nZLpvdiN/lGBI7HbXGIIqj
	hcPVrOtrI0R8Q825hj/hmvvwkBsZ/IWxXmD4MqJsNAityXKJgPIyAYH1Ur4zoaFKHKmw
	aUMGKfcqeQQvksfZvVnUOdXcD3Fz3jZhFWXL0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=s7zyLy40jZmJhXgO1ubgAonR24MkE5GPVdQQkq9Q08RZB4+PLj2DEuvoZZJyPFuzbI
	FcklVA6sALY9y80dC72+Cx+QsUnPuoA+lColDz2YJ7tbhXqARMkDNaetQP9LmbxvtVUj
	qe+NcoldV/QIhlJ50J4960G+2HgOeoCbj8Ojo=
Received: by 10.223.116.200 with SMTP id n8mr722027faq.61.1290165895633;
	Fri, 19 Nov 2010 03:24:55 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id y13sm475920fah.26.2010.11.19.03.24.53
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 19 Nov 2010 03:24:54 -0800 (PST)
Date: Fri, 19 Nov 2010 12:24:55 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101119112455.GB3411@jama>
References: <4CE64779.3020802@sensortherm.de>
	<AANLkTinAj4fG48Ppz_jwT1nmp+tzntZ9YJPaqat4HbES@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTinAj4fG48Ppz_jwT1nmp+tzntZ9YJPaqat4HbES@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: buildserver
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
X-List-Received-Date: Fri, 19 Nov 2010 11:26:40 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 19, 2010 at 01:42:27PM +0300, Yury Bushmelev wrote:
> 2010/11/19 Klaus Schwarzkopf <schwarzkopf@sensortherm.de>:
> > Hi,
> >
> > i have some problems with the ti recipes, see my emails on the list.
> >
> > The two problems are:
> > * the recipes are out of date and don't work.
> > * the recipes can't download the source files.
> >
> > My idea is, to have an buildserver. On every commit (every night or every
> > week), the buildserver download the sources and build the recipe.
> 
> For which DISTRO/MACHINE and image should it build? :)
> What to do with commits while building is in process?
> What to do with non-recipes commits (classes, conf, contrib)
> 
> > If the server builds the recipe successful, it copy the source files to the
> > webserver.
> >
> > If the builds fails, the person how committed the recipe recieve a email
> > with the log files.
> >
> > What do you think about my idea?
> 
> Just remember that OE have a lot of distros, machines and images.
> Ideal case is to test all combinations, but, let's try to imagine how
> long this will be.
> 
> We have following number of distros, machines and images:
> $ ls conf/distro/*.conf | wc -l
> 32
> $ ls conf/machine/*.conf | wc -l
> 297
> $ ls recipes/images/*.bb | wc -l
> 99
> 
> My testbuilder (phenom II x6) is building one image in about 2 hours.
> So, 32 * 297 * 99 * 2 = 1881792 hours. It is about 214 years if I
> calculate right.

But you assume every recipe MACHINE_ARCH or removing tmpdir for every build from scratch.

If you have 1 tmpdir per distro you have it all built in maybe one
week or so.

Regards,

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


