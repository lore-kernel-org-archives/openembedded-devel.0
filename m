Received: from [83.151.25.170] (helo=srv043.dedi23.de)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <mickey@openmoko.org>) id 1IgI0K-000579-JX
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Oct 2007 12:44:28 +0200
Received: by srv043.dedi23.de (Postfix, from userid 65534)
	id 2648728C014; Fri, 12 Oct 2007 12:33:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	srv043.dedi23.de
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=AWL,BAYES_00,RCVD_IN_PBL,
	RCVD_IN_SORBS_DUL autolearn=no version=3.1.7-deb
Received: from PROMETHEUS (e180132063.adsl.alicedsl.de [85.180.132.63])
	by srv043.dedi23.de (Postfix) with ESMTP id 9579028C013;
	Fri, 12 Oct 2007 12:33:32 +0200 (CEST)
Date: Fri, 12 Oct 2007 12:38:18 +0200
From: Michael 'Mickey' Lauer <mickey@openmoko.org>
X-Mailer: The Bat! (v3.99.24) Professional
Organization: OpenMoko
X-Priority: 3 (Normal)
Message-ID: <1607991975.20071012123818@vanille-media.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <C970407D71E48D4EADEEB57340F14D89033C2A@E03MVB2-UKBR.domain1.systemhost.net>
References: <C970407D71E48D4EADEEB57340F14D89033C2A@E03MVB2-UKBR.domain1.systemhost.net>
MIME-Version: 1.0
Cc: thomas.cooksey@bt.com
Subject: Re: bug #747, qmake & possible missing bbclass
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 12 Oct 2007 10:44:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

thomas.cooksey@bt.com wrote:

> Pretty sure this list isn't the right place for this but...

I've forwarded it to openembedded-devel@lists.openembedded.org

> There's a bug on bugzilla (#747) which I've also encountered and fixed.

> First, I think this may be a bug in upstream qmake 4.3.1 as I've
> been developing a lot with Qtopia outside OpenMoko. Every time I run
> qmake -project I have to manually add network to the QT variable in
> the project file, even for hello world.

> Second, I also needed to modify the Makefile qmake produced and
> edit the "LINK= $(OE_QMAKE_LINK)" to LINK=$(CXX). This is because
> OE_QMAKE_LINK isn't defined. Looking through the OpenEmbedded tree
> there is a class called qmake.bbclass (& qmake2.bbclass) which
> defines OE_QMAKE_LINK. I don't know OpenEmbedded too well but I do
> know portage/gentoo and I assume a bbclass is like an eclass in
> portage?? If that's the case, surely the uicmoc4-native_4.3.1 recipe
> needs to inherit from the qmake or qmake2 class? I guess this may
> have been fixed in upstream OpenEmbedded? Like I say, my
> OpenEmbedded knowledge is a bit limited, so what I just wrote may make no sense whatsoever.

> PS: In future, where's the best place for this kind of stuff? Should I have created a new bug?

Please not for OpenMoko, but at bugs.openembedded.org


> _______________________________________________
> OpenMoko community mailing list
> community@lists.openmoko.org
> http://lists.openmoko.org/mailman/listinfo/community



-- 
- Michael Lauer <mickey@openmoko.org>                   http://openmoko.org/
============================================================================
Software for the worlds' first truly open Free Software mobile phone



