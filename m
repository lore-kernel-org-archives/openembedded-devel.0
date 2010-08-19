Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1Om12h-0005y3-0Q
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Aug 2010 11:04:11 +0200
Received: by fxm6 with SMTP id 6so899578fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Aug 2010 02:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=MbEcaNC9yl4FhZ8SdaCAcBSs3e2Z/ZAjcMTbxxUt/ZU=;
	b=nzsMhEkDcrdbKXzyaX7pcpdNuN/7T2yeBwIfR5Tgw2ohNK+ndpPx9Uh4/cEWuu54ac
	KkPlLn8+eGOzF3KNbRbUAYLwinrU2MEpcnrNNMKIzStxow58h2KmJFwqPrmZxrreGIQa
	ro1S2jPeB2YubH7bgGGW/ZMWA+Q6rtyZ1vQns=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=IHI8O50AFJpUDoiMak06Pm5vAgJbKym2JOMFrVtAjCwTn45Sj/VpXbkiXqmMwFr+Sb
	oZoGxmejnMlgDFMHq7YVXmgE9gOjr+dsTAZySPGJJ6z13+bDuMrFh8Y+hVUfboWt/jFb
	YxrpVahu8n7Ay0+3IQAtsPMHcblPfnWjUbdbA=
Received: by 10.223.111.137 with SMTP id s9mr8959512fap.30.1282208630926;
	Thu, 19 Aug 2010 02:03:50 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id u8sm572446fah.36.2010.08.19.02.03.50
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 19 Aug 2010 02:03:50 -0700 (PDT)
Date: Thu, 19 Aug 2010 11:04:13 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100819090412.GJ11569@jama>
References: <AANLkTinW6EWy5rWVHmQoCc_BsC=2XDdnoXWSgnh73Cvn@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTinW6EWy5rWVHmQoCc_BsC=2XDdnoXWSgnh73Cvn@mail.gmail.com>
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
X-List-Received-Date: Thu, 19 Aug 2010 09:04:11 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 18, 2010 at 01:52:45PM -0700, Khem Raj wrote:
> Hi
> 
> This commit below moved etk to obsolete
> 
> commit bd75858d8e523dfbed244bf4046b5ce01eeee690
> Author: Martin Jansa <Martin.Jansa@gmail.com>
> Date:   Fri Mar 19 18:14:59 2010 +0100
> 
>     efl: move epsilon/etk to obsolete, because they're not supported
> with newer ecore anymore
> 
>     Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> 
> 
> However there are recipes which still depend on this
> 
> e17/e17edje-player_svn.bb
> e17/edje-editor_svn.bb
> comic-reader/comic-reader_svn.bb
> e17/exhibit_svn.bb
> efl1/eflpp_svn.bb
> efl1/evolve_svn.bb
> openmoko-projects/om-locations_git.bb
> openmoko-projects/diversity-radar_svn.bb
> openmoko-projects/assassin_svn.bb
> 
> should they also find their way into obsolete ? or is there a new
> replacement package they should depend on

cleaned + few more

Regards,
-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


