Received: from [85.214.48.103] (helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1KjtcW-0006N3-Df
	for openembedded-devel@lists.openembedded.org;
	Sun, 28 Sep 2008 12:35:20 +0200
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id CA22C8400A2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Sep 2008 12:31:26 +0200 (CEST)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id C845A8400A0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Sep 2008 12:31:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_05
	autolearn=ham version=3.2.5
Received: from rhein.familie-heinold.de (e178065220.adsl.alicedsl.de
	[85.178.65.220]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Sep 2008 12:31:25 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 416793C1D9; Sun, 28 Sep 2008 12:31:25 +0200 (CEST)
Date: Sun, 28 Sep 2008 12:31:25 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080928103124.GA11128@rhein.zuhause.netz>
References: <20080925191451.GA17447@rhein.zuhause.netz>
	<200809260332.35358.zecke@selfish.org>
	<20080926193648.GA12460@rhein.zuhause.netz>
	<200809280352.28293.zecke@selfish.org>
MIME-Version: 1.0
In-Reply-To: <200809280352.28293.zecke@selfish.org>
User-Agent: Mutt/1.5.18 (2008-05-17)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: Discussion about gettext.bbclass
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
X-List-Received-Date: Sun, 28 Sep 2008 10:35:20 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Sep 28, 2008 at 03:52:27AM +0200, Holger Freyther wrote:
> On Friday 26 September 2008 21:36:49 Henning Heinold wrote:
> > Here is the patch now.
> >
> > Bye Henning
> 
> When do you want to do the renaming to nls.bbclass? Besides that I don't see 
> anything wrong in your patch.

Because the class is reflecting if you want NLS support or not and not
if you want gettext stuff. Because gettext is now the only tool
which generates the .po files is another story, but as I mentioned earlier 
for runtime there is now proxy-libintl, which is providing libintl too.

> 
> When you propose the nls.bbclass we should also cleanup the existing recipes 
> putting virtual/libintl and virtual/libiconv into the DEPENDS.
>  

Yes, there are a lot of recipes which could be simplify with inherit gettex
and there are packages from gtk stuff, which uses gettext but dont honor
the --disable-nls configure option like atk or pango.


> z.

Bye Henning


