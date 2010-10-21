Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1P8sYd-0005Gr-I5
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Oct 2010 12:40:18 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o9LAd45i001468
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Oct 2010 11:39:04 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01187-07 for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Oct 2010 11:39:00 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o9LActgH001462
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Oct 2010 11:38:56 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTi=74mwvxLLwCjEhV3OMCyOdpfRZeU0Z-bf6TM+P@mail.gmail.com>
References: <i9p1d0$7q4$1@dough.gmane.org> <4CC00D57.4070601@xora.org.uk>
	<i9p2uf$f40$1@dough.gmane.org> <4CC0104B.4070108@xora.org.uk>
	<AANLkTi=74mwvxLLwCjEhV3OMCyOdpfRZeU0Z-bf6TM+P@mail.gmail.com>
Date: Thu, 21 Oct 2010 11:38:44 +0100
Message-ID: <1287657524.16386.437.camel@rex>
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
X-List-Received-Date: Thu, 21 Oct 2010 10:40:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2010-10-21 at 12:20 +0200, Frans Meulenbroeks wrote:
> 2010/10/21 Graeme Gregory <dp@xora.org.uk>:
> 
> >>
> > Such a pity git doesnt have increasing rev numbers, a cool adition would
> > be a flag in layer that showed the last rev of core it was tested with.
> >
> > Layer was tested with core 1 but core is now 999 would give an
> > indication on drift between layers and core.
> >
> > Graeme
> 
> Triggered by this (and apologies if I am drifting off-topic).
> It would be nice if with amend.inc you could specify the PR of the
> underlying recipe that this amend is for (and get a warning or error
> if there is a mismatch)

For reference poky now has the PRINC = "x" variable which increases the
base PR by x, assuming a standard format PR value. This is intended for
use in .bbappend files.

Cheers,

Richard





