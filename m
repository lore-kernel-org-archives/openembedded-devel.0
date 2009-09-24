Received: from [84.21.108.25] (helo=ns.penguin.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1Mqurg-00014k-5y
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Sep 2009 22:24:35 +0200
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id 8A5081416BA8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Sep 2009 22:18:13 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LNHnJ5ZCE13M
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Sep 2009 22:18:13 +0200 (CEST)
Received: from [192.168.1.2] (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7]) by ns.penguin.cz (Postfix) with ESMTP id 5918C1416BA5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Sep 2009 22:18:12 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4ABB7523.3050409@kernelconcepts.de>
References: <1253741018.5229.23.camel@utx.utx.cz>
	<4ABB7523.3050409@kernelconcepts.de>
Date: Thu, 24 Sep 2009 22:23:53 +0200
Message-Id: <1253823833.3909.14.camel@utx.utx.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.1.1 
X-SA-Exim-Connect-IP: 84.21.108.25
X-SA-Exim-Mail-From: utx@penguin.cz
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: functional Matchbox2 in oe.dev
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
X-List-Received-Date: Thu, 24 Sep 2009 20:24:35 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Florian Boor wrote:

> Stanislav Brabec schrieb:

> > Resipes are now available in oe.dev. Just call bitbake matchbox2,
> > install and and enjoy. Read /etc/matchbox2/defaults and customize the
> > session script. And feel free to improve recipes.
> 
> Very good - we should update all related recipes to make use of it. If we need
> to do any changes in GPE in order to make it compatible with the Matchbox2 stuff
>  please let me know.

Well, GPE is nearly independent on the panel and WM. Old Matchbox
applets can still be hosted in Matchbox2, but conversion to the
Matchbox2 panel module would make them less memory-hungry.

Just matchbox-panel-manager will not work due to Matchbox2. Matchbox2
does not support layout change without restart. But there are things
that become outdated over the time by a change of low level technology -
for example gpe-bluetooth.


________________________________________________________________________
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



