Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Ogfn8-00052B-DB
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 17:22:03 +0200
Received: by pvg13 with SMTP id 13so2069729pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Aug 2010 08:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=EUXGV1FsHWcuPA7nRbfo5OiKUXOraaMDedM0IrRYgZQ=;
	b=qIFy8TelKjnDzovKuUlin53z63nJn0sbYtBGliPs06TDsmG6w9ZnQp+zHakQpgimpA
	EC0dnWRTplduEjaZ/4GWODBUO2ll2iXHJdkEC1MuD39lQDXefoNOcJP8ZoKfFVk+QO6Z
	+gsWX6i7e98SDbnM8Qzu+jdRc+FpZoMKoHUwM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=pMM7lT++BhT9awSpo9qdAnTOwBhzAGvEeBo9gzITluraDo21ulcavigk5LPTG8E6P1
	7t0GPA6pKtVn1XVWLfM3dqD7bOxAaXnP9TxKXYl3lNQfQK4+3odNa53EmtsgJQ+aZNRe
	E6sYdTLrbK2PyItsHHdAh1u0yQ74ZLo7OD8p0=
Received: by 10.142.203.12 with SMTP id a12mr7812369wfg.299.1280935316624;
	Wed, 04 Aug 2010 08:21:56 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id x18sm10693362wfd.8.2010.08.04.08.21.55
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 04 Aug 2010 08:21:56 -0700 (PDT)
Date: Wed, 4 Aug 2010 08:21:49 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100804152149.GC8728@gmail.com>
References: <1280901529-30358-1-git-send-email-raj.khem@gmail.com>
	<20100804082539.GA30033@jama>
MIME-Version: 1.0
In-Reply-To: <20100804082539.GA30033@jama>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH,v3] recipes: Dont inherit autotools_stage.
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
X-List-Received-Date: Wed, 04 Aug 2010 15:22:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (04/08/10 10:25), Martin Jansa wrote:
> On Tue, Aug 03, 2010 at 10:58:49PM -0700, Khem Raj wrote:
> > Fixes issues seen by Graham and Denys among others.
> > My full x11-build is underway. Please inspect and/or try this
> > patch out. I will see how my builds complete in the morning.
> 
> Few recipes are failing now for me (with rebuild from scratch).

OK

> 
> I think we usually need just s/autotools_stage/autotools/g instead of
> s/autotools_stage//g. Otherwise nothing is installed to sysroots for
> many packages.

Do you have a list of such recipes.

> 
> Regards,
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


