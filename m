Received: from mail.reciva.com ([109.169.29.93] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1OtdPd-0005HA-3l
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Sep 2010 11:27:22 +0200
Received: from [62.7.80.98] (helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1OtdOx-0006n0-Tk
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Sep 2010 10:26:39 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1OtdOx-0005rf-KQ
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Sep 2010 10:26:39 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1283570085-11968-1-git-send-email-plagnioj@jcrosoft.com>
References: <20100903111210.GA17702@game.jcrosoft.org>
	<1283570085-11968-1-git-send-email-plagnioj@jcrosoft.com>
Date: Thu, 09 Sep 2010 10:26:39 +0100
Message-ID: <1284024399.28520.1444.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.1.2 
X-Broken-Reverse-DNS: no host name found for IP address 62.7.80.98
X-SA-Exim-Connect-IP: 109.169.29.93
X-SA-Exim-Mail-From: philb@gnu.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] rename SOC_FAMILY to TARGET_SOC_FAMILY and make it global
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
X-List-Received-Date: Thu, 09 Sep 2010 09:27:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2010-09-04 at 05:14 +0200, Jean-Christophe PLAGNIOL-VILLARD
wrote:
> diff --git a/conf/bitbake.conf b/conf/bitbake.conf
> index 677c76a..672d8df 100644
> --- a/conf/bitbake.conf
> +++ b/conf/bitbake.conf
> @@ -113,6 +113,8 @@ TARGET_SYS = "${TARGET_ARCH}${TARGET_VENDOR}${@['-' + bb.data.getVar('TARGET_OS'
>  TARGET_PREFIX = "${TARGET_SYS}-"
>  TARGET_CC_ARCH = ""
>  TARGET_EXEEXT = ""
> +TARGET_SOC_FAMILY ?= "Unknown"
> +
>  
>  SDK_ARCH ?= "${BUILD_ARCH}"
>  SDK_OS ?= "${BUILD_OS}"
> @@ -677,9 +679,9 @@ BUILDCFG_NEEDEDVARS ?= "TARGET_ARCH TARGET_OS"
>  #
>  # This works for  functions as well, they are really just environment variables.
>  # Default OVERRIDES to make compilation fail fast in case of build system misconfiguration.
> -OVERRIDES = "local:${MACHINE}:${DISTRO}:${TARGET_OS}:${TARGET_ARCH}:build-${BUILD_OS}:fail-fast:pn-${PN}"
> +OVERRIDES = "local:${MACHINE}:${DISTRO}:${TARGET_OS}:${TARGET_ARCH}:${TARGET_SOC_FAMILY}:${TARGET_ARCH}_${TARGET_SOC_FAMILY}:build-${BUILD_OS}:fail-fast:pn-${PN}"

I don't have much of an opinion on the renaming, but the overrides part
will cause an unacceptable level of namespace pollution.  As it stands,
everybody will suddenly get "Unknown" in their OVERRIDES and this is not
at all desirable.

If you must add these kinds of things to the default OVERRIDES then they
need a suitable namespace prefix, for example something like
soc-family-${SOC_FAMILY}.  (Alternatively, put it in your own DISTRO
configuration where you can do whatever you like.)

p. 



