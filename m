Received: from static.26.116.47.78.clients.your-server.de ([78.47.116.26]
	helo=phalanx.drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1O0BYo-0007QO-Es
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Apr 2010 12:35:44 +0200
Received: from [192.168.1.5] (e180129112.adsl.alicedsl.de [85.180.129.112])
	by phalanx.drlauer-research.com (Postfix) with ESMTP id 0D2E8584162
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Apr 2010 12:35:22 +0200 (CEST)
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <hpmma4$s8u$2@dough.gmane.org>
References: <20100408162117.e7638f69.ospite@studenti.unina.it>
	<1270761657-18322-1-git-send-email-ospite@studenti.unina.it>
	<hpmma4$s8u$2@dough.gmane.org>
Organization: Vanille-Media
Date: Fri, 09 Apr 2010 12:32:01 +0200
Message-ID: <1270809121.17419.64.camel@andromeda>
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
Subject: Re: [PATCH] glib-2.0: remove old glib-2.0-native recipes
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
X-List-Received-Date: Fri, 09 Apr 2010 10:35:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Am Freitag, den 09.04.2010, 09:51 +0200 schrieb Koen Kooi:
> On 08-04-10 23:20, Antonio Ospite wrote:
> > Having these around can cause some conflict in recipes depending on
> > recent glib-2.0-native, see [1].
> > 
> > What can happen is that, when no preferred versions are set (like in
> > DISTRO=minimal), bitbake picks up an older -native recipe even if a more
> > recent one using the BBCLASSEXTEND = "native" mechanism exists.
> 
> If that's the actual problem, leave the recipes alone and set a
> PREFERRED_VERSION in your distro.

Here we come back to an old disagreement, namely whether the preferences
in OE should have a consistent set of defaults or not.

"Set it in the distro" is a nice catch-all, but I wonder whether hiding
such obvious bugs in the metadata is the right approach with regards to
OE being versatile for new distros.

CHeers,

-- 
:M:



