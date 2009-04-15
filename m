Received: from [209.85.218.219] (helo=mail-bw0-f219.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1Lu25N-0006DS-Rz
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Apr 2009 12:11:19 +0200
Received: by bwz19 with SMTP id 19so2792394bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Apr 2009 03:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=q5Eu2Pp0v0+GzJ99BTZYf9vEHkyz1o/T3EKKEq+xUY0=;
	b=k28CX3iG5hoJzmjFqbHENZUL0A4NJoe1hoSkqCJvn90xOg6Kl/HBxffjPevmxP5LqM
	gGLyDwaMMlf6jeWpjpHvnrhE5hSoXKf1kOR98+M6J32Qa9roOazH6DmfRMTQHypPrqkw
	nJx8K+ohYpJhwzgfst9tNbaYx1M+cIsioFu5Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=aU6Gyl6I5kpsp411qCTVBoB9DCmeAdKYP1dwstep7qBfGeuHybaRWcdS22EltI6mlG
	BLnAchQABGx+UYmNCDiV+sL1dnaJS2wncWMtNm4nWtXylWQcnT4oeWZJ7RhzLISYkWKk
	DpZ+gaKARjOYMm9WPkOJCM6t59bD3LDB9Odfs=
MIME-Version: 1.0
Received: by 10.223.107.9 with SMTP id z9mr18859fao.1.1239790049559; Wed, 15 
	Apr 2009 03:07:29 -0700 (PDT)
In-Reply-To: <gs4al7$76r$1@ger.gmane.org>
References: <1239788125.3467.8.camel@x60.spackhandychoptubes.co.uk>
	<gs4al7$76r$1@ger.gmane.org>
Date: Wed, 15 Apr 2009 12:07:29 +0200
Message-ID: <d1b08f940904150307y125d2297t93b320a3a2ffd473@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.218.219
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=5.0 tests=AWL,BAYES_00,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: kexec-tools-static build failue for zaurus collie
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
X-List-Received-Date: Wed, 15 Apr 2009 10:11:19 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Yes, problem with recent kernels (>2.6.28 ?) and klibc.
See http://lists.linuxtogo.org/pipermail/openembedded-devel/2009-April/009377.html

As workaround you can build kexecboot against an older kernel.

Apart this, we have a very old kexec-tools in OE.
http://www.kernel.org/pub/linux/kernel/people/horms/kexec-tools/
Worth to upgrade?

Regards

Andrea


