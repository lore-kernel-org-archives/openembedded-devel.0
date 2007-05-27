Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1HsKrn-0006uk-1T
	for openembedded-devel@openembedded.org; Sun, 27 May 2007 17:41:19 +0200
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l4RFddox006835 for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 May 2007 17:39:42 +0200
Message-ID: <4659A63B.9080901@dominion.kabel.utwente.nl>
Date: Sun, 27 May 2007 17:39:39 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.10 (Macintosh/20070221)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <200705271638.03886.openembedded@hrw.one.pl>
In-Reply-To: <200705271638.03886.openembedded@hrw.one.pl>
X-Enigmail-Version: 0.94.2.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: RFC: MACHINE_ namespace
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 27 May 2007 15:41:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Marcin Juszkiewicz schreef:
> During usage of progear device (now packed due to lack of space) I found 
> a problems related to how we use machine configs and X11.
> 
> 1. We have "alsa" as one of machine features but no way to control kernel 
> modules for it - all are added into machine config as 
> MACHINE_EXTRA_RRECOMMENDS. Same goes to other features.
> 
> 2. Progear device use X.org instead of KDrive so I had to create own 
> images for it because by default we do not have a way to tell which X 
> drivers need to be present in images.
> 
> 
> Proposed solution is adding MACHINE_ namespaces:
> 
> MACHINE_KERNEL_ALSA   = "kernel-module-snd-ali5451"
> MACHINE_KERNEL_PCMCIA = "kernel-module-yenta-socket"
> 
> And other MACHINE_KERNEL_feature to control stuff used in task-base.
> 
> MACHINE_X11_SERVER  = "xserver-xorg"
> MACHINE_X11_DRIVERS = "xf86-video-siliconmotion xf86-input-mutouch"
> 
> MACHINE_X11_SERVER will replace XSERVER used now, MACHINE_X11_DRIVERS will 
> allow to add needed drivers to X11 images for device without creating 
> custom ones.
> 
> What do you think about this proposal?

Sounds pretty good, do you have a patch for it?

regards,

Koen


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGWaY7MkyGM64RGpERAo7vAJ9XGOvAsqKq4cLXv1nhCIH0JCts9ACfVAMr
gb542366W8K6bgr2tOxroV8=
=iSVA
-----END PGP SIGNATURE-----


