Received: from [209.85.218.226] (helo=mail-bw0-f226.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stuart68@gmail.com>) id 1MtSQE-0006XZ-8Y
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Oct 2009 22:38:45 +0200
Received: by bwz26 with SMTP id 26so451301bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Oct 2009 13:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=JTfOBfTlRQ11o6hW2uNPDpNTm53QONj/gKTtJUKYKYA=;
	b=eJzeY/bQBD+5QrF+Pasna6Sw1pXsIzEnA0YelVYZyUR/VoJPPC65yKBv/ouK40xAPc
	Pp02BcUGA87h8JKyX0bh001RfDVctsB6b/8KydVmzepRSbO9QF5+V3dYmIwabTVSoz1O
	+UqS9bCuedbY5O6/9iecfvKyH0ML94LOyD51s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=ey4ze7HZWCCbZhQOVowWP7BoJFVragAjPfLe1uMbNoYmn1ldXPkxyxj2IqsaCgeUeU
	7/LRuu5pVv+/Tlcs+mN3fLp/qmPDxOBKjGzu1D1epe68q/ZjVf08uVSbtdq71QMrnv0+
	+CmnqILsQjDU1YrDFdmu5yNT1wOnhivVPpfYo=
MIME-Version: 1.0
Received: by 10.204.155.67 with SMTP id r3mr345655bkw.94.1254429477088; Thu, 
	01 Oct 2009 13:37:57 -0700 (PDT)
Date: Thu, 1 Oct 2009 21:37:57 +0100
Message-ID: <91283b620910011337m7c24ace5v8f263e4dcabe06a@mail.gmail.com>
From: Stuart Gray <stuart68@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.218.226
X-SA-Exim-Mail-From: stuart68@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Kernel Configuration - what affect the way ethernet port functions
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
X-List-Received-Date: Thu, 01 Oct 2009 20:38:45 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

Is there anything in the kernel set up apart from including the smsc911
module by default that would affect the way that the port is set up when it
is a DHCP Client i.e. it receives its IP Address from a router.

I am getting the broadcast address set to 0.0.0.0.

If this is not kernel related then are there any flags that require to be
set that control hos the smsc91C11 part functions?

I really need help to resolve this issue.

Cheers,
Stuart

