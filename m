Received: from [84.21.108.25] (helo=ns.penguin.cz ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1LtTu7-0007GB-8X
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Apr 2009 23:41:26 +0200
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id 44F6A140972F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Apr 2009 23:39:24 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N7y+99bmiyHA
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Apr 2009 23:39:24 +0200 (CEST)
Received: from [192.168.1.2] (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7]) by ns.penguin.cz (Postfix) with ESMTP id 1CC031409722
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Apr 2009 23:39:23 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <19c1b8a90904112012j385dff9fn96906875cf2cd032@mail.gmail.com>
References: <20090407212047.6CF5A1893D2@amethyst.openembedded.net>
	<1239455059.9086.1.camel@port4>
	<19c1b8a90904112012j385dff9fn96906875cf2cd032@mail.gmail.com>
Date: Mon, 13 Apr 2009 23:37:45 +0200
Message-Id: <1239658665.11225.10.camel@utx.utx.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.1.1 
X-SA-Exim-Connect-IP: 84.21.108.25
X-SA-Exim-Mail-From: utx@penguin.cz
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=5.0 tests=AWL,BAYES_00,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] Stanislav Brabec : autoconf213-native: Added	old autoconf for fennec recipe .
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
X-List-Received-Date: Mon, 13 Apr 2009 21:41:26 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Khem Raj wrote:

> > if someone bitbakes autoconf-2.13 does it overwrite the one that there
> > was before?
> 
> it seems it can coexist with new autotools as it uses
> --program-transform-name there might be other problems I dont know.
> but that said I think we should try to upgrade whatever package needs
> this old autotools
> version.

It was intended to co-exist.

I also changed datadir to prevent any conflict. Even without it it seems
to be safe - old versions use $datadir/autoconf directly, new versions
use only directories, but different datadir should make it super-safe.
On the other hand it breaks reuse of third party m4 files in
aclocal2.13. As it was added just for the build of mozilla family, I do
not think it is a problem.

Note that I tested only -native version.


________________________________________________________________________
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



