Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1O8MBx-0001zZ-E5
	for openembedded-devel@lists.openembedded.org;
	Sun, 02 May 2010 01:33:52 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o41NU5jc027326
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 2 May 2010 00:30:05 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 27236-02 for <openembedded-devel@lists.openembedded.org>;
	Sun,  2 May 2010 00:30:01 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o41NTwEx027314
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 2 May 2010 00:29:58 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1271090799.14344.19.camel@localhost.localdomain>
References: <1270135981.4993.128.camel@rex>  <hpum4g$18m$1@dough.gmane.org>
	<1271087957.29304.86.camel@trini-m4400>
	<1271090799.14344.19.camel@localhost.localdomain>
Date: Sun, 02 May 2010 00:29:55 +0100
Message-ID: <1272756595.30647.1942.camel@rex>
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
Subject: Re: Request for branch merge
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
X-List-Received-Date: Sat, 01 May 2010 23:33:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2010-04-12 at 17:46 +0100, Joshua Lock wrote:
> On Mon, 2010-04-12 at 08:59 -0700, Tom Rini wrote:
> > On Mon, 2010-04-12 at 10:37 +0200, Koen Kooi wrote:
>  > Joshuas last 3 commits to poky seem to fix Toms issue with binconfig and
> > > my issue with chrpath, which only leaves the cross staging lamangler
> > > stuff to get fixed.
> > 
> > Actually (and I'm OK with binconfig stuff being broken in the first
> > merge) the problem with binconfig junk isn't the file contents, but the
> > file location.  staging-target-pkg will contain
> > staging/<host>/usr/bin/<target>/foo-config.  Which means using pstaging
> > for a target pkg built on 32bit Linux fails when used on 64bit Linux.
> > Not that I wouldn't mind seeing the binconfig stuff die, just saying
> > it's a problem today :)
> 
> Ah, hmm... yes. That is a problem.
> 
> FWIW I don't think you'll get any arguments from the Poky team where the
> binconfig stuff to suffer an untimely demise!

FWIW, Poky has had some interesting commits recently that address Tom's
issue above from Josh.

Cheers,

Richard




