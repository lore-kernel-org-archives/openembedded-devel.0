Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ynezz@mengele.ibawizard.net>) id 1Nu0zD-0005MD-V2
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Mar 2010 11:05:28 +0100
Received: by mengele.ibawizard.net (Postfix, from userid 1002)
	id C10961D36204; Tue, 23 Mar 2010 11:02:14 +0100 (CET)
Date: Tue, 23 Mar 2010 11:02:14 +0100
From: Petr =?iso-8859-2?Q?=A9tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100323100214.GB30789@ibawizard.net>
References: <201003231033.40621.holger+oe@freyther.de>
MIME-Version: 1.0
In-Reply-To: <201003231033.40621.holger+oe@freyther.de>
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 82.208.49.253
X-SA-Exim-Mail-From: ynezz@mengele.ibawizard.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Using oeaudit.py to check for known security issues
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
X-List-Received-Date: Tue, 23 Mar 2010 10:05:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Holger Hans Peter Freyther <holger+oe@freyther.de> [2010-03-23 10:33:40]:

> Hi,

Hi,

> here is a rather simple howto:
> 
> $ bitbake -s > available
> $ export PYTHONPATH=/bitbake/lib
> $ /OE/contrib/oeaudit/oeaudit.py -f
> This will call wget, tar to get the audifile and place it in the local dir
> $ /OE/contrib/oeaudit/oeaudit.py -a auditfile -p available
> Now you get a nice list of issues...

Neat! I just wonder how to check linux kernel(s) and embedded stuff not used
in FBSD. The kernel is quite mission impossible because of the patch hell...

-- ynezz


