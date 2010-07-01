Received: from ns.penguin.cz ([84.21.108.25])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1OUT7h-0000Qq-5r
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Jul 2010 01:24:50 +0200
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id 4795F1417193
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Jul 2010 01:24:40 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u2WHBn1cpC5V
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Jul 2010 01:24:31 +0200 (CEST)
Received: from [192.168.1.2] (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7]) by ns.penguin.cz (Postfix) with ESMTP id 50D731416BA8
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Jul 2010 01:24:30 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4C2D198E.6010603@mentor.com>
References: <1278021938.8213.7.camel@utx.utx.cz> <4C2D198E.6010603@mentor.com>
Date: Fri, 02 Jul 2010 01:19:56 +0200
Message-ID: <1278026396.8213.51.camel@utx.utx.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-SA-Exim-Connect-IP: 84.21.108.25
X-SA-Exim-Mail-From: utx@penguin.cz
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: invalid removal of rpath from native binaries during installation or staging
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
X-List-Received-Date: Thu, 01 Jul 2010 23:24:50 -0000
Content-Type: text/plain; charset="ISO-8859-2"
Content-Transfer-Encoding: 7bit

Tom Rini wrote:

> Can you use readelf -d on your perl?  The whole point of the relative 
> path calculation that relocatable.bbclass does is to fix the hard cases 
> like perl.   Thanks!
> 

I found the problem:

The runtime expansion of $ORIGIN works only if /proc is mounted!

My build environment is a minimal openSUSE 11.2 x86_64 subset inside
chroot with no /proc, /sys, and /dev with null zero and few other static
items.

Not having /proc is an advantage in most cases (cross configure cannot
check host system), but breaks in this case.

Maybe it would be nice to allow to configure to not inherit relocatable
in native.bbclass for people who don't want to mount /proc.


________________________________________________________________________
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



