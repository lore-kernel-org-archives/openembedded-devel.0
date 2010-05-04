Received: from mail-pz0-f191.google.com ([209.85.222.191])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1O9Kdq-0005xo-Kr
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 May 2010 18:06:54 +0200
Received: by pzk29 with SMTP id 29so1835837pzk.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 May 2010 09:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=Bz4G6h452t8ZEhEewkL/RCXMaTObtBPB7NltuQY9ES8=;
	b=Epv/XrQ8YkxhwqAuT5vtBMRT0w7clx1Dsl1QRXAVCivMtS1+ll0k2dTKHkKgX280zm
	/ePKhPSptFwC2nlFFDb2VCHNo1YJwMtgCzhw2nDT3bat5C0iN3PZx08RsO19VMjidz3x
	gP9oODR/gh85W7PTl6cS1+6yUj3Evg88l+8V8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=jA7fhgtj5nVeEnGsEJG3M2F+/lJ3aiZbCQ41F/V0EH5LJ56TIuCAJQrD1Q9cCP1C3u
	Y7pAoMRKINO6qmC7sBwRoyH/xOj7JblE6fK/ZGPteKHz0928JSNUVX8BiUwPCXNLvWTK
	c4CrcSkTo8b/O3oVg+biOWiFd3W6j+4Mij5SU=
MIME-Version: 1.0
Received: by 10.141.90.20 with SMTP id s20mr4540365rvl.190.1272988953794; Tue, 
	04 May 2010 09:02:33 -0700 (PDT)
Received: by 10.141.50.20 with HTTP; Tue, 4 May 2010 09:02:33 -0700 (PDT)
In-Reply-To: <p2rde65d1f11005040816q3d4b1201y9eac356634db14fa@mail.gmail.com>
References: <p2rde65d1f11005040816q3d4b1201y9eac356634db14fa@mail.gmail.com>
Date: Tue, 4 May 2010 18:02:33 +0200
Message-ID: <s2wc384c5ea1005040902v77808234je982a023baea89f4@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.222.191
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Build uncompressed kernel
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
X-List-Received-Date: Tue, 04 May 2010 16:07:25 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello (again) Dmitry,

On Tue, May 4, 2010 at 5:16 PM, Dmitry Vinokurov <df6.626@gmail.com> wrote:
> about 0.8-0.9 seconds, and boot time is much more critical for my system
> than image size, so even 0.5 seconds is really important. Bootloader is

Also, consider using execute-in-place (XIP) stuff, this removes the
loading stage from Flash to RAM.

Also, consider using a DMA controller to copy from Flash to RAM,
although not much around publicly for that.

Regards,
-- 
Leon


