Received: from p3plsmtpa01-07.prod.phx3.secureserver.net ([72.167.82.87])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <mike@mwester.net>) id 1NrAls-00037t-88
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Mar 2010 14:55:54 +0100
Received: (qmail 13273 invoked from network); 15 Mar 2010 13:46:08 -0000
Received: from unknown (209.242.7.187)
	by p3plsmtpa01-07.prod.phx3.secureserver.net (72.167.82.87) with ESMTP;
	15 Mar 2010 13:46:08 -0000
Message-ID: <4B9E3A1E.2090008@mwester.net>
Date: Mon, 15 Mar 2010 08:46:06 -0500
From: Mike Westerhof <mike@mwester.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.23) Gecko/20090812 Thunderbird/2.0.0.23 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <201003081300.19058.holger+oe@freyther.de>	<B6E39224-2467-4EDA-A0F4-94C4F9DAF9CD@vanille-media.de>	<201003081351.35463.holger+oe@freyther.de>	<201003150446.26284.holger+oe@freyther.de>
	<hnksi7$k9i$2@dough.gmane.org>
In-Reply-To: <hnksi7$k9i$2@dough.gmane.org>
X-SA-Exim-Connect-IP: 72.167.82.87
X-SA-Exim-Mail-From: mike@mwester.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: samba-essential upgrade or remove?
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
X-List-Received-Date: Mon, 15 Mar 2010 13:55:54 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
> I think samba-essential reason of being can be done in regular samba
> recipes by putting some better thought in PACKAGES and FILES. So: delete
> this.

No, the necessary incantations must be done in the configure stage, so
that the generated binaries do not have so many dependencies.  The size
problem is not limited to the samba packages themselves; a very
significant part of the issue are the external dependencies.

-Mike (mwester)


