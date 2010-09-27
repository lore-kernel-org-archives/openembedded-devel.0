Received: from ibawizard.net ([82.208.49.253] helo=mengele.ibawizard.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ynezz@mengele.ibawizard.net>) id 1P095Q-0005Cg-GJ
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Sep 2010 10:29:24 +0200
Received: by mengele.ibawizard.net (Postfix, from userid 1002)
	id F28DB21C082; Mon, 27 Sep 2010 10:21:20 +0200 (CEST)
Date: Mon, 27 Sep 2010 10:21:20 +0200
From: Petr =?iso-8859-2?Q?=A9tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100927082120.GS28423@ibawizard.net>
References: <20100926124317.GR28423@ibawizard.net>
	<AANLkTi=_gXRqO6Se0it=rG3rRoCF1rUVejp=TFqNOpXo@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTi=_gXRqO6Se0it=rG3rRoCF1rUVejp=TFqNOpXo@mail.gmail.com>
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 82.208.49.253
X-SA-Exim-Mail-From: ynezz@mengele.ibawizard.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Strange bluez dependency for ppp
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
X-List-Received-Date: Mon, 27 Sep 2010 08:29:25 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Frans Meulenbroeks <fransmeulenbroeks@gmail.com> [2010-09-27 08:38:46]:

> never peeked at bluez-utils, but bluez itself drags in a lot of stuff
> because it depends on alsa and gst, so even if you only need bt
> serial, you get a lot of stuff you probably do not want.

All I wanted was ppp, not BT serial :-) But ok, I've just removed that
bluez-libs dependency from the libpcap recipe in my branch, so it's fixed for
me. Thanks.

-- ynezz


