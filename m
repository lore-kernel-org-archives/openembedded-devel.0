Received: from mail-fx0-f212.google.com ([209.85.220.212])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NUhNR-0001lr-Fv
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Jan 2010 15:05:49 +0100
Received: by fxm4 with SMTP id 4so18983653fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jan 2010 06:03:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=HwrH0Kv6GZU6qDVhICtGAH5LOnzvZvH1Nug/BKoFHCw=;
	b=DQIheRqCSvCLGAD35gmbegQO5eTiNXRKLZ9BbIdepi9n5/rmEgyWWJgEYw677HMuhP
	GYADz0+9ykya3iT6WqYnb/oAcGV58mpWMAmnEU3Pi4ZIJHHrx0ZbmGm8HdxS2db1Imkj
	KJTIUOv2RjsWleaHhjerp+mIYX13LhFXI7shM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=e9mJ3ejCCCo6E7d5RNBa0/UtkaTUQLzKiZsMNxicPyqf9v24pJNU4pzbDWRBbn4YkK
	r9l+pfaHAAek74X7CP4WU+Ib20jqaU9T5FH+ErRuYf2+8dCwUHZ9cH6fKgyYpRQai7yy
	8CX7GJFG0NJY96IrM29gqKA22NzRm73jUAf8s=
Received: by 10.223.75.136 with SMTP id y8mr11743571faj.69.1263305016215;
	Tue, 12 Jan 2010 06:03:36 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 16sm10206531fxm.0.2010.01.12.06.03.34
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 12 Jan 2010 06:03:34 -0800 (PST)
Date: Tue, 12 Jan 2010 15:03:26 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100112140326.GC10781@jama>
References: <E1NTDIp-00055S-0r@melo.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <E1NTDIp-00055S-0r@melo.openembedded.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.220.212
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: openembedded-commits@openembedded.org
Subject: Re: [oe-commits] Koen Kooi : xserver-xorg 1.7.3: fix regression where hal was disabled
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
X-List-Received-Date: Tue, 12 Jan 2010 14:05:49 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 08, 2010 at 11:46:51AM +0000, git version control wrote:
> Module: openembedded.git
> Branch: org.openembedded.dev
> Commit: 3a9b352acba24c78b562d8dc6527b774cbb86041
> URL:    http://gitweb.openembedded.net/?p=openembedded.git&a=commit;h=3a9b352acba24c78b562d8dc6527b774cbb86041
> 
> Author: Koen Kooi <koen@openembedded.org>
> Date:   Fri Jan  8 12:44:47 2010 +0100
> 
> xserver-xorg 1.7.3: fix regression where hal was disabled
> 
> * this fixes the "my touchscreen isn't working anymore" bug

Thanks,

can we add hal conditionaly as XINERAMA is?
Maybe for both om-gta01, om-gta02?

We have input configuration in xorg.conf and with hal for input
detection deprecated by xorg devs I guess we won't change that before
1.8 xserver (maybe with deviceKit or something else).

Before this change hal could be removed from om-gta*

I'm also willing to accept that we also need hal from reasons I don't know
about yet..

Regards,

> ---
> 
>  recipes/xorg-xserver/xserver-xorg_1.7.3.bb |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes/xorg-xserver/xserver-xorg_1.7.3.bb b/recipes/xorg-xserver/xserver-xorg_1.7.3.bb
> index af01a90..edede8b 100644
> --- a/recipes/xorg-xserver/xserver-xorg_1.7.3.bb
> +++ b/recipes/xorg-xserver/xserver-xorg_1.7.3.bb
> @@ -3,7 +3,7 @@ require xorg-xserver-common.inc
>  DESCRIPTION = "the X.Org X server"
>  DEPENDS += "pixman libpciaccess openssl dri2proto glproto xorg-minimal-fonts"
>  PE = "2"
> -PR = "r3"
> +PR = "r4"
>  
>  SRC_URI += "file://sysroot_fix.patch;patch=1 \
>              file://dolt-fix-1.7.0.patch;patch=1 \
> @@ -20,7 +20,7 @@ do_install_prepend() {
>  # The NVidia driver requires Xinerama support in the X server. Ion uses it.
>  XINERAMA = "${@['--disable-xinerama','--enable-xinerama'][bb.data.getVar('MACHINE',d) in ['ion']]}"
>  
> -EXTRA_OECONF += "--disable-xephyr --disable-config-hal ${XINERAMA} --disable-kdrive --disable-xephyr --disable-xsdl --disable-xfake --disable-xfbdev --disable-dmx"
> +EXTRA_OECONF += " --enable-config-hal ${XINERAMA} --disable-kdrive --disable-xephyr --disable-xsdl --disable-xfake --disable-xfbdev --disable-dmx"
>  EXTRA_OECONF += " --disable-glx-tls --enable-dri2 --disable-unit-tests "
>  
>  export LDFLAGS += " -ldl "
> 
> 
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


