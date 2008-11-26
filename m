Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1L5OQ0-00057C-3O
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Nov 2008 18:43:16 +0100
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1L5ON4-0003Hr-R5
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Nov 2008 17:40:16 +0000
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <pb@reciva.com>) id 1L5ON4-0000IH-KY
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Nov 2008 17:40:14 +0000
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200811261755.53197.mickey@vanille-media.de>
References: <ggjnpc$qhg$1@ger.gmane.org>
	<200811261755.53197.mickey@vanille-media.de>
Date: Wed, 26 Nov 2008 17:40:14 +0000
Message-Id: <1227721214.19934.33.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
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
X-List-Received-Date: Wed, 26 Nov 2008 17:43:16 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2008-11-26 at 17:55 +0100, Michael 'Mickey' Lauer wrote:
> Sounds good overall, however there is still the problem with things like e.g. 
> gpsd. If you remove fso-gpsd's RPROVIDES=gspd, then anything that rdepends on 
> gpsd will bring us gpsd back into the [fso-]image, hence we have a conflict 
> again.

It sounds like you have a namespacing problem here.  If there are
packages which need to depend on some abstract gpsd API or ABI, they
should probably be Depending on "virtual/gpsd" or the like and this
virtual package should be Provided by both gpsd and fso-gpsd.

Semi-virtual packages (i.e. a given name existing both as a concrete
package and as a Provides: in some other package) basically do not work:
this is partly an implementation problem in opkg but there is also a
fundamentally insoluble problem with versioning.  About the only time
that adding a Provides: for the same name as an existing concrete
package is the right thing to do, is when one package completely
supercedes each other; in this case you would generally also say that
the new one Replaces: and Conflicts: with the old one.

p.




