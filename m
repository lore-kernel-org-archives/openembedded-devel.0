Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NsIGY-0007XA-GN for openembedded-devel@lists.openembedded.org;
	Thu, 18 Mar 2010 17:08:20 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NsIDY-0007nF-GT for openembedded-devel@lists.openembedded.org;
	Thu, 18 Mar 2010 17:05:04 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Mar 2010 17:05:04 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Mar 2010 17:05:04 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 18 Mar 2010 17:04:39 +0100
Message-ID: <hntiun$ggu$2@dough.gmane.org>
References: <1268847536-25010-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.8) Gecko/20100314 Shredder/3.0.4pre
In-Reply-To: <1268847536-25010-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] ffmpeg: moved to native staging
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
X-List-Received-Date: Thu, 18 Mar 2010 16:08:40 -0000
X-List-Received-Date: Thu, 18 Mar 2010 16:08:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Thanks, applied

On 17-03-10 18:38, Enrico Scholz wrote:
> From: Enrico Scholz <enrico.scholz@informatik.tu-chemnitz.de>
> 
> Old .inc file listed every single header which was to be staged.  This
> causes problems when upgrading to recent 0.5.1 version or when using
> older versions because headers might not exist there resp. new ones
> need to be installed.
> 
> This patch converts the .inc file to new native staging method and
> which calls two new functions:
> 
> * ffmpeg_create_compat_links:
>   - this creates symlinks to all installed headers into the ffmpeg/
>     directory. E.g.
> 
>     adler32.h -> ../libavutil/adler32.h
> 
>   - it should be probably checked whether these links are really
>     needed (they are not provided by ffmpeg and other programs might
>     get confused when they see new and old headers).  For now; I kept
>     them.
> 
> * ffmpeg_stage_cleanup:
>   - this removes data and plugin files
> 
> Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
> ---
>  recipes/ffmpeg/ffmpeg.inc |   57 +++++++++++++++------------------------------
>  1 files changed, 19 insertions(+), 38 deletions(-)
> 
> diff --git a/recipes/ffmpeg/ffmpeg.inc b/recipes/ffmpeg/ffmpeg.inc
> index 857dad5..c855877 100644
> --- a/recipes/ffmpeg/ffmpeg.inc
> +++ b/recipes/ffmpeg/ffmpeg.inc
> @@ -10,7 +10,7 @@ ARM_INSTRUCTION_SET = "arm"
>  DEPENDS = "zlib libogg libvorbis libtheora faac faad2 ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'lame liba52', d)}"
>  RSUGGESTS = "mplayer"
>  
> -INC_PR = "r12"
> +INC_PR = "r13"
>  
>  inherit autotools pkgconfig
>  
> @@ -30,45 +30,26 @@ EXTRA_OECONF = "\
>          \
>  "
>  
> -do_stage() {
> -        for lib in libavcodec libavdevice libavformat \
> -                   libavutil libpostproc libswscale
> -        do
> -            oe_libinstall -a -so -C $lib $lib ${STAGING_LIBDIR} || true
> -            install -d ${STAGING_INCDIR}/$lib 
> -        done 
> -
> -        install -d ${STAGING_INCDIR}/ffmpeg
> -
> -        install -m 0644 ${S}/libavcodec/avcodec.h ${STAGING_INCDIR}/ffmpeg/avcodec.h
> -        install -m 0644 ${S}/libavcodec/opt.h ${STAGING_INCDIR}/ffmpeg/opt.h
> -        install -m 0644 ${S}/libavcodec/avcodec.h ${STAGING_INCDIR}/libavcodec/avcodec.h
> -        install -m 0644 ${S}/libavcodec/opt.h ${STAGING_INCDIR}/libavcodec/opt.h
> -
> -        install -m 0644 ${S}/libavdevice/avdevice.h  ${STAGING_INCDIR}/ffmpeg/avdevice.h
> -        
> -        for h in avformat.h avio.h rtp.h rtsp.h rtspcodes.h
> -        do
> -           install -m 0644 ${S}/libavformat/$h  ${STAGING_INCDIR}/ffmpeg/$h
> -           install -m 0644 ${S}/libavformat/$h  ${STAGING_INCDIR}/libavformat/$h	
> -	done
> -
> -		for h in adler32.h aes.h attributes.h avstring.h avutil.h base64.h bswap.h common.h crc_data.h crc.h des.h error.h fifo.h integer.h internal.h intfloat_readwrite.h intmath.h intreadwrite.h lfg.h libm.h lls.h log.h lzo.h mathematics.h md5.h mem.h pca.h pixdesc.h pixfmt.h random_seed.h rational.h rc4.h sha1.h sha.h softfloat.h timer.h tree.h x86_cpu.h
> -		do
> -           install -m 0644 ${S}/libavutil/$h        ${STAGING_INCDIR}/ffmpeg/$h
> -           install -m 0644 ${S}/libavutil/$h        ${STAGING_INCDIR}/libavutil/$h 
> -        done
> -        install -m 0644 ${B}/libavutil/avconfig.h ${STAGING_INCDIR}/ffmpeg/
> -        install -m 0644 ${B}/libavutil/avconfig.h ${STAGING_INCDIR}/libavutil/
> +FFMPEG_LIBS = "libavcodec libavdevice libavformat \
> +               libavutil libpostproc libswscale"
> +
> +SYSROOT_PREPROCESS_FUNCS = " \
> +  ffmpeg_stage_cleanup \
> +  ffmpeg_create_compat_links"
> +
> +ffmpeg_create_compat_links() {
> +        rm -rf ${SYSROOT_DESTDIR}${STAGING_INCDIR}/ffmpeg
> +        mkdir -m 0755 ${SYSROOT_DESTDIR}${STAGING_INCDIR}/ffmpeg
> +        cd ${SYSROOT_DESTDIR}${STAGING_INCDIR}/ffmpeg
>  
> -        install -d ${STAGING_INCDIR}/libswscale/ 
> -        install -m 0644 ${S}/libswscale/*.h ${STAGING_INCDIR}/ffmpeg/
> -        install -m 0644 ${S}/libswscale/*.h ${STAGING_INCDIR}/libswscale/
> +        for lib in ${FFMPEG_LIBS}; do
> +                ln -s ../$lib/*.h '.'
> +        done
> +}
>  
> -        install -d ${STAGING_INCDIR}/libpostproc
> -        install -d ${STAGING_INCDIR}/postproc 
> -        install -m 0644 ${S}/libpostproc/postprocess.h ${STAGING_INCDIR}/libpostproc/postprocess.h
> -        install -m 0644 ${S}/libpostproc/postprocess.h ${STAGING_INCDIR}/postproc/postprocess.h
> +ffmpeg_stage_cleanup() {
> +        rm -rf ${SYSROOT_DESTDIR}${STAGING_LIBDIR}/vhook \
> +        ${SYSROOT_DESTDIR}${STAGING_DATADIR}
>  }
>  
>  

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLok8XMkyGM64RGpERAuVDAKCacLzuFZZeIyGa7mhOfLUvLHvjIgCdGK1l
C0E3K5dM/TGX5KgsE2zPDXo=
=fPgB
-----END PGP SIGNATURE-----



