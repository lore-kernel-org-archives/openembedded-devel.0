Received: from mta8.brinkster.com ([65.182.109.77])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <John.Willis@Distant-earth.com>) id 1OKcjB-0005Wm-NG
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Jun 2010 21:38:53 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mta8.brinkster.com (Postfix) with ESMTP id 31A3C1F4B62
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Jun 2010 15:27:21 -0400 (EDT)
X-Virus-Scanned: amavisd-new at mta8.brinkster.com
Received: from mta8.brinkster.com ([127.0.0.1])
	by localhost (mta8.brinkster.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PKjYVGkhg8md
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Jun 2010 15:27:15 -0400 (EDT)
Received: from MareImbrium (cpc1-bath2-0-0-cust327.aztw.cable.virginmedia.com
	[82.46.19.72])
	by mta8.brinkster.com (Postfix) with ESMTPA id 148511F40F1
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Jun 2010 15:27:14 -0400 (EDT)
From: "John Willis" <John.Willis@Distant-earth.com>
To: <openembedded-devel@lists.openembedded.org>
References: <1275673345-16778-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
In-Reply-To: <1275673345-16778-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
Date: Fri, 4 Jun 2010 20:27:07 +0100
Message-ID: <202301cb041b$ec883a50$c598aef0$@Distant-earth.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AQIdvAT2B6BY0JOLnw+4+dWq4x42zJHMv6tg
X-SA-Exim-Connect-IP: 65.182.109.77
X-SA-Exim-Mail-From: John.Willis@Distant-earth.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] encodings/font-util: swapped inter-DEPENDS
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
X-List-Received-Date: Fri, 04 Jun 2010 19:38:53 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-us

> 'encodings' uses font-util's pkg-config file to determine location of the
X11
> font directory.  When 'font-util' is not staged yet (as it was the case),
it will
> use buildhost information which point to something like /usr/share/X11
> (which is outside of the staging dir) and which are not writable.
> 
> This results into an empty 'encodings' package on first bitbake run in a
> pristine tree; 'encodings' must be rebuilt so that it can use font-util
> information from previous runs.
> 
> As 'font-util' itself does not require 'encodings' during build-time,
there were
> swapped the DEPENDS.
> 
> Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
> Cc: David-John Willis <John.Willis@Distant-earth.com>
> Cc: Martin Jansa <Martin.Jansa@gmail.com>

Acked-by: David-John Willis <John.Willis@Distant-earth.com>

> ---
>  recipes/xorg-font/encodings_1.0.3.bb |    4 ++--
>  recipes/xorg-font/font-util_1.1.1.bb |    4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/recipes/xorg-font/encodings_1.0.3.bb b/recipes/xorg-
> font/encodings_1.0.3.bb
> index 168a67a..bc95836 100644
> --- a/recipes/xorg-font/encodings_1.0.3.bb
> +++ b/recipes/xorg-font/encodings_1.0.3.bb
> @@ -1,8 +1,8 @@
>  require xorg-font-common.inc
>  PE = "1"
> -PR = "${INC_PR}.0"
> +PR = "${INC_PR}.1"
> 
> -DEPENDS = "mkfontscale-native font-util-native"
> +DEPENDS = "mkfontscale-native font-util-native font-util"
> 
>  SRC_URI[archive.md5sum] = "29637480e7ce12546668631067c19ced"
>  SRC_URI[archive.sha256sum] =
> "07d9766d4aebe05ac572599f8f903a4fe06ab667a8182f2b6cc03e5fb3b80f53"
> diff --git a/recipes/xorg-font/font-util_1.1.1.bb
b/recipes/xorg-font/font-
> util_1.1.1.bb
> index f42b505..3f9b4c8 100644
> --- a/recipes/xorg-font/font-util_1.1.1.bb
> +++ b/recipes/xorg-font/font-util_1.1.1.bb
> @@ -4,11 +4,11 @@ PACKAGE_ARCH = "${BASE_PACKAGE_ARCH}"
> 
>  DESCRIPTION = "X font utils."
> 
> -DEPENDS = "encodings util-macros"
> +DEPENDS = "util-macros"
>  RDEPENDS_${PN} = "mkfontdir mkfontscale encodings"
> 
>  PE = "1"
> -PR = "${INC_PR}.1"
> +PR = "${INC_PR}.2"
> 
>  do_configure_prepend() {
>          sed -i "s#MAPFILES_PATH=\`pkg-
> config#MAPFILES_PATH=\`PKG_CONFIG_PATH=\"${STAGING_LIBDIR_NATI
> VE}/pkg-config\" pkg-config#g" fontutil.m4.in
> --
> 1.7.0.1





