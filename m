Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1OujwW-0003QB-86
	for openembedded-devel@lists.openembedded.org;
	Sun, 12 Sep 2010 12:37:54 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o8CAb60m011627
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Sep 2010 11:37:06 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 11549-02 for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Sep 2010 11:37:02 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o8CAaxng011621
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Sep 2010 11:37:00 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1284288866.4698.81.camel@lenovo.internal.reciva.com>
References: <4C8C9C66.7030006@freyther.de>
	<1284288866.4698.81.camel@lenovo.internal.reciva.com>
Date: Sun, 12 Sep 2010 11:36:57 +0100
Message-ID: <1284287817.18010.7488.camel@rex>
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
Subject: Re: [PATCH] sanity.bbclass: Check for the presennce of libc.a
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
X-List-Received-Date: Sun, 12 Sep 2010 10:37:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2010-09-12 at 11:54 +0100, Phil Blundell wrote:
> On Sun, 2010-09-12 at 17:24 +0800, Holger Freyther wrote:
> > The insmod.static binary links statically and requires the libc.a
> > to be present. On Fedora glibc-static is not installed by default
> > when installing development headers. Warn the user that he needs
> > to have that installed.
> 
> Why are we building insmod.static for native anyway?  That seems a bit
> silly.

It is. FWIW, Poky now patches the modutils-cross recipe so it only
builds the dynamically linked version to resolve exactly this issue.

Cheers,

Richard



