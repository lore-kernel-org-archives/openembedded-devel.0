Received: from static.26.116.47.78.clients.your-server.de ([78.47.116.26]
	helo=phalanx.drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1O32zc-0002kf-WF
	for openembedded-devel@lists.openembedded.org;
	Sat, 17 Apr 2010 10:03:10 +0200
Received: from [192.168.1.5] (e180136002.adsl.alicedsl.de [85.180.136.2])
	by phalanx.drlauer-research.com (Postfix) with ESMTP id 46F2C58411F
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Apr 2010 10:03:32 +0200 (CEST)
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20100417025201.GA20701@denix.org>
References: <1271471763-28331-1-git-send-email-denis@denix.org>
	<20100417025201.GA20701@denix.org>
Organization: Vanille-Media
Date: Sat, 17 Apr 2010 09:59:35 +0200
Message-ID: <1271491175.6320.7.camel@andromeda>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 78.47.116.26
X-SA-Exim-Mail-From: mickey@vanille-media.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] kill xorg-headers-native
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
X-List-Received-Date: Sat, 17 Apr 2010 08:03:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Am Freitag, den 16.04.2010, 22:52 -0400 schrieb Denys Dmytriyenko:
> On Fri, Apr 16, 2010 at 10:36:03PM -0400, Denys Dmytriyenko wrote:
> > Update the combined headers from the following packages:
> > * xproto-7.0.16
> > * libx11-1.3.3
> > * libxau-1.0.5
> > * libxdmcp-1.0.3
> > * libxt-1.0.8
> 
> And now my RFC - should we just kill xorg-headers-native completely and 
> replace it with something like:
> 
> DEPENDS = "xproto-native libx11-native libxau-native libxdmcp-native libxt-native"

Sure thing. IIRC back then I have added those headers as a temporary
workaround to facilitate building on headless machines. Feel free to
kill it with a better solution.

-- 
:M:



