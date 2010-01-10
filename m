Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1NTx7J-0008Uf-JB
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Jan 2010 13:42:04 +0100
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id E1F2511000B2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jan 2010 13:39:55 +0100 (CET)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id E8B1E1100096
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jan 2010 13:39:24 +0100 (CET)
Received: from rhein.familie-heinold.de (g225073150.adsl.alicedsl.de
	[92.225.73.150]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jan 2010 13:39:24 +0100 (CET)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 4D7AB3C11A; Sun, 10 Jan 2010 13:39:24 +0100 (CET)
Date: Sun, 10 Jan 2010 13:39:24 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100110123923.GB6363@rhein.zuhause.netz>
References: <1263109998.16109.11.camel@mattotaupa.wohnung.familie-menzel.net>
MIME-Version: 1.0
In-Reply-To: <1263109998.16109.11.camel@mattotaupa.wohnung.familie-menzel.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Virus-Scanned: ClamAV using ClamSMTP
X-SA-Exim-Connect-IP: 85.214.48.103
X-SA-Exim-Mail-From: heinold@inf.fu-berlin.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: vdr: questions regarding cplusplus.patch
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
X-List-Received-Date: Sun, 10 Jan 2010 12:42:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jan 10, 2010 at 08:53:18AM +0100, Paul Menzel wrote:
> Dear Henning and list,
> 
> 
> packaging VDR for OE you added cplusplus.patch [1] to be applied. I am
> trying to get the patches upstream, but I have some questions.
> 
> Is it correct, that the two changes have the following goals?
> 
> 1. Instead of using the C headers which are deprecated use the headers
> provided by C++ as mentioned for example in [2].
> 2. You changed `canonicalize_file_name(FileName);` to
> `realpath(FileName,NULL);`. Is that because OE just support Linux and
> not GNU/Hurd for example [3]?
> 3. I do not understand why a lot of headers are included in tools.h and
> tools.c. But I have to look that up in some reference.
> 

Hi Paul,

with gcc 4.x and 4.4 c++ is stricter at including headers the right way.
So you need to include a couple of headers, because some functions
are not found. You can test it in oe with using binutils 2.20 and
gcc-4.4.2 and leave the patches out.

The problem with canonicalize_file_name was, that the function too
wasn't found with gcc-4.4.2. So I googled and found that
canonicalize_file_name(FileName) is the same as realpath(FileName,NULL),
but realpath was found.

I hope this clears some stuff.

Bye Henning


