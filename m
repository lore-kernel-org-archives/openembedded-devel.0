Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>)
	id 1L5Pfc-0003xg-36; Wed, 26 Nov 2008 20:03:28 +0100
Received: from 79-71-239-31.dynamic.dsl.as9105.com ([79.71.239.31]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>)
	id 1L5Pch-0005eu-Gz; Wed, 26 Nov 2008 19:00:27 +0000
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <ggk56j$dtn$1@ger.gmane.org>
References: <ggjnpc$qhg$1@ger.gmane.org>
	<200811261755.53197.mickey@vanille-media.de>
	<1227721214.19934.33.camel@mill.internal.reciva.com>
	<ggk26f$30a$1@ger.gmane.org>
	<1227722637.19934.36.camel@mill.internal.reciva.com>
	<ggk56j$dtn$1@ger.gmane.org>
Date: Wed, 26 Nov 2008 19:00:26 +0000
Message-Id: <1227726026.23391.245.camel@lenovo.internal.reciva.com>
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
X-List-Received-Date: Wed, 26 Nov 2008 19:03:35 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2008-11-26 at 19:40 +0100, Koen Kooi wrote:
> if fso-foo has
> 
> Conflicts: foo
> Replaces: foo
> 
> but not
> 
> Provides: foo
> 
> opkg will always pick fso-foo when it's present in deploy, while you 
> want an image with foo.

Are you sure that your package fso-foo really wants to Conflict: with
and Replace: foo without also Providing: it?  Although I don't think
there is any reason why this is inherently illegitimate, it is certainly
something of a fringe case and my first suspicion would be that this is
a packaging bug which is just happening to tickle an opkg bug and/or
misfeature.  I suspect opkg is taking a slightly harder line on this,
deciding that lack of Provides: in this case must certainly be a
packaging error, and proceeding as if that Provides: was present.  It's
debatable whether this is a desirable thing for it to be doing but,
irrespective of that, at least a part of the right answer is probably to
fix the offending packages.

p.




