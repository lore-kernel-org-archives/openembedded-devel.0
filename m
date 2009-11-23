Received: from emailgateway.hillcrestlabs.com ([12.173.51.132])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Chris.Conroy@hillcrestlabs.com>) id 1NCbA0-0004Fg-53
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Nov 2009 16:49:07 +0100
X-AuditID: 0a1e000a-b7b8cae000000d7b-67-4b0aae97207e
From: Chris Conroy <Chris.Conroy@hillcrestlabs.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20091122190547.GC3349@jama>
References: <20091115163618.GA3317@jama> <hdr31n$8b0$1@ger.gmane.org>
	<1258364356.5799.94.camel@dax.rpnet.com> <20091122190547.GC3349@jama>
Date: Mon, 23 Nov 2009 10:47:06 -0500
Message-Id: <1258991226.8426.37.camel@conroy-linux>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.1 
X-Brightmail-Tracker: AAAAAA==
X-SA-Exim-Connect-IP: 12.173.51.132
X-SA-Exim-Mail-From: Chris.Conroy@hillcrestlabs.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: SRCPV migration - How SRCPV works!
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
X-List-Received-Date: Mon, 23 Nov 2009 15:49:07 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, 2009-11-22 at 20:05 +0100, Martin Jansa wrote:
> Problem with this is that it downloads whole git repository (huge load
> on git repository servers) just to count how many revisions are in
> some
> branch before your revision.
> 
> That's what it do now (without SRCPV merge) for every recipe you set
> to
> AUTOREV. And this is done during recipe parsing phase (because we need
> to know PV string for every recipe).
> 
> We all agreed that upstream server maintainers won't like us this way.

Forgive me since before this thread I have not been following the SRCPV
stuff terribly closely, but this seems to be like a lot of work to solve
a different sort of use case.

If you are a distro that is tracking untagged, unreleased git revisions
from an upstream tree, then do you really care if you have to clone the
tree once per build machine? You're probably already doing this anyways
if you are using a package in this fashion. Doing a full clone on every
single build would obviously be a terrible thing, but as long as this
gets cached it doesn't seem like an awful cost to me.

And, if you have many build users in your distro, then you could easily
fix this by hosting your own mirrored git server.

I'm probably ignorant of the real use case, but just in case I'm not,
there's my two cents.

--Chris


