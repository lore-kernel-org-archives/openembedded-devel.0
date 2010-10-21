Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1P8sWR-0004Pn-Vh
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Oct 2010 12:37:25 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o9LAan5B001459
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Oct 2010 11:36:49 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01096-08 for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Oct 2010 11:36:45 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o9LAaipG001453
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Oct 2010 11:36:44 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <i9p1d0$7q4$1@dough.gmane.org>
References: <i9p1d0$7q4$1@dough.gmane.org>
Date: Thu, 21 Oct 2010 11:36:32 +0100
Message-ID: <1287657392.16386.435.camel@rex>
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
X-List-Received-Date: Thu, 21 Oct 2010 10:37:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2010-10-21 at 11:33 +0200, Koen Kooi wrote:
> Recipes/linux is a mess and recipes/u-boot is as well. It would be a
> nice topic for OEDEM to see if we discuss switching to a poky BSP model.
> It would boil down to:
> 
> 1 base bblayer with shared files:
> * conf/machine/include
> * recipes/linux/*.inc
> 
> 1 bblayer per machine or SOC_FAMILY containing:
> * machine.conf
> * first and second stage bootloaders
> * kernel

In addition you'll most likely need some machine config in the form
of .bbappend files for things like base-files, netbase, xorg-config,
formfactor (in Poky's case).

> So, what are peoples thoughts on this? I haven't thought this through
> myself, so feel free to point out any show stoppers.

Poky is certainly heading in this direction and I've worked to ensure we
have all the needed support in the form of .bbappend, the layer.conf
files and so forth. If for whatever reason there are any other
limitations, we should look at fixing that.

> But any bblayer style split would benefit from OE being a collection of
> git submodules instead of a monolithic tree[1].
>
> [1] Provided git submodules stop sucking so hard in future git versions

If they stopped sucking, maybe...

Cheers,

Richard



