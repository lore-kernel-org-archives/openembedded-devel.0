Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1Om2mE-0000gN-3q
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Aug 2010 12:55:20 +0200
Received: by fxm6 with SMTP id 6so948351fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Aug 2010 03:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=gfAQ66Qux1kfSzG9B6Rz0eY4jNE/Y33ufpliBe+Ft5A=;
	b=EvG8WAwXXOJoRFWzGZe/mnSvo0tgH7G5zCdvQIG/Ln8C2LAxkec750vyLDLMa3krpk
	DmGX6gy9O8W3jf411SFDl9QkwwV1EsVftHV0ICtNSq8ZpeW8IACsEVRsm+bi9yM2MidE
	2uSjxtalrWIvBFRUkllH8KZM6UCgr03vt1Yo4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=Sy119K+I2bs3tu51Se+w0jz14tdjIhLqEvYPxDTgjGA2i+Kswl/xtC/noPMe77vVIV
	fNW7bs8KGucwhaxou/2dBVnzm8yOwMsV6DwGPoVrCOf3lIBwT0+jpS8t9rPkmRcliZls
	aAKBSAxGP406z4NirqIft0760gOnG3S9YPZMs=
Received: by 10.223.124.145 with SMTP id u17mr9045832far.92.1282215297247;
	Thu, 19 Aug 2010 03:54:57 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id k25sm607447fac.41.2010.08.19.03.54.55
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 19 Aug 2010 03:54:56 -0700 (PDT)
Date: Thu, 19 Aug 2010 12:55:18 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100819105518.GL11569@jama>
References: <4C624772.8000607@nedap.com>
	<20100811072548.GB7282@mi.fu-berlin.de>
MIME-Version: 1.0
In-Reply-To: <20100811072548.GB7282@mi.fu-berlin.de>
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
X-List-Received-Date: Thu, 19 Aug 2010 10:55:20 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 11, 2010 at 09:25:48AM +0200, Henning Heinold wrote:
> On Wed, Aug 11, 2010 at 08:47:14AM +0200, Jaap de Jong wrote:
> > Hi,
> >
> > since a day or 6/7 ago I can't build openjdk-6 anymore.
> > This is the latest patch that builds fine; later fail...
> >
> >    commit 13423cbf48e09af101dacba5e23695091582fc92
> >    Author: Robert Schuster <robertschuster@fsfe.org>
> >    Date:   Thu Jul 22 12:13:29 2010 +0200
> >
> >         jamvm-native 1.5.4: New version.
> >
> > Any clue?
> > Thanks!
> > Jaap de Jong
> >
> 
> Hi Jaap,
> 
> the problem is that jamvm sometimes misscompiles some java-classes and the result is that the class is has 0 bytes.
> That's happening really rare and we didnt build yet a guard for it in. So find out from the errorlog which class is
> missing, mostly it some gnumail stuff and force to rebuild this package.
> 
> Bye Henning

Hi,

did you resolve it somehow? I still have the same issue on 2 hosts, 2
different DISTROs and I didn't find any empty .jar or something.

Regards,

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


