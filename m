Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1NDdBG-0001dy-HM
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Nov 2009 13:10:41 +0100
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1NDd9p-0002lO-ND
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Nov 2009 12:09:09 +0000
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1NDd9p-0003uJ-Hh
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Nov 2009 12:09:09 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1259236217.3804.5.camel@andromeda>
References: <heldod$obj$1@ger.gmane.org> <1259236217.3804.5.camel@andromeda>
Date: Thu, 26 Nov 2009 12:09:05 +0000
Message-Id: <1259237345.4332.112.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
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
X-List-Received-Date: Thu, 26 Nov 2009 12:10:41 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2009-11-26 at 12:50 +0100, Michael 'Mickey' Lauer wrote:
> Am Donnerstag, den 26.11.2009, 09:20 +0100 schrieb Koen Kooi:
> > Lately I've notice a problem when building and installing e-wm: it drags 
> > in e-menu-shr. It's due to (improper) usage of RPROVIDES + RCONFLICTS.
> > 
> > My proposal is that images should choose which applications.menu they 
> > are using (the one from gnome-desktop, e-wm, e-menu-shr-etc) and have 
> > e-wm stop RRECOMMENDING it.
> 
> I think we should not remove it but rather move this to an RSUGGESTS, so
> that we have at least a small connection left in the package that
> suggests(sic!) that this package is supposed to work best if it has an
> accompanying package that provides the menu config.

That sounds OK, though I don't quite understand what the problem is with
using Recommends: here.  If opkg is installing e-menu-shr due to the
recommendation even though another satisfier is already installed,
that's a bug in opkg and ought really to be fixed there.  It would be a
little bit sad if we had to stop using Recommends altogether just
because opkg gets it wrong sometimes.

p.




