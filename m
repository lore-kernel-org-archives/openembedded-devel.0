Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1ORoFt-0001RP-Ek
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Jun 2010 17:24:30 +0200
Received: by pxi2 with SMTP id 2so1014598pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Jun 2010 08:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=nGL1lQ7dT8xgMyoEZW1zwydUOJf191IerEYr40/TeTY=;
	b=gNa+EBn9MgNZyO8FMW4ZyheIjfXb0pp75jNtSXLlmhnLmKIkt5+/xmSDASyJV2Z/2o
	XAcvTIu5t9LLgSdeZCxLlrSe/4gbXoOoj+ALMwIKmw1D7JOsZ+LypEx/BtRJvljLM/Fg
	Wt5rbcomSijtZeBmadf5vLXJMFt7uM6mofTn0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=VVRu0MtuBe9p30MgFKf747+KdoQQlr1xiznWVSKr/OEplbncwIU4gjsBhfLE7h3t25
	/M1M1VdZ7CLXQNLMvx3zRSfv2gmIrI11lTMtQIjd5biHC8uBXYnL/8WBqCfEQwRwrztj
	3H+HXtrspjzZJQwSK+B9nsPTP9svrN77PDWj0=
Received: by 10.143.132.2 with SMTP id j2mr9167282wfn.33.1277392658919;
	Thu, 24 Jun 2010 08:17:38 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id q10sm5773437rvp.20.2010.06.24.08.17.37
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 24 Jun 2010 08:17:37 -0700 (PDT)
Date: Thu, 24 Jun 2010 08:18:48 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100624151848.GD28292@gmail.com>
References: <3511CCD655164D0DACCECB9DE0506610@rhonda.vtc.ru>
MIME-Version: 1.0
In-Reply-To: <3511CCD655164D0DACCECB9DE0506610@rhonda.vtc.ru>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: How to select specific version of dependant component
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
X-List-Received-Date: Thu, 24 Jun 2010 15:32:22 -0000
X-List-Received-Date: Thu, 24 Jun 2010 15:32:22 -0000
X-List-Received-Date: Thu, 24 Jun 2010 15:32:22 -0000
X-List-Received-Date: Thu, 24 Jun 2010 15:32:22 -0000
X-List-Received-Date: Thu, 24 Jun 2010 15:32:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (24/06/10 16:51), Andrew Tverdohlebov wrote:
> Dear openembedded community,
> 
> Could you give me a hint how to write a recipe that refers to specific version of a library.

you can use PREFERRED_VERSION_libnet_local = "1.0.2" in your local.conf

> 
> For example my package depends on libnet 1.0.2
> If I write
> DEPENDS += "libnet"
> it will take libnet with maximum version number 1.1.2
> How can I instruct bitbake to take libnet 1.0.2 ?
> 
> In other recipes I saw something like
> DEPENDS += "libnet (= 1.0.2)"
> 
> But it doesn't work in my case for some reason.
> 
> Huge thanks in advance,
> Andrew
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


