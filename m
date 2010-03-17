Received: from static.26.116.47.78.clients.your-server.de ([78.47.116.26]
	helo=drlauer-research.com) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1NrxGT-0000rf-7S
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Mar 2010 18:42:43 +0100
Received: from [192.168.1.5] (e180138080.adsl.alicedsl.de [85.180.138.80])
	by drlauer-research.com (Postfix) with ESMTP id CB3ED584116
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Mar 2010 18:40:55 +0100 (CET)
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1268845536.29482.4.camel@trini-m4400>
References: <1268742232-11291-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
	<1268845536.29482.4.camel@trini-m4400>
Organization: Vanille-Media
Date: Wed, 17 Mar 2010 18:39:07 +0100
Message-ID: <1268847547.3211.11.camel@andromeda>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 78.47.116.26
X-SA-Exim-Mail-From: mickey@vanille-media.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] packaged-staging.bbclass: use 'os.unlink()' instead of spawning 'rm'
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
X-List-Received-Date: Wed, 17 Mar 2010 17:42:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

> > +def _package_unlink (f):
> > +    import os
> > +    try:
> > +	os.unlink(f)
> > +	return True
> > +    except:
> > +	return False
> > +

While it won't hurt in this particular case, a catch-all 'except'
usually is frowned upon. Better catch specific errors and let other
errors be handled by the upper layers. I'd recommend catching IOError
only here.

:M:




