Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ynezz@mengele.ibawizard.net>) id 1OzqfV-0008Tj-NC
	for openembedded-devel@openembedded.org; Sun, 26 Sep 2010 14:49:26 +0200
Received: by mengele.ibawizard.net (Postfix, from userid 1002)
	id 040F41D363EC; Sun, 26 Sep 2010 14:43:17 +0200 (CEST)
Date: Sun, 26 Sep 2010 14:43:17 +0200
From: Petr =?iso-8859-2?Q?=A9tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100926124317.GR28423@ibawizard.net>
MIME-Version: 1.0
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 82.208.49.253
X-SA-Exim-Mail-From: ynezz@mengele.ibawizard.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Strange bluez dependency for ppp
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
X-List-Received-Date: Sun, 26 Sep 2010 12:49:26 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I've added ppp to my image based on minimal-image. To my surprise it dragged
in over 2000 more packages. It's caused by libpcap which depends on
bluez-libs. My minimal-image with ppp = 3541 tasks/packages and same
minimal-image with ppp, but with removed bluez-utils dependency from libcap =
1300 tasks/packages. I wonder how to fix it correctly in OE, since I've found
this patch[1]. Thanks for the suggestions.

1. http://patchwork.openembedded.org/patch/329/

-- ynezz


