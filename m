Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1OUSEU-0005Lp-1S
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Jul 2010 00:27:47 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1OUS9s-00033a-2g from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Jul 2010 15:23:00 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Thu, 1 Jul 2010 15:22:59 -0700
Received: from [172.30.80.201] ([172.30.80.201]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 1 Jul 2010 16:22:58 -0600
Message-ID: <4C2D153E.1040608@mentor.com>
Date: Thu, 01 Jul 2010 15:22:54 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20100701172428.3b2ac88e@xora-desktop.xora.org.uk>
In-Reply-To: <20100701172428.3b2ac88e@xora-desktop.xora.org.uk>
X-OriginalArrivalTime: 01 Jul 2010 22:22:59.0050 (UTC)
	FILETIME=[F60E04A0:01CB196B]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: USE flags mumbling
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
X-List-Received-Date: Thu, 01 Jul 2010 22:27:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Graeme Gregory wrote:
> We already have BBCLASSEXTENDS which modifies ${PN} of a package and
> can use overrides to change behaviors of recipes.
> 
> Maybe USE flags could be implemented in a similar fashing.
> 
> DISTRO_USE = "nossl nox11"
> 
> EXTRA_OECONF_append_use-nossl = "--disable-ssl"
> 
> ${PN} of the recipe becomes XXXX-nossl
> 
> Thoughts?

First we'd have to have a discussion on what the default should be and 
get agreement everywhere (ssl? x11? bluetooth (bluez3? bluez4?)? alsa?) 
on the whole raft of things that it would be nice to globally turn off 
or on.  Then we have to know which ones a given recipe actually made use 
of as opkg-nox11 is quite silly but conversely it'd be quite nice to 
have in autotools.bbclass the magic to always pass --disable-x11 (since 
it sure feels like everyone uses the same enable/disable switch finally).

Second, we also need a raft of, and perhaps a much easier way to, add 
binary package output virtuals.

I wonder, and I have to admit to having no real gentoo background here, 
how do they solve this problem?  Did they invent their own package 
format and add another field that consists of use flags?  That'd make 
some stuff a lot easier, but making deb/rpm get that mapping somehow 
seems hard at first.

-- 
Tom Rini
Mentor Graphics Corporation


