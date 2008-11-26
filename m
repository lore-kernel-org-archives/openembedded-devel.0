Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>)
	id 1L5Omx-0005eh-24; Wed, 26 Nov 2008 19:06:59 +0100
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>)
	id 1L5Ok1-0003yG-M7; Wed, 26 Nov 2008 18:03:57 +0000
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <pb@reciva.com>)
	id 1L5Ok1-0000qJ-G2; Wed, 26 Nov 2008 18:03:57 +0000
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <ggk26f$30a$1@ger.gmane.org>
References: <ggjnpc$qhg$1@ger.gmane.org>
	<200811261755.53197.mickey@vanille-media.de>
	<1227721214.19934.33.camel@mill.internal.reciva.com>
	<ggk26f$30a$1@ger.gmane.org>
Date: Wed, 26 Nov 2008 18:03:57 +0000
Message-Id: <1227722637.19934.36.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Cc: openembedded-devel@openembedded.org
Subject: Re: preferred-provider at the image level a.k.a why is all	this fso stuff in my non-fso image
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
X-List-Received-Date: Wed, 26 Nov 2008 18:06:59 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2008-11-26 at 18:49 +0100, Koen Kooi wrote:
> Conflicts: + Replaces: hits another bug in opkg, it will silently pick 
> 'fso-foo' over 'foo' when both are in deploy (e.g. build fso-image for 
> om-gta02 and x11-image-with-gpsd for om-gta01). We hit this problem when 
> the matchbox-*2 was added from poky.

I'm not quite sure what you're saying here.  If fso-foo Conflicts,
Replaces, and Provides foo, opkg would be basically correct to install
the former rather than the latter package.  What exactly is the
behaviour you're observing?

p.




