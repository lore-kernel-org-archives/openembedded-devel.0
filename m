Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <slapinid@gmail.com>) id 1O4YNP-0003yF-AI
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Apr 2010 13:45:56 +0200
Received: by wyb29 with SMTP id 29so797407wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Apr 2010 04:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:received:message-id
	:subject:from:to:content-type;
	bh=4Ae+JPmi6YnWkayvqeWYYYMuQRivBFKf/BYadVmYFwU=;
	b=qoypPG2jFAOidgWKY4C3lN9XrFfAn7+OtqVjp2aXiV7ShWmC5jTRuu8irp8kCyZ0Ct
	CqnvdqbIDwQpXLO/1P1IK/a4yeJyxxSmbh+g0W5sdidDFvmBWO5r0JUaXlE8NNhDiqjM
	V+H3piw9aDQSv6XnNneXcJxPdYSZilPqjmZtQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=r0MYv8YfaEKgW6UVHaRHxE+N7J4zxyWMFW/4gn527czxHS0Hsr/+I8IOzA8xMazqJB
	wF4k5iuiNYBhiNMjHlz6B9dH4XlmrotOOsT8JhreCm7m2LgwpbdhhSpsG3iKa3PyAHPc
	kESNrMIL4pP7mEONuEYmfxNjdYqi1soXOYnpk=
MIME-Version: 1.0
Received: by 10.216.182.70 with HTTP; Wed, 21 Apr 2010 04:42:20 -0700 (PDT)
Date: Wed, 21 Apr 2010 15:42:20 +0400
Received: by 10.216.89.200 with SMTP id c50mr1854694wef.164.1271850140196; 
	Wed, 21 Apr 2010 04:42:20 -0700 (PDT)
Message-ID: <j2p48239d391004210442z909598e4wb60d09e0ac36c5fa@mail.gmail.com>
From: Sergey Lapin <slapinid@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: slapinid@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: hunt for ideas: icecc+canadian compilers
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
X-List-Received-Date: Wed, 21 Apr 2010 11:45:56 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi, all!

I've got hand-made "cluster" at home consisting of 2 SheevaPlugs,
several other ARM devices
and 3 x86 laptops, one with CoreDuo, another 2 with Celerons, and a
small MIPS router, just for testing.

I have successfully compile GTK+ for ARM on it, using native ARM
toolchaine on ARM boxes
and x86->arm cross compilers on x86 boxes. I have some PowerPC and
MIPS boxes I can add to this, too.
It is of course, quite fast thing, and I can do build Ubuntu packages
directly on Sheeva using other boxes power.

Now, I just want to build OE the similar way, but that requires for OE
to build canadian cross-compilers
for all available architectures, build environments for them and make
appropriate ICECC_VERSION variable
in form ICECC_VERSION="/path/to/native-cross.tar.gz,
arm:/path/to/arm-arm-noncross.tar.gz,mips:arm-mips-cross.tar.gz, ..."

Is it possible now with minimal effort, or avar planned in future? Any
ideas on implementation if not planned?

Thanks a lot,
S.


