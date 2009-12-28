Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1NPE0j-0002BV-2x
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Dec 2009 12:43:44 +0100
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 2FF0B1100090
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Dec 2009 12:41:46 +0100 (CET)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 4FAFD110008C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Dec 2009 12:41:45 +0100 (CET)
Received: from rhein.familie-heinold.de (f052225126.adsl.alicedsl.de
	[78.52.225.126]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Dec 2009 12:41:45 +0100 (CET)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 8EF683C112; Mon, 28 Dec 2009 12:41:44 +0100 (CET)
Date: Mon, 28 Dec 2009 12:41:44 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091228114144.GA19465@rhein.zuhause.netz>
References: <op.u5mqggdmmn1qzu@guohr-laptop-ubuntu>
MIME-Version: 1.0
In-Reply-To: <op.u5mqggdmmn1qzu@guohr-laptop-ubuntu>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Virus-Scanned: ClamAV using ClamSMTP
X-SA-Exim-Connect-IP: 85.214.48.103
X-SA-Exim-Mail-From: heinold@inf.fu-berlin.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: compilation of libxft failed due to lack of XFT* macroes
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
X-List-Received-Date: Mon, 28 Dec 2009 11:43:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 28, 2009 at 11:54:06AM +0800, Guo Hongruan wrote:
> Hi guys,
>   I found a building error, when
> 1. MACHINE=qemux86 DISTRO=micro, see the following url for more detailed.
> http://tinderbox.openembedded.net/packages/391109/
> 
> It seems that the compiler can not find the XFT* macroes.

I already fixed with the latest libxft. It's an error inside autotools or using
if you use #undef fobarr /* ddfdf*/ the #undef will be not replaced by configure.
If you need this in libxft with smaller version numbers, backport my patch yourself.

Bye Henning


