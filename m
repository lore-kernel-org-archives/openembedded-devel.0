Received: from [209.85.217.225] (helo=mail-gx0-f225.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1M7GMI-00031C-TL
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 May 2009 00:03:41 +0200
Received: by gxk25 with SMTP id 25so1016385gxk.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 May 2009 14:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=EzILZaM5dwzbjWM4aGkvDoJmbt6FzGeRzi2dUPm01rg=;
	b=GytPIou0BrxNbblTOH0KnTwBqiYSq5xUAiK8RZKwGP7LcRHYLfDHBdpk8rdINSj/nM
	BJrljazkHvxEpr84DcUWO2yLI+bfcWv1GGKI69GGsLn6Ubsu+f8s40tAhByecciu1zow
	wiutqsUbxvUhoiLX7OooJpAHdqGWPHNma0ie8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=YhH0Efk/3GI8xsbKYi2IOsku+i75sHXUuBCB2plrscmkhXVy7LinmnQmPSqltiKeex
	I/rHDMJWBEBWBAiPdQYkTyjGaIMQMhA/VMKXTE3OyWLOD3S8ujC+djVcdzCHqCoIKuSH
	qhMedVR89293D66Bx10SK1169Fcrd0dlrPaoQ=
MIME-Version: 1.0
Received: by 10.90.82.17 with SMTP id f17mr2498800agb.41.1242942908547; Thu, 
	21 May 2009 14:55:08 -0700 (PDT)
Date: Thu, 21 May 2009 23:55:08 +0200
Message-ID: <c384c5ea0905211455i5ba72709jc0b985cf097e9e3f@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Mike Westerhof <mwester@dls.net>
Subject: madwifi: Aggressive revert of my aggresive fix :-)
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
X-List-Received-Date: Thu, 21 May 2009 22:03:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello Mike,

I tried to fix the GNU_HASH issue in madwifi by leaking LDFLAGS into
the build, and respecting those flags in some Makefiles.

http://cgit.openembedded.net/cgit.cgi?url=openembedded/commit/&id=f67b2104dafeda09571259ba4c3e6019d8a0888b

hat apparently broke something for you, so you unset LDFLAGS again:

http://cgit.openembedded.net/cgit.cgi?url=openembedded/commit/&id=75d4826c3c0f7012ccee3a7116d7350f41539fa3


The tools for example, need them. Someone just ran into that problem,
that I (agressively) fixed before:

[23:16]	<tharvey>	pb_, madwifi includes some userland tools - its
those that fail the GNU_HASH based on ldflags that I'm trying to fix

So let's work towards a fix that works for both of us:

- The right fix is to leak LDFLAGS into the build from the recipe, but
unset them *only* where needed.
- Please revert your commit (i.e. unsetting LDFLAGS) and see which
part of madwifi needs LDFLAGS unset.

We will probably end up with a fix to one or two of the Makefiles instead.

Regards,
-- 
Leon


