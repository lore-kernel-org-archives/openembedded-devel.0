Received: from [69.17.117.7] (helo=mail5.sea5.speakeasy.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <erik@hovland.org>) id 1HdZsK-0001ad-8S
	for openembedded-devel@openembedded.org; Tue, 17 Apr 2007 00:40:44 +0200
Received: (qmail 3606 invoked from network); 16 Apr 2007 22:40:42 -0000
Received: from dsl092-045-201.lax1.dsl.speakeasy.net (HELO speakeasy.net)
	([66.92.45.201]) (envelope-sender <erik@hovland.org>)
	by mail5.sea5.speakeasy.net (qmail-ldap-1.03) with SMTP
	for <openembedded-devel@lists.openembedded.org>;
	16 Apr 2007 22:40:42 -0000
Received: by speakeasy.net (nbSMTP-1.00) for uid 1000
	erik@hovland.org; Mon, 16 Apr 2007 15:40:42 -0700 (PDT)
Date: Mon, 16 Apr 2007 15:40:41 -0700
From: Erik Hovland <erik@hovland.org>
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
Message-ID: <20070416224041.GF30118@hovland.org>
References: <1176760923.4623f25b913f9@dominion.kabel.utwente.nl>
MIME-Version: 1.0
In-Reply-To: <1176760923.4623f25b913f9@dominion.kabel.utwente.nl>
User-Agent: Mutt/1.5.13 (2006-08-11)
Subject: Re: Making /var/lib persistent
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Apr 2007 22:40:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 17, 2007 at 12:02:03AM +0200, Koen Kooi wrote:
> Hi,
> 
> Marcel Holtmann just pointed me to the fact that OE mount /var as
> tmpfs for almost all machines, which wipes /var/lib at boot, which
> will break bluez and dpkg.

Heh, Todd Blummer brought up this very issue on the familiar dev list.
Note we have done nothing about it either.

The FHS is clear that this directory is the place to save app state
info, so keeping that dir across boots and suspend/resume cycles is
handy.

E

-- 
Erik Hovland
mail: erik@hovland.org
web: http://hovland.org/
PGP/GPG public key available on request



