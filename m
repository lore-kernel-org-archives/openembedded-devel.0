Received: from www.xora.org.uk ([80.68.91.202] helo=xora.vm.bytemark.co.uk)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1OOoRX-0004SV-ND
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Jun 2010 10:57:59 +0200
Received: from localhost (localhost [127.0.0.1])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTP id 6A81EA5325
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jun 2010 09:53:22 +0100 (BST)
X-Virus-Scanned: Debian amavisd-new at xora.vm.bytemark.co.uk
Received: from xora.vm.bytemark.co.uk ([127.0.0.1])
	by localhost (xora.vm.bytemark.co.uk [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id BmbBZ6XTSNeL
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jun 2010 09:53:21 +0100 (BST)
Received: from xora-desktop.xora.org.uk (188-220-34-37.zone11.bethere.co.uk
	[188.220.34.37])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTPSA id 76509A5279
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jun 2010 09:53:21 +0100 (BST)
Date: Wed, 16 Jun 2010 09:53:22 +0100
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100616095322.180eb9b5@xora-desktop.xora.org.uk>
In-Reply-To: <hva2uj$jco$2@dough.gmane.org>
References: <hva2uj$jco$2@dough.gmane.org>
X-Mailer: Claws Mail 3.7.6 (GTK+ 2.20.1; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 80.68.91.202
X-SA-Exim-Mail-From: dp@xora.org.uk
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: virtual/opkg-dev breaks task-sdk-native, please revert
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
X-List-Received-Date: Wed, 16 Jun 2010 08:58:00 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 16 Jun 2010 10:45:07 +0200
Koen Kooi <k.kooi@student.utwente.nl> wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Hi,
> 
> I noticed that
> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=eeffe0a6eee97604679cf9a3cf40ed4604ae6493
> breaks lots of things:
> 
> * a dependency loop in 'bitbake task-sdk-native'
> * using virtual/ namespace in packages instead of recipes.
> 
> I propose to revert this change and just remove the ?pkg-dev from the
> sdk tasks.
> 
virtual/ in package space is always wrong as it blows up on at least
one of our supported package types.

Acked-by: Graeme Gregory <dp@xora.org.uk>

Graeme


