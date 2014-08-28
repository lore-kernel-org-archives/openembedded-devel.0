Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id 12EC771165
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Aug 2014 07:17:48 +0000 (UTC)
Received: by mail-pa0-f45.google.com with SMTP id bj1so1391712pad.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Aug 2014 00:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=HBdbQU+urOWgdKTWsKlsra0s9VIZX6hYH5xreguGoIM=;
	b=f1DH4Q4SJ4Fx7gPWxi5T9Jvg6LWZ9GPO90wi4rtbqrv9VdOS4mwWtYjDfypqIjfioq
	jtn4qAb4yo6Yz3gw/aENJ9xqwjL7GMZWFfr3yvhsG/iyR6mkuwJyQHaY/LRgjEG3biAp
	38ATy1vFPp8ziCNIwm/wlSTVRbFfTZtI/R4m+rq1uAErgrsp3FhGf/ovY/ZsqA6eZgfI
	clgkHXMIWcAaooHywdy1X7Y6IAfnKZqDd1oFylurWHYiNKEx4FNgpo2CdF8UgggQjO3S
	8qhHC1g3n7S/aDn+WsejiD/lMWeAfGrfyw0SPXiRY44uYHYYmqBay1nifr00+ObDxd2U
	k9MA==
X-Received: by 10.69.11.133 with SMTP id ei5mr2989116pbd.146.1409210264767;
	Thu, 28 Aug 2014 00:17:44 -0700 (PDT)
Received: from haswell ([2601:9:3580:7a5:baca:3aff:fe80:aa8f])
	by mx.google.com with ESMTPSA id
	fh10sm3957108pdb.71.2014.08.28.00.17.43 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Aug 2014 00:17:44 -0700 (PDT)
Date: Thu, 28 Aug 2014 00:21:24 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140828072124.GD13139@haswell>
References: <1409124541-12549-1-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <1409124541-12549-1-git-send-email-koen@dominion.thruhere.net>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-initramfs][PATCH 1/2] dracut: add 'getopt' to RDEPENDS
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
X-List-Received-Date: Thu, 28 Aug 2014 07:17:51 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On 14-08-27 09:29:00, Koen Kooi wrote:
> This drags in full util-linux, a future TODO is to split up util-linux
> completely in OE-core.
> 
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  meta-initramfs/recipes-devtools/dracut/dracut_git.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-initramfs/recipes-devtools/dracut/dracut_git.bb b/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
> index 945ba0f..9909a6d 100644
> --- a/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
> +++ b/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
> @@ -33,7 +33,8 @@ FILES_${PN} += "${datadir}/bash-completion \
>                  ${libdir}/kernel \
>                 "
>  
> -RDEPENDS_${PN} = "systemd findutils cpio util-linux-blkid bash ldd"
> +# 'getopt' is in the util-linux main package
> +RDEPENDS_${PN} = "systemd findutils cpio util-linux-blkid util-linux bash ldd"

Its dragging in bash too, does it really need it ?  can it be enhanced
to support busybox/ash

>  # This could be optimized a bit, but let's avoid non-booting systems :)
>  RRECOMMENDS_${PN} = " \
>                       kernel-modules \
> -- 
> 1.9.0
> 
> -- 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

