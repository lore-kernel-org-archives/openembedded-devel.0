Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1P7mna-00052K-K9
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Oct 2010 12:18:44 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o9IAI1aB013347
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Oct 2010 11:18:01 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 13251-02 for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Oct 2010 11:17:57 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o9IAHsMp013341
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Oct 2010 11:17:55 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <i9gshu$8r0$2@dough.gmane.org>
References: <20101017211540.GB3324@jama>  <i9gshu$8r0$2@dough.gmane.org>
Date: Mon, 18 Oct 2010 11:17:52 +0100
Message-ID: <1287397072.1720.17.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 93.97.173.237
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=AWL,BAYES_00,RDNS_DYNAMIC,
	TVD_RCVD_IP autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] do we really need all OVERRIDES in FILESPATH?
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
X-List-Received-Date: Mon, 18 Oct 2010 10:18:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2010-10-18 at 09:21 +0200, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> On 17-10-10 23:15, Martin Jansa wrote:
> > Currently
> > bitbake -e -b xserver-xorg-conf_0.1.bb | grep ^FILESPATH= | sed "s/:/\n/g" | wc -l
> > shows 65 directories where file:// from SRC_URI can be found.
> > 
> > base_do_unpack is looking for first directory where requested file
> > exists. Most files are IMHO found in FILESPATHPKG PN, files or P
> > (without an override used)
> > 
> > Number of directories tried before
> > PN:    38
> > files: 51
> > P:     25
> > 
> > I see many recipes really using that MACHINE or DISTRO is in FILESPATH,
> > few users of TARGET_ARCH and quick find/grep doesn't show any users of 
> > other OVERRIDES in FILESPATH.
> > 
> > BTW: ie initscripts have initscripts/files/arm/alignment.sh but that's only
> > alignment.sh and SRC_URI_append_arm = " file://alignment.sh" would work
> > ok even without arm in FILESPATH.
> > 
> > What about using only ${TARGET_ARCH}:${DISTRO}:${MACHINE} in FILESPATH
> > instead all OVERRIDES?
> 
> At least I additionally need BASE_PACKAGE_ARCH and SOC_FAMILY in it and
> sometimes libc-$LIBC.

I have to admit, the structure of FILESPATH is a little unwieldy to me.
I'd propose that we should have a small set of defaults like ${BPN} and
${BPN}-${PV} and if any recipe wants more than this, it should have a
variable it can append a list to.

I'd also suggest "files" should probably be deprecated in favour of BPN.

It becomes obvious how horrible the current structure is when you try
and use .bbappend and need to add some extra directory to the search
path.

Cheers,

Richard






