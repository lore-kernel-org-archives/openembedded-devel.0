Received: from fg-out-1718.google.com ([72.14.220.153])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NzvbI-00021A-Fp
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Apr 2010 19:33:09 +0200
Received: by fg-out-1718.google.com with SMTP id 19so883396fgg.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Apr 2010 10:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=oxgkAsemPxewsKC/K3LhAKsvhV0sEo7J8rujdZ7hU6U=;
	b=xm6dU/Zr8aofDpxztujJ5BR6TRQa56QoniW4v8RcOT6abaRs6xB43GD543DyxW1Mh7
	sEas08CxSZTzkUZYk6iO0KpDLoPqUhWIoY/bg56542eUDw+baB0p06VCcSZT6MV7vVHO
	k0T5J/uv/InfmViT48qb3CNTBDmpBX6LUGoeY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=AKAty6QKVssLdgY/+Sqdsj5IfkiBj/icEiBWIN3pPbyouN8jeVXAC/AQnOuWDNXg6b
	npfbolDqqsCY2hADZqr4jQnWco90LJrHbtD7j58qZf1K+wdJ+d4usQVDlOHBMInNgrY1
	Onq3gVNwVQDo2j4m+9STDjxhPowVRaa6aHzMk=
Received: by 10.87.70.7 with SMTP id x7mr731115fgk.77.1270747787176;
	Thu, 08 Apr 2010 10:29:47 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 14sm211217fxm.9.2010.04.08.10.29.46
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 08 Apr 2010 10:29:46 -0700 (PDT)
Date: Thu, 8 Apr 2010 19:29:53 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100408172953.GG3269@jama>
References: <alpine.DEB.1.10.1004081018050.3264@vitus.devnet.local>
	<alpine.DEB.1.10.1004081733510.3264@vitus.devnet.local>
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.1.10.1004081733510.3264@vitus.devnet.local>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 72.14.220.153
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v2] dfu-programmer: USB Device Firmware Upgrade utility (special atmel-version)
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
X-List-Received-Date: Thu, 08 Apr 2010 17:33:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 08, 2010 at 05:37:41PM +0200, Vitus Jensen wrote:
> Add recipes for version 0.5.2 and the current head of the subversion
> repository.  dfu-programmer is DFU utility supporting Atmel chips
> with a USB bootloader (which aren't supported by dfu-util).
> 
> Signed-off-by: Vitus Jensen <vjensen@gmx.de>
> diff --git a/conf/checksums.ini b/conf/checksums.ini
> index 3c6f712..73f5901 100644
> --- a/conf/checksums.ini
> +++ b/conf/checksums.ini
> @@ -5258,6 +5258,10 @@ sha256=3b15515693bae1ebd14d914e46d388edfec2175829ea1576a7a0c8606ebbe639
>  md5=be12c0132a1ae118cbf5e79d98427c1d
>  sha256=ec382c90af3ef2f49695ff14a4d6521e58ac482c4e29d6c9ebca8768f699c191
> 
> +[http://downloads.sourceforge.net/project/dfu-programmer/dfu-programmer/0.5.2/dfu-programmer-0.5.2.tar.gz]
> +md5=ce882d37383df698a1c530080724b191
> +sha256=e3c8bc1429fe1681c56ddc14fb05d29a7933aac566d13f894dca6fd916829cb9
> +
>  [http://pknet.com/~joe/dgen-sdl-1.23.tar.gz]
>  md5=b1896c1b21ddb152626aec2e8a157a3a
>  sha256=44396b3b324433187cf7082d1059cd9f519f02accddd667e627a57ff8514d436
> diff --git a/conf/distro/include/sane-srcrevs.inc b/conf/distro/include/sane-srcrevs.inc
> index 902c844..982632c 100644
> --- a/conf/distro/include/sane-srcrevs.inc
> +++ b/conf/distro/include/sane-srcrevs.inc
> @@ -41,6 +41,7 @@ SRCREV_pn-contact ?= "1410"
>  SRCREV_pn-dasher-gpe ?= "1251"
>  SRCREV_pn-dbus-c++ ?= "13131"
>  SRCREV_pn-dbus-c++-native ?= "13131"
> +SRCREV_pn-dfu-programmer ?= "93"
>  SRCREV_pn-dfu-util ?= "4160"
>  SRCREV_pn-dfu-util-native ?= "4160"
>  SRCREV_pn-disko ?= "f52597b8d5d584811cbe8f9e0bf25ea372526953"

This doesn't seem applicable after SRCREV moving to recipes last week.

Please send separate patch for org.openembedded.dev with SRCREV as well
as checksums in recipes and for stable/2009 (you can put SRCREV to
recipe as long as it's sane SRCREV not AUTOREV).

> +PV = "0.5.2+svnr${SRCREV}"

In org.openembedded.dev it's always "+svnr${SRCPV}" for svn recipes
(hopefully soon also unified for git recipes).

Thanks

Regards,

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


