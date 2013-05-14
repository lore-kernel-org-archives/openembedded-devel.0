Received: from mail-ee0-f45.google.com ([74.125.83.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UcA3t-0006L5-KY
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 May 2013 09:54:21 +0200
Received: by mail-ee0-f45.google.com with SMTP id l10so117836eei.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 May 2013 00:36:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:content-type:content-transfer-encoding:subject
	:message-id:date:to:mime-version:x-mailer:x-gm-message-state;
	bh=6ASrZ/nAOSSnLaGZDRAxsHQr4131fbXfFn/hBTj0fAY=;
	b=CrUE7eukruuyQNA3zJkWrp1dXww5CR2CF6x30nLHZez6U44XJkDDn8AwxIH0uvHxwZ
	4duRTWiG2m0Z+jn601mmNMj3IlL1ZnqxFoejBZCCHATZNurhS+17XRoqo49KJVOQZuUt
	PZQrWtGqmjIrd6EQ2rXP0O38YaDi9WL56HIsbIb+nklfsE5gpsIgUw2lRS4+FTvO69Wf
	35beOj5IYQZzcCx4JQSo6VKqkh6wQbZ8D9qf/xCSqIKVtmeyRb39mErU+zSWuEqEQV4B
	6cdJhsYpKiTpgz9xNlEu7sRwhumHTZRdqRjAfvnVziO/IFigMUz5NA8+IYaXrz1sTbaH
	vdfQ==
X-Received: by 10.14.206.129 with SMTP id l1mr87747180eeo.30.1368516966094;
	Tue, 14 May 2013 00:36:06 -0700 (PDT)
Received: from [172.20.0.102] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id
	bj12sm27610856eeb.8.2013.05.14.00.36.04
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 14 May 2013 00:36:04 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
Message-Id: <40EC58CA-E878-4F77-8E39-4F8D86F48E29@dominion.thruhere.net>
Date: Tue, 14 May 2013 09:36:02 +0200
To: "openembedded-devel@lists.openembedded.org List"
	<openembedded-devel@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
X-Mailer: Apple Mail (2.1503)
X-Gm-Message-State: ALoCoQnTJpCNHxhPHCyeulGrjNm9SW0JNv4XSIoNRlfCUva0Ew5MYKQ1Cip6OmeXOn9CtD9h/1Ue
Subject: [RFC] Layers, PRINC and bbappends
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
X-List-Received-Date: Tue, 14 May 2013 07:54:30 -0000
X-List-Received-Date: Tue, 14 May 2013 07:54:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,

For the past 2 weeks I've been trying to fix the angstrom feeds manually =
due to a combination of PRSERV deciding that going backwards is OK and =
multiple layers getting updates that make PR go backwards as well.

Getting a simple reduction for PRSERV going backwards is nigh =
impossible[1], so I can't complain too much about that, but I can =
complain about what people do :)

What triggered PR going backwards this time was a BSP removing its =
netbase bbappend because it wasn't needed anymore. That's great, I hate =
netbase bbappends since they tend to be ifupdown specific and don't work =
as intended with connman/NM/netctl/etc. Long story short:

	ERROR: Package version for package netbase-dbg went backwards =
which would break package feeds from (0:5.0-r3.1 to 0:5.0-r1.2)
	ERROR: Package version for package netbase-staticdev went =
backwards which would break package feeds from (0:5.0-r3.1 to =
0:5.0-r1.2)
	ERROR: Package version for package netbase-dev went backwards =
which would break package feeds from (0:5.0-r3.1 to 0:5.0-r1.2)
	ERROR: Package version for package netbase-doc went backwards =
which would break package feeds from (0:5.0-r3.1 to 0:5.0-r1.2)
	ERROR: Package version for package netbase-locale went backwards =
which would break package feeds from (0:5.0-r3.1 to 0:5.0-r1.2)
	ERROR: Package version for package netbase went backwards which =
would break package feeds from (0:5.0-r3.1 to 0:5.0-r1.2)

To avoid things like that in the future I have a few recommendations I'd =
like to get feedback on:

1) For a given BSP split it in multiple layers:
	a) One 'core' BSP layer with only:
		o Bootloader
		o Kernel
		o Tooling to build bootloader/kernel/image
	b) One BSP layer with bbappends for shadow/netbase/xorg-conf/etc
	c) One or more layers with bbappends for libav/clutter/etc[2]


2) *Never* use PRINC in type b) bbappends

3) Avoid PRINC in general

4) make buildhistory.bbclass mandatory in OE-core

There's another use case that suffers from PRINC problems and that is =
removing layers when they break parsing and the maintainer is slow to =
push patches. With the current situation I have to choose between "being =
able to do builds" and "having working feeds".

During the last TSC meeting we discussed that there is currently no way =
to force maintainers to behave. I think the most we can do is have clear =
guidelines on the OE side and enforce those during the "Yocto Project =
Compatible" process.=20
And have the layer index orange/red flag layers that do stupid things. =
Come to think of it, that would actually be the most visible way to go, =
having wikipedia style warning banners on the offending layers.

Thanks,

Koen

[1] It always happens after editing bblayers.conf and dragging in major =
update to layers. Since I tend to do both at the same time I can't say =
which action triggers it or if it's the combination.
[2] I spent 3 days trying to figure out why mesa was so *$(*$(@ broken =
before I finally located the bbappends in meta-ti that were causing this =
breakage=


