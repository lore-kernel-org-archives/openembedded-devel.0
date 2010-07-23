Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1OcFGw-0001Mn-Q4
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Jul 2010 12:14:31 +0200
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id E090311000E1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jul 2010 12:14:14 +0200 (CEST)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id D41E4110009C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jul 2010 12:14:13 +0200 (CEST)
Received: from rhein.familie-heinold.de (g225145064.adsl.alicedsl.de
	[92.225.145.64]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jul 2010 12:14:13 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 59CCA3C0EF; Fri, 23 Jul 2010 12:14:03 +0200 (CEST)
Date: Fri, 23 Jul 2010 12:14:03 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100723101403.GA20355@rhein.zuhause.netz>
References: <4C494D69.5010807@nedap.com>
MIME-Version: 1.0
In-Reply-To: <4C494D69.5010807@nedap.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Virus-Scanned: ClamAV using ClamSMTP
X-SA-Exim-Connect-IP: 85.214.48.103
X-SA-Exim-Mail-From: heinold@inf.fu-berlin.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: java -cacao issues
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
X-List-Received-Date: Fri, 23 Jul 2010 10:14:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 23, 2010 at 10:06:01AM +0200, Jaap de Jong wrote:
> Hi,
> 
> Finally I've been able to build for at91sam9263ek without any errors...
> 
>    $ git log | head
>    commit ebc2e1d43afa43877c29bc47c87f38792a791bd8
>    Author: Martin Jansa <Martin.Jansa@gmail.com>
>    Date:   Mon Jul 19 13:14:06 2010 +0200
> 
>         linux-openmoko-2.6.32: add missing patch, enable XFS, brtfs, GPT
> 
>         Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> 
> 
> The following results on the target:
> 
>    # java -version
>    Warning: no leading - on line 43 of
>    `/usr/lib/jvm/java-6-openjdk/jre/lib/arm/jvm.cfg'
>    Warning: missing VM type on line 43 of
>    `/usr/lib/jvm/java-6-openjdk/jre/lib/arm/jvm.cfg'
>    Warning: no leading - on line 43 of
>    `/usr/lib/jvm/java-6-openjdk/jre/lib/arm/jvm.cfg'
>    Warning: missing VM type on line 43 of
>    `/usr/lib/jvm/java-6-openjdk/jre/lib/arm/jvm.cfg'
>    java version "1.6.0_18"
>    OpenJDK Runtime Environment (IcedTea6 1.8) (6b18-1.8)
>    OpenJDK Shark VM (build 14.0-b16, mixed mode)
> 
> After removing the trailing newline from
> /usr/lib/jvm/java-6-openjdk/jre/lib/arm/jvm.cfg the warnings are
> gone:
> 
This is fixed in latest oe-dev. sed scripts now work proberly.

> 
>    # java -version
>    java version "1.6.0_18"
>    OpenJDK Runtime Environment (IcedTea6 1.8) (6b18-1.8)
>    OpenJDK Shark VM (build 14.0-b16, mixed mode)
> 
>    # java -version -shark
>    java version "1.6.0_18"
>    OpenJDK Runtime Environment (IcedTea6 1.8) (6b18-1.8)
>    OpenJDK Shark VM (build 14.0-b16, mixed mode)
> 
>    # java -version -cacao
>    LOG: [0x4001ec80] md_signal_handler_sigill: Unknown illegal
>    instruction 0xed1c5a06 at 0x441dc790
>    LOG: [0x4001ec80] Aborting...
>    Aborted

 
> cacao crashes...
> Any ideas?
> 
Enable USER_SPACE debugging in kernel
CONFIG_DEBUG_USER=y
boot with user_debug=1
and look at the dmesg which instruction is called.

> Jaap de Jong

Bye Henning


