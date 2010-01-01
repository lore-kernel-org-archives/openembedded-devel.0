Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1NQgzu-0001gC-1c
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Jan 2010 13:52:57 +0100
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id D35DA110009B
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Jan 2010 13:50:55 +0100 (CET)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 165A91100092
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Jan 2010 13:50:55 +0100 (CET)
Received: from rhein.familie-heinold.de (g225005086.adsl.alicedsl.de
	[92.225.5.86]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Jan 2010 13:50:55 +0100 (CET)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id E1FDD3C118; Fri,  1 Jan 2010 13:50:53 +0100 (CET)
Date: Fri, 1 Jan 2010 13:50:53 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100101125053.GA4778@rhein.zuhause.netz>
References: <818ccfc40912312248w6cbab38eo600057cd5a9b485e@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <818ccfc40912312248w6cbab38eo600057cd5a9b485e@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Virus-Scanned: ClamAV using ClamSMTP
X-SA-Exim-Connect-IP: 85.214.48.103
X-SA-Exim-Mail-From: heinold@inf.fu-berlin.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Problem in configuring Newlib while building GCC cross compiler
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
X-List-Received-Date: Fri, 01 Jan 2010 12:52:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 01, 2010 at 11:48:17AM +0500, Ahsan Khawaja wrote:
> Hello,
> 
> I am building newlib library instead of eglibc using openembedded. I divided
> newlib package in newlib-initial-version and newlib-version. I added
> gcc-initial dependency on newlib-initial-version. I am having problem while
> configuring newlib-initial. When its configure script runs it give me error
> "checking C compiler works ... ld could not found crt0.o". I did not see any
> kind of such thing in eglibc configure script. Please help me in resolving
> this issue. I dont see any crt0.o file while compiler has place at time of
> configuring newlib-initial package.
> 
> I have few confusions here. What is the different between eglibc-initial and
> eglibc package and should I do the same for newlib package. Secondly why GCC
> is divided in different packages gcc-cross-initial, gcc-cross-intermediate
> and gcc-cross. what is the difference between these packages. Please help me
> in understanding these things. Thanks.

Hi,

our toolchain build is as following

binutils -> gcc-cross-initial -> libc-initial -> gcc-cross-intermediate -> libc -> gcc-cross

This is nessary to get a compiler wich has all the needed symbols.

Bye Henning


