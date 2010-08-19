Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OlxC5-0005CU-Ra
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Aug 2010 06:57:40 +0200
Received: by fxm6 with SMTP id 6so816390fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Aug 2010 21:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=MxrwlIkrrWU3w1iOF/CHmnZK8wUOEuEZ5qNrUIwyuR8=;
	b=ks/KSwOV80tFUZ+ubaOpZl5ehli+VgtVgKfJxABiBmwL0J5iGM4Pb2pY5BFhTXonxF
	wuGbPVbIPo5a1X5pMAzDx4SgekG08cytPEK+ZAc7HuX1L/e31jhWIMA4rQ9oAcuLD8O4
	nExqCQeR03igHwKgc4dCaZvA3dZ3xPzRVaSH0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=T9EpzcRMqTvZBch3Dma0B1Wi/xGNGKEZuhJEk6g4MuXFH3IPlVAfkRWirTQps80VtZ
	DCU1/+Raf3d0w91fNbi4r+A9Ot98xVxik1Wi9ZGY3z3jDFGLNSBOsIsBRdWBYc6Kpu/m
	bqg83afoYE0KsVO71wN1nyydNmdBjuVlwAa9k=
Received: by 10.223.113.12 with SMTP id y12mr8709154fap.36.1282193837982;
	Wed, 18 Aug 2010 21:57:17 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id r8sm500041faa.13.2010.08.18.21.57.16
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 18 Aug 2010 21:57:17 -0700 (PDT)
Date: Thu, 19 Aug 2010 06:57:39 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100819045739.GH11569@jama>
References: <AANLkTinW6EWy5rWVHmQoCc_BsC=2XDdnoXWSgnh73Cvn@mail.gmail.com>
	<AANLkTin0-uaqPsLGigEpmHyOPxyDV3SW_6qS0m2nPvfc@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTin0-uaqPsLGigEpmHyOPxyDV3SW_6qS0m2nPvfc@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: etk is in obsolete but there are recipes which depend on it
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
X-List-Received-Date: Thu, 19 Aug 2010 04:57:40 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Aug 18, 2010 at 11:09:35PM +0200, Frans Meulenbroeks wrote:
> 2010/8/18 Khem Raj <raj.khem@gmail.com>:
> > Hi
> >
> > This commit below moved etk to obsolete
> >
> > commit bd75858d8e523dfbed244bf4046b5ce01eeee690
> > Author: Martin Jansa <Martin.Jansa@gmail.com>
> > Date:   Fri Mar 19 18:14:59 2010 +0100
> >
> >    efl: move epsilon/etk to obsolete, because they're not supported
> > with newer ecore anymore
> >
> >    Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> >
> >
> > However there are recipes which still depend on this
> >
> > e17/e17edje-player_svn.bb
> > e17/edje-editor_svn.bb
> > comic-reader/comic-reader_svn.bb
> > e17/exhibit_svn.bb
> > efl1/eflpp_svn.bb
> > efl1/evolve_svn.bb
> > openmoko-projects/om-locations_git.bb
> > openmoko-projects/diversity-radar_svn.bb
> > openmoko-projects/assassin_svn.bb
> >
> > should they also find their way into obsolete ? or is there a new
> > replacement package they should depend on

I agree that moving them to obsolete after double checking that they
really depends on etk is good plan, also proposed a while back:
http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg04242.html

I have EFL SRCREV upgrade in my queue (waiting for remaining alpha
releases like elementary)
http://gitorious.org/~jama/angstrom/jama-shr-experimental/

Regards,

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


