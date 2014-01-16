Return-Path: <heinold@inf.fu-berlin.de>
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de
	[130.133.4.66])
	by mail.openembedded.org (Postfix) with ESMTP id 652B26E758
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jan 2014 16:42:44 +0000 (UTC)
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
	by outpost.zedat.fu-berlin.de (Exim 4.82)
	for openembedded-devel@lists.openembedded.org with esmtp
	(envelope-from <heinold@inf.fu-berlin.de>)
	id <1W3q1h-003xbM-O7>; Thu, 16 Jan 2014 17:42:41 +0100
Received: from fb-n15-11.unbelievable-machine.net ([94.198.62.204]
	helo=mail.zedat.fu-berlin.de)
	by inpost2.zedat.fu-berlin.de (Exim 4.82)
	for openembedded-devel@lists.openembedded.org with esmtpsa
	(envelope-from <heinold@inf.fu-berlin.de>)
	id <1W3q1h-0031TV-MA>; Thu, 16 Jan 2014 17:42:41 +0100
Date: Thu, 16 Jan 2014 17:42:37 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140116164237.GA25410@mail.zedat.fu-berlin.de>
References: <1389889389-6514-1-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <1389889389-6514-1-git-send-email-koen@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Originating-IP: 94.198.62.204
Subject: Re: [meta-java][PATCH] openjdk-7: use icetea6-native
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Jan 2014 16:42:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 16, 2014 at 05:23:09PM +0100, Koen Kooi wrote:
> Since icetea6-native fails to build on all my machines and icedtea7-native works, switch to that.
> 
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  recipes-core/openjdk/openjdk-7-common.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-core/openjdk/openjdk-7-common.inc b/recipes-core/openjdk/openjdk-7-common.inc
> index 9ecc990..206bf12 100644
> --- a/recipes-core/openjdk/openjdk-7-common.inc
> +++ b/recipes-core/openjdk/openjdk-7-common.inc
> @@ -26,7 +26,7 @@ PN = "${JDKPN}-jre"
>  PROVIDES += "${JDKPN}"
>  
>  DEPENDS = " \
> -           icedtea6-native zip-native ant-native \
> +           icedtea7-native zip-native ant-native \
>             zlib \
>  	   jpeg libpng giflib \
>             gtk+ glib-2.0 \
> @@ -101,7 +101,7 @@ EXTRA_OECONF = " \
>  	\
>          --enable-zero \
>  	\
> -	--with-jdk-home=${STAGING_LIBDIR_JVM_NATIVE}/icedtea6-native \
> +	--with-jdk-home=${STAGING_LIBDIR_JVM_NATIVE}/icedtea7-native \
>  	--with-rhino=${STAGING_DATADIR_JAVA}/rhino.jar \
>  	\
>          --with-openjdk-src-zip=${WORKDIR}/${OPENJDK_FILE} \
> -- 
> 1.8.4.2
> 

Hi Koen,

others report that icedtea7-native does not compile for them. So I need to find another solution. In long term icedtea-native and openjdk
recipes will be merged, but I have enough work for 3 lives.

Bye Henning

