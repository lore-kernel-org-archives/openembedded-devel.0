Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1Ran2h-00041h-0K
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Dec 2011 12:30:35 +0100
Received: by mail-ww0-f43.google.com with SMTP id ds11so1312253wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Dec 2011 03:23:40 -0800 (PST)
Received: by 10.227.208.129 with SMTP id gc1mr2110659wbb.4.1323861818728;
	Wed, 14 Dec 2011 03:23:38 -0800 (PST)
Received: from fensuse.internal.dresearch-fe.de
	(pd95cb174.dip0.t-ipconnect.de. [217.92.177.116])
	by mx.google.com with ESMTPS id o3sm2940884wiy.14.2011.12.14.03.23.37
	(version=SSLv3 cipher=OTHER); Wed, 14 Dec 2011 03:23:38 -0800 (PST)
Message-ID: <4EE88739.70608@dresearch-fe.de>
Date: Wed, 14 Dec 2011 12:23:37 +0100
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1323680281-3762-1-git-send-email-sledz@dresearch-fe.de>
In-Reply-To: <1323680281-3762-1-git-send-email-sledz@dresearch-fe.de>
X-Enigmail-Version: 1.3.4
Subject: Re: [PATCH] openjdk: fix problem on build hosts with linux kernel 3.x
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
X-List-Received-Date: Wed, 14 Dec 2011 11:30:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12.12.2011 09:58, Steffen Sledz wrote:
> see http://bugs.sun.com/bugdatabase/view_bug.do?bug_id=7072341
> 
> Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
> ---
>  recipes/openjdk/openjdk-6-common.inc |    9 ++++++++-
>  1 files changed, 8 insertions(+), 1 deletions(-)
> 
> diff --git a/recipes/openjdk/openjdk-6-common.inc b/recipes/openjdk/openjdk-6-common.inc
> index 54c45f8..59a7a56 100644
> --- a/recipes/openjdk/openjdk-6-common.inc
> +++ b/recipes/openjdk/openjdk-6-common.inc
> @@ -10,7 +10,7 @@ ICEDTEA = "NEEDS TO BE SET"
>  S = "${WORKDIR}/${ICEDTEA}"
>  B = "${S}/build"
>  
> -INC_PR = "r11"
> +INC_PR = "r12"
>  
>  SRC_URI = "\
>    ${ICEDTEA_URI} \
> @@ -208,6 +208,13 @@ do_configure_prepend() {
>  
>  do_configure_append() {
>  	oe_runmake patch-ecj
> +
> +	for F in ${WORKDIR}/openjdk-src-dir/hotspot/make/linux/Makefile ${WORKDIR}/icedtea6-1.8.5/build/openjdk-ecj/hotspot/make/linux/Makefile ${WORKDIR}/icedtea6-1.8.5/build/openjdk/hotspot/make/linux/Makefile ;
> +	do
> +		sed -i \
> +			-e"s|SUPPORTED_OS_VERSION = 2.4% 2.5% 2.6% 2.7%|SUPPORTED_OS_VERSION = 2.4% 2.5% 2.6% 3%|" \
> +			$F
> +	done
>  }
>  
>  # Work around broken variable quoting in oe-stable 2009 and provide the variable

pushed to oe-classic master

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


