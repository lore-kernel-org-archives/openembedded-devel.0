Received: from [85.214.48.103] (helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1MvzIh-0001EG-2S
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Oct 2009 22:09:26 +0200
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 58BA811001BB
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Oct 2009 22:08:34 +0200 (CEST)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 0A07211000AF
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Oct 2009 22:08:33 +0200 (CEST)
Received: from rhein.familie-heinold.de (g225145089.adsl.alicedsl.de
	[92.225.145.89]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Oct 2009 22:08:33 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 3A2543C108; Thu,  8 Oct 2009 22:08:32 +0200 (CEST)
Date: Thu, 8 Oct 2009 22:08:32 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091008200831.GA20995@rhein.zuhause.netz>
References: <1254768733.10712.3.camel@leeloo.somedomain>
	<1254770821.9214.105.camel@lenovo.internal.reciva.com>
	<1254774335.3947.12.camel@leeloo.somedomain>
	<be7a9f3d0910051559v21ab3a2et766095a124dfb537@mail.gmail.com>
	<1254820563.6107.4.camel@leeloo.somedomain>
	<be7a9f3d0910071746s21cfaa25i158219e4641ec1ae@mail.gmail.com>
	<fca63bcf0910080517k13dae822j7821bf72ea458da4@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <fca63bcf0910080517k13dae822j7821bf72ea458da4@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Virus-Scanned: ClamAV using ClamSMTP
X-SA-Exim-Connect-IP: 85.214.48.103
X-SA-Exim-Mail-From: heinold@inf.fu-berlin.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: lighttpd 1.4.18 runtime issue
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
X-List-Received-Date: Thu, 08 Oct 2009 20:09:26 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 08, 2009 at 02:17:25PM +0200, Michael Lippautz wrote:
> 2009/10/8 Otavio Salvador <otavio@ossystems.com.br>:
> > In meanwhile it looks to have been fixed in current master; would be
> > nice if you could test it and provide a updated patch if still needed.
> 
> I actually tested the build today. Unfortunatelly there is still an
> issue remaining.
> The patch fixed the automatically loaded modules, but missed that
> there are still two modules loaded on startup in the config that is
> shipped. These modules are module-access and module-accesslog.
> (Actually I missed them when I wrote the patch, sorry for that.)
> 
>  Since the config states that these modules "should" be loaded, it has
> to be decided whether OE goes with this recommendation and adds the
> additional two modules as runtime dep., OR just strips/uncomments the
> specific sections in the config.
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

So what you like? I will do it *g*.

Bye Henning


