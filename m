Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpurdie@rpsys.net>) id 1Pv8CL-0003qU-6b
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Mar 2011 14:04:05 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p23D2aHv008823;
	Thu, 3 Mar 2011 13:02:36 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08383-07; Thu,  3 Mar 2011 13:02:32 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p23D2SiG008817
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 3 Mar 2011 13:02:28 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: Steffen Sledz <sledz@dresearch.de>
In-Reply-To: <4D6F8301.2030605@dresearch.de>
References: <4D6B9C9D.7080107@dresearch.de>  <4D6F8301.2030605@dresearch.de>
Date: Thu, 03 Mar 2011 13:02:23 +0000
Message-ID: <1299157343.26736.13065.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: udev, udev-compat and old kernel
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
X-List-Received-Date: Thu, 03 Mar 2011 13:04:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-03-03 at 13:01 +0100, Steffen Sledz wrote:
> Am 28.02.2011 14:01, schrieb Steffen Sledz:
> > In our local development branch we've set
> > 
> >  PREFERRED_VERSION_udev = "141"
> > 
> > in angstrom-2008-preferred-versions.inc to force udev-141 for our
> old kernel (2.6.24) at hipox machine. But i'm nearly sure that's not
> the correct way to do this. ;-)
> > 
> > So what's the right way to handle this?
> > 
> > Looking around i found the udev-compat141_141.bb recipe. In my
> understanding this package adds some rules to newer udev packages
> (e.g. udev-151) to be able to work with older kernels, so that it is
> possible to use newer udev versions. Right?
> > 
> > In this case it should be enough to add some lines to
> conf/machine/hipox.conf, recipes/udev/udev.inc,
> recipes/udev/udev_{151,154,162,165}.bb similar to poodle machine.
> Right?
> 
> Ping!
> 
> It would be helpful if someone could help here to clarify things. The
> documentation on that is not very clear.

I've not seen the udev-compat recipe before but it does sound like a
useful idea to be able to use older kernels with the sane modern
userspace. What you mentioned above sounds correct, I'd suggest trying
it, confirming it works and if so, submit the patches...

Cheers,

Richard




