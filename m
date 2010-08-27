Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <lazy.gopher@gmail.com>) id 1Op39z-0000gK-1y
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Aug 2010 19:56:15 +0200
Received: by iwn2 with SMTP id 2so2705396iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Aug 2010 10:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type:content-transfer-encoding;
	bh=5em6W/Cgztdq8wABi2G7HOilvTL0kH4vLRd1KztcuhE=;
	b=VHHp1l5wB0o+3WqkNcHIskBuulYG1uyCHnGlmnQE9LqNDEFUQW0ZiD94TQnfzOQPki
	iK31x32m1QCkUMBNf1mfF+ut14HEoJnKIzt0wEbvZ9201DzCcraEDefXD7lTBh4GrfyP
	o4g9cvXZqkxx9AqyYti2kWG2LHc1I8ARi7NhM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=YDSC8AWvZrtjaTdYAspVZUHTAEr1h14ZXtaBoKB7xA0Khrrb34H3G90nbnZCLYDPaQ
	E77ZX6KPWgs3WclDdIiuWRikGbte/MfivEykfeSFHfgLu3ZfkYUxBNsWythYg+dXU+Qr
	eTLcp7QLWnW8iCVqRoUIC7pEQ4ksy6mRvvTKU=
MIME-Version: 1.0
Received: by 10.231.183.81 with SMTP id cf17mr1478361ibb.32.1282931746564;
	Fri, 27 Aug 2010 10:55:46 -0700 (PDT)
Received: by 10.231.142.90 with HTTP; Fri, 27 Aug 2010 10:55:46 -0700 (PDT)
Date: Fri, 27 Aug 2010 19:55:46 +0200
Message-ID: <AANLkTikEXrrN54mzFeDmxwm=kPYpLSz1XJww0tFBVuwW@mail.gmail.com>
From: Maksym Parkachov <lazy.gopher@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: lazy.gopher@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Custom kernel + TI - modules
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
X-List-Received-Date: Fri, 27 Aug 2010 17:56:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi everyone,

I'm building a custom image based on the unstable angstrom (couple of
weeks old openembedded) with custom kernel.

DISTRO =3D "angstrom-2008.1"
MACHINE =3D "beagleboard"

I created the build/conf/machine/beagleboard.conf with
PREFERRED_PROVIDER_virtual/kernel =3D "linux-xenomai"
and put the overlay in bb search path.

The linux-xenomai_2.6.33.7.bb recipe is found and perfectly built with
bitbake virtual/kernel.
I can boot the console image and everything works.

But, when I try to build the ti-gstreamer and corresponding ti kernel
modules, they got compiled with some weird version.

In the sysroot/kernel for some reason the config is called 2.6.32.7
(where the 32 comes from ? I'm building the 33 kernel, but .7 is found
correct) and all ti-modules are built in

$ ls lib/modules/2.6.32.7/kernel/drivers/dsp/
cmemk.ko =C2=A0dsplinkk.ko =C2=A0lpm_omap3530.ko =C2=A0sdmak.ko

All other modules, coming from the kernel configuration, are correctly
built as 33.7 and installed in /lib/modules/2.6.33.7/

I would really appreciate if someone could enlighten me, where is the
32 version could come from.

Regards,
Maksym.


