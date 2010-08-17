Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OlFOk-0002FY-PB
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Aug 2010 08:11:48 +0200
Received: by fxm6 with SMTP id 6so3452002fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Aug 2010 23:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=As2BGigvkNO4bn7MrBP21MuV6vzCXXL/D4TLd3Aaeb0=;
	b=d09ONSopLb7KxuPAzGF9HA0RwHZunVljbFA8jaqGOEEBMGGCo4vAGJV6s4ca95s5z9
	KOCVURDoEkBsxia7BtuCOGwhMAHk3V7G7wmuXkHpkrRn+N+2qiXDA7l/HUDbXxIQx88F
	xJSHHip74Z/VOXjDcdYJukIsgz+QN/elsT2ck=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=rkDxfg1qab4bHmMKYaLPILei5MlC9cedxy7QPxGKfsV88wbtAIk7sTg+bVnR+QtzEI
	8pt4LbJX9qj11VaOucIjAaQRI6703yX8A3ce7WEovGscEgK40sWsGYoYkmPY3uTjRpQO
	lC19dnpDgXt3HH8yeza1VQOmkqJ0n1YlpGSTw=
Received: by 10.223.108.81 with SMTP id e17mr6015494fap.28.1282025488527;
	Mon, 16 Aug 2010 23:11:28 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id r10sm2804844faq.5.2010.08.16.23.11.27
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 16 Aug 2010 23:11:27 -0700 (PDT)
Date: Tue, 17 Aug 2010 08:11:43 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100817061143.GB11569@jama>
References: <4C69F1E7.50000@balister.org> <20100817050359.GA11569@jama>
	<20100817052102.GA17155@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20100817052102.GA17155@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
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
X-List-Received-Date: Tue, 17 Aug 2010 06:11:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 16, 2010 at 10:21:02PM -0700, Khem Raj wrote:
> On (17/08/10 07:03), Martin Jansa wrote:
> > On Mon, Aug 16, 2010 at 07:20:23PM -0700, Philip Balister wrote:
> > > At least one other person is seeing this. Mine is on a clean build on a 
> > > new F13 machine. Any thoughts?
> > 
> > It's calling ncurses-config from your host which returns also -ltinfo.
> 
> heh you beat me to it. I was about to ask for 
> ncurses5-config --libs output on f13 :)
> but yes thats precisely the problem
> 
> > Default ncurses in OE (5.4) doesn't have ncurses-config. It will build
> > ok with 5.7 or you have to update configure to ignore ncurses-config
> > from host.
> 
> why dont we make 5.7 default for ncurses ?

I would like to, it seems working well in SHR, only needs few PR bumps
(as lot of stuff was linked agains ncurses package and now it's splitted
to libncurses5 etc. And ie mc is now linked only to libtinfo.

Enrico did good jub with 5.7, if someone sends patch with PR bumps
(again) and drops D_P = -1 or even removal of 5.4 I'll definetely ACK
it.

Regards,

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


