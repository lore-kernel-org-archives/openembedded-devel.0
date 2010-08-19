Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1Om7ov-0001MW-JM
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Aug 2010 18:18:28 +0200
Received: by fxm6 with SMTP id 6so1220323fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Aug 2010 09:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=edVonP1hQ4VZC4N3oyXFtlkaVEU4jqeBN48uo5VsqN8=;
	b=uqJrFrOcMikNhfnGq4PYTNbWnDpzb6DwqpecOiXtKW6jzXCfs7YsH4qwbb7nFz4rxm
	CtX7YfY9wEEB1C/3NgG8ts/cPRNLeumETMqohW20uZC0W03O5i8wBYQbumf7LbZBtbRC
	WaJ3y4Rf+fJyOzga2zi3+uubA/aTrdNJJbliI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=ajLX7RIZ9h/eKRgars0oEif4wk6pZSUO3LualZPPxz/r4Jyiau/xCCCV3kpOoR1paD
	eRwzrJQD8RUXbpzJaVc+97JglWZpvOp3ZVKfW2eOtwRHhG3KlUJ/3G586WpvI9zQc6fG
	Z752r6QCG3ir/N2Pk9qptXAu1XKLYLstSIn0s=
Received: by 10.223.108.204 with SMTP id g12mr77060fap.21.1282234680923;
	Thu, 19 Aug 2010 09:18:00 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id r5sm773237faq.8.2010.08.19.09.17.59
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 19 Aug 2010 09:18:00 -0700 (PDT)
Date: Thu, 19 Aug 2010 18:18:23 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100819161823.GN11569@jama>
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
X-List-Received-Date: Thu, 19 Aug 2010 16:18:28 -0000
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

xalan-j now compiled fine but openjdk failed later with:

| checking for a xalan2 serializer jar... no
| configure: error: "A xalan2-serializer jar was not found."
NOTE: package openjdk-6-jre-6b18-1.8-r10.6: task do_configure: Failed

http://tinderbox.openembedded.org/packages/704760/

any hint?

Regards,

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


