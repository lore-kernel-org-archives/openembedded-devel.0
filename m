Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1Om4Ev-00048o-GO
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Aug 2010 14:29:15 +0200
Received: by fxm6 with SMTP id 6so1002109fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Aug 2010 05:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=8756H5mnhj26vPrBLkmmuvYfAV9JVdWKm70xrgSQVE0=;
	b=wK6nzkG+XCn75OeFB3ZEDwZdoJUvXxdEZksz7h5VyJIY2ZuEZ1vcb8JgeRp3sKnmKk
	0PJ4oq/92X0z7gaO4+9Z2o9ige2lDysU9y+24WD57wq/2aUcyEDtOQoF97bniLDWIKkQ
	HHWTTlguWU5+izT5eDcAOfrQNH8R0lp5wsnDM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=EEhdE+rCyM71OS1eWYLvvI1BunIYquhMhqSM5wdquPuF4lKqwtJs4w7tsMpvVT+N/c
	xRccnctBfxQWp0T/EUJ+t21osK3De5bq81dHhv7Mq+lGxyWb8gV4gQOaJIEhOxUPpxAz
	XwLlJ9fDohlOhOLOJQwO1CUVjSNXzZ12MM2xY=
Received: by 10.223.116.3 with SMTP id k3mr5878867faq.81.1282220921180;
	Thu, 19 Aug 2010 05:28:41 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id t6sm637975faa.27.2010.08.19.05.28.40
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 19 Aug 2010 05:28:40 -0700 (PDT)
Date: Thu, 19 Aug 2010 14:29:03 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100819122903.GM11569@jama>
References: <4C624772.8000607@nedap.com>
	<20100811072548.GB7282@mi.fu-berlin.de>
	<20100819105518.GL11569@jama>
	<20100819121301.GA21426@mi.fu-berlin.de>
MIME-Version: 1.0
In-Reply-To: <20100819121301.GA21426@mi.fu-berlin.de>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: problem building openjdk-6
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
X-List-Received-Date: Thu, 19 Aug 2010 12:29:15 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 19, 2010 at 02:13:01PM +0200, Henning Heinold wrote:
> On Thu, Aug 19, 2010 at 12:55:18PM +0200, Martin Jansa wrote:
> > Hi,
> > 
> > did you resolve it somehow? I still have the same issue on 2 hosts, 2
> > different DISTROs and I didn't find any empty .jar or something.
> > 
> > Regards,
> > 
> > -- 
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> 
> Hi,
> 
> not the jars are empty, some classes inside the jar. Unfornatly I will
> not have the time to fix this before Sept. 13
> 
> So rebuild packages where classes inside the jars have 0 Bytes.
> 
> Bye Henning

Hi,

found better fix and pushed it :).

http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=a1f89a780e9900c168c165e4120cf13c21de6c0f

Regards,

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


