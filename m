Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ynezz@mengele.ibawizard.net>) id 1NJtGz-0003bK-QS
	for openembedded-devel@lists.openembedded.org;
	Sun, 13 Dec 2009 19:34:28 +0100
Received: by mengele.ibawizard.net (Postfix, from userid 1002)
	id 1E78C1D36078; Sun, 13 Dec 2009 19:32:39 +0100 (CET)
Date: Sun, 13 Dec 2009 19:32:38 +0100
From: Petr =?iso-8859-2?Q?=A9tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091213183238.GB1260@ibawizard.net>
References: <1260618520.3373.23.camel@mattotaupa.wohnung.familie-menzel.net>
	<20091212173311.GA3730@rhein.zuhause.netz>
	<1260711980.3110.21.camel@mattotaupa.wohnung.familie-menzel.net>
	<hg3523$2lg$3@ger.gmane.org>
	<1260727515.3110.65.camel@mattotaupa.wohnung.familie-menzel.net>
MIME-Version: 1.0
In-Reply-To: <1260727515.3110.65.camel@mattotaupa.wohnung.familie-menzel.net>
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 82.208.49.253
X-SA-Exim-Mail-From: ynezz@mengele.ibawizard.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: package VDR for OE
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
X-List-Received-Date: Sun, 13 Dec 2009 18:34:29 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Paul Menzel <paulepanter@users.sourceforge.net> [2009-12-13 19:05:15]:

> > AFAIK Makefiles don't use accolades but parens for variables.
> 
> I see. But
> 
>         -INCLUDES = -I/usr/include/freetype2
>         +INCLUDES = $(STAGING_INCDIR)/freetype2
> 
> did not help and resulted in.
> 
>         INCLUDES = $(STAGING_INCDIR)/freetype2

No, I think, that Koen was writing about your general mistake. If there was
STAGING_INCDIR available in the environment, your ${} won't work anyway.
Correct is to use $(), parens in Makefile when accessing variables. It's
nothing about your issue.

-- ynezz


