Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Pv0Ze-0001qV-7o
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Mar 2011 05:55:38 +0100
Received: by gyg13 with SMTP id 13so281281gyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Mar 2011 20:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id
	:mail-followup-to:references:mime-version:content-type
	:content-disposition:content-transfer-encoding:in-reply-to
	:user-agent; bh=c+GwwBWMePsN9IyJs1oMI9nwMS7yxiQamdjJnlxSxtg=;
	b=cHtXm1WauDMDvFUNuFF2n906HKXgSgolAQ4rhS9/jBFIowElEohSgqgyjHmWL35jYW
	xJDQJ1+w8pVikc048VDzruIV5qyxP26TJW255i8LU1blBWeS/xQebEoEOtoXWyxP+cCn
	ZyH2Pp9F+y0+X1cVKaoeSvP/Iarg9nyKXEQhg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	b=mBj03qbg+LCw2jCLdpn/D+KpBMnQN8driPr/wZFuRrz2mvQkqU6GoQOGgBNCCrW50f
	erizY6FA71J1g8kTQ/h/ORSMnRUyQ2lWi2Ec4L5SWKVw1nMOsmXBW3Ix1/7RvWvBLfOg
	FkEHCfpWD/sGWa02Onln7sk44b/VqKJhfIcTE=
Received: by 10.236.182.135 with SMTP id o7mr177538yhm.31.1299127644252;
	Wed, 02 Mar 2011 20:47:24 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id u49sm516763yhn.37.2011.03.02.20.47.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 Mar 2011 20:47:23 -0800 (PST)
Date: Wed, 2 Mar 2011 20:47:19 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110303044719.GD2692@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <1299101202-1735-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
In-Reply-To: <1299101202-1735-1-git-send-email-eric@eukrea.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH] busybox-1.18.3: add last fix
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
X-List-Received-Date: Thu, 03 Mar 2011 04:55:38 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On (02/03/11 22:26), Eric Bénard wrote:
> Signed-off-by: Eric Bénard <eric@eukrea.com>

hmmm is it the last fix for 1.18.3 and then its EOL or did you mean
recent most fix ?

Acked-by: Khem Raj <raj.khem@gmail.com>
> ---
>  recipes/busybox/busybox_1.18.3.bb |    5 ++++-
>  1 files changed, 4 insertions(+), 1 deletions(-)
> 
> diff --git a/recipes/busybox/busybox_1.18.3.bb b/recipes/busybox/busybox_1.18.3.bb
> index f85de86..59e817d 100644
> --- a/recipes/busybox/busybox_1.18.3.bb
> +++ b/recipes/busybox/busybox_1.18.3.bb
> @@ -1,10 +1,11 @@
>  require busybox_1.1x.inc
> -PR = "${INC_PR}.1"
> +PR = "${INC_PR}.2"
>  
>  SRC_URI += " \
>  	http://busybox.net/downloads/fixes-1.18.3/busybox-1.18.3-buildsys.patch;name=patch01 \
>  	http://busybox.net/downloads/fixes-1.18.3/busybox-1.18.3-modutils24.patch;name=patch02 \
>  	http://busybox.net/downloads/fixes-1.18.3/busybox-1.18.3-wget.patch;name=patch03 \
> +        http://busybox.net/downloads/fixes-1.18.3/busybox-1.18.3-menuconfig.patch;name=patch04 \
>  	"
>  
>  SRC_URI[md5sum] = "660af4d44661d32b22025a66f4f78df2"
> @@ -15,3 +16,5 @@ SRC_URI[patch02.md5sum] = "ce7c3421c87088a7f779278680563bff"
>  SRC_URI[patch02.sha256sum] = "134ed86867784348f484810464df5bc97589e7aa41079c90e35b8d12b9284df8"
>  SRC_URI[patch03.md5sum] = "abe065069fed8458eedbdad48c115e1f"
>  SRC_URI[patch03.sha256sum] = "22538ebee96f66916104b8143cfd16e21568da4c5a89128b9daa60d83a59120b"
> +SRC_URI[patch04.md5sum] = "d12d997b66669451bd8c4cc494162a80"
> +SRC_URI[patch04.sha256sum] = "f3f8466432088248492fc44631a765ed0a95a8b7d14e37483fae25158d07dc68"
> -- 
> 1.7.0.4
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
-Khem


