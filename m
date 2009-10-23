Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1N1GXN-0004N5-Uf
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Oct 2009 11:34:24 +0200
Received: from tamarin.localnet (123-192-145-111.dynamic.kbronet.com.tw
	[123.192.145.111])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 11D5C1B10C05
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Oct 2009 09:42:33 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 23 Oct 2009 11:33:10 +0200
User-Agent: KMail/1.12.2 (Linux/2.6.31; KDE/4.3.2; i686; ; )
References: <200910230504.57681.holger+oe@freyther.de>
	<1256286976.4529.117.camel@mill.internal.reciva.com>
	<hbrs68$gbd$1@ger.gmane.org>
In-Reply-To: <hbrs68$gbd$1@ger.gmane.org>
MIME-Version: 1.0
Message-Id: <200910231133.11053.holger+oe@freyther.de>
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
X-List-Received-Date: Fri, 23 Oct 2009 09:34:25 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Friday 23 October 2009 11:14:48 Koen Kooi wrote:
> On 23-10-09 10:36, Phil Blundell wrote:

> > An alternative (or an addition) to the -static packaging would be to
> > arrange for .a files (and .o files, I guess) to be stripped with "strip
> > --strip-debug" (or perhaps --strip-unneeded).  This should leave enough
> > symbol data in the files for them to remain usable.
> 
> Something like this (but without the mailer induced linewrapping)?
> 
> diff --git a/classes/package.bbclass b/classes/package.bbclass
> index 046351a..2bf55e3 100644
> --- a/classes/package.bbclass
> +++ b/classes/package.bbclass
> @@ -183,6 +183,9 @@ def runstrip(file, d):
>           extraflags = "--remove-section=.comment --remove-section=.note
> --strip-unneeded"
>       elif "shared" in result or "executable" in result:
>           extraflags = "--remove-section=.comment --remove-section=.note"
> +       elif file.endswith(".a")::

one colon  please :)



> +                extraflags = "--remove-section=.comment --strip-debug"
> +

and I would prefer to have debug symbols in there. you can always strip them 
out of the final binary but you can not add them when they are gone.

The last bit is that I would like to put /usr/lib/libc_nonshared.a into the 
libc-dev package


z.


