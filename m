Received: from [84.21.108.25] (helo=ns.penguin.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1MoFuj-0007ze-NT
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Sep 2009 14:16:44 +0200
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id 47F7A140972C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Sep 2009 14:09:58 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IaUgcN00fSX7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Sep 2009 14:09:58 +0200 (CEST)
Received: from [10.20.1.86] (nat.scz.novell.com [213.151.88.252])
	by ns.penguin.cz (Postfix) with ESMTP id DB9661416BA5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Sep 2009 14:09:57 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <h8t0ia$9d9$1@ger.gmane.org>
References: <20090917054034.GB5465@denix.org>  <h8t0ia$9d9$1@ger.gmane.org>
Date: Thu, 17 Sep 2009 14:16:08 +0200
Message-Id: <1253189768.6118.11.camel@hammer.suse.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.27.91 
X-SA-Exim-Connect-IP: 84.21.108.25
X-SA-Exim-Mail-From: utx@penguin.cz
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [RFC] -dbg for static libraries?
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
X-List-Received-Date: Thu, 17 Sep 2009 12:16:44 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
> > Would it make sense to package stripped version of a static lib into -dev and
> > the full version into corresponding -dbg?
> 
> What about the stripped version in -dev and the corresponding symbols in 
> -dbg?

Or:

1. Disable static by default. Static libraries are rarely needed.
Recipes (or distros) that want static libraries must explicitly enable
it.


2. What about -dev, -dbg, -static and -static-dbg? I have tens of .a
files installed on my microdrive, because .so* are sufficient.

Four sub-packages may sound as a overkill, but I don't think so. Static
counterparts of shared libraries are really very rarely needed.

It would need to improve the splitting logic a bit, but it is still
possible to automatize it:

- libfoo.so was installed -> libfoo.a should go to -static and dbg to
-static-dbg.

- libfoo.a was installed alone -> libfoo.a should go to -static and dbg
to -static-dbg.

- very few packages need to be handled individually (e. g. glibc,
packages that install libfoo_pic.a etc.)

-- 
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



