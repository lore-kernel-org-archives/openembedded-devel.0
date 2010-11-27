Received: from mail.infrascan.de ([188.40.84.136] helo=infrascan.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <schwarzkopf@sensortherm.de>) id 1PMHuX-0003QH-HA
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Nov 2010 11:21:44 +0100
Received: from [192.168.0.20] (77-22-235-200-dynip.superkabel.de
	[77.22.235.200])
	by email.infrascan.de (Postfix) with ESMTPSA id E34431B421
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Nov 2010 11:21:43 +0100 (CET)
Message-ID: <4CF0DB6A.6010107@sensortherm.de>
Date: Sat, 27 Nov 2010 11:20:26 +0100
From: Klaus Schwarzkopf <schwarzkopf@sensortherm.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.15) Gecko/20101027 Thunderbird/3.0.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1290852938-4776-1-git-send-email-schwarzkopf@sensortherm.de>
In-Reply-To: <1290852938-4776-1-git-send-email-schwarzkopf@sensortherm.de>
X-SA-Exim-Connect-IP: 188.40.84.136
X-SA-Exim-Mail-From: schwarzkopf@sensortherm.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] download link fixed
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
X-List-Received-Date: Sat, 27 Nov 2010 10:21:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Is this patch ok or what can i do better?


Am 27.11.2010 11:15, schrieb Klaus Schwarzkopf:
> From: Klaus Schwarzkopf<schwarzkopf@sensortherm>
>
> modified the download link for the commited recipes
> ---
>   recipes/asterisk/asterisk_1.2.28.bb     |    8 ++++++--
>   recipes/bmon/bmon_2.1.0.bb              |    2 +-
>   recipes/cdtool/cdtool_2.1.8.bb          |    4 +++-
>   recipes/chillispot/chillispot_0.98.bb   |    6 +++---
>   recipes/chillispot/chillispot_1.0RC3.bb |    6 +++---
>   5 files changed, 16 insertions(+), 10 deletions(-)
>
> diff --git a/recipes/asterisk/asterisk_1.2.28.bb b/recipes/asterisk/asterisk_1.2.28.bb
> index e49e68d..e3c2009 100644
> --- a/recipes/asterisk/asterisk_1.2.28.bb
> +++ b/recipes/asterisk/asterisk_1.2.28.bb
> @@ -5,9 +5,9 @@ HOMEPAGE="www.asterisk.org"
>   LICENSE="GPL"
>   DEPENDS="ncurses zlib openssl curl alsa-lib libogg libvorbis speex"
>   SECTION = "console/telephony"
> -PR = "r2"
> +PR = "r3"
>
> -SRC_URI="http://ftp.digium.com/pub/asterisk/releases/asterisk-${PV}.tar.gz \
> +SRC_URI="http://downloads.asterisk.org/pub/telephony/asterisk/releases/${P}.tar.gz \
>   	 file://uclibc-compat-getloadavg.patch \
>   	 file://uclibc-dns.patch \
>            file://asterisk.patch \
> @@ -44,3 +44,7 @@ do_stage () {
>   FILES_${PN}-dbg += "${libdir}/asterisk/modules/.debug"
>   FILES_${PN}-dbg += "/var/lib/asterisk/agi-bin/.debug"
>
> +
> +SRC_URI[md5sum] = "facf156d84559f28ef4ce61790d161ef"
> +SRC_URI[sha256sum] = "9a63d9d34d5ed9870d988ede614665e2105007705c0a878ff1e48afbaaae1c6d"
> +
> diff --git a/recipes/bmon/bmon_2.1.0.bb b/recipes/bmon/bmon_2.1.0.bb
> index 0f263ab..e540eb5 100644
> --- a/recipes/bmon/bmon_2.1.0.bb
> +++ b/recipes/bmon/bmon_2.1.0.bb
> @@ -5,7 +5,7 @@ LICENSE = "MIT"
>   # only works with libnl-0.5.0
>   DEPENDS = "libnl"
>
> -SRC_URI = "http://people.suug.ch/~tgr/bmon/files/bmon-2.1.0.tar.gz \
> +SRC_URI = "http://distfiles.macports.org/bmon/${P}.tar.gz \
>              file://no-strip.patch"
>
>   inherit autotools
> diff --git a/recipes/cdtool/cdtool_2.1.8.bb b/recipes/cdtool/cdtool_2.1.8.bb
> index eaed3f6..1d35d6b 100644
> --- a/recipes/cdtool/cdtool_2.1.8.bb
> +++ b/recipes/cdtool/cdtool_2.1.8.bb
> @@ -7,7 +7,9 @@ DESCRIPTION="cdtool is a free software package to control the audio functions \
>   of an attached CDROM drive from the command line in a quick and scriptable way."
>   LICENSE = "GPL"
>
> -SRC_URI="http://hinterhof.net/${PN}/dist/${PN}-${PV}.tar.gz \
> +PR = "r0"
> +
> +SRC_URI="http://www.sfr-fresh.com/linux/misc/${PN}-${PV}.tar.gz \
>   	file://install-no-owner.patch"
>
>   inherit autotools
> diff --git a/recipes/chillispot/chillispot_0.98.bb b/recipes/chillispot/chillispot_0.98.bb
> index 687b17f..b9d36e7 100644
> --- a/recipes/chillispot/chillispot_0.98.bb
> +++ b/recipes/chillispot/chillispot_0.98.bb
> @@ -1,9 +1,9 @@
>   DESCRIPTION = "ChilliSpot is an open source captive portal or wireless LAN access point controller. It is used for authenticating users of a wireless LAN."
> -HOMEPAGE = "http://www.chillispot.org/"
> +HOMEPAGE = "http://www.chillispot.info/"
>   LICENSE = "GPL"
> -PR = "r2"
> +PR = "r3"
>
> -SRC_URI = "http://www.chillispot.org/download/chillispot-${PV}.tar.gz \
> +SRC_URI = "http://www.chillispot.info/download/chillispot-${PV}.tar.gz \
>   	file://no-ansi.patch \
>   	file://init"
>   RRECOMMENDS_${PN} = "kernel-module-tun"
> diff --git a/recipes/chillispot/chillispot_1.0RC3.bb b/recipes/chillispot/chillispot_1.0RC3.bb
> index 0da9706..a3f7df5 100644
> --- a/recipes/chillispot/chillispot_1.0RC3.bb
> +++ b/recipes/chillispot/chillispot_1.0RC3.bb
> @@ -1,11 +1,11 @@
>   DESCRIPTION = "ChilliSpot is an open source captive portal or wireless LAN access point controller. It is used for authenticating users of a wireless LAN."
> -HOMEPAGE = "http://www.chillispot.org/"
> +HOMEPAGE = "http://www.chillispot.info/"
>   LICENSE = "GPL"
> -SRC_URI = "http://www.chillispot.org/download/chillispot-${PV}.tar.gz \
> +SRC_URI = "http://www.chillispot.info/download/chillispot-${PV}.tar.gz \
>   	file://no-ansi.patch \
>   	file://init"
>   RDEPENDS_${PN} = "kernel-module-tun"
> -PR = "r1"
> +PR = "r2"
>
>   inherit autotools
>




