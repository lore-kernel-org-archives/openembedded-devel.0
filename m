Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1OkInH-0005OU-0f
	for openembedded-devel@lists.openembedded.org;
	Sat, 14 Aug 2010 17:37:13 +0200
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id C268C110009C
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Aug 2010 17:36:37 +0200 (CEST)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 8E5EB1100097
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Aug 2010 17:36:36 +0200 (CEST)
Received: from rhein.familie-heinold.de (g225145246.adsl.alicedsl.de
	[92.225.145.246]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Aug 2010 17:36:36 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id E982C3C0C0; Sat, 14 Aug 2010 17:36:28 +0200 (CEST)
Date: Sat, 14 Aug 2010 17:36:28 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100814153628.GA18725@rhein.zuhause.netz>
References: <AANLkTimR-8k8h_FAtt3KaNM1fe_FAMu2wZdmbRu2Un=z@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTimR-8k8h_FAtt3KaNM1fe_FAMu2wZdmbRu2Un=z@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Virus-Scanned: ClamAV using ClamSMTP
X-SA-Exim-Connect-IP: 85.214.48.103
X-SA-Exim-Mail-From: heinold@inf.fu-berlin.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: need help with do_install for v8 bitbake recipe
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
X-List-Received-Date: Sat, 14 Aug 2010 15:37:15 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Aug 14, 2010 at 03:29:48AM -0600, AJ ONeal wrote:
> I've created a recipe for v8 and the do_compile() works.
> http://fastr.github.com/articles/v8-on-OpenEmbedded.html
> 
> I'm still not very familiar with bitbake and I'd like to know what I need to
> do with
> do_install() and do_stage() so that the library is available to other
> packages when
> I add DEPENDS += "libv8".
> 
> The only file is libv8.a in the builddir.
> 
> Specifically I'm trying to build nodejs with v8 as a shared library, because
> I can't get
> the v8 that comes with it to cross-compile.
> 
> AJ ONeal

Hi,

do_stage is deprecated don't use it anymore.

Bye Henning


