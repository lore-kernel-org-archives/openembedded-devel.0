Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PAGp5-00030e-V1
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Oct 2010 08:46:24 +0200
Received: by gxk22 with SMTP id 22so1917179gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Oct 2010 23:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=hJ+2nmbI65/Zw3nJLjeAKJeZurxBBQyNTdVJ3f/vvSE=;
	b=EKFFHXFPfL9XiarkT32DmkMZ+PhjFwOR+8SQAuOEWE1mLjxdPhFxdzjymaDlY96Pw3
	Lb++r7ydwzyq3F0E6QbbrJstNcz81nB3AmFGRaFrXGqBXFMx3bZVgSRJ03B/i3+KGCuW
	Y4ygtZFX3Ek5hIFkKB8U2cJxVRRIBmCatfxV8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=GO+dwevdgxYn6qyA4wCSAOKIaHbNT9aSqaI0HDGtYrhMXbEpDbm7EX4MgTw6dvfac4
	1qJHnRqje76Nxfm9kV34K3XaR2K5IVdSMUSYy6hZFCAL4tNnbmnWFJWcNOarhObR4scZ
	LC9Inv4uiN9QmCXVccIAXpRZYgAwVTynsTqY0=
MIME-Version: 1.0
Received: by 10.42.210.139 with SMTP id gk11mr4854699icb.317.1287989142679;
	Sun, 24 Oct 2010 23:45:42 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Sun, 24 Oct 2010 23:45:42 -0700 (PDT)
Date: Mon, 25 Oct 2010 08:45:42 +0200
Message-ID: <AANLkTim1GALcyTjqpHAmy1L=8SqomVLqrKr7dYOwFhc4@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Revert + apologies (was: Re: [oe-commits] Frans Meulenbroeks : lsof/lsof_4.83.bb: removed unneeded EXTRA_OEMAKE)
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
X-List-Received-Date: Mon, 25 Oct 2010 06:46:24 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/10/25 Andrea Adami <andrea.adami@gmail.com>:
> build breaks on do_compile after that commit
>
> Needs investigation
>
> Andrea

Oops.
Apparently this was not well enough tested. My sincere apologies!
I've reverted all the patches that removed EXTRA_OEMAKE = "".

What happened was that I was being told on irc that comparing the
output from bitbake -e before and after making the change was
sufficient.
I've tested one recipe more in-depth and that worked fine, then
further relied upon comparing the bitbake -e results.
This proved to be a sound method when dealing with EXTRA_OECONF.
Apparently however it was not good enough for EXTRA_OEMAKE and some if
not most recipes are not in my regular build (definitely the older
versions are not).

I'll try to peek into this later. Anyway, again my apologies for any
inconvenience caused and thanks to Andrea for reporting this!

Best regards, Frans


