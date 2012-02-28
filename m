Received: from slimlogic.co.uk ([89.16.172.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gg@slimlogic.co.uk>) id 1S2KKn-0003t0-Nz
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Feb 2012 11:31:05 +0100
Received: from xora-d-l.xora.org.uk (188-220-34-37.zone11.bethere.co.uk
	[188.220.34.37])
	by slimlogic.co.uk (Postfix) with ESMTPSA id 9F691130887
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2012 10:14:10 +0000 (GMT)
Message-ID: <4F4CA8F1.6060608@slimlogic.co.uk>
Date: Tue, 28 Feb 2012 10:14:09 +0000
From: Graeme Gregory <gg@slimlogic.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111229 Thunderbird/9.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <jii6me$ae8$2@dough.gmane.org>
	<1330423441-653-1-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1330423441-653-1-git-send-email-Martin.Jansa@gmail.com>
Subject: Re: [meta-oe][PATCHv2] mplayer2: drop virtual/kernel dependency and s/ARM/arm/ in ARM_INSTRUCTION_SET
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
X-List-Received-Date: Tue, 28 Feb 2012 10:31:05 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Undetailed change below

Graeme

On 28/02/12 10:04, Martin Jansa wrote:
> * virtual/kernel was needed only to provide omapfb.h in staging
>    but that's now moved to BSP layers, no need to make sstate hash
>    machine specific here.
>
> Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>
> ---
>   meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb |    6 +++---
>   1 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
> index 3e4d369..0b73d57 100644
> --- a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
> +++ b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
> @@ -1,7 +1,7 @@
>   DESCRIPTION = "Open Source multimedia player."
>   SECTION = "multimedia"
>   HOMEPAGE = "http://www.mplayerhq.hu/"
> -DEPENDS = "libvpx live555 libdvdread libtheora virtual/libsdl ffmpeg xsp zlib libpng jpeg liba52 freetype fontconfig alsa-lib lzo ncurses lame libxv virtual/libx11 virtual/kernel libass \
> +DEPENDS = "libvpx live555 libdvdread libtheora virtual/libsdl ffmpeg xsp zlib libpng jpeg liba52 freetype fontconfig alsa-lib lzo ncurses lame libxv virtual/libx11 libass \
>   	   ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'libmad liba52 lame', d)}"
>
>   RDEPENDS_${PN} = "mplayer-common"
> @@ -18,10 +18,10 @@ SRC_URI = "git://repo.or.cz/mplayer.git;protocol=git;branch=master \
>
>   SRCREV = "e3f5043233336d8b4b0731c6a8b42a8fda5535ac"
>
> -ARM_INSTRUCTION_SET = "ARM"
> +ARM_INSTRUCTION_SET = "arm"
This is obvious to us old school but should be detailed in changelog.

>
>   PV = "2.0+gitr${SRCPV}"
> -PR = "r7"
> +PR = "r8"
>
>   PARALLEL_MAKE = ""
>



