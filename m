Received: from [84.21.108.25] (helo=ns.penguin.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1KlgHp-0005CT-J9
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Oct 2008 10:45:21 +0200
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id 462CB140534D
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Oct 2008 10:32:21 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eNYJYqfggI0L
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Oct 2008 10:32:21 +0200 (CEST)
Received: from [192.168.1.2] (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7]) by ns.penguin.cz (Postfix) with ESMTP id 0C76E1416BA5
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Oct 2008 10:32:21 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <gc4gla$8ho$1@ger.gmane.org>
References: <gc35ba$voi$1@ger.gmane.org>
	<1222986336.5190.33.camel@dax.rpnet.com> <gc4gla$8ho$1@ger.gmane.org>
Date: Fri, 03 Oct 2008 10:41:08 +0200
Message-Id: <1223023268.3592.10.camel@utx.utx.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.1.1 
Subject: Re: Heads up: staging changes are going to land
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
X-List-Received-Date: Fri, 03 Oct 2008 08:45:21 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:

> >   FULL_OPTIMIZATION = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2"
> > -DEBUG_OPTIMIZATION = "-O -g"
> > +DEBUG_OPTIMIZATION = "-O -fno-omit-frame-pointer -g"
> >
> >
> > I think OE changed this for a reason and Poky never merged that change?
> > Maybe I don't remember right though?
> 
> AIUI you need -fno-omit-frame-pointer on ARM to do profiling, right?

Debugging as well. I just gathered, that -fomit-frame-pointer makes -dbg
packages totally unusable. Even getting a plain stack backtrace is
impossible.

If -fomit-frame-pointer is used, writing of any -dbg package makes no
sense.


________________________________________________________________________
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



