Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1P8siE-0004X2-QU
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Oct 2010 12:49:35 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o9LAn0dL001572
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Oct 2010 11:49:00 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01187-09 for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Oct 2010 11:48:56 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o9LAmr8L001566
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Oct 2010 11:48:53 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <i9p2uf$f40$1@dough.gmane.org>
References: <i9p1d0$7q4$1@dough.gmane.org> <4CC00D57.4070601@xora.org.uk>
	<i9p2uf$f40$1@dough.gmane.org>
Date: Thu, 21 Oct 2010 11:48:42 +0100
Message-ID: <1287658122.16386.444.camel@rex>
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
Subject: Re: [RFC] turning conf/machine into a set of bblayers
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
X-List-Received-Date: Thu, 21 Oct 2010 10:49:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2010-10-21 at 11:59 +0200, Koen Kooi wrote:
> The downside of amend.inc is the de-sync when the recipe gets updated,
> but not the overlay. You run the risk of using a version without the
> overrides that way.
> Maybe some fancy scripts, (pre-)commit hooks or just old fanishioned
> review on the ml could solve those type of issues.
> 
> How do file overrides like
> recipes/netbase/netbase/beagleboard/interfaces get handled in a
> bblayer/amend.inc world?

Taking a poky example of formfactor which is a very similar situation,
create a .bbappend file:

http://git.pokylinux.org/cgit/cgit.cgi/poky/tree/meta-emenlow/packages/formfactor/formfactor_0.0.bbappend

with the contents of:

FILESEXTRAPATHS := "${THISDIR}/${PN}"
PRINC = "1"

and place the appropriate files underneath as usual:

http://git.pokylinux.org/cgit/cgit.cgi/poky/tree/meta-emenlow/packages/formfactor/formfactor/emenlow/machconfig

We should make it a hard fail if a .bbappend is found with no
corresponding .bb file, I'm not sure if that happens or not at the
moment.

I've also been thinking a lot about FILESPATH and have been thinking
that making the list of defaults small and having recipes specify if
they use overrides would be a good idea.

E.g. so above you'd have to specify:

"${THISDIR}/${PN}/${MACHINE}" explicitly.

Cheers,

Richard







