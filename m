Received: from [93.97.175.187] (helo=dan.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1MwBSP-0000tR-Af
	for openembedded-devel@openembedded.org; Fri, 09 Oct 2009 11:08:16 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	n9994sRJ026709 for <openembedded-devel@openembedded.org>;
	Fri, 9 Oct 2009 10:04:54 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id XiIhC97y3gpN for <openembedded-devel@openembedded.org>;
	Fri,  9 Oct 2009 10:04:54 +0100 (BST)
Received: from [192.168.1.3] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	n9994oSk026665
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-devel@openembedded.org>;
	Fri, 9 Oct 2009 10:04:52 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <be7a9f3d0910060823y6f3f0ee7n122c8405a2d31390@mail.gmail.com>
References: <20091006034646.GA22854@denix.org>
	<be7a9f3d0910060823y6f3f0ee7n122c8405a2d31390@mail.gmail.com>
Date: Fri, 09 Oct 2009 10:03:29 +0100
Message-Id: <1255079009.1184.137.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-SA-Exim-Connect-IP: 93.97.175.187
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [RFC] Version sorting in BitBake
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
X-List-Received-Date: Fri, 09 Oct 2009 09:08:16 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2009-10-06 at 12:23 -0300, Otavio Salvador wrote:
> Hello Denys,
> 
> On Tue, Oct 6, 2009 at 12:46 AM, Denys Dmytriyenko <denis@denix.org> wrote:
> [...]
> > PV1 = "2.6.29-${PR}+gitr${SRCREV}"
> > PV2 = "2.6.29+2.6.30-rc5-${PR}+gitr${SRCREV}"
> > PV3 = "2.6.30-${PR}+gitr${SRCREV}"
> >
> > That still works with opkg, as ipkg-compare-versions sorts above PVs as
> > expected - PV1 < PV2 < PV3
> >
> > But BitBake now has this flaw and sorts like this: PV2 < PV1 < PV3
> [...]
> 
> Please send the patch for people to review and would be nice to have
> it commited since many of us could have been using non-required
> overrides.
> 
> Thanks by founding and _fixing_ it :-D

This worries me quite a bit as it means bitbake's version comparison
function is broken. Is there a python version comparison function
somewhere else we can compare bitbake's with to make sure there aren't
any other glitches we have?

Bitbake's and opkg's version handling is meant to model Debian for
reference.

Cheers,

Richard




