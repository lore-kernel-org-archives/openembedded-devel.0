Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1PLMuy-0004xr-Hj
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Nov 2010 22:30:21 +0100
Received: by fxm4 with SMTP id 4so30487fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Nov 2010 13:29:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=rOguDIvsiDOrCBRAkRBBByhoftoPBGz4qRJCQy/ADAQ=;
	b=cMaae14Futb0qycFt4zfsiXy6iYz/PF/RwhMvDBEVATGB1JlR3vcDxW/Yb/r7cURbJ
	EspZ2wRCm6VN4uxIAohOuj/1QyuSjOv3XwNxqJ8tpbqNLqG43VhjysfQLaRR3k524+uv
	PlZ+ymp92Wj+W7Q91PF8MA06d19HuUPCxJQQ4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=lFI/FLu2okLca0Ksv024zFodPjdZ2TG489GBSZzF2DG0yULiEQTq/JD8IuVsq42dB8
	xc2QBDBnYKPCJ6WGKvKj7xI4xwdjcv2TKtkbsFqZaXNvcAJ2CTTPsVvdxT6bBj4rmDqX
	tHPpiEAvdiJhHrpj4TX1Uq8pYmFUxM0G9Q/Oc=
Received: by 10.223.103.2 with SMTP id i2mr8345597fao.115.1290634146484;
	Wed, 24 Nov 2010 13:29:06 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id n6sm2007201faa.28.2010.11.24.13.29.04
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 24 Nov 2010 13:29:04 -0800 (PST)
Date: Wed, 24 Nov 2010 22:28:55 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101124212855.GH3274@jama>
References: <1290620636-21238-1-git-send-email-eric@eukrea.com>
	<1290620636-21238-2-git-send-email-eric@eukrea.com>
	<AANLkTi=vHic9JYNfFH0-giLnB0x929Czhj3C_BriAN9L@mail.gmail.com>
	<4CED64C8.7060909@eukrea.com>
MIME-Version: 1.0
In-Reply-To: <4CED64C8.7060909@eukrea.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/3] busybox: add 1.17.4 (latest stable version)
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
X-List-Received-Date: Wed, 24 Nov 2010 21:30:21 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Nov 24, 2010 at 08:17:28PM +0100, Eric Bénard wrote:
> On 24/11/2010 19:44, Khem Raj wrote:
> > On Wed, Nov 24, 2010 at 9:43 AM, Eric Bénard<eric@eukrea.com>  wrote:
> >> this is the latest stable version (1.17.3 + its fixes).
> >>
> >> Signed-off-by: Eric Bénard<eric@eukrea.com>
> >
> > Please install it on release branch as well. Do we still need 1.17.3 ?
> >
> if SHR switch to 1.17.4 we shouldn't need it anymore.
> (and if Ångström 2010 also switch to 1.17.4 we won't need 1.17.1).
> 
> Martin, Koen, are you ok with the patch below ?

If 1.17.4 is sorted as default (without D_P) then I'm ok with removing
PREFERRED_VERSION_busybox from SHR config completely.

> diff --git a/conf/distro/include/angstrom-2010-preferred-versions.inc 
> b/conf/distro/include/angstrom-2010-preferred-v
> index 12ee900..bda21d9 100644
> --- a/conf/distro/include/angstrom-2010-preferred-versions.inc
> +++ b/conf/distro/include/angstrom-2010-preferred-versions.inc
> @@ -13,7 +13,7 @@ PREFERRED_VERSION_autoconf = "2.65"
>   PREFERRED_VERSION_autoconf-native = "2.65"
>   PREFERRED_VERSION_automake = "1.11.1"
>   PREFERRED_VERSION_automake-native = "1.11.1"
> -PREFERRED_VERSION_busybox      = "1.17.1"
> +PREFERRED_VERSION_busybox      = "1.17.4"
>   PREFERRED_VERSION_cairo                = "1.10.0"
>   PREFERRED_VERSION_dbus                 = "1.2.24"
>   PREFERRED_VERSION_dropbear      = "0.51"
> diff --git a/conf/distro/include/preferred-shr-versions.inc 
> b/conf/distro/include/preferred-shr-versions.inc
> index 22e1c82..da11164 100644
> --- a/conf/distro/include/preferred-shr-versions.inc
> +++ b/conf/distro/include/preferred-shr-versions.inc
> @@ -13,7 +13,7 @@ PREFERRED_VERSION_emacs-x11 = "23.1"
>   PREFERRED_VERSION_ncurses = "5.7"
>   PREFERRED_VERSION_ncurses-native = "5.7"
>   PREFERRED_VERSION_python-pycairo = "1.8.0"
> -PREFERRED_VERSION_busybox = "1.17.3"
> +PREFERRED_VERSION_busybox = "1.17.4"
> 
>   # we need new headers for libc, now OLDEST_KERNEL_linux-gnueabi = "2.6.24"
>   # and 2.6.31 for fsodeviced
> 
> Eric
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


