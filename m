Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OlEbp-0007Hs-VF
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Aug 2010 07:21:14 +0200
Received: by pzk2 with SMTP id 2so2203059pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Aug 2010 22:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=uiDYTX8NXTrJvwBykk+mzwyiIThH8XAqc/zYJd54230=;
	b=fGG34fYuLTajOdSbxcL83656uf5v0XUTHRT/T5IhuLpuBUSEJmRhv8RftBMj6FPt4r
	9IcXAeQVjhVbbcvIuKd2jOd5KjLaUKqVciAKVzvBRqENxLIRuOnMtC2xYqWuV6AKFaD0
	3rJg5InhoRug7CPSTMemiarNaIeL+AC+CVX+E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=PgwMi+BxRlp6va91BnlFZ8j3nQZh4Sjd0efYWrhor3XfkDQ6TJ+GPr7vRmrH6/r0//
	769ZIIh3fUoLABSpCtnYiZVgKoT/PA7/MphJsxkZ18fQahl1VFA3lz7uzOdR/7Ho0yBr
	LhY3T0UroViwwcJzCiU4QP+dn8Hi/WNePhgcg=
Received: by 10.114.127.3 with SMTP id z3mr7344005wac.83.1282022455423;
	Mon, 16 Aug 2010 22:20:55 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id c10sm13590429wam.1.2010.08.16.22.20.54
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 16 Aug 2010 22:20:54 -0700 (PDT)
Date: Mon, 16 Aug 2010 22:21:02 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100817052102.GA17155@gmail.com>
References: <4C69F1E7.50000@balister.org>
 <20100817050359.GA11569@jama>
MIME-Version: 1.0
In-Reply-To: <20100817050359.GA11569@jama>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.210.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: alsa-utils failure
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
X-List-Received-Date: Tue, 17 Aug 2010 05:21:14 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (17/08/10 07:03), Martin Jansa wrote:
> On Mon, Aug 16, 2010 at 07:20:23PM -0700, Philip Balister wrote:
> > At least one other person is seeing this. Mine is on a clean build on a 
> > new F13 machine. Any thoughts?
> 
> It's calling ncurses-config from your host which returns also -ltinfo.

heh you beat me to it. I was about to ask for 
ncurses5-config --libs output on f13 :)
but yes thats precisely the problem

> Default ncurses in OE (5.4) doesn't have ncurses-config. It will build
> ok with 5.7 or you have to update configure to ignore ncurses-config
> from host.

why dont we make 5.7 default for ncurses ?

> 
> http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg06852.html
> 
> Regards,
> 
> -- 
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


