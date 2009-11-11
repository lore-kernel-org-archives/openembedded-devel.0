Received: from [209.85.220.209] (helo=mail-fx0-f209.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1N8JuO-0007op-8S
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Nov 2009 21:35:19 +0100
Received: by fxm1 with SMTP id 1so1380587fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2009 12:33:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=1Yd5jGmIK9iTN8qF2jB87hJ76Cpsovc7JCEctcQzjqc=;
	b=ZxFgve4JKihlM2ZAnbZw1msKSGCtbpKIwV6K5EL7Xh7ECPiUq/YVZmfnmSyEo/mYUQ
	Mx0N63l5Sz+CXEJYLqaj4uobRXF7+bKtNyu8bs2kiYnjtbM7HCJaeWu9sczhRU4rsh40
	lSjiLmeV7RbbtQQWM25hpxjm+zkvM1Se9oQEk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=vxhJw8KTx3u047FcjpB/fte5XNgWxXPhPe7NkRyOsx/+7Kcj/llGIZ7U4fqEPmh//c
	6qWIBPQSHqR8jw1DorUz2lAMa7g84uKOmlhraQrFbF4RnKh2puoIGaGI04ocMlZ0rYx7
	Ho3PdswL3Y954afOLXWISWjDSS4qDGCsMM5DI=
Received: by 10.204.48.131 with SMTP id r3mr745549bkf.195.1257971637843;
	Wed, 11 Nov 2009 12:33:57 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 14sm700535fxm.7.2009.11.11.12.33.57
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 11 Nov 2009 12:33:57 -0800 (PST)
Date: Wed, 11 Nov 2009 21:33:32 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091111203332.GC11484@jama>
References: <1257959521.25369.393.camel@lenovo.internal.reciva.com>
MIME-Version: 1.0
In-Reply-To: <1257959521.25369.393.camel@lenovo.internal.reciva.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.220.209
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: OEDEM 2009 summary: Package management
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
X-List-Received-Date: Wed, 11 Nov 2009 20:35:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 11, 2009 at 05:12:01PM +0000, Phil Blundell wrote:
> This was the last session of the OEDEM schedule and the number of
> participants was much reduced compared to the previous ones.  Partly as
> a result of that it was also very short.
> 
> Key issue: opkg is the defacto standard for package management in
> OE-derived distros but its quality is perceived as low.  What can we do
> about this?

Today I've "fixed" one problem we had with opkg in shr.

opkg installs own version of update-alternatives

its the same script as the one packaged as update-alternatives-cworth

its installed to /usr/bin (update-alternatives-cworth is using
/usr/sbin so in PATH is after version from opkg)

I've patch for update-alternatives-cworth to use alternative which was
installed last if there is no alternative with higher priority (see 
http://cgit.openembedded.net/cgit.cgi/openembedded/commit/?h=shr/merge&id=6c1ed757c1498aff5b4b1b876332d2981f0855a1
)

And it was really confusing to have 2 simillar update-alternatives
scripts in image.

So it should be removed from opkg as I did in
http://cgit.openembedded.net/cgit.cgi/openembedded/commit/?h=shr/merge&id=376cca189eed7a13de5a348e630c0af274c4704b
http://cgit.openembedded.net/cgit.cgi/openembedded/commit/?h=shr/merge&id=416f6e5f5cfa23f0b3ae731af5c2a1dcd1e27189

or opkg should provide virtual/update-alternatives as distros are using
preferred_provider for that already.


-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


