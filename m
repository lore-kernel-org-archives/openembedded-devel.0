Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1JZwlc-0002bE-2l
	for openembedded-devel@openembedded.org; Fri, 14 Mar 2008 00:23:23 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m2DNL83E022144
	for <openembedded-devel@openembedded.org>; Thu, 13 Mar 2008 23:21:08 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21742-10 for <openembedded-devel@openembedded.org>;
	Thu, 13 Mar 2008 23:21:02 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m2DNL0bW022134
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>; Thu, 13 Mar 2008 23:21:00 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <frc8h9$auq$1@ger.gmane.org>
References: <1205444019.4547.192.camel@dax.rpnet.com>
	<frc8h9$auq$1@ger.gmane.org>
Date: Thu, 13 Mar 2008 23:21:02 +0000
Message-Id: <1205450462.4547.232.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 194.106.48.114
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Packaged Staging - 'Current' Status
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Mar 2008 23:23:25 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2008-03-13 at 23:06 +0100, Koen Kooi wrote:
> Richard Purdie schreef:
> | As has been mentioned, I'm working on integrating packaged staging and
> | its about time I mentioned the current status. I say 'current' as it
> | applies to what I have offline, not what's in OE.dev.
> 
> I have a few questions that I can't deduce an answer to from your
> description:
> 
> ~ * How does packaged-staging handle switching ANGSTROM_MODE?
> 
> If the packaged-staging-packages (p-s-ps) get seperated by target tuple
> it should be ok, and if the p-s-ps dir can be overriden (e.g.
> PS_STAGING_DIR = foo/bar/${ANGSTROM_MODE}) we should be safe as well.

To lift code from my copy of the .bbclass:

PSTAGE_PKGVERSION = "${PV}-${PR}"
PSTAGE_PKGARCH    = "${MULTIMACH_ARCH}"
PSTAGE_EXTRAPATH  = ""
PSTAGE_PKGPATH    = "${DISTRO}${PSTAGE_EXTRAPATH}"
PSTAGE_PKGNAME 	  = "staging-${PN}_${PSTAGE_PKGVERSION}_${PSTAGE_PKGARCH}.ipk"
PSTAGE_PKG        = "${DEPLOY_DIR_PSTAGE}/${PSTAGE_PKGPATH}/${PSTAGE_PKGNAME}"

I'm 100% sure this isn't right yet :). The intent of PSTAGE_EXTRAPATH is
extra things needed can be injected by the distros. -cross and -native
are handled by the class itself appending the tmpdir path into that
variable (with / changed to -).

So yes, overrides are available but if we can make it work out the box
for everyone I will do that.

> ~ * do we have 'one' staging dir as we have now, or can each package have
> its own staging dir built from its DEPENDS?
>
> I know that this largely depends on how fast/well we debug sysroot
> stuff, but I'm curious how this is in your current design.

One staging dir at the moment. Multiple staging directories are a
headache for another time :).

> ~ * will p-s.bbclass be package format agnostic, or are we going to
> insist on opkg?
> 
> I know from experience that making it format agnostic isn't hard, only
> tedious, but most of all subject to combinatorial explosion for
> unit-testing. It also doesn't really matter, since p-s-ps are orthogonal
> to the ones in deploy, but I can image OE-newbies freaking out over this.

Good question. We're actually using so little of the package managers
features I'm nearly tempted to write something custom in python. The
benefit of that would be that no -native packages were needed as special
cases.

The current plan is to use ipkg/opkg and get something working, then
consider optimisations from there. I might find ipkg.py and rip that
apart...

Cheers,

Richard




