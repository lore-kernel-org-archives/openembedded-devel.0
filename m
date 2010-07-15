Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1OZKaY-0004u5-Cv
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Jul 2010 11:18:43 +0200
Received: by fxm12 with SMTP id 12so263372fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Jul 2010 02:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=4SlzBGjHW5rv1h5iP9+TAV9ikGdiI6ufcJsXEWmaHRw=;
	b=PP8MaqDsvCY9kCfNxs5B2RVUd1GwnVRbmD7j3FZ82LfPls2hFu2qi+C9gktl419vBF
	NrmDsV50ZF+zAPztx0pFWmwrSd4zzbyg/B9Tz/nNOEy8SKzJ1Z4jOKvVTkxwbibm4zEE
	Fec6ASlJpE0PTEayeqHXMX6tqrUTVdhiBMX0c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=nj0QlSOUe4TH6IeSsyAbz+VBRPcHEefTqqCTmJ5OsulR2A/l/Bd/rFohWL6gEX3Wty
	B0KwxsJAPMRJuSlkfzaV9PKIaF+Wf6jbqx+99WkoA8m2iPSwI+k7Xl9SfJrS0xBtw7UX
	e1ODZD0LyIsU2QlALFLFdOZ81o3lHAxJIsxyY=
Received: by 10.223.115.73 with SMTP id h9mr283272faq.46.1279185517145;
	Thu, 15 Jul 2010 02:18:37 -0700 (PDT)
Received: from s42.loc (85-127-92-50.dynamic.xdsl-line.inode.at [85.127.92.50])
	by mx.google.com with ESMTPS id a26sm240696fak.43.2010.07.15.02.18.36
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 15 Jul 2010 02:18:36 -0700 (PDT)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1OZKaP-0007tT-CU; Thu, 15 Jul 2010 11:18:33 +0200
Date: Thu, 15 Jul 2010 11:18:33 +0200
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100715091833.GB27956@mx.loc>
References: <1279178275.5049.28.camel@mattotaupa>
MIME-Version: 1.0
In-Reply-To: <1279178275.5049.28.camel@mattotaupa>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: uclibc: PREFERRED_UCLIBC_VERSION = "git" not respected
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
X-List-Received-Date: Thu, 15 Jul 2010 09:18:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 15, 2010 at 09:17:55AM +0200, Paul Menzel wrote:
>Dear OE folks,
>
>
>the commit message of 070e46f2932b254a617d7ce88af9b078c2a2849f [1] says
>
>        With this change, you can put PREFERRED_UCLIBC_VERSION="git"
>        into your conf/local.conf once or set
>        PREFERRED_VERSION_uclibc{*}="git" and need not adjust local.conf
>        if the git revision was changed.
>
>I have the following line in my `local.conf`.
>
>    PREFERRED_UCLIBC_VERSION               = "git"
>
>Doing `bitbake uclibc` with
>
>        DISTRO = "angstrom-2008.1"
>        
>        GLIBC_GENERATE_LOCALES = "en_US.UTF-8 en_GB.UTF-8 de_DE.UTF-8"
>        
>        MACHINE = "beagleboard"
>        BUILD_ARCH = "i686"
>        BUILD_OS = "linux"
>        ANGSTROMLIBC = "uclibc"
>
>chooses uclibc-0.9.30.2-r34.0 nevertheless.
>
>Doing `git grep "PREFERRED_UCLIBC"` does not list anything distribution
>specific as far as I can see.

conf/distro/angstrom-2008.1.conf:PREFERRED_VERSION_uclibc ?= "0.9.30.2"
conf/distro/angstrom-2008.1.conf:PREFERRED_VERSION_uclibc-initial ?= "0.9.30.2"
conf/distro/include/sane-toolchain-uclibc.inc:PREFERRED_VERSION_uclibc                    ?= "${PREFERRED_UCLIBC_VERSION}"
conf/distro/include/sane-toolchain-uclibc.inc:PREFERRED_VERSION_uclibc-initial            ?= "${PREFERRED_UCLIBC_VERSION}"
conf/distro/include/sane-toolchain-uclibc.inc:PREFERRED_VERSION_uclibc-cross              ?= "${PREFERRED_UCLIBC_VERSION}"
conf/distro/include/sane-toolchain-uclibc.inc:PREFERRED_VERSION_uclibc-cross-sdk          ?= "${PREFERRED_UCLIBC_VERSION}"
conf/distro/include/sane-toolchain-uclibc.inc:PREFERRED_VERSION_uclibc-cross-initial      ?= "${PREFERRED_UCLIBC_VERSION}"
conf/distro/include/sane-toolchain-uclibc.inc:PREFERRED_VERSION_uclibc-cross-intermediate ?= "${PREFERRED_UCLIBC_VERSION}"

so my guess is that you don't use sane-toolchain

HTH,


