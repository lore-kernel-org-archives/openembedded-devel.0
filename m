Return-Path: <mac@mcrowe.com>
X-Greylist: delayed 457 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 22 Sep 2017 11:41:53 UTC
Received: from avasout05.plus.net (avasout05.plus.net [84.93.230.250])
	by mail.openembedded.org (Postfix) with ESMTP id 116E27825A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Sep 2017 11:41:53 +0000 (UTC)
Received: from deneb ([80.229.24.9]) by avasout05 with smtp
	id CbaG1w0080BmcFC01baHtz; Fri, 22 Sep 2017 12:34:17 +0100
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.2 cv=Iav3YSia c=1 sm=1 tr=0
	a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
	a=kj9zAlcOel0A:10 a=2JCJgTwv5E4A:10 a=-An2I_7KAAAA:8
	a=aK6yhzPy7F0GJM5Tdf4A:9
	a=CjuIK1q_8ugA:10 a=Sq34B_EcNBM9_nrAYB9S:22
Received: from mac by deneb with local (Exim 4.89)
	(envelope-from <mac@mcrowe.com>) id 1dvMDn-0003RP-IB
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Sep 2017 12:34:15 +0100
Date: Fri, 22 Sep 2017 12:34:15 +0100
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20170922113415.5zum55yffbyzci7d@mcrowe.com>
References: <20170908134802.13519-1-mac@mcrowe.com>
MIME-Version: 1.0
In-Reply-To: <20170908134802.13519-1-mac@mcrowe.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Subject: Re: [meta-qt5][PATCH] qtbase-native: Force use of built-in pcre
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 22 Sep 2017 11:41:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Friday 08 September 2017 at 14:48:02 +0100, Mike Crowe wrote:
> If we specify neither -system-pcre nor -qt-pcre then qtbase will first see
> if it can find the pcre library in the system and fall back to compiling
> its own if that's not possible.
> 
> Unfortunately, this means that if qtbase-native happens to be built on a
> machine with system pcre available then the resulting binaries such as
> bin/qt5/uic in sstate files won't work correctly on machines that don't
> have pcre available. Even ignoring that, it doesn't help for packages to
> build differently depending on how the build system is configured.
> 
> We could depend on pcre-native and pass -system-pcre, but this doesn't work
> by default because qtbase actually requires pcre16 which is an optional
> (via PACKAGECONFIG) feature of pcre so the default there would need to be
> changed too.
> 
> So, let's make qtbase-native match the default of qtbase by passing
> -qt-pcre in order to ensure that qtbase-native is always built with its
> own pcre implementation.
> 
> Signed-off-by: Mike Crowe <mac@mcrowe.com>
> ---
>  recipes-qt/qt5/qtbase-native_git.bb | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase-native_git.bb
> index 54a0b78..0951ede 100644
> --- a/recipes-qt/qt5/qtbase-native_git.bb
> +++ b/recipes-qt/qt5/qtbase-native_git.bb
> @@ -46,6 +46,7 @@ PACKAGECONFIG_CONFARGS = " \
>      -sysroot ${STAGING_DIR_NATIVE} \
>      -no-gcc-sysroot \
>      -system-zlib \
> +    -qt-pcre \
>      -no-libjpeg \
>      -no-libpng \
>      -no-gif \

Does anyone have any objections to this?

We've been using it for several weeks now and it's not caused any observed
problems.

Thanks.

Mike.

