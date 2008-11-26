Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>)
	id 1L5Kx2-0004Oh-1D; Wed, 26 Nov 2008 15:01:09 +0100
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>)
	id 1L5Kty-0004Py-Va; Wed, 26 Nov 2008 13:57:59 +0000
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <pb@reciva.com>)
	id 1L5Ktw-0003sd-Bs; Wed, 26 Nov 2008 13:57:56 +0000
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <ggjfc5$s77$1@ger.gmane.org>
References: <gghjh1$dg1$1@ger.gmane.org>
	<200811252242.05674.openembedded@haerwu.biz>	<gghsc8$jot$1@ger.gmane.org>
	<200811261011.09918.openembedded@haerwu.biz>	<ggjbfl$fgh$1@ger.gmane.org>
	<1227699097.15601.28.camel@mill.internal.reciva.com>
	<ggjfc5$s77$1@ger.gmane.org>
Date: Wed, 26 Nov 2008 13:57:55 +0000
Message-Id: <1227707875.15601.41.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Cc: openembedded-devel@openembedded.org
Subject: Re: [RFC] LICENSE fields and packages
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
X-List-Received-Date: Wed, 26 Nov 2008 14:01:09 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2008-11-26 at 13:27 +0100, Koen Kooi wrote:
> On 26-11-08 12:31, Phil Blundell wrote:
> > On Wed, 2008-11-26 at 12:21 +0100, Koen Kooi wrote:
> >>> ${PN}-license package on which all entries from PACKAGES will RDEPEND?
> >> Any objections to doing it this way till we have a proper bbclass?
> >
> > I think this is a fine idea.  It should be a DISTRO opt-in choice, of
> > course, but I can't see any reason not to provide the facility.
> 
> My idea was to make it opt-in on a per package basis since DISTROs can 
> include base-files-doc for the most commit licenses (GPL, MIT, BSD, etc).

Hm, right.  I guess the selection should be both per-package and
per-DISTRO.

How about allowing the DISTRO to specify a regexp for the licences that
it "knows about"; any package for which ${LICENSE} doesn't match the
regexp will get the ${PN}-license thing.  The default regexp would be
set to ".*" in bitbake.conf, in order to preserve the current behaviour
of not emitting any ${PN}-license; DISTROs that want to make use of the
new feature can set it to whatever they like.

p.




