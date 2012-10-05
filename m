Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1TK5Pi-000137-HQ
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Oct 2012 12:45:50 +0200
Received: by mail-ie0-f175.google.com with SMTP id c13so3502857ieb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Oct 2012 03:32:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=iFKs9z2mw2ufEIiA4o3T4fVN/TpR7i4B+zTr+7g5Ac8=;
	b=SKaZiuANwqtvmgk1CPX0eFSA8m31lu8GuLr/9tdHBljdpJNMwUObyZz2yMwxwa0di2
	PIYyjS99tR5ZUiD8y/KcJzKgP6/CsVwfyX/mPhbDBbC8TYwflh2x8ZTVkmmgXTWoHzKt
	pd79CoYTyMaWckh6JoSMPQHZkJolRcWh1gdqeEaunaXRaWDhNeO17Tliv0fpC+SfZ8zE
	VlevqRCJZ/vPqUm+AJOFL4BlQbA9S+dgwaqlRqKd7EoQDLqZPxV3Tv2QulPh6oe3kalG
	VdU2kdu1EnX4veK+m339r3sczpMkhjb5yC/7VmlJTg/4t22ObARfRGWWFlmwVgSUfzwS
	xv4g==
Received: by 10.50.187.194 with SMTP id fu2mr696500igc.63.1349433167878; Fri,
	05 Oct 2012 03:32:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.52.8 with HTTP; Fri, 5 Oct 2012 03:32:27 -0700 (PDT)
X-Originating-IP: [89.121.200.106]
In-Reply-To: <1349271693-6378-3-git-send-email-otavio@ossystems.com.br>
References: <1349271693-6378-1-git-send-email-otavio@ossystems.com.br>
	<1349271693-6378-3-git-send-email-otavio@ossystems.com.br>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Fri, 5 Oct 2012 13:32:27 +0300
Message-ID: <CAK18fxGaVR17u_cuyKJWN-zb=9zTSYfyfUXdt9+tSx-B6OWbmA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQm94IDcQgNxr1MaBHoStRJxGwyZb34ZFQPOdOHHd0EJj246N1WZ/5K8ODooWDP6EcnLsc3k
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-oe][PATCH 3/4] libcec: Update to 1.9.0 version
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
X-List-Received-Date: Fri, 05 Oct 2012 10:45:50 -0000
Content-Type: text/plain; charset=ISO-8859-1

I think somebody already sent a patch for this. But as i see, it's not
merged. Maybe it was forgotten.

ag

On Wed, Oct 3, 2012 at 4:41 PM, Otavio Salvador <otavio@ossystems.com.br>wrote:

> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  meta-oe/recipes-extended/libcec/libcec_git.bb |   10 +++++-----
>  1 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/meta-oe/recipes-extended/libcec/libcec_git.bbb/meta-oe/recipes-extended/libcec/
> libcec_git.bb
> index 142b2e2..8b1f086 100644
> --- a/meta-oe/recipes-extended/libcec/libcec_git.bb
> +++ b/meta-oe/recipes-extended/libcec/libcec_git.bb
> @@ -2,13 +2,13 @@ DESCRIPTION = "USB CEC Adaptor communication Library"
>  HOMEPAGE = "http://libcec.pulse-eight.com/"
>
>  LICENSE = "GPLv2+"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=185ead350fec5fc223da0f65f9a802af"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=5e8e16396992369f73f3d28875f846da"
>
> -DEPENDS = "udev"
> +DEPENDS = "udev lockdev"
>
> -PR = "r1"
> -PV = "1.4.0"
> -SRCREV = "2db8981f49fbd167ddbbf19c1fbadd064abc332a"
> +PV = "1.9.0"
> +
> +SRCREV = "9884e9ffc5293de5bb9092db1ed581f213a678df"
>  SRC_URI = "git://github.com/Pulse-Eight/libcec.git"
>
>  S = "${WORKDIR}/git"
> --
> 1.7.2.5
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

