Received: from ns.penguin.cz ([84.21.108.25])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1NZ2rC-0004oR-Lr
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 Jan 2010 14:50:29 +0100
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id 29D051409735
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jan 2010 14:50:43 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NHN8mYAg-qNx
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jan 2010 14:50:43 +0100 (CET)
Received: from [192.168.1.2] (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7]) by ns.penguin.cz (Postfix) with ESMTP id EBD201416BA8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jan 2010 14:50:42 +0100 (CET)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <hjhfid$tqo$1@ger.gmane.org>
References: <201001241235.23795.holger+oe@freyther.de>
	<hjhfid$tqo$1@ger.gmane.org>
Date: Sun, 24 Jan 2010 14:49:23 +0100
Message-Id: <1264340963.3561.26.camel@utx.utx.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.0 
X-SA-Exim-Connect-IP: 84.21.108.25
X-SA-Exim-Mail-From: utx@penguin.cz
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Request to revert latest devicekit patch
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
X-List-Received-Date: Sun, 24 Jan 2010 13:50:29 -0000
Content-Type: text/plain; charset="ISO-8859-2"
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:

> Note: Another (maybe better) fix would be to package up docbook-xsl but
> that is overkill for these two recipes.
> 
> Wouldn't that be a better option than introducing a regression?

Much more recipes could have benefit from working docbook recipes. For
example recipes/rhythmbox/rhythmbox_0.12.1.bb:

# FIXME: Native doc processing with xsltproc using docbook needs additional work:
do_configure_prepend() {
	sed -i '/^SUBDIRS/,/^$/s/help//' Makefile.am
}

I think that there is much more recipes that would be able to build some
documentation with working docbook3/4 and docbook-xsl.


________________________________________________________________________
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



