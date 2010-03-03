Received: from www.xora.org.uk ([80.68.91.202] helo=xora.vm.bytemark.co.uk)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1Nmt2u-0005TZ-7C
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Mar 2010 19:11:45 +0100
Received: from localhost (localhost [127.0.0.1])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTP id 195382C97A
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Mar 2010 18:08:54 +0000 (GMT)
X-Virus-Scanned: Debian amavisd-new at xora.vm.bytemark.co.uk
Received: from xora.vm.bytemark.co.uk ([127.0.0.1])
	by localhost (xora.vm.bytemark.co.uk [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id 91xdr5tsjSJ3
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Mar 2010 18:08:51 +0000 (GMT)
Received: from xora-desktop.xora.org.uk (188-220-34-37.zone11.bethere.co.uk
	[188.220.34.37])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTPSA id 5CDD92C979
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Mar 2010 18:08:51 +0000 (GMT)
Received: by xora-desktop.xora.org.uk (Postfix, from userid 500)
	id 6589A21732; Wed,  3 Mar 2010 18:08:51 +0000 (GMT)
Date: Wed, 3 Mar 2010 18:08:51 +0000
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100303180851.GC2493@xora-desktop.xora.org.uk>
References: <1267633819.4739.343.camel@trini-m4400>
	<hmm5pb$est$1@dough.gmane.org>
	<1267637587.4739.345.camel@trini-m4400>
MIME-Version: 1.0
In-Reply-To: <1267637587.4739.345.camel@trini-m4400>
User-Agent: Mutt/1.5.20 (2009-08-17)
X-SA-Exim-Connect-IP: 80.68.91.202
X-SA-Exim-Mail-From: dp@xora.org.uk
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] Make some big changes right after next stable
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
X-List-Received-Date: Wed, 03 Mar 2010 18:11:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 03, 2010 at 10:33:07AM -0700, Tom Rini wrote:
> Note that I'm not talking about "small" things like removing legacy
> staging stuff (which is good!) I'm talking about things with the
> potential to leave stuff non-building until stumbled upon.  Hence the
> idea we do merge this into dev shortly after the next stable.
> 
I think you are approaching things backwards.

Develop this to the point of working enough other people can start to test it
in a feature branch.

Tag org.openembedded.dev then merge this work into .dev

Anyone in the future can use the tag to get back to a "stable" point.

Graeme



