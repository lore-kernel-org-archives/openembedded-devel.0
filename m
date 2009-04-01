Received: from [85.199.173.110] (helo=mx51.mymxserver.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hs4233@mail.mn-solutions.de>) id 1Lp1Bn-0000Yx-Bv
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Apr 2009 16:13:11 +0200
Received: from localhost (localhost [127.0.0.1])
	by localhost.mx51.mymxserver.com (Postfix) with ESMTP id B7AA33A00A;
	Wed,  1 Apr 2009 16:10:52 +0200 (CEST)
X-Virus-Scanned: by Mittwald Mailscanner
Received: from mx51.mymxserver.com ([127.0.0.1])
	by localhost (mx51.mymxserver.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0meBnsa67Lcd; Wed,  1 Apr 2009 16:10:52 +0200 (CEST)
Received: from lin01.mn-solutions.de (pD95F960E.dip0.t-ipconnect.de
	[217.95.150.14])
	by mx51.mymxserver.com (Postfix) with ESMTP id EA1023A007;
	Wed,  1 Apr 2009 16:10:51 +0200 (CEST)
Received: by lin01.mn-solutions.de (Postfix, from userid 116)
	id 532B31E0122; Wed,  1 Apr 2009 16:10:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	lin01.mn-logistik.de
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00,
	SUBJ_YOUR_OWN autolearn=ham version=3.1.7-deb
Received: from mnz66.mn-solutions.de (mnz66.mn-solutions.de [192.168.233.66])
	by lin01.mn-solutions.de (Postfix) with ESMTP id 215601E0100;
	Wed,  1 Apr 2009 16:10:47 +0200 (CEST)
From: Holger Schurig <hs4233@mail.mn-solutions.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 1 Apr 2009 16:09:51 +0200
User-Agent: KMail/1.9.7
References: <SNT105-W5667C19202F0CB199F6AF6908A0@phx.gbl>
	<49D367D1.1050302@gmx.net>
	<SNT105-W291629ECBDDF1A26627D6C908B0@phx.gbl>
In-Reply-To: <SNT105-W291629ECBDDF1A26627D6C908B0@phx.gbl>
MIME-Version: 1.0
Message-Id: <200904011609.51801.hs4233@mail.mn-solutions.de>
Subject: Re: Does your own system matter
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
X-List-Received-Date: Wed, 01 Apr 2009 14:13:11 -0000
Content-Type: text/plain;
  charset="windows-1252"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

> > I am using Ubuntu 8.10 (x86) and Debian squeeze (amd64) for
> > OE development. Works like a charm.
>
> That sounds reassuring. Are you building uclibc at all? Also,
> does it matter what versions of gcc and g++ packages you have
> installed locally?

I'm building uclibc-based devices (AVR32 and ARMv5TEJ) on Debian 
Etch (Office) and Debian Unstable (home).

The frozen one uses uclibc 0.9.28, the other currently 0.9.30.1.


However, my devices aren't general usable PDA-like devices, so I 
use a very selected set of packages (lots hand-craftet BBFILES 
+= ..., this also gives nice bitbake-parse times). And I'm not 
using Angstrom as distribution, but have something different 
(e.g. centered around unionfs/aufs to minimize flash-wearout).

One device uses a frozen org.openembedded.dev version and is VERY 
tiny, just 33 *.bb files, the other device is currently on the 
development branch of OpenEmbedded, as development for that 
device hasn't yet finished.




As a side note, I don't build all -native packages and instead 
have this in my config:

ASSUME_PROVIDED += "bison-native"
ASSUME_PROVIDED += "fakeroot-native"
ASSUME_PROVIDED += "file-native"
ASSUME_PROVIDED += "flex-native"
ASSUME_PROVIDED += "gettext-native"
ASSUME_PROVIDED += "git-native"
ASSUME_PROVIDED += "m4-native"
ASSUME_PROVIDED += "ncurses-native"
ASSUME_PROVIDED += "openssl-native"
ASSUME_PROVIDED += "pax-utils-native"
ASSUME_PROVIDED += "qmake-native"
ASSUME_PROVIDED += "quilt-native"
ASSUME_PROVIDED += "readline-native"
ASSUME_PROVIDED += "zlib-native"


