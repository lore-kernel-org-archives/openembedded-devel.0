Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1PdtBS-0002It-3g
	for openembedded-devel@lists.openembedded.org;
	Sat, 15 Jan 2011 00:35:54 +0100
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 704C81100093
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Jan 2011 00:35:18 +0100 (CET)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 5DDC8110008B
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Jan 2011 00:35:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.1
Received: from rhein.familie-heinold.de (g225006214.adsl.alicedsl.de
	[92.225.6.214]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Jan 2011 00:35:17 +0100 (CET)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 506333C342; Sat, 15 Jan 2011 00:34:55 +0100 (CET)
Date: Sat, 15 Jan 2011 00:34:55 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110114233455.GA26837@rhein.zuhause.netz>
References: <4D2E3885.8030207@cbnco.com>
	<AANLkTinfpFWJSY6JfTU+KaO4b6J1aJowir+Z97OnHNUm@mail.gmail.com>
	<4D2F016F.2060808@cbnco.com>
	<AANLkTi=qTS0YRq1Q9N8GcMz+neaYJD+NzRQ6hDPjpNtW@mail.gmail.com>
	<Pine.LNX.4.64.1101140859250.6059@juice.ott.cti.com>
MIME-Version: 1.0
In-Reply-To: <Pine.LNX.4.64.1101140859250.6059@juice.ott.cti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: openjdk-6-vm-shark on armv6 (ARM1176)
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
X-List-Received-Date: Fri, 14 Jan 2011 23:35:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 14, 2011 at 08:59:52AM -0500, Michael Smith wrote:
> On Fri, 14 Jan 2011, Ken Gilmer wrote:
> 
> > root@BUG:~# java -shark -Xbatch \
> > >    -XX:+PrintCompilation -XX:CompileThreshold=100 -version
> >   1   b   java.lang.String::hashCode (60 bytes)
> >   2   b   java.lang.String::equals (88 bytes)
> >   3   b   java.lang.System::getSecurityManager (4 bytes)
> >   4  !b   sun.nio.cs.US_ASCII$Encoder::encodeArrayLoop (279 bytes)
> > java version "1.6.0_18"  5   b   java.lang.String::indexOf (151 bytes)
> 
> Nice! What version of gcc are you using?
> 
> Mike

bug 2.0 is armv7a, same as beagleboard.

Bye Henning


