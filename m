Received: from emailgateway.hillcrestlabs.com ([12.173.51.132])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Chris.Conroy@hillcrestlabs.com>) id 1NBV6m-00044C-Fk
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Nov 2009 16:09:15 +0100
X-AuditID: 0a1e000a-b7b8cae000000d7b-ff-4b06b0c2a8a9
From: Chris Conroy <Chris.Conroy@hillcrestlabs.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <alpine.LFD.2.00.0911192050230.11568@localhost>
References: <alpine.LFD.2.00.0911192050230.11568@localhost>
Date: Fri, 20 Nov 2009 10:07:26 -0500
Message-Id: <1258729646.8426.2.camel@conroy-linux>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.1 
X-Brightmail-Tracker: AAAAAA==
X-SA-Exim-Connect-IP: 12.173.51.132
X-SA-Exim-Mail-From: Chris.Conroy@hillcrestlabs.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: adding an updated package, and when it's safe to do so?
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
X-List-Received-Date: Fri, 20 Nov 2009 15:09:15 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2009-11-19 at 20:54 -0500, Robert P. J. Day wrote:
> a couple silly questions while i prep a guile package update.
> 
> 1) if a newer package is added under recipes, i'm assuming that it's
> the newest version of the package that will be used for a build,
> unless a PREFERRED_VERSION directive is used, correct?
> 
> 2) at what point can i start to add that new package info so that a
> current build doesn't pick it up?  once all the .bb files are parsed
> and the package builds are underway, is that it for any further
> consultation of the .bb files?

I'm not sure if I'm understanding your problem correctly, but to me it
sounds like you just want to set DEFAULT_PREFERENCE="-1" in the recipe
you're concerned about.

--Chris


