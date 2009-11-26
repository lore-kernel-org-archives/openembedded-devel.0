Received: from static.26.116.47.78.clients.your-server.de ([78.47.116.26]
	helo=drlauer-research.com) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1NDct4-0006o6-Qx
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Nov 2009 12:51:53 +0100
Received: from [192.168.1.105] (e180136103.adsl.alicedsl.de [85.180.136.103])
	by drlauer-research.com (Postfix) with ESMTP id EB2B958414B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Nov 2009 13:37:32 +0100 (CET)
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <heldod$obj$1@ger.gmane.org>
References: <heldod$obj$1@ger.gmane.org>
Organization: Vanille-Media
Date: Thu, 26 Nov 2009 12:50:17 +0100
Message-ID: <1259236217.3804.5.camel@andromeda>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 78.47.116.26
X-SA-Exim-Mail-From: mickey@vanille-media.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: e-wm-menu problem
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
X-List-Received-Date: Thu, 26 Nov 2009 11:51:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Am Donnerstag, den 26.11.2009, 09:20 +0100 schrieb Koen Kooi:
> Lately I've notice a problem when building and installing e-wm: it drags 
> in e-menu-shr. It's due to (improper) usage of RPROVIDES + RCONFLICTS.
> 
> My proposal is that images should choose which applications.menu they 
> are using (the one from gnome-desktop, e-wm, e-menu-shr-etc) and have 
> e-wm stop RRECOMMENDING it.

I think we should not remove it but rather move this to an RSUGGESTS, so
that we have at least a small connection left in the package that
suggests(sic!) that this package is supposed to work best if it has an
accompanying package that provides the menu config.

:M:



