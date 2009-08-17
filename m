Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1McyCQ-0003fT-Lc
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Aug 2009 11:08:23 +0200
Received: from 79-79-178-204.dynamic.dsl.as9105.com ([79.79.178.204]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1Mcxw2-0008U3-0z
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Aug 2009 09:51:22 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4A86A13E.6020402@atmel.com>
References: <1242504969-15764-1-git-send-email-ihar.hrachyshka@gmail.com>
	<1242507547.4226.1.camel@lenovo.internal.reciva.com>
	<4A867CCA.7060609@atmel.com>
	<1250329051.4215.167.camel@lenovo.internal.reciva.com>
	<1250330779.4406.9.camel@utx.utx.cz>  <4A86A13E.6020402@atmel.com>
Date: Mon, 17 Aug 2009 09:51:20 +0100
Message-Id: <1250499080.4215.211.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: xtscal fails + other Xorg init problems.
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
X-List-Received-Date: Mon, 17 Aug 2009 09:08:29 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, 2009-08-15 at 13:51 +0200, Ulf Samuelsson wrote:
> 3) There is an extension, but with different casing
>    XCALIBRATE is used by libxcalibrate.
>    if another name is used when it is added,
>    then there is a problem when queried.
>    The library is called libXcalibrate.so.
> 
>    How does it get its name?

There's no direct linkage between the name of the library and the name
of the extension: they're completely independent at a technical level,
although obviously the name of the library has been chosen to reflect
the extension that it relates to.  

The extension has always been named "XCALIBRATE" and it doesn't seem
very likely that its case has changed all of a sudden.  I don't expect
that this is the cause of your problem.

p.




