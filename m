Received: from mail-fx0-f220.google.com ([209.85.220.220])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NmksO-0000QR-Fa
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Mar 2010 10:28:25 +0100
Received: by fxm20 with SMTP id 20so1178144fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Mar 2010 01:25:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=L6A5230Mu/Wg54Jj06MpIvZ4+PDsF2YzjyFEpk8Thl4=;
	b=jhzEPhsQpW/u3r925AnaYiU/qAlkfT80UY3N8Qsk1fgF9wVwdTbA6ZbJQjv/hOLdF/
	GKICYk04j/G8Yc1Lx6J872lqb7pecKJAjqtrWrqySUbm+hpdDADhCVfCcnGK/uAN09Tv
	K6WYdytJQYVE8SHXJsyj5+nQ34YPRhcR3nEM4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=X8kQ/Qf5TIKc5ujd41LnG8JF08MT2FPugkyAyR3N4z2jTtHb6rUVlldWpOr7sm47i1
	LsYbXoppqJTWYFW6oJzgjuTgrokxDbJuDd8ChUJGST5IB1rE7+juSB/5N/lt45VeVGK2
	vqVcU8yP3Ump2DcexWGyBZBK0KzZQ8Egmk8jw=
Received: by 10.87.70.28 with SMTP id x28mr2713977fgk.51.1267608329329;
	Wed, 03 Mar 2010 01:25:29 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 15sm3495159fxm.8.2010.03.03.01.25.27
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 03 Mar 2010 01:25:28 -0800 (PST)
Date: Wed, 3 Mar 2010 10:25:57 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100303092557.GK3206@jama>
References: <E1NmW1P-0001Ed-Un@melo.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <E1NmW1P-0001Ed-Un@melo.openembedded.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.220.220
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] Tom Rini : qemu: Perform our sanity checks based on ENABLE_BINARY_LOCALE_GENERATION
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
X-List-Received-Date: Wed, 03 Mar 2010 09:28:25 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 02, 2010 at 05:36:39PM +0000, git version control wrote:
> Module: openembedded.git
> Branch: org.openembedded.dev
> Commit: 31e93854259130e20a4e08c9d803c34edc4b447e
> URL:    http://gitweb.openembedded.net/?p=openembedded.git&a=commit;h=31e93854259130e20a4e08c9d803c34edc4b447e
> 
> Author: Tom Rini <tom_rini@mentor.com>
> Date:   Mon Mar  1 11:18:28 2010 +0000
> 
> qemu: Perform our sanity checks based on ENABLE_BINARY_LOCALE_GENERATION
> 
>  		if "qemu-native" in assume_provided:
> -			if not check_app_exists("qemu-arm", e.data):
> -				messages = messages + "qemu-native was in ASSUME_PROVIDED but the QEMU binaries (qemu-arm) can't be found in PATH"
> +			required_utilities += "qemu"

Hi,

You need space before qemu, because it's hard to find following missing
utilities: md5sumqemu :).

Also I'm not really happy from qemu-arm -> qemu change, as my qemu-kvm
built in gentoo with USE flags only for what I need

USE="aio -alsa -bluetooth -curl -esd -fdt -gnutls -hardened -kvm-trace -ncurses -pulseaudio -qemu-ifup% -sasl -sdl -static -vde"
QEMU_SOFTMMU_TARGETS="arm -cris -i386 -m68k -microblaze -mips -mips64 -mips64el -mipsel -ppc -ppc64 -ppcemb -sh4 -sh4eb -sparc -sparc64 -x86_64"
QEMU_USER_TARGETS="arm armeb -alpha -cris -i386 -m68k -microblaze -mips -mipsel -ppc -ppc64 -ppc64abi32 -sh4 -sh4eb -sparc -sparc32plus -sparc64 -x86_64"

then qemu binary is not built, but qemu-arm which AFAIK is used for 
binary locale generation is available.

Regards,

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


