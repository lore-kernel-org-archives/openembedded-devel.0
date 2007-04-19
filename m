Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1HeZ3e-0004w4-1Y
	for openembedded-devel@openembedded.org; Thu, 19 Apr 2007 18:00:32 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l3JG0S9E002888;
	Thu, 19 Apr 2007 17:00:28 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02774-01; Thu, 19 Apr 2007 17:00:24 +0100 (BST)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l3JG0MnG002881
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Thu, 19 Apr 2007 17:00:22 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
In-Reply-To: <157361400.20070419145713@vanille-media.de>
References: <E1HeU56-0006o4-VP@linuxtogo.org>
	<157361400.20070419145713@vanille-media.de>
Date: Thu, 19 Apr 2007 17:00:22 +0100
Message-Id: <1176998423.5833.99.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Michael Lauer <mickey@vanille-media.de>
Subject: Re: [oe-commits] org.oe.dev mtx-3a.conf, nylon-image-base.bb:	removed remaints from old OE code (PACKAGE_INSTALL instead of IPKG_INSTALL)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Apr 2007 16:00:34 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2007-04-19 at 14:57 +0200, Dr. Michael 'Mickey' Lauer wrote:
> MartinDietze commit wrote:
> > mtx-3a.conf, nylon-image-base.bb: removed remaints from old OE code
> > (PACKAGE_INSTALL instead of IPKG_INSTALL)
> 
> >  TARGET_ARCH = "arm"
> > -IPKG_ARCHS = "all arm ${MACHINE}"
> > +#PACKAGE_ARCHS = "all arm ${MACHINE}"
> 
> Why is that commented?

Since I mentioned that it wasn't needed after recent changes (which it
isn't).

> > -inherit image_ipk
> > -inherit nylon_image
> > -LICENSE = MIT
> > +inherit image
> > +inherit nylon-image
> > +LICENSE = "MIT"
> 
> Are you sure about that? image_ipk looks about right for me.

image_ipk is incorrect and I'd mentioned this being a problem on the
mailing list - it was causing parsing errors. We have multiple image
generation types now and selecting them like that in .bb files doesn't
make sense so images just inherit image.

Cheers,

Richard



