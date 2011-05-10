Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QJljB-0007g1-6d for openembedded-devel@lists.openembedded.org;
	Tue, 10 May 2011 14:07:49 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QJlgX-0003kJ-Rj for openembedded-devel@lists.openembedded.org;
	Tue, 10 May 2011 14:05:05 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 May 2011 14:05:05 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 May 2011 14:05:05 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 10 May 2011 13:57:39 +0200
Message-ID: <iqb97j$uh2$2@dough.gmane.org>
References: <cover.1305027503.git.Martin.Jansa@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <cover.1305027503.git.Martin.Jansa@gmail.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [meta-oe][PATCH 0/9] Pull request #8
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
X-List-Received-Date: Tue, 10 May 2011 12:07:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 10-05-11 13:39, Martin Jansa wrote:
> Hi,
> 
> please merge small fixes I had in contrib/shr for some time
> 
> Pull URL: git://gitorious.org/shr/meta-openembedded.git
>   Branch: jama/meta-oe
>   Browse: http://gitorious.org/shr/meta-openembedded/commits/jama/meta-oe

Applied, thanks

> 
> Thanks,
>     Martin Jansa <Martin.Jansa@gmail.com>
> ---
> 
> 
> Martin Jansa (8):
>   udev: drop udev-compat for zaurus devices
>   libxfixes, util-macros: drop from meta-oe, now they are in oe-core
>   gst-plugins-base: drop 0.10.30 from meta-oe, there is 0.10.32 in
>     oe-core
>   xinput-calibrator: add new version 0.7.5 and include .inc to recipe
>     directly
>   python-argparse: add new recipe to provide argparse module for python
>     and python-native older then 2.7
>   gdbus-binding-tool: bump SRCREV
>   glib-2.0: add git version for 2.29.3+git, which has gdbus-codegen
>     included
>   connman: drop older 0.72
> 
> Simon Busch (1):
>   connman: add recipe for the latest released version 0.73
> 
>  meta-oe/recipes-connectivity/connman/connman.inc   |    5 +
>  .../connman/{connman_0.72.bb => connman_0.73.bb}   |    4 +-
>  meta-oe/recipes-core/glib-2.0/glib-2.0.inc         |    6 +
>  .../60_wait-longer-for-threads-to-die.patch        |   33 ++++++
>  .../glib-2.0/glib-2.0/configure-libtool.patch      |   38 +++++++
>  .../glib-2.0/glib-2.0/g_once_init_enter.patch      |   24 +++++
>  .../glib-2.0/glib-2.0/glib-gettextize-dir.patch    |   24 +++++
>  .../recipes-core/glib-2.0/glib-2.0/no-iconv.patch  |  104 ++++++++++++++++++++
>  .../glib-2.0/remove.test.for.qsort_r.patch         |   54 ++++++++++
>  meta-oe/recipes-core/glib-2.0/glib-2.0_git.bb      |   29 ++++++
>  meta-oe/recipes-core/glib-2.0/glib.inc             |   37 +++++++
>  meta-oe/recipes-core/udev/udev_165.bb              |   26 -----
>  .../gdbus-binding-tool/gdbus-binding-tool_git.bb   |    6 +-
>  .../python/python-argparse_1.2.1.bb                |   16 +++
>  .../xinput-calibrator/xinput-calibrator.inc        |   12 ---
>  .../xinput-calibrator/xinput-calibrator_0.6.1.bb   |   17 ---
>  .../xinput-calibrator/xinput-calibrator_0.7.5.bb   |   22 ++++
>  meta-oe/recipes-graphics/xorg-lib/libxfixes_5.0.bb |   22 ----
>  .../xorg-util/util-macros_1.13.0.bb                |   15 ---
>  .../xorg-util/xorg-util-common.inc                 |   11 --
>  .../gst-plugins-base-tremor.patch                  |   17 ---
>  .../gstreamer/gst-plugins-base_0.10.30.bb          |   22 ----
>  .../recipes-multimedia/gstreamer/gst-plugins.inc   |   41 --------
>  23 files changed, 397 insertions(+), 188 deletions(-)
>  rename meta-oe/recipes-connectivity/connman/{connman_0.72.bb => connman_0.73.bb} (80%)
>  create mode 100644 meta-oe/recipes-core/glib-2.0/glib-2.0.inc
>  create mode 100644 meta-oe/recipes-core/glib-2.0/glib-2.0/60_wait-longer-for-threads-to-die.patch
>  create mode 100644 meta-oe/recipes-core/glib-2.0/glib-2.0/configure-libtool.patch
>  create mode 100644 meta-oe/recipes-core/glib-2.0/glib-2.0/g_once_init_enter.patch
>  create mode 100644 meta-oe/recipes-core/glib-2.0/glib-2.0/glib-gettextize-dir.patch
>  create mode 100644 meta-oe/recipes-core/glib-2.0/glib-2.0/no-iconv.patch
>  create mode 100644 meta-oe/recipes-core/glib-2.0/glib-2.0/remove.test.for.qsort_r.patch
>  create mode 100644 meta-oe/recipes-core/glib-2.0/glib-2.0_git.bb
>  create mode 100644 meta-oe/recipes-core/glib-2.0/glib.inc
>  create mode 100644 meta-oe/recipes-devtools/python/python-argparse_1.2.1.bb
>  delete mode 100644 meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator.inc
>  delete mode 100644 meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_0.6.1.bb
>  create mode 100644 meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_0.7.5.bb
>  delete mode 100644 meta-oe/recipes-graphics/xorg-lib/libxfixes_5.0.bb
>  delete mode 100644 meta-oe/recipes-graphics/xorg-util/util-macros_1.13.0.bb
>  delete mode 100644 meta-oe/recipes-graphics/xorg-util/xorg-util-common.inc
>  delete mode 100644 meta-oe/recipes-multimedia/gstreamer/gst-plugins-base-0.10.30/gst-plugins-base-tremor.patch
>  delete mode 100644 meta-oe/recipes-multimedia/gstreamer/gst-plugins-base_0.10.30.bb
>  delete mode 100644 meta-oe/recipes-multimedia/gstreamer/gst-plugins.inc
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNySgzMkyGM64RGpERAookAJ970DTnwqWpnQZIgQp4MuF7RzIrxwCgvTDz
pT+2hxISlVgqULqQrDPFyDw=
=1cAw
-----END PGP SIGNATURE-----



