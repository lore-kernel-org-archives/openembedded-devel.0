Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RHFnm-0005k6-7a for openembedded-devel@lists.openembedded.org;
	Fri, 21 Oct 2011 16:10:26 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RHFi5-0003QP-PY for openembedded-devel@lists.openembedded.org;
	Fri, 21 Oct 2011 16:04:33 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Oct 2011 16:04:33 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Oct 2011 16:04:33 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 21 Oct 2011 16:04:18 +0200
Message-ID: <j7ru52$7mq$1@dough.gmane.org>
References: <cover.1319205291.git.otavio@ossystems.com.br>
	<009ed9f76dd5f8b17a89881366903f070b6e8a1b.1319205291.git.otavio@ossystems.com.br>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
In-Reply-To: <009ed9f76dd5f8b17a89881366903f070b6e8a1b.1319205291.git.otavio@ossystems.com.br>
X-Enigmail-Version: 1.3.2
Subject: Re: [meta-oe][PATCH 5/5] task-basic: add "serial-console" machine feature
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
X-List-Received-Date: Fri, 21 Oct 2011 14:10:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 21-10-11 15:55, Otavio Salvador schreef:
> The "serial-console" machine feature makes the task-basic recommends 
> systemd-serialgetty so serial tty works out of box.
> 
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br> --- 
> meta-oe/recipes-core/tasks/task-basic.bb |    1 + 1 files changed, 1
> insertions(+), 0 deletions(-)
> 
> diff --git a/meta-oe/recipes-core/tasks/task-basic.bb
> b/meta-oe/recipes-core/tasks/task-basic.bb index 34aa7e1..d130313 100644 
> --- a/meta-oe/recipes-core/tasks/task-basic.bb +++
> b/meta-oe/recipes-core/tasks/task-basic.bb @@ -47,6 +47,7 @@
> RDEPENDS_${PN} = "\ RRECOMMENDS_${PN} = "\ ${MACHINE_EXTRA_RRECOMMENDS}
> \ ${@base_contains("MACHINE_FEATURES", "usbhost", "usbutils", "", d)} \ +
> ${@base_contains("MACHINE_FEATURES", "serial-console",
> "systemd-serialgetty", "", d)} \ ${@base_contains("MACHINE_FEATURES",
> "alsa", "alsa-utils-alsamixer", "", d)} \ 
> ${@base_contains("MACHINE_FEATURES", "usbgadget", "kernel-module-g-ether
> kernel-module-g-serial kernel-module-g-mass-storage", "", d)} \ \

As we discussed briefly on IRC, DISTRO_FEATURE or IMAGE_FEATURE might be
better. So, what do others think?

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFOoXviMkyGM64RGpERAheGAJoDXgXaUrRz2CsNGj75/Ftuk0/HEQCePVqo
s2pquzXlMBHh3l1YjLASZSU=
=6Hwz
-----END PGP SIGNATURE-----



