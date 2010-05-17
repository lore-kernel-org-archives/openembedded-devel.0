Received: from mail-ew0-f225.google.com ([209.85.219.225])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OE6F7-00033v-Tt
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 May 2010 21:45:04 +0200
Received: by ewy25 with SMTP id 25so1398298ewy.27
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 May 2010 12:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=c460CIgskdolgmBQ+wm3htXcPc1leD/ANrSVlAOJJ08=;
	b=CXC1h+7cc5f6SR0LFcLuV6QTyb/zzsIpt/ffq20cvGDk723eqTmsizQF2GI1Put7QI
	uEP6uyxDgmx1kZfYempr/p8WWInTRBVhM7R/akIqIbx4tlWzzYHq4TI5gO9ky9POYy5G
	A04qbLI0NucTAIKaapscHPk9MP54/Tql+T/gQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=l2W5t0/dQJ5Pg6uHm/RK/SUhc0F8bxs5ZfaGH/7xYC6Zsc09mKYvoWBaIv0iZ+FEZs
	CNLEsPOe8ViJKaAB8yce3Ohw5u6GOdMsNLKTEjDz99AFky6CWQmyp7gI5vGhWIckDvhF
	zb2mD0jc2vzIu3/QXGnq3FOwgULJyEvsZk3Ic=
Received: by 10.213.39.68 with SMTP id f4mr2824232ebe.29.1274125250455;
	Mon, 17 May 2010 12:40:50 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id 16sm2978670ewy.7.2010.05.17.12.40.47
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 17 May 2010 12:40:48 -0700 (PDT)
Date: Mon, 17 May 2010 12:41:16 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100517194116.GD7932@gmail.com>
References: <AANLkTinM-N-vAT4yP0ptz0UcMBNsLHpQZ1er2VwnsDDv@mail.gmail.com>
	<20100517190152.GB7868@gmail.com>
	<AANLkTinsmKk2J576bTB0-Wkk48G5He9koqeQiU4MHhL_@mail.gmail.com>
	<20100517191837.GB7932@gmail.com>
	<AANLkTikLN9HgYy5Q6ICrDYuOBB47JdPy8vZiaf-Hv5uu@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTikLN9HgYy5Q6ICrDYuOBB47JdPy8vZiaf-Hv5uu@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.219.225
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Microblaze gcc 4.5.0 support
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
X-List-Received-Date: Mon, 17 May 2010 19:45:37 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (17/05/10 14:29), Adrian Alonso wrote:
> config.log http://pastebin.com/HjkNWXJP

ok one more time post config.log from libgcc build directory

> 
> On Mon, May 17, 2010 at 2:18 PM, Khem Raj <raj.khem@gmail.com> wrote:
> 
> > On (17/05/10 14:14), Adrian Alonso wrote:
> > > Hi Khem,
> > >
> > > log.do_configure at http://pastebin.com/AjAtfnpu
> > > log.do_compile at http://pastebin.com/bqAmHvuu
> >
> > post config.log from inside the gcc build tree.
> >
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
> 
> 
> 
> -- 
> Saludos
> Adrian Alonso
> http://aalonso.wordpress.com
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


