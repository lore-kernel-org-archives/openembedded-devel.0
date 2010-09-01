Received: from static.26.116.47.78.clients.your-server.de ([78.47.116.26]
	helo=phalanx.drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1OqwJe-0003QX-CG
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Sep 2010 01:02:03 +0200
Received: from [192.168.1.2] (e180147196.adsl.alicedsl.de [85.180.147.196])
	by phalanx.drlauer-research.com (Postfix) with ESMTP id 365AB584122
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Sep 2010 01:06:18 +0200 (CEST)
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1283356972-28880-1-git-send-email-noor_ahsan@mentor.com>
References: <1283356972-28880-1-git-send-email-noor_ahsan@mentor.com>
Organization: Vanille-Media
Date: Thu, 02 Sep 2010 01:00:09 +0200
Message-ID: <1283382009.2012.15.camel@saphir>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-SA-Exim-Connect-IP: 78.47.116.26
X-SA-Exim-Mail-From: mickey@vanille-media.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] sip-native: Run oe-stylize script on the recipe and modify the recipe accordingly.
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
X-List-Received-Date: Wed, 01 Sep 2010 23:02:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Thanks for your patch, but here's what I don't like
(yes, probably oe-stylize is to blame, perhaps someone
could fix it there)

> -export BUILD_SYS
> -export HOST_SYS
> -export STAGING_LIBDIR
> -export STAGING_INCDIR
> -
>  EXTRA_QMAKEVARS_POST += "DESTDIR=${S} CONFIG=console"
>  
>  do_configure_prepend() {
> -	cat sipgen.sbf | sed s,target,TARGET, | sed s,sources,SOURCES, | sed s,headers,HEADERS, > sipgen.pro
> +        cat sipgen.sbf | sed s,target,TARGET, | sed s,sources,SOURCES, | sed s,headers,HEADERS, > sipgen.pro
>  }
> -
>  do_stage() {
> -	install -m 0755 sip ${STAGING_BINDIR_NATIVE}/sip
> -	cd ${WORKDIR}/sip-${PV} && python configure.py
> -	install -d ${STAGING_PYDIR}/site-packages
> -	install -m 0755 sip*.py ${STAGING_PYDIR}/site-packages
> +        install -m 0755 sip ${STAGING_BINDIR_NATIVE}/sip
> +        cd ${WORKDIR}/sip-${PV} && python configure.py
> +        install -d ${STAGING_PYDIR}/site-packages
> +        install -m 0755 sip*.py ${STAGING_PYDIR}/site-packages
>  }
>  
> -SRC_URI[md5sum] = "597d7ff7edb42a18421c806ffd18a136"
> -SRC_URI[sha256sum] = "7faaccb6f17296399051bd076a7f41e0f6d95a28eda3e30468f1bd7cf45898e1"
> +export BUILD_SYS
> +export HOST_SYS
> +export STAGING_LIBDIR
> +export STAGING_INCDIR
> +
> +DEFAULT_PREFERENCE = "-1"

I like to keep a mental model of recipes being somewhat executed in a
top-down manner; in the model, exported variable assignments do in fact
affect all of tasks, so I think they should be kept next to the
non-exported assignments.

-- 
:M:



