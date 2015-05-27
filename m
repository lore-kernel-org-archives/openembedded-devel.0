Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 53A8272D64
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 May 2015 11:36:13 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id D09C6F81199; Wed, 27 May 2015 05:36:11 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=10.0 tests=ALL_TRUSTED,BAYES_00,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 20082F81199;
	Wed, 27 May 2015 05:36:11 -0600 (MDT)
Message-ID: <5565AC43.6070406@mlbassoc.com>
Date: Wed, 27 May 2015 05:36:35 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1432725212-14933-1-git-send-email-hroussille@adeneo-embedded.com>
In-Reply-To: <1432725212-14933-1-git-send-email-hroussille@adeneo-embedded.com>
Subject: Re: [PATCH] Adding support for directFB to mplayer2 recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 May 2015 11:36:18 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2015-05-27 05:13, Hector Roussille wrote:
> Signed-off-by: Hector Roussille <hroussille@adeneo-embedded.com>
> ---
>   meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
> index 5b0e1de..b208144 100644
> --- a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
> +++ b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
> @@ -121,6 +121,7 @@ PACKAGECONFIG[postproc] = ",--disable-libpostproc,libpostproc"
>   PACKAGECONFIG[vorbis] = ",--disable-libvorbis,libvorbis"
>   PACKAGECONFIG[portaudio] = ",--disable-portaudio,portaudio-v19"
>   PACKAGECONFIG[mpg123] = ",--disable-mpg123,mpg123"
> +PACKAGECONFIG[directfb] = "--enable-directfb,--disable-directfb,directfb"
>
>   FULL_OPTIMIZATION = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O4 -ffast-math"
>   BUILD_OPTIMIZATION = "${FULL_OPTIMIZATION}"
> @@ -134,7 +135,7 @@ do_configure() {
>       sed -i 's|/usr/\S*lib[\w/]*||g' ${S}/configure
>       sed -i 's|_install_strip="-s"|_install_strip=""|g' ${S}/configure
>       sed -i 's|HOST_CC|BUILD_CC|' ${S}/Makefile
> -
> +    sed -i 's|extra_cflags="-I. $extra_cflags"|extra_cflags="-I. -I${STAGING_INCDIR}/directfb $extra_cflags"|g' ${S}/configure
>       export SIMPLE_TARGET_SYS="$(echo ${TARGET_SYS} | sed s:${TARGET_VENDOR}::g)"
>       ./configure ${EXTRA_OECONF}
>

Shouldn't this at least be conditional on directfb support in
DISTRO_FEATURES?  It won't do much good to enable it in this
recipe if the rest of the system isn't using directfb as well.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

