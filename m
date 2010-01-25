Received: from mail-yw0-f178.google.com ([209.85.211.178])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NZK46-0000yh-Oc
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Jan 2010 09:12:58 +0100
Received: by ywh8 with SMTP id 8so954495ywh.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Jan 2010 00:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:mime-version:content-type:content-disposition:user-agent;
	bh=nFTL9jpXI6/9/DZK3ySai80sG0gZbyfj71LtMWEBRuQ=;
	b=fx5IfGzOr4knm3bWUNw8z+XJqPyh0fyEn42z9l1eBB4Mq5Zyu5/AJwxpLGa/0u1+TC
	Vc4sbC0M6046632whjWm3/GP086Dc4fiGDTZBfxZ4oPGmDnSuMHzHw7iq4wfpojw2dCT
	9kWB/4EcLFtadiq9OvD5S4fOzu/PysHG+mFQQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	b=U4TW7Uj/qScH5diZKEI85y+UFxswPGW9IATsU8xvUZkwuN+VK9GkK5SSqtaUYDZjnl
	p+Hs8lra8cPbN7IU5viKfsMhA9WIwWxPiP1jt22LaaDHve1tV2UI+sf4RGAuT3ZoJTLQ
	HvXmjIijK0qS55y+FUd/544JMlQkjKirNHUnk=
Received: by 10.91.84.14 with SMTP id m14mr1079468agl.87.1264407030565;
	Mon, 25 Jan 2010 00:10:30 -0800 (PST)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id 22sm1569126yxe.3.2010.01.25.00.10.29
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 25 Jan 2010 00:10:30 -0800 (PST)
Date: Mon, 25 Jan 2010 00:10:44 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100125081044.GA26355@gmail.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.211.178
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [RFC] Remove gcc configure option --enable-target-optspace for powerpc
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
X-List-Received-Date: Mon, 25 Jan 2010 08:12:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi

I have run into a problem where compiling libgcc with -Os for powerpc SPE
targets caused some symols like _restgpr_Y_x to be referenced in
libgcc_s.so.1 due to gcc generating them for out-of-line prologues which
happens with Os. But these symbols are defined in libgcc.a so when linking 
a shared library which uses libgcc we get errors from linker complaining
that DSO is accessing a hidden symbol from libgcc.a which is a static
archive.

I thought we could remove --enable-target-optspace. In general it is only
used to compiling the gcc libraries e.g. libgcc libstdc++ etc. in OE
context so its not of a much hit on space usage if we let this option go
which would mean that these libraries would be compiled with -O2

I propose to remove this option for all powerpc and we can still leave it
in for other architectures. 

Does this sound reasonable ?

Thanks

-Khem


