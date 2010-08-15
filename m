Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OkhSg-0000Kf-GT
	for openembedded-devel@lists.openembedded.org;
	Sun, 15 Aug 2010 19:57:36 +0200
Received: by iwn38 with SMTP id 38so825963iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Aug 2010 10:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=mE2XYkw6sGn9YYrRuXZtou0eJxglEZbtQnkfDCBX9Po=;
	b=IP165SqOgC7/97v2qi5w1hSB2m8ON7pPv+4Th0BgRcqPO96K3Y5i2MVdJfDh+tyPty
	nE33USzWBaHLUSXdlIy/daXBoXWDEaYxnUnUIn0npP6ftW6bz6QftG6Aq87kN03BzdJE
	ZcExUbF4aMi2xWONjhS5iM7wX3+KdJ1S7tHDw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=MW40EhY3julcmnfyiWuA2vTZCNuWCUkcJCN6sHsmiajrmNZURymfZtFPLeeobciWk5
	3y3wDSJrMu0B+ks8hRHZgzXijD0Ud7XLQeUgZFcdV+nvzJJ4gLVU9oL4uMEkfZ9b+VQc
	TfmPM9yB6v6pg788t0xYrBgFdrN1M86GDKdow=
MIME-Version: 1.0
Received: by 10.231.167.196 with SMTP id r4mr4597840iby.29.1281895039484; Sun,
	15 Aug 2010 10:57:19 -0700 (PDT)
Received: by 10.231.208.72 with HTTP; Sun, 15 Aug 2010 10:57:19 -0700 (PDT)
Date: Sun, 15 Aug 2010 19:57:19 +0200
Message-ID: <AANLkTin+BJXs2t0JvaiczJUdk9nxrp8zGAM+J=0Qn95+@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: missing patch files !
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
X-List-Received-Date: Sun, 15 Aug 2010 17:57:37 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

I did a grep on the the patch files.
Below is a list of recipes that cannot build due to missing patches.
THe list also gives the patch

Can the recipe owners of those recipes fix things? (or remove the recipe)

If no action is taken I'll move those recipes to the nonworking dir next week.

Thanks alot! Frans

hostap/hostap-modules-rawtx_0.4.7.bb: hostap-driver-0.4.7.patch

mamona/bash-noemu_3.2.bb 001-005.patch

libtool: add_dolt.patch
libtool-cross_2.2.6a.bb:DOLT_PATCH_arm = " file://add_dolt.patch"
libtool-cross_2.2.6a.bb:DOLT_PATCH_i586 = " file://add_dolt.patch"
libtool-cross_2.2.6b.bb:DOLT_PATCH_arm = " file://add_dolt.patch"
libtool-cross_2.2.6b.bb:DOLT_PATCH_i586 = " file://add_dolt.patch"

linux:
linux-omap-multi-psp_2.6.32.bb:
file://beagleboard/0001-beagleboard-omap3_-foo-_rate_table-omap35x_-foo.patch \
linux-omap-multi-psp_2.6.32.bb:
file://beagleboard/0001-board-omap3beagle-prepare-for-DM3730-based-Beaglebo.patch
\
linux-omap-multi-psp_2.6.32.bb:
file://0001-board-omap3touchbook-make-it-build-against-TI-linux.patch \
linux-rp_2.6.23.bb:           file://collie-mcp-r1.patch \
linux-rp_2.6.23.bb:           file://hx2750_make.patch;name=rppatch39 \
linux-geodegx_2.4.24.bb:
file://${WORKDIR}/Patches_Linux_${KV}_1.00/linux-${KV}-geode.patch \
linux_2.6.21+2.6.22-rc1.bb:
file://linux-2.6.21-SIMpad-serial-and-gpio_keys.patch \
linux_2.6.21+2.6.22-rc1.bb:
file://linux-2.6.21-pcmcia-device-to-platform-driver.patch \
linux-omap-multi-psp_2.6.32.bb:           file://no-mmc-spew.pat


