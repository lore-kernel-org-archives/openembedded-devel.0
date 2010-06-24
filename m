Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1ORoHa-0004tQ-E6
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Jun 2010 17:25:22 +0200
Received: by pvg3 with SMTP id 3so1055391pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Jun 2010 08:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=qjVr8OCvy2ZvS/QTnfKi6+DqvdXz66ypAtOvDbBhMpc=;
	b=kAXrq1MhxdSSuZJg2rW4pno9Ic1rDeVfttTBW/7voZqLyx1o0fYPVGkjkjqNLyB7JN
	zdK3I5Q++2X5fOvToOD27UJrcJzlRvJvE7mLgzFxqbMOlIYmEK56vot0GURX9zFOYXI5
	NDChWag9qrcHpAxwT12AK1AvPSM0bCUjiEabw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=rbhZOQUP9vHlVmJpQy/vqFwtbxIDYd8Ao+EieKxE+EdyS4IZgRdKKFvSNjHM3Bfy7+
	1tsvXxcvZ81Tx4iLXcUDge9yQOuwMikwYFsXtT3yFcHmgc0GEIooygyFWrMKLrQIRu/X
	YCEowjJ5FX4AD5Ct3Epr3qzYhzEYvA9GYUZBc=
Received: by 10.142.74.1 with SMTP id w1mr9120831wfa.258.1277392305492;
	Thu, 24 Jun 2010 08:11:45 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id e16sm2782768wfg.2.2010.06.24.08.11.44
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 24 Jun 2010 08:11:44 -0700 (PDT)
Date: Thu, 24 Jun 2010 08:12:54 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100624151254.GB28292@gmail.com>
References: <4C209CD2.4080208@mlbassoc.com>
 <4C232FAD.8090706@mlbassoc.com>
MIME-Version: 1.0
In-Reply-To: <4C232FAD.8090706@mlbassoc.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Koen Kooi <koen@openembedded.org>
Subject: Re: Updated recipe for chrome
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
X-List-Received-Date: Thu, 24 Jun 2010 15:35:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (24/06/10 04:13), Gary Thomas wrote:
> On 06/22/2010 05:21 AM, Gary Thomas wrote:
> >Does anyone have an updated recipe for Google chrome?  The
> >one in org.openembedded.dev is really old - SVN revision
> >34027 - mainline is at 50359!
> >
> >I looked at the recipe and it seems to be full of magic
> >(subpackages with specific SVN revisions, etc). I doubt
> >that just updating the main SVN revision number will work.
> >
> >Any ideas/pointers? I'd really like to try some of the
> >latest features on my embedded systems :-)

I would encourage to bump the srcrev and see what happens
there might be some patches need rework if any.

> 
> Can someone please comment on this (maybe the package author)??
> I'm will to try/test changes, I'm just not sure what to change.
> 
> Thanks
> 
> -- 
> ------------------------------------------------------------
> Gary Thomas                 |  Consulting for the
> MLB Associates              |    Embedded world
> ------------------------------------------------------------
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


