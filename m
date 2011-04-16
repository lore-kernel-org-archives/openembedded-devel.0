Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QB4ms-0004eR-9C for openembedded-devel@lists.openembedded.org;
	Sat, 16 Apr 2011 14:39:42 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QB4kb-00074A-C6 for openembedded-devel@lists.openembedded.org;
	Sat, 16 Apr 2011 14:37:21 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Apr 2011 14:37:21 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Apr 2011 14:37:21 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sat, 16 Apr 2011 14:37:08 +0200
Message-ID: <ioc2hk$1p8$1@dough.gmane.org>
References: <cover.1302954782.git.Martin.Jansa@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <cover.1302954782.git.Martin.Jansa@gmail.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [meta-oe][PATCH 0/4] Pull request #7
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
X-List-Received-Date: Sat, 16 Apr 2011 12:39:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 16-04-11 13:56, Martin Jansa wrote:
> Pull URL: git://gitorious.org/shr/meta-openembedded.git
>   Branch: jama/meta-oe
>   Browse: http://gitorious.org/shr/meta-openembedded/commits/jama/meta-oe
> 
> Thanks,
>     Martin Jansa <Martin.Jansa@gmail.com>

Thanks, applied

> ---
> 
> 
> Martin Jansa (4):
>   xserver-xorg: upgrade to 1.10.0.902
>   vala.bbclass: move from meta-efl to meta-oe as libcanberra_0.26.bb is
>     also using it
>   bluez4: merge .inc file to .bb file itself
>   bluez-hcidump: add 2.0 version and patch to build with newer bluez
> 
>  {meta-efl => meta-oe}/classes/vala.bbclass         |    0
>  .../remove.ntoh64.definition.patch                 |   42 ++++++++++++
>  .../bluez/bluez-hcidump_2.0.bb                     |   21 ++++++
>  meta-oe/recipes-connectivity/bluez/bluez4.inc      |   71 --------------------
>  .../bluez/bluez4/bluetooth.conf                    |   16 -----
>  .../fix-dfutool-usb-declaration-mismatch.patch     |   13 ----
>  .../bluez/bluez4/hid2hci_usb_init.patch            |   33 ---------
>  .../bluez/bluez4/sbc-thumb.patch                   |   11 ---
>  meta-oe/recipes-connectivity/bluez/bluez4_4.91.bb  |   71 +++++++++++++++++--
>  ...ack-assume-pixman-supports-overlapped-blt.patch |    0
>  .../hack-fbdev-ignore-return-mode.patch            |    0
>  ...rg_1.10.0.901.bb => xserver-xorg_1.10.0.902.bb} |    5 +-
>  .../xorg-xserver/xserver-xorg_git.bb               |    6 +-
>  13 files changed, 132 insertions(+), 157 deletions(-)
>  rename {meta-efl => meta-oe}/classes/vala.bbclass (100%)
>  create mode 100644 meta-oe/recipes-connectivity/bluez/bluez-hcidump-2.0/remove.ntoh64.definition.patch
>  create mode 100644 meta-oe/recipes-connectivity/bluez/bluez-hcidump_2.0.bb
>  delete mode 100644 meta-oe/recipes-connectivity/bluez/bluez4.inc
>  delete mode 100644 meta-oe/recipes-connectivity/bluez/bluez4/bluetooth.conf
>  delete mode 100644 meta-oe/recipes-connectivity/bluez/bluez4/fix-dfutool-usb-declaration-mismatch.patch
>  delete mode 100644 meta-oe/recipes-connectivity/bluez/bluez4/hid2hci_usb_init.patch
>  delete mode 100644 meta-oe/recipes-connectivity/bluez/bluez4/sbc-thumb.patch
>  rename meta-oe/recipes-graphics/xorg-xserver/{xserver-xorg-1.10.0.901 => xserver-xorg-1.10.0.902}/hack-assume-pixman-supports-overlapped-blt.patch (100%)
>  rename meta-oe/recipes-graphics/xorg-xserver/{xserver-xorg-1.10.0.901 => xserver-xorg-1.10.0.902}/hack-fbdev-ignore-return-mode.patch (100%)
>  rename meta-oe/recipes-graphics/xorg-xserver/{xserver-xorg_1.10.0.901.bb => xserver-xorg_1.10.0.902.bb} (82%)
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNqY1zMkyGM64RGpERAvMHAJ923J1rDA1DcnsJjrsX/ZzU/QEHrACaAvSF
v4g8aSTzYPVkmPeD1VOhAhc=
=53+a
-----END PGP SIGNATURE-----



