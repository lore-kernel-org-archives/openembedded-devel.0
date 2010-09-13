Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1OvCfO-0003ZX-71
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Sep 2010 19:18:08 +0200
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id C7A061100211
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Sep 2010 19:17:20 +0200 (CEST)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id B9E5D11000E1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Sep 2010 19:17:19 +0200 (CEST)
Received: from rhein.familie-heinold.de (g229044011.adsl.alicedsl.de
	[92.229.44.11]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Sep 2010 19:17:19 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id C97AF3C0D7; Mon, 13 Sep 2010 19:17:18 +0200 (CEST)
Date: Mon, 13 Sep 2010 19:17:18 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100913171718.GA6516@rhein.zuhause.netz>
References: <4C85058D.8070506@gmail.com>
	<1283996027.3036.1.camel@gnutoo-laptop>
	<AANLkTimz=Q1KsMrMUfwvSEueq1a3kEcgWFoVZDvFqzqK@mail.gmail.com>
	<4C88E7C2.1030500@gmail.com> <4C88E9BC.9040603@eukrea.com>
	<4C88EAF2.7010208@gmail.com> <4C88EC18.3020109@eukrea.com>
	<4C8E4171.5080208@gmail.com>
	<AANLkTi=RGhye15FnNKzuNHP2c41KXkdPS=qehLRXKyaE@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTi=RGhye15FnNKzuNHP2c41KXkdPS=qehLRXKyaE@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Virus-Scanned: ClamAV using ClamSMTP
X-SA-Exim-Connect-IP: 85.214.48.103
X-SA-Exim-Mail-From: heinold@inf.fu-berlin.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Asterisk and termcap
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
X-List-Received-Date: Mon, 13 Sep 2010 17:18:10 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 13, 2010 at 06:22:38PM +0200, Frans Meulenbroeks wrote:
> Arigaed, thanks for your report!
> 
> Either we can create the dir in the recipe (in do_install) or maybe we
> can configure it.
> 
> Eric, can you peek into that (and if not, can you push your patch so I
> can pick this up.

Hi,

consider /var/run as tmpfs so we need the directory creation inside the
startup script.

Bye Henning


