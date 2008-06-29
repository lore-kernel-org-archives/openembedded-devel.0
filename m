Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1KD5PZ-0000Zw-Ev
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Jun 2008 00:30:22 +0200
Received: from andromeda.vanille.de (e180179167.adsl.alicedsl.de
	[85.180.179.167])
	by drlauer-research.com (Postfix) with ESMTP id 83E4B584C35
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jun 2008 00:31:22 +0200 (CEST)
From: "Michael 'Mickey' Lauer" <mickey@vanille-media.de>
Organization: Vanille-Media
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Jun 2008 00:27:22 +0200
User-Agent: KMail/1.9.9
References: <486658B8.2070403@dls.net>
In-Reply-To: <486658B8.2070403@dls.net>
MIME-Version: 1.0
Message-Id: <200806300027.23029.mickey@vanille-media.de>
Subject: Re: python-pygobject fails to build from scratch
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Sun, 29 Jun 2008 22:30:24 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Am Samstag 28 Juni 2008 17:28:56 schrieb Mike (mwester):
> The patch below causes build failures for me :(
>
> Specifically, with an empty tmp directory (and parallel make specified,
> but I don't think that makes a difference in this case),
> gobject-generate-constants is not yet built and staged.  In fact, it is
> both created and used by this makefile, so there's no way that this
> recipe should use the one in staging (in fact, if it's working for folks
> today, it's because their builds are finding (an older) one left around
> in staging).

That's strange. The situation is that pygobject 2.14.x compiles a helper which 
it calls during the build process which fails. Since we already had a 
pygobject-native for various other packages laying around, i made that stage 
the necessary helper and made pygobject DEPEND on pygobject-native.

Can you check whether pygobject-native is getting build and staged for you at 
the time pygobject is going to be compiled?

Update: Sorry, forget what I said, I had a patch to pygobject-native to 
commited :/

It should work now.
-- 
:M:


