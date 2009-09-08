Received: from [84.21.108.25] (helo=ns.penguin.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1MlAuy-0007mM-36
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Sep 2009 02:20:15 +0200
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id 68C901409713
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Sep 2009 21:47:05 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kuG54+sg7bpn
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Sep 2009 21:47:05 +0200 (CEST)
Received: from [192.168.1.2] (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7]) by ns.penguin.cz (Postfix) with ESMTP id 322381416BA8
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Sep 2009 21:47:05 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1252262796.4490.180.camel@lenovo.internal.reciva.com>
References: <1252239576.4136.10.camel@utx.utx.cz>
	<1252240297.4490.158.camel@lenovo.internal.reciva.com>
	<1252240430.4490.160.camel@lenovo.internal.reciva.com>
	<1252259364.4021.12.camel@utx.utx.cz>
	<1252262796.4490.180.camel@lenovo.internal.reciva.com>
Date: Tue, 08 Sep 2009 21:53:52 +0200
Message-Id: <1252439632.8256.4.camel@utx.utx.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.1.1 
X-SA-Exim-Connect-IP: 84.21.108.25
X-SA-Exim-Mail-From: utx@penguin.cz
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: very obscure race: access to a just-populated binary
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
X-List-Received-Date: Wed, 09 Sep 2009 00:20:15 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Phil Blundell wrote: 
> On Sun, 2009-09-06 at 19:49 +0200, Stanislav Brabec wrote:
> > i did not know it. recipes/jpeg/jasper_1.900.1.bb and other recipes
> > contain DEPENDS = "unzip-native", and it does not work.
> 
> Try:
> 
> do_unpack[depends] += "unzip-native:do_populate_staging"

Works:
NOTE: Running task 3984 of 4299 (ID: 3650, /OE/openembedded/recipes/jpeg/jasper_1.900.1.bb, do_fetch)
NOTE: Running task 4023 of 4299 (ID: 1693, /OE/openembedded/recipes/unzip/unzip-native_552.bb, do_populate_staging)
NOTE: Running task 4027 of 4299 (ID: 3651, /OE/openembedded/recipes/jpeg/jasper_1.900.1.bb, do_unpack)

Before the change, bitbake was trying to unpack jasper before populating
of unzip-native. 

Pushed as
http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=d5345f88b5ffdca098e0281f42f51e42ef43e79d

Thanks for your hint.

________________________________________________________________________
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



