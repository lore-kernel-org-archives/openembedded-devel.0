Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1PfWHX-0001QD-0R
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Jan 2011 12:32:55 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 19 Jan 2011 03:31:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.60,343,1291622400"; d="scan'208";a="594417057"
Received: from unknown (HELO [10.255.16.117]) ([10.255.16.117])
	by orsmga002.jf.intel.com with ESMTP; 19 Jan 2011 03:31:08 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTi=8uKvujKLqG2cw3h3gLmmcU=KNfdmSwB5imfsH@mail.gmail.com>
References: <1295027350.14388.6527.camel@rex>
	<AANLkTi=QXykmerKTJJgCNDbqSE18_3Jhqj1utKmf1Ynw@mail.gmail.com>
	<4D353F81.50301@xora.org.uk>
	<AANLkTi=WOr_395Tya3GOhyLpg1oj9stLxSWdgo--uAhz@mail.gmail.com>
	<4D35C5C3.60205@mentor.com> <ih4s84$gbj$1@dough.gmane.org>
	<4D35FC8B.1090404@mentor.com>
	<AANLkTinHP=9S6tAFdiWHfk8zZi0MhvfNTgW71Ugx++9w@mail.gmail.com>
	<AANLkTi=aMnnfnaQZNLpZW_8MUWq_jckou9tr_bA8NBY6@mail.gmail.com>
	<4D36A64E.9060804@xora.org.uk>
	<AANLkTi=8uKvujKLqG2cw3h3gLmmcU=KNfdmSwB5imfsH@mail.gmail.com>
Date: Wed, 19 Jan 2011 11:31:02 +0000
Message-ID: <1295436662.2540.14.camel@scimitar>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.1 (2.32.1-1.fc14) 
Subject: Re: Yocto Project and OE - Where now?
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
X-List-Received-Date: Wed, 19 Jan 2011 11:32:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-01-19 at 10:12 +0100, Frans Meulenbroeks wrote:
> 2011/1/19 Graeme Gregory <dp@xora.org.uk>:
> 
> >> I wholehearthy agree with the proposal that it is left to the package
> >> maintainers discretion.
> >> Wrt the GPLv2+ version. I suggest to reflect this in the name.
> >> E.g. you could have samba and samba-gplv2 (or perhaps samba-gplv2 and
> >> samba-gplv3). Then it immediately becomes obvious why there are two
> >> versions.
> >> Similarly with versions that became a lot fatter over time (which imho
> >> is a good reason to keep the old version).
> > I am totally against this idea, it just makes a total mess of the
> > namespace. We have the ability to put comments in bitbake files use it.
> 
> I don't think there are that many recipes for which this is relevant,
> so the namespace clutter is limited.
> Comments in bb files may work equally well. Problem is that those
> comments are not written in the files.

Surely that what the LICENSE field in the metadata is for?

Aside: In Poky we have various features to ensure recipes have license
information included, and functionality to blacklist packages of a
certain license - these will doubtless be merged into oe-core too.

Cheers,
Joshua
-- 
Joshua Lock
        Intel Open Source Technology Centre



