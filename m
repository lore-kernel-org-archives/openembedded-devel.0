Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1OUfoS-00038S-1n
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Jul 2010 14:57:49 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o62Cr30i001653
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 2 Jul 2010 13:53:03 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01287-07 for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Jul 2010 13:52:59 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o62CquQW001645
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 2 Jul 2010 13:52:57 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1278026396.8213.51.camel@utx.utx.cz>
References: <1278021938.8213.7.camel@utx.utx.cz>
	<4C2D198E.6010603@mentor.com>  <1278026396.8213.51.camel@utx.utx.cz>
Date: Fri, 02 Jul 2010 13:52:53 +0100
Message-ID: <1278075173.30247.531.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 93.97.173.237
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=AWL,BAYES_00,RDNS_DYNAMIC,
	TVD_RCVD_IP autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: invalid removal of rpath from native binaries during installation or staging
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
X-List-Received-Date: Fri, 02 Jul 2010 12:57:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2010-07-02 at 01:19 +0200, Stanislav Brabec wrote:
> Tom Rini wrote:
> 
> > Can you use readelf -d on your perl?  The whole point of the relative 
> > path calculation that relocatable.bbclass does is to fix the hard cases 
> > like perl.   Thanks!
> > 
> 
> I found the problem:
> 
> The runtime expansion of $ORIGIN works only if /proc is mounted!
> 
> My build environment is a minimal openSUSE 11.2 x86_64 subset inside
> chroot with no /proc, /sys, and /dev with null zero and few other static
> items.
> 
> Not having /proc is an advantage in most cases (cross configure cannot
> check host system), but breaks in this case.
> 
> Maybe it would be nice to allow to configure to not inherit relocatable
> in native.bbclass for people who don't want to mount /proc.

As we try to improve staging, we're going to be working on the
assumption all packages are relocatable. If we allow disabling of this
it will break various assumptions in the code. I'd therefore suggest
you're free to do this locally but it shouldn't be an easily available
option. Building without /proc mounted is a rather specialist usecase. 

If it really worries you, mount /proc somewhere else and symlink the
bare minimum needed.

Cheers,

Richard



