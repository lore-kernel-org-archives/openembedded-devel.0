Received: from [72.167.82.86] (helo=p3plsmtpa01-06.prod.phx3.secureserver.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <mike@mwester.net>) id 1N6lNU-0001OD-IH
	for openembedded-devel@openembedded.org; Sat, 07 Nov 2009 14:30:55 +0100
Received: (qmail 5028 invoked from network); 7 Nov 2009 13:22:57 -0000
Received: from unknown (209.242.7.133)
	by p3plsmtpa01-06.prod.phx3.secureserver.net (72.167.82.86) with ESMTP;
	07 Nov 2009 13:22:57 -0000
Message-ID: <4AF574B5.2010802@mwester.net>
Date: Sat, 07 Nov 2009 07:23:01 -0600
From: Mike Westerhof <mike@mwester.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.23) Gecko/20090812 Thunderbird/2.0.0.23 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <ac9c93b10911061238p366f65edqeff04b25c872015f@mail.gmail.com>	<200911070406.18094.holger+oe@freyther.de>
	<ac9c93b10911070106n587495a5qaf3cfc9288df7e8@mail.gmail.com>
In-Reply-To: <ac9c93b10911070106n587495a5qaf3cfc9288df7e8@mail.gmail.com>
X-SA-Exim-Connect-IP: 72.167.82.86
X-SA-Exim-Mail-From: mike@mwester.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: what to do with wrong checksum
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
X-List-Received-Date: Sat, 07 Nov 2009 13:30:56 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Frans Meulenbroeks wrote:
...
> 
> Reluctantly updated checksums.ini
> 
> Frans

But of course there's no magic that will remove the old cached tarball
out of one's downloads directory when this sort of thing happens.
(Busybox has been known to do this, too)

What do folks think we should do about that when it occurs?
a) support two entries (old and new) in checksums.ini
b) do nothing (leave as is)
c) add some sort of support so that the user gets additional information
   with the new checksum match failure explaining that the checksum was
   updated and they need to manually remove the old (bad) tarball

-Mike (mwester)


