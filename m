Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1NsLeu-0007G9-Ed
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Mar 2010 20:45:33 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o2IJgRCE007786
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Mar 2010 19:42:27 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 07346-10 for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Mar 2010 19:42:23 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o2IJgJas007780
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Mar 2010 19:42:19 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <hntp31$a2q$1@dough.gmane.org>
References: <4BA1825F.9080405@tait.co.nz>
	<201003180437.10542.holger+oe@freyther.de>
	<1268933342.8697.43.camel@rex> <hntp31$a2q$1@dough.gmane.org>
Date: Thu, 18 Mar 2010 19:42:17 +0000
Message-ID: <1268941337.8697.69.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 93.97.173.237
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=AWL,BAYES_00,RDNS_DYNAMIC,
	TVD_RCVD_IP autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/2] Renamed prefix_native, bindir_native, etc using camelCaps
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
X-List-Received-Date: Thu, 18 Mar 2010 19:45:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2010-03-18 at 18:49 +0100, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> On 18-03-10 18:29, Richard Purdie wrote:
> > On Thu, 2010-03-18 at 04:37 +0100, Holger Hans Peter Freyther wrote:
> >> On Thursday 18 March 2010 02:31:11 Douglas Royds wrote:
> >>>     - Avoids clashing with the machine override when MACHINE=native
> >>>     - bindir_cross similarly renamed for consistency
> >>
> >> Thank you for that much work. I think we established the usage of '-' instead 
> >> of '_' to avoid clashes with the override detection though.
> > 
> > I just noticed this problem. It makes me very very nervous to introduce
> > yet another variable naming convention, particularly one we don't use
> > anywhere else :/.
> > 
> > Might it be simpler to rename the native machine? Using "native" in the
> > override namespace is asking for trouble :(.
> 
> rename it to 'host'?

Its still not a good name to have in overrides. We really need something
meaningful but not generic e.g. "localmachine"

Cheers,

Richard






