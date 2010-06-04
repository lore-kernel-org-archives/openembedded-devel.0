Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OKf98-0002Wj-KD
	for openembedded-devel@lists.openembedded.org;
	Sat, 05 Jun 2010 00:13:48 +0200
Received: by pwj4 with SMTP id 4so732718pwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Jun 2010 15:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=Y1WTZelfWLlIcVtmHQPd2v2rkcmjyavSW8+3DWnU11s=;
	b=iDm/B5xlmnLfzFbIeXBKcRB+60WBsA9qf60UBVyFaZDapv0iA5XRTWPheWk6AdxdOU
	uwrKYbiR24MJWcLSrKFNVhS3QseNdmfCIIiik9d15C+PZGBxLwlEQ/+7fRPWBRx8jqZM
	eDjCRiC/rX5AxOTk5UAi20Sa0D92nsboyY1ME=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=HfNRwq1sxgOWzGx4rZ6zI1ApeGFaEvuH3NymPf9cnER3CgHzaHZAYdyjRGN+/cA5NS
	QJG1tsaN7ZSK1vUTrhwyl6K8qGCrSAko4pus38TD10yEQsJaLJ2CfidDtPgad9dKtkWz
	OV203Yrgtf/gGLkSt4gSWod+ZFbDb7uulFqIw=
Received: by 10.114.188.4 with SMTP id l4mr9053702waf.19.1275689368496;
	Fri, 04 Jun 2010 15:09:28 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id b6sm12269423wam.9.2010.06.04.15.09.27
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 04 Jun 2010 15:09:27 -0700 (PDT)
Date: Fri, 4 Jun 2010 15:08:55 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100604220855.GA27712@gmail.com>
References: <1275673186-16695-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
MIME-Version: 1.0
In-Reply-To: <1275673186-16695-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	Koen Kooi <koen@openembedded.org>
Subject: Re: [PATCH] libvpx: disabled explicitly the generation of docs
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
X-List-Received-Date: Fri, 04 Jun 2010 22:13:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (04/06/10 19:39), Enrico Scholz wrote:
> When buildsystem has 'doxygen' and 'php' the documentation will be
> created and the path in do_install (vpx-vp8-nopost-nodocs) won't be
> found anymore:

where do they get put when doxygen and php are found. You may also
put doxygen-native and php-native in DEPENDS and generate the documentation
always but that may be overkill if we already have documentation prebuilt
which can be installed. is that the case?

> 
> | make[2]: Leaving directory `.../libvpx-0.9.0-r2/libvpx-0.9.0'
> | + cp -r '.../libvpx-0.9.0/vpx-vp8-nopost-nodocs*0.9.0/*' .../image/usr/
> | cp: cannot stat `.../libvpx-0.9.0/vpx-vp8-nopost-nodocs*0.9.0/*': No such file or directory
> | ERROR: Function do_install failed NOTE: package libvpx-0.9.0-r2: task do_install: Failed
> 
> This patch makes the build more deterministic.
> 
> Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
> Cc: Koen Kooi <koen@openembedded.org>
> ---
>  recipes/webm/libvpx_0.9.0.bb |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
> 
> diff --git a/recipes/webm/libvpx_0.9.0.bb b/recipes/webm/libvpx_0.9.0.bb
> index a59d94d..b55604b 100644
> --- a/recipes/webm/libvpx_0.9.0.bb
> +++ b/recipes/webm/libvpx_0.9.0.bb
> @@ -1,7 +1,7 @@
>  DESCRIPTION = "vpx Multi-Format Codec SDK"
>  LICENSE = "VP8"
>  
> -PR = "r2"
> +PR = "r3"
>  
>  SRC_URI = "http://webm.googlecode.com/files/libvpx-${PV}.tar.bz2"
>  
> @@ -20,6 +20,7 @@ VPXTARGET ?= "generic-gnu"
>  
>  CONFIGUREOPTS = " \
>            --target=${VPXTARGET} \
> +          --disable-install_docs \

Does it disable the doc generation completely ?

>            --enable-vp8 \
>            --enable-libs \
>  "
> -- 
> 1.7.0.1
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


