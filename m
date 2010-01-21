Received: from mail-fx0-f228.google.com ([209.85.220.228])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NY2f2-0006xW-Vv
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Jan 2010 20:25:48 +0100
Received: by fxm28 with SMTP id 28so370440fxm.26
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jan 2010 11:23:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=GcLCkkQLIxFZXroBeW4ryRe8LncACEumO6Q4g+LhYVw=;
	b=WH5gbKM6W70LM7PMji8BEYNZWT+sxCfgi/r7/4I2PfLb0t3Rdui3fzrJIog1mZ44YL
	LIsMYIjV/kkogG9sam0jfdVo48dlGUVk2oauiO8yO7UvFnr/vt9RX93pnqnT7AwkvqCQ
	/9xOGtchGFrmz2yOTSlsA8K9CofUZhkCXZEtA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=f7HgkVQ9kUMUJPWXphLZUvN1fE/s3smtv4qmO/12Py4U/YGL2ujLGyAfyaMiNxZA26
	Z8rlRSz2oKfdVOA/lHqSlhBLeWcWpkme6asMqh3bCXCBZiXzhdPHWJPTgRmPVk87IkjU
	5DMegk4vOrK2xqUPbG9iGAeMGsPGzsUZkT2dY=
Received: by 10.223.101.143 with SMTP id c15mr1870932fao.91.1264101807829;
	Thu, 21 Jan 2010 11:23:27 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 16sm828631fxm.8.2010.01.21.11.23.27
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 21 Jan 2010 11:23:27 -0800 (PST)
Date: Thu, 21 Jan 2010 20:23:26 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100121192326.GB3208@jama>
References: <hja7k7$bvj$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <hja7k7$bvj$1@ger.gmane.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.220.228
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: libdrm_2.4.17 fails to build on arm
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
X-List-Received-Date: Thu, 21 Jan 2010 19:25:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 21, 2010 at 10:49:43AM -0800, Dallas Foley wrote:
> Older version 2.4.11 builds Ok on arm, but not 2.4.17
> I modified it to build on armv7a. However, I'm not sure if it's the correct way.

Pushed thanks!

Someone with x86 and intel, please test

> diff --git a/recipes/dri/libdrm_2.4.17.bb b/recipes/dri/libdrm_2.4.17.bb
> index 4f2af1e..fd1ab3a 100644
> --- a/recipes/dri/libdrm_2.4.17.bb
> +++ b/recipes/dri/libdrm_2.4.17.bb
> @@ -3,14 +3,16 @@ DEPENDS = "libpthread-stubs"
> LICENSE = "MIT"
> SRC_URI = "http://dri.freedesktop.org/libdrm/libdrm-${PV}.tar.bz2"
> PROVIDES = "drm"
> -PR = "r1"
> +PR = "r2"
> 
> inherit autotools pkgconfig
> 
> +EXTRA_OECONF_append = " ${@base_contains('MACHINE_FEATURES', 'x86', '', '--disable-intel',d)}"
> +
> do_stage() {
> 	autotools_stage_all
> }
> 
> -PACKAGES =+ "${PN}-intel"
> +PACKAGES =+ "${@base_contains('MACHINE_FEATURES', 'x86', '${PN}-intel', '',d)}"
> 
> FILES_${PN}-intel = "${libdir}/libdrm_intel.so.*"
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


