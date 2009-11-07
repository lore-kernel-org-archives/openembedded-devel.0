Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1N6lhz-0005i6-CJ
	for openembedded-devel@lists.openembedded.org;
	Sat, 07 Nov 2009 14:52:06 +0100
Received: from tamarin.localnet (123-192-145-111.dynamic.kbronet.com.tw
	[123.192.145.111])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 43CA31B10C05
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 Nov 2009 14:01:17 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 7 Nov 2009 14:50:30 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.31; KDE/4.3.2; i686; ; )
References: <ac9c93b10911061238p366f65edqeff04b25c872015f@mail.gmail.com>
	<ac9c93b10911070106n587495a5qaf3cfc9288df7e8@mail.gmail.com>
	<4AF574B5.2010802@mwester.net>
In-Reply-To: <4AF574B5.2010802@mwester.net>
MIME-Version: 1.0
Message-Id: <200911071450.30712.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
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
X-List-Received-Date: Sat, 07 Nov 2009 13:52:06 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Saturday 07 November 2009 14:23:01 Mike Westerhof wrote:
> Frans Meulenbroeks wrote:
> ...
> 
> > Reluctantly updated checksums.ini
> >
> > Frans
> 
> But of course there's no magic that will remove the old cached tarball
> out of one's downloads directory when this sort of thing happens.
> (Busybox has been known to do this, too)
> 
> What do folks think we should do about that when it occurs?
> a) support two entries (old and new) in checksums.ini
> b) do nothing (leave as is)
> c) add some sort of support so that the user gets additional information
>    with the new checksum match failure explaining that the checksum was
>    updated and they need to manually remove the old (bad) tarball


Good question... currently we only check the checksum after download, a first 
start would be to do it before unpack... this would create an error and we 
could implement c) later... (e.g. by creating a old_checksums.ini)

z.


