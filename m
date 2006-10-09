Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <rpurdie@rpsys.net>) id 1GWr3W-0005M6-Jy
	for openembedded-devel@openembedded.org; Mon, 09 Oct 2006 11:04:14 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.6) with ESMTP id k998w84E008597
	for <openembedded-devel@openembedded.org>;
	Mon, 9 Oct 2006 09:58:08 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08504-03 for <openembedded-devel@openembedded.org>;
	Mon,  9 Oct 2006 09:58:04 +0100 (BST)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.6) with ESMTP id k998w2XB008584
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Mon, 9 Oct 2006 09:58:02 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@openembedded.org>
In-Reply-To: <74d0deb30610090140g40716743k35a2cddb555018d4@mail.gmail.com>
References: <45296EB8.7070704@dominion.kabel.utwente.nl>
	<1160382102.5741.19.camel@localhost.localdomain>
	<74d0deb30610090140g40716743k35a2cddb555018d4@mail.gmail.com>
Date: Mon, 09 Oct 2006 09:58:01 +0100
Message-Id: <1160384282.5741.22.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [RFC] Removing MAINTAINER field from recipes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Oct 2006 09:04:14 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2006-10-09 at 10:40 +0200, pHilipp Zabel wrote:
> On 10/9/06, Richard Purdie <rpurdie@rpsys.net> wrote:
> > MAINTAINER would still exists but would become a distro variable so
> > distros would still use it to set the maintainer of distributed packages
> > but since this is usually a distro contact, setting it in a distro.conf
> > file shouldn't be a problem (and it can be overridden on a per package
> > basis MAINTAINER_pn-linux-opnzaurus = "").
> 
> Does this mean we'll have additional per-distro .conf files
> which contain hundreds of MAINTAINER_pn-foo variables?

That is something for a distro to decide. In most cases, I see a distro
wanting a single point of contact so whilst it would be possible, I
don't see it happening. All current distros try and setup a single point
of contact as far as I know.

Richard



