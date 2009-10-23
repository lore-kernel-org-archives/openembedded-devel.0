Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1N1IQX-0006bb-VN
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Oct 2009 13:35:29 +0200
Received: from tamarin.localnet (123-192-145-111.dynamic.kbronet.com.tw
	[123.192.145.111])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 3CA121B10C04
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Oct 2009 11:43:37 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 23 Oct 2009 13:34:13 +0200
User-Agent: KMail/1.12.2 (Linux/2.6.31; KDE/4.3.2; i686; ; )
References: <200910230504.57681.holger+oe@freyther.de>
	<hbru1e$m80$1@ger.gmane.org>
	<1256296026.9503.26.camel@hammer.suse.cz>
In-Reply-To: <1256296026.9503.26.camel@hammer.suse.cz>
MIME-Version: 1.0
Message-Id: <200910231334.13581.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Revert "package bbclass: strip static libs as well"
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
X-List-Received-Date: Fri, 23 Oct 2009 11:35:29 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Friday 23 October 2009 13:07:06 Stanislav Brabec wrote:
> Koen Kooi wrote:
> > On 23-10-09 11:33, Holger Hans Peter Freyther wrote:
> > > The last bit is that I would like to put /usr/lib/libc_nonshared.a into
> > > the libc-dev package
> >
> > Glibc has its own custom packaging, which we'll probably need to tweaks
> > as well.
> 
> I think that the logic should be:
> 
> libfoo.a exists and libfoo.so exists => put .a to -static.
> 
> libfoo.a exists and libfoo.so does not exist => put .a to -dev.
> 
> This logic will work as most users expect and will need no exception for
> glibc.

This will add even more python code to package.bbclass and can not be realized 
with a FILES_* change. I would prefer a stupid QA check for that as I don't 
expect this to happen on many packages.


z.


