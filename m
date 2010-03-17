Received: from mail-fx0-f220.google.com ([209.85.220.220])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NroyT-0001JF-4h
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Mar 2010 09:51:37 +0100
Received: by fxm20 with SMTP id 20so768755fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Mar 2010 01:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=RGXnMTrO4DG91o4eCkLnmeVx3beaU48Un+dxFEpFDhE=;
	b=s4pw1YF7YG3kBy+XoMpyUGAHBh6atK7p33f+zve4wOsPZjeI6bp0dvTUTrZTDQYkOv
	/hueHVZLtzce2ckvVndqDPmZNrxeCP8mHcXYSQXAwQzdki90f2Rgz78ip79MYljS2T4r
	yDR7cK7YDuiGm9ZDY2oMNJEK0i3VFLxG8NWOs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=NV54JuWGBEehhNr5Yide2BmU9Liy9r4XbhuDNOMqOJD69uQMZBsAQ9xfYp8nMMiokB
	OyjvG0CnISOXycd4OiFpuFHs4O4V7brAGTXABe/TFmyZ8YTc1f5+owMgb4rxfDT7bmJd
	tyt44wGuR1tSL9H1Kv23eQb5J2kJC2grUcEss=
Received: by 10.223.6.27 with SMTP id 27mr5616395fax.31.1268815709866;
	Wed, 17 Mar 2010 01:48:29 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 15sm4698445fxm.12.2010.03.17.01.48.28
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 17 Mar 2010 01:48:28 -0700 (PDT)
Date: Wed, 17 Mar 2010 09:48:20 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100317084820.GI29306@jama>
References: <ac9c93b11002281139g6963e753w970c97002611c78c@mail.gmail.com>
	<1267392928.13054.1.camel@andromeda> <hmgjc2$sgd$1@dough.gmane.org>
	<BE689342-3D28-4D8F-A58C-36885368CE0F@vanille-media.de>
	<20100301150245.GC12022@jama>
	<ly634xpm2z.fsf_-_@ensc-virt.intern.sigma-chemnitz.de>
MIME-Version: 1.0
In-Reply-To: <ly634xpm2z.fsf_-_@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.220.220
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: bitbake -b with BBCLASSEXTENDed recipes
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
X-List-Received-Date: Wed, 17 Mar 2010 08:51:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 15, 2010 at 05:48:52PM +0100, Enrico Scholz wrote:
> Martin Jansa <martin.jansa@gmail.com> writes:
> 
> > Is it possible to implement some support for old functionality like
> > bitbake -c clean -b path.to.recipe.with.BBCLASSEXTEND.bb
> > ...
> > It's really hard to implement something like prefixing -b path with
> > "virtual:native:"
> 
> Bitbake must be patched for this; see
> https://www.cvg.de/people/ensc/0008-bbclassextend.patch

Ahh, great! Thanks for working on this, can you rebase it for bitbake
master? I tried, but it wasn't as easy as it looked first so I gave up.

Regards,

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


